Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBFB87100AB
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 00:18:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8E4610E071;
	Wed, 24 May 2023 22:18:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it [5.144.164.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7F5E10E071
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 22:18:42 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 882053F80E;
 Thu, 25 May 2023 00:18:39 +0200 (CEST)
Date: Thu, 25 May 2023 00:18:38 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Subject: Re: [PATCH v13 07/10] drm/msm/dpu: always clear every individual
 pending flush mask
Message-ID: <mrtwanyokuulcqnug233aszp2ziiw4yafbwwauaxpdpin2jupa@qshyrz54tart>
References: <1684800039-18231-1-git-send-email-quic_khsieh@quicinc.com>
 <1684800039-18231-8-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1684800039-18231-8-git-send-email-quic_khsieh@quicinc.com>
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

On 2023-05-22 17:00:36, Kuogee Hsieh wrote:
> There are two tiers of pending flush control, top levle and

levle -> level

> individual hardware block. Currently only the top level of
> flush mask is reset to 0 but the individual pending flush masks
> of particular hardware blocks are left at their previous values,
> eventually accumulating all possible bit values and typically
> flushing more than necessary.
> Reset all individual hardware blocks flush masks to 0 to avoid

block, drop -s, because masks is plural.

> individual hardware block be triggered accidentally.

be = from being

triggered = flushed?

(You just said "individual hardware block", it would be okay to refer to
that with just "Reset all individual hardware block flush masks to 0 to
avoid accidentally flushing them.")

> 
> Changes in V13:
> -- rewording commi ttext

commit text

> -- add an empty space line as suggested
> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

So no fixes tag?

- Marijn

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> index 69d0ea2..64c21e0 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> @@ -100,6 +100,9 @@ static inline void dpu_hw_ctl_clear_pending_flush(struct dpu_hw_ctl *ctx)
>  	trace_dpu_hw_ctl_clear_pending_flush(ctx->pending_flush_mask,
>  				     dpu_hw_ctl_get_flush_register(ctx));
>  	ctx->pending_flush_mask = 0x0;
> +	ctx->pending_intf_flush_mask = 0;
> +	ctx->pending_wb_flush_mask = 0;
> +	ctx->pending_merge_3d_flush_mask = 0;
>  
>  	memset(ctx->pending_dspp_flush_mask, 0,
>  		sizeof(ctx->pending_dspp_flush_mask));
> -- 
> 2.7.4
> 
