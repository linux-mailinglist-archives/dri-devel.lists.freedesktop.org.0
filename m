Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A52074D50BE
	for <lists+dri-devel@lfdr.de>; Thu, 10 Mar 2022 18:39:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA8FF10E6E0;
	Thu, 10 Mar 2022 17:39:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 557E910E17F
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Mar 2022 17:39:23 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 59C12491;
 Thu, 10 Mar 2022 18:39:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1646933961;
 bh=l1kcdLXluMDZhM6bsQo/4827EOJNKubrLs8g65b18ZE=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=QesiaEAAE8AC/BxcAk8qJ3XEq62Y6EXfhBV9zo8KUmnQPaPzvGz/0CFEdqUv0PjGJ
 UYhPA90M96E//+eJs59JRvCk79KtRRH7fWxdw3Gd/SVVJDzwsZ7OY8Z25xCrpj2vXe
 jaqBIK+rcFZa7FG+kX0NmwbrLnqFWZtjUpoABvnY=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <YioqiGtni8Y7X4M1@pendragon.ideasonboard.com>
References: <20220310152227.2122960-1-kieran.bingham+renesas@ideasonboard.com>
 <20220310152227.2122960-4-kieran.bingham+renesas@ideasonboard.com>
 <YioqiGtni8Y7X4M1@pendragon.ideasonboard.com>
Subject: Re: [PATCH v3 3/3] drm/bridge: ti-sn65dsi86: Support hotplug detection
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Date: Thu, 10 Mar 2022 17:39:18 +0000
Message-ID: <164693395853.11309.3618960076956475929@Monstersaurus>
User-Agent: alot/0.10
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
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>, Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Robert Foss <robert.foss@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent

Quoting Laurent Pinchart (2022-03-10 16:42:48)
> Hi Kieran,
>=20
> Thank you for the patch.
>=20
> On Thu, Mar 10, 2022 at 03:22:27PM +0000, Kieran Bingham wrote:
> > When the SN65DSI86 is used in DisplayPort mode, its output is likely
> > routed to a DisplayPort connector, which can benefit from hotplug
> > detection. Support it in such cases, with polling mode only for now.
>=20
> Don't we support IRQ mode too now ?

Ah yes, I missed this for an update.

> > The implementation is limited to the bridge operations, as the connector
> > operations are legacy and new users should use
> > DRM_BRIDGE_ATTACH_NO_CONNECTOR.
> >=20
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.=
com>
> > Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > ---
> > Changes since v1:
> >=20
> > - Document the no_hpd field
> > - Rely on the SN_HPD_DISABLE_REG default value in the HPD case
> > - Add a TODO comment regarding IRQ support
> > [Kieran]
> > - Fix spelling s/assrted/asserted/
> > - Only enable HPD on DisplayPort connector.
> > - Support IRQ based hotplug detect
> >=20
> > Changes since v2: [Kieran]
> >  - Use unsigned int for values read by regmap
> >  - Update HPD support warning message
> >  - Only enable OP_HPD if IRQ support enabled.
> >  - Only register IRQ handler during ti_sn_bridge_probe()
> >  - Store IRQ in the struct ti_sn65dsi86
> >  - Register IRQ only when !no-hpd
> >  - Refactor DRM_BRIDGE_OP_DETECT and DRM_BRIDGE_OP_HPD handling
> >=20
> >  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 142 +++++++++++++++++++++++---
> >  1 file changed, 129 insertions(+), 13 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/br=
idge/ti-sn65dsi86.c
> > index d581c820e5d8..328a48f09f97 100644
> > --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > @@ -70,6 +70,7 @@
> >  #define  BPP_18_RGB                          BIT(0)
> >  #define SN_HPD_DISABLE_REG                   0x5C
> >  #define  HPD_DISABLE                         BIT(0)
> > +#define  HPD_DEBOUNCED_STATE                 BIT(4)
> >  #define SN_GPIO_IO_REG                               0x5E
> >  #define  SN_GPIO_INPUT_SHIFT                 4
> >  #define  SN_GPIO_OUTPUT_SHIFT                        0
> > @@ -106,10 +107,24 @@
> >  #define SN_PWM_EN_INV_REG                    0xA5
> >  #define  SN_PWM_INV_MASK                     BIT(0)
> >  #define  SN_PWM_EN_MASK                              BIT(1)
> > +#define SN_IRQ_EN_REG                                0xE0
> > +#define  IRQ_EN                                      BIT(0)
> > +#define SN_IRQ_HPD_REG                               0xE6
> > +#define  IRQ_HPD_EN                          BIT(0)
> > +#define  IRQ_HPD_INSERTION_EN                        BIT(1)
> > +#define  IRQ_HPD_REMOVAL_EN                  BIT(2)
> > +#define  IRQ_HPD_REPLUG_EN                   BIT(3)
> > +#define  IRQ_HPD_PLL_UNLOCK_EN                       BIT(5)
> >  #define SN_AUX_CMD_STATUS_REG                        0xF4
> >  #define  AUX_IRQ_STATUS_AUX_RPLY_TOUT                BIT(3)
> >  #define  AUX_IRQ_STATUS_AUX_SHORT            BIT(5)
> >  #define  AUX_IRQ_STATUS_NAT_I2C_FAIL         BIT(6)
> > +#define SN_IRQ_HPD_STATUS_REG                        0xF5
> > +#define  IRQ_HPD_STATUS                              BIT(0)
> > +#define  IRQ_HPD_INSERTION_STATUS            BIT(1)
> > +#define  IRQ_HPD_REMOVAL_STATUS                      BIT(2)
> > +#define  IRQ_HPD_REPLUG_STATUS                       BIT(3)
> > +#define  IRQ_PLL_UNLOCK                              BIT(5)
> > =20
> >  #define MIN_DSI_CLK_FREQ_MHZ 40
> > =20
> > @@ -168,6 +183,12 @@
> >   * @pwm_enabled:  Used to track if the PWM signal is currently enabled.
> >   * @pwm_pin_busy: Track if GPIO4 is currently requested for GPIO or PW=
M.
> >   * @pwm_refclk_freq: Cache for the reference clock input to the PWM.
> > + *
> > + * @no_hpd:       Disable hot-plug detection as instructed by device t=
ree (used
> > + *                for instance for eDP panels whose HPD signal won't b=
e asserted
> > + *                until the panel is turned on, and is thus not usable=
 for
> > + *                downstream device detection).
> > + * @irq:          IRQ number for the device.
> >   */
> >  struct ti_sn65dsi86 {
> >       struct auxiliary_device         bridge_aux;
> > @@ -202,6 +223,9 @@ struct ti_sn65dsi86 {
> >       atomic_t                        pwm_pin_busy;
> >  #endif
> >       unsigned int                    pwm_refclk_freq;
> > +
> > +     bool                            no_hpd;
> > +     int                             irq;
> >  };
> > =20
> >  static const struct regmap_range ti_sn65dsi86_volatile_ranges[] =3D {
> > @@ -316,23 +340,25 @@ static void ti_sn65dsi86_enable_comms(struct ti_s=
n65dsi86 *pdata)
> >       ti_sn_bridge_set_refclk_freq(pdata);
> > =20
> >       /*
> > -      * HPD on this bridge chip is a bit useless.  This is an eDP brid=
ge
> > -      * so the HPD is an internal signal that's only there to signal t=
hat
> > -      * the panel is done powering up.  ...but the bridge chip debounc=
es
> > -      * this signal by between 100 ms and 400 ms (depending on process,
> > -      * voltage, and temperate--I measured it at about 200 ms).  One
> > +      * As this is an eDP bridge, the output will be connected to a fi=
xed
> > +      * panel in most systems. HPD is in that case only an internal si=
gnal
> > +      * to signal that the panel is done powering up. The bridge chip
> > +      * debounces this signal by between 100 ms and 400 ms (depending =
on
> > +      * process, voltage, and temperate--I measured it at about 200 ms=
). One
> >        * particular panel asserted HPD 84 ms after it was powered on me=
aning
> >        * that we saw HPD 284 ms after power on.  ...but the same panel =
said
> >        * that instead of looking at HPD you could just hardcode a delay=
 of
> > -      * 200 ms.  We'll assume that the panel driver will have the hard=
coded
> > -      * delay in its prepare and always disable HPD.
> > +      * 200 ms. HPD is thus a bit useless. For this type of use cases,=
 we'll
> > +      * assume that the panel driver will have the hardcoded delay in =
its
> > +      * prepare and always disable HPD.
> >        *
> > -      * If HPD somehow makes sense on some future panel we'll have to
> > -      * change this to be conditional on someone specifying that HPD s=
hould
> > -      * be used.
> > +      * However, on some systems, the output is connected to a Display=
Port
> > +      * connector. HPD is needed in such cases. To accommodate both use
> > +      * cases, enable HPD only when requested.
> >        */
> > -     regmap_update_bits(pdata->regmap, SN_HPD_DISABLE_REG, HPD_DISABLE,
> > -                        HPD_DISABLE);
> > +     if (pdata->no_hpd)
> > +             regmap_update_bits(pdata->regmap, SN_HPD_DISABLE_REG,
> > +                                HPD_DISABLE, HPD_DISABLE);
> > =20
> >       pdata->comms_enabled =3D true;
> > =20
> > @@ -1135,6 +1161,36 @@ static void ti_sn_bridge_atomic_post_disable(str=
uct drm_bridge *bridge,
> >       pm_runtime_put_sync(pdata->dev);
> >  }
> > =20
> > +static enum drm_connector_status ti_sn_bridge_detect(struct drm_bridge=
 *bridge)
> > +{
> > +     struct ti_sn65dsi86 *pdata =3D bridge_to_ti_sn65dsi86(bridge);
> > +     int val;
> > +
> > +     regmap_read(pdata->regmap, SN_HPD_DISABLE_REG, &val);
> > +
> > +     return val & HPD_DEBOUNCED_STATE ? connector_status_connected
> > +                                      : connector_status_disconnected;
> > +}
> > +
> > +static void ti_sn_bridge_hpd_enable(struct drm_bridge *bridge)
> > +{
> > +     struct ti_sn65dsi86 *pdata =3D bridge_to_ti_sn65dsi86(bridge);
> > +
> > +     /* The device must remain active for HPD to function */
> > +     pm_runtime_get_sync(pdata->dev);
> > +     regmap_write(pdata->regmap, SN_IRQ_HPD_REG,
> > +                  IRQ_HPD_EN | IRQ_HPD_INSERTION_EN |
> > +                  IRQ_HPD_REMOVAL_EN | IRQ_HPD_REPLUG_EN);
> > +}
> > +
> > +static void ti_sn_bridge_hpd_disable(struct drm_bridge *bridge)
> > +{
> > +     struct ti_sn65dsi86 *pdata =3D bridge_to_ti_sn65dsi86(bridge);
> > +
> > +     regmap_write(pdata->regmap, SN_IRQ_HPD_REG, 0);
> > +     pm_runtime_put_autosuspend(pdata->dev);
> > +}
> > +
> >  static struct edid *ti_sn_bridge_get_edid(struct drm_bridge *bridge,
> >                                         struct drm_connector *connector)
> >  {
> > @@ -1153,6 +1209,9 @@ static const struct drm_bridge_funcs ti_sn_bridge=
_funcs =3D {
> >       .detach =3D ti_sn_bridge_detach,
> >       .mode_valid =3D ti_sn_bridge_mode_valid,
> >       .get_edid =3D ti_sn_bridge_get_edid,
> > +     .detect =3D ti_sn_bridge_detect,
> > +     .hpd_enable =3D ti_sn_bridge_hpd_enable,
> > +     .hpd_disable =3D ti_sn_bridge_hpd_disable,
> >       .atomic_pre_enable =3D ti_sn_bridge_atomic_pre_enable,
> >       .atomic_enable =3D ti_sn_bridge_atomic_enable,
> >       .atomic_disable =3D ti_sn_bridge_atomic_disable,
> > @@ -1223,6 +1282,34 @@ static int ti_sn_bridge_parse_dsi_host(struct ti=
_sn65dsi86 *pdata)
> >       return 0;
> >  }
> > =20
> > +static irqreturn_t ti_sn65dsi86_irq_handler(int irq, void *arg)
> > +{
> > +     struct ti_sn65dsi86 *pdata =3D arg;
> > +     int ret;
> > +     unsigned int hpd;
> > +
> > +     ret =3D regmap_read(pdata->regmap, SN_IRQ_HPD_STATUS_REG, &hpd);
> > +     if (ret || !hpd)
> > +             return IRQ_NONE;
> > +
> > +     if (hpd & IRQ_HPD_INSERTION_STATUS)
> > +             drm_bridge_hpd_notify(&pdata->bridge, connector_status_co=
nnected);
> > +
> > +     if (hpd & IRQ_HPD_REMOVAL_STATUS)
> > +             drm_bridge_hpd_notify(&pdata->bridge, connector_status_di=
sconnected);
> > +
> > +     /* When replugged, ensure we trigger a detect to update the displ=
ay */
> > +     if (hpd & IRQ_HPD_REPLUG_STATUS)
> > +             drm_bridge_hpd_notify(&pdata->bridge, connector_status_di=
sconnected);
> > +
> > +     /* reset the status registers */
>=20
> s/registers/register/

Ack.

>=20
> > +     regmap_write(pdata->regmap, SN_IRQ_HPD_STATUS_REG,
> > +                  IRQ_HPD_STATUS | IRQ_HPD_INSERTION_STATUS |
> > +                  IRQ_HPD_REMOVAL_STATUS | IRQ_HPD_REPLUG_STATUS);
> > +
> > +     return IRQ_HANDLED;
> > +}
> > +
> >  static int ti_sn_bridge_probe(struct auxiliary_device *adev,
> >                             const struct auxiliary_device_id *id)
> >  {
> > @@ -1236,6 +1323,14 @@ static int ti_sn_bridge_probe(struct auxiliary_d=
evice *adev,
> >               return PTR_ERR(pdata->next_bridge);
> >       }
> > =20
> > +     pdata->no_hpd =3D of_property_read_bool(np, "no-hpd");
> > +     if (pdata->next_bridge->type !=3D DRM_MODE_CONNECTOR_DisplayPort =
&&
> > +         !pdata->no_hpd) {
> > +             dev_warn(pdata->dev,
> > +                      "HPD support only implemented for full DP connec=
tors\n");
> > +             pdata->no_hpd =3D true;
> > +     }
> > +
> >       ti_sn_bridge_parse_lanes(pdata, np);
> > =20
> >       ret =3D ti_sn_bridge_parse_dsi_host(pdata);
> > @@ -1247,9 +1342,29 @@ static int ti_sn_bridge_probe(struct auxiliary_d=
evice *adev,
> >       pdata->bridge.type =3D pdata->next_bridge->type =3D=3D DRM_MODE_C=
ONNECTOR_DisplayPort
> >                          ? DRM_MODE_CONNECTOR_DisplayPort : DRM_MODE_CO=
NNECTOR_eDP;
> > =20
> > -     if (pdata->bridge.type =3D=3D DRM_MODE_CONNECTOR_DisplayPort)
> > +     if (pdata->bridge.type =3D=3D DRM_MODE_CONNECTOR_DisplayPort) {
> >               pdata->bridge.ops =3D DRM_BRIDGE_OP_EDID;
> > =20
> > +             if (!pdata->no_hpd)
> > +                     pdata->bridge.ops |=3D DRM_BRIDGE_OP_DETECT;
> > +     }
> > +
> > +     if (!pdata->no_hpd && pdata->irq > 0) {
> > +             dev_err(pdata->dev, "registering IRQ %d\n", pdata->irq);
>=20
> As you've noted, this should be removed.

Already gone in my tree.

>=20
> > +
> > +             ret =3D devm_request_threaded_irq(pdata->dev, pdata->irq,=
 NULL,
> > +                                             ti_sn65dsi86_irq_handler,
> > +                                             IRQF_ONESHOT, "sn65dsi86-=
irq",
> > +                                             pdata);
> > +             if (ret)
> > +                     return dev_err_probe(pdata->dev, ret,
> > +                                          "Failed to register DP inter=
rupt\n");
> > +
> > +             /* Enable IRQ based HPD */
> > +             regmap_write(pdata->regmap, SN_IRQ_EN_REG, IRQ_EN);
>=20
> Do we have a guarantee that the device isn't PM-suspended here ? Should
> this be done in the PM resume handler ?


This is tricky I fear. The ti_sn_bridge_probe() is called after the main
ti_sn65dsi86_probe(), which is where the pm resume handler would get
called first.

I moved the handler registration here, because we can't handle the IRQ
until we have the bridge set up, but if we were to enable interrupts in
the pm resume handler, it would get enabled during ti_sn65dsi86_probe()
before the handler is registered.

Now at that point nothing should fire an interrupt, but still - enabling
interrupts before the handler is registered doesn't sound good to me.

--
Kieran


>=20
> > +             pdata->bridge.ops |=3D DRM_BRIDGE_OP_HPD;
> > +     }
> > +
> >       drm_bridge_add(&pdata->bridge);
> > =20
> >       ret =3D ti_sn_attach_host(pdata);
> > @@ -1831,6 +1946,7 @@ static int ti_sn65dsi86_probe(struct i2c_client *=
client,
> >               return -ENOMEM;
> >       dev_set_drvdata(dev, pdata);
> >       pdata->dev =3D dev;
> > +     pdata->irq =3D client->irq;
> > =20
> >       mutex_init(&pdata->comms_mutex);
> > =20
>=20
> --=20
> Regards,
>=20
> Laurent Pinchart
