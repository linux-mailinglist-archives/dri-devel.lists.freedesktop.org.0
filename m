Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76BC9204090
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jun 2020 21:36:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BF676E83C;
	Mon, 22 Jun 2020 19:36:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F6FB6E83C
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jun 2020 19:36:30 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 207383] [Regression] 5.7 amdgpu/polaris11 gpf:
 amdgpu_atomic_commit_tail
Date: Mon, 22 Jun 2020 19:36:29 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-207383-2300-2vAaGnVTDn@https.bugzilla.kernel.org/>
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

--- Comment #19 from Duncan (1i5t5.duncan@cox.net) ---
(In reply to rtmasura+kernel from comment #18)
> 09:00.0 VGA compatible controller: NVIDIA Corporation GP104GL [Quadro P4000]
> (rev a1)

> 0e:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI]
> Vega 10 XL/XT [Radeon RX Vega 56/64] (rev c3)

> A few notes on that: The AMD Vega56 is used for this PC, the Quadro P4000 is
> disabled on my system and passed through to VMs. 

So newer graphics, Vega56/gcn5 compared to my gcn4.

No VMs at all here so that can be excluded as a factor (unless it's a minor
trigger similar to my zooming or video play).

> I haven't found any way to trigger it. Seems completely random. Sat down
> this morning to update a VM (not the one with the nvidia passthrough) and it
> froze, wasn't any real graphical things going on other than normal KDE
> stuff. 

KDE/Plasma here too.  I think kwin exercises the opengl a bit more than some
WMs, in part because it's a compositor as well.  The bug most often hits here
when playing video or using kwin's zoom effect, which exercise the graphics a
bit.

So mostly kde/kwin triggers could lower the population hitting it and could be
a factor, based on both of us running it.

> Model name:                      AMD Phenom(tm) II X6 1090T Processor

Newer graphics, gcn5 to gcn4, older cpu, phenom ii to fx, than here.

So we know gcn4 and gcn5 are affected, and pcie2 bus with pcie3 cards and
kde/kwin are common-factor possible triggers so far.

> I would be happy to help with any testing, just let me know what information
> you need.

If you happen to run anything besides KDE/Plasma on X, duplicating (or failing
to duplicate) the bug on non-kde and/or on wayland would be useful info.  I
only run KDE Plasma on X here.  Well, that and CLI (on amdgpu-drm-framebuffer)
more than some but not enough that I'd have expected to see it there, which I
haven't.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
