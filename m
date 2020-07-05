Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D05A1215000
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jul 2020 00:08:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 206D689ED6;
	Sun,  5 Jul 2020 22:08:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 221D389ED6
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Jul 2020 22:08:38 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 207383] [Regression] 5.7 amdgpu/polaris11 gpf:
 amdgpu_atomic_commit_tail
Date: Sun, 05 Jul 2020 22:08:37 +0000
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
X-Bugzilla-Changed-Fields: attachments.isobsolete attachments.created
Message-ID: <bug-207383-2300-Hc3DFLUqYA@https.bugzilla.kernel.org/>
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

Duncan (1i5t5.duncan@cox.net) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #290101|0                           |1
        is obsolete|                            |

--- Comment #39 from Duncan (1i5t5.duncan@cox.net) ---
Created attachment 290105
  --> https://bugzilla.kernel.org/attachment.cgi?id=290105&action=edit
Partial git bisect log update #3

(In reply to Duncan from comment #38)
> With luck I'll get a couple more bad ones
> right away and narrow it down quickly.

And so it is.  28 candidates ATM, several of which are OCFS2 or spelling fixes
neither of which should affect this bug.  Excluding those there are eleven
left; the penultimate (next to last) one looks to be a good candidate:

5f2d5026b mm/Makefile: disable KCSAN for kmemleak
b0d14fc43 mm/kmemleak.c: use address-of operator on section symbols
667c79016 revert "topology: add support for node_to_mem_node() to determine the
fallback node"
3202fa62f slub: relocate freelist pointer to middle of object
1ad53d9fa slub: improve bit diffusion for freelist ptr obfuscation
bbd4e305e mm/slub.c: replace kmem_cache->cpu_partial with wrapped APIs
4c7ba22e4 mm/slub.c: replace cpu_slab->partial with wrapped APIs
c537338c0 fs_parse: remove pr_notice() about each validation
630f289b7 asm-generic: make more kernel-space headers mandatory
98c985d7d kthread: mark timer used by delayed kthread works as IRQ safe
4054ab64e tools/accounting/getdelays.c: fix netlink attribute length

My gut says it's 98c "kthread: mark ... delayed kthread... IRQ safe".  Not a
coder but the comment talks about delayed kthreads, we always see the workqueue
in the traces, and mnrzk observes in comment #30 that forcing
drm_atomic_helper_commit to run directly instead of using the workqueue seems
to eliminate the freeze.  If it's called from the amdgpu code and that commit
changes the IRQ-safety assumptions the amdgpu code was depending on in the
workqueue, where the unqueued context is automatically IRQ-safe...

Still could be wrong, but at 11 real candidates it's a 9% chance even simply
statistically, and it sure seems to fit.  Anyway, if it /is/ correct, the next
few bisect steps should be bisect bad and thus go faster, narrowing it down
even further.

Regardless, we're down far enough that someone that can actually read code
might be able to take a look at that and the others now, so my bisect shouldn't
be the /entire/ bottleneck any longer.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
