Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DBCB7B17C9
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 11:44:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49AD410E0BF;
	Thu, 28 Sep 2023 09:44:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org
 [IPv6:2001:67c:2050:0:465::102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D3BC10E0BF
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Sep 2023 09:44:00 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4Rx7ph53kYz9snJ;
 Thu, 28 Sep 2023 11:43:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1695894236;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O0ar4GJbMHcwj+PPhKWyLdrwfEgMwFXR+WbnF1sxZdI=;
 b=hSMXwFnDsUhFQcrUT+7RwxKN962YPps6N8zDtO9rdkDT7nqdD8psSh5zMDiXhPlz0Yz5r8
 baZRbxw4MSu9YcwVhkOwO6GPUnJoQdu+W8Bd/DPwDLaJhO6hX3KcHXpNABlMVGFu5z276z
 JLSsB+TcgnXPn9od7ePZEkYVXG0tX1dUwl1eTOf3MY7mSw+DfFpYYW6MCC6IILiEQQBYz7
 f9EgeUfon6AA2gQLudbHFOPlJjDHfAyhBc0+X04b8YPt3fjMMlDwde2sAxbk8vaIx762/x
 SPHgeGg6aLxhRbidXgZh6niuwbt7UfEEzBv0IWL/jfICiZE+afLqAWIr2q9Uzw==
Message-ID: <dbed4fe6-e99b-a31e-5715-7bd594fc22fb@mailbox.org>
Date: Thu, 28 Sep 2023 11:43:53 +0200
MIME-Version: 1.0
Subject: Re: [PATCH] drm/atomic: Perform blocking commits on workqueue
Content-Language: en-CA
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Ray Strode <halfline@gmail.com>
References: <20230926170549.2589045-1-halfline@gmail.com>
 <c2ffc21e-bf92-81f6-aa9b-233e3475025f@amd.com>
 <CAA_UwzKiNJe6hjbAo7SK7-OB7sb_ieV_DcQ_8vf6UYw2gppGcA@mail.gmail.com>
 <a1316597-e91b-32f8-78d3-13977438149b@amd.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel.daenzer@mailbox.org>
In-Reply-To: <a1316597-e91b-32f8-78d3-13977438149b@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 3b2c582a7184520c761
X-MBO-RS-META: jb1mjb5tar8owhk89pr9dendp9bigc51
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
Cc: alexander.deucher@amd.com, daniel.vetter@ffwll.ch, Xinhui.Pan@amd.com,
 dri-devel@lists.freedesktop.org, airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/28/23 08:56, Christian König wrote:
> Am 27.09.23 um 22:25 schrieb Ray Strode:
>> On Wed, Sep 27, 2023 at 4:05 AM Christian König
>> <christian.koenig@amd.com> wrote:
> 
>>> When it's really not desirable to account the CPU overhead to the
>>> process initiating it then you probably rather want to use an non
>>> blocking commit plus a dma_fence to wait for the work to end from userspace.
>> Well, first I don't think that's very convenient. You're talking about
>> a per-plane property, so there would need to be a separate file
>> descriptor allocated for every plane, right? and user-space would have
>> to block on all of them before proceeding?

OUT_FENCE_PTR is a per-CRTC property, not per-plane. Also, at least in this particular case, a single sync file (not dma_fence) for any CRTC might suffice.


>> Also, are you sure that works in all cases? The problematic case we're facing right >> now is when all planes and all crtcs are getting disabled. I'm just skimming
>> over the code here, but I see this:
>>
>> →       for_each_new_crtc_in_state(state, crtc, crtc_state, i) {•
>> ...
>> →       →       if (arg->flags & DRM_MODE_PAGE_FLIP_EVENT || fence_ptr) {•
>> ...
>> →       →       →       e = create_vblank_event(crtc, arg->user_data);•
>> ...
>> →       →       →       crtc_state->event = e;•
>> →       →       }•
>> ...
>> →       →       if (fence_ptr) {•
>> ...
>> →       →       →       fence = drm_crtc_create_fence(crtc);•
>> ...
>> →       →       →       ret = setup_out_fence(&f[(*num_fences)++], fence);•
>> ...
>> →       →       →       crtc_state->event->base.fence = fence;•
>> →       →       }•
>>
>> Is the code really going to allocate a vblank_event when all the
>> crtc's are disabled ? I guess it's possible, but that's
>> counterintuitive to me. I really don't know. You're confident a set of
>> fences will actually work?
> 
> No when you disable everything there is of course no fence allocated.

I don't see why not. "new_crtc_in_state" in this code means the atomic commit contains some state for the CRTC (such as setting the OUT_FENCE_PTR property), it could disable or leave it disabled though. I can't see any other code which would prevent this from working with a disabled CRTC, I could be missing something though.


> But then you also should never see anything waiting for to long to actually be able to trigger the RLIMIT_RTTIME.

amdgpu DC exceeds 200ms on some setups, see the linked issue.


>> Regardless, this seems like a roundabout way to address a problem that
>> we could just ... fix.

Handling modesets asynchronously does seem desirable in mutter to me. E.g. it would allow doing modesets in parallel with modesets or other atomic commits on other GPUs.


> From what I know RLIMIT_RTTIME usually works in units of multiple seconds. 

RealtimeKit seems to allow 200ms maximum.


-- 
Earthling Michel Dänzer            |                  https://redhat.com
Libre software enthusiast          |         Mesa and Xwayland developer

