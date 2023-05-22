Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4BE70CC1D
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 23:17:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0D2010E395;
	Mon, 22 May 2023 21:17:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it [5.144.164.165])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7661010E21C
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 21:17:34 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 770681FECE;
 Mon, 22 May 2023 23:17:31 +0200 (CEST)
Date: Mon, 22 May 2023 23:17:30 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Subject: Re: [PATCH v12 07/10] drm/msm/dpu: always clear every individual
 pending flush mask
Message-ID: <mhqmflms3wkfwcbyadilylymhvvn3gscr5f2klhhcmmildlnve@udfjrd7z7cqi>
References: <1684783853-22193-1-git-send-email-quic_khsieh@quicinc.com>
 <1684783853-22193-8-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1684783853-22193-8-git-send-email-quic_khsieh@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, quic_sbillaka@quicinc.com,
 quic_abhinavk@quicinc.com, andersson@kernel.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org, vkoul@kernel.org,
 agross@kernel.org, linux-arm-msm@vger.kernel.org, dmitry.baryshkov@linaro.org,
 quic_jesszhan@quicinc.com, swboyd@chromium.org, sean@poorly.run,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-05-22 12:30:50, Kuogee Hsieh wrote:
> There are two tiers of pending flush control, main controller and
> individual hardware block. Currently only the main controller of

I would call "main controller" "top level" instead, but not sure how the
hardware manual calls this?

> flush mask is reset to 0 but leave out some individual pending flush
> mask of particular hardware block keep previous value at
> clear_pending_flush().

... but the individual pending flush masks of particular hardware blocks
are left at their previous values, eventually accumulating all possible
bit values and typically flushing more than necessary.

> Reset all individual hardware blocks flush
> mask to 0 to avoid individual hardware block be triggered accidentally.

maskS*

> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Thanks!  Does this need any fixes tag?

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> index 69d0ea2..069c6e5 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> @@ -100,7 +100,9 @@ static inline void dpu_hw_ctl_clear_pending_flush(struct dpu_hw_ctl *ctx)
>  	trace_dpu_hw_ctl_clear_pending_flush(ctx->pending_flush_mask,
>  				     dpu_hw_ctl_get_flush_register(ctx));
>  	ctx->pending_flush_mask = 0x0;
> -
> +	ctx->pending_intf_flush_mask = 0;
> +	ctx->pending_wb_flush_mask = 0;
> +	ctx->pending_merge_3d_flush_mask = 0;

I wouldn't mind keeping an empty line here.

>  	memset(ctx->pending_dspp_flush_mask, 0,
>  		sizeof(ctx->pending_dspp_flush_mask));
>  }
> -- 
> 2.7.4
> 
