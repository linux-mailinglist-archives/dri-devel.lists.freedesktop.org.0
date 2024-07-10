Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC70392D3EC
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2024 16:13:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA52B10E7EA;
	Wed, 10 Jul 2024 14:13:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.b="TzWt5nXr";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="wQXY9DNN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04C8C10E7EC;
 Wed, 10 Jul 2024 14:13:55 +0000 (UTC)
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1720620833;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LYrO5OQB3VkboQ/sNL+F3D+E/WBT/7aRRUdt36KX6Ew=;
 b=TzWt5nXrBpDWNxyHN/jI2S+nIoIpyTiDtbma0J3o+9Zb+lHqzZnRW/2uMBemZMnmtAgTLi
 zBl9CImPvIGEspb/4yOvQsGsKQhHjgknJL3TENtQsToxX5Nx7AHQIFGqRXPc95NTki7xEq
 DRoNbgp4zVzkh0ZaLm2JMnsWblZE+3Xyi6VfIwQw+wjmjtjWoGRj9GrR0m9+Y+CjZ3ZwSV
 XCZVmveLNjdXsR+JcHiTbWeWDLg6Oq6t+RC3SRwlwTL19sE9vK+kshCzDyf4oktGxHK5Ol
 4Gn1r4YV+prjTDOYs66YNYRneQtmp4tW2vCFqNyx6WQKMqaZ9Jp2PbQ8WFQs1w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1720620833;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LYrO5OQB3VkboQ/sNL+F3D+E/WBT/7aRRUdt36KX6Ew=;
 b=wQXY9DNN22mwdUOMTtS6evo6EdB2eirpaCjBZFieN7kIKoktDdx0IDqXmPGD6FBl11+t18
 EPixYszvrf055vDA==
To: Daniel Vetter <daniel.vetter@ffwll.ch>, DRI Development
 <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>, Daniel
 Vetter <daniel.vetter@ffwll.ch>,
 syzbot+6cebc1af246fe020a2f0@syzkaller.appspotmail.com, Daniel Vetter
 <daniel.vetter@intel.com>, stable@vger.kernel.org, Kent Overstreet
 <kent.overstreet@linux.dev>, Brian Foster <bfoster@redhat.com>,
 linux-bcachefs@vger.kernel.org, Petr Mladek <pmladek@suse.com>, Steven
 Rostedt <rostedt@goodmis.org>, Sergey Senozhatsky
 <senozhatsky@chromium.org>
Subject: Re: [PATCH] bcachefs: no console_lock in bch2_print_string_as_lines
In-Reply-To: <20240710130335.765885-1-daniel.vetter@ffwll.ch>
References: <20240710093120.732208-2-daniel.vetter@ffwll.ch>
 <20240710130335.765885-1-daniel.vetter@ffwll.ch>
Date: Wed, 10 Jul 2024 16:19:53 +0206
Message-ID: <87jzhtcp26.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
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

On 2024-07-10, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> console_lock is the outermost subsystem lock for a lot of subsystems,
> which means get/put_user must nest within. Which means it cannot be
> acquired somewhere deeply nested in other locks, and most definitely
> not while holding fs locks potentially needed to resolve faults.
>
> console_trylock is the best we can do here. But John pointed out on a
> previous version that this is futile:
>
> "Using the console lock here at all is wrong. The console lock does not
> prevent other CPUs from calling printk() and inserting lines in between.
>
> "There is no way to guarantee a contiguous ringbuffer block using
> multiple printk() calls.
>
> "The console_lock usage should be removed."
>
> https://lore.kernel.org/lkml/87frsh33xp.fsf@jogness.linutronix.de/
>
> Do that.

Note that there is more of this incorrect usage of console lock in:

fs/bcachefs/debug.c:bch2_btree_verify_replica()

fs/bcachefs/bset.c:bch2_dump_btree_node()

from commit 1c6fdbd8f246("bcachefs: Initial commit")

... and its parent bcache:

drivers/md/bcache/debug.c:bch_btree_verify()

drivers/md/bcache/bset.c:bch_dump_bucket()

from commit cafe56359144("bcache: A block layer cache")

These should also be removed. Although Kent should verify that the
console lock is not providing some sort of necessary side-effect
synchronization.

John Ogness
