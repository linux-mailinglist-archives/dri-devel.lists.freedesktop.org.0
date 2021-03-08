Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8739B331500
	for <lists+dri-devel@lfdr.de>; Mon,  8 Mar 2021 18:39:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADACC89E5F;
	Mon,  8 Mar 2021 17:39:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68F3089E5F
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Mar 2021 17:39:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 82E5865267
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Mar 2021 17:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615225181;
 bh=baZ0S27yNGsgSRuBQuEc7EQ99mNCKCsVpravg35iT7E=;
 h=From:To:Subject:Date:From;
 b=ewEnSLIklu/Pp9hBrzY4P7bUKjL+/VYi4RwJS1AW0Q6rK0KxTNB0kgJr2kyVuvhkR
 70rJI9qbMQNnfq6fFXZCiRVxP7kBTSh5HabnIPBBrB6yHIMF3+LqWxxlvEOTYkRlHp
 Gh2Qyn/XD/XnqTSiXYwgrjJ20CrD+kUlF0UPMuuR5DqQTYDEI72waVVuRWdK3Fv6Gc
 F8qZZZ0V4Bd6GCuFhxwjDa6yltDWnfEelU2vsnAoGxt1QE6wb0j616BVFsawFqPYaN
 L0snSL42BxKk7qUJvOasDIf5EgXovAr/NM1FBIMaC+jpVji1xfxvMLn1jg/KmNuLbb
 OnCraODUlsr8g==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 73E2A65349; Mon,  8 Mar 2021 17:39:41 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212137] New: kernel NULL pointer dereference, black screen when
 using two graphics cards
Date: Mon, 08 Mar 2021 17:39:41 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: mail@dennisfoster.us
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-212137-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=212137

            Bug ID: 212137
           Summary: kernel NULL pointer dereference, black screen when
                    using two graphics cards
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.11
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: high
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: mail@dennisfoster.us
        Regression: No

Created attachment 295741
  --> https://bugzilla.kernel.org/attachment.cgi?id=295741&action=edit
lspci -vvv

On linux v5.11 and above (up to 5.11.4) I cannot longer boot the system
(GNOME/Wayland) using two graphics cards. It gets stuck with black screen with
no response to keyboard/mouse.

In systemd journal there are some messages about kernel bug:

Mar 08 11:54:05 homeserver kernel: BUG: kernel NULL pointer dereference,
address: 0000000000000008
Mar 08 11:54:05 homeserver kernel: #PF: supervisor read access in kernel mode
Mar 08 11:54:05 homeserver kernel: #PF: error_code(0x0000) - not-present page
Mar 08 11:54:05 homeserver kernel: PGD 0 P4D 0
Mar 08 11:54:05 homeserver kernel: Oops: 0000 [#1] PREEMPT SMP NOPTI
Mar 08 11:54:05 homeserver kernel: CPU: 6 PID: 608 Comm: gnome-shell Tainted: G
OE 5.11.4-arch1-1 #1
Mar 08 11:54:05 homeserver kernel: Hardware name: Gigabyte Technology Co., Ltd.
A320M-S2H/A320M-S2H-CF, BIOS F2 11/03/2020
Mar 08 11:54:05 homeserver kernel: RIP:
0010:drm_gem_handle_create_tail+0xcb/0x190 [drm]
Mar 08 11:54:05 homeserver kernel: Code: 00 48 89 df e8 c6 20 59 f4 45 85 e4 78
77 48 8d 5d 18 4c 89 ee 48 89 df e8 42 fe 00 00 89 c2 85 c0 75 3e 48 8b 85 40
01 00 00 <48> 8b 40 08 48 85 c0 74 0f 4c 89 ee 48 89 ef e8 81 8b 91 f4 85 c0
Mar 08 11:54:05 homeserver kernel: RSP: 0018:ffffb7a7c16bfd30 EFLAGS: 00010246
Mar 08 11:54:05 homeserver kernel: RAX: 0000000000000000 RBX: ffffa0eabe065090
RCX: 0000000000000001


Everything works perfectly fine using current LTS v5.10.21.
I am using Radeon RX 470 as a primary card, and the older ATI FirePro 2270 as a
secondary one in order to provide two extra monitor outputs.

I've attached my lspci output as well as full systemd log.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
