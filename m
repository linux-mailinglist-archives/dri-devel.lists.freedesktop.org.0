Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD1B34A574
	for <lists+dri-devel@lfdr.de>; Fri, 26 Mar 2021 11:25:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFC6B6E1B4;
	Fri, 26 Mar 2021 10:24:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0E2E6E1B4
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 10:24:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id E0A4C61A10
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 10:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616754296;
 bh=afwTCB7uCODiF11JQ/ZwSA7oD31WPrvfTtDWi37MW80=;
 h=From:To:Subject:Date:From;
 b=LeZK7Lbf10RSAlKuahwyxedDT227LxpwkLKohxnKsnUvAhGHFex5WdQX06pcO8eBi
 rO8zSqbEvdBEL9wmVXTpWrYN8ZefF0niEhntyt2QvXAGXGB8HgRYzIs1nFEIFclaBU
 peU0MG+5g2GVJVmKQiTGdlFzFPnmSkJk3BZ1dDptd8vMRYuZN5USwNJ9cJvU63sYC2
 2dP2QK9V7BQqZzpnAem1r4Bs8eoO3rRGn5wM03ToMH3RnC9TvTqDFwga8dwflkPJ0E
 JA1WBawYrhTq7PXzuMxvmGMhrzOZs//QbVIFAJMXch8Dl7Gc8uQci620eYHcU2XWSe
 j4mouhqdFEKxQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id D306E62AC5; Fri, 26 Mar 2021 10:24:56 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212449] New: DDC requires amdgpu.dc=0, HDMI sound requires
 amdgpu.dc=1. Make them work together!
Date: Fri, 26 Mar 2021 10:24:56 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: sdiconov@mail.ru
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-212449-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=212449

            Bug ID: 212449
           Summary: DDC requires amdgpu.dc=0, HDMI sound requires
                    amdgpu.dc=1. Make them work together!
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.4.107
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: sdiconov@mail.ru
        Regression: No

I need both DDC and HDMI audio functionality of my radeon RX card, but the
amdgpu kernel driver fails to support both at the same time. I can either use
DDC with 

"amdgpu.hw_i2c=0 amdgpu.dc=0"

OR HDMI audio  with

"amdgpu.dc=1".


The  "dc=1"  kernel switch disables DDC and "dc=0" disables HDMI audio. The
"dcfeaturemask" option might need a new flag to selectively allow i2c
communication with the display while still allowing audio to work over HDMI.




___Details___

I run a radeon RX card supported by the amdgpu module

"# lspci
01:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI]
Baffin [Radeon RX 550 640SP / RX 560/560X] (rev cf)
01:00.1 Audio device: Advanced Micro Devices, Inc. [AMD/ATI] Baffin HDMI/DP
Audio [Radeon RX 550 640SP / RX 560/560X]"

It has 1 DP, 1 DVI and 1 HDMI outs.


The GPU is connected to: 1) a Dell U3011 display via DVI (only 2560x1600 video)
and 2) an audio receiver via HDMI (only audio).
The display is shared with another computer, which takes up the display's DP
port. The receiver does not support 2K/4K video resolution and serves as a hifi
DAC+amplifier only. HDMI is the only way to pass digtal PCM 5.1 audio.  

I need DDC to switch video inputs of the Dell U3011 display, because its sensor
buttons and on-screen menus are a real pain to use. gddccontrol is a handy
linux gui app to do it, but it needs i2c and ddc support (which get disabled by
the dc=1 switch).

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
