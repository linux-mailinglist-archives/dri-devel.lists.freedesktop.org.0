Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C01A07B2C
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 16:08:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F63610EE25;
	Thu,  9 Jan 2025 15:08:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="ZeFG58q1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FE6210EE4C
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 15:08:06 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4YTSpC0sgPz9sTq;
 Thu,  9 Jan 2025 16:08:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1736435283;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VRLRxJkT1g/XVIY/2GNtfahhv1oyOuhswOmARQnN7V8=;
 b=ZeFG58q1s2j7QAmZvhqXTqLDXbvIVdfVL2iqEGLnJuEx8P/a4Ihb8+V3dyeqzyPu5GcfOK
 CXxpEPc6F9kZMgGpX+ljiUkvuQOZEErkzaSnLWm5km1wEGjHtXDqbWpauZpADnn+enqKFf
 KD/nEplTQCUtQSCUz5xacfLQZosVZtJnmJAeMlNoboyYprv6bqSqaUDhZt/EcGfGu6IRS6
 VURi99BZ2Tz12X1GVPgXwgfTtoflqjDSgsMpboXn6m9Yr9302Hg88az37CNU/Hrz9zSSsi
 GyJwEQeFPmZ0rGwb3SHyFskRIri/+a+fWm0loW371J/SqNrYbqAVJC2iijfbGg==
Message-ID: <a202cc5b-13f5-4454-b32d-e2b5dcac85e9@mailbox.org>
Date: Thu, 9 Jan 2025 16:08:01 +0100
MIME-Version: 1.0
Subject: Re: [RFC 00/14] Deadline scheduler and other ideas
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Philipp Stanner <pstanner@redhat.com>, Tvrtko Ursulin <tursulin@igalia.com>,
 dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Danilo Krummrich <dakr@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>
References: <20241230165259.95855-1-tursulin@igalia.com>
 <31842e821032305e5be7a8dcc3e13593fd09da20.camel@redhat.com>
 <99c7ccf4-a85f-4a11-912f-78f8d5a57516@igalia.com>
 <c4c62ea9-86c0-43c1-99b0-08af7b3bd71a@amd.com>
From: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Content-Language: de-CH-frami, en-CA
In-Reply-To: <c4c62ea9-86c0-43c1-99b0-08af7b3bd71a@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: ef216d3f0294fe8772c
X-MBO-RS-META: jhkwd6s3uws8o1z1yz9za49xnw3jn6oj
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

On 2025-01-03 13:31, Christian König wrote:
> Am 03.01.25 um 13:02 schrieb Tvrtko Ursulin:
>>>>
>>>> One big question is whether round-robin can really be removed. Does
>>>> anyone use
>>>> it, rely on it, or what are even use cases where it is much better
>>>> than FIFO.
>>>
>>> So AFAICS Round Robin is not used anymore by anyone. And my
>>> understanding indeed is, too, that there is not really any use-case
>>> where one would like anything except for FIFO.
>>>
>>> Looking at 977d97f18b5b ("drm/scheduler: Set the FIFO scheduling policy
>>> as the default"), it seems to me that RR just was easy to implement and
>>> it had the disadvantage of systems under high load cause the oldest job
>>> to be starved to death, which is why FIFO was introduced.
>>>
>>> So my guess would be that RR just is a relict.
>>>
>>> If we agree on that, then we could remove RR in any case, and the
>>> subsequent question would be whether FIFO should be replaced with
>>> deadline (or: if there should be FIFO *and* deadline?), wouldn't it?
>>
>> I am unsure about RR but I agree what is the second part of the question.
> 
> Well we came up with FIFO because we found that RR performed quite badly when you have a huge number of submitting applications.
> 
> E.g. one of our cloud test cases ran 100 instances of a single game and the worst response time improved massively by switching from RR to FIFO.
> 
> Different priorities on the other hand were originally invented to make sure the kernel has precedence over userspace. But later we also exposed the priorities to userspace which results in the problem that higher priority queues can starve low priority ones.

FWIW, that can't explain why RR worked better in the scenario I described in https://gitlab.freedesktop.org/drm/amd/-/issues/2516#note_2119750, Xwayland uses normal GPU scheduling priority, just like the game.


> That's the other reason why I said that RR should probably be removed and FIFO changed in a way that the priority is basically just a bonus to the score used for sorting the FIFO. I haven't taken a deeper look yet, but I think that this is more or less what this patch set here does.

FWIW, people are saying RR works better than FIFO for some gaming scenarios even with current Xwayland, which shouldn't do any GPU copies for presentation of fullscreen windows. There seem to be other interactions which work better with RR than FIFO from the user PoV. If RR is to be removed, I'd recommend making sure deadline works at least as well as RR for those.


> What FIFO is still missing compared to RR is some sort of fairness between queues. E.g. a queues which hasn't submitted something in a while might get a bonus for their submissions compared to a queue which submits stuff all the time (or something like that).

The lack of that could indeed explain the scenario above, if the game submits its GPU job for frame n+1 before Xwayland submits its GPU job for presenting frame n.


-- 
Earthling Michel Dänzer       \        GNOME / Xwayland / Mesa developer
https://redhat.com             \               Libre software enthusiast
