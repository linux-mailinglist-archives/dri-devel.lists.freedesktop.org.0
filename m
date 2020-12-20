Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 357352DF2DB
	for <lists+dri-devel@lfdr.de>; Sun, 20 Dec 2020 04:26:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CABC46E0EA;
	Sun, 20 Dec 2020 03:26:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DEFF6E0EA
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Dec 2020 03:26:23 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 210683] Nasty amdgpu powersave regression Navi14
Date: Sun, 20 Dec 2020 03:26:23 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: david.18.19.21@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc attachments.created
Message-ID: <bug-210683-2300-PdMMAtiZIq@https.bugzilla.kernel.org/>
In-Reply-To: <bug-210683-2300@https.bugzilla.kernel.org/>
References: <bug-210683-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=210683

David Mak (david.18.19.21@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |david.18.19.21@gmail.com

--- Comment #4 from David Mak (david.18.19.21@gmail.com) ---
Created attachment 294239
  --> https://bugzilla.kernel.org/attachment.cgi?id=294239&action=edit
dmesg outputs for 5.9.14 and 5.10.1.

I can reproduce the issue on the RX 6800 (Navi 21 XL).

I use Radeontop to inspect the memory/GPU clock of my GPU.

When using Linux 5.9.14:
- In both KDE Plasma and tty2, Memory Clock hovers at around 100MHz.
- GPU Power reported by lm_sensors is around 5-7W.

When using Linux 5.10.1:
- In tty2, Memory Clock hovers at around 100MHz and GPU Power reported by
lm_sensors is around 5-7W.
- In KDE Plasma, Memory Clock is usually around 1GHz (100%), although it can be
down to ~470MHz, and GPU Power reported by lm_sensors is around 30W.
- Disconnecting one of my two monitors does not change the memory clock.

I am trying to bisect the commit, but many revisions seem to give a blank
screen or the amdgpu module is not loaded. (I suspect I am not building the
kernel properly)

Tested linux-firmware versions: 20201120.bc9cd0b, 20201218.646f159

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
