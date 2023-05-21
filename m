Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5571770AC3E
	for <lists+dri-devel@lfdr.de>; Sun, 21 May 2023 05:54:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7937B10E1A8;
	Sun, 21 May 2023 03:54:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A37610E1A8;
 Sun, 21 May 2023 03:54:01 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 05FB960CF4;
 Sun, 21 May 2023 03:54:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5001FC433D2;
 Sun, 21 May 2023 03:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684641239;
 bh=MdEc/CxDQaFkKU/flCM1dP41J/RlrSkkYxf8xg9JDTs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qNr94eyjW5VxK+kXef3t2OjpJ2aZmWlkdCYHIJq0msDLIZRoiOx6CNl9QIg3s7ib1
 b6ypkmckP/GAmX5Mkv3kf/q4CQHZRMAzK6FqWO3gUz/W5biUy0LaVTPQ9LQkk6ils7
 2S6rCVLSWfyr8vP3b3sB9lGLYoQOoDHSzwtytPz+WwzEUwE6qWtwcChCHFDhBN36RV
 pK+L6ieOOejP4f7iS3efFQy/aNWWC/PBggfp30jeNBjgOCRHO9wYGrxJl+aM7Ag48B
 EtKqQZ8E0XMST6hUXMb/XzxaW8KhqrfbjV4bzAdvQejJa+GJAqFdCXE8lnlxxq4Ueu
 RznGwo2VQ1IzA==
Date: Sat, 20 May 2023 22:53:56 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 3/3] drm/msm/dp: Clean up pdev/dev duplication in dp_power
Message-ID: <euxiqfx3q5cs3z2unai67w3h33y225whstauqezwbcx4pcqegl@jct5c7crcet7>
References: <20230515030256.300104-1-quic_bjorande@quicinc.com>
 <20230515030256.300104-3-quic_bjorande@quicinc.com>
 <d7d27051-2853-c979-b965-3cad47f2b693@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d7d27051-2853-c979-b965-3cad47f2b693@linaro.org>
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
Cc: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Bjorn Andersson <quic_bjorande@quicinc.com>, linux-kernel@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Vinod Polimera <quic_vpolimer@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, freedreno@lists.freedesktop.org,
 Johan Hovold <johan+linaro@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, May 20, 2023 at 04:26:59AM +0300, Dmitry Baryshkov wrote:
> On 15/05/2023 06:02, Bjorn Andersson wrote:
> > The dp_power module keeps track of both the DP controller's struct
> > platform_device and struct device - with the prior pulled out of the
> > dp_parser module.
> > 
> > Clean up the duplication by dropping the platform_device reference and
> > just track the passed struct device.
> > 
> > Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> > ---
> >   drivers/gpu/drm/msm/dp/dp_power.c | 16 +++++++---------
> >   1 file changed, 7 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/dp/dp_power.c b/drivers/gpu/drm/msm/dp/dp_power.c
> > index 031d2eefef07..9be645f91211 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_power.c
> > +++ b/drivers/gpu/drm/msm/dp/dp_power.c
> > @@ -14,7 +14,6 @@
> >   struct dp_power_private {
> >   	struct dp_parser *parser;
> > -	struct platform_device *pdev;
> >   	struct device *dev;
> >   	struct drm_device *drm_dev;
> >   	struct clk *link_clk_src;
> > @@ -28,7 +27,7 @@ static int dp_power_clk_init(struct dp_power_private *power)
> >   {
> >   	int rc = 0;
> >   	struct dss_module_power *core, *ctrl, *stream;
> > -	struct device *dev = &power->pdev->dev;
> > +	struct device *dev = power->dev;
> >   	core = &power->parser->mp[DP_CORE_PM];
> >   	ctrl = &power->parser->mp[DP_CTRL_PM];
> > @@ -153,7 +152,7 @@ int dp_power_client_init(struct dp_power *dp_power)
> >   	power = container_of(dp_power, struct dp_power_private, dp_power);
> > -	pm_runtime_enable(&power->pdev->dev);
> > +	pm_runtime_enable(power->dev);
> >   	return dp_power_clk_init(power);
> >   }
> > @@ -164,7 +163,7 @@ void dp_power_client_deinit(struct dp_power *dp_power)
> >   	power = container_of(dp_power, struct dp_power_private, dp_power);
> > -	pm_runtime_disable(&power->pdev->dev);
> > +	pm_runtime_disable(power->dev);
> >   }
> >   int dp_power_init(struct dp_power *dp_power, bool flip)
> > @@ -174,11 +173,11 @@ int dp_power_init(struct dp_power *dp_power, bool flip)
> >   	power = container_of(dp_power, struct dp_power_private, dp_power);
> > -	pm_runtime_get_sync(&power->pdev->dev);
> > +	pm_runtime_get_sync(power->dev);
> >   	rc = dp_power_clk_enable(dp_power, DP_CORE_PM, true);
> >   	if (rc)
> > -		pm_runtime_put_sync(&power->pdev->dev);
> > +		pm_runtime_put_sync(power->dev);
> >   	return rc;
> >   }
> > @@ -190,7 +189,7 @@ int dp_power_deinit(struct dp_power *dp_power)
> >   	power = container_of(dp_power, struct dp_power_private, dp_power);
> >   	dp_power_clk_enable(dp_power, DP_CORE_PM, false);
> > -	pm_runtime_put_sync(&power->pdev->dev);
> > +	pm_runtime_put_sync(power->dev);
> >   	return 0;
> >   }
> > @@ -199,12 +198,11 @@ struct dp_power *dp_power_get(struct device *dev, struct dp_parser *parser)
> 
> Technically we don't even need to pass struct device here, we can get it
> from parser->pdev->dev.
> 

Right, but afaict dp_init_sub_modules() passes struct device * as first
parameter to all the "module" initializers. So it feels reasonable to
keep it, for now, for symmetry.

What do you think?

Regards,
Bjorn

> >   	struct dp_power_private *power;
> >   	struct dp_power *dp_power;
> > -	power = devm_kzalloc(&parser->pdev->dev, sizeof(*power), GFP_KERNEL);
> > +	power = devm_kzalloc(dev, sizeof(*power), GFP_KERNEL);
> >   	if (!power)
> >   		return ERR_PTR(-ENOMEM);
> >   	power->parser = parser;
> > -	power->pdev = parser->pdev;
> >   	power->dev = dev;
> >   	dp_power = &power->dp_power;
> 
> -- 
> With best wishes
> Dmitry
> 
