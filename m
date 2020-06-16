Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8A51FBBE6
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jun 2020 18:40:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCA446E902;
	Tue, 16 Jun 2020 16:39:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A05C86E902
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jun 2020 16:39:56 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 206475] amdgpu under load drop signal to monitor until hard reset
Date: Tue, 16 Jun 2020 16:39:56 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-206475-2300-Tb15mie6TM@https.bugzilla.kernel.org/>
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

--- Comment #14 from Andrew Ammerlaan (andrewammerlaan@riseup.net) ---
I sort of worked around this too.

I changed two things:

1) the iGPU is now the primary GPU, and I use DRI_PRIME=1 to offload to the AMD
gpu. This has reduced the amount of things that are rendered on the AMD card.
This didn't actually fix anything, but it did remove the necessity for a hard
reboot when the AMD GPU does a reset. Now, when the GPU resets only the
applications that are rendered on the AMD card stop working, the desktop and
stuff stay functional. 

2) I added three fans to my PC. Though the card's thermal sensor never reported
that it reached the critical temperature (it went up to 82 Celsius max,
critical is 91 Celsius). There definitely does seem to be a correlation between
high temperatures and the occurrence of the resets. And more fans is always
better anyway.

I still experienced some resets after switching the primary GPU to the iGPU,
but only if I really pushed it to it's limits. I haven't had a single reset
since I added the fans. (Though admittedly I haven't run a decent stress test
yet, so it is still too early to conclude that the problem is completely gone)

Since under-clocking the card worked for you, and adding fans seems to work for
me. I have a hunch that even though the thermal sensor doesn't report
problematic temperatures some parts of the card actually do reach problematic
temperatures nonetheless, which might causes issues leading to a reset.
I'm not sure where the sensor is physically located, but considering that the
card is quite large, it doesn't seem that far fetched to me that there could be
quite a large difference in temperature between two points on the card.

Perhaps this card could benefit from a second thermal sensor or earlier and/or
more aggressive thermal throttling.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
