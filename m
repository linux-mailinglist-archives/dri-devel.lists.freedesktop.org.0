Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E26AB1DE756
	for <lists+dri-devel@lfdr.de>; Fri, 22 May 2020 14:55:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09CE76E0A1;
	Fri, 22 May 2020 12:55:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57DC66E0A1
 for <dri-devel@lists.freedesktop.org>; Fri, 22 May 2020 12:55:36 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 206475] amdgpu under load drop signal to monitor until hard reset
Date: Fri, 22 May 2020 12:55:35 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: andrewammerlaan@riseup.net
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc attachments.created
Message-ID: <bug-206475-2300-dmUZXuB9hv@https.bugzilla.kernel.org/>
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

andrewammerlaan@riseup.net (andrewammerlaan@riseup.net) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |andrewammerlaan@riseup.net

--- Comment #10 from andrewammerlaan@riseup.net (andrewammerlaan@riseup.net) ---
Created attachment 289235
  --> https://bugzilla.kernel.org/attachment.cgi?id=289235&action=edit
syslog

I think I ran into this issue as well. It has happened twice. Both times it
happened 10 to 20 minutes *after* playing minecraft. Both times I was in a full
screen video meeting. Everything works, except the screen goes black, I could
finish the meeting, but without seeing anything. 

Only the monitors connected to my RX 590 go black, the one connected to the
iGPU just freezes, and after a while the cursor becomes usable again on that
monitor, though all applications remain frozen, and switching to tty does not
work. REISUB'ing the machine makes it boot on the iGPU. It needs to be
completely switched on and off to boot from the amdgpu.

It looks like it does a graphics reset (why though?):
15554.332021] amdgpu 0000:01:00.0: GPU reset begin!

And from that point onwards everyting goes wrong:
[15554.332296] amdgpu: [powerplay] 
[15554.332296]  last message was failed ret is 65535
[15554.332297] amdgpu: [powerplay] 
[15554.332297]  failed to send message 261 ret is 65535 
[15554.332297] amdgpu: [powerplay] 
[15554.332297]  last message was failed ret is 65535

This is kernel 5.6.14
xorg-1.20.8
mesa-20.1.0_rc3
xf86-video-amdgpu-19.1.0

Full log is attached.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
