Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36306CB04AD
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 15:31:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A21610E61B;
	Tue,  9 Dec 2025 14:31:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="VCqHUnCP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D37410E611;
 Tue,  9 Dec 2025 14:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=598Lv6I+cwM2e/3R1Dlkr2qljrp7ii/wSnDlNmMxxh8=; b=VCqHUnCP384aBUtzRXML3Cy8N4
 FUaUSAbYkq6FkvLROjWlWZlwnJl+oOFFJwSzHSH2whoJBXwaqIu+EvUcm71W1znfX2ye6EIbg4tqW
 P6WIqoH/spyWJFEx203cpASwLF6K7tWUhexqTgfJtKz5Xl/WJnYJyHo7tC7mIvePj7+GOmQeu+DCf
 eWjYyghBA5+Ze5r4dbo7CaUmnIW4tN2pfSmog0mIY0s6QMu2mlGCZ1vqmTBC6s0ffrE1uqH6+IJSf
 31/YeuBPCE1No15yxWw20Qo/I8PWdMnf80w+qLwXUAaQO1M2k5EW/EV8Ds5LEMLdmn5GslyiFJApN
 PZaUtwZg==;
Received: from [186.208.73.250] (helo=[192.168.18.14])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1vSykO-00AXoT-Ib; Tue, 09 Dec 2025 15:31:24 +0100
Message-ID: <ae3d39ec-e220-435e-9cc9-e316591cf0f1@igalia.com>
Date: Tue, 9 Dec 2025 11:31:19 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/2] Fixes on CM3 helper for plane shaper LUT
To: Matthew Schwartz <matthew.schwartz@linux.dev>
Cc: airlied@gmail.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 harry.wentland@amd.com, simona@ffwll.ch, siqueira@igalia.com,
 sunpeng.li@amd.com, kernel-dev@igalia.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20251208234741.293037-1-mwen@igalia.com>
 <6fbc0496-9a96-4f72-a8d8-66b7885bdaf6@linux.dev>
Content-Language: en-US
From: Melissa Wen <mwen@igalia.com>
In-Reply-To: <6fbc0496-9a96-4f72-a8d8-66b7885bdaf6@linux.dev>
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



On 08/12/2025 22:34, Matthew Schwartz wrote:
>
>> On Dec 8, 2025, at 3:48 PM, Melissa Wen <mwen@igalia.com> wrote:
>>
>> ﻿There are some unexpected banding and shimmer effects when using
>> steamOS/gamescope color pipeline for HDR on DCN32 or newer families.
>> Those problems are not present in Steam Deck (DCN301). It happens on
>> DCN32 because plane shaper LUT uses DCN30 CM3 helper to translate curves
>> instead of DCN10 CM helper. This series identifies the necessary changes
>> on CM3 helper to reduce differences on color transformation made by
>> those two helpers.
>>
>> Patch 1 aims to solve the shimmer/colorful points that looks like a
>> wrong map of black values on red/green/blue colors. Patch 2 extends the
>> delta clamping fix made in commit 27fc10d1095f ("drm/amd/display: Fix
>> the delta clamping for shaper LUT") to solve some banding effects.
>>
>> Banding is not fully solved by any helper and needs further
>> investigation.
>>
>> One easy way to check the current and expected behavior is moving the
>> cursor (doing composition) to get the expected result from GFX. When the
>> cursor disappears, those color transformations are back to be done by
>> the display hw.
> Hi Melissa,
>
> Could you share how you’re testing the gamescope color pipeline with HDR on DCN32, i.e display and connection type? Are any extra gamescope or kernel patches required?
>
> At least on my own DCN32 setup (AMD 7900XTX) + my primary monitor (an LG 45gx950a-b) via DisplayPort or my DCN35 setup + integrated HDR OLED screen (Legion Go 2), gamescope always composites when HDR is enabled. I applied your patches on top of kernel 6.18, and my kernel is built with CONFIG_DRM_AMD_COLOR_STEAMDECK=y (the downstream name of AMD_PRIVATE_COLOR for SteamOS), so that shouldn't be an issue. I tried everything from 1280x720p -> 5120x2160p, and it does not work on any resolution.
Hi Matt,

You need to hack the DPP color caps to enabled SHAPER/3D and BLEND LUTs 
as below:

diff --git 
i/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c 
w/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c
index b276fec3e479..96b4f3239fb1 100644
--- i/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c
+++ w/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c
@@ -2256,8 +2256,8 @@ static bool dcn32_resource_construct(
         dc->caps.color.dpp.gamma_corr = 1;
         dc->caps.color.dpp.dgam_rom_for_yuv = 0;

-       dc->caps.color.dpp.hw_3d_lut = 0;
-       dc->caps.color.dpp.ogam_ram = 0;  // no OGAM in DPP since DCN1
+       dc->caps.color.dpp.hw_3d_lut = 1;
+       dc->caps.color.dpp.ogam_ram = 1;  // no OGAM in DPP since DCN1
         // no OGAM ROM on DCN2 and later ASICs
         dc->caps.color.dpp.ogam_rom_caps.srgb = 0;
         dc->caps.color.dpp.ogam_rom_caps.bt2020 = 0;

In short, you need to change `caps.color.dpp.hw_3d_lut` and 
`caps.color.dpp.ogam_ram` to 1 in the dcnX_resource.c file to say there 
is a "plane" color caps.
The thing is that, in DCN32+, these color caps are not part of DPP 
anymore, they are MPC capabilities in MCM that can be moved before or 
after blending.
But the current kernel implementation checks DPP color caps to expose 
plane color proprerties.
Checking MPC and where the MCM is positioned would be more complex, but 
not impossible. Something to improve in the future yes.

You need to confirm that your `drm_info` shows all AMD plane color 
properties, but gamescope basically checks CTM and BLEND_TF as you can 
see here:
https://github.com/ValveSoftware/gamescope/blob/master/src/Backends/DRMBackend.cpp#L3347

Let me know if it works for you.

BR,

Melissa

>
> Thanks,
> Matt
>
>> Lemme know your thoughts!
>>
>> Melissa
>>
>> Melissa Wen (2):
>>   drm/amd/display: fix wrong color value mapping on DCN32 shaper LUT
>>   drm/amd/display: extend delta clamping logic to CM3 LUT helper
>>
>> .../amd/display/dc/dcn30/dcn30_cm_common.c    | 32 +++++++++++++++----
>> .../display/dc/dwb/dcn30/dcn30_cm_common.h    |  2 +-
>> .../amd/display/dc/hwss/dcn30/dcn30_hwseq.c   |  9 +++---
>> .../amd/display/dc/hwss/dcn32/dcn32_hwseq.c   | 17 ++++++----
>> .../amd/display/dc/hwss/dcn401/dcn401_hwseq.c | 16 ++++++----
>> 5 files changed, 50 insertions(+), 26 deletions(-)
>>
>> --
>> 2.51.0
>>

