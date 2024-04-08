Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47CCE89CA04
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 18:45:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E4451127E1;
	Mon,  8 Apr 2024 16:45:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it [5.144.164.166])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2CA01127F1
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Apr 2024 16:45:09 +0000 (UTC)
Received: from SoMainline.org
 (2a02-a420-6-f162-164f-8aff-fee4-5930.mobile6.kpn.net
 [IPv6:2a02:a420:6:f162:164f:8aff:fee4:5930])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits)
 server-digest SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 336964057F;
 Mon,  8 Apr 2024 18:45:07 +0200 (CEST)
Date: Mon, 8 Apr 2024 18:45:05 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jonathan Marek <jonathan@marek.ca>
Subject: Re: [PATCH v3 3/6] drm/msm/dsi: set VIDEO_COMPRESSION_MODE_CTRL_WC
 (fix video mode DSC)
Message-ID: <qlabqrtsnw4mu23li6r6liujch5mf7n2bdbuuqrsukwfw24bmn@nyw5sandj2cu>
References: <20240403-msm-drm-dsc-dsi-video-upstream-v1-0-db5036443545@linaro.org>
 <20240403-msm-drm-dsc-dsi-video-upstream-v1-3-db5036443545@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240403-msm-drm-dsc-dsi-video-upstream-v1-3-db5036443545@linaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Can we drop (fix video mode DSC) from this patch title?  It looks like more
patches are required to get this done, such a mention is more something for the
cover letter.

We could also clarify further to "set Word Count for video-mode DSC".

- Marijn

On 2024-04-03 17:10:59, Jun Nie wrote:
> From: Jonathan Marek <jonathan@marek.ca>
> 
> Video mode DSC won't work if this field is not set correctly. Set it to fix
> video mode DSC (for slice_per_pkt==1 cases at least).
> 
> Fixes: 08802f515c3c ("drm/msm/dsi: Add support for DSC configuration")
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 2a0422cad6de..80ea4f1d8274 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -858,6 +858,7 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
>  	u32 slice_per_intf, total_bytes_per_intf;
>  	u32 pkt_per_line;
>  	u32 eol_byte_num;
> +	u32 bytes_per_pkt;
>  
>  	/* first calculate dsc parameters and then program
>  	 * compress mode registers
> @@ -865,6 +866,7 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
>  	slice_per_intf = msm_dsc_get_slices_per_intf(dsc, hdisplay);
>  
>  	total_bytes_per_intf = dsc->slice_chunk_size * slice_per_intf;
> +	bytes_per_pkt = dsc->slice_chunk_size; /* * slice_per_pkt; */
>  
>  	eol_byte_num = total_bytes_per_intf % 3;
>  
> @@ -902,6 +904,7 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
>  		dsi_write(msm_host, REG_DSI_COMMAND_COMPRESSION_MODE_CTRL, reg_ctrl);
>  		dsi_write(msm_host, REG_DSI_COMMAND_COMPRESSION_MODE_CTRL2, reg_ctrl2);
>  	} else {
> +		reg |= DSI_VIDEO_COMPRESSION_MODE_CTRL_WC(bytes_per_pkt);
>  		dsi_write(msm_host, REG_DSI_VIDEO_COMPRESSION_MODE_CTRL, reg);
>  	}
>  }
> 
> -- 
> 2.34.1
> 
