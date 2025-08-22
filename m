Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5970CB31097
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 09:37:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6F9810EA80;
	Fri, 22 Aug 2025 07:37:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="eE2/A4xS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A41110EA80
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 07:37:30 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20250822073728euoutp010bf4012a8c11778fbf82587176f86457~eBq3v2m1m2775127751euoutp01B
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 07:37:28 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20250822073728euoutp010bf4012a8c11778fbf82587176f86457~eBq3v2m1m2775127751euoutp01B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1755848248;
 bh=YpD640TC5fGnjxgE2tIiQAR4qbkw8FJ8AkBFrdbOroQ=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=eE2/A4xSGHrbR+sD7qA1wNESSbzmc5PyKo9Jn17vlWjXRJkrCLlhru7gIBq0RWV+X
 7QY7tdM/octqsMkr2pVu9PVaszpEM/KDgQvglkPHSyDjRoeQHd8clnGTpetaKeJvkO
 vXdIMMkdL2wjIRPTXuWXWw/uPi49XSZAEYIa1P6k=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20250822073728eucas1p2fd9f391cfd7d60040e809c96fffb8f9c~eBq3OXfdB2922529225eucas1p2W;
 Fri, 22 Aug 2025 07:37:28 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20250822073726eusmtip23349aa599dce22b1587cd9779d4d8825~eBq1yhVNn1837618376eusmtip29;
 Fri, 22 Aug 2025 07:37:26 +0000 (GMT)
Message-ID: <1979fe6e-7a54-4812-9878-b4ce286401b2@samsung.com>
Date: Fri, 22 Aug 2025 09:37:25 +0200
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v2 3/3] drm/bridge: sii9234: use extcon cable detection
 logic to detect MHL
To: Henrik Grimler <henrik@grimler.se>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, replicant@osuosl.org,
 linux-kernel@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20250818142622.GA286180@grimfrac.localdomain>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250822073728eucas1p2fd9f391cfd7d60040e809c96fffb8f9c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250724185204eucas1p1d699db3abebc702ea8261b2e41a77c52
X-EPHeader: CA
X-CMS-RootMailID: 20250724185204eucas1p1d699db3abebc702ea8261b2e41a77c52
References: <20250724-exynos4-sii9234-driver-v2-0-faee244f1d40@grimler.se>
 <CGME20250724185204eucas1p1d699db3abebc702ea8261b2e41a77c52@eucas1p1.samsung.com>
 <20250724-exynos4-sii9234-driver-v2-3-faee244f1d40@grimler.se>
 <1840a54c-c03a-42e3-a3a8-52e38919df38@samsung.com>
 <20250818142622.GA286180@grimfrac.localdomain>
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

On 18.08.2025 16:26, Henrik Grimler wrote:
> On Thu, Aug 14, 2025 at 01:26:33PM +0200, Marek Szyprowski wrote:
>> On 24.07.2025 20:50, Henrik Grimler wrote:
>>> To use MHL we currently need the MHL chip to be permanently on, which
>>> consumes unnecessary power. Let's use extcon attached to MUIC to enable
>>> the MHL chip only if it detects an MHL cable.
>>>
>>> Signed-off-by: Henrik Grimler <henrik@grimler.se>
>>> ---
>>> v2: add dependency on extcon. Issue reported by kernel test robot
>>>       <lkp@intel.com>
>>> ---
>>>    drivers/gpu/drm/bridge/Kconfig   |  1 +
>>>    drivers/gpu/drm/bridge/sii9234.c | 89 ++++++++++++++++++++++++++++++++++++++--
>>>    2 files changed, 87 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
>>> index b9e0ca85226a603a24f90c6879d1499f824060cb..f18a083f6e1c6fe40bde5e65a1548acc61a162ae 100644
>>> --- a/drivers/gpu/drm/bridge/Kconfig
>>> +++ b/drivers/gpu/drm/bridge/Kconfig
>>> @@ -303,6 +303,7 @@ config DRM_SII902X
>>>    config DRM_SII9234
>>>    	tristate "Silicon Image SII9234 HDMI/MHL bridge"
>>>    	depends on OF
>>> +	select EXTCON
>>>    	help
>>>    	  Say Y here if you want support for the MHL interface.
>>>    	  It is an I2C driver, that detects connection of MHL bridge
>>> diff --git a/drivers/gpu/drm/bridge/sii9234.c b/drivers/gpu/drm/bridge/sii9234.c
>>> index 0e0bb1bf71fdcef788715cfd6fa158a6992def33..4d84ba01ea76816bebdbc29d48a041c9c6cd508e 100644
>>> --- a/drivers/gpu/drm/bridge/sii9234.c
>>> +++ b/drivers/gpu/drm/bridge/sii9234.c
> [ ...]
>
>>> +
>>> +	edev = extcon_find_edev_by_node(muic);
>>> +	of_node_put(muic);
>>> +	if (IS_ERR(edev)) {
>>> +		dev_err_probe(ctx->dev, PTR_ERR(edev),
>>> +			      "invalid or missing extcon\n");
>>> +	}
>> It looks that the original logic got lost somehow in the above code
>> block, what causes kernel oops if compiled as module and loaded before
>> extcon provider. Please handle -EPROBE_DEFER and propagate error value,
>> like the original code did in sii8620 driver:
>>
>>           if (IS_ERR(edev)) {
>>                   if (PTR_ERR(edev) == -EPROBE_DEFER)
>>                           return -EPROBE_DEFER;
>>                   dev_err(ctx->dev, "Invalid or missing extcon\n");
>>                   return PTR_ERR(edev);
>>           }
> Thanks for detecting the issue! I think my code is just missing return
> before dev_err_probe (same mistake as I did on patch 2). With return
> added I have not been able to reproduce any kernel oops, but if
> CONFIG_DRM_SII9234=y and CONFIG_EXTCON_MAX77693=m then it seems like
> linux gets stuck probing sii9234 and waiting for the extcon provider
> (verified with some printf debugging). This happens for me both with:
>
> 	edev = extcon_find_edev_by_node(muic);
> 	of_node_put(muic);
> 	if (IS_ERR(edev)) {
> 		return dev_err_probe(ctx->dev, PTR_ERR(edev),
> 				     "Invalid or missing extcon\n");
> 	}
>
> and
>
> 	edev = extcon_find_edev_by_node(muic);
> 	of_node_put(muic);
> 	if (IS_ERR(edev)) {
> 		if (PTR_ERR(edev) == -EPROBE_DEFER)
> 			return -EPROBE_DEFER;
> 		dev_err(ctx->dev, "Invalid or missing extcon\n");
> 		return PTR_ERR(edev);
> 	}
>
> I am not sure what to do to fix the issue, as far as I can see probe
> logic and extcon handling is the same as in sil-sii8620 and ite-it6505
> (i.e. the other bridges that use extcon). Will investigate further.

Indeed your code lacked only the return directive, I've noticed that 
just after sending my reply.

I'm not sure if there is a simple way to solve the endless probe issue 
with sii9234=y and max77963=m. We have to rely on the user to either 
keep all drivers compiled-in or configured as modules here. Afair the 
same issue happens with sii8620 and max77843.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

