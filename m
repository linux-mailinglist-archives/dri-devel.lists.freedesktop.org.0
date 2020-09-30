Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A9827E50E
	for <lists+dri-devel@lfdr.de>; Wed, 30 Sep 2020 11:22:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B984E6E5B6;
	Wed, 30 Sep 2020 09:22:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 973716E5B6
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Sep 2020 09:22:41 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 204241] amdgpu fails to resume from suspend
Date: Wed, 30 Sep 2020 09:22:40 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: samy@lahfa.xyz
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-204241-2300-xhRu12dLL7@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204241-2300@https.bugzilla.kernel.org/>
References: <bug-204241-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=204241

Lahfa Samy (samy@lahfa.xyz) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |samy@lahfa.xyz

--- Comment #67 from Lahfa Samy (samy@lahfa.xyz) ---
I'm having currently this issue on a T495 with a Ryzen 3700U with integrated
graphics Vega RX 10 on ArchLinux with ZFS.

Before 5.8.12-arch1-1, I can suspend however right when I resume the system
freezes. 

I have to hard reset by rebooting using the power button, nothing is present in
the journalctl besides systemd saying it did suspend, it's not mentioning
something that fails about AMDGPU.

However have seen a call trace in dmesg about the wifi driver (RIP:
0010:iwl_pcie_rx_handle+0x9c7/0xbb0 [iwlwifi]) but this is happening during
boot and thus maybe not affecting the suspend process. 

The thing is this issue started when I upgraded the kernel from 5.8.11-arch to
5.8.12 but I have also installed AMDGPU (bad timing) and Mesa-git thus I'm not
being too sure if the latter is maybe part of the issue or is the very problem
of this bug. 

I have removed the git packages and installed their stable counterparts also
removed the kernel parameters amdgpu.cik_support=1 amdgpu.sk_support=1
radeon.sk_support=0 radeon.cik_support=0 and I'll be doing some tests and
reporting if I find a way to mitigate the issue.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
