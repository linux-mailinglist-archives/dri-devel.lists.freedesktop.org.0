Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F6F659A0B
	for <lists+dri-devel@lfdr.de>; Fri, 30 Dec 2022 16:40:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20EDF10E17D;
	Fri, 30 Dec 2022 15:40:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E18FB10E17D
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Dec 2022 15:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1672414802; x=1703950802;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=TIFFIonNfFuuxbjnwg8CcM1HsTMfK/pa2Ssm4mBgVPE=;
 b=KpHIqsrDzZ+xi0ZuCnzrPaplrmcibFIUT8egOQJE0TNO8DlHRTD0Vx+4
 eJn412AKvftE27QGqwGzXbAIONdGptRqMqgPockt41HdqQ4ggszlaU0XU
 CcbI8xZUPPyy7G4BBCtrZTnNcXq/dGY/RS1EXmL4zE60Ha3OB9mK0Xi4l
 EPYm5Y109T0l6rQnWEfKkgoYBISUevoDCGqv5Zp8o8CyITftgAZEPjXyP
 3kZ5WPDC6O2IWd1MUHWdxTNgZ87yVkA6sQ/M1fTwHG51NMixaX947whrX
 Dy35VljIsNXKvjuOXvc0+gvoFtmlh1GKUnrV+okLxkcJMNJLY+P+DIwYE Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10576"; a="318919501"
X-IronPort-AV: E=Sophos;i="5.96,287,1665471600"; d="scan'208";a="318919501"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2022 07:40:02 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10576"; a="796256472"
X-IronPort-AV: E=Sophos;i="5.96,287,1665471600"; d="scan'208";a="796256472"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.2.40])
 ([10.213.2.40])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2022 07:39:59 -0800
Message-ID: <354afea4-f909-8352-753d-0f2509d7165b@intel.com>
Date: Fri, 30 Dec 2022 16:39:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.1
Subject: Re: [PATCH] drm/bridge: sii902x: Allow reset line to be tied to a
 sleepy GPIO controller
Content-Language: en-US
To: Wadim Egorov <w.egorov@phytec.de>, upstream@lists.phytec.de,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20221228145704.939801-1-w.egorov@phytec.de>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20221228145704.939801-1-w.egorov@phytec.de>
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
Cc: neil.armstrong@linaro.org, jernej.skrabec@gmail.com, jonas@kwiboo.se,
 robert.foss@linaro.org, Laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 28.12.2022 15:57, Wadim Egorov wrote:
> Switch to gpiod_set_value_cansleep() in sii902x_reset().
> This is relevant if the reset line is tied to a I2C GPIO
> controller.
>
> Signed-off-by: Wadim Egorov <w.egorov@phytec.de>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej
> ---
>   drivers/gpu/drm/bridge/sii902x.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
> index 878fb7d3732b..980611aec2f6 100644
> --- a/drivers/gpu/drm/bridge/sii902x.c
> +++ b/drivers/gpu/drm/bridge/sii902x.c
> @@ -240,12 +240,12 @@ static void sii902x_reset(struct sii902x *sii902x)
>   	if (!sii902x->reset_gpio)
>   		return;
>   
> -	gpiod_set_value(sii902x->reset_gpio, 1);
> +	gpiod_set_value_cansleep(sii902x->reset_gpio, 1);
>   
>   	/* The datasheet says treset-min = 100us. Make it 150us to be sure. */
>   	usleep_range(150, 200);
>   
> -	gpiod_set_value(sii902x->reset_gpio, 0);
> +	gpiod_set_value_cansleep(sii902x->reset_gpio, 0);
>   }
>   
>   static enum drm_connector_status sii902x_detect(struct sii902x *sii902x)

