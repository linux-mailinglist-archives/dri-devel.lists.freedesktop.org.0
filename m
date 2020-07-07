Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD0B621777C
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jul 2020 21:05:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E0C66E084;
	Tue,  7 Jul 2020 19:05:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0110A6E084
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jul 2020 19:05:12 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 207383] [Regression] 5.7 amdgpu/polaris11 gpf:
 amdgpu_atomic_commit_tail
Date: Tue, 07 Jul 2020 19:05:12 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: 1i5t5.duncan@cox.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-207383-2300-caIjmOHaRy@https.bugzilla.kernel.org/>
In-Reply-To: <bug-207383-2300@https.bugzilla.kernel.org/>
References: <bug-207383-2300@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

https://bugzilla.kernel.org/show_bug.cgi?id=207383

--- Comment #47 from Duncan (1i5t5.duncan@cox.net) ---
(In reply to Duncan from comment #39)
> 28 candidates ATM, several of which are OCFS2 or spelling
> fixes neither of which should affect this bug.  Excluding those there are
> eleven left; the penultimate (next to last) one looks to be a good candidate:
> 
> 5f2d5026b mm/Makefile: disable KCSAN for kmemleak
> b0d14fc43 mm/kmemleak.c: use address-of operator on section symbols
> 667c79016 revert "topology: add support for node_to_mem_node() to determine
> the fallback node"
> 3202fa62f slub: relocate freelist pointer to middle of object
> 1ad53d9fa slub: improve bit diffusion for freelist ptr obfuscation
> bbd4e305e mm/slub.c: replace kmem_cache->cpu_partial with wrapped APIs
> 4c7ba22e4 mm/slub.c: replace cpu_slab->partial with wrapped APIs
> c537338c0 fs_parse: remove pr_notice() about each validation
> 630f289b7 asm-generic: make more kernel-space headers mandatory
> 98c985d7d kthread: mark timer used by delayed kthread works as IRQ safe
> 4054ab64e tools/accounting/getdelays.c: fix netlink attribute length

(... and comment #44)
> [I]dea to just try patch-reverting them on top of
> 5.7 or current 5.8-rc, thus eliminating the apparently unrelated
> kernel-panics I''ve twice triggered at the current bisect step.

[Again noting that on my polaris11 the bug doesn't seem to be fixed, despite
comment #45 saying it is on his navi10 with a patch/commit that I can see in
5.8-rc4+.]

So I tried this with the 11 above commits against 5.8.0-rc4-00025-gbfe91da29,
which previously tested as triggering the freeze for me.  Of the 11, nine
clean-reversed and I simply noted and skipped the other two (3202fa62f and
630f289b7) for the moment.  The patched kernel successfully built and I'm
booted to it now.  I just completed a system update (on gentoo so built from
source), which doesn't always trigger the freeze, but seems to do so with a
reasonable number of package updates on kernels with this bug perhaps 50% of
the time.  No freeze.

I'll now try some 4k youtube in firefox, the other stressor that sometimes
seems to trigger it here, and perhaps combine that with an unnecessary rebuild
(since my system's already current) of something big like qtwebengine.  If that
doesn't trigger a freeze I'll stay booted to this thing another few days and
try some more, before being confident enough to declare that one of those nine
commits triggers the bug on my hardware and reverting them eliminates it.

Assuming it is one of those 9 commits (down from 28, as I quoted above, at my
last completed auto-bisect step) I'll reset and try manually bisecting on the
9.  It's looking good so far, but other kernels have looked good at this stage
and then ultimately frozen with the telltale gpf log, so it remains to be seen.

Meanwhile, nice to be on a current development kernel and well past rc1 stage,
again. =:^)  Bisect-testing otherwise long-stale pre-rc1 kernels with other
kernel-crasher bugs to complicate things is *not* my definition of fun!

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
