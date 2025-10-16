Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC3BBE2801
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 11:50:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED5D510E99D;
	Thu, 16 Oct 2025 09:50:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WHHQNyn0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C66210E998;
 Thu, 16 Oct 2025 09:50:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 2EF39603CE;
 Thu, 16 Oct 2025 09:50:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E43F4C4CEF9;
 Thu, 16 Oct 2025 09:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760608234;
 bh=ZzE0AG0XePJpAPUGhN5g8yuSoorR5064IBWA3TztL2U=;
 h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
 b=WHHQNyn0B900GgpDp9T9zeR2dpEeymcDw2B6J8ScoWicqYsBWM2Io2xradE/Z18ba
 HHmdNmZZvyEg0aWPAZZvQrkU2O/n/s3kvx2T3ifDGb7/jtWzP7keeCHRvvLyjq8K3H
 lsIIwbHAs9BkfujtyG5RrajEzPXJZVegc5fzDKHzpqEhJsoebL/DegnQoHVWUA2A40
 75TsHmSIATq2Q7mGEVVe5SZ8QrzibxmWs4mhtc1xM33+NbpIF9E2NXx7ctnpNQ2hTr
 BpjfWPn5NI7ZZ1HnIZyfwjhCY074YZ/wG5OB9X4FY5NHQfvui7bRKNYwsaizua8dFd
 0xt4gVE8RMtlg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 16 Oct 2025 11:50:31 +0200
Message-Id: <DDJNJ3NHFOLV.NGWTLDU5Y7IR@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 10/28] drm/sched: Add fair scheduling policy
Cc: <phasta@kernel.org>, "Simona Vetter" <simona.vetter@ffwll.ch>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <kernel-dev@igalia.com>, =?utf-8?q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, "Matthew Brost" <matthew.brost@intel.com>,
 "Pierre-Eric Pelloux-Prayer" <pierre-eric.pelloux-prayer@amd.com>, "Simona
 Vetter" <simona@ffwll.ch>
To: "Tvrtko Ursulin" <tvrtko.ursulin@igalia.com>
References: <20251008085359.52404-1-tvrtko.ursulin@igalia.com>
 <20251008085359.52404-11-tvrtko.ursulin@igalia.com>
 <db78f7074cf1e83afbbf68c27b9e7b55bfb9a73b.camel@mailbox.org>
 <eb1c157e-d99f-4e54-a669-15d4e5f78a64@igalia.com>
 <d76c17eaab3e8dff76720cc395cdfccde029858d.camel@mailbox.org>
 <aO5fErextiuPQcyq@phenom.ffwll.local>
 <3f644749-8ceb-4124-98c6-84dfe198020f@igalia.com>
 <6786d7766f363f2a24da9977b11436651ae1a731.camel@mailbox.org>
 <8ce0c1f8-0abd-4767-a938-f1aea9fe3b48@igalia.com>
In-Reply-To: <8ce0c1f8-0abd-4767-a938-f1aea9fe3b48@igalia.com>
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

On Thu Oct 16, 2025 at 10:42 AM CEST, Tvrtko Ursulin wrote:
> Yes, I even said two replies ago I will add the lock. In fact, it is=20
> write tearing which would be a problem on 32-bit architectures, not just=
=20
> read tearing.
>
> But again, it is not a lockless algorithm and nowhere I am implementing=
=20
> a new locking primitive. So as much as my attempt to keep it light=20
> hearted with the warm and fuzzy feeling comment was a miss, I also think=
=20
> the whole long writeups afterwards about dangers of implementing own=20
> lockelss algorithms and performance were the same.

I think what's confusing people is the following:

	entity->stats->vruntime; /* Unlocked read */

You indicate with your comment that you are accessing something the is prot=
ected
by a lock intentionally without the lock being held.

I think there's not much room for people to interpret this as something els=
e
than a lockless algorithm approach.

> So lets move on, there is no argument here.

Indeed, there is no argument. But, if you say something like:

"I can add the _existing_ entity->stats lock around it just as well for tho=
se
warm and fuzzy feelings."

it may be read by people as if you don't agree that for correctness either =
a
lock or an atomic is required. So, people might keep arguing regardless. :)
