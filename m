Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D8B22F0F4
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jul 2020 16:29:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8838A89C1F;
	Mon, 27 Jul 2020 14:29:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7A8289C1F
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jul 2020 14:29:06 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 208661] Backlight doesn't work with both nv_backlight and
 acpi_video
Date: Mon, 27 Jul 2020 14:29:06 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: imirkin@alum.mit.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-208661-2300-JIv9kYnG7S@https.bugzilla.kernel.org/>
In-Reply-To: <bug-208661-2300@https.bugzilla.kernel.org/>
References: <bug-208661-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=208661

--- Comment #6 from Ilia Mirkin (imirkin@alum.mit.edu) ---
After a lot of debugging on IRC, here are a few facts that are worth recording:

1. The nv_backlight "method" works -- i.e. the backlight is hooked up to the
GPU. Adjusting brightness via acpi_video connects to the same mechanism
somehow. We didn't dig too deep to figure out how, since it's not really
important.

2. At the start of the mmiotrace, the NVIDIA driver fixes up 0xe100
("PNVIO.GPIO_MODE_0") to be have the 0x4 bit set of the SOR mask. On bootup
it's 0x00180100, while it should be 0x001c0100.

3. This is equivalent to what we do in nv50_gpio_reset. This function is called
in response to the "GPIO" init table method (which, one might mention, is
present in the init tables).

4. Manually setting this value (via nvapoke) makes nv_backlight work. Doing
suspend/resume, which causes init tables to be re-run, makes nv_backlight also
work, since the init table contains the GPIO opcode.

5. Regular boot with NvForcePost=1 kills the panel (and maybe other things).

Not sure what the solution is. Right now we run nv50_gpio_reset unconditionally
on MBP10,1. We can start extending the DMI table with random laptops, or maybe
we can just run that function unconditionally. Is there a downside?

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
