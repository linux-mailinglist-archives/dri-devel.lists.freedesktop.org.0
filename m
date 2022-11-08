Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1404E620B7E
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 09:50:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A837010E387;
	Tue,  8 Nov 2022 08:50:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9917910E387
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Nov 2022 08:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667897417; x=1699433417;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=jFIL6USopUv/jWoMGtY660ve925tW6XRYFhviRTLutk=;
 b=Y6ulNGcgWstImt/qG51c5fFV0NMTY4/qFAWtt/NWcdvP593wFsdS72/b
 pBZDY2jAJ9Rej8FrWSUlAQfkqLcBz5/LSLtFeuDHINWVmQ0RlKbv1lh/F
 VAm9IoLf8vbJXbRLFDI2GNVANmEQQQvCG9x3F9+SAtsZQg5wexZRazrRd
 69U2pfxYjqRYGCjjjnkxhZaK10Z8GG0fwEV0ti3i4JMeju1Qb1FuoorEA
 /JDStoP3JWRHhZusLNT/XukC6LEM4l2YBNwN1QAiCcDfa7Q+UucC0euco
 IE9yiB7DCFtreRG0nxwx1fXNi2xbeHEGVd+TPKbN+PlZp2qyIA9pTFVRt Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="290363414"
X-IronPort-AV: E=Sophos;i="5.96,147,1665471600"; d="scan'208";a="290363414"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2022 00:50:05 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="699843552"
X-IronPort-AV: E=Sophos;i="5.96,147,1665471600"; d="scan'208";a="699843552"
Received: from lkurylo-mobl2.ger.corp.intel.com (HELO [10.213.23.49])
 ([10.213.23.49])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2022 00:50:02 -0800
Message-ID: <aa5ffd76-d95a-8aea-ddc9-eaf8e95a73ce@intel.com>
Date: Tue, 8 Nov 2022 09:50:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: [PATCH] drm/bridge: megachips: Fix error handling in
 i2c_register_driver()
To: Yuan Can <yuancan@huawei.com>, peter.senna@gmail.com,
 martin.donnelly@ge.com, martyn.welch@collabora.co.uk,
 neil.armstrong@linaro.org, robert.foss@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, daniel@ffwll.ch,
 architt@codeaurora.org, dri-devel@lists.freedesktop.org
References: <20221108082956.35802-1-yuancan@huawei.com>
Content-Language: en-US
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20221108082956.35802-1-yuancan@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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



On 08.11.2022 09:29, Yuan Can wrote:
> A problem about insmod megachips-stdpxxxx-ge-b850v3-fw.ko failed is
> triggered with the following log given:
>
> [ 4497.981497] Error: Driver 'stdp4028-ge-b850v3-fw' is already registered, aborting...
> insmod: ERROR: could not insert module megachips-stdpxxxx-ge-b850v3-fw.ko: Device or resource busy
>
> The reason is that stdpxxxx_ge_b850v3_init() returns i2c_add_driver()
> directly without checking its return value, if i2c_add_driver() failed,
> it returns without calling i2c_del_driver() on the previous i2c driver,
> resulting the megachips-stdpxxxx-ge-b850v3-fw can never be installed
> later.
> A simple call graph is shown as below:
>
>   stdpxxxx_ge_b850v3_init()
>     i2c_add_driver(&stdp4028_ge_b850v3_fw_driver)
>     i2c_add_driver(&stdp2690_ge_b850v3_fw_driver)
>       i2c_register_driver()
>         driver_register()
>           bus_add_driver()
>             priv = kzalloc(...) # OOM happened
>     # return without delete stdp4028_ge_b850v3_fw_driver
>
> Fix by calling i2c_del_driver() on stdp4028_ge_b850v3_fw_driver when
> i2c_add_driver() returns error.
>
> Fixes: fcfa0ddc18ed ("drm/bridge: Drivers for megachips-stdpxxxx-ge-b850v3-fw (LVDS-DP++)")
> Signed-off-by: Yuan Can <yuancan@huawei.com>
> ---
>   drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
> index 97359f807bfc..0d037eeefcf3 100644
> --- a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
> +++ b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
> @@ -440,7 +440,13 @@ static int __init stdpxxxx_ge_b850v3_init(void)
>   	if (ret)
>   		return ret;
>   
> -	return i2c_add_driver(&stdp2690_ge_b850v3_fw_driver);
> +	ret = i2c_add_driver(&stdp2690_ge_b850v3_fw_driver);
> +	if (ret) {
> +		i2c_del_driver(&stdp4028_ge_b850v3_fw_driver);
> +		return ret;
> +	}
> +
> +	return 0;

Could be:
ret = i2c_add_driver(&stdp2690_ge_b850v3_fw_driver);
if (ret)
     i2c_del_driver(&stdp4028_ge_b850v3_fw_driver);
return ret;

Up to you. Anyway:
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej

>   }
>   module_init(stdpxxxx_ge_b850v3_init);
>   

