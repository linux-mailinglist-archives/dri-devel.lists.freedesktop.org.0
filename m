Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E624733C273
	for <lists+dri-devel@lfdr.de>; Mon, 15 Mar 2021 17:49:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D4AA89C89;
	Mon, 15 Mar 2021 16:49:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00BC489C89
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Mar 2021 16:49:29 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id CAC4364F2F
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Mar 2021 16:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615826969;
 bh=cncwAC3uL0+0ZyDZCO7CBZ50SPvUu3VIv9qk5plzym8=;
 h=From:To:Subject:Date:From;
 b=Cah6vuz6yqHQjEZ9GjP/FzejLGPmewPNM8MGR3Qag60BIe43rP0TRWFzNrobQPFvj
 OITrZS1h6vTeDRQ0a6zPvUM2+nYxqRumfw2tfZ6hB58nprw9cYSl3v73mBF/5+uxnS
 McGV0SLuqt+81/lwP90BoM6J+SYKu7VUBoOmFeJ0jNBHrHnqNA3PtKS9kFyrwGvjpN
 SQ32V/vNJmZny1WIzA9dE/VKmmA18nX18mR61XNZomThwWL1QncRmX0cc84nbH+rR+
 Jw9q0ammFXNFYdIOPtfc599q2QB0zzvOQB8ezQk+q7RBxiFEKZhq9isKgfCRym6Q7O
 OS7tLQ2VRVFgg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id C06E465350; Mon, 15 Mar 2021 16:49:29 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212293] New: [amdgpu] divide error: 0000 on resume from S3
Date: Mon, 15 Mar 2021 16:49:29 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: contact@scrumplex.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-212293-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=212293

            Bug ID: 212293
           Summary: [amdgpu] divide error: 0000 on resume from S3
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.11.6
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: contact@scrumplex.net
        Regression: No

Created attachment 295869
  --> https://bugzilla.kernel.org/attachment.cgi?id=295869&action=edit
kernel log since resume

My system experiences a kernel panic when resuming from S3, coming from amdgpu.
The GPU has to be in a specific state for this to happen. Mainly when my
desktop environment turns off the screens after some inactivity, and
subsequently suspends the system.

This issue only occurs with kernel versions 5.11.x. 
I could only reproduce this with KDE Plasma / KWin on Wayland, while testing
KDE Plasma / KWin on Xorg and on Wayland (Xorg seems to work fine).


REPRODUCTION
1. Start KDE Plasma / KWin on Wayland
2. Set Screen Energy Saving "Switch off after" to a low value like 1min
3. Wait until Plasma has turned off screens
4. Suspend the system (via SSH for example)
5. Try to wake from sleep


SYSTEM INFO
CPU: AMD Ryzen 9 3900X
Mainboard: ASUS ROG STRIX B450-F GAMING II
GPU: GIGABYTE Radeon RX VEGA 56 GAMING OC 8G


ATTACHMENTS
I attached the kernel panic I could capture via ttyS0.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
