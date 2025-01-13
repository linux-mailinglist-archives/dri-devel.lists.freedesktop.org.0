Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66060A0B5E0
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 12:40:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D771E10E43A;
	Mon, 13 Jan 2025 11:40:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="A+P5xow2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D6CB10E43A
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 11:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=R6KYH+0PFl1ShEDjuwHrUO57SeWSiwFgRdB7qcEZIQA=; b=A+P5xow2Xqiev5Pq1cx59NeoF9
 lxycksUSXEK67sM7m71vmP0pJ2GRr3bhMQkkM52kzxjhf5DXZR/CQZyesxP6Lea0UeiB4XHP3WFye
 yeBXNl6EoB1Gk6YzwBcTsNAquVT1f3n24IlW5MiAFGoxZFsZ/eG5nKzx4Kz4dvm9/vXx4X/2wP4Uy
 c0iTab3OEZeEh00kc/mXMulfc9Dy17ZrhoEs44Jy5UWo0/fyuaTS52ogphjCo3DZNqIMW/0iY/3dN
 1i85LVIspuQsMon1Txj66fIZWne0c+ebp6DCE2n2/2Vwi5JprgqHOM/CFbxah/vPiLuJvcxOFcYLn
 YJNkfASw==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tXIni-00F9wI-EH; Mon, 13 Jan 2025 12:40:10 +0100
Message-ID: <760bfbe5-958f-49dc-b454-a0daa82952f1@igalia.com>
Date: Mon, 13 Jan 2025 11:40:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 00/14] Deadline scheduler and other ideas
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
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
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <8f65b016-af77-4f15-b8c6-ffc30cc8157b@mailbox.org>
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


On 10/01/2025 09:14, Michel Dänzer wrote:
> On 2025-01-09 17:55, Tvrtko Ursulin wrote:
>> On 09/01/2025 15:08, Michel Dänzer wrote:
>>> On 2025-01-03 13:31, Christian König wrote:
>>>> Am 03.01.25 um 13:02 schrieb Tvrtko Ursulin:
>>>>>>>
>>>>>>> One big question is whether round-robin can really be removed. Does
>>>>>>> anyone use
>>>>>>> it, rely on it, or what are even use cases where it is much better
>>>>>>> than FIFO.
>>>>>>
>>>>>> So AFAICS Round Robin is not used anymore by anyone. And my
>>>>>> understanding indeed is, too, that there is not really any use-case
>>>>>> where one would like anything except for FIFO.
>>>>>>
>>>>>> Looking at 977d97f18b5b ("drm/scheduler: Set the FIFO scheduling policy
>>>>>> as the default"), it seems to me that RR just was easy to implement and
>>>>>> it had the disadvantage of systems under high load cause the oldest job
>>>>>> to be starved to death, which is why FIFO was introduced.
>>>>>>
>>>>>> So my guess would be that RR just is a relict.
>>>>>>
>>>>>> If we agree on that, then we could remove RR in any case, and the
>>>>>> subsequent question would be whether FIFO should be replaced with
>>>>>> deadline (or: if there should be FIFO *and* deadline?), wouldn't it?
>>>>>
>>>>> I am unsure about RR but I agree what is the second part of the question.
>>>>
>>>> Well we came up with FIFO because we found that RR performed quite badly when you have a huge number of submitting applications.
>>>>
>>>> E.g. one of our cloud test cases ran 100 instances of a single game and the worst response time improved massively by switching from RR to FIFO.
>>>>
>>>> Different priorities on the other hand were originally invented to make sure the kernel has precedence over userspace. But later we also exposed the priorities to userspace which results in the problem that higher priority queues can starve low priority ones.
>>>
>>> FWIW, that can't explain why RR worked better in the scenario I described in https://gitlab.freedesktop.org/drm/amd/-/issues/2516#note_2119750, Xwayland uses normal GPU scheduling priority, just like the game.
>>>
>>>
>>>> That's the other reason why I said that RR should probably be removed and FIFO changed in a way that the priority is basically just a bonus to the score used for sorting the FIFO. I haven't taken a deeper look yet, but I think that this is more or less what this patch set here does.
>>>
>>> FWIW, people are saying RR works better than FIFO for some gaming scenarios even with current Xwayland, which shouldn't do any GPU copies for presentation of fullscreen windows. There seem to be other interactions which work better with RR than FIFO from the user PoV. If RR is to be removed, I'd recommend making sure deadline works at least as well as RR for those.
>>>
>>>
>>>> What FIFO is still missing compared to RR is some sort of fairness between queues. E.g. a queues which hasn't submitted something in a while might get a bonus for their submissions compared to a queue which submits stuff all the time (or something like that).
>>>
>>> The lack of that could indeed explain the scenario above, if the game submits its GPU job for frame n+1 before Xwayland submits its GPU job for presenting frame n.
>>
>> I would be keen to experiment with this. There is that last patch in v2 of my series which scales the deadlines based on queue depth. So for a client which submits two frames it could be enough (in principle, not the actually posted version) to push out the deadline at qd=2 so a client which never breaks qd=1 can reliably overtake it.
>>
>> What would really be great if you could suggest me as easy to set up as possible test case with objective measuring criteria. And it would have to run on AMD. Quake II RTX under XWayland as the GitLab issue suggest or there is more to it? Does it has to be GNOME?
> 
> Don't think it has to be.
> 
>> Any way to run it programmatically and get a performance number out?
> 
> This could be tricky, since the game itself reports the same frame rate in both cases. You'd have to compare the frame times in the compositor instead.

So missed frames in the compositor?

> Also, the issue might no longer be reproducible in this particular scenario with current Xwayland, because it should no longer do any GPU copies for presentation but just forward the client buffers to the compositor.
Do you have an idea how could we find out more about that what you said: 
"people are saying RR works better than FIFO for some gaming scenarios 
even with current Xwayland, which shouldn't do any GPU copies for 
presentation of fullscreen windows"?

Regards,

Tvrtko
