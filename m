Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD851761E2
	for <lists+dri-devel@lfdr.de>; Mon,  2 Mar 2020 19:07:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0119D6E5D2;
	Mon,  2 Mar 2020 18:07:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5909D6E5D2
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2020 18:07:39 +0000 (UTC)
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1j8pTZ-0004o9-KY; Mon, 02 Mar 2020 19:07:33 +0100
Received: from pza by lupine with local (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1j8pTX-0007Wa-Bi; Mon, 02 Mar 2020 19:07:31 +0100
Message-ID: <0806d9bbe4f8a30275cb251f5074e6a49380a92e.camel@pengutronix.de>
Subject: Re: [PATCH 17/17] drm/imx: fix drm_mode_config_cleanup race condition
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Daniel Vetter <daniel@ffwll.ch>, Lucas Stach <l.stach@pengutronix.de>
Date: Mon, 02 Mar 2020 19:07:31 +0100
In-Reply-To: <CAKMK7uG5e90dEiXYXN9xo+iFY7_9BW6Pp=1CifSQ6c3eWyP=9w@mail.gmail.com>
References: <20200227162125.10450-1-m.felsch@pengutronix.de>
 <20200227162125.10450-18-m.felsch@pengutronix.de>
 <20200227172923.GY2363188@phenom.ffwll.local>
 <c620634bf4faf57230810a16cb1f5a81f2d23945.camel@pengutronix.de>
 <CAKMK7uG5e90dEiXYXN9xo+iFY7_9BW6Pp=1CifSQ6c3eWyP=9w@mail.gmail.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
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
Cc: Dave Airlie <airlied@linux.ie>, Marco Felsch <m.felsch@pengutronix.de>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Russell King <rmk+kernel@armlinux.org.uk>,
 Sascha Hauer <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, 2020-02-27 at 19:14 +0100, Daniel Vetter wrote:
> On Thu, Feb 27, 2020 at 6:44 PM Lucas Stach <l.stach@pengutronix.de> wrote:
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

How does it collide, none of the patches touch imx-drm?

> > > I think at least, I haven't rolled much further than just getting the
> > > baseline stuff figured out. So if it's not super-pressing to get this
> > > patch here landed I think it'd be better to base this on top of the drmm
> > > series. I'm working on sending out v3, I'll cc you on the imx parts so
> > > you'll get pinged.
> > 
> > IMO this part of imx-drm has been broken for far too long already, so
> > we shouldn't delay this fixes series on a complete resource management
> > rework.

Right, the use-after-free fixes should not have to be rebased onto
WIP drmm code. But could we move the fixes to the front, with just
minimal necessary changes?
That way they could be backported to stable without the cleanup and code
shuffling patches in-between.
We could then migrate the rework to drm managed resources without hurry.

> Given it's patch 17/17 in a spring cleanup, and not patch 1/17 I'm not
> entirely sure it's really that high priority.

This series fixes crashes on probe in case of defective device trees or
missing component drivers. I wouldn't get too hung up on the "spring
cleanup" name, but the actual fix being the last of a series of 17
patches is a valid point.

> Anyway would be great if you at least check out what the new drm
> managed resource stuff would mean for imx here, since you're blowing
> on devm_kzalloc exactly in the way that I'm trying to get sorted now
> (without tons of explicit kfree() everywhere).

I concur. Marco, would the following workaround be enough to fix the
issue until we can switch to drm managed allocations?

----------8<----------
From b1c98a9d7b29fc052491d7fe0f7a1af91e48d866 Mon Sep 17 00:00:00 2001
From: Philipp Zabel <p.zabel@pengutronix.de>
Date: Mon, 2 Mar 2020 17:12:44 +0100
Subject: [PATCH] drm/imx: fix use after free

Component driver structures allocated with devm_kmalloc() in bind() are
freed automatically after unbind(). Since the contained drm structures
are accessed afterwards in drm_mode_config_cleanup(), move the
allocation into probe() to extend the driver structure's lifetime to the
lifetime of the device. This should eventually be changed to use drm
resource managed allocations with lifetime of the drm device.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/gpu/drm/imx/dw_hdmi-imx.c      | 15 ++++++++++-----
 drivers/gpu/drm/imx/imx-ldb.c          | 15 ++++++++++-----
 drivers/gpu/drm/imx/imx-tve.c          | 15 ++++++++++-----
 drivers/gpu/drm/imx/ipuv3-crtc.c       | 21 ++++++++++-----------
 drivers/gpu/drm/imx/parallel-display.c | 15 ++++++++++-----
 5 files changed, 50 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/imx/dw_hdmi-imx.c b/drivers/gpu/drm/imx/dw_hdmi-imx.c
index f22cfbf9353e..2e12a4a3bfa1 100644
--- a/drivers/gpu/drm/imx/dw_hdmi-imx.c
+++ b/drivers/gpu/drm/imx/dw_hdmi-imx.c
@@ -212,9 +212,8 @@ static int dw_hdmi_imx_bind(struct device *dev, struct device *master,
 	if (!pdev->dev.of_node)
 		return -ENODEV;
 
-	hdmi = devm_kzalloc(&pdev->dev, sizeof(*hdmi), GFP_KERNEL);
-	if (!hdmi)
-		return -ENOMEM;
+	hdmi = dev_get_drvdata(dev);
+	memset(hdmi, 0, sizeof(*hdmi));
 
 	match = of_match_node(dw_hdmi_imx_dt_ids, pdev->dev.of_node);
 	plat_data = match->data;
@@ -239,8 +238,6 @@ static int dw_hdmi_imx_bind(struct device *dev, struct device *master,
 	drm_encoder_init(drm, encoder, &dw_hdmi_imx_encoder_funcs,
 			 DRM_MODE_ENCODER_TMDS, NULL);
 
-	platform_set_drvdata(pdev, hdmi);
-
 	hdmi->hdmi = dw_hdmi_bind(pdev, encoder, plat_data);
 
 	/*
@@ -270,6 +267,14 @@ static const struct component_ops dw_hdmi_imx_ops = {
 
 static int dw_hdmi_imx_probe(struct platform_device *pdev)
 {
+	struct imx_hdmi *hdmi;
+
+	hdmi = devm_kzalloc(&pdev->dev, sizeof(*hdmi), GFP_KERNEL);
+	if (!hdmi)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, hdmi);
+
 	return component_add(&pdev->dev, &dw_hdmi_imx_ops);
 }
 
diff --git a/drivers/gpu/drm/imx/imx-ldb.c b/drivers/gpu/drm/imx/imx-ldb.c
index 8cb2665b2c74..c42217fc9f47 100644
--- a/drivers/gpu/drm/imx/imx-ldb.c
+++ b/drivers/gpu/drm/imx/imx-ldb.c
@@ -594,9 +594,8 @@ static int imx_ldb_bind(struct device *dev, struct device *master, void *data)
 	int ret;
 	int i;
 
-	imx_ldb = devm_kzalloc(dev, sizeof(*imx_ldb), GFP_KERNEL);
-	if (!imx_ldb)
-		return -ENOMEM;
+	imx_ldb = dev_get_drvdata(dev);
+	memset(imx_ldb, 0, sizeof(*imx_ldb));
 
 	imx_ldb->regmap = syscon_regmap_lookup_by_phandle(np, "gpr");
 	if (IS_ERR(imx_ldb->regmap)) {
@@ -704,8 +703,6 @@ static int imx_ldb_bind(struct device *dev, struct device *master, void *data)
 		}
 	}
 
-	dev_set_drvdata(dev, imx_ldb);
-
 	return 0;
 
 free_child:
@@ -737,6 +734,14 @@ static const struct component_ops imx_ldb_ops = {
 
 static int imx_ldb_probe(struct platform_device *pdev)
 {
+	struct imx_ldb *imx_ldb;
+
+	imx_ldb = devm_kzalloc(&pdev->dev, sizeof(*imx_ldb), GFP_KERNEL);
+	if (!imx_ldb)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, imx_ldb);
+
 	return component_add(&pdev->dev, &imx_ldb_ops);
 }
 
diff --git a/drivers/gpu/drm/imx/imx-tve.c b/drivers/gpu/drm/imx/imx-tve.c
index 5bbfaa2cd0f4..6593e75fc16e 100644
--- a/drivers/gpu/drm/imx/imx-tve.c
+++ b/drivers/gpu/drm/imx/imx-tve.c
@@ -546,9 +546,8 @@ static int imx_tve_bind(struct device *dev, struct device *master, void *data)
 	int irq;
 	int ret;
 
-	tve = devm_kzalloc(dev, sizeof(*tve), GFP_KERNEL);
-	if (!tve)
-		return -ENOMEM;
+	tve = dev_get_drvdata(dev);
+	memset(tve, 0, sizeof(*tve));
 
 	tve->dev = dev;
 	spin_lock_init(&tve->lock);
@@ -659,8 +658,6 @@ static int imx_tve_bind(struct device *dev, struct device *master, void *data)
 	if (ret)
 		return ret;
 
-	dev_set_drvdata(dev, tve);
-
 	return 0;
 }
 
@@ -680,6 +677,14 @@ static const struct component_ops imx_tve_ops = {
 
 static int imx_tve_probe(struct platform_device *pdev)
 {
+	struct imx_tve *tve;
+
+	tve = devm_kzalloc(dev, sizeof(*tve), GFP_KERNEL);
+	if (!tve)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, tve);
+
 	return component_add(&pdev->dev, &imx_tve_ops);
 }
 
diff --git a/drivers/gpu/drm/imx/ipuv3-crtc.c b/drivers/gpu/drm/imx/ipuv3-crtc.c
index 63c0284f8b3c..2256c9789fc2 100644
--- a/drivers/gpu/drm/imx/ipuv3-crtc.c
+++ b/drivers/gpu/drm/imx/ipuv3-crtc.c
@@ -438,21 +438,13 @@ static int ipu_drm_bind(struct device *dev, struct device *master, void *data)
 	struct ipu_client_platformdata *pdata = dev->platform_data;
 	struct drm_device *drm = data;
 	struct ipu_crtc *ipu_crtc;
-	int ret;
 
-	ipu_crtc = devm_kzalloc(dev, sizeof(*ipu_crtc), GFP_KERNEL);
-	if (!ipu_crtc)
-		return -ENOMEM;
+	ipu_crtc = dev_get_drvdata(dev);
+	memset(ipu_crtc, 0, sizeof(*ipu_crtc));
 
 	ipu_crtc->dev = dev;
 
-	ret = ipu_crtc_init(ipu_crtc, pdata, drm);
-	if (ret)
-		return ret;
-
-	dev_set_drvdata(dev, ipu_crtc);
-
-	return 0;
+	return ipu_crtc_init(ipu_crtc, pdata, drm);
 }
 
 static void ipu_drm_unbind(struct device *dev, struct device *master,
@@ -474,6 +466,7 @@ static const struct component_ops ipu_crtc_ops = {
 static int ipu_drm_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
+	struct ipu_crtc *ipu_crtc;
 	int ret;
 
 	if (!dev->platform_data)
@@ -483,6 +476,12 @@ static int ipu_drm_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	ipu_crtc = devm_kzalloc(dev, sizeof(*ipu_crtc), GFP_KERNEL);
+	if (!ipu_crtc)
+		return -ENOMEM;
+
+	dev_set_drvdata(dev, ipu_crtc);
+
 	return component_add(dev, &ipu_crtc_ops);
 }
 
diff --git a/drivers/gpu/drm/imx/parallel-display.c b/drivers/gpu/drm/imx/parallel-display.c
index 3dca424059f7..e6e629bd4b2a 100644
--- a/drivers/gpu/drm/imx/parallel-display.c
+++ b/drivers/gpu/drm/imx/parallel-display.c
@@ -205,9 +205,8 @@ static int imx_pd_bind(struct device *dev, struct device *master, void *data)
 	u32 bus_format = 0;
 	const char *fmt;
 
-	imxpd = devm_kzalloc(dev, sizeof(*imxpd), GFP_KERNEL);
-	if (!imxpd)
-		return -ENOMEM;
+	imxpd = dev_get_drvdata(dev);
+	memset(imxpd, 0, sizeof(*imxpd));
 
 	edidp = of_get_property(np, "edid", &imxpd->edid_len);
 	if (edidp)
@@ -237,8 +236,6 @@ static int imx_pd_bind(struct device *dev, struct device *master, void *data)
 	if (ret)
 		return ret;
 
-	dev_set_drvdata(dev, imxpd);
-
 	return 0;
 }
 
@@ -260,6 +257,14 @@ static const struct component_ops imx_pd_ops = {
 
 static int imx_pd_probe(struct platform_device *pdev)
 {
+	struct imx_parallel_display *imxpd;
+
+	imxpd = devm_kzalloc(&pdev->dev, sizeof(*imxpd), GFP_KERNEL);
+	if (!imxpd)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, imxpd);
+
 	return component_add(&pdev->dev, &imx_pd_ops);
 }
 

base-commit: 98d54f81e36ba3bf92172791eba5ca5bd813989b
-- 
2.20.1
---------->8----------

regards
Philipp
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
