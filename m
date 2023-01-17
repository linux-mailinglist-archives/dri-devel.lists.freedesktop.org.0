Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB8066DC5A
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jan 2023 12:28:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBD3110E195;
	Tue, 17 Jan 2023 11:28:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABEE710E195
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 11:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673954884; x=1705490884;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=QWWftZhd4SLLECtEcPjAU+Q3Hy5BGqJ3G3uT7xsr2iY=;
 b=htTuL3t7sNE+QHauTqWw35uCAj3T5oBXTKTJuZ4GhdBbJZHEZIKyUVBL
 Zo34Ucw+PuvuGNPU4+D2pzBwILUEWYwfHTAbRneuwMokmNRXcfawhDB6b
 UtC3U8mgtg1fjgq/ratRbsH9cdao9j+GuI2Zth2LzQOjtlugHPnJ6kh6y
 gp+fGL3W2PBMkhEvf91rhhxSKxhI2cGvqPiiid2oZyCfod5tYyiLDPVeO
 lYAxHvmnTUxBW4eYaSqCJpnj+SSAxmDFwobbfG0Tp69SIwjvYC1WXD2Ln
 7hNphVeujagzuRHE0InwWcxE+923IlL7+QEvI1uO3nFLEBdazwBMBh8Gf A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="324725116"
X-IronPort-AV: E=Sophos;i="5.97,222,1669104000"; d="scan'208";a="324725116"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2023 03:28:04 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="783209443"
X-IronPort-AV: E=Sophos;i="5.97,222,1669104000"; d="scan'208";a="783209443"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.10.213])
 ([10.213.10.213])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2023 03:28:01 -0800
Message-ID: <57122f06-340e-5eea-1a1e-0b9017d25ed1@intel.com>
Date: Tue, 17 Jan 2023 12:27:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.1
Subject: Re: [PATCH 1/1] drm/bridge: sii902x: Use dev_err_probe
Content-Language: en-US
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230117105903.2068235-1-alexander.stein@ew.tq-group.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20230117105903.2068235-1-alexander.stein@ew.tq-group.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 17.01.2023 11:59, Alexander Stein wrote:
> This helps figuring out why the device probe is deferred.
>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>   drivers/gpu/drm/bridge/sii902x.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
> index d212ff7f7a87..f4a8f227c41b 100644
> --- a/drivers/gpu/drm/bridge/sii902x.c
> +++ b/drivers/gpu/drm/bridge/sii902x.c
> @@ -1116,7 +1116,8 @@ static int sii902x_probe(struct i2c_client *client)
>   		sii902x->next_bridge = of_drm_find_bridge(remote);
>   		of_node_put(remote);
>   		if (!sii902x->next_bridge)
> -			return -EPROBE_DEFER;
> +			return dev_err_probe(dev, -EPROBE_DEFER,
> +					     "Failed to find remote bridge\n");

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej

>   	}
>   
>   	mutex_init(&sii902x->mutex);

