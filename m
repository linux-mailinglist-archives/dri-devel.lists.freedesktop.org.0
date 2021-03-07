Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 643673302B7
	for <lists+dri-devel@lfdr.de>; Sun,  7 Mar 2021 16:43:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E7F76E135;
	Sun,  7 Mar 2021 15:43:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 008CC6E135
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Mar 2021 15:43:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 005A2650F7
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Mar 2021 15:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615131785;
 bh=EF68KiGiMjIkkodGvCgyfLh99srHQIB9u+cZJWVaSqw=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=eGwMhW4oxG88f3hWZG6G7ESx+s+8hTeXIdySxEO02TA1ZokVBWMqPWKFE/238VFJC
 hRZll+TAHdUaE2JRi6/0yJTJ/q9U4MWfTEPBEiwLE5AQ8F6QcuRkWOMkg9qdcWinhf
 /NBxQnrW09Kw9+jj96K6ru1TUyTLg7ymdmHTm7/aP2ZF8FXE6aY8/0Z8/fgoEZ6SFK
 xVxiT1wmHHgRmD4tt9ioeoJ1nswK33cJcIa/6TvmBFaYdHxaNTkV5xaIvt6sdQrHj9
 gdwv+Ke+vI4f7ZptvpEMXQtDR3468n78B3FlNtpCj9EQb5TOWDGY3YFYrHN0njr5Ie
 XAseC2sCwSIIA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id EBB8E65350; Sun,  7 Mar 2021 15:43:04 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211277] sometimes crash at s2ram-wake (Ryzen 3500U): amdgpu,
 drm, commit_tail, amdgpu_dm_atomic_commit_tail
Date: Sun, 07 Mar 2021 15:43:04 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kolAflash@kolahilft.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-211277-2300-iZxzA7XE65@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211277-2300@https.bugzilla.kernel.org/>
References: <bug-211277-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=211277

--- Comment #14 from kolAflash (kolAflash@kolahilft.de) ---
(In reply to Jerome C from comment #13)

I don't get how you got to your results.
There's no straight path from 5.10.4 to 5.11-rc5, as they are on different
branches (5.10.y and master).

Nevertheless, your result may be reasonable from the point of the git history.
I'm not sure about the commit ID a10aad137, but it has an completly identical
twin commit c6d2b0fbb (also removing AMD_PG_SUPPORT_VCN_DPG from that
expression).
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=c6d2b0fbb893d5c7dda405aa0e7bcbecf1c75f98
And c6d2b0fbb has been applied between v5.10-rc2 and v5.10-rc3 (a10aad137 is
only in master).

So if c6d2b0fbb (a.k.a a10aad137) is responsible, this explains why I started
recognizing the problem when Debian-Testing went from Linux-5.9 to Linux-5.10.

I'm now running a 5.10.21 kernel where I reverted c6d2b0fbb. And I'll try using
this kernel for at least one week and also run some iterative tests with it. 



Regarding reproduction in general:

I really wonder what triggers this bug. I didn't went so far to test with more
than 50 tests (sleep-wake iterations). Especially I didn't tried more than 50 
because the bug definitely appeared more often if it happened under "natural"
(non-testing) circumstances.

Some test series I did which are hard to make sense of statistically:
I tried 20 tests and nothing happened. A few minutes later I decided to try 50
more tests and it directly failed on the first one. So I had to reboot, tried
again 50 tests and nothing happened. Afterwards I put my notebook into s2ram
and when I woke it the next day it immediately crashed.



By the way the two times it crashed recently (see above) happened with a kernel
I compiled from clean kernel.org sources. Also I never experienced the bug with
a clean 5.8.18 compiled from kernel.org running with the same system for about
a week. So I'm quite convinced it's nothing Debian specific.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
