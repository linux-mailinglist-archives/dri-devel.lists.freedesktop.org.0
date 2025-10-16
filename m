Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EEDCBE2F58
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 12:54:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1DE910E22E;
	Thu, 16 Oct 2025 10:54:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="a3rOH5IE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A89110E22E;
 Thu, 16 Oct 2025 10:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XuNziMLyyENCOzy7IOUYjbQS7Vm34+/HepaLzU08+vE=; b=a3rOH5IEpCP3KL1xWhoX1KOb79
 7d+TP8NRkhopzXSJArU9sOGgbI1HtEgt74xWXv3P4Hg6d8CfiYv/HpVWmcsLKHNBQey4kNaCIt1ml
 fNt0+mAqMe/j/xOl1zJtjEMKy1ih1dPcxDpvtb5tGvvP5hjTmGr+xVR3C1BdFagXFz3GQ72p+ms4H
 zKfUr0bZlDabpaT2axrxWSONisQ4SSFnn4VfN9yCv9AQ0B3ua31el/HhCBxrp96+D6Rt9Q49cJyEJ
 aZXwLkmhFrML3vFk/XDAZ7zucyw10DSVy8mXX9Wt9nHku62zLpVBos5E0QwgPdoDbvvpYgZ1CQqpn
 RiUNKfsQ==;
Received: from [90.242.12.242] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1v9Lcn-00APDd-56; Thu, 16 Oct 2025 12:54:25 +0200
Message-ID: <6c2e80b2-3c0d-4885-b815-2ecba803299f@igalia.com>
Date: Thu, 16 Oct 2025 11:54:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/28] drm/sched: Add fair scheduling policy
To: Danilo Krummrich <dakr@kernel.org>
Cc: phasta@kernel.org, Simona Vetter <simona.vetter@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Matthew Brost <matthew.brost@intel.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Simona Vetter <simona@ffwll.ch>
References: <20251008085359.52404-1-tvrtko.ursulin@igalia.com>
 <20251008085359.52404-11-tvrtko.ursulin@igalia.com>
 <db78f7074cf1e83afbbf68c27b9e7b55bfb9a73b.camel@mailbox.org>
 <eb1c157e-d99f-4e54-a669-15d4e5f78a64@igalia.com>
 <d76c17eaab3e8dff76720cc395cdfccde029858d.camel@mailbox.org>
 <aO5fErextiuPQcyq@phenom.ffwll.local>
 <3f644749-8ceb-4124-98c6-84dfe198020f@igalia.com>
 <6786d7766f363f2a24da9977b11436651ae1a731.camel@mailbox.org>
 <8ce0c1f8-0abd-4767-a938-f1aea9fe3b48@igalia.com>
 <DDJNJ3NHFOLV.NGWTLDU5Y7IR@kernel.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <DDJNJ3NHFOLV.NGWTLDU5Y7IR@kernel.org>
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


On 16/10/2025 10:50, Danilo Krummrich wrote:
> On Thu Oct 16, 2025 at 10:42 AM CEST, Tvrtko Ursulin wrote:
>> Yes, I even said two replies ago I will add the lock. In fact, it is
>> write tearing which would be a problem on 32-bit architectures, not just
>> read tearing.
>>
>> But again, it is not a lockless algorithm and nowhere I am implementing
>> a new locking primitive. So as much as my attempt to keep it light
>> hearted with the warm and fuzzy feeling comment was a miss, I also think
>> the whole long writeups afterwards about dangers of implementing own
>> lockelss algorithms and performance were the same.
> 
> I think what's confusing people is the following:
> 
> 	entity->stats->vruntime; /* Unlocked read */
> 
> You indicate with your comment that you are accessing something the is protected
> by a lock intentionally without the lock being held.
> 
> I think there's not much room for people to interpret this as something else
> than a lockless algorithm approach.
> 
>> So lets move on, there is no argument here.
> 
> Indeed, there is no argument. But, if you say something like:
> 
> "I can add the _existing_ entity->stats lock around it just as well for those
> warm and fuzzy feelings."

You quote a comment from earlier in the thread which I already 
acknowledged was misplaced.

> it may be read by people as if you don't agree that for correctness either a
> lock or an atomic is required. So, people might keep arguing regardless. In the message you reply to I wrote that unlocked read in fact isn't 
safe on 32-bit architectures.

So yeah, good catch, will fix. No need for long writeups about things 
which I did not say like performance claims, or inventing new locking 
primitives.

Regards,

Tvrtko

