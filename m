Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2E9240088
	for <lists+dri-devel@lfdr.de>; Mon, 10 Aug 2020 02:26:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 579326E0EE;
	Mon, 10 Aug 2020 00:26:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 391686E0EE
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Aug 2020 00:26:45 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 201539] AMDGPU R9 390 automatic fan speed control in Linux
 4.19/4.20/5.0
Date: Mon, 10 Aug 2020 00:26:44 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: supasean@hotmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-201539-2300-PX4zkAy0on@https.bugzilla.kernel.org/>
In-Reply-To: <bug-201539-2300@https.bugzilla.kernel.org/>
References: <bug-201539-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=201539

--- Comment #56 from Sean Birkholz (supasean@hotmail.com) ---
I was going to try and get a fancontrol script working, but I found the
following as I started to play around:

I got my results on Arch Linux's 5.7.12-arch1-1 kernel.  

On boot pwm1_enable is set to 1 (manual mode).  On 4.18.x it is normally set to
2 (automatic mode) iirc.  Changing this value to 2 does essentially nothing for
me and the fans do not spin up with increasing temp.  

However, I've found that running pwmconfig and not even answering the first
question (ie; I can just ctrl+c out) causes the automatic temp control to start
functioning.  So after you run pwmconfig, then change pwm1_enable to 2 and
everything works again.  So far it appears doing these two things gets me the
same functionality I had on 4.18.x and I can finally upgrade my kernel.  No fan
control script needed.

It is interesting to note, if you do these in the opposite order; set
pwm1_enable to 2 and then run pwmconfig, you must say yes to enabling manual
mode on the gpu's fan before they start functioning properly.  This also causes
the fan to run full speed (like pwm1_enable is set to 0) and you will need to
set 2 in pwm1_enable again.

I dont know what pwmconfig is modifying to cause pwm to work again... I wish i
knew so I could set that up with a script and not have to manually start it,
but this is good enough for now as I reboot rarely.  Maybe I can make a script
to use with systemctl when I'm not lazy.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
