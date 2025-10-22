Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C57BFC9C9
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 16:44:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C85C10E7D5;
	Wed, 22 Oct 2025 14:44:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bhEoxQFe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59C2C10E7E9;
 Wed, 22 Oct 2025 14:44:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A86B063BFF;
 Wed, 22 Oct 2025 14:44:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA50DC4CEF7;
 Wed, 22 Oct 2025 14:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761144265;
 bh=D7REE8Z4PHIFhY2ILwfKKJUH6C5G15rEGzgelb+08m4=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=bhEoxQFeig8f3qjOmsyfrFBhrSBqGr11vmoG9ESclTR+FdiPc68oeJfh3G9ofoYka
 +0i2wVKejFEJd6ceb/WHqc+OHSpK7VlLPfJR5dczb8cYhqlu2qeob6OMVax+VxtyHI
 e0ih6WpyHXfMLphjNNm2XFkaYMkc0Af1wzPpKc2nL8HjIoy+8J9HpckO60YDv9Kp4t
 HKNWHOkUzYDCzIvhx2CoHGHuONapH6TPTSgu/IByTSjJjipiD04WGThBs0GXc7IK/X
 fDXlkeO+r7KUwNOzaqVnslm25rkKGHVzhOPuhoicTjcL21xA6iYi2iCeiG8kuM/Xt7
 Ri5sZqsKOgLYA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 22 Oct 2025 16:44:22 +0200
Message-Id: <DDOXJCVU8HVW.S58H517LVMEV@kernel.org>
Subject: Re: [PATCH v2 09/27] drm/sched: Add fair scheduling policy
Cc: <phasta@kernel.org>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <kernel-dev@igalia.com>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, "Matthew
 Brost" <matthew.brost@intel.com>, "Pierre-Eric Pelloux-Prayer"
 <pierre-eric.pelloux-prayer@amd.com>
To: "Tvrtko Ursulin" <tvrtko.ursulin@igalia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20251017133644.44747-1-tvrtko.ursulin@igalia.com>
 <20251017133644.44747-10-tvrtko.ursulin@igalia.com>
 <2f1eb1943d4d6a7185391e6d35e9c5d9818649da.camel@mailbox.org>
 <a6a6e8da-e1ae-44c4-a34f-c684a441ffca@igalia.com>
 <df3fa9d1893c3bd2a2b6de73613b26a3b8ed3d55.camel@mailbox.org>
 <c62693d0-f172-4b4f-b25c-6caef575bc2d@igalia.com>
 <DDOWNREZG1U8.HXMTNEYSFQHJ@kernel.org>
 <c836e71d-9cde-4379-9905-0fd881a252dd@igalia.com>
In-Reply-To: <c836e71d-9cde-4379-9905-0fd881a252dd@igalia.com>
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

On Wed Oct 22, 2025 at 4:24 PM CEST, Tvrtko Ursulin wrote:
>
> On 22/10/2025 15:03, Danilo Krummrich wrote:
>> On Wed Oct 22, 2025 at 3:50 PM CEST, Tvrtko Ursulin wrote:
>>> Yes, for the case when entity joins the run-queue it can be the same
>>> entity which is now the head of the queue, or it can be a different one=
.
>>> Depends on the insertion position.
>>>
>>> But for the case where entity is leaving the run queue it is always a
>>> different entity and therefore a lock inversion. We have essentially th=
is:
>>>
>>> lock entity
>>> lock rq
>>> remove entity from the rq
>>> rq->prio =3D rq->head_entity->prio // different entity, unlocked read
>>> unlock rq
>>> unlock entity
>>=20
>> This sounds like it repeates the unclear locking situation that is also
>> documented for struct drm_sched_rq:
>>=20
>> 	 * FIXME: Locking is very unclear for this. Writers are protected by
>> 	 * @lock, but readers are generally lockless and seem to just race with
>> 	 * not even a READ_ONCE.
>>=20
>> This sounds pretty suspicious to me and I think it indicates a more fund=
amental
>> design issue that you now end up working around now.
>
> I'm afraid it is not nearly the same. Guarantee that entity->rq is=20
> stable is a multi-step one which depends on the job queue being non=20
> empty and the last submitted job not being signalled. That side even=20
> includes a smp_rmb() in drm_sched_entity_select_rq(). Code which does=20
> the suspicious unlocked entity->rq access therefore claims to be certain=
=20
> one or both of those conditions must be true.
>
> What I am doing here is way, way simpler and IMO should not=20
> controversial. It is well defined that entities can only enter and exit=
=20
> the run queue with the rq->lock held. Which the code path holds, and the=
=20
> functions asserts for. So a lockless read of an integer is nowhere near=
=20
> the complexities of the FIXME you quote.

What I'm saying is that the pattern is the same, the writer side protects a=
n
entity field with a lock, whereas the reader side does not.

And the fact that this is done for locking inversion reasons indicates a de=
sign
issue -- not necessarily with your code, but maybe with the existing code.

>> I'd like to dig in a bit more, but unfortunately it's very unlikely I wi=
ll have
>> the time to do this until after LPC.
>
> Should I interpret this as putting a blocker on the series until=20
> effectively 2026?

It means that I won't have time to help by digging in and see if it's in fa=
ct an
issue you inherit from the existing code.
