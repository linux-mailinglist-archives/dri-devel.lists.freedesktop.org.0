Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0331203E38
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jun 2020 19:45:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D2976E86A;
	Mon, 22 Jun 2020 17:45:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D13F6E86A
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jun 2020 17:45:00 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 207383] [Regression] 5.7 amdgpu/polaris11 gpf:
 amdgpu_atomic_commit_tail
Date: Mon, 22 Jun 2020 17:44:59 +0000
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
Message-ID: <bug-207383-2300-pkmF3I6391@https.bugzilla.kernel.org/>
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

--- Comment #17 from Duncan (1i5t5.duncan@cox.net) ---
(In reply to rtmasura+kernel from comment #16)
> Reporting I've had the same issue with kernel 5.7.2 and 5.7.4:

Thanks!

> Jun 22 07:10:24 abiggun kernel: Hardware name: System manufacturer System
> Product Name/Crosshair IV Formula, BIOS 1102    08/24/2010

So socket AM3 from 2010, slightly older than my AM3+ from 2012.  Both are
PCIe-2.0.

What's your CPU and GPU?

As above my GPU is Polaris11 (AMD Radeon RX 460, arctic-islands/gcn4 series,
pcie-3),  AMD fx6100 CPU.

Guessing the bug is gpu-series code specific or there'd be more people howling,
so what you're running for gpu is significant.  It's /possible/ it may be
specific to people running pcie mismatch, as well (note my pcie-3 gpu card on a
pcie-2 mobo).

> Jun 22 07:10:24 abiggun kernel: Workqueue: events_unbound commit_work
> [drm_kms_helper]
> 0010:amdgpu_dm_atomic_commit_tail+0x2aa/0x2310 [amdgpu]

That's the bit of the dump I understand, similar to mine...

If you can find a quicker/more-reliable way to trigger the crash, it'd sure be
helpful for bisecting.  Also, if you're running a bad kernel enough to tell
(not just back to 5.6 after finding 5.7 bad), does it reliably dump-log before
the reboot for you?  I'm back to a veerrry--sloowww second bisect attempt, with
for instance my current kernel having crashed three times now so it's obviously
bugged, but nothing dumped in the log on the way down yet so I can't guarantee
it's the _same_ bug (the bisect is in pre-rc1 code so chances of a different
bug are definitely non-zero), and given the bad results on the first bisect I'm
trying to confirm each bisect-bad with a log-dump and each bisect-good with at
least 3-4 days no crash.  But this one's in between right now, frequent
crashing but no log-dump to confirm it's the same bug.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
