Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B22D12543
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 12:34:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF18C10E3A6;
	Mon, 12 Jan 2026 11:34:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="P894DcFQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B39910E39F;
 Mon, 12 Jan 2026 11:34:10 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4dqVdW4X5jz9tcZ;
 Mon, 12 Jan 2026 12:34:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1768217647;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d8rlGSoJxQTohwGd2bVPJ1S4uW+QJheDPobh7iFtTL0=;
 b=P894DcFQ+auLM5s0sIWopii4yHUJDgQQNcYSonMmMmzBsfo1jDOS55MqQS1CUwbkdV0DYc
 YjWHFSL5ORXs1pisZDrTSk+NiZdyi/YQegIKK0ojNjOEx4JDU4dQGj43AxmbC4bR/z9g3b
 lIn7gqKAdYsoERuUgifmvq4wmOC8lh4HKpornfRaeDsbcxivmdhtmL+fSnfVR/aqzfvE36
 /OJQfrdH/nRmcjAHkfcn6FOhyoBvW6idf+p+2x2RMGLM/vyKA794nDEi+Va3FvxRg1bEpD
 7FM5t1bm1RSRQSqAF9cPN5i+k8/LgbXK+Jz31acu2MHuBocIO72mQ3hd0BMHZQ==
Message-ID: <dd0a089c-6591-4fc3-b14e-5acc1c59cf8e@mailbox.org>
Date: Mon, 12 Jan 2026 12:34:01 +0100
MIME-Version: 1.0
Subject: Re: [PATCH RFC v3 0/7] Async Flip in Atomic ioctl corrections
To: "Murthy, Arun R" <arun.r.murthy@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 "xaver.hugl@kde.org" <xaver.hugl@kde.org>,
 "andrealmeid@igalia.com" <andrealmeid@igalia.com>,
 "Kumar, Naveen1" <naveen1.kumar@intel.com>,
 "Syrjala, Ville" <ville.syrjala@intel.com>,
 Dmitry Baryshkov <lumag@kernel.org>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20260108-async-v3-0-e7730c3fe9ff@intel.com>
 <342abb15-95e6-4ed6-8b86-a900c0f403a4@mailbox.org>
 <IA0PR11MB730722B84E81A0CC9BF80275BA82A@IA0PR11MB7307.namprd11.prod.outlook.com>
 <d1e6ad38-06bf-4139-966d-312bc728225c@mailbox.org>
 <83e50bd4-de11-4298-bab9-7a5255b0c5ca@intel.com>
From: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Content-Language: en-CA
In-Reply-To: <83e50bd4-de11-4298-bab9-7a5255b0c5ca@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: a9bfdf55568a29c3aaa
X-MBO-RS-META: ybazce1qmafp71yhci7t3j3i74jhze84
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

On 1/12/26 09:23, Murthy, Arun R wrote:
> On 09-01-2026 16:52, Michel Dänzer wrote:
>> On 1/9/26 12:07, Murthy, Arun R wrote:
>>>> From: Michel Dänzer <michel.daenzer@mailbox.org>
>>>> On 1/8/26 10:43, Arun R Murthy wrote:
>>>>> struct drm_crtc_state {
>>>>>          /**
>>>>>           * @async_flip:
>>>>>           *
>>>>>           * This is set when DRM_MODE_PAGE_FLIP_ASYNC is set in the legacy
>>>>>           * PAGE_FLIP IOCTL. It's not wired up for the atomic IOCTL
>>>>> itself yet.
>>>>>           */
>>>>>          bool async_flip;
>>>>>
>>>>> In the existing code the flag async_flip was intended for the legacy
>>>>> PAGE_FLIP IOCTL. But the same is being used for atomic IOCTL.
>>>>> As per the hardware feature is concerned, async flip is a plane
>>>>> feature and is to be treated per plane basis and not per pipe basis.
>>>>> For a given hardware pipe, among the multiple hardware planes, one can
>>>>> go with sync flip and other 2/3 can go with async flip.
>>>> FWIW, this kind of mix'n'match doesn't seem useful with current UAPI, since no
>>>> new commit can be made for the async plane(s) before the previous commit for
>>>> the sync plane(s) has completed, so the async plane(s) can't actually have
>>>> higher update rate than the sync one(s).
>>> That’s right, such mix and match flips will still consume vblank time for flipping.
>> Does a plane property really make sense for this then?
> 
> As per the hardware this async flip is per plane basis and not per crtc.

That's not really relevant.


> Not that I am trying to clean up this. Recently AMD added async support on overlays as well for which  few other hacks were added. The checks that we do for async flip were all done in place of copy the objs/properties, but it actually is supposed to be done in the check_only() part of the drm core code. This was the limitation with the existing implementation.

Those implementation details can be changed without changing UAPI.


> As per hardware the async flip is associated with the plane, hence changing it to a plane property.

A plane property would only really be needed for mixing async & sync plane updates in a single commit. Since that's currently not usefully possible due to other restrictions of the UAPI, the DRM_MODE_PAGE_FLIP_ASYNC flag which affects the commit as a whole is fine at this point.


>>> This series doesn’t solve that, but rather accommodate multiple plane async flips in an atomic ioctl and allowing disabling of a sync plane which is already enabled. There has been a long discussion in the gitlab(https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13834) on this.
>> AFAICT that's a false-positive rejection of commits which don't actually change cursor plane state.
> 
> https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13834#note_2855843

Not sure what you're trying to say here / how that comment contradicts what I wrote.


-- 
Earthling Michel Dänzer       \        GNOME / Xwayland / Mesa developer
https://redhat.com             \               Libre software enthusiast
