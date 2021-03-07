Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF9D330430
	for <lists+dri-devel@lfdr.de>; Sun,  7 Mar 2021 20:17:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ABA189DA2;
	Sun,  7 Mar 2021 19:17:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BD2989DA2
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Mar 2021 19:17:19 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 264C764F53
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Mar 2021 19:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615144639;
 bh=Bfzpm91ZDjDsfjfH/F77mzb09GqUOLa1PSf3yXzZJLM=;
 h=From:To:Subject:Date:From;
 b=A13frpNn5ojxt8HbMjYVcwjeEakOHnGkfFuDXMpZeZ/2qZEKwivr73INHaL8m7B9z
 gpPULN4ody4dZfv4O0DkyBniKeHAAJONvWaYTtGZKOi4zez/M2o+9qtGvo6AIaW+cY
 ZQiWimN1ff+h2SFkSFIxgBUsJBOpEjfrI1nyVyOBY8hZdC/EWpVnOeYovZHln780UQ
 24jWpu4c5TDOVe5hWUmcV3uMznswRqKcKpSR3tA27pGMHsRrrbxZxS/vbeH+474kMk
 2Mnwn935eN1o6PF1tO7S3XTtVhnl3oBoZns1MSG4GzS70MCNKkleo2gSdZUH/HSHzV
 GhiU61hVHjpPA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 1C29E65317; Sun,  7 Mar 2021 19:17:19 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212109] New: Analogix ANX6345 bridge fails to initialize after
 suspend
Date: Sun, 07 Mar 2021 19:17:18 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: jaron@kent-dobias.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-212109-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=212109

            Bug ID: 212109
           Summary: Analogix ANX6345 bridge fails to initialize after
                    suspend
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.11.4
          Hardware: ARM
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: high
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: jaron@kent-dobias.com
        Regression: No

Created attachment 295705
  --> https://bugzilla.kernel.org/attachment.cgi?id=295705&action=edit
kernel config

My hardware is a Pine64 Pinebook, which has an Analogix ANX6345 eDP bridge.
Starting with the 5.11 series, the screen fails to turn on after suspend,
producing the error: '[drm:anx6345_bridge_enable] *ERROR* Failed eDP
transmitter initialization: -13'.

Steps to reproduce:

  1) boot series 5.11 kernel on the Pinebook
  2) close lid
  3) open lid.

Actual results: the display does not turn on.

Expected results: the display turns on.

Build date & hardware: 2021-03-07 on Arch Linux (x86-64 cross compile), run on
a Pine64 Pinebook.

Additional information: the latest 5.10 kernel (5.10.21) compiled with the same
config does not exhibit the bug.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
