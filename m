Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D8A74C08C
	for <lists+dri-devel@lfdr.de>; Sun,  9 Jul 2023 05:05:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49E8910E101;
	Sun,  9 Jul 2023 03:05:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD2E310E101;
 Sun,  9 Jul 2023 03:05:48 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 84E3060B65;
 Sun,  9 Jul 2023 03:05:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9551DC433C8;
 Sun,  9 Jul 2023 03:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1688871945;
 bh=08EVmP95gtwfBvBvf6xxIOPQOkRYHfw+hhVlKAXhPhw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=inXkCeyHCc34IDnkW4Pc0dD5aKeFLWN6Bs8x+hB+vQAaNpbXqDkUwZnTLGVl2PmsB
 jrlfSV1ZOg8U6MMd4gcc/AEDRjxZoiOa4WwqFut+fkixQS71kXlwWLJh+bQ+Gg4e0I
 baAYm/HPudMAtNqR6PxT+4AhHTVvGXNJFlwMPBWDH7fYgtZYQyAqAUeE3Se7z+GGFP
 d6AyQMLo3NQdhXMcBcI9zfQ3KAjkEU/rifgdCJDglNtU/E4riBBefi6atN3WF46CJ8
 9GBWeEm5hg7X0yE27WOTCqqEe282KvNXEDlN7p1wN7+Sntk5ra5U8oTI2WaFwTAj0R
 xM1ahitvcNV+g==
Date: Sat, 8 Jul 2023 20:09:22 -0700
From: Bjorn Andersson <andersson@kernel.org>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Subject: Re: [PATCH v1 4/5] drm/msm/dp: move relevant dp initialization code
 from bind() to probe()
Message-ID: <n7jye2t2k3l7hxxsta6muk2fsjlufxsmtcbtna4fovpgdozlsi@qzvw6cj3ejih>
References: <1688773943-3887-1-git-send-email-quic_khsieh@quicinc.com>
 <1688773943-3887-5-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1688773943-3887-5-git-send-email-quic_khsieh@quicinc.com>
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
 quic_abhinavk@quicinc.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org, vkoul@kernel.org,
 agross@kernel.org, marijn.suijten@somainline.org, dmitry.baryshkov@linaro.org,
 quic_jesszhan@quicinc.com, swboyd@chromium.org, sean@poorly.run,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 07, 2023 at 04:52:22PM -0700, Kuogee Hsieh wrote:
> In preparation of moving edp of_dp_aux_populate_bus() to
> dp_display_probe(), move dp_display_request_irq(),
> dp->parser->parse() and dp_power_client_init() to dp_display_probe()
> too.
> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 48 +++++++++++++++++--------------------
>  drivers/gpu/drm/msm/dp/dp_display.h |  1 -
>  2 files changed, 22 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 44580c2..185f1eb 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -290,12 +290,6 @@ static int dp_display_bind(struct device *dev, struct device *master,
>  		goto end;
>  	}
>  
> -	rc = dp_power_client_init(dp->power);
> -	if (rc) {
> -		DRM_ERROR("Power client create failed\n");
> -		goto end;
> -	}
> -
>  	rc = dp_register_audio_driver(dev, dp->audio);
>  	if (rc) {
>  		DRM_ERROR("Audio registration Dp failed\n");
> @@ -752,6 +746,12 @@ static int dp_init_sub_modules(struct dp_display_private *dp)
>  		goto error;
>  	}
>  
> +	rc = dp->parser->parse(dp->parser);

Today dp_init_sub_modules() just allocates memory for all the modules
and ties them together. While I don't fancy this way of structuring
device drivers in Linux, I think it's reasonable to retain that design
for now, and perform the parsing and power initialization in
dp_display_probe().

> +	if (rc) {
> +		DRM_ERROR("device tree parsing failed\n");
> +		goto error;
> +	}
> +
>  	dp->catalog = dp_catalog_get(dev, &dp->parser->io);
>  	if (IS_ERR(dp->catalog)) {
>  		rc = PTR_ERR(dp->catalog);
> @@ -768,6 +768,12 @@ static int dp_init_sub_modules(struct dp_display_private *dp)
>  		goto error;
>  	}
>  
> +	rc = dp_power_client_init(dp->power);
> +	if (rc) {
> +		DRM_ERROR("Power client create failed\n");
> +		goto error;
> +	}
> +
>  	dp->aux = dp_aux_get(dev, dp->catalog, dp->dp_display.is_edp);
>  	if (IS_ERR(dp->aux)) {
>  		rc = PTR_ERR(dp->aux);
> @@ -1196,26 +1202,20 @@ static irqreturn_t dp_display_irq_handler(int irq, void *dev_id)
>  	return ret;
>  }
>  
> -int dp_display_request_irq(struct msm_dp *dp_display)
> +static int dp_display_request_irq(struct dp_display_private *dp)
>  {
>  	int rc = 0;
> -	struct dp_display_private *dp;
> -
> -	if (!dp_display) {
> -		DRM_ERROR("invalid input\n");
> -		return -EINVAL;
> -	}

Love this, but it's unrelated to the rest of the patch.

> -
> -	dp = container_of(dp_display, struct dp_display_private, dp_display);
> +	struct device *dev = &dp->pdev->dev;
>  
> -	dp->irq = irq_of_parse_and_map(dp->pdev->dev.of_node, 0);
>  	if (!dp->irq) {
> -		DRM_ERROR("failed to get irq\n");
> -		return -EINVAL;
> +		dp->irq = irq_of_parse_and_map(dp->pdev->dev.of_node, 0);
> +		if (!dp->irq) {
> +			DRM_ERROR("failed to get irq\n");
> +			return -EINVAL;
> +		}
>  	}
>  
> -	rc = devm_request_irq(dp_display->drm_dev->dev, dp->irq,
> -			dp_display_irq_handler,
> +	rc = devm_request_irq(dev, dp->irq, dp_display_irq_handler,

This is fixing a bug where currently the dp_display_irq_handler()
registration is tied to the DPU device's life cycle, while depending on
resources that are released as the DP device is torn down.

It would be nice if this was not hidden in a patch that claims to just
move calls around.

Regards,
Bjorn

>  			IRQF_TRIGGER_HIGH, "dp_display_isr", dp);
>  	if (rc < 0) {
>  		DRM_ERROR("failed to request IRQ%u: %d\n",
> @@ -1290,6 +1290,8 @@ static int dp_display_probe(struct platform_device *pdev)
>  
>  	platform_set_drvdata(pdev, &dp->dp_display);
>  
> +	dp_display_request_irq(dp);
> +
>  	rc = component_add(&pdev->dev, &dp_display_comp_ops);
>  	if (rc) {
>  		DRM_ERROR("component add failed, rc=%d\n", rc);
> @@ -1574,12 +1576,6 @@ int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
>  
>  	dp_priv = container_of(dp_display, struct dp_display_private, dp_display);
>  
> -	ret = dp_display_request_irq(dp_display);
> -	if (ret) {
> -		DRM_ERROR("request_irq failed, ret=%d\n", ret);
> -		return ret;
> -	}
> -
>  	ret = dp_display_get_next_bridge(dp_display);
>  	if (ret)
>  		return ret;
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
> index 1e9415a..b3c08de 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.h
> +++ b/drivers/gpu/drm/msm/dp/dp_display.h
> @@ -35,7 +35,6 @@ struct msm_dp {
>  int dp_display_set_plugged_cb(struct msm_dp *dp_display,
>  		hdmi_codec_plugged_cb fn, struct device *codec_dev);
>  int dp_display_get_modes(struct msm_dp *dp_display);
> -int dp_display_request_irq(struct msm_dp *dp_display);
>  bool dp_display_check_video_test(struct msm_dp *dp_display);
>  int dp_display_get_test_bpp(struct msm_dp *dp_display);
>  void dp_display_signal_audio_start(struct msm_dp *dp_display);
> -- 
> 2.7.4
> 
