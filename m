Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2A6172702
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 19:23:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72CC56E8E0;
	Thu, 27 Feb 2020 18:23:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C97706E8E0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 18:23:47 +0000 (UTC)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1j7Np3-0001UE-8B; Thu, 27 Feb 2020 19:23:45 +0100
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <mfe@pengutronix.de>)
 id 1j7Np1-00012X-Si; Thu, 27 Feb 2020 19:23:43 +0100
Date: Thu, 27 Feb 2020 19:23:43 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 17/17] drm/imx: fix drm_mode_config_cleanup race condition
Message-ID: <20200227182343.4rfyz4wdf7e3q6x2@pengutronix.de>
References: <20200227162125.10450-1-m.felsch@pengutronix.de>
 <20200227162125.10450-18-m.felsch@pengutronix.de>
 <20200227172923.GY2363188@phenom.ffwll.local>
 <c620634bf4faf57230810a16cb1f5a81f2d23945.camel@pengutronix.de>
 <CAKMK7uG5e90dEiXYXN9xo+iFY7_9BW6Pp=1CifSQ6c3eWyP=9w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uG5e90dEiXYXN9xo+iFY7_9BW6Pp=1CifSQ6c3eWyP=9w@mail.gmail.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 19:19:33 up 104 days,  9:38, 120 users,  load average: 0.25, 0.12,
 0.10
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Sascha Hauer <kernel@pengutronix.de>, Dave Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Russell King <rmk+kernel@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

On 20-02-27 19:14, Daniel Vetter wrote:
> On Thu, Feb 27, 2020 at 6:44 PM Lucas Stach <l.stach@pengutronix.de> wrote:
> >
> > Hi Daniel,
> >
> > On Do, 2020-02-27 at 18:29 +0100, Daniel Vetter wrote:
> > > On Thu, Feb 27, 2020 at 05:21:25PM +0100, Marco Felsch wrote:
> > > > Currently there is a race conditions if the panel can't be probed e.g.
> > > > it is not connected [1]. There where several attempts to fix this [2,3]
> > > > but non of them made it into mainline.
> > > >
> > > > The problem is the combination of the component framework and the drm
> > > > framework, as Philipp already explained [1]. To fix this we need to
> > > > drop the devres-kmalloc and move the plain kmalloc to let the drm
> > > > framework free the resources upon a drm_mode_config_cleanup(). So we need
> > > > to implement a .destroy() callback for each component. We also need to
> > > > reorder the master.unbind() callback to ensure that the driver states
> > > > are accessible during a component.unbind() call. This reordering also
> > > > aligns the master.unbind() with the error-cleanup path during
> > > > master.bind().
> > > >
> > > > [1] https://www.spinics.net/lists/dri-devel/msg189388.html
> > > > [2] https://lkml.org/lkml/2018/10/16/1148
> > > > [3] https://lkml.org/lkml/2019/4/2/612
> > > >
> > > > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > >
> > > I think this collides quite badly with my managed drm device resources
> > > patch series I'm working on. Plus once we have that, you could use
> > > drmm_kzalloc and wouldn't need to sprinkle kfree() over everything.
> > >
> > > I think at least, I haven't rolled much further than just getting the
> > > baseline stuff figured out. So if it's not super-pressing to get this
> > > patch here landed I think it'd be better to base this on top of the drmm
> > > series. I'm working on sending out v3, I'll cc you on the imx parts so
> > > you'll get pinged.
> >
> > IMO this part of imx-drm has been broken for far too long already, so
> > we shouldn't delay this fixes series on a complete resource management
> > rework.
> 
> Given it's patch 17/17 in a spring cleanup, and not patch 1/17 I'm not
> entirely sure it's really that high priority.

Sorry for the description but the alloc fixes are important. I'm with
Lucas, we should fix this now. I called it "spring cleanup" because it
moves a lot of code from a to b.

Regards,
  Marco

> Anyway would be great if
> you at least check out what the new drm managed resource stuff would
> mean for imx here, since you're blowing on devm_kzalloc exactly in the
> way that I'm trying to get sorted now (without tons of explicit
> kfree() everywhere).
> -Daniel
> 
> >
> > Regards,
> > Lucas
> >
> > > Cheers, Daniel
> > >
> > > > ---
> > > >  drivers/gpu/drm/imx/dw_hdmi-imx.c      | 28 ++++++++++++---------
> > > >  drivers/gpu/drm/imx/imx-drm-core.c     |  3 ++-
> > > >  drivers/gpu/drm/imx/imx-ldb.c          | 34 +++++++++++++++++---------
> > > >  drivers/gpu/drm/imx/imx-tve.c          | 15 +++++++++---
> > > >  drivers/gpu/drm/imx/ipuv3-crtc.c       | 28 ++++++++++++++++++---
> > > >  drivers/gpu/drm/imx/parallel-display.c | 30 ++++++++++++++++-------
> > > >  6 files changed, 96 insertions(+), 42 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/imx/dw_hdmi-imx.c b/drivers/gpu/drm/imx/dw_hdmi-imx.c
> > > > index f22cfbf9353e..86a62796c151 100644
> > > > --- a/drivers/gpu/drm/imx/dw_hdmi-imx.c
> > > > +++ b/drivers/gpu/drm/imx/dw_hdmi-imx.c
> > > > @@ -137,6 +137,12 @@ static int dw_hdmi_imx_atomic_check(struct drm_encoder *encoder,
> > > >     return 0;
> > > >  }
> > > >
> > > > +static void dw_hdmi_imx_encoder_destroy(struct drm_encoder *encoder)
> > > > +{
> > > > +   drm_encoder_cleanup(encoder);
> > > > +   kfree(enc_to_imx_hdmi(encoder));
> > > > +}
> > > > +
> > > >  static const struct drm_encoder_helper_funcs dw_hdmi_imx_encoder_helper_funcs = {
> > > >     .enable     = dw_hdmi_imx_encoder_enable,
> > > >     .disable    = dw_hdmi_imx_encoder_disable,
> > > > @@ -144,7 +150,7 @@ static const struct drm_encoder_helper_funcs dw_hdmi_imx_encoder_helper_funcs =
> > > >  };
> > > >
> > > >  static const struct drm_encoder_funcs dw_hdmi_imx_encoder_funcs = {
> > > > -   .destroy = drm_encoder_cleanup,
> > > > +   .destroy = dw_hdmi_imx_encoder_destroy,
> > > >  };
> > > >
> > > >  static enum drm_mode_status
> > > > @@ -212,7 +218,7 @@ static int dw_hdmi_imx_bind(struct device *dev, struct device *master,
> > > >     if (!pdev->dev.of_node)
> > > >             return -ENODEV;
> > > >
> > > > -   hdmi = devm_kzalloc(&pdev->dev, sizeof(*hdmi), GFP_KERNEL);
> > > > +   hdmi = kzalloc(sizeof(*hdmi), GFP_KERNEL);
> > > >     if (!hdmi)
> > > >             return -ENOMEM;
> > > >
> > > > @@ -228,12 +234,16 @@ static int dw_hdmi_imx_bind(struct device *dev, struct device *master,
> > > >      * not been registered yet.  Defer probing, and hope that
> > > >      * the required CRTC is added later.
> > > >      */
> > > > -   if (encoder->possible_crtcs == 0)
> > > > +   if (encoder->possible_crtcs == 0) {
> > > > +           kfree(hdmi);
> > > >             return -EPROBE_DEFER;
> > > > +   }
> > > >
> > > >     ret = dw_hdmi_imx_parse_dt(hdmi);
> > > > -   if (ret < 0)
> > > > +   if (ret < 0) {
> > > > +           kfree(hdmi);
> > > >             return ret;
> > > > +   }
> > > >
> > > >     drm_encoder_helper_add(encoder, &dw_hdmi_imx_encoder_helper_funcs);
> > > >     drm_encoder_init(drm, encoder, &dw_hdmi_imx_encoder_funcs,
> > > > @@ -242,15 +252,9 @@ static int dw_hdmi_imx_bind(struct device *dev, struct device *master,
> > > >     platform_set_drvdata(pdev, hdmi);
> > > >
> > > >     hdmi->hdmi = dw_hdmi_bind(pdev, encoder, plat_data);
> > > > -
> > > > -   /*
> > > > -    * If dw_hdmi_bind() fails we'll never call dw_hdmi_unbind(),
> > > > -    * which would have called the encoder cleanup.  Do it manually.
> > > > -    */
> > > > -   if (IS_ERR(hdmi->hdmi)) {
> > > > +   /* Don't call kfree() here, this is done by the .destroy() handler. */
> > > > +   if (IS_ERR(hdmi->hdmi))
> > > >             ret = PTR_ERR(hdmi->hdmi);
> > > > -           drm_encoder_cleanup(encoder);
> > > > -   }
> > > >
> > > >     return ret;
> > > >  }
> > > > diff --git a/drivers/gpu/drm/imx/imx-drm-core.c b/drivers/gpu/drm/imx/imx-drm-core.c
> > > > index 9979547ca883..feab6eb9e7e5 100644
> > > > --- a/drivers/gpu/drm/imx/imx-drm-core.c
> > > > +++ b/drivers/gpu/drm/imx/imx-drm-core.c
> > > > @@ -275,9 +275,10 @@ static void imx_drm_unbind(struct device *dev)
> > > >
> > > >     drm_kms_helper_poll_fini(drm);
> > > >
> > > > +   component_unbind_all(drm->dev, drm);
> > > > +
> > > >     drm_mode_config_cleanup(drm);
> > > >
> > > > -   component_unbind_all(drm->dev, drm);
> > > >     dev_set_drvdata(dev, NULL);
> > > >
> > > >     drm_dev_put(drm);
> > > > diff --git a/drivers/gpu/drm/imx/imx-ldb.c b/drivers/gpu/drm/imx/imx-ldb.c
> > > > index 5e6c1b09dbfa..4a5d31da592a 100644
> > > > --- a/drivers/gpu/drm/imx/imx-ldb.c
> > > > +++ b/drivers/gpu/drm/imx/imx-ldb.c
> > > > @@ -140,6 +140,8 @@ static void imx_ldb_connector_destroy(struct drm_connector *connector)
> > > >     i2c_put_adapter(imx_ldb_con->ddc);
> > > >     /* avoid dangling pointers */
> > > >     imx_ldb_con->ldb_channel = NULL;
> > > > +   kfree(imx_ldb_con->edid);
> > > > +   kfree(imx_ldb_con);
> > > >  }
> > > >
> > > >  static int imx_ldb_connector_get_modes(struct drm_connector *connector)
> > > > @@ -184,6 +186,7 @@ static void imx_ldb_encoder_destroy(struct drm_encoder *encoder)
> > > >     drm_encoder_cleanup(encoder);
> > > >     /* avoid dangling pointers */
> > > >     channel->ldb = NULL;
> > > > +   kfree(channel);
> > > >  }
> > > >
> > > >  static void imx_ldb_set_clock(struct imx_ldb *ldb, int mux, int chno,
> > > > @@ -502,9 +505,8 @@ static int imx_ldb_panel_ddc(struct device *dev,
> > > >             edidp = of_get_property(child, "edid",
> > > >                                     &connector->edid_len);
> > > >             if (edidp) {
> > > > -                   connector->edid = devm_kmemdup(dev, edidp,
> > > > -                                                  connector->edid_len,
> > > > -                                                  GFP_KERNEL);
> > > > +                   connector->edid = kmemdup(edidp, connector->edid_len,
> > > > +                                             GFP_KERNEL);
> > > >             } else if (!channel->panel) {
> > > >                     /* fallback to display-timings node */
> > > >                     ret = of_get_drm_display_mode(child,
> > > > @@ -525,7 +527,7 @@ static int imx_ldb_setup_channel(struct device *dev,
> > > >                              int channel_number)
> > > >  {
> > > >     struct imx_ldb_channel *channel;
> > > > -   struct imx_ldb_connector *imx_ldb_con;
> > > > +   struct imx_ldb_connector *imx_ldb_con = NULL;
> > > >     struct drm_encoder *encoder;
> > > >     struct drm_connector *connector = NULL;
> > > >     int bus_format;
> > > > @@ -537,7 +539,7 @@ static int imx_ldb_setup_channel(struct device *dev,
> > > >      * 3) Register it with the DRM framework
> > > >      * 4) Attach bridge or connector to encoder
> > > >      */
> > > > -   channel = devm_kzalloc(dev, sizeof(*channel), GFP_KERNEL);
> > > > +   channel = kzalloc(sizeof(*channel), GFP_KERNEL);
> > > >     if (!channel)
> > > >             return -ENOMEM;
> > > >
> > > > @@ -554,17 +556,19 @@ static int imx_ldb_setup_channel(struct device *dev,
> > > >                                       ldb->lvds_mux ? 4 : 2, 0,
> > > >                                       &channel->panel, &channel->bridge);
> > > >     if (ret && ret != -ENODEV)
> > > > -           return ret;
> > > > +           goto err_free;
> > > >
> > > >     /* panel ddc only if there is no bridge */
> > > >     if (!channel->bridge) {
> > > > -           imx_ldb_con = devm_kzalloc(dev, sizeof(*connector), GFP_KERNEL);
> > > > -           if (!imx_ldb_con)
> > > > -                   return -ENOMEM;
> > > > +           imx_ldb_con = kzalloc(sizeof(*connector), GFP_KERNEL);
> > > > +           if (!imx_ldb_con) {
> > > > +                   ret = -ENOMEM;
> > > > +                   goto err_free;
> > > > +           }
> > > >
> > > >             ret = imx_ldb_panel_ddc(dev, channel, imx_ldb_con, child);
> > > >             if (ret)
> > > > -                   return ret;
> > > > +                   goto err_free;
> > > >
> > > >             imx_ldb_con->ldb_channel = channel;
> > > >             connector = &imx_ldb_con->connector;
> > > > @@ -628,7 +632,7 @@ static int imx_ldb_setup_channel(struct device *dev,
> > > >             ret = drm_bridge_attach(encoder, channel->bridge, NULL);
> > > >             if (ret) {
> > > >                     DRM_ERROR("Failed to initialize bridge with drm\n");
> > > > -                   goto err_put_ddc;
> > > > +                   goto err_out;
> > > >             }
> > > >     } else {
> > > >             drm_connector_attach_encoder(connector, encoder);
> > > > @@ -637,7 +641,7 @@ static int imx_ldb_setup_channel(struct device *dev,
> > > >     if (channel->panel) {
> > > >             ret = drm_panel_attach(channel->panel, connector);
> > > >             if (ret)
> > > > -                   goto err_put_ddc;
> > > > +                   goto err_out;
> > > >     }
> > > >
> > > >     return 0;
> > > > @@ -645,6 +649,12 @@ static int imx_ldb_setup_channel(struct device *dev,
> > > >  err_put_ddc:
> > > >     if (imx_ldb_con)
> > > >             i2c_put_adapter(imx_ldb_con->ddc);
> > > > +err_free:
> > > > +   if (imx_ldb_con)
> > > > +           kfree(imx_ldb_con->edid);
> > > > +   kfree(imx_ldb_con);
> > > > +   kfree(channel);
> > > > +err_out:
> > > >     return ret;
> > > >  }
> > > >
> > > > diff --git a/drivers/gpu/drm/imx/imx-tve.c b/drivers/gpu/drm/imx/imx-tve.c
> > > > index a7a05c47f68b..15ff5f35ff0e 100644
> > > > --- a/drivers/gpu/drm/imx/imx-tve.c
> > > > +++ b/drivers/gpu/drm/imx/imx-tve.c
> > > > @@ -241,6 +241,7 @@ static void imx_tve_connector_destroy(struct drm_connector *connector)
> > > >     i2c_put_adapter(tvec->ddc);
> > > >     /* avoid dangling pointers */
> > > >     tvec->tve = NULL;
> > > > +   kfree(tvec);
> > > >  }
> > > >
> > > >  static int imx_tve_connector_get_modes(struct drm_connector *connector)
> > > > @@ -292,6 +293,7 @@ static void imx_tve_encoder_destroy(struct drm_encoder *encoder)
> > > >     drm_encoder_cleanup(encoder);
> > > >     /* avoid dangling pointers */
> > > >     tvee->tve = NULL;
> > > > +   kfree(tvee);
> > > >  }
> > > >
> > > >  static void imx_tve_encoder_mode_set(struct drm_encoder *encoder,
> > > > @@ -577,13 +579,15 @@ static int imx_tve_bind(struct device *dev, struct device *master, void *data)
> > > >     struct imx_tve_connector *tvec;
> > > >     int ret;
> > > >
> > > > -   tvee = devm_kzalloc(dev, sizeof(*tvee), GFP_KERNEL);
> > > > +   tvee = kzalloc(sizeof(*tvee), GFP_KERNEL);
> > > >     if (!tvee)
> > > >             return -ENOMEM;
> > > >
> > > > -   tvec = devm_kzalloc(dev, sizeof(*tvec), GFP_KERNEL);
> > > > -   if (!tvec)
> > > > -           return -ENOMEM;
> > > > +   tvec = kzalloc(sizeof(*tvec), GFP_KERNEL);
> > > > +   if (!tvec) {
> > > > +           ret = -ENOMEM;
> > > > +           goto err_free;
> > > > +   }
> > > >
> > > >     tvee->tve = imx_tve;
> > > >     tvec->tve = imx_tve;
> > > > @@ -602,6 +606,9 @@ static int imx_tve_bind(struct device *dev, struct device *master, void *data)
> > > >
> > > >  err_put_ddc:
> > > >     i2c_put_adapter(tvec->ddc);
> > > > +err_free:
> > > > +   kfree(tvec);
> > > > +   kfree(tvee);
> > > >     return ret;
> > > >  }
> > > >
> > > > diff --git a/drivers/gpu/drm/imx/ipuv3-crtc.c b/drivers/gpu/drm/imx/ipuv3-crtc.c
> > > > index 63c0284f8b3c..2d24677f7fef 100644
> > > > --- a/drivers/gpu/drm/imx/ipuv3-crtc.c
> > > > +++ b/drivers/gpu/drm/imx/ipuv3-crtc.c
> > > > @@ -105,6 +105,12 @@ static void ipu_crtc_atomic_disable(struct drm_crtc *crtc,
> > > >     spin_unlock_irq(&crtc->dev->event_lock);
> > > >  }
> > > >
> > > > +static void imx_drm_crtc_destroy(struct drm_crtc *crtc)
> > > > +{
> > > > +   drm_crtc_cleanup(crtc);
> > > > +   kfree(to_ipu_crtc(crtc));
> > > > +}
> > > > +
> > > >  static void imx_drm_crtc_reset(struct drm_crtc *crtc)
> > > >  {
> > > >     struct imx_crtc_state *state;
> > > > @@ -166,7 +172,7 @@ static void ipu_disable_vblank(struct drm_crtc *crtc)
> > > >
> > > >  static const struct drm_crtc_funcs ipu_crtc_funcs = {
> > > >     .set_config = drm_atomic_helper_set_config,
> > > > -   .destroy = drm_crtc_cleanup,
> > > > +   .destroy = imx_drm_crtc_destroy,
> > > >     .page_flip = drm_atomic_helper_page_flip,
> > > >     .reset = imx_drm_crtc_reset,
> > > >     .atomic_duplicate_state = imx_drm_crtc_duplicate_state,
> > > > @@ -357,7 +363,8 @@ static int ipu_get_resources(struct ipu_crtc *ipu_crtc,
> > > >  }
> > > >
> > > >  static int ipu_crtc_init(struct ipu_crtc *ipu_crtc,
> > > > -   struct ipu_client_platformdata *pdata, struct drm_device *drm)
> > > > +                    struct ipu_client_platformdata *pdata,
> > > > +                    struct drm_device *drm)
> > > >  {
> > > >     struct ipu_soc *ipu = dev_get_drvdata(ipu_crtc->dev->parent);
> > > >     struct drm_crtc *crtc = &ipu_crtc->base;
> > > > @@ -437,10 +444,11 @@ static int ipu_drm_bind(struct device *dev, struct device *master, void *data)
> > > >  {
> > > >     struct ipu_client_platformdata *pdata = dev->platform_data;
> > > >     struct drm_device *drm = data;
> > > > +   struct drm_crtc *registered_crtc = NULL;
> > > >     struct ipu_crtc *ipu_crtc;
> > > >     int ret;
> > > >
> > > > -   ipu_crtc = devm_kzalloc(dev, sizeof(*ipu_crtc), GFP_KERNEL);
> > > > +   ipu_crtc = kzalloc(sizeof(*ipu_crtc), GFP_KERNEL);
> > > >     if (!ipu_crtc)
> > > >             return -ENOMEM;
> > > >
> > > > @@ -448,11 +456,23 @@ static int ipu_drm_bind(struct device *dev, struct device *master, void *data)
> > > >
> > > >     ret = ipu_crtc_init(ipu_crtc, pdata, drm);
> > > >     if (ret)
> > > > -           return ret;
> > > > +           goto err;
> > > >
> > > >     dev_set_drvdata(dev, ipu_crtc);
> > > >
> > > >     return 0;
> > > > +
> > > > +err:
> > > > +   drm_for_each_crtc(registered_crtc, drm) {
> > > > +           /*
> > > > +            * The crtc was registered with the drm core framework if we
> > > > +            * enter here. So let the core .destroy() helper cleanup the
> > > > +            * code.
> > > > +            */
> > > > +           return ret;
> > > > +   }
> > > > +   kfree(ipu_crtc);
> > > > +   return ret;
> > > >  }
> > > >
> > > >  static void ipu_drm_unbind(struct device *dev, struct device *master,
> > > > diff --git a/drivers/gpu/drm/imx/parallel-display.c b/drivers/gpu/drm/imx/parallel-display.c
> > > > index 78703b15c7cf..3e247383a498 100644
> > > > --- a/drivers/gpu/drm/imx/parallel-display.c
> > > > +++ b/drivers/gpu/drm/imx/parallel-display.c
> > > > @@ -55,6 +55,8 @@ static void imx_pd_connector_destroy(struct drm_connector *connector)
> > > >     imx_drm_connector_destroy(connector);
> > > >     /* avoid dangling pointer */
> > > >     imxpc->imxpd = NULL;
> > > > +   kfree(imxpc->edid);
> > > > +   kfree(imxpc);
> > > >  }
> > > >
> > > >  static int imx_pd_connector_get_modes(struct drm_connector *connector)
> > > > @@ -102,6 +104,7 @@ static void imx_pd_encoder_destroy(struct drm_encoder *encoder)
> > > >     if (imxpd->panel)
> > > >             drm_panel_detach(imxpd->panel);
> > > >     drm_encoder_cleanup(encoder);
> > > > +   kfree(imxpd);
> > > >  }
> > > >
> > > >  static void imx_pd_encoder_enable(struct drm_encoder *encoder)
> > > > @@ -225,31 +228,32 @@ static int imx_pd_bind(struct device *dev, struct device *master, void *data)
> > > >     struct device_node *np = dev->of_node;
> > > >     const u8 *edidp;
> > > >     struct imx_parallel_display *imxpd;
> > > > -   struct imx_parallel_connector *imxpc;
> > > > +   struct imx_parallel_connector *imxpc = NULL;
> > > >     int ret;
> > > >     u32 bus_format = 0;
> > > >     const char *fmt;
> > > >
> > > > -   imxpd = devm_kzalloc(dev, sizeof(*imxpd), GFP_KERNEL);
> > > > +   imxpd = kzalloc(sizeof(*imxpd), GFP_KERNEL);
> > > >     if (!imxpd)
> > > >             return -ENOMEM;
> > > >
> > > >     /* port@1 is the output port */
> > > >     ret = drm_of_find_panel_or_bridge(np, 1, 0, &imxpd->panel, &imxpd->bridge);
> > > >     if (ret && ret != -ENODEV)
> > > > -           return ret;
> > > > +           goto err_free;
> > > >
> > > >     if (!imxpd->bridge) {
> > > > -           imxpc = devm_kzalloc(dev, sizeof(*imxpc), GFP_KERNEL);
> > > > -           if (!imxpc)
> > > > -                   return -ENOMEM;
> > > > +           imxpc = kzalloc(sizeof(*imxpc), GFP_KERNEL);
> > > > +           if (!imxpc) {
> > > > +                   ret = -ENOMEM;
> > > > +                   goto err_free;
> > > > +           }
> > > >
> > > >             imxpc->imxpd = imxpd;
> > > >
> > > >             edidp = of_get_property(np, "edid", &imxpc->edid_len);
> > > >             if (edidp)
> > > > -                   imxpc->edid = devm_kmemdup(dev, edidp, imxpc->edid_len,
> > > > -                                              GFP_KERNEL);
> > > > +                   imxpc->edid = kmemdup(edidp, imxpc->edid_len, GFP_KERNEL);
> > > >     }
> > > >
> > > >     ret = of_property_read_string(np, "interface-pix-fmt", &fmt);
> > > > @@ -269,9 +273,17 @@ static int imx_pd_bind(struct device *dev, struct device *master, void *data)
> > > >
> > > >     ret = imx_pd_register(drm, imxpd, imxpc);
> > > >     if (ret)
> > > > -           return ret;
> > > > +           goto err_free;
> > > >
> > > >     return imx_pd_attach(drm, imxpd, imxpc);
> > > > +
> > > > +err_free:
> > > > +   if (imxpc)
> > > > +           kfree(imxpc->edid);
> > > > +   kfree(imxpc);
> > > > +   kfree(imxpd);
> > > > +
> > > > +   return ret;
> > > >  }
> > > >
> > > >  static const struct component_ops imx_pd_ops = {
> > > > --
> > > > 2.20.1
> > > >
> >
> 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> +41 (0) 79 365 57 48 - http://blog.ffwll.ch
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
