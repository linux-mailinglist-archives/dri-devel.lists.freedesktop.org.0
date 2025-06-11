Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E6BAD5850
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jun 2025 16:15:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 315AD10E68D;
	Wed, 11 Jun 2025 14:15:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="o8DzUkCV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C948410E68A;
 Wed, 11 Jun 2025 14:15:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2B2F85C3E56;
 Wed, 11 Jun 2025 14:13:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD517C4CEE3;
 Wed, 11 Jun 2025 14:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749651326;
 bh=jGzXWB7Z6lzbV8KChEUJK6VRbCA9SZ8qZoS2gYqKiaA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=o8DzUkCV/ZoZNi8iSePEs+4VAAp7r4P4oOJk1UEfOiykLfTnYn6yOBuEECTEtANsP
 kb7AUIrZbC0nACt7vLuInaOtQt6TpGLGjytu+w2h4UtAqDTWI3NqqjO+bPR6p0c6ND
 9F/cTKnK2/Q/JGzlRG3CrTKCan34ABVz/g+YHNVU2ceBewCUIR52HOxNWofpLRXgw3
 VdExIH0pucJrFOnR0g9CuC6WK8hvUz12k+2NC+M5tbXbiqG4aI1v5/3n0MI6bmfTJT
 a5a1QqYq9iyihxOkZPtewTumep1qPq5M5VNsUtIpb/fauI4tiO9Q85M1eEV+NMne0G
 MpLBkAxPNSqdQ==
Date: Wed, 11 Jun 2025 07:15:24 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Jeff Layton <jlayton@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, Krzysztof
 Karas <krzysztof.karas@intel.com>, Kuniyuki Iwashima <kuniyu@amazon.com>,
 Qasim Ijaz <qasdev00@gmail.com>, Nathan Chancellor <nathan@kernel.org>,
 Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, Thomas =?UTF-8?B?V2Vpw59zY2h1aA==?=
 <thomas.weissschuh@linutronix.de>
Subject: Re: [PATCH v14 0/9] ref_tracker: add ability to register a debugfs
 file for a ref_tracker_dir
Message-ID: <20250611071524.45610986@kernel.org>
In-Reply-To: <20250610-reftrack-dbgfs-v14-0-efb532861428@kernel.org>
References: <20250610-reftrack-dbgfs-v14-0-efb532861428@kernel.org>
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

On Tue, 10 Jun 2025 10:59:20 -0400 Jeff Layton wrote:
> For those just joining in, this series adds a new top-level
> "ref_tracker" debugfs directory, and has each ref_tracker_dir register a
> file in there as part of its initialization. It also adds the ability to
> register a symlink with a more human-usable name that points to the
> file, and does some general cleanup of how the ref_tracker object names
> are handled.

Still has the lockdep problem. Please triple check that it's fixed
before you post next version, the number of warnings this series
generates is quite burdensome for our CI.

[  440.139336][    C1] ================================
[  440.139684][    C1] WARNING: inconsistent lock state
[  440.140019][    C1] 6.15.0-virtme #1 Not tainted
[  440.140360][    C1] --------------------------------
[  440.140705][    C1] inconsistent {SOFTIRQ-ON-W} -> {IN-SOFTIRQ-W} usage.
[  440.141124][    C1] ksoftirqd/1/22 [HC0[0]:SC1[1]:HE1:SE0] takes:
[  440.141541][    C1] ffffffffad243218 (&xa->xa_lock#8){+.?.}-{3:3}, at: xa_set_mark+0x73/0x120
[  440.142146][    C1] {SOFTIRQ-ON-W} state was registered at:
[  440.142485][    C1]   __lock_acquire+0x20b/0x7e0
[  440.142832][    C1]   lock_acquire.part.0+0xb6/0x240
[  440.143181][    C1]   _raw_spin_lock+0x33/0x40
[  440.143521][    C1]   xa_store+0x1c/0x50
[  440.143784][    C1]   ref_tracker_dir_debugfs+0x168/0x1b0
[  440.144137][    C1]   init_net_debugfs+0x15/0x70
[  440.144480][    C1]   do_one_initcall+0x8c/0x1e0
[  440.144845][    C1]   do_initcalls+0x176/0x280
[  440.145184][    C1]   kernel_init_freeable+0x22d/0x300
[  440.145530][    C1]   kernel_init+0x20/0x200
[  440.145871][    C1]   ret_from_fork+0x240/0x320
[  440.146205][    C1]   ret_from_fork_asm+0x1a/0x30
[  440.146545][    C1] irq event stamp: 5141102
[  440.146886][    C1] hardirqs last  enabled at (5141102): [<ffffffffa96fa4ed>] _raw_spin_unlock_irqrestore+0x5d/0x80
[  440.147613][    C1] hardirqs last disabled at (5141101): [<ffffffffa96fa1cb>] _raw_spin_lock_irqsave+0x5b/0x60
[  440.148283][    C1] softirqs last  enabled at (5139838): [<ffffffffa6c8ef18>] handle_softirqs+0x358/0x620
[  440.148883][    C1] softirqs last disabled at (5139843): [<ffffffffa6c8f41f>] run_ksoftirqd+0x3f/0x70

https://netdev-3.bots.linux.dev/vmksft-mptcp-dbg/results/160722/1-mptcp-join-sh/stderr
https://netdev-3.bots.linux.dev/vmksft-mptcp-dbg/results/160722/vm-crash-thr0-0
-- 
pw-bot: cr
