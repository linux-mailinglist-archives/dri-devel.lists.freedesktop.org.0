Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE51534ADBA
	for <lists+dri-devel@lfdr.de>; Fri, 26 Mar 2021 18:43:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 903F66E23B;
	Fri, 26 Mar 2021 17:43:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A061D6E23B
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 17:43:21 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1616780606; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=FWCcM5CXpiJmEZLD5IoNtjeP5xTEpPwqcQqDtZvor/E=;
 b=KyuQj+ZQmg7XDPUGa6YUQ1pGe7Zt7d0qt6nHmrs8wfmGSiKwj7RGZRZpgN6DTEFHA4nskdDj
 bn7hTaaDw1Ok3wQLT+YXnsa0y53V0TOb05AGVhwXnOZGbS8HL42r4PiO7iy4Mg9EIMe0iX9z
 5iSHdwHhCJ1RiLNKbvb47sOlR28=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 605e1d2f876af85fc49fd7a0 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 26 Mar 2021 17:43:11
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id A4021C43464; Fri, 26 Mar 2021 17:43:11 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 3D2B1C43461;
 Fri, 26 Mar 2021 17:43:10 +0000 (UTC)
MIME-Version: 1.0
Date: Fri, 26 Mar 2021 10:43:10 -0700
From: abhinavk@codeaurora.org
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [Freedreno] [PATCH v2 01/28] clk: fixed: add devm helper for
 clk_hw_register_fixed_factor()
In-Reply-To: <20210324151846.2774204-2-dmitry.baryshkov@linaro.org>
References: <20210324151846.2774204-1-dmitry.baryshkov@linaro.org>
 <20210324151846.2774204-2-dmitry.baryshkov@linaro.org>
Message-ID: <4d2f69071681f0ccd2bffb7740a4f260@codeaurora.org>
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
Cc: freedreno@lists.freedesktop.org, Jonathan Marek <jonathan@marek.ca>,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 Michael Turquette <mturquette@baylibre.com>, Daniel Palmer <daniel@0x0f.com>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>, linux-clk@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry

On 2021-03-24 08:18, Dmitry Baryshkov wrote:
> From: Daniel Palmer <daniel@0x0f.com>
> 
> Add a devm helper for clk_hw_register_fixed_factor() so that drivers
> that internally
> register fixed factor clocks for things like dividers don't need to
> manually unregister
> them on remove or if probe fails.
> 
> Signed-off-by: Daniel Palmer <daniel@0x0f.com>
> Link: 
> https://lore.kernel.org/r/20210211052206.2955988-4-daniel@0x0f.com
> Signed-off-by: Stephen Boyd <sboyd@kernel.org>
Doesnt this need your signed-off too?
Other than that,
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/clk/clk-fixed-factor.c | 39 ++++++++++++++++++++++++++++------
>  include/linux/clk-provider.h   |  4 +++-
>  2 files changed, 36 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/clk/clk-fixed-factor.c 
> b/drivers/clk/clk-fixed-factor.c
> index 910e6e74ae90..4f7bf3929d6d 100644
> --- a/drivers/clk/clk-fixed-factor.c
> +++ b/drivers/clk/clk-fixed-factor.c
> @@ -64,10 +64,16 @@ const struct clk_ops clk_fixed_factor_ops = {
>  };
>  EXPORT_SYMBOL_GPL(clk_fixed_factor_ops);
> 
> +static void devm_clk_hw_register_fixed_factor_release(struct device
> *dev, void *res)
> +{
> +	clk_hw_unregister_fixed_factor(&((struct clk_fixed_factor 
> *)res)->hw);
> +}
> +
>  static struct clk_hw *
>  __clk_hw_register_fixed_factor(struct device *dev, struct device_node 
> *np,
>  		const char *name, const char *parent_name, int index,
> -		unsigned long flags, unsigned int mult, unsigned int div)
> +		unsigned long flags, unsigned int mult, unsigned int div,
> +		bool devm)
>  {
>  	struct clk_fixed_factor *fix;
>  	struct clk_init_data init = { };
> @@ -75,7 +81,15 @@ __clk_hw_register_fixed_factor(struct device *dev,
> struct device_node *np,
>  	struct clk_hw *hw;
>  	int ret;
> 
> -	fix = kmalloc(sizeof(*fix), GFP_KERNEL);
> +	/* You can't use devm without a dev */
> +	if (devm && !dev)
> +		return ERR_PTR(-EINVAL);
> +
> +	if (devm)
> +		fix = devres_alloc(devm_clk_hw_register_fixed_factor_release,
> +				sizeof(*fix), GFP_KERNEL);
> +	else
> +		fix = kmalloc(sizeof(*fix), GFP_KERNEL);
>  	if (!fix)
>  		return ERR_PTR(-ENOMEM);
> 
> @@ -99,9 +113,13 @@ __clk_hw_register_fixed_factor(struct device *dev,
> struct device_node *np,
>  	else
>  		ret = of_clk_hw_register(np, hw);
>  	if (ret) {
> -		kfree(fix);
> +		if (devm)
> +			devres_free(fix);
> +		else
> +			kfree(fix);
>  		hw = ERR_PTR(ret);
> -	}
> +	} else if (devm)
> +		devres_add(dev, fix);
> 
>  	return hw;
>  }
> @@ -111,7 +129,7 @@ struct clk_hw *clk_hw_register_fixed_factor(struct
> device *dev,
>  		unsigned int mult, unsigned int div)
>  {
>  	return __clk_hw_register_fixed_factor(dev, NULL, name, parent_name, 
> -1,
> -					      flags, mult, div);
> +					      flags, mult, div, false);
>  }
>  EXPORT_SYMBOL_GPL(clk_hw_register_fixed_factor);
> 
> @@ -153,6 +171,15 @@ void clk_hw_unregister_fixed_factor(struct clk_hw 
> *hw)
>  }
>  EXPORT_SYMBOL_GPL(clk_hw_unregister_fixed_factor);
> 
> +struct clk_hw *devm_clk_hw_register_fixed_factor(struct device *dev,
> +		const char *name, const char *parent_name, unsigned long flags,
> +		unsigned int mult, unsigned int div)
> +{
> +	return __clk_hw_register_fixed_factor(dev, NULL, name, parent_name, 
> -1,
> +			flags, mult, div, true);
> +}
> +EXPORT_SYMBOL_GPL(devm_clk_hw_register_fixed_factor);
> +
>  #ifdef CONFIG_OF
>  static const struct of_device_id set_rate_parent_matches[] = {
>  	{ .compatible = "allwinner,sun4i-a10-pll3-2x-clk" },
> @@ -185,7 +212,7 @@ static struct clk_hw
> *_of_fixed_factor_clk_setup(struct device_node *node)
>  		flags |= CLK_SET_RATE_PARENT;
> 
>  	hw = __clk_hw_register_fixed_factor(NULL, node, clk_name, NULL, 0,
> -					    flags, mult, div);
> +					    flags, mult, div, false);
>  	if (IS_ERR(hw)) {
>  		/*
>  		 * Clear OF_POPULATED flag so that clock registration can be
> diff --git a/include/linux/clk-provider.h 
> b/include/linux/clk-provider.h
> index e4316890661a..58f6fe866ae9 100644
> --- a/include/linux/clk-provider.h
> +++ b/include/linux/clk-provider.h
> @@ -941,7 +941,9 @@ struct clk_hw *clk_hw_register_fixed_factor(struct
> device *dev,
>  		const char *name, const char *parent_name, unsigned long flags,
>  		unsigned int mult, unsigned int div);
>  void clk_hw_unregister_fixed_factor(struct clk_hw *hw);
> -
> +struct clk_hw *devm_clk_hw_register_fixed_factor(struct device *dev,
> +		const char *name, const char *parent_name, unsigned long flags,
> +		unsigned int mult, unsigned int div);
>  /**
>   * struct clk_fractional_divider - adjustable fractional divider clock
>   *
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
