Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 615B2493304
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 03:38:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5216710E6DE;
	Wed, 19 Jan 2022 02:38:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 363 seconds by postgrey-1.36 at gabe;
 Wed, 19 Jan 2022 02:38:55 UTC
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FB1210E6DE;
 Wed, 19 Jan 2022 02:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1642559935; x=1674095935;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Vl+b7drMZ5+KHqYRoUNQ+S6TqzW7BKVlOKBy6IG4qnA=;
 b=NsV9pvZya0hzh4Z1vyjEEipLGTXGJ946M2+xkqVWWc6iA/Hx2QN2NUxx
 S+2UXqVIZCRXXAY0nvm/tiRxDq9kMOMI85/p7hN9KP5mNPhVf8OCIJY6R
 hF8ObKtanUMOPngEVmVgdwNguQ+PPkuq5UT+fKdmIYF7OTOI735Q1OERC c=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 18 Jan 2022 18:32:51 -0800
X-QCInternal: smtphost
Received: from nasanex01b.na.qualcomm.com ([10.46.141.250])
 by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2022 18:32:51 -0800
Received: from [10.71.111.172] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Tue, 18 Jan
 2022 18:32:50 -0800
Message-ID: <645728c0-05be-0784-0c7f-5535095ced00@quicinc.com>
Date: Tue, 18 Jan 2022 18:32:50 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [Freedreno] [PATCH v2 1/2] drm/msm/dpu: simplify clocks handling
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20211126023516.1108411-1-dmitry.baryshkov@linaro.org>
 <20211126023516.1108411-2-dmitry.baryshkov@linaro.org>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20211126023516.1108411-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
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
Cc: Sean Paul <sean@poorly.run>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Kuogee Hsieh <khsieh@codeaurora.org>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/25/2021 6:35 PM, Dmitry Baryshkov wrote:
> DPU driver contains code to parse clock items from device tree into
> special data struct and then enable/disable/set rate for the clocks
> using that data struct. However the DPU driver itself uses only parsing
> and enabling/disabling part (the rate setting is used by DP driver).
> 
> Move this implementation to the DP driver (which actually uses rate
> setting) and replace hand-coded enable/disable/get loops in the DPU
> with the respective clk_bulk operations. Put operation is removed
> completely because, it is handled using devres instead.
> 
> DP implementation is unchanged for now.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/Makefile                  |  2 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 24 ++-----
>   drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h |  6 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       | 46 +++----------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       |  4 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c      | 26 +++----
>   .../dpu1/dpu_io_util.c => dp/dp_clk_util.c}   | 69 +------------------
>   .../dpu1/dpu_io_util.h => dp/dp_clk_util.h}   |  2 -
>   drivers/gpu/drm/msm/dp/dp_parser.h            |  2 +-
>   drivers/gpu/drm/msm/msm_drv.c                 | 49 +++++++++++++
>   drivers/gpu/drm/msm/msm_drv.h                 |  1 +
>   11 files changed, 84 insertions(+), 147 deletions(-)
>   rename drivers/gpu/drm/msm/{disp/dpu1/dpu_io_util.c => dp/dp_clk_util.c} (61%)
>   rename drivers/gpu/drm/msm/{disp/dpu1/dpu_io_util.h => dp/dp_clk_util.h} (92%)
> 
> diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
> index 40577f8856d8..b6637da219b0 100644
> --- a/drivers/gpu/drm/msm/Makefile
> +++ b/drivers/gpu/drm/msm/Makefile
> @@ -69,7 +69,6 @@ msm-y := \
>   	disp/dpu1/dpu_hw_top.o \
>   	disp/dpu1/dpu_hw_util.o \
>   	disp/dpu1/dpu_hw_vbif.o \
> -	disp/dpu1/dpu_io_util.o \
>   	disp/dpu1/dpu_kms.o \
>   	disp/dpu1/dpu_mdss.o \
>   	disp/dpu1/dpu_plane.o \
> @@ -105,6 +104,7 @@ msm-$(CONFIG_DRM_MSM_GPU_STATE)	+= adreno/a6xx_gpu_state.o
>   
>   msm-$(CONFIG_DRM_MSM_DP)+= dp/dp_aux.o \
>   	dp/dp_catalog.o \
> +	dp/dp_clk_util.o \
>   	dp/dp_ctrl.o \
>   	dp/dp_display.o \
>   	dp/dp_drm.o \
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> index 60fe06018581..4d184122d63e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> @@ -284,17 +284,6 @@ void dpu_core_perf_crtc_release_bw(struct drm_crtc *crtc)
>   	}
>   }
>   
> -static int _dpu_core_perf_set_core_clk_rate(struct dpu_kms *kms, u64 rate)
> -{
> -	struct dss_clk *core_clk = kms->perf.core_clk;
> -
> -	if (core_clk->max_rate && (rate > core_clk->max_rate))
> -		rate = core_clk->max_rate;
> -
> -	core_clk->rate = rate;
> -	return dev_pm_opp_set_rate(&kms->pdev->dev, core_clk->rate);
> -}
> -
>   static u64 _dpu_core_perf_get_core_clk_rate(struct dpu_kms *kms)
>   {
>   	u64 clk_rate = kms->perf.perf_tune.min_core_clk;
> @@ -306,7 +295,7 @@ static u64 _dpu_core_perf_get_core_clk_rate(struct dpu_kms *kms)
>   			dpu_cstate = to_dpu_crtc_state(crtc->state);
>   			clk_rate = max(dpu_cstate->new_perf.core_clk_rate,
>   							clk_rate);
> -			clk_rate = clk_round_rate(kms->perf.core_clk->clk,
> +			clk_rate = clk_round_rate(kms->perf.core_clk,
>   					clk_rate);
>   		}
>   	}
> @@ -405,10 +394,11 @@ int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
>   
>   		trace_dpu_core_perf_update_clk(kms->dev, stop_req, clk_rate);
>   
> -		ret = _dpu_core_perf_set_core_clk_rate(kms, clk_rate);
> +		if (clk_rate > kms->perf.max_core_clk_rate)
> +			clk_rate = kms->perf.max_core_clk_rate;
> +		ret = dev_pm_opp_set_rate(&kms->pdev->dev, clk_rate);
>   		if (ret) {
> -			DPU_ERROR("failed to set %s clock rate %llu\n",
> -					kms->perf.core_clk->clk_name, clk_rate);
> +			DPU_ERROR("failed to set core clock rate %llu\n", clk_rate);
>   			return ret;
>   		}
>   
> @@ -529,13 +519,13 @@ void dpu_core_perf_destroy(struct dpu_core_perf *perf)
>   int dpu_core_perf_init(struct dpu_core_perf *perf,
>   		struct drm_device *dev,
>   		struct dpu_mdss_cfg *catalog,
> -		struct dss_clk *core_clk)
> +		struct clk *core_clk)
>   {
>   	perf->dev = dev;
>   	perf->catalog = catalog;
>   	perf->core_clk = core_clk;
>   
> -	perf->max_core_clk_rate = core_clk->max_rate;
> +	perf->max_core_clk_rate = clk_get_rate(core_clk);
>   	if (!perf->max_core_clk_rate) {
>   		DPU_DEBUG("optional max core clk rate, use default\n");
>   		perf->max_core_clk_rate = DPU_PERF_DEFAULT_MAX_CORE_CLK_RATE;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
> index cf4b9b5964c6..8dfcc6db7176 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
> @@ -56,7 +56,7 @@ struct dpu_core_perf_tune {
>    * @dev: Pointer to drm device
>    * @debugfs_root: top level debug folder
>    * @catalog: Pointer to catalog configuration
> - * @core_clk: Pointer to core clock structure
> + * @core_clk: Pointer to the core clock
>    * @core_clk_rate: current core clock rate
>    * @max_core_clk_rate: maximum allowable core clock rate
>    * @perf_tune: debug control for performance tuning
> @@ -69,7 +69,7 @@ struct dpu_core_perf {
>   	struct drm_device *dev;
>   	struct dentry *debugfs_root;
>   	struct dpu_mdss_cfg *catalog;
> -	struct dss_clk *core_clk;
> +	struct clk *core_clk;
>   	u64 core_clk_rate;
>   	u64 max_core_clk_rate;
>   	struct dpu_core_perf_tune perf_tune;
> @@ -120,7 +120,7 @@ void dpu_core_perf_destroy(struct dpu_core_perf *perf);
>   int dpu_core_perf_init(struct dpu_core_perf *perf,
>   		struct drm_device *dev,
>   		struct dpu_mdss_cfg *catalog,
> -		struct dss_clk *core_clk);
> +		struct clk *core_clk);
>   
>   struct dpu_kms;
>   
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index a15b26428280..655cbd912309 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -936,29 +936,15 @@ static int _dpu_kms_mmu_init(struct dpu_kms *dpu_kms)
>   	return 0;
>   }
>   
> -static struct dss_clk *_dpu_kms_get_clk(struct dpu_kms *dpu_kms,
> -		char *clock_name)
> -{
> -	struct dss_module_power *mp = &dpu_kms->mp;
> -	int i;
> -
> -	for (i = 0; i < mp->num_clk; i++) {
> -		if (!strcmp(mp->clk_config[i].clk_name, clock_name))
> -			return &mp->clk_config[i];
> -	}
> -
> -	return NULL;
> -}
> -
>   u64 dpu_kms_get_clk_rate(struct dpu_kms *dpu_kms, char *clock_name)
>   {
> -	struct dss_clk *clk;
> +	struct clk *clk;
>   
> -	clk = _dpu_kms_get_clk(dpu_kms, clock_name);
> +	clk = msm_clk_bulk_get_clock(dpu_kms->clocks, dpu_kms->num_clocks, clock_name);
>   	if (!clk)
>   		return -EINVAL;
>   
> -	return clk_get_rate(clk->clk);
> +	return clk_get_rate(clk);
>   }
>   
>   static int dpu_kms_hw_init(struct msm_kms *kms)
> @@ -1070,7 +1056,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>   	}
>   
>   	rc = dpu_core_perf_init(&dpu_kms->perf, dev, dpu_kms->catalog,
> -			_dpu_kms_get_clk(dpu_kms, "core"));
> +			msm_clk_bulk_get_clock(dpu_kms->clocks, dpu_kms->num_clocks, "core"));
>   	if (rc) {
>   		DPU_ERROR("failed to init perf %d\n", rc);
>   		goto perf_err;
> @@ -1157,7 +1143,6 @@ static int dpu_bind(struct device *dev, struct device *master, void *data)
>   	struct platform_device *pdev = to_platform_device(dev);
>   	struct msm_drm_private *priv = ddev->dev_private;
>   	struct dpu_kms *dpu_kms;
> -	struct dss_module_power *mp;
>   	int ret = 0;
>   
>   	dpu_kms = devm_kzalloc(&pdev->dev, sizeof(*dpu_kms), GFP_KERNEL);
> @@ -1174,12 +1159,12 @@ static int dpu_bind(struct device *dev, struct device *master, void *data)
>   		return ret;
>   	}
>   
> -	mp = &dpu_kms->mp;
> -	ret = msm_dss_parse_clock(pdev, mp);
> -	if (ret) {
> +	ret = msm_parse_clock(pdev, &dpu_kms->clocks);
> +	if (ret < 0) {
>   		DPU_ERROR("failed to parse clocks, ret=%d\n", ret);
>   		return ret;
>   	}
> +	dpu_kms->num_clocks = ret;
>   
>   	platform_set_drvdata(pdev, dpu_kms);
>   
> @@ -1203,11 +1188,6 @@ static void dpu_unbind(struct device *dev, struct device *master, void *data)
>   {
>   	struct platform_device *pdev = to_platform_device(dev);
>   	struct dpu_kms *dpu_kms = platform_get_drvdata(pdev);
> -	struct dss_module_power *mp = &dpu_kms->mp;
> -
> -	msm_dss_put_clk(mp->clk_config, mp->num_clk);
> -	devm_kfree(&pdev->dev, mp->clk_config);
> -	mp->num_clk = 0;
>   
>   	if (dpu_kms->rpm_enabled)
>   		pm_runtime_disable(&pdev->dev);
> @@ -1231,21 +1211,18 @@ static int dpu_dev_remove(struct platform_device *pdev)
>   
>   static int __maybe_unused dpu_runtime_suspend(struct device *dev)
>   {
> -	int i, rc = -1;
> +	int i;
>   	struct platform_device *pdev = to_platform_device(dev);
>   	struct dpu_kms *dpu_kms = platform_get_drvdata(pdev);
> -	struct dss_module_power *mp = &dpu_kms->mp;
>   
>   	/* Drop the performance state vote */
>   	dev_pm_opp_set_rate(dev, 0);
> -	rc = msm_dss_enable_clk(mp->clk_config, mp->num_clk, false);
> -	if (rc)
> -		DPU_ERROR("clock disable failed rc:%d\n", rc);
> +	clk_bulk_disable_unprepare(dpu_kms->num_clocks, dpu_kms->clocks);
>   
>   	for (i = 0; i < dpu_kms->num_paths; i++)
>   		icc_set_bw(dpu_kms->path[i], 0, 0);
>   
> -	return rc;
> +	return 0;
>   }
>   
>   static int __maybe_unused dpu_runtime_resume(struct device *dev)
> @@ -1255,7 +1232,6 @@ static int __maybe_unused dpu_runtime_resume(struct device *dev)
>   	struct dpu_kms *dpu_kms = platform_get_drvdata(pdev);
>   	struct drm_encoder *encoder;
>   	struct drm_device *ddev;
> -	struct dss_module_power *mp = &dpu_kms->mp;
>   	int i;
>   
>   	ddev = dpu_kms->dev;
> @@ -1265,7 +1241,7 @@ static int __maybe_unused dpu_runtime_resume(struct device *dev)
>   	for (i = 0; i < dpu_kms->num_paths; i++)
>   		icc_set_bw(dpu_kms->path[i], 0, Bps_to_icc(MIN_IB_BW));
>   
> -	rc = msm_dss_enable_clk(mp->clk_config, mp->num_clk, true);
> +	rc = clk_bulk_prepare_enable(dpu_kms->num_clocks, dpu_kms->clocks);
>   	if (rc) {
>   		DPU_ERROR("clock enable failed rc:%d\n", rc);
>   		return rc;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> index 775bcbda860f..d366aa359d38 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> @@ -21,7 +21,6 @@
>   #include "dpu_hw_lm.h"
>   #include "dpu_hw_interrupts.h"
>   #include "dpu_hw_top.h"
> -#include "dpu_io_util.h"
>   #include "dpu_rm.h"
>   #include "dpu_core_perf.h"
>   
> @@ -113,7 +112,8 @@ struct dpu_kms {
>   	struct platform_device *pdev;
>   	bool rpm_enabled;
>   
> -	struct dss_module_power mp;
> +	struct clk_bulk_data *clocks;
> +	int num_clocks;
>   
>   	/* reference count bandwidth requests, so we know when we can
>   	 * release bandwidth.  Each atomic update increments, and frame-
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
> index b466784d9822..d7faf11a5456 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
> @@ -29,7 +29,8 @@ struct dpu_irq_controller {
>   struct dpu_mdss {
>   	struct msm_mdss base;
>   	void __iomem *mmio;
> -	struct dss_module_power mp;
> +	struct clk_bulk_data *clocks;
> +	int num_clocks;
>   	struct dpu_irq_controller irq_controller;
>   };
>   
> @@ -136,10 +137,9 @@ static void _dpu_mdss_irq_domain_fini(struct dpu_mdss *dpu_mdss)
>   static int dpu_mdss_enable(struct msm_mdss *mdss)
>   {
>   	struct dpu_mdss *dpu_mdss = to_dpu_mdss(mdss);
> -	struct dss_module_power *mp = &dpu_mdss->mp;
>   	int ret;
>   
> -	ret = msm_dss_enable_clk(mp->clk_config, mp->num_clk, true);
> +	ret = clk_bulk_prepare_enable(dpu_mdss->num_clocks, dpu_mdss->clocks);
>   	if (ret) {
>   		DPU_ERROR("clock enable failed, ret:%d\n", ret);
>   		return ret;
> @@ -174,14 +174,10 @@ static int dpu_mdss_enable(struct msm_mdss *mdss)
>   static int dpu_mdss_disable(struct msm_mdss *mdss)
>   {
>   	struct dpu_mdss *dpu_mdss = to_dpu_mdss(mdss);
> -	struct dss_module_power *mp = &dpu_mdss->mp;
> -	int ret;
>   
> -	ret = msm_dss_enable_clk(mp->clk_config, mp->num_clk, false);
> -	if (ret)
> -		DPU_ERROR("clock disable failed, ret:%d\n", ret);
> +	clk_bulk_disable_unprepare(dpu_mdss->num_clocks, dpu_mdss->clocks);
>   
> -	return ret;
> +	return 0;
>   }
>   
>   static void dpu_mdss_destroy(struct drm_device *dev)

Hi Dmitry,

Looks like this is based on some outdated code:
2027e5b3 (drm/msm: Initialize MDSS irq domain at probe time) changes 
`*dev` to `*mdss`

I want to test this patch on some boards (namely RB3 and RB5). Can you 
release a version with your changes rebased on top of the tip of msm-next?

> @@ -189,7 +185,6 @@ static void dpu_mdss_destroy(struct drm_device *dev)
>   	struct platform_device *pdev = to_platform_device(dev->dev);
>   	struct msm_drm_private *priv = dev->dev_private;
>   	struct dpu_mdss *dpu_mdss = to_dpu_mdss(priv->mdss);
> -	struct dss_module_power *mp = &dpu_mdss->mp;
>   	int irq;
>   
>   	pm_runtime_suspend(dev->dev);
> @@ -197,8 +192,6 @@ static void dpu_mdss_destroy(struct drm_device *dev)
>   	_dpu_mdss_irq_domain_fini(dpu_mdss);
>   	irq = platform_get_irq(pdev, 0);
>   	irq_set_chained_handler_and_data(irq, NULL, NULL);
> -	msm_dss_put_clk(mp->clk_config, mp->num_clk);
> -	devm_kfree(&pdev->dev, mp->clk_config);
>   
>   	if (dpu_mdss->mmio)
>   		devm_iounmap(&pdev->dev, dpu_mdss->mmio);
> @@ -217,7 +210,6 @@ int dpu_mdss_init(struct drm_device *dev)
>   	struct platform_device *pdev = to_platform_device(dev->dev);
>   	struct msm_drm_private *priv = dev->dev_private;
>   	struct dpu_mdss *dpu_mdss;
> -	struct dss_module_power *mp;
>   	int ret;
>   	int irq;
>   
> @@ -231,12 +223,12 @@ int dpu_mdss_init(struct drm_device *dev)
>   
>   	DRM_DEBUG("mapped mdss address space @%pK\n", dpu_mdss->mmio);
>   
> -	mp = &dpu_mdss->mp;
> -	ret = msm_dss_parse_clock(pdev, mp);
> -	if (ret) {
> +	ret = msm_parse_clock(pdev, &dpu_mdss->clocks);
> +	if (ret < 0) {
>   		DPU_ERROR("failed to parse clocks, ret=%d\n", ret);
>   		goto clk_parse_err;
>   	}
> +	dpu_mdss->num_clocks = ret;
>   
>   	dpu_mdss->base.dev = dev;
>   	dpu_mdss->base.funcs = &mdss_funcs;
> @@ -263,9 +255,7 @@ int dpu_mdss_init(struct drm_device *dev)
>   irq_error:
>   	_dpu_mdss_irq_domain_fini(dpu_mdss);
>   irq_domain_error:
> -	msm_dss_put_clk(mp->clk_config, mp->num_clk);
>   clk_parse_err:
> -	devm_kfree(&pdev->dev, mp->clk_config);
>   	if (dpu_mdss->mmio)
>   		devm_iounmap(&pdev->dev, dpu_mdss->mmio);
>   	dpu_mdss->mmio = NULL;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_io_util.c b/drivers/gpu/drm/msm/dp/dp_clk_util.c
> similarity index 61%
> rename from drivers/gpu/drm/msm/disp/dpu1/dpu_io_util.c
> rename to drivers/gpu/drm/msm/dp/dp_clk_util.c
> index 078afc5f5882..44a4fc59ff31 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_io_util.c
> +++ b/drivers/gpu/drm/msm/dp/dp_clk_util.c
> @@ -11,7 +11,7 @@
>   
>   #include <drm/drm_print.h>
>   
> -#include "dpu_io_util.h"
> +#include "dp_clk_util.h"
>   
>   void msm_dss_put_clk(struct dss_clk *clk_arry, int num_clk)
>   {
> @@ -118,70 +118,3 @@ int msm_dss_enable_clk(struct dss_clk *clk_arry, int num_clk, int enable)
>   
>   	return rc;
>   }
> -
> -int msm_dss_parse_clock(struct platform_device *pdev,
> -			struct dss_module_power *mp)
> -{
> -	u32 i, rc = 0;
> -	const char *clock_name;
> -	int num_clk = 0;
> -
> -	if (!pdev || !mp)
> -		return -EINVAL;
> -
> -	mp->num_clk = 0;
> -	num_clk = of_property_count_strings(pdev->dev.of_node, "clock-names");
> -	if (num_clk <= 0) {
> -		pr_debug("clocks are not defined\n");
> -		return 0;
> -	}
> -
> -	mp->clk_config = devm_kcalloc(&pdev->dev,
> -				      num_clk, sizeof(struct dss_clk),
> -				      GFP_KERNEL);
> -	if (!mp->clk_config)
> -		return -ENOMEM;
> -
> -	for (i = 0; i < num_clk; i++) {
> -		rc = of_property_read_string_index(pdev->dev.of_node,
> -						   "clock-names", i,
> -						   &clock_name);
> -		if (rc) {
> -			DRM_DEV_ERROR(&pdev->dev, "Failed to get clock name for %d\n",
> -				i);
> -			break;
> -		}
> -		strlcpy(mp->clk_config[i].clk_name, clock_name,
> -			sizeof(mp->clk_config[i].clk_name));
> -
> -		mp->clk_config[i].type = DSS_CLK_AHB;
> -	}
> -
> -	rc = msm_dss_get_clk(&pdev->dev, mp->clk_config, num_clk);
> -	if (rc) {
> -		DRM_DEV_ERROR(&pdev->dev, "Failed to get clock refs %d\n", rc);
> -		goto err;
> -	}
> -
> -	rc = of_clk_set_defaults(pdev->dev.of_node, false);
> -	if (rc) {
> -		DRM_DEV_ERROR(&pdev->dev, "Failed to set clock defaults %d\n", rc);
> -		goto err;
> -	}
> -
> -	for (i = 0; i < num_clk; i++) {
> -		u32 rate = clk_get_rate(mp->clk_config[i].clk);
> -		if (!rate)
> -			continue;
> -		mp->clk_config[i].rate = rate;
> -		mp->clk_config[i].type = DSS_CLK_PCLK;
> -		mp->clk_config[i].max_rate = rate;
> -	}
> -
> -	mp->num_clk = num_clk;
> -	return 0;
> -
> -err:
> -	msm_dss_put_clk(mp->clk_config, num_clk);
> -	return rc;
> -}
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_io_util.h b/drivers/gpu/drm/msm/dp/dp_clk_util.h
> similarity index 92%
> rename from drivers/gpu/drm/msm/disp/dpu1/dpu_io_util.h
> rename to drivers/gpu/drm/msm/dp/dp_clk_util.h
> index e6b5c772fa3b..6288a2833a58 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_io_util.h
> +++ b/drivers/gpu/drm/msm/dp/dp_clk_util.h
> @@ -35,6 +35,4 @@ int msm_dss_get_clk(struct device *dev, struct dss_clk *clk_arry, int num_clk);
>   void msm_dss_put_clk(struct dss_clk *clk_arry, int num_clk);
>   int msm_dss_clk_set_rate(struct dss_clk *clk_arry, int num_clk);
>   int msm_dss_enable_clk(struct dss_clk *clk_arry, int num_clk, int enable);
> -int msm_dss_parse_clock(struct platform_device *pdev,
> -		struct dss_module_power *mp);
>   #endif /* __DPU_IO_UTIL_H__ */
> diff --git a/drivers/gpu/drm/msm/dp/dp_parser.h b/drivers/gpu/drm/msm/dp/dp_parser.h
> index 3172da089421..094b39bfed8c 100644
> --- a/drivers/gpu/drm/msm/dp/dp_parser.h
> +++ b/drivers/gpu/drm/msm/dp/dp_parser.h
> @@ -10,7 +10,7 @@
>   #include <linux/phy/phy.h>
>   #include <linux/phy/phy-dp.h>
>   
> -#include "dpu_io_util.h"
> +#include "dp_clk_util.h"
>   #include "msm_drv.h"
>   
>   #define DP_LABEL "MDSS DP DISPLAY"
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 892c04365239..3e90fca33581 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -5,6 +5,7 @@
>    * Author: Rob Clark <robdclark@gmail.com>
>    */
>   
> +#include <linux/clk/clk-conf.h>
>   #include <linux/dma-mapping.h>
>   #include <linux/kthread.h>
>   #include <linux/sched/mm.h>
> @@ -123,6 +124,54 @@ struct clk *msm_clk_get(struct platform_device *pdev, const char *name)
>   	return clk;
>   }
>   
> +int msm_parse_clock(struct platform_device *pdev, struct clk_bulk_data **clocks)

Can you also move msm_parse_clock and other io helper methods (like 
_msm_ioremap) into a separate msm_io_utils file instead? That would help 
avoid file bloat.

Thanks,

Jessica Zhang

> +{
> +	u32 i, rc = 0;
> +	const char *clock_name;
> +	struct clk_bulk_data *bulk;
> +	int num_clk = 0;
> +
> +	if (!pdev)
> +		return -EINVAL;
> +
> +	num_clk = of_property_count_strings(pdev->dev.of_node, "clock-names");
> +	if (num_clk <= 0) {
> +		pr_debug("clocks are not defined\n");
> +		return 0;
> +	}
> +
> +	bulk = devm_kcalloc(&pdev->dev, num_clk, sizeof(struct clk_bulk_data), GFP_KERNEL);
> +	if (!bulk)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < num_clk; i++) {
> +		rc = of_property_read_string_index(pdev->dev.of_node,
> +						   "clock-names", i,
> +						   &clock_name);
> +		if (rc) {
> +			DRM_DEV_ERROR(&pdev->dev, "Failed to get clock name for %d\n", i);
> +			return rc;
> +		}
> +		bulk[i].id = devm_kstrdup(&pdev->dev, clock_name, GFP_KERNEL);
> +	}
> +
> +	rc = devm_clk_bulk_get(&pdev->dev, num_clk, bulk);
> +	if (rc) {
> +		DRM_DEV_ERROR(&pdev->dev, "Failed to get clock refs %d\n", rc);
> +		return rc;
> +	}
> +
> +	rc = of_clk_set_defaults(pdev->dev.of_node, false);
> +	if (rc) {
> +		DRM_DEV_ERROR(&pdev->dev, "Failed to set clock defaults %d\n", rc);
> +		return rc;
> +	}
> +
> +	*clocks = bulk;
> +
> +	return num_clk;
> +}
> +
>   static void __iomem *_msm_ioremap(struct platform_device *pdev, const char *name,
>   				  const char *dbgname, bool quiet, phys_addr_t *psize)
>   {
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index 69952b239384..cfede901056d 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -477,6 +477,7 @@ struct clk *msm_clk_get(struct platform_device *pdev, const char *name);
>   
>   struct clk *msm_clk_bulk_get_clock(struct clk_bulk_data *bulk, int count,
>   	const char *name);
> +int msm_parse_clock(struct platform_device *pdev, struct clk_bulk_data **clocks);
>   void __iomem *msm_ioremap(struct platform_device *pdev, const char *name,
>   		const char *dbgname);
>   void __iomem *msm_ioremap_size(struct platform_device *pdev, const char *name,
> -- 
> 2.33.0
> 
