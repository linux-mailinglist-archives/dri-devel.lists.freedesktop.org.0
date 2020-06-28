Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE5C20C8B5
	for <lists+dri-devel@lfdr.de>; Sun, 28 Jun 2020 17:30:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB9336E06D;
	Sun, 28 Jun 2020 15:30:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 741E56E06D
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jun 2020 15:30:49 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 207383] [Regression] 5.7 amdgpu/polaris11 gpf:
 amdgpu_atomic_commit_tail
Date: Sun, 28 Jun 2020 15:30:47 +0000
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-207383-2300-BVVOVqQxQx@https.bugzilla.kernel.org/>
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

--- Comment #32 from Duncan (1i5t5.duncan@cox.net) ---
Created attachment 289911
  --> https://bugzilla.kernel.org/attachment.cgi?id=289911&action=edit
Partial git bisect log

(In reply to zzyxpaw from comment #29)
> @Duncan I'm not sure if you want to muddle your
> bisect results with a different system configuration, but I'm happy to help
> test commits if that would be helpful.

Here's my current git bisect log you can replay.

I believe that should leave you at v5.6-rc2-245-gcf6c26ec7, which I'm going to
build and boot to as soon as I post this.

But if your system's as good at triggering the bug as you suggest, try deleting
that last good before the replay as I'm only ~98% sure about it given a
potential trigger-time of days on my system.  That should leave you at
7be97138e which you can try triggering it with.  If your system's reliably
triggering within minutes and it doesn't trigger on that, you can confirm my
bisect good and go from there.

Note that if you're building with gcc-10.x you'll likely need a couple patches
that were committed later in the 5.7 cycle, depending on if if they were
applied before or after whatever you're testing.  If you're building with
gcc-9.3 (and presumably earlier) they shouldn't be necessary.

a9a3ed1ef and e78d334a5 are the commits in question.  One was necessary to
build with gcc-10, the other to get past a boot-time crash when built with
gcc-10.  Only one's applying at cf6c26ec7, I don't remember which, but they
were both necessary for 7be97138e.

At my somewhat limited git skill level it was easiest to redirect a git show of
the commit to a patchfile, then apply the patch on top of whatever git bisect
gave me and git reset --hard to clean up the patches before the next git bisect
good/bad.  I guess a git cherry-pick would be the usual way to apply them but
I'm not entirely sure how that interacts with git bisect, so applying the
patches on top was easier way for me, particularly given that I already have
scripts to automate patch application for my local default-to-noatime patch.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
