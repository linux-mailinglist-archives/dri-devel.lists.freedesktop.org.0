Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6DB56F6201
	for <lists+dri-devel@lfdr.de>; Thu,  4 May 2023 01:23:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6A7210E360;
	Wed,  3 May 2023 23:23:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay07.th.seeweb.it (relay07.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::168])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DE3489101
 for <dri-devel@lists.freedesktop.org>; Wed,  3 May 2023 23:23:22 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id A401940233;
 Thu,  4 May 2023 01:23:19 +0200 (CEST)
Date: Thu, 4 May 2023 01:23:18 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Subject: Re: [PATCH v4 2/7] drm/msm/dpu: add DPU_PINGPONG_DSC feature bit
Message-ID: <q4csrdr4yib5nc5be5kxq4ejn2xqpe4jddtdx3tyfkwzpke4ar@6k2nmqqwwbpq>
References: <1683144639-26614-1-git-send-email-quic_khsieh@quicinc.com>
 <1683144639-26614-3-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1683144639-26614-3-git-send-email-quic_khsieh@quicinc.com>
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
 swboyd@chromium.org, sean@poorly.run, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Kuogee,

On 2023-05-03 13:10:34, Kuogee Hsieh wrote:
> Legacy DPU (DPU < 7.0.0) requires PP block to be involved during

Nit: I wouldn't call it "legacy" (that's not really relevant here), just

    DPU < 7.0.0 requires the PINGPONG block ...

> DSC setting up. Since then, enable and start the DSC encoder engine

then -> since DPU 7.0.0

enabling* and starting* the DSC encoder engine

> had moved to INTF with helps of flush mechanism. This patch adds

s/had/has, or remove had altogether

"with the help of a/the"

This patch adds a (new)*, but you shouldn't write "this patch" at all:

https://www.kernel.org/doc/html/latest/process/submitting-patches.html#describe-your-changes

> DPU_PINGPONG_DSC feature bit to indicate that both
> dpu_hw_pp_setup_dsc() and dpu_hw_pp_dsc_enable() pingpong ops
> functions are required to complete DSC datapath setup and start
> DSC engine.

... which should only be set on DPU < 7.0.0, but it doesn't seem like
"complete DSC datapath" really explains the goal of this patch (namely
disabling it on DPU >= 7.0.0, by only making it available on DPU <
7.0.0).

How about replacing this whole sentence, starting at "This patch", with:

    Add a DPU_PINGPONG_DSC feature bit to restrict the availability of
    dpu_hw_pp_setup_dsc() and dpu_hw_pp_dsc_{enable,disable}() on the
    PINGPONG block to DPU < 7.0.0 hardware, as the registers are not
    available [in the PINGPONG block] on DPU 7.0.0 and higher anymore.
    Existing call-sites to these callbacks already skip calling into
    them if the function pointer is NULL.

How does that sound to you?

> Changes in v4:
> -- add more details commit text
> 
> Reported-by: Marijn Suijten <marijn.suijten@somainline.org>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h  | 2 ++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c | 9 ++++++---
>  2 files changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index 71584cd..5d210f3 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -144,6 +144,7 @@ enum {
>   * @DPU_PINGPONG_SPLIT      PP block supports split fifo
>   * @DPU_PINGPONG_SLAVE      PP block is a suitable slave for split fifo
>   * @DPU_PINGPONG_DITHER,    Dither blocks
> + * @DPU_PINGPONG_DSC,       PP ops functions required for DSC

As said in v3, drop the comma.

>   * @DPU_PINGPONG_MAX
>   */
>  enum {
> @@ -152,6 +153,7 @@ enum {
>  	DPU_PINGPONG_SPLIT,
>  	DPU_PINGPONG_SLAVE,
>  	DPU_PINGPONG_DITHER,
> +	DPU_PINGPONG_DSC,
>  	DPU_PINGPONG_MAX
>  };
>  
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> index 3822e06..f255a04 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> @@ -264,9 +264,12 @@ static void _setup_pingpong_ops(struct dpu_hw_pingpong *c,
>  	c->ops.get_autorefresh = dpu_hw_pp_get_autorefresh_config;
>  	c->ops.poll_timeout_wr_ptr = dpu_hw_pp_poll_timeout_wr_ptr;
>  	c->ops.get_line_count = dpu_hw_pp_get_line_count;
> -	c->ops.setup_dsc = dpu_hw_pp_setup_dsc;
> -	c->ops.enable_dsc = dpu_hw_pp_dsc_enable;
> -	c->ops.disable_dsc = dpu_hw_pp_dsc_disable;
> +
> +	if (features & BIT(DPU_PINGPONG_DSC)) {

To stick with the style of this function, this should use test_bit()
like below for DPU_PINGPONG_DITHER.

Unless maintainers agree that we should replace all current uses in DPU
with `x & BIT(..)`.

- Marijn

> +		c->ops.setup_dsc = dpu_hw_pp_setup_dsc;
> +		c->ops.enable_dsc = dpu_hw_pp_dsc_enable;
> +		c->ops.disable_dsc = dpu_hw_pp_dsc_disable;
> +	}
>  
>  	if (test_bit(DPU_PINGPONG_DITHER, &features))
>  		c->ops.setup_dither = dpu_hw_pp_setup_dither;
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
