Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B084BABF9
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 22:44:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FF5710E854;
	Thu, 17 Feb 2022 21:44:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it [5.144.164.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 328A210E849
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 21:44:22 +0000 (UTC)
Received: from SoMainline.org (94-209-165-62.cable.dynamic.v4.ziggo.nl
 [94.209.165.62])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 1F7943F7D5;
 Thu, 17 Feb 2022 22:44:19 +0100 (CET)
Date: Thu, 17 Feb 2022 22:44:17 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Vinod Koul <vkoul@kernel.org>
Subject: Re: [REPOST PATCH v4 10/13] drm/msm/disp/dpu1: Add support for DSC
 in topology
Message-ID: <20220217214417.hb6sdx53cs36us6j@SoMainline.org>
References: <20220210103423.271016-1-vkoul@kernel.org>
 <20220210103423.271016-11-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220210103423.271016-11-vkoul@kernel.org>
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
Cc: Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, dri-devel@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-02-10 16:04:20, Vinod Koul wrote:
> For DSC to work we typically need a 2,2,1 configuration. This should
> suffice for resolutions up to 4k. For more resolutions like 8k this won't
> work.
> 
> Also, it is better to use 2 LMs and DSC instances as half width results
> in lesser power consumption as compared to single LM, DSC at full width.
> 
> The panel has been tested only with 2,2,1 configuration, so for
> now we blindly create 2,2,1 topology when DSC is enabled
> 
> Co-developed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 13 +++++++++++++
>  drivers/gpu/drm/msm/msm_drv.h               |  2 ++
>  2 files changed, 15 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 95a7bf362e81..13ccb7b3cce5 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -574,8 +574,21 @@ static struct msm_display_topology dpu_encoder_get_topology(
>  	topology.num_enc = 0;
>  	topology.num_intf = intf_count;
>  
> +	if (dpu_enc->dsc) {
> +		/* In case of Display Stream Compression DSC, we would use
> +		 * 2 encoders, 2 line mixers and 1 interface

LM is a layer mixer, not a line mixer, right?

- Marijn

> +		 * this is power optimal and can drive up to (including) 4k
> +		 * screens
> +		 */
> +		topology.num_enc = 2;
> +		topology.num_dsc = 2;
> +		topology.num_intf = 1;
> +		topology.num_lm = 2;
> +	}
> +
>  	return topology;
>  }
> +
>  static int dpu_encoder_virt_atomic_check(
>  		struct drm_encoder *drm_enc,
>  		struct drm_crtc_state *crtc_state,
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index 6425a42e997c..994d895d1a47 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -103,12 +103,14 @@ enum msm_event_wait {
>   * @num_enc:      number of compression encoder blocks used
>   * @num_intf:     number of interfaces the panel is mounted on
>   * @num_dspp:     number of dspp blocks used
> + * @num_dsc:      number of Display Stream Compression (DSC) blocks used
>   */
>  struct msm_display_topology {
>  	u32 num_lm;
>  	u32 num_enc;
>  	u32 num_intf;
>  	u32 num_dspp;
> +	u32 num_dsc;
>  };
>  
>  /**
> -- 
> 2.31.1
> 
