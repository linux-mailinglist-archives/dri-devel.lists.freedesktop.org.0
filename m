Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4177A398BA
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 11:26:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60A6910E666;
	Tue, 18 Feb 2025 10:26:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="f8lrmkG8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1C4D10E666;
 Tue, 18 Feb 2025 10:26:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 25DFCA41B0C;
 Tue, 18 Feb 2025 10:24:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB00DC4CEE2;
 Tue, 18 Feb 2025 10:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739874365;
 bh=JV3Jjgs2g98a9pyFx/aQlL5hzStoNO6JYJtzz5JcTmo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=f8lrmkG86ZMXNRL66jiYnjf2vCvfSoIkuBcmywXPGYoRahN6L2RJWaa+1wtp4mrSz
 iWEtBIggtxjIT7ZKSahBnLc4m7CDwA//2oPUlSqpsBc1c9zDZGe35894jrmm82t37E
 qOgKwWGebn7GIxWqIxaXoCz9GJF2JmSxoXG+qowBiWw/pfpMIm0HTwP0efe9jw3fQ5
 J2PoA5MYsi0Qgn6q9ambR/40p1hnZIwahDweefxG2tm+xs7FJnsSbh0XObGQfZZeF8
 oMjQB5d2UR37Fdg7mj7vDfGvJZFJtOIOtv7fq5IexDvWLCejBFcg6sJYFx9/wMYHfo
 xXbNkq/8m6IRg==
Date: Tue, 18 Feb 2025 11:26:01 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Dave Airlie <airlied@gmail.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [RFC PATCH 0/3] gpu: nova-core: add basic timer subdevice
 implementation
Message-ID: <Z7RgOd_57wcSUyB0@pollux>
References: <20250217-nova_timer-v1-0-78c5ace2d987@nvidia.com>
 <Z7OrKX3zzjrzZdyz@pollux>
 <CAPM=9tyu84z4Xk5X0fykO3Dazby2UqRgwtN4woNKe4Z2yMyDZg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPM=9tyu84z4Xk5X0fykO3Dazby2UqRgwtN4woNKe4Z2yMyDZg@mail.gmail.com>
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

On Tue, Feb 18, 2025 at 11:46:26AM +1000, Dave Airlie wrote:
> > 1. How to avoid unnecessary calls to try_access().
> >
> > This is why I made Boot0.read() take a &RevocableGuard<'_, Bar0> as argument. I
> > think we can just call try_access() once and then propage the guard through the
> > callchain, where necessary.
> 
> Nope, you can't do that, RevocableGuard holds a lock and things
> explode badly in lockdep if you do.

Yes, try_access() marks the begin of an RCU read side critical section. Hence,
sections holding the guard should be kept as short as possible.

What I meant is that for a series of I/O operations we can still pass the guard
to subsequent functions doing the actual I/O ops.

More generally, I also thought about whether we should also provide an SRCU
variant of Revocable and hence Devres. Maybe we even want to replace it with
SRCU entirely to ensure that drivers can't stall the RCU grace period for too
long by accident.
