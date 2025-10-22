Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC23BFC5C2
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 16:03:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A948E10E7A7;
	Wed, 22 Oct 2025 14:03:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="iuQdA5kn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0260A10E7A6;
 Wed, 22 Oct 2025 14:03:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 9E08743F38;
 Wed, 22 Oct 2025 14:03:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F386EC4CEE7;
 Wed, 22 Oct 2025 14:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761141789;
 bh=xrm1w4yERgygRqUBRscWdCpDySrnBpn65cTh+rqN8Fc=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=iuQdA5knu9fbzUeMyBzyFXIYOrU8bEtrfVnvcpqKELvI7oDxRjOAyX59cVcN1PFXq
 RjGlhFkqm/n9H7B8FUG0wlPGiQ/xNMe9Qui39yqjSLMI5cb3PR5WLfsUv67JXoYbmi
 xBYl9GWwmTpRYPj7348jHy7bbWr7kgi7Ener/UE+icLfFwQ8yFNgiai2UxzCHk3qAh
 vDF6OMsETEHLtETztGJcbEsb7MHxOtn0kw0cqyxhu/b5m7IJTXOc48oFOfDOCrLMfh
 jGiG/9wPwIKqqnlY8MQNiOdsw8o5M4qfilgKjVg0fcUPlt3WM2LUNBCRLQbKPptnbf
 b+laQfdlNpIrA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 22 Oct 2025 16:03:06 +0200
Message-Id: <DDOWNREZG1U8.HXMTNEYSFQHJ@kernel.org>
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
In-Reply-To: <c62693d0-f172-4b4f-b25c-6caef575bc2d@igalia.com>
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

On Wed Oct 22, 2025 at 3:50 PM CEST, Tvrtko Ursulin wrote:
> Yes, for the case when entity joins the run-queue it can be the same=20
> entity which is now the head of the queue, or it can be a different one.=
=20
> Depends on the insertion position.
>
> But for the case where entity is leaving the run queue it is always a=20
> different entity and therefore a lock inversion. We have essentially this=
:
>
> lock entity
> lock rq
> remove entity from the rq
> rq->prio =3D rq->head_entity->prio // different entity, unlocked read
> unlock rq
> unlock entity

This sounds like it repeates the unclear locking situation that is also
documented for struct drm_sched_rq:

	 * FIXME: Locking is very unclear for this. Writers are protected by
	 * @lock, but readers are generally lockless and seem to just race with
	 * not even a READ_ONCE.

This sounds pretty suspicious to me and I think it indicates a more fundame=
ntal
design issue that you now end up working around now.

I'd like to dig in a bit more, but unfortunately it's very unlikely I will =
have
the time to do this until after LPC.
