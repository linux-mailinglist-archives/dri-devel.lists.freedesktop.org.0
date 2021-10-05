Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3BF342328A
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 22:59:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 283DD6EC46;
	Tue,  5 Oct 2021 20:59:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3FA66F5FE
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Oct 2021 20:59:26 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1633467569; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=fm5FQYtCALSKM1ZR93d4V0E1g2kpfnAO1WvTCSbTa4A=;
 b=KyMnG9F/6qlfpItnWSfQ4We3ONO7vTZpUekKt0wdivk+lmytD3meLFDvw7Bor+jxfqJ9AXM3
 YMWB4XXRvRoF7v0R+JlIgFhl8T6gP+Ca+HMHzQ1CqLnpcJ0HzY1R53w6pk1At6O0s9xtApQx
 7CaOTzJbcPb3mxeWCTDPsky7H2g=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 615cbca7ff0285fb0aa3c44f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 05 Oct 2021 20:59:19
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 28CAAC43460; Tue,  5 Oct 2021 20:59:19 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 8BB87C4338F;
 Tue,  5 Oct 2021 20:59:18 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue, 05 Oct 2021 13:59:18 -0700
From: abhinavk@codeaurora.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, David
 Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring
 <robh+dt@kernel.org>, Stephen Boyd <swboyd@chromium.org>, Kuogee Hsieh
 <khsieh@codeaurora.org>, Tanmay Shah <tanmay@codeaurora.org>, Chandan
 Uddaraju <chandanu@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [Freedreno] [PATCH v3 3/5] drm/msm/dp: Refactor ioremap wrapper
In-Reply-To: <20211001174400.981707-4-bjorn.andersson@linaro.org>
References: <20211001174400.981707-1-bjorn.andersson@linaro.org>
 <20211001174400.981707-4-bjorn.andersson@linaro.org>
Message-ID: <e5556fc02b53cfd613287bea47e12023@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
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

On 2021-10-01 10:43, Bjorn Andersson wrote:
> In order to deal with multiple memory ranges in the following commit
> change the ioremap wrapper to not poke directly into the dss_io_data
> struct.
> 
> While at it, devm_ioremap_resource() already prints useful error
> messages on failure, so omit the unnecessary prints from the caller.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
> 
> Changes since v2:
> - Switched to devm_platform_get_and_ioremap_resource()
> 
>  drivers/gpu/drm/msm/dp/dp_parser.c | 35 ++++++++++--------------------
>  drivers/gpu/drm/msm/dp/dp_parser.h |  2 +-
>  2 files changed, 12 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c
> b/drivers/gpu/drm/msm/dp/dp_parser.c
> index c064ced78278..c05ba1990218 100644
> --- a/drivers/gpu/drm/msm/dp/dp_parser.c
> +++ b/drivers/gpu/drm/msm/dp/dp_parser.c
> @@ -19,40 +19,27 @@ static const struct dp_regulator_cfg 
> sdm845_dp_reg_cfg = {
>  	},
>  };
> 
> -static int msm_dss_ioremap(struct platform_device *pdev,
> -				struct dss_io_data *io_data)
> +static void __iomem *dp_ioremap(struct platform_device *pdev, int
> idx, size_t *len)
>  {
> -	struct resource *res = NULL;
> +	struct resource *res;
> +	void __iomem *base;
> 
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	if (!res) {
> -		DRM_ERROR("%pS->%s: msm_dss_get_res failed\n",
> -			__builtin_return_address(0), __func__);
> -		return -ENODEV;
> -	}
> -
> -	io_data->len = (u32)resource_size(res);
> -	io_data->base = devm_ioremap(&pdev->dev, res->start, io_data->len);
> -	if (!io_data->base) {
> -		DRM_ERROR("%pS->%s: ioremap failed\n",
> -			__builtin_return_address(0), __func__);
> -		return -EIO;
> -	}
> +	base = devm_platform_get_and_ioremap_resource(pdev, idx, &res);
> +	if (!IS_ERR(base))
> +		*len = resource_size(res);
> 
> -	return 0;
> +	return base;
>  }
> 
>  static int dp_parser_ctrl_res(struct dp_parser *parser)
>  {
> -	int rc = 0;
>  	struct platform_device *pdev = parser->pdev;
>  	struct dp_io *io = &parser->io;
> +	struct dss_io_data *dss = &io->dp_controller;
> 
> -	rc = msm_dss_ioremap(pdev, &io->dp_controller);
> -	if (rc) {
> -		DRM_ERROR("unable to remap dp io resources, rc=%d\n", rc);
> -		return rc;
> -	}
> +	dss->base = dp_ioremap(pdev, 0, &dss->len);
> +	if (IS_ERR(dss->base))
> +		return PTR_ERR(dss->base);
> 
>  	io->phy = devm_phy_get(&pdev->dev, "dp");
>  	if (IS_ERR(io->phy))
> diff --git a/drivers/gpu/drm/msm/dp/dp_parser.h
> b/drivers/gpu/drm/msm/dp/dp_parser.h
> index 34b49628bbaf..dc62e70b1640 100644
> --- a/drivers/gpu/drm/msm/dp/dp_parser.h
> +++ b/drivers/gpu/drm/msm/dp/dp_parser.h
> @@ -26,7 +26,7 @@ enum dp_pm_type {
>  };
> 
>  struct dss_io_data {
> -	u32 len;
> +	size_t len;
>  	void __iomem *base;
>  };
