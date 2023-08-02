Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F19976D81E
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 21:46:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2975310E0F0;
	Wed,  2 Aug 2023 19:46:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67EA810E0F0
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Aug 2023 19:46:03 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 8CF743F6C7;
 Wed,  2 Aug 2023 21:46:01 +0200 (CEST)
Date: Wed, 2 Aug 2023 21:46:00 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2 2/2] drm/msm/dpu: fix DSC 1.2 enc subblock length
Message-ID: <qphzjpmmqfhti3tblhtv26xl4erzyi6xi6piyjvdzhji6bdnik@ivsgw364ea5u>
References: <20230802183655.4188640-1-dmitry.baryshkov@linaro.org>
 <20230802183655.4188640-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230802183655.4188640-2-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-08-02 21:36:55, Dmitry Baryshkov wrote:
> Both struct dpu_dsc_sub_blks instances declare enc subblock length to be
> 0x100, while the actual length is 0x9c (last register having offset 0x98).
> Reduce subblock length to remove the empty register space from being
> dumped.
> 
> Fixes: 0d1b10c63346 ("drm/msm/dpu: add DSC 1.2 hw blocks for relevant chipsets")
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> 
> Changes since v1:
>  - Rebased on top of the catalog changes
> 
> ---
> 
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 3ff07d7cbf4b..f1bac5e88249 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -456,12 +456,12 @@ static const struct dpu_pingpong_sub_blks sc7280_pp_sblk = {
>   * DSC sub blocks config
>   *************************************************************/
>  static const struct dpu_dsc_sub_blks dsc_sblk_0 = {
> -	.enc = {.name = "enc", .base = 0x100, .len = 0x100},
> +	.enc = {.name = "enc", .base = 0x100, .len = 0x9c},
>  	.ctl = {.name = "ctl", .base = 0xF00, .len = 0x10},

For the time being only ctl register 0x00 and 0x04 is touched,
DATA_IN_SWAP and CLK_CTRL at 0x08 and 0x0c are defined but not used,
though it might still be useful to see their current value in the dump.

- Marijn

>  };
>  
>  static const struct dpu_dsc_sub_blks dsc_sblk_1 = {
> -	.enc = {.name = "enc", .base = 0x200, .len = 0x100},
> +	.enc = {.name = "enc", .base = 0x200, .len = 0x9c},
>  	.ctl = {.name = "ctl", .base = 0xF80, .len = 0x10},
>  };
>  
> -- 
> 2.39.2
> 
