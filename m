Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B55E8B3B5EA
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 10:23:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7724D10E3CB;
	Fri, 29 Aug 2025 08:23:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="DuOWyMMH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA29810E3CB
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 08:23:29 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20250829082327euoutp020c7ea7e08fd0b43cd01d4553788e4b0e~gL0BN5yOl0497404974euoutp02f
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 08:23:27 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20250829082327euoutp020c7ea7e08fd0b43cd01d4553788e4b0e~gL0BN5yOl0497404974euoutp02f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1756455807;
 bh=F2k3oNVKmD2z45Od1BI3Dy6IUk7Cua4F43r8isdxP40=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=DuOWyMMH4vfbuhlgzuV7zMzgPTKu/KKD63J6ip7BZPxk58RQ70qTqQxe1+UztlOYc
 tYOfGn8bhy3xGcmNyC50ap5FCS8cjiMBchWU4gxj39X4GC9OdWNjGx7dy849T7W8sR
 Z+iT5IYwkEM2kwuNJC/sfRboS47AW0M0YteIBkwk=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20250829082327eucas1p130de0bf6c817e36ae3d766c9f9390b36~gL0A1iHgI1853718537eucas1p1l;
 Fri, 29 Aug 2025 08:23:27 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20250829082324eusmtip12cd4f98e106e087b68e5455f37558f0d~gLz96VA5-0543205432eusmtip1M;
 Fri, 29 Aug 2025 08:23:24 +0000 (GMT)
Message-ID: <461daea4-5582-4aa2-bfea-130d2fb93717@samsung.com>
Date: Fri, 29 Aug 2025 10:23:24 +0200
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v4 00/13] Apply drm_bridge_connector and panel_bridge
 helper for the Analogix DP driver
To: Damon Ding <damon.ding@rock-chips.com>, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 jingoohan1@gmail.com, inki.dae@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, krzk@kernel.org, alim.akhtar@samsung.com,
 hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
 dmitry.baryshkov@oss.qualcomm.com, l.stach@pengutronix.de,
 dianders@chromium.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <a5e613ba-b404-40ae-b467-0f6f223f5d4c@rock-chips.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250829082327eucas1p130de0bf6c817e36ae3d766c9f9390b36
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250814104818eucas1p2c5029f6d5997f4fafd6370f9e7fb2264
X-EPHeader: CA
X-CMS-RootMailID: 20250814104818eucas1p2c5029f6d5997f4fafd6370f9e7fb2264
References: <CGME20250814104818eucas1p2c5029f6d5997f4fafd6370f9e7fb2264@eucas1p2.samsung.com>
 <20250814104753.195255-1-damon.ding@rock-chips.com>
 <a3a2f8be-2c3c-49e7-b27a-72364ea48b06@samsung.com>
 <7cb50c9c-ac41-43b6-8c69-5f184e7c94cf@samsung.com>
 <1ccd3889-5f13-4609-9bd8-2c208e17fc96@rock-chips.com>
 <f2ebfff1-08ab-4f26-98f3-6d6415d58a5e@samsung.com>
 <a5e613ba-b404-40ae-b467-0f6f223f5d4c@rock-chips.com>
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

On 29.08.2025 10:08, Damon Ding wrote:
> On 8/20/2025 5:20 AM, Marek Szyprowski wrote:
>> On 15.08.2025 04:59, Damon Ding wrote:
>>> On 2025/8/15 5:16, Marek Szyprowski wrote:
>>>> On 14.08.2025 16:33, Marek Szyprowski wrote:
>>>>> On 14.08.2025 12:47, Damon Ding wrote:
>>>>>> PATCH 1 is a small format optimization for struct 
>>>>>> analogid_dp_device.
>>>>>> PATCH 2 is to perform mode setting in 
>>>>>> &drm_bridge_funcs.atomic_enable.
>>>>>> PATCH 3-6 are preparations for apply drm_bridge_connector helper.
>>>>>> PATCH 7 is to apply the drm_bridge_connector helper.
>>>>>> PATCH 8-10 are to move the panel/bridge parsing to the Analogix 
>>>>>> side.
>>>>>> PATCH 11-12 are preparations for apply panel_bridge helper.
>>>>>> PATCH 13 is to apply the panel_bridge helper.
>>>>>
>>>>> This series lacks 'select DRM_BRIDGE_CONNECTOR' in ExynosDP's 
>>>>> Kconfig,
>>>>> so it causes build break:
>>>>>
>>>>> drivers/gpu/drm/exynos/exynos_dp.c:177: undefined reference to
>>>>> `drm_bridge_connector_init'
>>>>> make[2]: *** [scripts/Makefile.vmlinux:91: vmlinux] Error 1
>>>>>
>>>>> After adding this dependency, the Exynos DP driver stops working. On
>>>>> Samsung Snow Chromebook I observed following issue:
>>>>>
>>>>> [    4.534220] exynos-dp 145b0000.dp-controller: failed to attach
>>>>> following panel or bridge (-16)
>>>>> [    4.543428] exynos-drm exynos-drm: failed to bind
>>>>> 145b0000.dp-controller (ops exynos_dp_ops): -16
>>>>> [    4.551775] exynos-drm exynos-drm: adev bind failed: -16
>>>>> [    4.556559] exynos-dp 145b0000.dp-controller: probe with driver
>>>>> exynos-dp failed with error -16
>>>>>
>>>>> I will investigate details later in the evening.
>>>>
>>>> The failure is caused by trying to add plat_data->next_bridge twice
>>>> (from exynos_dp's .attach callback, and from analogix' ->bind 
>>>> callback).
>>>>
>>>>
>>>> Best regards
>>>
>>> I see. The bridge attachment for the next bridge was not well thought
>>> out. It may be better to move panel_bridge addition a little forward
>>> and remove next_bridge attachment on the Analogix side. Then, the
>>> Rockchip side and Exynos side can do their own next_bridge attachment
>>> in &analogix_dp_plat_data.attach() as they want.
>>>
>>> Could you please help test the following modifications(they have been
>>> tested on my RK3588S EVB1 Board) on the Samsung Snow Chromebook? ;-)
>>
>> Assuming that I properly applied the malformed diff, it doesn't solve
>> all the issues. There are no errors reported though, but the display
>> chain doesn't work and no valid mode is reported:
>>
>> # dmesg | grep drm
>> [    3.384992] [drm] Initialized panfrost 1.4.0 for 11800000.gpu on 
>> minor 0
>> [    4.487739] [drm] Exynos DRM: using 14400000.fimd device for DMA
>> mapping operations
>> [    4.494202] exynos-drm exynos-drm: bound 14400000.fimd (ops
>> fimd_component_ops)
>> [    4.502374] exynos-drm exynos-drm: bound 14450000.mixer (ops
>> mixer_component_ops)
>> [    4.511930] exynos-drm exynos-drm: bound 145b0000.dp-controller (ops
>> exynos_dp_ops)
>> [    4.518411] exynos-drm exynos-drm: bound 14530000.hdmi (ops
>> hdmi_component_ops)
>> [    4.529628] [drm] Initialized exynos 1.1.0 for exynos-drm on minor 1
>> [    4.657434] exynos-drm exynos-drm: [drm] Cannot find any crtc or 
>> sizes
>> [    4.925023] exynos-drm exynos-drm: [drm] Cannot find any crtc or 
>> sizes
>>
>> # ./modetest -c -Mexynos
>> Connectors:
>> id      encoder status          name            size (mm)       modes
>>     encoders
>> 69      0       disconnected    LVDS-1          0x0             0 
>>       68
>>    props:
>>          1 EDID:
>>                  flags: immutable blob
>>                  blobs:
>>
>>                  value:
>>          2 DPMS:
>>                  flags: enum
>>                  enums: On=0 Standby=1 Suspend=2 Off=3
>>                  value: 0
>>          5 link-status:
>>                  flags: enum
>>                  enums: Good=0 Bad=1
>>                  value: 0
>>          6 non-desktop:
>>                  flags: immutable range
>>                  values: 0 1
>>                  value: 0
>>          4 TILE:
>>                  flags: immutable blob
>>                  blobs:
>>
>>                  value:
>> 71      0       disconnected    HDMI-A-1        0x0             0 
>>       70
>>    props:
>>          1 EDID:
>>                  flags: immutable blob
>>                  blobs:
>>
>>                  value:
>>          2 DPMS:
>>                  flags: enum
>>                  enums: On=0 Standby=1 Suspend=2 Off=3
>>                  value: 0
>>          5 link-status:
>>                  flags: enum
>>                  enums: Good=0 Bad=1
>>                  value: 0
>>          6 non-desktop:
>>                  flags: immutable range
>>                  values: 0 1
>>                  value: 0
>>          4 TILE:
>>                  flags: immutable blob
>>                  blobs:
>>
>>                  value:
>>
>>
>> I will investigate details later this week.
>>
>
> Could you please provide the related DTS file for the test? I will 
> also try to find out the reason for this unexpected issue. ;-)

Unfortunately I didn't find enough time to debug this further. The above 
log is from Samsung Snow Chromebook, 
arch/arm/boot/dts/samsung/exynos5250-snow.dts


 > ...

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

