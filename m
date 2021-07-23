Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F08B53D4165
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 22:16:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DC5A6ECE8;
	Fri, 23 Jul 2021 20:16:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFD726ECE8
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 20:16:51 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1627071411; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=HRN/UDX2HXLKNeRvuGxP4vsevVc7LCnZM359D66adWU=;
 b=QRKBZhVAM7rDYleLWph0PWi0CGRdlamvG0+y4uf3jny/kvfxFtBM42oihjnkBMvxSIkQBVrS
 yQLtAl4tUUNREkWAq9GgaW2dwzpKQ3Rs6tzgI4P0r1ANXZnJPQ1CUDnuE5I1XBxWSNpXjAIU
 vfpBNiNe71eP6d5KeozLF+yigd0=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 60fb23b2d0100c7cf929e971 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 23 Jul 2021 20:16:50
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 7144EC43144; Fri, 23 Jul 2021 20:16:50 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 63712C433D3;
 Fri, 23 Jul 2021 20:16:49 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Fri, 23 Jul 2021 13:16:49 -0700
From: abhinavk@codeaurora.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [Freedreno] [PATCH 3/5] drm/msm/dp: Refactor ioremap wrapper
In-Reply-To: <20210722024227.3313096-4-bjorn.andersson@linaro.org>
References: <20210722024227.3313096-1-bjorn.andersson@linaro.org>
 <20210722024227.3313096-4-bjorn.andersson@linaro.org>
Message-ID: <a9136a5ecdda1a60e9b6ea03fece6150@codeaurora.org>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Kuogee Hsieh <khsieh@codeaurora.org>, Rob Herring <robh+dt@kernel.org>,
 Tanmay Shah <tanmay@codeaurora.org>, freedreno@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>, Chandan Uddaraju <chandanu@codeaurora.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-07-21 19:42, Bjorn Andersson wrote:
> In order to deal with multiple memory ranges in the following commit
> change the ioremap wrapper to not poke directly into the dss_io_data
> struct.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
I think we can squash this one and the next patch into one.
Because the APIs and structs you are modifying here are again getting 
touched in the next one too.
> ---
>  drivers/gpu/drm/msm/dp/dp_parser.c | 28 ++++++++++++++--------------
>  drivers/gpu/drm/msm/dp/dp_parser.h |  2 +-
>  2 files changed, 15 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c
> b/drivers/gpu/drm/msm/dp/dp_parser.c
> index c064ced78278..e68dacef547c 100644
> --- a/drivers/gpu/drm/msm/dp/dp_parser.c
> +++ b/drivers/gpu/drm/msm/dp/dp_parser.c
> @@ -19,39 +19,39 @@ static const struct dp_regulator_cfg 
> sdm845_dp_reg_cfg = {
>  	},
>  };
> 
> -static int msm_dss_ioremap(struct platform_device *pdev,
> -				struct dss_io_data *io_data)
> +static void __iomem *dp_ioremap(struct platform_device *pdev, int
> idx, size_t *len)
>  {
>  	struct resource *res = NULL;
> +	void __iomem *base;
> 
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, idx);
>  	if (!res) {
>  		DRM_ERROR("%pS->%s: msm_dss_get_res failed\n",
>  			__builtin_return_address(0), __func__);
> -		return -ENODEV;
> +		return ERR_PTR(-ENODEV);
>  	}
> 
> -	io_data->len = (u32)resource_size(res);
> -	io_data->base = devm_ioremap(&pdev->dev, res->start, io_data->len);
> -	if (!io_data->base) {
> +	base = devm_ioremap_resource(&pdev->dev, res);
> +	if (!base) {
>  		DRM_ERROR("%pS->%s: ioremap failed\n",
>  			__builtin_return_address(0), __func__);
> -		return -EIO;
> +		return ERR_PTR(-EIO);
>  	}
> 
> -	return 0;
> +	*len = resource_size(res);
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
> +	dss->base = dp_ioremap(pdev, 0, &dss->len);
> +	if (IS_ERR(dss->base)) {
> +		DRM_ERROR("unable to remap dp io region: %pe\n", dss->base);
> +		return PTR_ERR(dss->base);
>  	}
> 
>  	io->phy = devm_phy_get(&pdev->dev, "dp");
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
