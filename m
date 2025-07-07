Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D7EAFB0DD
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 12:13:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 155D810E34C;
	Mon,  7 Jul 2025 10:12:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="r8ugPi4o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEE7810E34C
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jul 2025 10:12:55 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20250707101253euoutp024530266cc22508fe06fcb3955754114d~P8Hb-8PJF1098310983euoutp02f
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jul 2025 10:12:53 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20250707101253euoutp024530266cc22508fe06fcb3955754114d~P8Hb-8PJF1098310983euoutp02f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1751883174;
 bh=OwHJKGqZZ/uQTud01MY+VVC+0t9+zGORAkOF8ReVO/Y=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=r8ugPi4oQqhlot2S5DGslfNxLON3gmPRpk+ULM0YaXK0atTQNAvPC5hFU2Qbr1nkm
 j1ZiI3lCTHBatU0HKSLpkuh3fB3qoZ9LqN6kYRLqq9JE26meN6k/fIJPlQsRZllt7B
 vyyRecFsF+y1lApCIkn9brVfLACPbQ51UfLSUHiU=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20250707101253eucas1p26cce2f186000110cfcde542f56ebec72~P8Hbml-qz2405524055eucas1p2Z;
 Mon,  7 Jul 2025 10:12:53 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20250707101252eusmtip2f24577f3233740700385574e9433b100~P8HayZTnr2932929329eusmtip2Y;
 Mon,  7 Jul 2025 10:12:52 +0000 (GMT)
Message-ID: <4e37e409-9e87-4e49-a296-9006fd552a5d@samsung.com>
Date: Mon, 7 Jul 2025 12:12:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/bridge: analogix_dp: Use devm_drm_bridge_alloc() API
To: Maxime Ripard <mripard@kernel.org>, Luca Ceresoli
 <luca.ceresoli@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Douglas Anderson <dianders@chromium.org>, Damon Ding
 <damon.ding@rock-chips.com>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20250707-just-gray-sheep-1d8be4@houat>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20250707101253eucas1p26cce2f186000110cfcde542f56ebec72
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250627165702eucas1p12dbc50fea261d6846e67880bbef5c564
X-EPHeader: CA
X-CMS-RootMailID: 20250627165702eucas1p12dbc50fea261d6846e67880bbef5c564
References: <CGME20250627165702eucas1p12dbc50fea261d6846e67880bbef5c564@eucas1p1.samsung.com>
 <20250627165652.580798-1-m.szyprowski@samsung.com>
 <20250630-famous-dark-boar-89bed7@houat> <20250701160219.20dc7466@booty>
 <20250701-petite-mutant-starling-24bbe5@houat>
 <20250703175032.6f49f862@booty> <20250707-just-gray-sheep-1d8be4@houat>
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

On 07.07.2025 11:21, Maxime Ripard wrote:
> On Thu, Jul 03, 2025 at 05:50:32PM +0200, Luca Ceresoli wrote:
>> On Tue, 1 Jul 2025 16:27:54 +0200
>> Maxime Ripard <mripard@kernel.org> wrote:
>>
>>> On Tue, Jul 01, 2025 at 04:02:19PM +0200, Luca Ceresoli wrote:
>>>> Hello Marek, Maxime,
>>>>
>>>> thanks Marek for spotting the issue and sending a patch!
>>>>
>>>> On Mon, 30 Jun 2025 18:44:24 +0200
>>>> Maxime Ripard <mripard@kernel.org> wrote:
>>>>    
>>>>>> @@ -1643,7 +1625,7 @@ int analogix_dp_bind(struct analogix_dp_device *dp, struct drm_device *drm_dev)
>>>>>>   		return ret;
>>>>>>   	}
>>>>>>   
>>>>>> -	ret = analogix_dp_create_bridge(drm_dev, dp);
>>>>>> +	ret = drm_bridge_attach(dp->encoder, &dp->bridge, NULL, 0);
>>>>>>   	if (ret) {
>>>>>>   		DRM_ERROR("failed to create bridge (%d)\n", ret);
>>>>>>   		goto err_unregister_aux;
>>>>> It looks like you don't set bridge->driver_private anymore. Is it on purpose?
>>>> This looks correct to me. In current code, driver_private is used to
>>>> hold a pointer to the driver private struct (struct
>>>> analogix_dp_device). With devm_drm_bridge_alloc() container_of() is now
>>>> enough, no pointer is needed. With the patch applied, driver_private
>>>> becomes unused.
>>> Then we should remove it from the structure if it's unused.
>> Makes sense now that struct drm_bridge is meant to be always embedded
>> in a driver-private struct. But several drivers are still using it, so
>> those would need to be updated beforehand:
>>
>> $ git grep  -l driver_private -- drivers/gpu/drm/ | wc -l
>> 23
>> $
> Ah, you're right, sorry for the noise.
>
>> So I think this patch should be taken as it fixes a regression. Do you
>> agree on this?
> As far as I know, that commit only exists in drm-misc-next. Also, it
> should have a Fixes tag.

I wasn't sure which commit should be listed as Fixes tag in this case. 
The mentioned 9c399719cfb9 ("drm: convert many bridge drivers from 
devm_kzalloc() to devm_drm_bridge_alloc() API")?

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

