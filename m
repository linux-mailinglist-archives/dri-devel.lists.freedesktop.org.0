Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63AC9A12671
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 15:47:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84F0E10E712;
	Wed, 15 Jan 2025 14:47:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="XRGAQtz+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCD3C10E712
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 14:47:24 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4YY82z2Bqjz9sdN;
 Wed, 15 Jan 2025 15:46:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1736952411;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4B364nc4zhZ6thA4ILmR4L8pk/4MIprAwHXB9BQydBw=;
 b=XRGAQtz+/rhHbtdR8wpFUT7NeVwrxnncmdEc++Caq7Mfu1x6Mz/AuDzryRAzacndjcuN0/
 iI1Ezefzwte1Ww+mtXHtu4+j13pjISW+OhMVDp51L0LJ5uRSbfaGz7vKtPh5AwixuF2s9A
 fBtt7wvlS8yaiECSOekQUV5MgFvwBeEwcXU8CY1VD2NYd1jQiw2IZsD2A9qrQ+62h7xNaZ
 64Ybwq3hMDmfbUxucB3NC0S8/3C+qRJh27wcSEgFFffyE/f9Rss49Wv41wNyrUIQSZwDEf
 4PYt/WtTc85RYktQ5BtsMQ0Rh2Nj40jwUWoxQeIgWICI0TeJo2KExht5NiF0mg==
Message-ID: <6a90952b-200e-4f99-8312-b2184a9d6448@mailbox.org>
Date: Wed, 15 Jan 2025 15:46:48 +0100
MIME-Version: 1.0
Subject: Re: [RFC 00/14] Deadline scheduler and other ideas
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Philipp Stanner <pstanner@redhat.com>, Tvrtko Ursulin <tursulin@igalia.com>,
 dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Danilo Krummrich <dakr@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>
References: <20241230165259.95855-1-tursulin@igalia.com>
 <31842e821032305e5be7a8dcc3e13593fd09da20.camel@redhat.com>
 <99c7ccf4-a85f-4a11-912f-78f8d5a57516@igalia.com>
 <c4c62ea9-86c0-43c1-99b0-08af7b3bd71a@amd.com>
 <a202cc5b-13f5-4454-b32d-e2b5dcac85e9@mailbox.org>
 <690b5b62-78e4-48cb-a572-90d11b9b4ed6@igalia.com>
 <8f65b016-af77-4f15-b8c6-ffc30cc8157b@mailbox.org>
 <760bfbe5-958f-49dc-b454-a0daa82952f1@igalia.com>
 <ec68066d-460c-4d8e-ab8b-67acdfa973cf@mailbox.org>
 <d157226c-0512-48c4-82d6-4f4c70ec08f1@igalia.com>
From: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Content-Language: de-CH-frami, en-CA
In-Reply-To: <d157226c-0512-48c4-82d6-4f4c70ec08f1@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: p5qoeyhuwmro9fj3ak3jsctxp5yifc1y
X-MBO-RS-ID: 90729c938ce7d31297d
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

On 2025-01-15 14:38, Tvrtko Ursulin wrote:
> On 13/01/2025 15:29, Michel Dänzer wrote:
>> On 2025-01-13 12:40, Tvrtko Ursulin wrote:
>>> On 10/01/2025 09:14, Michel Dänzer wrote:
>>>> On 2025-01-09 17:55, Tvrtko Ursulin wrote:
>>>>> On 09/01/2025 15:08, Michel Dänzer wrote:
>>>>>> On 2025-01-03 13:31, Christian König wrote:
>>>>>>
>>>>>>> What FIFO is still missing compared to RR is some sort of fairness between queues. E.g. a queues which hasn't submitted something in a while might get a bonus for their submissions compared to a queue which submits stuff all the time (or something like that).
>>>>>>
>>>>>> The lack of that could indeed explain the scenario above, if the game submits its GPU job for frame n+1 before Xwayland submits its GPU job for presenting frame n.
>>>>>
>>>>> I would be keen to experiment with this. There is that last patch in v2 of my series which scales the deadlines based on queue depth. So for a client which submits two frames it could be enough (in principle, not the actually posted version) to push out the deadline at qd=2 so a client which never breaks qd=1 can reliably overtake it.
>>>>>
>>>>> What would really be great if you could suggest me as easy to set up as possible test case with objective measuring criteria. And it would have to run on AMD. Quake II RTX under XWayland as the GitLab issue suggest or there is more to it? Does it has to be GNOME?
>>>>
>>>> Don't think it has to be.
>>>>
>>>>> Any way to run it programmatically and get a performance number out?
>>>>
>>>> This could be tricky, since the game itself reports the same frame rate in both cases. You'd have to compare the frame times in the compositor instead.
>>>
>>> So missed frames in the compositor?
>>
>> Rather in Xwayland, the compositor is where it's visible to the user.
> 
> How would you suggest to instrument this, or what debug/logs to enable to see it?
>>>> Also, the issue might no longer be reproducible in this particular scenario with current Xwayland, because it should no longer do any GPU copies for presentation but just forward the client buffers to the compositor.
>>> Do you have an idea how could we find out more about that what you said: "people are saying RR works better than FIFO for some gaming scenarios even with current Xwayland, which shouldn't do any GPU copies for presentation of fullscreen windows"?
>>
>> Other than asking affected users for more information, not offhand.
> 
> Could you find out more?

Sorry, I don't have any particular personal interest or stake in this. I'm just pointing out that "FIFO is better than RR" isn't universally true.

Reaching out to affected users on https://gitlab.freedesktop.org/drm/amd/-/issues/2516 would seem like a possible start.


> I currently don't have an idea how, with direct scanout ie. single rendering client, FIFO vs RR would make a difference.

I saw one user mentioning they have "many background tasks", maybe some of those are using the GPU as well.


> Btw what is the situation with context priority and compositors? Are they requesting high or sticking with the defaults?

Requesting high. (Not that it makes much difference in practice if higher-priority jobs can't preempt lower-priority ones already in flight, as is the case with amdgpu without user-mode queues)


-- 
Earthling Michel Dänzer       \        GNOME / Xwayland / Mesa developer
https://redhat.com             \               Libre software enthusiast
