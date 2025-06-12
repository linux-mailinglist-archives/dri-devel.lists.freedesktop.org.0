Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C905AD6805
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 08:31:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00C9B10E75F;
	Thu, 12 Jun 2025 06:31:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="N8KQDHCn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 583F610E759
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 06:31:21 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20250612063116euoutp017def65a3cb3d879eb883cb6f9a0a515d~IN9yuFAXL0364003640euoutp01p
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 06:31:16 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20250612063116euoutp017def65a3cb3d879eb883cb6f9a0a515d~IN9yuFAXL0364003640euoutp01p
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1749709876;
 bh=Ew/g1UXz/hgtaNGOb7IBVUe+5gqN+QBu6fGNGxtxMcM=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=N8KQDHCnqvKPlHmfzrZaajutrgDSMXcvnfGd+tx7QjtDpnnzyc36jRmd5unCE15w7
 SXB1V7kkhWrXeKc0Bbr15HPuEX8ddBvzDudy5+2SiipMDJvlA1p8EqfVVH9KrggMWK
 uPysBGRm1/FmIHuCdKbbP9aJezWBB/Q7Oa6Z16x0=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20250612063115eucas1p274f42f875c2ee8bfbb082da420e9b9e2~IN9yIk3KQ2436824368eucas1p2L;
 Thu, 12 Jun 2025 06:31:15 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20250612063113eusmtip2c2e86e68dc5a8d2b82f468816bdb3d44~IN9wQgs2H1607016070eusmtip2W;
 Thu, 12 Jun 2025 06:31:13 +0000 (GMT)
Message-ID: <b4d8c5b2-3ad7-4327-9985-d097d095ccb5@samsung.com>
Date: Thu, 12 Jun 2025 08:31:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 3/4] drm/atomic-helper: Re-order bridge chain
 pre-enable and post-disable
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Aradhya Bhatia
 <aradhya.bhatia@linux.dev>
Cc: DRI Development List <dri-devel@lists.freedesktop.org>, Linux Kernel
 List <linux-kernel@vger.kernel.org>, Nishanth Menon <nm@ti.com>, Vignesh
 Raghavendra <vigneshr@ti.com>, Devarsh Thakkar <devarsht@ti.com>, Jayesh
 Choudhary <j-choudhary@ti.com>, Alexander Sverdlin
 <alexander.sverdlin@siemens.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <306f142f-f9c9-44ab-a5b9-c71db76b2b80@ideasonboard.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20250612063115eucas1p274f42f875c2ee8bfbb082da420e9b9e2
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250611104512eucas1p22450fccf3bb7521760bd2d9a2a56ba19
X-EPHeader: CA
X-CMS-RootMailID: 20250611104512eucas1p22450fccf3bb7521760bd2d9a2a56ba19
References: <20250605171524.27222-1-aradhya.bhatia@linux.dev>
 <20250605171524.27222-4-aradhya.bhatia@linux.dev>
 <CGME20250611104512eucas1p22450fccf3bb7521760bd2d9a2a56ba19@eucas1p2.samsung.com>
 <2c51cf39-13cb-413f-8dd5-53bc1c11467a@samsung.com>
 <306f142f-f9c9-44ab-a5b9-c71db76b2b80@ideasonboard.com>
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

On 12.06.2025 07:49, Tomi Valkeinen wrote:
> On 11/06/2025 13:45, Marek Szyprowski wrote:
>> On 05.06.2025 19:15, Aradhya Bhatia wrote:
>>> From: Aradhya Bhatia <a-bhatia1@ti.com>
>>>
>>> Move the bridge pre_enable call before crtc enable, and the bridge
>>> post_disable call after the crtc disable.
>>>
>>> The sequence of enable after this patch will look like:
>>>
>>> 	bridge[n]_pre_enable
>>> 	...
>>> 	bridge[1]_pre_enable
>>>
>>> 	crtc_enable
>>> 	encoder_enable
>>>
>>> 	bridge[1]_enable
>>> 	...
>>> 	bridge[n]_enable
>>>
>>> And, the disable sequence for the display pipeline will look like:
>>>
>>> 	bridge[n]_disable
>>> 	...
>>> 	bridge[1]_disable
>>>
>>> 	encoder_disable
>>> 	crtc_disable
>>>
>>> 	bridge[1]_post_disable
>>> 	...
>>> 	bridge[n]_post_disable
>>>
>>> The definition of bridge pre_enable hook says that,
>>> "The display pipe (i.e. clocks and timing signals) feeding this bridge
>>> will not yet be running when this callback is called".
>>>
>>> Since CRTC is also a source feeding the bridge, it should not be enabled
>>> before the bridges in the pipeline are pre_enabled. Fix that by
>>> re-ordering the sequence of bridge pre_enable and bridge post_disable.
>>>
>>> While at it, update the drm bridge API documentation as well.
>>>
>>> Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>>> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> Tested-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>>> Tested-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
>>> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
>>> Signed-off-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>
>> This patch landed in today's linux-next as commit c9b1150a68d9
>> ("drm/atomic-helper: Re-order bridge chain pre-enable and
>> post-disable"). In my tests I found that it breaks booting of Samsung
>> Exynos 5420/5800 based Chromebooks (Peach-Pit and Peach-Pi). Both of
>> them use Exynos DRM with Exynos_DP sub-driver (Analogix DP) and EDP
>> panel. Booting stops at '[drm] Initialized exynos 1.1.0 for exynos-drm
>> on minor 0' message. On the other hand, the Samsung Exynos5250 based
>> Snow Chromebook boots fine, but it uses dp-lvds nxp,ptn3460 bridge and
>> lvds panel instead of edp panels. This looks like some sort of deadlock,
>> because if I disable FBDEV emulation, those boards boots fine and I'm
>> able to run modetest and enable the display. Also the DRM kernel logger
>> seems to be working fine, although I didn't check the screen output yet,
>> as I only have a remote access to those boards. I will investigate it
>> further and let You know.
> Thanks for the report. I was trying to understand the pipeline, but I'm
> a bit confused. Above you say Peach-Pit uses DP and EDP panel, but if I
> look at arch/arm/boot/dts/samsung/exynos5420-peach-pit.dts, it connects
> a dp->lvds bridge (parade,ps8625). Peach-Pi seems to connect to an eDP
> panel.
>
> Is the above correct? Do both Peach-Pi and Peach-Pit fail?

Yes, sorry, my fault. I much have checked the same (peach-pi) dts 2 
times. Both Peach-Pi and Peach-Pit fails, while Snow works fine. All 
three use the same Exynos DP (based on analogix dp) driver. I will try 
to play a bit more with those boards in the afternoon, hopefully getting 
some more hints where the issue is.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

