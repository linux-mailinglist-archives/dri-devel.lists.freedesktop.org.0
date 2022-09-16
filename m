Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 915125BA913
	for <lists+dri-devel@lfdr.de>; Fri, 16 Sep 2022 11:12:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95E8910ECF6;
	Fri, 16 Sep 2022 09:12:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 145006 seconds by postgrey-1.36 at gabe;
 Fri, 16 Sep 2022 09:12:34 UTC
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BFC710E3DB;
 Fri, 16 Sep 2022 09:12:34 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4MTSyQ5bCzz9sQf;
 Fri, 16 Sep 2022 11:12:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1663319550;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B0RalRr1/9evRKEWy1XoqXl/yzV3gahXUJMGIed+Bhk=;
 b=DRU1c7xfe9HlkVixi001TSC3eyQhPaJNpj3gTblY57n18YJCR1O9D/Wa9jNUefToT7rglS
 at5SfD9MBAjpLZZOtCG8eC9hyrKu4xOEy/1ZDnGsON+TivWCRJT7ZoykAr6u+JFYdEhNYB
 IkAJvVBehIihBU28Z1DJOUTKLXzRcH8w6MQdzPvvlSJI2Fs3mngzyHS7fm/bSx/1StqLRc
 67QS+OntvQahu9VTA1ELMwBda9k+tArhjg/E4Vtw8zgxIgdacbmuovsr1Jkxr5ts/ePYRm
 spCjgBb8XlY3XEkCxwP80kXTv0K3L26iUwwy7nZNt8TW30noiOgUxNTYefEzCA==
Message-ID: <d78c366b-5fc3-7f9b-186e-b18a3e4a07ee@mailbox.org>
Date: Fri, 16 Sep 2022 11:12:27 +0200
MIME-Version: 1.0
Subject: Re: [PATCH V3 46/47] drm/amd/display: Fix failures of disabling
 primary plans
Content-Language: en-CA
To: Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>,
 Alex Hung <alex.hung@amd.com>, Wayne Lin <Wayne.Lin@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Harry.Wentland@amd.com, Mark Yacoub <markyacoub@chromium.org>,
 Sunpeng.Li@amd.com, ddavenport@google.com, Simon Ser <contact@emersion.fr>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
References: <20220914051046.1131186-1-Wayne.Lin@amd.com>
 <20220914051046.1131186-47-Wayne.Lin@amd.com>
 <604a1d7e-1cd9-ad27-6d37-2e8535ce253b@mailbox.org>
 <40e970ca-c0ac-98b3-0549-2d7b1a812f81@mailbox.org>
 <c429010f-30ea-7abf-a67a-e730c7a6728d@amd.com>
 <65bbb8fb-92ae-774c-72ab-d22195851828@mailbox.org>
 <d94e5504-41b2-3546-24cb-6db2877d277c@amd.com>
 <5f12b404-e351-3ae2-65b6-f83f27e1c7be@mailbox.org>
 <e3f2696a-5c21-3d77-ac61-5b5441d11760@amd.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel.daenzer@mailbox.org>
In-Reply-To: <e3f2696a-5c21-3d77-ac61-5b5441d11760@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: b7e3d6ff0af4a7781a4
X-MBO-RS-META: jwx11tkegmb4ojfups3ztx5uhj4kdc31
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
Cc: stylon.wang@amd.com, qingqing.zhuo@amd.com, roman.li@amd.com,
 solomon.chiu@amd.com, Aurabindo.Pillai@amd.com, Bhawanpreet.Lakha@amd.com,
 agustin.gutierrez@amd.com, pavle.kotarac@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-09-15 22:44, Rodrigo Siqueira Jordao wrote:
> 
> First of all, thanks a lot for your review. I want to take this opportunity to discuss this topic in more depth and learn more from you and others.

That really should have happened before submitting this patch. It was luck that I happened to notice it fly by.


> On 2022-09-15 04:55, Michel Dänzer wrote:
>> On 2022-09-14 22:08, Alex Hung wrote:
>>> On 2022-09-14 10:55, Michel Dänzer wrote:
>>>> On 2022-09-14 18:30, Alex Hung wrote:
>>>>> On 2022-09-14 07:40, Michel Dänzer wrote:
>>>>>> On 2022-09-14 15:31, Michel Dänzer wrote:
>>>>>>> On 2022-09-14 07:10, Wayne Lin wrote:
>>>>>>>> From: Alex Hung <alex.hung@amd.com>
>>>>>>>>
>>>>>>>> [Why & How]
>>>>>>>> This fixes kernel errors when IGT disables primary planes during the
>>>>>>>> tests kms_universal_plane::functional_test_pipe/pageflip_test_pipe.
>>>>>>>
>>>>>>> NAK.
>>>>>>>
>>>>>>> This essentially reverts commit b836a274b797 ("drm/amdgpu/dc: Require primary plane to be enabled whenever the CRTC is") (except that it goes even further and completely removes the requirement for any HW plane to be enabled when the HW cursor is), so it would reintroduce the issues described in that commit log.
>>>>>>
>>>>>> Actually not exactly the same issues, due to going even further than reverting my fix.
>>>>>>
>>>>>> Instead, the driver will claim that an atomic commit which enables the CRTC and the cursor plane, while leaving all other KMS planes disabled, succeeds. But the HW cursor will not actually be visible.
>>>>>
>>>>> I did not observe problems with cursors (GNOME 42.4 - desktop and youtube/mpv video playback: windowed/fullscreen). Are there steps to reproduce cursor problems?
>>>>
>>>> As described in my last follow-up e-mail: An atomic KMS commit which enables the CRTC and the cursor plane, but disables all other KMS planes for the CRTC. The commit will succeed, but will not result in the HW cursor being actually visible. (I don't know of any specific application or test which exercises this)
>>>
>>> Did you mean cursor plane depends on primary plane (i.e. no primary plane = no visible HW cursor)?
>>
>> Sort of. I understand the HW cursor isn't an actual separate plane in AMD HW. Instead, the HW cursor can be displayed as part of any other HW plane. This means that the HW cursor can only be visible if any other plane is enabled.
> 
> The commit that you mentioned (b836a274b797) was created to address some issues reported by the user. Please, correct me if I'm wrong, but the original issue could be reproduced by following these steps on Gnome with Ellesmere:
> 
> 1. Lock the screen and wait for suspending;
> 2. Wake up the system a few minutes later;
> 3. See two cursors, one that can be used and another one that is not working.

The primary symptom (which affected myself as a user as well, that was the motivation for addressing it) was that mutter fell back to SW cursor, because the legacy KMS cursor ioctl returned an error. There were corresponding messages from mutter, visible e.g. in the journal.

That the HW cursor remained visible for some users was a secondary symptom, probably due to a separate bug. I don't remember ever hitting that myself.

Note that current versions of mutter use atomic KMS and probably don't hit this issue anymore by default. You'd need to set the environment variable MUTTER_DEBUG_ENABLE_ATOMIC_KMS=0 or use an older version of mutter.

> It is not evident to me why we cannot reproduce this problem. Do you have some suggestions? If we find a case showing this bug, we can add it as part of our tests.

Something like this should work:

1. Call drmModeRmFB for the FB currently assigned to the primary plane. This implicitly disables the primary plane.
2. Call drmModeSetCursor(2) with a non-0 BO handle and position & dimensions such that the cursor would be visible on the CRTC.

Before b836a274b797, this resulted in drmModeSetCursor(2) returning EINVAL due to

	if (state->enable && state->active &&
	    does_crtc_have_active_cursor(state) &&
	    dm_crtc_state->active_planes == 0)
		return -EINVAL;


(The b836a274b797 commit log describes a similar error when trying to flip the legacy DPMS property from off to on. My memory is hazy on this, but I guess that would have prevented the monitor from turning back on after DPMS off if the primary/cursor planes happened to be disable/enabled respectively when trying to toggle the property)


>>> If there is no primary plane, what scenario would it be required to draw a cursor?
>>>
>>> If this is a rare case, would it still be a concern?
>>
>> Yes. In the KMS API, the cursor plane is like any other plane. A Wayland compositor or other user space may legitimately try to display something (not necessarily a "cursor") using only the cursor plane. The driver must accurately signal that this cannot work. The established way to do so (if a bit indirectly) is to require the primary plane to be enabled whenever the CRTC is.
> 
> Is there any real case for this scenario? Is this scenario strong enough to say that a driver does not support CRTC enabled without planes?
> 
>>
>>
>>>> Also see the commit log of bc92c06525e5 ("drm/amd/display: Allow commits with no planes active").
>>>
>>> Does it mean dm_crtc_helper_atomic_check does not need to return -EINVAL if there is no active cursor because there are no cursors to be shown anyways, [...]
>>
>> This was considered in the review discussion for b836a274b797 ("drm/amdgpu/dc: Require primary plane to be enabled whenever the CRTC is"), see https://patchwork.freedesktop.org/patch/387230/ .
>>
>> TL;DR: There were already other KMS drivers requiring the primary plane to be enabled whenever the CRTC is, and there's a special case for that in atomic_remove_fb. 
> 
> iirc, this requiring is only available in drm_simple_kms_helper, and drivers under the tiny folder are the only ones using it.

This is getting a bit silly.

Why are you guys trying to marginalize the scenarios I'm explaining? So you don't need to modify the IGT tests? Or what is the goal?

IGT tests aren't some kind of holy water; they can have bugs. In which case the proper course of action is to fix them, not to work around them in the kernel.

If atomic user space asks "please enable the CRTC and one plane", the kernel responds "sure, no problem", but that one plane isn't actually visible as a result, that is never OK. That is why this patch is not acceptable.


>> User space just cannot rely on being able to disable the primary plane while the CRTC is enabled. Any IGT tests which do so are broken and need to be fixed.
>>
>> See also https://patchwork.freedesktop.org/series/80904/ .
> 
> Could you resend it?

I don't have time for this ATM. Feel free to pick it up.


-- 
Earthling Michel Dänzer            |                  https://redhat.com
Libre software enthusiast          |         Mesa and Xwayland developer

