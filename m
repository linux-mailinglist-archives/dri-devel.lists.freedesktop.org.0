Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F09B090A9
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jul 2025 17:34:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BF2810E846;
	Thu, 17 Jul 2025 15:34:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="YYr5aRoO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CA2C10E846
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 15:34:36 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4bjcRY05Tmz9stn;
 Thu, 17 Jul 2025 17:34:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1752766473;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=18ApJH8B0MbcKxQrnXzjfPUM8H08m7J/IZqtaF20/dE=;
 b=YYr5aRoOdE0YhMpdl5KL4Mo66hkVlj1c4HLZYL514KWM1sozCa7ZXS+t+5BybxFItIuhPM
 yQzCZRMzKxxI09Z8gjxuLp6d6Yk15pLCy5UkaFSruscfF/BrTI6nhpIwKruijeDR7orGPy
 1y03XlbrIqsZkR3IY3D8zXmJKlzA70YBEV7WBMLv+7h7VV3nYDqg8odaLgGPSyRiOYPoJq
 sMDe3izIrblRZScVHUR4A+JEcK4A0TRuHv+99TLibvm0hnY3O03gqN3eBT89jCEGwZCwra
 XcUfFjqrICXVIG3HdQMmn53Ul0ceZFfgsrhf7qgu1T2jjqhJXnuic3klI3f0zg==
Message-ID: <a46775c1-2633-4fba-9173-21273018bae0@mailbox.org>
Date: Thu, 17 Jul 2025 17:34:27 +0200
MIME-Version: 1.0
Subject: Re: [PATCH] drm/amdgpu: Raven: don't allow mixing GTT and VRAM
To: Alex Deucher <alexdeucher@gmail.com>, Brian Geffon <bgeffon@google.com>
Cc: "Wentland, Harry" <Harry.Wentland@amd.com>,
 "Leo (Sunpeng) Li" <Sunpeng.Li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, Yunxiang Li
 <Yunxiang.Li@amd.com>, Lijo Lazar <lijo.lazar@amd.com>,
 Prike Liang <Prike.Liang@amd.com>, Pratap Nirujogi
 <pratap.nirujogi@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Garrick Evans <garrick@google.com>,
 Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
References: <20250716161753.231145-1-bgeffon@google.com>
 <CADnq5_P+a2g_YzKW7S4YSF5kQgXe+PNrMKEOAHuf9yhFg98pSQ@mail.gmail.com>
 <CADyq12zB7+opz0vUgyAQSdbHcYMwbZrZp+qxKdYcqaeCeRVbCw@mail.gmail.com>
 <CADnq5_OeTJqzg0DgV06b-u_AmgaqXL5XWdQ6h40zcgGj1mCE_A@mail.gmail.com>
 <CADyq12ysC9C2tsQ3GrQJB3x6aZPzM1o8pyTW8z4bxjGPsfEZvw@mail.gmail.com>
 <CADnq5_PnktmP+0Hw0T04VkrkKoF_TGz5HOzRd1UZq6XOE0Rm1g@mail.gmail.com>
From: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Content-Language: en-CA
In-Reply-To: <CADnq5_PnktmP+0Hw0T04VkrkKoF_TGz5HOzRd1UZq6XOE0Rm1g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 095caac3b9c5669e5d6
X-MBO-RS-META: 9n4zmz3j748miyd7xqrwch9u86cegt7h
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

On 17.07.25 16:58, Alex Deucher wrote:
> On Wed, Jul 16, 2025 at 8:13 PM Brian Geffon <bgeffon@google.com> wrote:
>> On Wed, Jul 16, 2025 at 5:03 PM Alex Deucher <alexdeucher@gmail.com> wrote:
>>> On Wed, Jul 16, 2025 at 12:40 PM Brian Geffon <bgeffon@google.com> wrote:
>>>> On Wed, Jul 16, 2025 at 12:33 PM Alex Deucher <alexdeucher@gmail.com> wrote:
>>>>> On Wed, Jul 16, 2025 at 12:18 PM Brian Geffon <bgeffon@google.com> wrote:
>>>>>>
>>>>>> Commit 81d0bcf99009 ("drm/amdgpu: make display pinning more flexible (v2)")
>>>>>> allowed for newer ASICs to mix GTT and VRAM, this change also noted that
>>>>>> some older boards, such as Stoney and Carrizo do not support this.
>>>>>> It appears that at least one additional ASIC does not support this which
>>>>>> is Raven.
>>>>>>
>>>>>> We observed this issue when migrating a device from a 5.4 to 6.6 kernel
>>>>>> and have confirmed that Raven also needs to be excluded from mixing GTT
>>>>>> and VRAM.
>>>>>
>>>>> Can you elaborate a bit on what the problem is?  For carrizo and
>>>>> stoney this is a hardware limitation (all display buffers need to be
>>>>> in GTT or VRAM, but not both).  Raven and newer don't have this
>>>>> limitation and we tested raven pretty extensively at the time.
>>>>
>>>> Thanks for taking the time to look. We have automated testing and a
>>>> few igt gpu tools tests failed and after debugging we found that
>>>> commit 81d0bcf99009 is what introduced the failures on this hardware
>>>> on 6.1+ kernels. The specific tests that fail are kms_async_flips and
>>>> kms_plane_alpha_blend, excluding Raven from this sharing of GTT and
>>>> VRAM buffers resolves the issue.
>>>
>>> + Harry and Leo
>>>
>>> This sounds like the memory placement issue we discussed last week.
>>> In that case, the issue is related to where the buffer ends up when we
>>> try to do an async flip.  In that case, we can't do an async flip
>>> without a full modeset if the buffers locations are different than the
>>> last modeset because we need to update more than just the buffer base
>>> addresses.  This change works around that limitation by always forcing
>>> display buffers into VRAM or GTT.  Adding raven to this case may fix
>>> those tests but will make the overall experience worse because we'll
>>> end up effectively not being able to not fully utilize both gtt and
>>> vram for display which would reintroduce all of the problems fixed by
>>> 81d0bcf99009 ("drm/amdgpu: make display pinning more flexible (v2)").
>>
>> Thanks Alex, the thing is, we only observe this on Raven boards, why
>> would Raven only be impacted by this? It would seem that all devices
>> would have this issue, no? Also, I'm not familiar with how
> 
> It depends on memory pressure and available memory in each pool.
> E.g., initially the display buffer is in VRAM when the initial mode
> set happens.  The watermarks, etc. are set for that scenario.  One of
> the next frames ends up in a pool different than the original.  Now
> the buffer is in GTT.  The async flip interface does a fast validation
> to try and flip as soon as possible, but that validation fails because
> the watermarks need to be updated which requires a full modeset.
> 
> It's tricky to fix because you don't want to use the worst case
> watermarks all the time because that will limit the number available
> display options and you don't want to force everything to a particular
> memory pool because that will limit the amount of memory that can be
> used for display (which is what the patch in question fixed).  Ideally
> the caller would do a test commit before the page flip to determine
> whether or not it would succeed before issuing it and then we'd have
> some feedback mechanism to tell the caller that the commit would fail
> due to buffer placement so it would do a full modeset instead.  We
> discussed this feedback mechanism last week at the display hackfest.

(A separate test commit may not buy anything, the compositor can just try it and react to errors)

Most compositors won't want to set the DRM_MODE_ATOMIC_ALLOW_MODESET flag for a "simple flip", since it could result in user-visible artifacts such as the display intermittently blanking.

If the driver can make it work without user-visible artifacts (e.g. by reprogramming watermarks), it should just do so without DRM_MODE_ATOMIC_ALLOW_MODESET. If not, it should return an error (and possibly more information via the future mechanism).


P.S. Without DRM_MODE_PAGE_FLIP_ASYNC, the driver must always be able to flip at least the primary plane (it can require disabling overlay planes) without DRM_MODE_ATOMIC_ALLOW_MODESET, or the compositor could end up in a corner it can't get out of.


-- 
Earthling Michel Dänzer       \        GNOME / Xwayland / Mesa developer
https://redhat.com             \               Libre software enthusiast
