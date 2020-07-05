Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F36214E10
	for <lists+dri-devel@lfdr.de>; Sun,  5 Jul 2020 18:58:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6819D6E426;
	Sun,  5 Jul 2020 16:58:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B423C6EC06
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Jul 2020 16:58:51 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 207383] [Regression] 5.7 amdgpu/polaris11 gpf:
 amdgpu_atomic_commit_tail
Date: Sun, 05 Jul 2020 16:58:49 +0000
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
Message-ID: <bug-207383-2300-gKioesMKd9@https.bugzilla.kernel.org/>
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
 Attachment #290093|0                           |1
        is obsolete|                            |

--- Comment #38 from Duncan (1i5t5.duncan@cox.net) ---
Created attachment 290101
  --> https://bugzilla.kernel.org/attachment.cgi?id=290101&action=edit
Another partial git bisect log update

Just as I was thinking that step was going to be bisect good... it wasn't. 
Confirmed with the usual tail-commit log trace.

(In reply to Duncan from comment #36)
> 6cad420cc akpm (the majority).  Very likely in this tree.

Definitely this tree/pull.  No merge but 113 commits remaining *at* this step
(not _after_), all with signed-off-by both Andrew and Linus so it's all the
akpm tree.  We know the tree, now.

FWIW for anyone relatively new to the bug who skipped some of the first
comments, my bad first bisect attempt ended up in akpm as well.  I haven't
checked if it was the same pull altho I'd guess so.  However, at that time I
was only testing commits with drm in the path (including several that went in
via the akpm tree not the drm tree, one of which that bisect ultimately pointed
me at), and I suspect that's what did me in.

So I strongly suspect that while it's the akpm tree, it's *NOT* the one
remaining candidate with the drm-path in it (4064b9827), thus explaining why
the first bisect ended up pointing at a drm-path commit that I tested by
reverting, only to still have the bug.  I tried a shortcut and it ended up a
rabbit trail. =:^(

Other than that, 113 candidate commits left (well, 112 if we subtract that one)
is still too many (for me) to guess at or really to even just list here.  Two
more steps should bring it down to 28ish, three to 14ish, and maybe I can start
guessing then.  With luck I'll get a couple more bad ones right away and narrow
it down quickly.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
