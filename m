Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45587659A06
	for <lists+dri-devel@lfdr.de>; Fri, 30 Dec 2022 16:37:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D148310E140;
	Fri, 30 Dec 2022 15:37:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E93F510E140
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Dec 2022 15:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1672414667; x=1703950667;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=PAx56ZENjsCB5hUOX9aS/7Fwz8yCIwa/E6TZBG11sYI=;
 b=VLwN+fMOWVhy2UOQtKWYEGWyd3iXblqAHtTWYUeLKKsBVoXOCoy4GShT
 a1pbHFvKXH4y/QXnA653QnysCpGCcliBftbnA6D8F7WxbfbaXB1Vinqks
 qOkVlU1x2bj8AWkQNSesipzB2yEXx0RjaFWynDwhr7jjtBhWpDbV7ndml
 ICmD1WhPeJGxznEwU1hVBMY14gPKL2elk/o8a6da8A7VioAfOhlvB037N
 4r66mnVJSukMPD+tLVXsiHjwxLh7CxkgGwiF5myNo7d6c8Ip9IxbPlcXk
 KHImo3noU33ipmGB2fQ4enaovkTz5j8jNaicl/BK1pi7trKRs/yq7/ABl A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10576"; a="348433403"
X-IronPort-AV: E=Sophos;i="5.96,287,1665471600"; d="scan'208";a="348433403"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2022 07:37:47 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10576"; a="631556267"
X-IronPort-AV: E=Sophos;i="5.96,287,1665471600"; d="scan'208";a="631556267"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.2.40])
 ([10.213.2.40])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2022 07:37:44 -0800
Message-ID: <eb919e0b-8dd3-00e3-a2e9-2b6daf378539@intel.com>
Date: Fri, 30 Dec 2022 16:37:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.1
Subject: Re: [PATCH] drm/bridge: tc358767: Use devm_clk_get_enabled() helper
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <4f855984ea895e1488169e77935fa6e044912ac2.1672414073.git.christophe.jaillet@wanadoo.fr>
Content-Language: en-US
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <4f855984ea895e1488169e77935fa6e044912ac2.1672414073.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 30.12.2022 16:29, Christophe JAILLET wrote:
> The devm_clk_get_enabled() helper:
>     - calls devm_clk_get()
>     - calls clk_prepare_enable() and registers what is needed in order to
>       call clk_disable_unprepare() when needed, as a managed resource.
>
> This simplifies the code and avoids the need of a dedicated function used
> with devm_add_action_or_reset().
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>   drivers/gpu/drm/bridge/tc358767.c | 17 +----------------
>   1 file changed, 1 insertion(+), 16 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
> index 2a58eb271f70..b95c36ca660d 100644
> --- a/drivers/gpu/drm/bridge/tc358767.c
> +++ b/drivers/gpu/drm/bridge/tc358767.c
> @@ -2022,13 +2022,6 @@ static int tc_probe_bridge_endpoint(struct tc_data *tc)
>   	return -EINVAL;
>   }
>   
> -static void tc_clk_disable(void *data)
> -{
> -	struct clk *refclk = data;
> -
> -	clk_disable_unprepare(refclk);
> -}
> -
>   static int tc_probe(struct i2c_client *client, const struct i2c_device_id *id)
>   {
>   	struct device *dev = &client->dev;
> @@ -2045,21 +2038,13 @@ static int tc_probe(struct i2c_client *client, const struct i2c_device_id *id)
>   	if (ret)
>   		return ret;
>   
> -	tc->refclk = devm_clk_get(dev, "ref");
> +	tc->refclk = devm_clk_get_enabled(dev, "ref");
>   	if (IS_ERR(tc->refclk)) {
>   		ret = PTR_ERR(tc->refclk);
>   		dev_err(dev, "Failed to get refclk: %d\n", ret);

You can adjust the message and convert to dev_err_probe.
With that:
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej


>   		return ret;
>   	}
>   
> -	ret = clk_prepare_enable(tc->refclk);
> -	if (ret)
> -		return ret;
> -
> -	ret = devm_add_action_or_reset(dev, tc_clk_disable, tc->refclk);
> -	if (ret)
> -		return ret;
> -
>   	/* tRSTW = 100 cycles , at 13 MHz that is ~7.69 us */
>   	usleep_range(10, 15);
>   

