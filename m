Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D6A5B8D9E
	for <lists+dri-devel@lfdr.de>; Wed, 14 Sep 2022 18:56:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C684510E993;
	Wed, 14 Sep 2022 16:55:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org
 [IPv6:2001:67c:2050:0:465::102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DA9F10E99B
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Sep 2022 16:55:50 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4MSRKr5tzYz9sQ2;
 Wed, 14 Sep 2022 18:55:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1663174544;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uCqHMrSVEfiXy9lSA9a7qzI7RinI1Cod6HxFCNBOeB8=;
 b=rQZWyXaKY5FXzhNo++87x9dqQSAO0Gf2k5EF9VibmZgTSq8upw1+jh39ZHrfGaThLXeObK
 sqlZW8I7/ohTSZGKLOoHw69FrPZ4Mm0x5FAXuwLnT0KFowt5TECeLnr2pxB+Qz8Cr5z7D9
 3j1rTzcpU8XzYbE+UD7V8RPbgrgNRFsssVzSN2Jjoin7EknUZYk6n8CkSV3sg13spxCcnu
 gG9oxO48+v7idKQMydJssi0jALnWSFJkl+KNjkcaQnCNS4JVUUsZcQyqRDW3x1SLMrUw+2
 fcSOkHoXp2ZaYkFVwCGn52WxvnryhhAh5l0zmojItb4su8cRLNGeWFoYRswc+g==
Message-ID: <65bbb8fb-92ae-774c-72ab-d22195851828@mailbox.org>
Date: Wed, 14 Sep 2022 18:55:42 +0200
MIME-Version: 1.0
Subject: Re: [PATCH V3 46/47] drm/amd/display: Fix failures of disabling
 primary plans
Content-Language: en-CA
To: Alex Hung <alex.hung@amd.com>, Wayne Lin <Wayne.Lin@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20220914051046.1131186-1-Wayne.Lin@amd.com>
 <20220914051046.1131186-47-Wayne.Lin@amd.com>
 <604a1d7e-1cd9-ad27-6d37-2e8535ce253b@mailbox.org>
 <40e970ca-c0ac-98b3-0549-2d7b1a812f81@mailbox.org>
 <c429010f-30ea-7abf-a67a-e730c7a6728d@amd.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel.daenzer@mailbox.org>
In-Reply-To: <c429010f-30ea-7abf-a67a-e730c7a6728d@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: fdd2408974da64331b9
X-MBO-RS-META: qtoxxmt1ag8zmwsshq148zwopgxep4te
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
Cc: stylon.wang@amd.com, Sunpeng.Li@amd.com, Bhawanpreet.Lakha@amd.com,
 qingqing.zhuo@amd.com, Rodrigo.Siqueira@amd.com, roman.li@amd.com,
 solomon.chiu@amd.com, Aurabindo.Pillai@amd.com, agustin.gutierrez@amd.com,
 pavle.kotarac@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


[ Adding the dri-devel list ]

On 2022-09-14 18:30, Alex Hung wrote:
> On 2022-09-14 07:40, Michel Dänzer wrote:
>> On 2022-09-14 15:31, Michel Dänzer wrote:
>>> On 2022-09-14 07:10, Wayne Lin wrote:
>>>> From: Alex Hung <alex.hung@amd.com>
>>>>
>>>> [Why & How]
>>>> This fixes kernel errors when IGT disables primary planes during the
>>>> tests kms_universal_plane::functional_test_pipe/pageflip_test_pipe.
>>>
>>> NAK.
>>>
>>> This essentially reverts commit b836a274b797 ("drm/amdgpu/dc: Require primary plane to be enabled whenever the CRTC is") (except that it goes even further and completely removes the requirement for any HW plane to be enabled when the HW cursor is), so it would reintroduce the issues described in that commit log.
>>
>> Actually not exactly the same issues, due to going even further than reverting my fix.
>>
>> Instead, the driver will claim that an atomic commit which enables the CRTC and the cursor plane, while leaving all other KMS planes disabled, succeeds. But the HW cursor will not actually be visible.
> 
> I did not observe problems with cursors (GNOME 42.4 - desktop and youtube/mpv video playback: windowed/fullscreen). Are there steps to reproduce cursor problems?

As described in my last follow-up e-mail: An atomic KMS commit which enables the CRTC and the cursor plane, but disables all other KMS planes for the CRTC. The commit will succeed, but will not result in the HW cursor being actually visible. (I don't know of any specific application or test which exercises this)

Also see the commit log of bc92c06525e5 ("drm/amd/display: Allow commits with no planes active").


>>> If IGT tests disable the primary plane while leaving the CRTC enabled, those tests are broken and need to be fixed instead.
> 
> There are IGT cursor tests fixed by this:
> 
>   igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions
>   igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size
> 
> It also reduces amdgpu workaround in IGT's kms_concurrent:
>   https://patchwork.freedesktop.org/patch/499382/?series=107734&rev=1
> 
> The change affect multiple IGT tests. Adding amdgpu-specific workarounds to each of the IGT tests is not an ideal solution.

It's not amdgpu specific, other atomic KMS drivers have the same restriction. IGT tests need to be able to handle this. See e.g. 88e379cef970 ("kms_cursor_legacy: Keep primary plane enabled for XRGB overlay fallback").


>>> P.S. Per above, this patch should never have made it this far without getting in touch with me directly.
>>>
>>>
>>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
>>>> index c89594f3a5cb..099a226407a3 100644
>>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
>>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
>>>> @@ -376,18 +376,6 @@ static int dm_crtc_helper_atomic_check(struct drm_crtc *crtc,
>>>>           return ret;
>>>>       }
>>>>   -    /*
>>>> -     * We require the primary plane to be enabled whenever the CRTC is, otherwise
>>>> -     * drm_mode_cursor_universal may end up trying to enable the cursor plane while all other
>>>> -     * planes are disabled, which is not supported by the hardware. And there is legacy
>>>> -     * userspace which stops using the HW cursor altogether in response to the resulting EINVAL.
>>>> -     */
>>>> -    if (crtc_state->enable &&
>>>> -        !(crtc_state->plane_mask & drm_plane_mask(crtc->primary))) {
>>>> -        DRM_DEBUG_ATOMIC("Can't enable a CRTC without enabling the primary plane\n");
>>>> -        return -EINVAL;
>>>> -    }
>>>> -
>>>>       /* In some use cases, like reset, no stream is attached */
>>>>       if (!dm_crtc_state->stream)
>>>>           return 0;
>>>
>>

-- 
Earthling Michel Dänzer            |                  https://redhat.com
Libre software enthusiast          |         Mesa and Xwayland developer

