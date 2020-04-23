Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 978521B58AB
	for <lists+dri-devel@lfdr.de>; Thu, 23 Apr 2020 11:57:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D5EA6E4DD;
	Thu, 23 Apr 2020 09:57:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6D626E4DD
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Apr 2020 09:57:18 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205291] Cannot switch off Radeon HD 4330/4350/4550 with
 vgaswitcheroo
Date: Thu, 23 Apr 2020 09:57:18 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kernel.bugs@kjpetrie.co.uk
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-205291-2300-tCFspHyVzM@https.bugzilla.kernel.org/>
In-Reply-To: <bug-205291-2300@https.bugzilla.kernel.org/>
References: <bug-205291-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=205291

K J Petrie (kernel.bugs@kjpetrie.co.uk) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |CODE_FIX

--- Comment #11 from K J Petrie (kernel.bugs@kjpetrie.co.uk) ---
I decided to compile 5.6.6 with CONFIG_PM_ADVANCED_DEBUG.

To my amazement, this gave me:
# uname -r
5.6.6

# cat /sys/kernel/debug/vgaswitcheroo/switch 
0:IGD:+:Pwr:0000:00:02.0
1:DIS: :DynOff:0000:01:00.0
2:DIS-Audio: :DynOff:0000:01:00.1    (!!!!!!)

(GPU)
# cat /sys/bus/pci/devices/0000\:01\:00.0/power/control 
auto
# cat /sys/bus/pci/devices/0000\:01\:00.0/power/runtime_status 
suspended
cat /sys/bus/pci/devices/0000\:01\:00.0/power/runtime_usage 
0
# cat /sys/bus/pci/devices/0000\:01\:00.0/power/runtime_active_kids
0

(HDA)
# cat /sys/bus/pci/devices/0000\:01\:00.1/power/control 
auto
# cat /sys/bus/pci/devices/0000\:01\:00.1/power/runtime_status 
suspended
# cat /sys/bus/pci/devices/0000\:01\:00.1/power/runtime_usage 
0
# cat /sys/bus/pci/devices/0000\:01\:00.1/power/runtime_active_kids 
0

So, either enabling CONFIG_PM_ADVANCED_DEBUG affects this or it's fixed in the
latest kernels.

As a quick check I installed the distribution's latest kernel:

# uname -r
5.5.19-pclos1
[root@master2 ken]# cat /sys/kernel/debug/vgaswitcheroo/switch 
0:IGD:+:Pwr:0000:00:02.0
1:DIS: :DynOff:0000:01:00.0
2:DIS-Audio: :DynOff:0000:01:00.1

So it looks as if it was fixed in the 5.5 kernels.

However, both the 5.5 (distro) and 5.6 (mainline) kernels emit a terrible
clattering sound during services start up. I'm unsure whether that's coming
from the speakers, HDD or optical drive. If the former, it's just a nuisance,
if one of the latter it's not good news. I hope that's not related to the fix!

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
