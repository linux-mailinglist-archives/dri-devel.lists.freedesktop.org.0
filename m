Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E239191337E
	for <lists+dri-devel@lfdr.de>; Sat, 22 Jun 2024 13:47:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D12A710E219;
	Sat, 22 Jun 2024 11:47:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="H3KsNqXw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C98B10E219
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Jun 2024 11:47:23 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45MBl6HV016063;
 Sat, 22 Jun 2024 06:47:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1719056827;
 bh=j4OrdUKtJX/7en/BuYO+MHA6aUkbfOxmzOwAqmp5pT0=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=H3KsNqXwO/dLY/aCjOEILTrM0Z4Yx715Up3ToB4teSZlmlHI9pgV/kjUWN/UAg/rV
 Ed9o0riOJJGdILb9WxxTSTyDPSd7QP9oTdtxB5FO8StSFLf83kaK6CneNYkJ0A7HAv
 iANUXqMxQFBy0MOb2SD7+2kEhGJQY7iKmFsDk0JQ=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45MBl6Ki028337
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Sat, 22 Jun 2024 06:47:06 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 22
 Jun 2024 06:47:06 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sat, 22 Jun 2024 06:47:06 -0500
Received: from [10.249.129.248] ([10.249.129.248])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45MBkxte067399;
 Sat, 22 Jun 2024 06:47:00 -0500
Message-ID: <71e809fa-b471-4bb3-8f7d-e497397c0de4@ti.com>
Date: Sat, 22 Jun 2024 17:16:58 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] drm/bridge: tc358767: Fix
 DRM_BRIDGE_ATTACH_NO_CONNECTOR case
Content-Language: en-US
To: Alexander Stein <alexander.stein@ew.tq-group.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Jan Kiszka <jan.kiszka@siemens.com>, Marek
 Vasut <marex@denx.de>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
CC: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sam Ravnborg <sam@ravnborg.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
References: <20231108-tc358767-v2-0-25c5f70a2159@ideasonboard.com>
 <f6af46e0-aadb-450a-9349-eec1337ea870@ti.com>
 <2f3bb86b-6f8c-4807-985e-344a0c47864c@siemens.com>
 <3277848.aeNJFYEL58@steina-w>
 <b2052bc9-b2da-489b-9e5b-3c9b4f6c1c99@ideasonboard.com>
 <bc96c6b5-a7f8-4ef3-a89b-bf577943f11c@denx.de>
 <36ef53b6-57a3-42e4-95ef-a10eef4ca1c9@siemens.com>
 <o4bwopeuyxm6344oqqm3e7p3xcx76aw2trsiuhhfyhel2e7po7@sz2jaj6i7kqd>
From: Aradhya Bhatia <a-bhatia1@ti.com>
In-Reply-To: <o4bwopeuyxm6344oqqm3e7p3xcx76aw2trsiuhhfyhel2e7po7@sz2jaj6i7kqd>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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



On 17-Jun-24 13:41, Dmitry Baryshkov wrote:
> On Mon, Jun 17, 2024 at 07:40:32AM GMT, Jan Kiszka wrote:
>> On 16.02.24 15:57, Marek Vasut wrote:
>>> On 2/16/24 10:10, Tomi Valkeinen wrote:
>>>> Ok. Does anyone have a worry that these patches make the situation
>>>> worse for the DSI case than it was before? Afaics, if the DSI lanes
>>>> are not set up early enough by the DSI host, the driver would break
>>>> with and without these patches.
>>>>
>>>> These do fix the driver for DRM_BRIDGE_ATTACH_NO_CONNECTOR and DPI, so
>>>> I'd like to merge these unless these cause a regression with the DSI
>>>> case.
>>>
>>> 1/2 looks good to me, go ahead and apply .

Isn't there any way for the second patch to move forward as well though?
The bridge device (under DPI to (e)DP mode) cannot really work without
it, and the patches have been pending idle for a long time. =)

>>
>> My local patches still apply on top of 6.10-rc4, so I don't think this
>> ever happened. What's still holding up this long-pending fix (at least
>> for our devices)?
> 
> Neither of the patches contains Fixes tags. If the first patch fixes an
> issue in previous kernels, please consider following the stable process.
> 
> If we are unsure about the second patch, please send the first patch
> separately, adding proper tags.
> 

Thanks Dmitry! I can send the patches again with the required fixes
tags (or just patch-1 if we cannot do anything about patch-2).


-- 
Regards
Aradhya
