Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 861B0A124EF
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 14:38:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01C9710E699;
	Wed, 15 Jan 2025 13:38:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="A0KhE3rI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDB0610E698
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 13:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BcT+goNThMRgE2PX1KqyjiTou2dYOlH6zKFXciEicWA=; b=A0KhE3rIbcDH1+HhjALkUeYXo3
 sKVA3MunVNFA+Oe/0OWH/sVvGIzaL1iTi6BsZBd/ez99xabw/yXJJGHbp8jeJpte0EOuYnFOy6gZP
 y6J91i7LjWPQuteVjRp7bJz8biwUbKBXtr37p3ftfLaKy8kvOI1q7614GGLA3VvQYSDd0KM7nNXGF
 c60u1wJf/Y+XY5wgCEHmef5sbZlkp3DY1PEveime1Hv+gU0j9ujRKYyBNz4sXl78CcxyS8KcS/gxy
 MOYfFT/VgnnXw48bCnTMLkERYPOSQif/7K2DI4JajwhVLpTZurvnfz0xuBFGmBynWbqB7d2yiGa87
 ieMgLvpw==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tY3bQ-00G5ns-O2; Wed, 15 Jan 2025 14:38:36 +0100
Message-ID: <d157226c-0512-48c4-82d6-4f4c70ec08f1@igalia.com>
Date: Wed, 15 Jan 2025 13:38:35 +0000
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
 <760bfbe5-958f-49dc-b454-a0daa82952f1@igalia.com>
 <ec68066d-460c-4d8e-ab8b-67acdfa973cf@mailbox.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <ec68066d-460c-4d8e-ab8b-67acdfa973cf@mailbox.org>
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


On 13/01/2025 15:29, Michel Dänzer wrote:
> On 2025-01-13 12:40, Tvrtko Ursulin wrote:
>> On 10/01/2025 09:14, Michel Dänzer wrote:
>>> On 2025-01-09 17:55, Tvrtko Ursulin wrote:
>>>> On 09/01/2025 15:08, Michel Dänzer wrote:
>>>>> On 2025-01-03 13:31, Christian König wrote:
>>>>>
>>>>>> What FIFO is still missing compared to RR is some sort of fairness between queues. E.g. a queues which hasn't submitted something in a while might get a bonus for their submissions compared to a queue which submits stuff all the time (or something like that).
>>>>>
>>>>> The lack of that could indeed explain the scenario above, if the game submits its GPU job for frame n+1 before Xwayland submits its GPU job for presenting frame n.
>>>>
>>>> I would be keen to experiment with this. There is that last patch in v2 of my series which scales the deadlines based on queue depth. So for a client which submits two frames it could be enough (in principle, not the actually posted version) to push out the deadline at qd=2 so a client which never breaks qd=1 can reliably overtake it.
>>>>
>>>> What would really be great if you could suggest me as easy to set up as possible test case with objective measuring criteria. And it would have to run on AMD. Quake II RTX under XWayland as the GitLab issue suggest or there is more to it? Does it has to be GNOME?
>>>
>>> Don't think it has to be.
>>>
>>>> Any way to run it programmatically and get a performance number out?
>>>
>>> This could be tricky, since the game itself reports the same frame rate in both cases. You'd have to compare the frame times in the compositor instead.
>>
>> So missed frames in the compositor?
> 
> Rather in Xwayland, the compositor is where it's visible to the user.

How would you suggest to instrument this, or what debug/logs to enable 
to see it?
>>> Also, the issue might no longer be reproducible in this particular scenario with current Xwayland, because it should no longer do any GPU copies for presentation but just forward the client buffers to the compositor.
>> Do you have an idea how could we find out more about that what you said: "people are saying RR works better than FIFO for some gaming scenarios even with current Xwayland, which shouldn't do any GPU copies for presentation of fullscreen windows"?
> 
> Other than asking affected users for more information, not offhand.

Could you find out more?

I currently don't have an idea how, with direct scanout ie. single 
rendering client, FIFO vs RR would make a difference.

For scenarios where copying is involved, experimenting/tweaking the 
frontend/DRM scheduler is not trivial. In the sense that for some 
approaches involving looking at the submission queue depth, such I 
mentioned before, it would require non-trivial refactoring. Which does 
not seem to be popular. And the resulting change in behaviour would be 
driver dependant too.

Btw what is the situation with context priority and compositors? Are 
they requesting high or sticking with the defaults?

Regards,

Tvrtko
