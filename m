Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC3D230B5C
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 15:23:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B6FC89FE3;
	Tue, 28 Jul 2020 13:23:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4293889FE3
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 13:23:35 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id r12so18235943wrj.13
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 06:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RVbcnjfZmdkWTayIDxfBVMqVlu5cuT3hIbVqa5TR/1k=;
 b=l/a67glzcc5AQ6/acG9FVfC2RJtuuPIoD5fiBv6VDXxVCxLzRofZr6tYMAwi+RVHqm
 LGGNIJtTApsfJEtkxt8+co8EYg8e5E96j18GWe26DOsYoViYehCeJJ/1iS5JJYTbd//5
 IEHnkwXARfBE2T/UoQK5VCeWULGDKZJogO5bgWkg99ghHE/mD0VbeKmM1lubsgCGG9B6
 1AyJ43cy0a2fFoMAzNjN2mfE5sgSwzaDeVq8KfcpD20QumElze+rGxRJAwHC4+0iLN4Y
 us/t3V0t9pz59c2lhHJ4wpguDVfuP87u6b6FmOac7lDFRT2jzv7X/TiNWfZOkDYf37mR
 KB3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RVbcnjfZmdkWTayIDxfBVMqVlu5cuT3hIbVqa5TR/1k=;
 b=TPKI1lzSAZBvHrdDa4pIcKfuQKoCHH69tZ3OTSuvpWSWzslnCYHQd2e6G06NAu9Xc3
 vnjuxlzmbynVVU8E9bM8VHw/DMhwGgod8ST7qXybfPM08wYFbaaqPu3T6UTpkvCKCVzd
 j47KCpGpwsysZncXWBx5YgEz+hWEdz3+IHUO8DKLsH8UM8YD3H+YYNwPdhii0hivJVZr
 GIa+QhDgZMBvULMqZjNLiTfrDe+14411La7+/alT9mFSeoRiK2cqvMeBuwR3Rmrh/clS
 EvVdYenaawCv43lh28jvV5dpzcm4M7Hm8FdlQxPCycTyzCF3/y0QMVV9n/VD0ciNW4BM
 133g==
X-Gm-Message-State: AOAM5335eSUWQ4v1QzaZMu49rkuzef5/d/gW9Vdh1ol8ovqGUpRPVHk5
 7sHKT4lyhp35cKCV6o+dC5s2x+Pyp/2y+idwp9NpyA==
X-Google-Smtp-Source: ABdhPJwKPzvOdxA6F4ifxZqzfCce2ctRWLCLhUEwv66hHxbniZKHfhme5B/iZKhFoSzPnF3OSINLAaKUATFpgkpPCWE=
X-Received: by 2002:adf:fe50:: with SMTP id m16mr7606176wrs.27.1595942613862; 
 Tue, 28 Jul 2020 06:23:33 -0700 (PDT)
MIME-Version: 1.0
References: <cover.7a1aa1784976093af26cb31fd283cf5b3ed568bb.1594230107.git-series.maxime@cerno.tech>
 <1b459f691ed99dcae2cea07e23ec1f5dd39837be.1594230107.git-series.maxime@cerno.tech>
In-Reply-To: <1b459f691ed99dcae2cea07e23ec1f5dd39837be.1594230107.git-series.maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 28 Jul 2020 14:23:17 +0100
Message-ID: <CAPY8ntC6=QO1wsEOj+c-nnJ4EHPaeUhRgAvE9gcWVv9KQbniKA@mail.gmail.com>
Subject: Re: [PATCH v4 58/78] drm/vc4: hdmi: Move CEC init to its own function
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
> The CEC init code was put directly into the bind function, which was quite
> inconsistent with how the audio support was done, and would prevent us from
> further changes to skip that initialisation entirely.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 108 +++++++++++++++++++++-------------
>  1 file changed, 67 insertions(+), 41 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index ef51eedaf75a..8cd08b541c14 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -1171,6 +1171,67 @@ static const struct cec_adap_ops vc4_hdmi_cec_adap_ops = {
>         .adap_log_addr = vc4_hdmi_cec_adap_log_addr,
>         .adap_transmit = vc4_hdmi_cec_adap_transmit,
>  };
> +
> +static int vc4_hdmi_cec_init(struct vc4_hdmi *vc4_hdmi)
> +{
> +       struct cec_connector_info conn_info;
> +       struct platform_device *pdev = vc4_hdmi->pdev;
> +       u32 value;
> +       int ret;
> +
> +       vc4_hdmi->cec_adap = cec_allocate_adapter(&vc4_hdmi_cec_adap_ops,
> +                                                 vc4_hdmi, "vc4",
> +                                                 CEC_CAP_DEFAULTS |
> +                                                 CEC_CAP_CONNECTOR_INFO, 1);
> +       ret = PTR_ERR_OR_ZERO(vc4_hdmi->cec_adap);
> +       if (ret < 0)
> +               return ret;
> +
> +       cec_fill_conn_info_from_drm(&conn_info, &vc4_hdmi->connector);
> +       cec_s_conn_info(vc4_hdmi->cec_adap, &conn_info);
> +
> +       HDMI_WRITE(HDMI_CEC_CPU_MASK_SET, 0xffffffff);
> +       value = HDMI_READ(HDMI_CEC_CNTRL_1);
> +       value &= ~VC4_HDMI_CEC_DIV_CLK_CNT_MASK;
> +       /*
> +        * Set the logical address to Unregistered and set the clock
> +        * divider: the hsm_clock rate and this divider setting will
> +        * give a 40 kHz CEC clock.
> +        */
> +       value |= VC4_HDMI_CEC_ADDR_MASK |
> +                (4091 << VC4_HDMI_CEC_DIV_CLK_CNT_SHIFT);
> +       HDMI_WRITE(HDMI_CEC_CNTRL_1, value);
> +       ret = devm_request_threaded_irq(&pdev->dev, platform_get_irq(pdev, 0),
> +                                       vc4_cec_irq_handler,
> +                                       vc4_cec_irq_handler_thread, 0,
> +                                       "vc4 hdmi cec", vc4_hdmi);
> +       if (ret)
> +               goto err_delete_cec_adap;
> +
> +       ret = cec_register_adapter(vc4_hdmi->cec_adap, &pdev->dev);
> +       if (ret < 0)
> +               goto err_delete_cec_adap;
> +
> +       return 0;
> +
> +err_delete_cec_adap:
> +       cec_delete_adapter(vc4_hdmi->cec_adap);
> +
> +       return ret;
> +}
> +
> +static void vc4_hdmi_cec_exit(struct vc4_hdmi *vc4_hdmi)
> +{
> +       cec_unregister_adapter(vc4_hdmi->cec_adap);
> +}
> +#else
> +static int vc4_hdmi_cec_init(struct vc4_hdmi *vc4_hdmi)
> +{
> +       return 0;
> +}
> +
> +static void vc4_hdmi_cec_exit(struct vc4_hdmi *vc4_hdmi) {};
> +
>  #endif
>
>  static int vc4_hdmi_build_regset(struct vc4_hdmi *vc4_hdmi,
> @@ -1250,9 +1311,6 @@ static int vc4_hdmi_init_resources(struct vc4_hdmi *vc4_hdmi)
>
>  static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
>  {
> -#ifdef CONFIG_DRM_VC4_HDMI_CEC
> -       struct cec_connector_info conn_info;
> -#endif
>         const struct vc4_hdmi_variant *variant = of_device_get_match_data(dev);
>         struct platform_device *pdev = to_platform_device(dev);
>         struct drm_device *drm = dev_get_drvdata(master);
> @@ -1332,43 +1390,13 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
>         if (ret)
>                 goto err_destroy_encoder;
>
> -#ifdef CONFIG_DRM_VC4_HDMI_CEC
> -       vc4_hdmi->cec_adap = cec_allocate_adapter(&vc4_hdmi_cec_adap_ops,
> -                                                 vc4_hdmi, "vc4",
> -                                                 CEC_CAP_DEFAULTS |
> -                                                 CEC_CAP_CONNECTOR_INFO, 1);
> -       ret = PTR_ERR_OR_ZERO(vc4_hdmi->cec_adap);
> -       if (ret < 0)
> -               goto err_destroy_conn;
> -
> -       cec_fill_conn_info_from_drm(&conn_info, &vc4_hdmi->connector);
> -       cec_s_conn_info(vc4_hdmi->cec_adap, &conn_info);
> -
> -       HDMI_WRITE(HDMI_CEC_CPU_MASK_SET, 0xffffffff);
> -       value = HDMI_READ(HDMI_CEC_CNTRL_1);
> -       value &= ~VC4_HDMI_CEC_DIV_CLK_CNT_MASK;
> -       /*
> -        * Set the logical address to Unregistered and set the clock
> -        * divider: the hsm_clock rate and this divider setting will
> -        * give a 40 kHz CEC clock.
> -        */
> -       value |= VC4_HDMI_CEC_ADDR_MASK |
> -                (4091 << VC4_HDMI_CEC_DIV_CLK_CNT_SHIFT);
> -       HDMI_WRITE(HDMI_CEC_CNTRL_1, value);
> -       ret = devm_request_threaded_irq(dev, platform_get_irq(pdev, 0),
> -                                       vc4_cec_irq_handler,
> -                                       vc4_cec_irq_handler_thread, 0,
> -                                       "vc4 hdmi cec", vc4_hdmi);
> +       ret = vc4_hdmi_cec_init(vc4_hdmi);
>         if (ret)
> -               goto err_delete_cec_adap;
> -       ret = cec_register_adapter(vc4_hdmi->cec_adap, dev);
> -       if (ret < 0)
> -               goto err_delete_cec_adap;
> -#endif
> +               goto err_destroy_conn;
>
>         ret = vc4_hdmi_audio_init(vc4_hdmi);
>         if (ret)
> -               goto err_destroy_encoder;
> +               goto err_free_cec;
>
>         vc4_debugfs_add_file(drm, variant->debugfs_name,
>                              vc4_hdmi_debugfs_regs,
> @@ -1376,12 +1404,10 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
>
>         return 0;
>
> -#ifdef CONFIG_DRM_VC4_HDMI_CEC
> -err_delete_cec_adap:
> -       cec_delete_adapter(vc4_hdmi->cec_adap);
> +err_free_cec:
> +       vc4_hdmi_cec_exit(vc4_hdmi);
>  err_destroy_conn:
>         vc4_hdmi_connector_destroy(&vc4_hdmi->connector);
> -#endif
>  err_destroy_encoder:
>         drm_encoder_cleanup(encoder);
>  err_unprepare_hsm:
> @@ -1422,7 +1448,7 @@ static void vc4_hdmi_unbind(struct device *dev, struct device *master,
>         kfree(vc4_hdmi->hdmi_regset.regs);
>         kfree(vc4_hdmi->hd_regset.regs);
>
> -       cec_unregister_adapter(vc4_hdmi->cec_adap);
> +       vc4_hdmi_cec_exit(vc4_hdmi);
>         vc4_hdmi_connector_destroy(&vc4_hdmi->connector);
>         drm_encoder_cleanup(&vc4_hdmi->encoder.base.base);
>
> --
> git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
