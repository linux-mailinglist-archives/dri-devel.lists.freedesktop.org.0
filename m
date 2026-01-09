Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E13C2D0A94A
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 15:16:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2196C10E8CB;
	Fri,  9 Jan 2026 14:16:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qLn6WPKi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79DFC10E215;
 Fri,  9 Jan 2026 14:16:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0BAD460122;
 Fri,  9 Jan 2026 14:08:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BE99C4CEF1;
 Fri,  9 Jan 2026 14:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767967717;
 bh=FbDaIgf9uiibuLEFDL1NuGXH3mmcCmmU2KQXhcbsUXk=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=qLn6WPKialDqTeJP47KXFA6YvV4hPoXwGWI8//Sa79Mm+xmGngWLn1jJKPXk1bo3k
 8v+e38AKTLqc9Sp1SyTz0IYcx5llpHtGyzvJXPUeaBHptKmYozqvvpk0MHiGqPuRxu
 SW2z3/rQ1WYmxyEX6g2gWtwjid3G8voHBR0IkEZUJQ18xpAxi22FqwU7ZosJrzmc4B
 lr1esOOiybGGgP6C5nBnFaqJwNKjRViV+Je0ulE2iuqYC7aLl+PxRa8Stuz67nUcxC
 nXhuRmSm2QOkkEd0K2BpJZYYP3SnQG3CQ/Bf4TxorpT9ct8G43nadJq78WksUK8crV
 OPanJXB7ML68A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 09 Jan 2026 15:08:34 +0100
Message-Id: <DFK48ZLPVZQ6.2O7N786H12TUY@kernel.org>
Subject: Re: [PATCH] drm/sched: Simplify idle entity check
Cc: <dri-devel@lists.freedesktop.org>, <kernel-dev@igalia.com>,
 <intel-xe@lists.freedesktop.org>, =?utf-8?q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, "Matthew Brost" <matthew.brost@intel.com>,
 "Philipp Stanner" <phasta@kernel.org>
To: "Tvrtko Ursulin" <tvrtko.ursulin@igalia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260107134405.96603-1-tvrtko.ursulin@igalia.com>
 <DFIEZJJK8GUD.1XW0UQSIUCH2N@kernel.org>
In-Reply-To: <DFIEZJJK8GUD.1XW0UQSIUCH2N@kernel.org>
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

On Wed Jan 7, 2026 at 3:08 PM CET, Danilo Krummrich wrote:
> If we want lockless access to entity->stopped it should be atomic_read(),
> atomic_read_acquire(), etc.

Actually, since stopped is just a boolean and treated as flag, it might be =
fine
as is, but it then also needs WRITE_ONCE() everywhere else.
