Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 268F87B20FA
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 17:19:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41F7E10E678;
	Thu, 28 Sep 2023 15:19:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10B7810E678
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Sep 2023 15:19:34 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4RxHFv1hYvz9sTD;
 Thu, 28 Sep 2023 17:19:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1695914371;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I9a9ACytXq+WRh8GejARBZ8Ki0E/Uj+wi0vCGNI3sf8=;
 b=Lh6SZJfN2pYmjOk5jVoUUUeviodjqPgaEo1CBGmaE1tSAf2QXoeukFgBlwjISn+wibVNLE
 6fOu3yjJPElH0AQ+/InVYFdlfYB46vBToZZkHxxWcU+62EHqf30D2b4Gh0R2I4P9G531fB
 s1JMjg97hFAFPM6gR7xVeasb/mf9qJemVRvcsFJZPpE+n7oSG3Awdg3lkW+ebFlAlhxpfl
 TtkWf1kBurj7fV7hWQtbcgvhcJejTc1T4/yqdppPxbIgeAKBfeDGYHOa7zf5fvmBt2rRNt
 jPDz2dzjYsxA6rhrRvsUMTvH+9FTKh5x63Aica4pv9AevtufLRhaw9PLOSrADA==
Message-ID: <9772fbd3-be44-a799-fb21-b4ab50418f6a@mailbox.org>
Date: Thu, 28 Sep 2023 17:19:29 +0200
MIME-Version: 1.0
Subject: Re: [PATCH] drm/atomic: Perform blocking commits on workqueue
Content-Language: en-CA
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Ray Strode <halfline@gmail.com>
References: <20230926170549.2589045-1-halfline@gmail.com>
 <c2ffc21e-bf92-81f6-aa9b-233e3475025f@amd.com>
 <CAA_UwzKiNJe6hjbAo7SK7-OB7sb_ieV_DcQ_8vf6UYw2gppGcA@mail.gmail.com>
 <a1316597-e91b-32f8-78d3-13977438149b@amd.com>
 <dbed4fe6-e99b-a31e-5715-7bd594fc22fb@mailbox.org>
 <CAA_UwzLpRsNHK7yFWP3tzLFgeZMMpq_AiWBEHW5Om6hfBxyYbA@mail.gmail.com>
 <806ab015-215d-4b45-1702-429e39d6edc5@mailbox.org>
 <2e19a4a1-d42e-4e89-a0c1-c89e44d05819@amd.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel.daenzer@mailbox.org>
In-Reply-To: <2e19a4a1-d42e-4e89-a0c1-c89e44d05819@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: eb0a49bf15d88d9a79d
X-MBO-RS-META: ff6ngoot8popy3kd4qhfrm3jqfk5f8sh
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

On 9/28/23 16:51, Christian König wrote:
> Am 28.09.23 um 15:37 schrieb Michel Dänzer:
>> On 9/28/23 14:59, Ray Strode wrote:
>>> On Thu, Sep 28, 2023 at 5:43 AM Michel Dänzer
>>> <michel.daenzer@mailbox.org> wrote:
>>>>>>> When it's really not desirable to account the CPU overhead to the
>>>>>>> process initiating it then you probably rather want to use an non
>>>>>>> blocking commit plus a dma_fence to wait for the work to end from userspace.
>>>>>> Well, first I don't think that's very convenient. You're talking about
>>>>>> a per-plane property, so there would need to be a separate file
>>>>>> descriptor allocated for every plane, right? and user-space would have
>>>>>> to block on all of them before proceeding?
>>>> OUT_FENCE_PTR is a per-CRTC property, not per-plane.
>>> Okay, sure.
>>>
>>>> Also, at least in this particular case, a single sync file (not dma_fence) for any CRTC might suffice.
>>> I don't see how we could rely on that given the provided api and
>>> multitude of drivers. It might work and then break randomly.
>> If it's supposed to work from the KMS API PoV, any bugs to the contrary should be fixed.
>>
>> I'm not really seeing the big difference between using a single fence or multiple, anyway.
> 
> The big difference is that a standard modeset can take some time, e.g. setting up power levels, waiting for PLLs to settle, waiting for a vblank etc..

Right (starting a game shouldn't involve such a modeset though in a Wayland session).

What I mean is there's no significant difference for user space between using a single out fence or multiple. Just slightly different bookkeeping.


> But in the case of turning thing off, what should we wait for?

The atomic commit to finish, so it's safe to submit another one without hitting EBUSY. (What we use the completion events for with page flips)


-- 
Earthling Michel Dänzer            |                  https://redhat.com
Libre software enthusiast          |         Mesa and Xwayland developer

