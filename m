Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9090BAC84FD
	for <lists+dri-devel@lfdr.de>; Fri, 30 May 2025 01:24:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB46F10E7A3;
	Thu, 29 May 2025 23:24:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SxkNzBST";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82DE010E78F;
 Thu, 29 May 2025 23:24:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D0743614BA;
 Thu, 29 May 2025 23:24:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9174AC4CEE7;
 Thu, 29 May 2025 23:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748561089;
 bh=XHek1or6lgqhUolGMvuGeooaTqEUU9Li8TYgY+vSfcA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=SxkNzBSTwpjci3VuBTnBCeXjQwbDMmYbh7D5ztdNlSAzhtQM4Kw4VnEEmyPOOJ7dS
 ml5P97uFliPzrLABarBwXqgRmHigFFTADXFoBhI1l7kml3JmsHM0gGXJ2EdenZyJ6e
 iUV3fy1cITtu/iVSmXAx6tRmvYLob7yMdCStGtNu/bio1iVq1cJaUGSbJhmQTDLiIr
 RdLjPH8cyaGS8OWCryRsuVGJAvcUYYw9qtebVaduOyQ1L3bU5uSE2ld37SpcSGizrN
 dkS27CXxvs24AIkJYhm0KdyQp21oJEaUnhetrjJs2wZT0XtzxQhyi0+tBlTyBmpTSW
 scCU6sL2oFOPA==
Date: Thu, 29 May 2025 16:24:47 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Jeff Layton <jlayton@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, Kuniyuki
 Iwashima <kuniyu@amazon.com>, Qasim Ijaz <qasdev00@gmail.com>, Nathan
 Chancellor <nathan@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, Thomas
 =?UTF-8?B?V2Vpw59zY2h1aA==?= <thomas.weissschuh@linutronix.de>
Subject: Re: [PATCH v12 00/10] ref_tracker: add ability to register a
 debugfs file for a ref_tracker_dir
Message-ID: <20250529162447.30c4ca85@kernel.org>
In-Reply-To: <20250529-reftrack-dbgfs-v12-0-11b93c0c0b6e@kernel.org>
References: <20250529-reftrack-dbgfs-v12-0-11b93c0c0b6e@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Thu, 29 May 2025 11:20:36 -0400 Jeff Layton wrote:
> Sorry for the reposting, but this makes things easier with automated CI.
> 
> This posting just drops the pr_warn() calls from the new functions. We
> were still seeing some warnings during (expected) times that debugfs
> file creation would fail. debugfs already throws warnings when these
> things fail unexpectedly, so these warnings are unwanted when dentry
> creation fails before debugfs is up.

Hm, so FWIW we hit a lockdep issue now
raw:
 https://netdev-3.bots.linux.dev/vmksft-tcp-ao-dbg/results/142540/4-connect-deny-ipv6/stderr
decoded:
https://netdev-3.bots.linux.dev/vmksft-tcp-ao-dbg/results/142540/vm-crash-thr0-10

I suspect this may just be "merge window fun", since we forwarded our
trees to Linus's since your v11?

[   14.281410][    C0] inconsistent {SOFTIRQ-ON-W} -> {IN-SOFTIRQ-W} usage.
[   14.281692][    C0] swapper/0/0 [HC0[0]:SC1[1]:HE1:SE0] takes:
[   14.281974][    C0] ffffffff9e1c5af8 (pin_fs_lock){+.?.}-{3:3}, at: simple_pin_fs+0x24/0x150
[   14.282373][    C0] {SOFTIRQ-ON-W} state was registered at:
[   14.282614][    C0]   __lock_acquire+0x20b/0x7e0
[   14.282849][    C0]   lock_acquire.part.0+0xb6/0x240
[   14.283072][    C0]   _raw_spin_lock+0x33/0x40
[   14.283298][    C0]   simple_pin_fs+0x24/0x150
[   14.283524][    C0]   start_creating.part.0+0x52/0x310
[   14.283752][    C0]   debugfs_create_dir+0x6a/0x540
[   14.283977][    C0]   component_debug_init+0x17/0x30
[   14.284206][    C0]   do_one_initcall+0x8f/0x1e0
[   14.284451][    C0]   do_initcalls+0x176/0x280
[   14.284679][    C0]   kernel_init_freeable+0x22d/0x300
[   14.284907][    C0]   kernel_init+0x20/0x200
[   14.285131][    C0]   ret_from_fork+0x240/0x320
[   14.285359][    C0]   ret_from_fork_asm+0x1a/0x30
[   14.285580][    C0] irq event stamp: 410868
[   14.285750][    C0] hardirqs last  enabled at (410868): [<ffffffff9cfc332d>] _raw_spin_unlock_irqrestore+0x5d/0x80
[   14.286200][    C0] hardirqs last disabled at (410867): [<ffffffff9cfc300b>] _raw_spin_lock_irqsave+0x5b/0x60
[   14.286653][    C0] softirqs last  enabled at (409604): [<ffffffff9a6877a8>] handle_softirqs+0x358/0x620
[   14.287061][    C0] softirqs last disabled at (409635): [<ffffffff9a687bfa>] __irq_exit_rcu+0xfa/0x160
