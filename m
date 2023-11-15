Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B7897EBE37
	for <lists+dri-devel@lfdr.de>; Wed, 15 Nov 2023 08:50:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15B4D10E4F9;
	Wed, 15 Nov 2023 07:50:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com
 [IPv6:2607:f8b0:4864:20::1130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D110410E4EF
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Nov 2023 07:50:05 +0000 (UTC)
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-5be6d6c04bfso67481587b3.3
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Nov 2023 23:50:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700034605; x=1700639405; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=szNzf3TziCDjn07w7Co5x4GuOTJZ147mPXn70ydV0Fc=;
 b=Xxq0j7/1JjqzgAVkS4Jjm4oNb/PeZbra94qXUgZ2FeFce0v0YQff+QAC02TCcnN8qH
 jfiNCU6aOrNg79Mv9y434MTTXyxHbVxuypzblMtUt5WCr8HoIUyRx/3JKlFhUxIyxzDm
 E96QvLlxPvV9mi+YIhreVWtCFciWby1v2kcx9hceaKIxi8vSiwEFcMzzi4MvxPXC0Ylw
 1iLZOmyumDbtJ6y908medXrRTSrOjrpxIgyYyKgVWLLF1IbGeFrXOQzfywKDNVFejLBV
 zhhySnXFd4uf2o5dUcauFrpk89ll/n3+KDWWnGk2FNVgZlB4wdlZJj5N0FA6ERJ+jIZp
 cd5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700034605; x=1700639405;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=szNzf3TziCDjn07w7Co5x4GuOTJZ147mPXn70ydV0Fc=;
 b=aWKTBEzL74b9Xsme6zmSt8VFd97X5TOUleYUzJ+PqpwvWmgTe5r6eSJpF6U8z5TanE
 Wb8gTGKwtF8cpDpath2fvE4YA3DbUoMeKcJoRXNUYXTQn3Y+NANlcuz+2fJOpyTPqkn9
 waBZ1BPLgxxgpgSXeSrrEUPCbwruExCY9TeVMjlTMDXsyOlSyxt/omUSbOcvhwK4XlHX
 FK3FZ3D/o69Amy5nV7B3+V1DMa/xskDp3xEpUAqAymKDReKH2k+KobMw+eiTHhr5vgA6
 Fv1mP6rFC2vgfum3ysUrx+nAm0oyVcSwDUDaigErOAqYcs8LgPJhYxaHV77ZvjEmD1En
 EsPw==
X-Gm-Message-State: AOJu0Ywmey4k80X8dlyLLSR4MfM3c8XbOfoTDYoB5anCXLhqC6WCZ6WF
 R7FMo1z/v9AL8UPj1slpBEODnCvmbg8Pn9Rbfzf8Yw==
X-Google-Smtp-Source: AGHT+IEc0IFGiK/VHdrtUp2bYG5Nd+RNP50AF9G1vJZw1swnpfCR6PG3rbrYblbH8j939AdgT7mcBftCJHWCRtrOUS0=
X-Received: by 2002:a81:8ac5:0:b0:5a8:22bc:1867 with SMTP id
 a188-20020a818ac5000000b005a822bc1867mr9183960ywg.26.1700034604843; Tue, 14
 Nov 2023 23:50:04 -0800 (PST)
MIME-Version: 1.0
References: <20231114225857.19702-1-jonathan@marek.ca>
 <20231114225857.19702-6-jonathan@marek.ca>
In-Reply-To: <20231114225857.19702-6-jonathan@marek.ca>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 15 Nov 2023 09:49:53 +0200
Message-ID: <CAA8EJpr7Qx356OM7W+3iumwgBqXyjM3_zuKnEGqM85JZ+BsE6A@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] drm/msm/dsi: support DSC configurations with
 slice_per_pkt > 1
To: Jonathan Marek <jonathan@marek.ca>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, freedreno@lists.freedesktop.org,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Jiasheng Jiang <jiasheng@iscas.ac.cn>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Maxime Ripard <mripard@kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 15 Nov 2023 at 01:00, Jonathan Marek <jonathan@marek.ca> wrote:
>
> Add a dsc_slice_per_pkt field to mipi_dsi_device struct and the necessary
> changes to msm driver to support this field.
>
> Note that the removed "pkt_per_line = slice_per_intf * slice_per_pkt"
> comment is incorrect.
>
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 25 ++++++++++---------------
>  include/drm/drm_mipi_dsi.h         |  1 +
>  2 files changed, 11 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 842765063b1b..892a463a7e03 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -161,6 +161,7 @@ struct msm_dsi_host {
>
>         struct drm_display_mode *mode;
>         struct drm_dsc_config *dsc;
> +       unsigned int dsc_slice_per_pkt;
>
>         /* connected device info */
>         unsigned int channel;
> @@ -857,17 +858,10 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
>         slice_per_intf = msm_dsc_get_slices_per_intf(dsc, hdisplay);
>
>         total_bytes_per_intf = dsc->slice_chunk_size * slice_per_intf;
> -       bytes_per_pkt = dsc->slice_chunk_size; /* * slice_per_pkt; */
> +       bytes_per_pkt = dsc->slice_chunk_size * msm_host->dsc_slice_per_pkt;
>
>         eol_byte_num = total_bytes_per_intf % 3;
> -
> -       /*
> -        * Typically, pkt_per_line = slice_per_intf * slice_per_pkt.
> -        *
> -        * Since the current driver only supports slice_per_pkt = 1,
> -        * pkt_per_line will be equal to slice per intf for now.
> -        */
> -       pkt_per_line = slice_per_intf;
> +       pkt_per_line = slice_per_intf / msm_host->dsc_slice_per_pkt;
>
>         if (is_cmd_mode) /* packet data type */
>                 reg = DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM0_DATATYPE(MIPI_DSI_DCS_LONG_WRITE);
> @@ -1004,12 +998,8 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>                 else
>                         /*
>                          * When DSC is enabled, WC = slice_chunk_size * slice_per_pkt + 1.
> -                        * Currently, the driver only supports default value of slice_per_pkt = 1
> -                        *
> -                        * TODO: Expand mipi_dsi_device struct to hold slice_per_pkt info
> -                        *       and adjust DSC math to account for slice_per_pkt.
>                          */
> -                       wc = msm_host->dsc->slice_chunk_size + 1;
> +                       wc = msm_host->dsc->slice_chunk_size * msm_host->dsc_slice_per_pkt + 1;
>
>                 dsi_write(msm_host, REG_DSI_CMD_MDP_STREAM0_CTRL,
>                         DSI_CMD_MDP_STREAM0_CTRL_WORD_COUNT(wc) |
> @@ -1636,8 +1626,13 @@ static int dsi_host_attach(struct mipi_dsi_host *host,
>         msm_host->lanes = dsi->lanes;
>         msm_host->format = dsi->format;
>         msm_host->mode_flags = dsi->mode_flags;
> -       if (dsi->dsc)
> +       if (dsi->dsc) {
>                 msm_host->dsc = dsi->dsc;
> +               msm_host->dsc_slice_per_pkt = dsi->dsc_slice_per_pkt;
> +               /* for backwards compatibility, assume 1 if not set */
> +               if (!msm_host->dsc_slice_per_pkt)
> +                       msm_host->dsc_slice_per_pkt = 1;
> +       }
>
>         /* Some gpios defined in panel DT need to be controlled by host */
>         ret = dsi_host_init_panel_gpios(msm_host, &dsi->dev);
> diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
> index c9df0407980c..3e32fa52d94b 100644
> --- a/include/drm/drm_mipi_dsi.h
> +++ b/include/drm/drm_mipi_dsi.h
> @@ -193,6 +193,7 @@ struct mipi_dsi_device {
>         unsigned long hs_rate;
>         unsigned long lp_rate;
>         struct drm_dsc_config *dsc;
> +       unsigned int dsc_slice_per_pkt;

Missing documentation. Also maybe this chunk should go into a separate
patch so that it can gain more attention from DRM maintainers?

>  };
>
>  #define MIPI_DSI_MODULE_PREFIX "mipi-dsi:"
> --
> 2.26.1
>


-- 
With best wishes
Dmitry
