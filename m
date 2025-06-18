Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82793ADE3B7
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 08:30:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F8E710E1B1;
	Wed, 18 Jun 2025 06:30:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="hcsD/gx9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7416A10E1B1
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 06:30:44 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20250618063042euoutp01ea85783521996cfd2eb5060dc565c447~KD1A7cwyt1236212362euoutp01z
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 06:30:42 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20250618063042euoutp01ea85783521996cfd2eb5060dc565c447~KD1A7cwyt1236212362euoutp01z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1750228242;
 bh=1MbaT0M7X+CNTBBnoBOvgEnKdguYyI7xZByqq7AW85k=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=hcsD/gx9V+csWpPcpEEp5NayqibX3OEVerbVqTihwEcZCdKVtFrTGWI6N7YKV3Tyv
 5okxdGJBjsWtOapQ1pR2x8+8iq2akDl8IG8MHtP+WmR0zep0ZkQ9HNV2sE+oAcD9Tx
 1a2SlFRc0EorrYRUBHsuCjpHRUpJzcAB9kS3b+/w=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20250618063041eucas1p18f188e6ec774c7e773f54cb8c1df5a64~KD1Aez1Bm2197421974eucas1p1l;
 Wed, 18 Jun 2025 06:30:41 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20250618063040eusmtip13b23ecaefd4dc334c29cce63c7b33ae2~KD0-cfd6C2880328803eusmtip1F;
 Wed, 18 Jun 2025 06:30:40 +0000 (GMT)
Message-ID: <d005ad5c-aded-4dea-b6eb-a9ce78c04728@samsung.com>
Date: Wed, 18 Jun 2025 08:30:39 +0200
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
In-Reply-To: <3adb1d12-7cd5-4beb-9978-c3cae702f338@ideasonboard.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20250618063041eucas1p18f188e6ec774c7e773f54cb8c1df5a64
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
 <b4d8c5b2-3ad7-4327-9985-d097d095ccb5@samsung.com>
 <3adb1d12-7cd5-4beb-9978-c3cae702f338@ideasonboard.com>
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

On 16.06.2025 17:40, Tomi Valkeinen wrote:
> On 12/06/2025 09:31, Marek Szyprowski wrote:
>> On 12.06.2025 07:49, Tomi Valkeinen wrote:
>>> On 11/06/2025 13:45, Marek Szyprowski wrote:
>>>> On 05.06.2025 19:15, Aradhya Bhatia wrote:
>>>>> From: Aradhya Bhatia <a-bhatia1@ti.com>
>>>>>
>>>>> Move the bridge pre_enable call before crtc enable, and the bridge
>>>>> post_disable call after the crtc disable.
>>>>>
>>>>> The sequence of enable after this patch will look like:
>>>>>
>>>>> 	bridge[n]_pre_enable
>>>>> 	...
>>>>> 	bridge[1]_pre_enable
>>>>>
>>>>> 	crtc_enable
>>>>> 	encoder_enable
>>>>>
>>>>> 	bridge[1]_enable
>>>>> 	...
>>>>> 	bridge[n]_enable
>>>>>
>>>>> And, the disable sequence for the display pipeline will look like:
>>>>>
>>>>> 	bridge[n]_disable
>>>>> 	...
>>>>> 	bridge[1]_disable
>>>>>
>>>>> 	encoder_disable
>>>>> 	crtc_disable
>>>>>
>>>>> 	bridge[1]_post_disable
>>>>> 	...
>>>>> 	bridge[n]_post_disable
>>>>>
>>>>> The definition of bridge pre_enable hook says that,
>>>>> "The display pipe (i.e. clocks and timing signals) feeding this bridge
>>>>> will not yet be running when this callback is called".
>>>>>
>>>>> Since CRTC is also a source feeding the bridge, it should not be enabled
>>>>> before the bridges in the pipeline are pre_enabled. Fix that by
>>>>> re-ordering the sequence of bridge pre_enable and bridge post_disable.
>>>>>
>>>>> While at it, update the drm bridge API documentation as well.
>>>>>
>>>>> Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>>>>> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>>>>> Tested-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>>>>> Tested-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
>>>>> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
>>>>> Signed-off-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>
>>>> This patch landed in today's linux-next as commit c9b1150a68d9
>>>> ("drm/atomic-helper: Re-order bridge chain pre-enable and
>>>> post-disable"). In my tests I found that it breaks booting of Samsung
>>>> Exynos 5420/5800 based Chromebooks (Peach-Pit and Peach-Pi). Both of
>>>> them use Exynos DRM with Exynos_DP sub-driver (Analogix DP) and EDP
>>>> panel. Booting stops at '[drm] Initialized exynos 1.1.0 for exynos-drm
>>>> on minor 0' message. On the other hand, the Samsung Exynos5250 based
>>>> Snow Chromebook boots fine, but it uses dp-lvds nxp,ptn3460 bridge and
>>>> lvds panel instead of edp panels. This looks like some sort of deadlock,
>>>> because if I disable FBDEV emulation, those boards boots fine and I'm
>>>> able to run modetest and enable the display. Also the DRM kernel logger
>>>> seems to be working fine, although I didn't check the screen output yet,
>>>> as I only have a remote access to those boards. I will investigate it
>>>> further and let You know.
>>> Thanks for the report. I was trying to understand the pipeline, but I'm
>>> a bit confused. Above you say Peach-Pit uses DP and EDP panel, but if I
>>> look at arch/arm/boot/dts/samsung/exynos5420-peach-pit.dts, it connects
>>> a dp->lvds bridge (parade,ps8625). Peach-Pi seems to connect to an eDP
>>> panel.
>>>
>>> Is the above correct? Do both Peach-Pi and Peach-Pit fail?
>> Yes, sorry, my fault. I much have checked the same (peach-pi) dts 2
>> times. Both Peach-Pi and Peach-Pit fails, while Snow works fine. All
>> three use the same Exynos DP (based on analogix dp) driver. I will try
>> to play a bit more with those boards in the afternoon, hopefully getting
>> some more hints where the issue is.
> Did you get a chance to test this more? Any hints what happens will help =)

I've spent some time debugging this issue, but so far I only got 
something I don't really understand. This issue is somehow related with 
the DP clock enabling and disabling, what is being done from 
exynos_dp_poweron() and exynos_dp_poweroff() functions, which are called 
from analogix_dp_resume() and analogix_dp_suspend(). The lockup happens 
somewhere while registering the fbdev console, with console lock held, 
what makes debugging much harder.

I've did some experiments with pm runtime of the analogix_dp_core driver 
and increased autosuspend delay to 200 msec. This magically fixed the 
issue, but I still see no direct calls to analogix_dp without proper pm 
runtime guards.


Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

