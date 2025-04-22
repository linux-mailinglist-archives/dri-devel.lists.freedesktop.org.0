Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92EC7A96C8E
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 15:26:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8128010E5A4;
	Tue, 22 Apr 2025 13:26:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="K9vw1Xs7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DEC110E5A1;
 Tue, 22 Apr 2025 13:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Qqc36waS2eM9KRFhP4odJMZbCYBITaK1zvGamxcN6gA=; b=K9vw1Xs7HVg4ZHOb6RnI7LDG93
 pP93G64VQjUiQuhOz3hteOlbfaB6uaGynw8R4vSQiq6BrhuGJQoIWBh2gDC+lgy1hoJM2QXE9y8Mo
 nzQO2N+pxG+mn91rbKZDlvDAVxRfjzpHYeHsp1SMvyUCnAYFEnCnK4BPrmBsvw17LCmPTycm6JO7a
 e462UcrMIc1wRM7vSfhr0+YqAF78SFLDya21SzHeZsJ5nHRJms9iKFC6hFygqw4LF3Gz5tDrepG02
 Q5qreWmoyuq0oiM/q3wG1q6QJAtV3IwVuI5e6BTjGGIzQn+V5/VnPolN5m0nsGIDS7OgKgTtI4+Cw
 /2+HaCXg==;
Received: from [81.79.92.254] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1u7DdJ-006SEy-4Z; Tue, 22 Apr 2025 15:25:53 +0200
Message-ID: <3afc0582-6e25-45f7-8f9d-90545ae68258@igalia.com>
Date: Tue, 22 Apr 2025 14:25:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] drm/sched: Warn if pending list is not empty
To: phasta@kernel.org, Danilo Krummrich <dakr@kernel.org>
Cc: Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250407152239.34429-2-phasta@kernel.org>
 <20250407152239.34429-5-phasta@kernel.org>
 <9607e5a54b8c5041dc7fc134425cc36c0c70b5f3.camel@mailbox.org>
 <3ac34c84-fd84-4598-96e1-239418b7109f@igalia.com> <aADv4ivXZoJpEA7k@pollux>
 <83758ca7-8ece-433e-b904-3d21690ead23@igalia.com>
 <aAEUwjzZ9w9xlKRY@cassiopeiae>
 <0e8313dc-b1bb-4ce7-b5b7-b8b3e027adb7@igalia.com>
 <0bfa746ca37de1813db22e518ffb259648d29e02.camel@mailbox.org>
 <5a5d4a33-2f7b-46e4-8707-7445ac3de376@igalia.com>
 <aAd54jUwBwgc-_g2@cassiopeiae>
 <649c7fe3469c39496db89de6951d9f2b61c36576.camel@mailbox.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <649c7fe3469c39496db89de6951d9f2b61c36576.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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


On 22/04/2025 13:00, Philipp Stanner wrote:
> On Tue, 2025-04-22 at 13:13 +0200, Danilo Krummrich wrote:
>> On Tue, Apr 22, 2025 at 11:39:11AM +0100, Tvrtko Ursulin wrote:
>>> Question I raised is if there are other drivers which manage to
>>> clean up
>>> everything correctly (like the mock scheduler does), but trigger
>>> that
>>> warning. Maybe there are not and maybe mock scheduler is the only
>>> false
>>> positive.
> 
> For clarification:
> 
> I messed up the comment from the cover letter.
> 
> What I did was run the *old* unit tests (v5 IIRC) from Tvrtko that
> still had the memory leaks. Those then trigger the warning print, as is
> expected, since they don't provide fence_context_kill().
> 
> The current unit tests are fine memory-leak-wise.
> 
> IOW, both with Nouveau and the unit tests, everything behaves as
> expected, without issues.

Hmm how? Pending list can be non-empty so it should be possible to hit 
that warn.

Regards,

Tvrtko

>> So far the scheduler simply does not give any guideline on how to
>> address the
>> problem, hence every driver simply does something (or nothing,
>> effectively
>> ignoring the problem). This is what we want to fix.
>>
>> The mock scheduler keeps it's own list of pending jobs and on tear
>> down stops
>> the scheduler's workqueues, traverses it's own list and eventually
>> frees the
>> pending jobs without updating the scheduler's internal pending list.
>>
>> So yes, it does avoid memory leaks, but it also leaves the schedulers
>> internal
>> structures with an invalid state, i.e. the pending list of the
>> scheduler has
>> pointers to already freed memory.
>>
>> What if the drm_sched_fini() starts touching the pending list? Then
>> you'd end up
>> with UAF bugs with this implementation. We cannot invalidate the
>> schedulers
>> internal structures and yet call scheduler functions - e.g.
>> drm_sched_fini() -
>> subsequently.
>>
>> Hence, the current implementation of the mock scheduler is
>> fundamentally flawed.
>> And so would be *every* driver that still has entries within the
>> scheduler's
>> pending list.
>>
>> This is not a false positive, it already caught a real bug -- in the
>> mock
>> scheduler.
>>
>> - Danilo
> 

