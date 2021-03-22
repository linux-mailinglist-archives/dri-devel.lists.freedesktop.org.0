Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21EF5343CED
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 10:36:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03D6689A88;
	Mon, 22 Mar 2021 09:36:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDB2B89A88
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 09:36:46 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 90DDE6192A
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 09:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616405805;
 bh=HydhpkgmhLllmxzVmuAshmlFLOh0VumgOTDHzk9DKNU=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=f+q7TUuqByUCGHpevpDn+LEOtWR20V/ZQqxV4trrDnLf7ctxKUyYMir4iUhkKzBFX
 HMVqQrfIfAc9/UdA1zAA1t+O2xU69q13e05YzfnrBxhW/+GmxvxPc1Xqxztoddizly
 vB4AYl57O8zI/Dmtvceh4sydMVWSjKYxr1gTX/w09KoHUcIWToTHqXogy8OKNy9sx+
 3EaajK0Ysl67v/LVvgraJg2zk5rkyT5urkMC/2UlpWJWsmqINofSWy4vpQKss/yA+d
 6eDctNPuKPOm0itPaxvWlE+1/6AY3Xg63RJYRtpwl/XaegdB5cexVN3AjscslDvaTJ
 Wdz7E3aPPssJg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 82EF862AB0; Mon, 22 Mar 2021 09:36:45 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 206475] amdgpu under load drop signal to monitor until hard reset
Date: Mon, 22 Mar 2021 09:36:45 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: rodomar705@protonmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-206475-2300-dLSqpK61u5@https.bugzilla.kernel.org/>
In-Reply-To: <bug-206475-2300@https.bugzilla.kernel.org/>
References: <bug-206475-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=206475

Marco (rodomar705@protonmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|REOPENED                    |RESOLVED
         Resolution|---                         |ANSWERED

--- Comment #20 from Marco (rodomar705@protonmail.com) ---
I finally got where the problem was, and completely fixed it. It was hardware.
The issue was the heatsink was not contacting completely a section on the
mosfets that was feeding power to the core of the card. Under full load they
was thermal tripping for overheating and completely stalling the card to avoid
damages to themselves. The problem was that this card wasn't reporting the
temps of them to software, even if the actual vrm controller was (or if it was
shutting down only when the mosfet trigger purely a signal asserting the
thermal runaway condition). This was hell to debug and fix, as always with
hardware problems, but after a stress test on both Windows and Linux under full
clock, the issue is not present anymore.

I'll keep my optimized clocks for lower temperatures and less fan noise, but
for me the issue wasn't software.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
