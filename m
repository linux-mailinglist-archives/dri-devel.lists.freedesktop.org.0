Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 128435B96B6
	for <lists+dri-devel@lfdr.de>; Thu, 15 Sep 2022 10:56:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 805A310EAC1;
	Thu, 15 Sep 2022 08:55:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 69285 seconds by postgrey-1.36 at gabe;
 Thu, 15 Sep 2022 08:55:48 UTC
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org
 [IPv6:2001:67c:2050:0:465::202])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCF0910EABE;
 Thu, 15 Sep 2022 08:55:48 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4MSrdX4WlZz9sQx;
 Thu, 15 Sep 2022 10:55:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1663232144;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I6rLJ0bu/aQ7il0eqvRwZ4yHWJmt6vdefPCovIIQAJU=;
 b=OHZSdmC30hlobiKbaURiREvSts/UaWXJKibWSCXKLsviWNLgt9BTEb6Qr1Lfr3cuY8WVBq
 7zIqX5rWrtf2F7hCamMeL+exOIfq61s2/hgVWT2ukXtblfRwYW9rhKJgt3UbT6QWIX/x4X
 x2FlaxQDf1NSmScNWMW4jxR2JqHCUEVkP/xrrwMMbgZV/BsuSgIFjSjfMIecxAJZZVCcF9
 O/D/4R1t7fbPHmJIJHLhTX1MDzWkiWLgYP/GzL3T6IjsM1RRSf3dFVgDQUTx2VjsHlo+4E
 slFDBcaWWjqluLC6lrHWm2VhyJ12ckAQlbv8iENdihpGl6ZAT/BTFJjsQTuSzg==
Message-ID: <5f12b404-e351-3ae2-65b6-f83f27e1c7be@mailbox.org>
Date: Thu, 15 Sep 2022 10:55:42 +0200
MIME-Version: 1.0
Subject: Re: [PATCH V3 46/47] drm/amd/display: Fix failures of disabling
 primary plans
Content-Language: en-CA, de-CH-frami
To: Alex Hung <alex.hung@amd.com>, Wayne Lin <Wayne.Lin@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20220914051046.1131186-1-Wayne.Lin@amd.com>
 <20220914051046.1131186-47-Wayne.Lin@amd.com>
 <604a1d7e-1cd9-ad27-6d37-2e8535ce253b@mailbox.org>
 <40e970ca-c0ac-98b3-0549-2d7b1a812f81@mailbox.org>
 <c429010f-30ea-7abf-a67a-e730c7a6728d@amd.com>
 <65bbb8fb-92ae-774c-72ab-d22195851828@mailbox.org>
 <d94e5504-41b2-3546-24cb-6db2877d277c@amd.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel.daenzer@mailbox.org>
In-Reply-To: <d94e5504-41b2-3546-24cb-6db2877d277c@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 4733547a23b3c75af3f
X-MBO-RS-META: 9zeakazanorakuupu3if7szuaem13myd
X-Rspamd-Queue-Id: 4MSrdX4WlZz9sQx
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
Cc: stylon.wang@amd.com, Sunpeng.Li@amd.com, qingqing.zhuo@amd.com,
 Rodrigo.Siqueira@amd.com, roman.li@amd.com, solomon.chiu@amd.com,
 Aurabindo.Pillai@amd.com, Bhawanpreet.Lakha@amd.com, agustin.gutierrez@amd.com,
 pavle.kotarac@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-09-14 22:08, Alex Hung wrote:
> On 2022-09-14 10:55, Michel Dänzer wrote:
>> On 2022-09-14 18:30, Alex Hung wrote:
>>> On 2022-09-14 07:40, Michel Dänzer wrote:
>>>> On 2022-09-14 15:31, Michel Dänzer wrote:
>>>>> On 2022-09-14 07:10, Wayne Lin wrote:
>>>>>> From: Alex Hung <alex.hung@amd.com>
>>>>>>
>>>>>> [Why & How]
>>>>>> This fixes kernel errors when IGT disables primary planes during the
>>>>>> tests kms_universal_plane::functional_test_pipe/pageflip_test_pipe.
>>>>>
>>>>> NAK.
>>>>>
>>>>> This essentially reverts commit b836a274b797 ("drm/amdgpu/dc: Require primary plane to be enabled whenever the CRTC is") (except that it goes even further and completely removes the requirement for any HW plane to be enabled when the HW cursor is), so it would reintroduce the issues described in that commit log.
>>>>
>>>> Actually not exactly the same issues, due to going even further than reverting my fix.
>>>>
>>>> Instead, the driver will claim that an atomic commit which enables the CRTC and the cursor plane, while leaving all other KMS planes disabled, succeeds. But the HW cursor will not actually be visible.
>>>
>>> I did not observe problems with cursors (GNOME 42.4 - desktop and youtube/mpv video playback: windowed/fullscreen). Are there steps to reproduce cursor problems?
>>
>> As described in my last follow-up e-mail: An atomic KMS commit which enables the CRTC and the cursor plane, but disables all other KMS planes for the CRTC. The commit will succeed, but will not result in the HW cursor being actually visible. (I don't know of any specific application or test which exercises this)
> 
> Did you mean cursor plane depends on primary plane (i.e. no primary plane = no visible HW cursor)?

Sort of. I understand the HW cursor isn't an actual separate plane in AMD HW. Instead, the HW cursor can be displayed as part of any other HW plane. This means that the HW cursor can only be visible if any other plane is enabled.


> If there is no primary plane, what scenario would it be required to draw a cursor?
> 
> If this is a rare case, would it still be a concern?

Yes. In the KMS API, the cursor plane is like any other plane. A Wayland compositor or other user space may legitimately try to display something (not necessarily a "cursor") using only the cursor plane. The driver must accurately signal that this cannot work. The established way to do so (if a bit indirectly) is to require the primary plane to be enabled whenever the CRTC is.


>> Also see the commit log of bc92c06525e5 ("drm/amd/display: Allow commits with no planes active").
> 
> Does it mean dm_crtc_helper_atomic_check does not need to return -EINVAL if there is no active cursor because there are no cursors to be shown anyways, [...]

This was considered in the review discussion for b836a274b797 ("drm/amdgpu/dc: Require primary plane to be enabled whenever the CRTC is"), see https://patchwork.freedesktop.org/patch/387230/ .

TL;DR: There were already other KMS drivers requiring the primary plane to be enabled whenever the CRTC is, and there's a special case for that in atomic_remove_fb. Adding another special case for the cursor plane would make things much more complicated for common DRM code and user space (and possibly even introduce issues which cannot be solved at all).


>>>>> If IGT tests disable the primary plane while leaving the CRTC enabled, those tests are broken and need to be fixed instead.
>>>
>>> There are IGT cursor tests fixed by this:
>>>
>>>    igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions
>>>    igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size
>>>
>>> It also reduces amdgpu workaround in IGT's kms_concurrent:
>>>    https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.freedesktop.org%2Fpatch%2F499382%2F%3Fseries%3D107734%26rev%3D1&amp;data=05%7C01%7Calex.hung%40amd.com%7Cc757c9e4fbda4f8474a308da9671f920%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637987713521806985%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=XRRvilVZMBALIWHAOLArxjiAcgqQ%2FwNRnuUUJCTOYzY%3D&amp;reserved=0
>>>
>>> The change affect multiple IGT tests. Adding amdgpu-specific workarounds to each of the IGT tests is not an ideal solution.
>>
>> It's not amdgpu specific, other atomic KMS drivers have the same restriction. IGT tests need to be able to handle this. See e.g. 88e379cef970 ("kms_cursor_legacy: Keep primary plane enabled for XRGB overlay fallback").
> 
> 
> Commit 88e379cef970 adds the following change to keep primary plane enabled:
> 
> +               igt_plane_set_fb(primary, prim_fb)
> 
> but kms_universal_plane fails at testing disabling primary plane, ex.
> 
> [...]

User space just cannot rely on being able to disable the primary plane while the CRTC is enabled. Any IGT tests which do so are broken and need to be fixed.

See also https://patchwork.freedesktop.org/series/80904/ .


-- 
Earthling Michel Dänzer            |                  https://redhat.com
Libre software enthusiast          |         Mesa and Xwayland developer

