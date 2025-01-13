Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA2BA0BBF2
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 16:29:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D97110E6E2;
	Mon, 13 Jan 2025 15:29:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="Xd2V1LBE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1893510E6E2
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 15:29:52 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4YWx4t3dfFz9shm;
 Mon, 13 Jan 2025 16:29:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1736782158;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8CKKiVK8fR1ykMbHUC8IqvRY5wEaaO8wqMctSFKupdk=;
 b=Xd2V1LBE6oLSGyhKHTctE7UhD9EKtnQ7RjmuhSTUM0SE1hC8A2lQ4WzaVY9LdjRMSLROBX
 mMkSclRAMMa+rRTLaYE1kmIW4fAC5wSHXYuI7TsDtM63eJRXWp3Jw7OK6SkKJ4wrNbGmAe
 /+bhKeXRWsAES8+BDztcTcj+YSPBVxoa7pro8NKVid/ytAOZkloNVgES99udQ34OWnWOs9
 D/QSE/Fx5KZLTEk6/77fJS4qJUdWErMB2rFc2O4KD+zYeNJx04HGDdS0UdHcNfT2uM4FNb
 A6DmuQKYxrhXpzUTn4fbYUAKyhg0Ow3bO4ICfc7cwPlnh2Bm5tg9lQlmG3C6gA==
Message-ID: <ec68066d-460c-4d8e-ab8b-67acdfa973cf@mailbox.org>
Date: Mon, 13 Jan 2025 16:29:16 +0100
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
From: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Content-Language: de-CH-frami, en-CA
In-Reply-To: <760bfbe5-958f-49dc-b454-a0daa82952f1@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 8zonmafyi55xrjfxac3et9j9d697sady
X-MBO-RS-ID: 419c1f28cce2c92c5ad
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

On 2025-01-13 12:40, Tvrtko Ursulin wrote:
> On 10/01/2025 09:14, Michel Dänzer wrote:
>> On 2025-01-09 17:55, Tvrtko Ursulin wrote:
>>> On 09/01/2025 15:08, Michel Dänzer wrote:
>>>> On 2025-01-03 13:31, Christian König wrote:
>>>>
>>>>> What FIFO is still missing compared to RR is some sort of fairness between queues. E.g. a queues which hasn't submitted something in a while might get a bonus for their submissions compared to a queue which submits stuff all the time (or something like that).
>>>>
>>>> The lack of that could indeed explain the scenario above, if the game submits its GPU job for frame n+1 before Xwayland submits its GPU job for presenting frame n.
>>>
>>> I would be keen to experiment with this. There is that last patch in v2 of my series which scales the deadlines based on queue depth. So for a client which submits two frames it could be enough (in principle, not the actually posted version) to push out the deadline at qd=2 so a client which never breaks qd=1 can reliably overtake it.
>>>
>>> What would really be great if you could suggest me as easy to set up as possible test case with objective measuring criteria. And it would have to run on AMD. Quake II RTX under XWayland as the GitLab issue suggest or there is more to it? Does it has to be GNOME?
>>
>> Don't think it has to be.
>>
>>> Any way to run it programmatically and get a performance number out?
>>
>> This could be tricky, since the game itself reports the same frame rate in both cases. You'd have to compare the frame times in the compositor instead.
> 
> So missed frames in the compositor?

Rather in Xwayland, the compositor is where it's visible to the user.


>> Also, the issue might no longer be reproducible in this particular scenario with current Xwayland, because it should no longer do any GPU copies for presentation but just forward the client buffers to the compositor.
> Do you have an idea how could we find out more about that what you said: "people are saying RR works better than FIFO for some gaming scenarios even with current Xwayland, which shouldn't do any GPU copies for presentation of fullscreen windows"?

Other than asking affected users for more information, not offhand.


-- 
Earthling Michel Dänzer       \        GNOME / Xwayland / Mesa developer
https://redhat.com             \               Libre software enthusiast
