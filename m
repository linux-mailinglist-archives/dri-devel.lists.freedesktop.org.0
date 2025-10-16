Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DCD9BE3069
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 13:14:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBE3910E9B6;
	Thu, 16 Oct 2025 11:14:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="X+4o/Le9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BC9B10E9B6;
 Thu, 16 Oct 2025 11:14:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 91AAE603E5;
 Thu, 16 Oct 2025 11:14:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48B7AC4CEF9;
 Thu, 16 Oct 2025 11:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760613274;
 bh=4ZOKvVHTNDBgCceiTe5O6f0IBpmdkI6kQvXyb1VZt9U=;
 h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
 b=X+4o/Le9HtRnIpNrhZGX1SUvcxauTtGk3ezqhcZ28YDJT1pGb2Zt1cf1q+KPEL5x/
 qWQiG5y7NoEpDeUqfqvyMGnBhjK5XY2r9UFbaIudu5oQNuSd/lE4uVARr8xU+4l2FA
 wW2g+jAxwmvxSHgw8An0ZJva9ygIuG8mSVNYPT+GKik7+/6YP20CLRjJzj/y1Xq/7r
 56jGe8heooabk+k7FsArC1YpS67nkklzjHXYCpUcfO+7WeWb5O3NBiA4VPeug4Jok7
 9eMHusEdu8Xb5bo8wJk8ez7pEOxkVP3VSn4BCPzBqJ6V8t9VMAkfNtGdxDKMlAANH5
 4OxXL+UflZ7hQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 16 Oct 2025 13:14:30 +0200
Message-Id: <DDJPBELK34FT.1MYSH10PK6ES2@kernel.org>
Cc: <phasta@kernel.org>, "Simona Vetter" <simona.vetter@ffwll.ch>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <kernel-dev@igalia.com>, =?utf-8?q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, "Matthew Brost" <matthew.brost@intel.com>,
 "Pierre-Eric Pelloux-Prayer" <pierre-eric.pelloux-prayer@amd.com>, "Simona
 Vetter" <simona@ffwll.ch>
To: "Tvrtko Ursulin" <tvrtko.ursulin@igalia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 10/28] drm/sched: Add fair scheduling policy
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
 <6c2e80b2-3c0d-4885-b815-2ecba803299f@igalia.com>
In-Reply-To: <6c2e80b2-3c0d-4885-b815-2ecba803299f@igalia.com>
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

On Thu Oct 16, 2025 at 12:54 PM CEST, Tvrtko Ursulin wrote:
> On 16/10/2025 10:50, Danilo Krummrich wrote:
>> On Thu Oct 16, 2025 at 10:42 AM CEST, Tvrtko Ursulin wrote:
>>> Yes, I even said two replies ago I will add the lock. In fact, it is
>>> write tearing which would be a problem on 32-bit architectures, not jus=
t
>>> read tearing.
>>>
>>> But again, it is not a lockless algorithm and nowhere I am implementing
>>> a new locking primitive. So as much as my attempt to keep it light
>>> hearted with the warm and fuzzy feeling comment was a miss, I also thin=
k
>>> the whole long writeups afterwards about dangers of implementing own
>>> lockelss algorithms and performance were the same.
>>=20
>> I think what's confusing people is the following:
>>=20
>> 	entity->stats->vruntime; /* Unlocked read */
>>=20
>> You indicate with your comment that you are accessing something the is p=
rotected
>> by a lock intentionally without the lock being held.
>>=20
>> I think there's not much room for people to interpret this as something =
else
>> than a lockless algorithm approach.
>>=20
>>> So lets move on, there is no argument here.
>>=20
>> Indeed, there is no argument. But, if you say something like:
>>=20
>> "I can add the _existing_ entity->stats lock around it just as well for =
those
>> warm and fuzzy feelings."
>
> You quote a comment from earlier in the thread which I already=20
> acknowledged was misplaced.
>
>> it may be read by people as if you don't agree that for correctness eith=
er a
>> lock or an atomic is required. So, people might keep arguing regardless.
>
> In the message you reply to I wrote that unlocked read in fact isn't=20
> safe on 32-bit architectures.
>
> So yeah, good catch, will fix. No need for long writeups about things=20
> which I did not say like performance claims, or inventing new locking=20
> primitives.

Please read my reply carefully, I tried explaining to you why people may ha=
ve
read it in this way and why it may caused them to write the replies you thi=
nk
are unnecessary.
