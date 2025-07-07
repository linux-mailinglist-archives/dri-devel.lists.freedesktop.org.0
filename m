Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61776AFAF39
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 11:07:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7636E10E2FF;
	Mon,  7 Jul 2025 09:07:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="AYP8gN4m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6012B10E2FF
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jul 2025 09:07:31 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20250707090729euoutp01ffa1efc063f15c25b82c2f07b2de6398~P7OVGfh-y0752107521euoutp01u
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jul 2025 09:07:29 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20250707090729euoutp01ffa1efc063f15c25b82c2f07b2de6398~P7OVGfh-y0752107521euoutp01u
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1751879249;
 bh=Y+WTGTfibJ5eSDG3K05YVKH1It4POvqtLGku+Kq3pgs=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=AYP8gN4mwDrfOPll6wSgOgLlY4nt2Y/1HDKgqoNs2Ot/eVUSAYAoTHwrE56pJK14c
 R0cxO9xW3qW1fBKNWF6E48+4RU7OefeE2ICsuwY8mlOwEecJd0rlivSKZ8pVuCC65o
 gC7ONtirZJHLSqChGyd8ecLu6bGnMKfkSjY5FwYA=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20250707090729eucas1p10d0e5d5975ff4b99fecd923dcd139410~P7OUnLywT1807218072eucas1p1m;
 Mon,  7 Jul 2025 09:07:29 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20250707090727eusmtip1bfe269ba95882ee89132cbb6f7b9e667~P7OS2l_6y2736627366eusmtip1V;
 Mon,  7 Jul 2025 09:07:27 +0000 (GMT)
Message-ID: <ce9c6aa3-5372-468f-a4bf-5a261259e459@samsung.com>
Date: Mon, 7 Jul 2025 11:07:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/bridge: analogix_dp: Use devm_drm_bridge_alloc() API
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, Maxime Ripard
 <mripard@kernel.org>
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
In-Reply-To: <20250703175032.6f49f862@booty>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250707090729eucas1p10d0e5d5975ff4b99fecd923dcd139410
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250627165702eucas1p12dbc50fea261d6846e67880bbef5c564
X-EPHeader: CA
X-CMS-RootMailID: 20250627165702eucas1p12dbc50fea261d6846e67880bbef5c564
References: <CGME20250627165702eucas1p12dbc50fea261d6846e67880bbef5c564@eucas1p1.samsung.com>
 <20250627165652.580798-1-m.szyprowski@samsung.com>
 <20250630-famous-dark-boar-89bed7@houat> <20250701160219.20dc7466@booty>
 <20250701-petite-mutant-starling-24bbe5@houat>
 <20250703175032.6f49f862@booty>
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

On 03.07.2025 17:50, Luca Ceresoli wrote:
> On Tue, 1 Jul 2025 16:27:54 +0200
> Maxime Ripard <mripard@kernel.org> wrote:
>
>> On Tue, Jul 01, 2025 at 04:02:19PM +0200, Luca Ceresoli wrote:
>>> Hello Marek, Maxime,
>>>
>>> thanks Marek for spotting the issue and sending a patch!
>>>
>>> On Mon, 30 Jun 2025 18:44:24 +0200
>>> Maxime Ripard <mripard@kernel.org> wrote:
>>>    
>>>>> @@ -1643,7 +1625,7 @@ int analogix_dp_bind(struct analogix_dp_device *dp, struct drm_device *drm_dev)
>>>>>   		return ret;
>>>>>   	}
>>>>>   
>>>>> -	ret = analogix_dp_create_bridge(drm_dev, dp);
>>>>> +	ret = drm_bridge_attach(dp->encoder, &dp->bridge, NULL, 0);
>>>>>   	if (ret) {
>>>>>   		DRM_ERROR("failed to create bridge (%d)\n", ret);
>>>>>   		goto err_unregister_aux;
>>>> It looks like you don't set bridge->driver_private anymore. Is it on purpose?
>>> This looks correct to me. In current code, driver_private is used to
>>> hold a pointer to the driver private struct (struct
>>> analogix_dp_device). With devm_drm_bridge_alloc() container_of() is now
>>> enough, no pointer is needed. With the patch applied, driver_private
>>> becomes unused.
>> Then we should remove it from the structure if it's unused.
> Makes sense now that struct drm_bridge is meant to be always embedded
> in a driver-private struct. But several drivers are still using it, so
> those would need to be updated beforehand:
>
> $ git grep  -l driver_private -- drivers/gpu/drm/ | wc -l
> 23
> $
>
> So I think this patch should be taken as it fixes a regression. Do you
> agree on this?

Yes, please apply it as a fix :)


BTW, there are 2 more bridge drivers that need a fix similar to the 
$subject patch:

$ git grep "bridge = devm_kzalloc" drivers/gpu
drivers/gpu/drm/sti/sti_hda.c:  bridge = devm_kzalloc(dev, 
sizeof(*bridge), GFP_KERNEL);
drivers/gpu/drm/sti/sti_hdmi.c: bridge = devm_kzalloc(dev, 
sizeof(*bridge), GFP_KERNEL);

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

