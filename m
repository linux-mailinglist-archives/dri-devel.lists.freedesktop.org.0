Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0D120C76F
	for <lists+dri-devel@lfdr.de>; Sun, 28 Jun 2020 12:48:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C12776E0E1;
	Sun, 28 Jun 2020 10:48:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D96E6E0E1
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jun 2020 10:48:16 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 207383] [Regression] 5.7 amdgpu/polaris11 gpf:
 amdgpu_atomic_commit_tail
Date: Sun, 28 Jun 2020 10:48:15 +0000
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
X-Bugzilla-Changed-Fields: cf_kernel_version
Message-ID: <bug-207383-2300-cKeiG0LUSd@https.bugzilla.kernel.org/>
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
     Kernel Version|5.7-rc1, 5.7-rc2, 5.7-rc3   |5.7-rc1 - 5.7 - 5.8-rc1+

--- Comment #31 from Duncan (1i5t5.duncan@cox.net) ---
(In reply to mnrzk from comment #30)
> In some conditions, when amdgpu_dm_atomic_commit_tail calls
> dm_atomic_get_new_state, dm_atomic_get_new_state returns a struct
> dm_atomic_state* with an garbage context pointer.

Good! Someone with the bug who can actually read and work the code, now.
Portends well for a fix.  =:^)

> I've also found that this bug exclusively occurs when commit_work is on the
> workqueue. After forcing drm_atomic_helper_commit to run all of the commits
> without adding to the workqueue and running the OS, the issue seems to have
> disappeared.

I see it always with the workqueue too, but not being a dev I simply assumed
that was how it was; I had no idea it could be taken off the workqueue.

> The system was stable for at least 1.5 hours before I manually
> shut it down (meanwhile it has usually crashed within 30-45 minutes).

You're seeing a crash much faster than I am.  I believe my longest uptime
before a crash with the telltale trace was something like two and a half days,
with the obvious implications for bisect good since it's always a gamble that
I've simply not tested long enough.

> Perhaps there's some sort of race condition occurring after commit_work is
> queued?

Agreed, FWIW, tho you've taken it farther than I could, not being able to work
with code much beyond bisect or modifying an existing patch here or there.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
