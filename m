Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F6C5F5AA2
	for <lists+dri-devel@lfdr.de>; Wed,  5 Oct 2022 21:32:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDA5110E765;
	Wed,  5 Oct 2022 19:31:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A28EF10E769
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Oct 2022 19:31:55 +0000 (UTC)
Received: by mail-yb1-xb2b.google.com with SMTP id k3so19703578ybk.9
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Oct 2022 12:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=pNtNncR0wpG+RZXZr5KeeJhXaAoqohkUyg5Z94mN40s=;
 b=eze16KyzdJ5hwJ2phuh1n3FB+XyFgZfEOKeoxcX86f8I4EsycFU0JzP6v64Z9I7hwM
 luAR1jmz4nZ0lYx6P+TN4JE4xM5GA1jl4RhGpNZQMa29n9eOmAcWnmzmfRDDQdNwHiiP
 O8C2MeRIDJm27WzWNXQSciNu0lXJPOik22kTXE/+VW/jbhw5SGoAjOPau9aGDSfZWL2g
 yZ63Pe9JvG8zgT0tmhdhBvMXGjOK2fcjiaxmp4N7GwFnY1+M67rO4c8BLep86Rs7DV/h
 GBLefRqpEmw/W5Emf7k2pBk4r0jjg68jqBKGoa6ji/QfheMWW5hyr73hB9AkDGuJlnxJ
 ImLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=pNtNncR0wpG+RZXZr5KeeJhXaAoqohkUyg5Z94mN40s=;
 b=ZqnlQ7jq4QRupJmoUxQAYYueM7GRFGke9C8ID7FpVvDp/D5lltXm9ATsudyMkXfhJa
 JczHdvdpmmVCEHxwmClT3Pqu8viYgxd+vFeObSNU7rHxDXGJ9RCcMffa4i2j9+uF0hJY
 +9MJhV7Rg/7o0DwQrQGD2sb319Yrjj72XjnhEROiwBCBQDfaN5zYsTPCU0FiPGL/VO6o
 zbIFHskt1zUr0PyZj56NNcTtYmdnflwDuEjP/DmQFmFFwkrsSjWFW+KbCPX7tryI7B5L
 h25t69fsI0PpndZmawGPOUBEJA1Exg4ornCOQ9p913WZDylyZAnyhwDIHo6kMIrOH7AZ
 Gfnw==
X-Gm-Message-State: ACrzQf2EFeI0F3rikUdxmflTHaJmC9piDWikxM5uM+CR4H3+AuQY1XHg
 cIRJyzCMBX0d5ldsDEPRcPySe0T/+AE7v/Q6ebxk7Q==
X-Google-Smtp-Source: AMsMyM7CcJKKTb5CQJ62Px6sdKcviE/zaAzyLJdaB+lxId5akeMpt+XTMLRld1K+DLepysr5m0r1h7WGBGRvkIxIwtg=
X-Received: by 2002:a5b:c:0:b0:6bd:f84c:b63e with SMTP id
 a12-20020a5b000c000000b006bdf84cb63emr1449786ybp.275.1664998314594; 
 Wed, 05 Oct 2022 12:31:54 -0700 (PDT)
MIME-Version: 1.0
References: <20221005181657.784375-1-marijn.suijten@somainline.org>
 <20221005181657.784375-6-marijn.suijten@somainline.org>
In-Reply-To: <20221005181657.784375-6-marijn.suijten@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 5 Oct 2022 22:31:43 +0300
Message-ID: <CAA8EJpr=0w0KReqNW2jP8DzvXLgo_o6bKmwMOed2sXb6d8HKhg@mail.gmail.com>
Subject: Re: [PATCH v2 5/7] drm/msm/dsi: Account for DSC's bits_per_pixel
 having 4 fractional bits
To: Marijn Suijten <marijn.suijten@somainline.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: freedreno@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>, linux-arm-msm@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Vinod Koul <vkoul@kernel.org>,
 dri-devel@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 David Airlie <airlied@linux.ie>, Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Javier Martinez Canillas <javierm@redhat.com>, phone-devel@vger.kernel.org,
 Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 5 Oct 2022 at 21:17, Marijn Suijten
<marijn.suijten@somainline.org> wrote:
>
> drm_dsc_config's bits_per_pixel field holds a fractional value with 4
> bits, which all panel drivers should adhere to for
> drm_dsc_pps_payload_pack() to generate a valid payload.  All code in the
> DSI driver here seems to assume that this field doesn't contain any
> fractional bits, hence resulting in the wrong values being computed.
> Since none of the calculations leave any room for fractional bits or
> seem to indicate any possible area of support, disallow such values
> altogether.
>
> Fixes: b9080324d6ca ("drm/msm/dsi: add support for dsc data")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 25 +++++++++++++++++--------
>  1 file changed, 17 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index f42794cdd4c1..4717d49d76be 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -33,7 +33,7 @@
>
>  #define DSI_RESET_TOGGLE_DELAY_MS 20
>
> -static int dsi_populate_dsc_params(struct drm_dsc_config *dsc);
> +static int dsi_populate_dsc_params(struct msm_dsi_host *msm_host, struct drm_dsc_config *dsc);
>
>  static int dsi_get_version(const void __iomem *base, u32 *major, u32 *minor)
>  {
> @@ -908,6 +908,7 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>         u32 va_end = va_start + mode->vdisplay;
>         u32 hdisplay = mode->hdisplay;
>         u32 wc;
> +       int ret;
>
>         DBG("");
>
> @@ -943,7 +944,9 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>                 /* we do the calculations for dsc parameters here so that
>                  * panel can use these parameters
>                  */
> -               dsi_populate_dsc_params(dsc);
> +               ret = dsi_populate_dsc_params(msm_host, dsc);
> +               if (ret)
> +                       return;
>
>                 /* Divide the display by 3 but keep back/font porch and
>                  * pulse width same
> @@ -1769,7 +1772,7 @@ static char bpg_offset[DSC_NUM_BUF_RANGES] = {
>         2, 0, 0, -2, -4, -6, -8, -8, -8, -10, -10, -12, -12, -12, -12
>  };
>
> -static int dsi_populate_dsc_params(struct drm_dsc_config *dsc)
> +static int dsi_populate_dsc_params(struct msm_dsi_host *msm_host, struct drm_dsc_config *dsc)
>  {
>         int mux_words_size;
>         int groups_per_line, groups_total;
> @@ -1780,6 +1783,12 @@ static int dsi_populate_dsc_params(struct drm_dsc_config *dsc)
>         int data;
>         int final_value, final_scale;
>         int i;
> +       u16 bpp = dsc->bits_per_pixel >> 4;
> +
> +       if (dsc->bits_per_pixel & 0xf) {
> +               DRM_DEV_ERROR(&msm_host->pdev->dev, "DSI does not support fractional bits_per_pixel\n");
> +               return -EINVAL;
> +       }
>
>         dsc->rc_model_size = 8192;
>         dsc->first_line_bpg_offset = 12;
> @@ -1801,7 +1810,7 @@ static int dsi_populate_dsc_params(struct drm_dsc_config *dsc)
>         }
>
>         dsc->initial_offset = 6144; /* Not bpp 12 */
> -       if (dsc->bits_per_pixel != 8)
> +       if (bpp != 8)
>                 dsc->initial_offset = 2048;     /* bpp = 12 */
>
>         mux_words_size = 48;            /* bpc == 8/10 */
> @@ -1824,14 +1833,14 @@ static int dsi_populate_dsc_params(struct drm_dsc_config *dsc)
>          * params are calculated
>          */
>         groups_per_line = DIV_ROUND_UP(dsc->slice_width, 3);
> -       dsc->slice_chunk_size = DIV_ROUND_UP(dsc->slice_width * dsc->bits_per_pixel, 8);
> +       dsc->slice_chunk_size = DIV_ROUND_UP(dsc->slice_width * bpp, 8);

I'd still prefer if we can get closer to drm_dsc_compute_rc_parameters().
The mentioned function has the following code:

vdsc_cfg->slice_chunk_size = DIV_ROUND_UP(vdsc_cfg->slice_width *

vdsc_cfg->bits_per_pixel,
                                                          (8 * 16));

In fact, could you please take a look if we can switch to using this
function and drop our code?

>
>         /* rbs-min */
>         min_rate_buffer_size =  dsc->rc_model_size - dsc->initial_offset +
> -                               dsc->initial_xmit_delay * dsc->bits_per_pixel +
> +                               dsc->initial_xmit_delay * bpp +
>                                 groups_per_line * dsc->first_line_bpg_offset;
>
> -       hrd_delay = DIV_ROUND_UP(min_rate_buffer_size, dsc->bits_per_pixel);
> +       hrd_delay = DIV_ROUND_UP(min_rate_buffer_size, bpp);
>
>         dsc->initial_dec_delay = hrd_delay - dsc->initial_xmit_delay;
>
> @@ -1854,7 +1863,7 @@ static int dsi_populate_dsc_params(struct drm_dsc_config *dsc)
>         data = 2048 * (dsc->rc_model_size - dsc->initial_offset + num_extra_mux_bits);
>         dsc->slice_bpg_offset = DIV_ROUND_UP(data, groups_total);
>
> -       data = dsc->initial_xmit_delay * dsc->bits_per_pixel;
> +       data = dsc->initial_xmit_delay * bpp;
>         final_value =  dsc->rc_model_size - data + num_extra_mux_bits;
>         dsc->final_offset = final_value;
>
> --
> 2.38.0
>


-- 
With best wishes
Dmitry
