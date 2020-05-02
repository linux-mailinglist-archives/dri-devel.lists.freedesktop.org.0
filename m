Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 483AD1C26B7
	for <lists+dri-devel@lfdr.de>; Sat,  2 May 2020 18:03:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81E456E156;
	Sat,  2 May 2020 16:03:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C23196E156
 for <dri-devel@lists.freedesktop.org>; Sat,  2 May 2020 16:03:21 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 207383] [Regression] 5.7-rc: amdgpu/polaris11 gpf:
 amdgpu_atomic_commit_tail
Date: Sat, 02 May 2020 16:03:21 +0000
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
Message-ID: <bug-207383-2300-XykKuXDFUf@https.bugzilla.kernel.org/>
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

--- Comment #9 from Duncan (1i5t5.duncan@cox.net) ---
I'm not there yet but it's starting to look like a possibly dud bisect:
everything showing good so far.  Maybe I didn't wait long enough for the bug to
trigger at some step and I'm running up the wrong side of the tree, or maybe
it's not drm after all (I thought I'd try something new and limit the paths to
drivers/gpu/drm/ and include/drm/, but that may have been a critical mistake). 
Right now there's only 3-4 even remotely reasonable candidates (out of 14 left
to test... the rest being mediatek or similar):

4064b9827
Peter Xu
mm: allow VM_FAULT_RETRY for multiple times

6bfef2f91
Jason Gunthorpe
mm/hmm: remove HMM_FAULT_SNAPSHOT

17ffdc482
Christoph Hellwig
mm: simplify device private page handling in hmm_range_fault

And maybe (but I'm neither EFI nor 32-bit)

72e0ef0e5
Mikel Rychliski
PCI: Use ioremap(), not phys_to_virt() for platform ROM


Meanwhile, user-side I've gotten vulkan/mesa/etc updates recently.  I'm
considering checking out linus-master/HEAD again, doing a pull, and seeing if
by chance either the last week's kernel updates or the user-side updates have
eliminated the problem.  If not I can come back and finish the bisect (or try
just reverting those four on current linus-master/HEAD), before starting a new
clean bisect if necessary.  Just saved the bisect log and current pointer.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
