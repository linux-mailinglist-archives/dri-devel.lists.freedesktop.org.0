Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C9E230945
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 13:58:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B34596E16D;
	Tue, 28 Jul 2020 11:58:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10B4D6E16D
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 11:58:52 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id r4so15050939wrx.9
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 04:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YwNg33xhQ+LYYZ2vSrinpCcHOZTKZYpW9NAazVAakNo=;
 b=IVmlnxD5gxH3brFp/SLjSaN/pBKMiosZBMNg3j12SZTZXTGWkbh6APc5iej9VwO3xu
 xKXcwT+YkX3bVM/HWohPAXGFmz17and+Qt1eGW7njjq4PJPuQk+48ZppxWChE7HHwMQ2
 i1S4pFlayS6sN/Ls94TxGyRJPbKsmu7jDX2Ld82aIabiavhHiXLWbGhqgtWqlcE/u1hI
 +MOOhZk99+bjgrsx8hCodVfurjtBXvlHxfwbWH0QcS89QgjFoo9nbB1y/WLkEt+ayPfT
 x3qokFP6i66ih7G9RrgBkzM4msuihQKUtaN9WDWncZRp2/MBRDy6BSSypH5jzDPOftG0
 fiug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YwNg33xhQ+LYYZ2vSrinpCcHOZTKZYpW9NAazVAakNo=;
 b=MTp+9JBgvnrv7qRWC9bXCa/bFbfFt/Bzp/W6LFQ3qnmpmbdiRsgSJfi0RbGllBBsws
 tDuU6fR08NO/IEJrDBjuwkUIwb1Bf2CAliVYaaSfWPFNxjJ1LWHzVCbzbrroJSHra4E+
 kcfq3CUAqyRvq843f/a9zdO2j0nUD2ihmmlGlfsdMefJj2x8qn2/uDqr+kfGWG4+WFOA
 oATGSES9avxXc8oTbtIchLH9/WfOzcQMxbaYfzs0P3Z4wTcQazqf8DIzKDqTQBVoaG60
 g7aFl1Hd+H/OiJaUoVtaEDYPVyI6CLg4KxKTutkEncu9bsbhRBZw8ddtWtVmhJPPS/xq
 iO3Q==
X-Gm-Message-State: AOAM531cBDVa//CHUf6BCSts+QGAyi3dLDKWFga1nzbyMXrZk9X2mShu
 fqyBS63PEkN//XDl67yQGLCWwzwFZpxBhE5oL7ZXOA==
X-Google-Smtp-Source: ABdhPJyocl+6o8ggfwz1oof6ivJdWhoczAGKGiQMOy70yjfhr3kVit+svIGhWeJw1NknTCuO/HSTL9IhQR7SbYQOoeY=
X-Received: by 2002:a5d:5383:: with SMTP id d3mr17680337wrv.42.1595937530562; 
 Tue, 28 Jul 2020 04:58:50 -0700 (PDT)
MIME-Version: 1.0
References: <cover.7a1aa1784976093af26cb31fd283cf5b3ed568bb.1594230107.git-series.maxime@cerno.tech>
 <6ff9f5156dd14ab23967fe7357660b3cbf556c22.1594230107.git-series.maxime@cerno.tech>
In-Reply-To: <6ff9f5156dd14ab23967fe7357660b3cbf556c22.1594230107.git-series.maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 28 Jul 2020 12:58:32 +0100
Message-ID: <CAPY8ntDwOKwtX2gAUNKp4stLXq6c3JFC2BaFX4zL4NQh3EEANw@mail.gmail.com>
Subject: Re: [PATCH v4 40/78] drm/vc4: hdmi: rework connectors and encoders
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: Tim Gover <tim.gover@raspberrypi.com>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 bcm-kernel-feedback-list@broadcom.com,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime

On Wed, 8 Jul 2020 at 18:43, Maxime Ripard <maxime@cerno.tech> wrote:
>
> the vc4_hdmi driver has some custom structures to hold the data it needs to
> associate with the drm_encoder and drm_connector structures.
>
> However, it allocates them separately from the vc4_hdmi structure which
> makes it more complicated than it needs to be.
>
> Move those structures to be contained by vc4_hdmi and update the code
> accordingly.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 87 ++++++++++++++++-------------------
>  drivers/gpu/drm/vc4/vc4_hdmi.h | 64 +++++++++++++-------------
>  2 files changed, 72 insertions(+), 79 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index db79e0d88625..1e2214f24ed7 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -191,20 +191,15 @@ static const struct drm_connector_helper_funcs vc4_hdmi_connector_helper_funcs =
>         .get_modes = vc4_hdmi_connector_get_modes,
>  };
>
> -static struct drm_connector *vc4_hdmi_connector_init(struct drm_device *dev,
> -                                                    struct drm_encoder *encoder,
> -                                                    struct i2c_adapter *ddc)
> +static int vc4_hdmi_connector_init(struct drm_device *dev,
> +                                  struct vc4_hdmi *vc4_hdmi,
> +                                  struct i2c_adapter *ddc)
>  {
> -       struct drm_connector *connector;
> -       struct vc4_hdmi_connector *hdmi_connector;
> +       struct vc4_hdmi_connector *hdmi_connector = &vc4_hdmi->connector;
> +       struct drm_connector *connector = &hdmi_connector->base;
> +       struct drm_encoder *encoder = &vc4_hdmi->encoder.base.base;
>         int ret;
>
> -       hdmi_connector = devm_kzalloc(dev->dev, sizeof(*hdmi_connector),
> -                                     GFP_KERNEL);
> -       if (!hdmi_connector)
> -               return ERR_PTR(-ENOMEM);
> -       connector = &hdmi_connector->base;
> -
>         hdmi_connector->encoder = encoder;
>
>         drm_connector_init_with_ddc(dev, connector,
> @@ -216,7 +211,7 @@ static struct drm_connector *vc4_hdmi_connector_init(struct drm_device *dev,
>         /* Create and attach TV margin props to this connector. */
>         ret = drm_mode_create_tv_margin_properties(dev);
>         if (ret)
> -               return ERR_PTR(ret);
> +               return ret;
>
>         drm_connector_attach_tv_margin_properties(connector);
>
> @@ -228,7 +223,7 @@ static struct drm_connector *vc4_hdmi_connector_init(struct drm_device *dev,
>
>         drm_connector_attach_encoder(connector, encoder);
>
> -       return connector;
> +       return 0;
>  }
>
>  static int vc4_hdmi_stop_packet(struct drm_encoder *encoder,
> @@ -298,21 +293,22 @@ static void vc4_hdmi_set_avi_infoframe(struct drm_encoder *encoder)
>         struct vc4_hdmi_encoder *vc4_encoder = to_vc4_hdmi_encoder(encoder);
>         struct vc4_dev *vc4 = encoder->dev->dev_private;
>         struct vc4_hdmi *hdmi = vc4->hdmi;
> -       struct drm_connector_state *cstate = hdmi->connector->state;
> +       struct drm_connector *connector = &hdmi->connector.base;
> +       struct drm_connector_state *cstate = connector->state;
>         struct drm_crtc *crtc = encoder->crtc;
>         const struct drm_display_mode *mode = &crtc->state->adjusted_mode;
>         union hdmi_infoframe frame;
>         int ret;
>
>         ret = drm_hdmi_avi_infoframe_from_display_mode(&frame.avi,
> -                                                      hdmi->connector, mode);
> +                                                      connector, mode);
>         if (ret < 0) {
>                 DRM_ERROR("couldn't fill AVI infoframe\n");
>                 return;
>         }
>
>         drm_hdmi_avi_infoframe_quant_range(&frame.avi,
> -                                          hdmi->connector, mode,
> +                                          connector, mode,
>                                            vc4_encoder->limited_rgb_range ?
>                                            HDMI_QUANTIZATION_RANGE_LIMITED :
>                                            HDMI_QUANTIZATION_RANGE_FULL);
> @@ -628,7 +624,8 @@ static const struct drm_encoder_helper_funcs vc4_hdmi_encoder_helper_funcs = {
>  /* HDMI audio codec callbacks */
>  static void vc4_hdmi_audio_set_mai_clock(struct vc4_hdmi *hdmi)
>  {
> -       struct drm_device *drm = hdmi->encoder->dev;
> +       struct drm_encoder *encoder = &hdmi->encoder.base.base;
> +       struct drm_device *drm = encoder->dev;
>         struct vc4_dev *vc4 = to_vc4_dev(drm);
>         u32 hsm_clock = clk_get_rate(hdmi->hsm_clock);
>         unsigned long n, m;
> @@ -647,7 +644,7 @@ static void vc4_hdmi_audio_set_mai_clock(struct vc4_hdmi *hdmi)
>
>  static void vc4_hdmi_set_n_cts(struct vc4_hdmi *hdmi)
>  {
> -       struct drm_encoder *encoder = hdmi->encoder;
> +       struct drm_encoder *encoder = &hdmi->encoder.base.base;
>         struct drm_crtc *crtc = encoder->crtc;
>         struct drm_device *drm = encoder->dev;
>         struct vc4_dev *vc4 = to_vc4_dev(drm);
> @@ -685,7 +682,8 @@ static int vc4_hdmi_audio_startup(struct snd_pcm_substream *substream,
>                                   struct snd_soc_dai *dai)
>  {
>         struct vc4_hdmi *hdmi = dai_to_hdmi(dai);
> -       struct drm_encoder *encoder = hdmi->encoder;
> +       struct drm_encoder *encoder = &hdmi->encoder.base.base;
> +       struct drm_connector *connector = &hdmi->connector.base;
>         struct vc4_dev *vc4 = to_vc4_dev(encoder->dev);
>         int ret;
>
> @@ -702,8 +700,7 @@ static int vc4_hdmi_audio_startup(struct snd_pcm_substream *substream,
>                                 VC4_HDMI_RAM_PACKET_ENABLE))
>                 return -ENODEV;
>
> -       ret = snd_pcm_hw_constraint_eld(substream->runtime,
> -                                       hdmi->connector->eld);
> +       ret = snd_pcm_hw_constraint_eld(substream->runtime, connector->eld);
>         if (ret)
>                 return ret;
>
> @@ -717,7 +714,7 @@ static int vc4_hdmi_audio_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
>
>  static void vc4_hdmi_audio_reset(struct vc4_hdmi *hdmi)
>  {
> -       struct drm_encoder *encoder = hdmi->encoder;
> +       struct drm_encoder *encoder = &hdmi->encoder.base.base;
>         struct drm_device *drm = encoder->dev;
>         struct device *dev = &hdmi->pdev->dev;
>         struct vc4_dev *vc4 = to_vc4_dev(drm);
> @@ -751,7 +748,7 @@ static int vc4_hdmi_audio_hw_params(struct snd_pcm_substream *substream,
>                                     struct snd_soc_dai *dai)
>  {
>         struct vc4_hdmi *hdmi = dai_to_hdmi(dai);
> -       struct drm_encoder *encoder = hdmi->encoder;
> +       struct drm_encoder *encoder = &hdmi->encoder.base.base;
>         struct drm_device *drm = encoder->dev;
>         struct device *dev = &hdmi->pdev->dev;
>         struct vc4_dev *vc4 = to_vc4_dev(drm);
> @@ -824,7 +821,7 @@ static int vc4_hdmi_audio_trigger(struct snd_pcm_substream *substream, int cmd,
>                                   struct snd_soc_dai *dai)
>  {
>         struct vc4_hdmi *hdmi = dai_to_hdmi(dai);
> -       struct drm_encoder *encoder = hdmi->encoder;
> +       struct drm_encoder *encoder = &hdmi->encoder.base.base;
>         struct drm_device *drm = encoder->dev;
>         struct vc4_dev *vc4 = to_vc4_dev(drm);
>
> @@ -868,9 +865,10 @@ static int vc4_hdmi_audio_eld_ctl_info(struct snd_kcontrol *kcontrol,
>  {
>         struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
>         struct vc4_hdmi *hdmi = snd_component_to_hdmi(component);
> +       struct drm_connector *connector = &hdmi->connector.base;
>
>         uinfo->type = SNDRV_CTL_ELEM_TYPE_BYTES;
> -       uinfo->count = sizeof(hdmi->connector->eld);
> +       uinfo->count = sizeof(connector->eld);
>
>         return 0;
>  }
> @@ -880,9 +878,10 @@ static int vc4_hdmi_audio_eld_ctl_get(struct snd_kcontrol *kcontrol,
>  {
>         struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
>         struct vc4_hdmi *hdmi = snd_component_to_hdmi(component);
> +       struct drm_connector *connector = &hdmi->connector.base;
>
> -       memcpy(ucontrol->value.bytes.data, hdmi->connector->eld,
> -              sizeof(hdmi->connector->eld));
> +       memcpy(ucontrol->value.bytes.data, connector->eld,
> +              sizeof(connector->eld));
>
>         return 0;
>  }
> @@ -1221,7 +1220,7 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
>         struct drm_device *drm = dev_get_drvdata(master);
>         struct vc4_dev *vc4 = drm->dev_private;
>         struct vc4_hdmi *hdmi;
> -       struct vc4_hdmi_encoder *vc4_hdmi_encoder;
> +       struct drm_encoder *encoder;
>         struct device_node *ddc_node;
>         u32 value;
>         int ret;
> @@ -1230,14 +1229,10 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
>         if (!hdmi)
>                 return -ENOMEM;
>
> -       vc4_hdmi_encoder = devm_kzalloc(dev, sizeof(*vc4_hdmi_encoder),
> -                                       GFP_KERNEL);
> -       if (!vc4_hdmi_encoder)
> -               return -ENOMEM;
> -       vc4_hdmi_encoder->base.type = VC4_ENCODER_TYPE_HDMI0;
> -       hdmi->encoder = &vc4_hdmi_encoder->base.base;
> -
> +       encoder = &hdmi->encoder.base.base;
> +       hdmi->encoder.base.type = VC4_ENCODER_TYPE_HDMI0;
>         hdmi->pdev = pdev;
> +
>         hdmi->hdmicore_regs = vc4_ioremap_regs(pdev, 0);
>         if (IS_ERR(hdmi->hdmicore_regs))
>                 return PTR_ERR(hdmi->hdmicore_regs);
> @@ -1325,15 +1320,13 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
>         }
>         pm_runtime_enable(dev);
>
> -       drm_simple_encoder_init(drm, hdmi->encoder, DRM_MODE_ENCODER_TMDS);
> -       drm_encoder_helper_add(hdmi->encoder, &vc4_hdmi_encoder_helper_funcs);
> +       drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_TMDS);
> +       drm_encoder_helper_add(encoder, &vc4_hdmi_encoder_helper_funcs);
>
> -       hdmi->connector =
> -               vc4_hdmi_connector_init(drm, hdmi->encoder, hdmi->ddc);
> -       if (IS_ERR(hdmi->connector)) {
> -               ret = PTR_ERR(hdmi->connector);
> +       ret = vc4_hdmi_connector_init(drm, hdmi, hdmi->ddc);
> +       if (ret)
>                 goto err_destroy_encoder;
> -       }
> +
>  #ifdef CONFIG_DRM_VC4_HDMI_CEC
>         hdmi->cec_adap = cec_allocate_adapter(&vc4_hdmi_cec_adap_ops,
>                                               vc4, "vc4",
> @@ -1343,7 +1336,7 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
>         if (ret < 0)
>                 goto err_destroy_conn;
>
> -       cec_fill_conn_info_from_drm(&conn_info, hdmi->connector);
> +       cec_fill_conn_info_from_drm(&conn_info, &hdmi->connector.base);
>         cec_s_conn_info(hdmi->cec_adap, &conn_info);
>
>         HDMI_WRITE(VC4_HDMI_CPU_MASK_SET, 0xffffffff);
> @@ -1380,10 +1373,10 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
>  err_delete_cec_adap:
>         cec_delete_adapter(hdmi->cec_adap);
>  err_destroy_conn:
> -       vc4_hdmi_connector_destroy(hdmi->connector);
> +       vc4_hdmi_connector_destroy(&hdmi->connector.base);
>  #endif
>  err_destroy_encoder:
> -       drm_encoder_cleanup(hdmi->encoder);
> +       drm_encoder_cleanup(encoder);
>  err_unprepare_hsm:
>         clk_disable_unprepare(hdmi->hsm_clock);
>         pm_runtime_disable(dev);
> @@ -1401,8 +1394,8 @@ static void vc4_hdmi_unbind(struct device *dev, struct device *master,
>         struct vc4_hdmi *hdmi = vc4->hdmi;
>
>         cec_unregister_adapter(hdmi->cec_adap);
> -       vc4_hdmi_connector_destroy(hdmi->connector);
> -       drm_encoder_cleanup(hdmi->encoder);
> +       vc4_hdmi_connector_destroy(&hdmi->connector.base);
> +       drm_encoder_cleanup(&hdmi->encoder.base.base);
>
>         clk_disable_unprepare(hdmi->hsm_clock);
>         pm_runtime_disable(dev);
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
> index 5ec5d1f6b1e6..17079a39f1b1 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.h
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
> @@ -8,6 +8,36 @@
>
>  #include "vc4_drv.h"
>
> +/* VC4 HDMI encoder KMS struct */
> +struct vc4_hdmi_encoder {
> +       struct vc4_encoder base;
> +       bool hdmi_monitor;
> +       bool limited_rgb_range;
> +};
> +
> +static inline struct vc4_hdmi_encoder *
> +to_vc4_hdmi_encoder(struct drm_encoder *encoder)
> +{
> +       return container_of(encoder, struct vc4_hdmi_encoder, base.base);
> +}
> +
> +/* VC4 HDMI connector KMS struct */
> +struct vc4_hdmi_connector {
> +       struct drm_connector base;
> +
> +       /* Since the connector is attached to just the one encoder,
> +        * this is the reference to it so we can do the best_encoder()
> +        * hook.
> +        */
> +       struct drm_encoder *encoder;
> +};
> +
> +static inline struct vc4_hdmi_connector *
> +to_vc4_hdmi_connector(struct drm_connector *connector)
> +{
> +       return container_of(connector, struct vc4_hdmi_connector, base);
> +}
> +
>  /* HDMI audio information */
>  struct vc4_hdmi_audio {
>         struct snd_soc_card card;
> @@ -25,8 +55,8 @@ struct vc4_hdmi_audio {
>  struct vc4_hdmi {
>         struct platform_device *pdev;
>
> -       struct drm_encoder *encoder;
> -       struct drm_connector *connector;
> +       struct vc4_hdmi_encoder encoder;
> +       struct vc4_hdmi_connector connector;
>
>         struct vc4_hdmi_audio audio;
>
> @@ -53,34 +83,4 @@ struct vc4_hdmi {
>  #define HD_READ(offset) readl(vc4->hdmi->hd_regs + offset)
>  #define HD_WRITE(offset, val) writel(val, vc4->hdmi->hd_regs + offset)
>
> -/* VC4 HDMI encoder KMS struct */
> -struct vc4_hdmi_encoder {
> -       struct vc4_encoder base;
> -       bool hdmi_monitor;
> -       bool limited_rgb_range;
> -};
> -
> -static inline struct vc4_hdmi_encoder *
> -to_vc4_hdmi_encoder(struct drm_encoder *encoder)
> -{
> -       return container_of(encoder, struct vc4_hdmi_encoder, base.base);
> -}
> -
> -/* VC4 HDMI connector KMS struct */
> -struct vc4_hdmi_connector {
> -       struct drm_connector base;
> -
> -       /* Since the connector is attached to just the one encoder,
> -        * this is the reference to it so we can do the best_encoder()
> -        * hook.
> -        */
> -       struct drm_encoder *encoder;
> -};
> -
> -static inline struct vc4_hdmi_connector *
> -to_vc4_hdmi_connector(struct drm_connector *connector)
> -{
> -       return container_of(connector, struct vc4_hdmi_connector, base);
> -}
> -
>  #endif /* _VC4_HDMI_H_ */
> --
> git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
