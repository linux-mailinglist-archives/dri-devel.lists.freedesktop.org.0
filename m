Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A2CBFC7C5
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 16:24:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1245510E7CA;
	Wed, 22 Oct 2025 14:24:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="e0H6pJpj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82A4410E7C8;
 Wed, 22 Oct 2025 14:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sul5MNyOLZ4Sq6XICaXAZybizXHbk/dd1tfrb7pVu7k=; b=e0H6pJpj0iYPUbchMauQQRlbgz
 4eq6DO5vU2h93BkJ8c/CsPdsJn+o69eFg9bjvv8ceOfwXIjddXgL7c8gC4DyufbrxJKXYX/zGHFgw
 DR1Tg8R48jfmNIqTmiqN0kMAKreovyMuDS4/fQ0tHcYr8y6I4KLC7aT9nb37pL9sgTvUPPtgR/ids
 VhzaOuF+Freg3IQ9ZjSJXWKqXhBxIWhJUd7h02pMXv69GKG9Iq77tYGLBK67yZ8ysJJU2dQZNDA20
 sGo11fEd2/uXZe2bKX9ELTCcF0b61p+9uWH+ycY6zedLVd6rWxIWJm+ReKDr6GAU7N7bDGgaHoeUu
 Dt/V37/g==;
Received: from [90.242.12.242] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1vBZlh-00D85V-Ci; Wed, 22 Oct 2025 16:24:49 +0200
Message-ID: <c836e71d-9cde-4379-9905-0fd881a252dd@igalia.com>
Date: Wed, 22 Oct 2025 15:24:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/27] drm/sched: Add fair scheduling policy
To: Danilo Krummrich <dakr@kernel.org>
Cc: phasta@kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
References: <20251017133644.44747-1-tvrtko.ursulin@igalia.com>
 <20251017133644.44747-10-tvrtko.ursulin@igalia.com>
 <2f1eb1943d4d6a7185391e6d35e9c5d9818649da.camel@mailbox.org>
 <a6a6e8da-e1ae-44c4-a34f-c684a441ffca@igalia.com>
 <df3fa9d1893c3bd2a2b6de73613b26a3b8ed3d55.camel@mailbox.org>
 <c62693d0-f172-4b4f-b25c-6caef575bc2d@igalia.com>
 <DDOWNREZG1U8.HXMTNEYSFQHJ@kernel.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <DDOWNREZG1U8.HXMTNEYSFQHJ@kernel.org>
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


On 22/10/2025 15:03, Danilo Krummrich wrote:
> On Wed Oct 22, 2025 at 3:50 PM CEST, Tvrtko Ursulin wrote:
>> Yes, for the case when entity joins the run-queue it can be the same
>> entity which is now the head of the queue, or it can be a different one.
>> Depends on the insertion position.
>>
>> But for the case where entity is leaving the run queue it is always a
>> different entity and therefore a lock inversion. We have essentially this:
>>
>> lock entity
>> lock rq
>> remove entity from the rq
>> rq->prio = rq->head_entity->prio // different entity, unlocked read
>> unlock rq
>> unlock entity
> 
> This sounds like it repeates the unclear locking situation that is also
> documented for struct drm_sched_rq:
> 
> 	 * FIXME: Locking is very unclear for this. Writers are protected by
> 	 * @lock, but readers are generally lockless and seem to just race with
> 	 * not even a READ_ONCE.
> 
> This sounds pretty suspicious to me and I think it indicates a more fundamental
> design issue that you now end up working around now.

I'm afraid it is not nearly the same. Guarantee that entity->rq is 
stable is a multi-step one which depends on the job queue being non 
empty and the last submitted job not being signalled. That side even 
includes a smp_rmb() in drm_sched_entity_select_rq(). Code which does 
the suspicious unlocked entity->rq access therefore claims to be certain 
one or both of those conditions must be true.

What I am doing here is way, way simpler and IMO should not 
controversial. It is well defined that entities can only enter and exit 
the run queue with the rq->lock held. Which the code path holds, and the 
functions asserts for. So a lockless read of an integer is nowhere near 
the complexities of the FIXME you quote.

> I'd like to dig in a bit more, but unfortunately it's very unlikely I will have
> the time to do this until after LPC.

Should I interpret this as putting a blocker on the series until 
effectively 2026?

Regards,

Tvrtko

