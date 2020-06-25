Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA91209C5E
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jun 2020 11:58:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 599BF6EA1E;
	Thu, 25 Jun 2020 09:58:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7766E6EA1E
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jun 2020 09:58:47 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 206475] amdgpu under load drop signal to monitor until hard reset
Date: Thu, 25 Jun 2020 09:58:46 +0000
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
Message-ID: <bug-206475-2300-aIdLihGIhf@https.bugzilla.kernel.org/>
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

--- Comment #17 from Andrew Ammerlaan (andrewammerlaan@riseup.net) ---
(In reply to Alex Deucher from comment #16)
> When the GPU is in reset all reads to the MMIO BAR return 1s so you are just
> getting all ones until the reset succeeds.  511 is just all ones.  This
> patch will fix that issue:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/
> ?id=9271dfd9e0f79e2969dcbe28568bce0fdc4f8f73

Well there goes my hypotheses of the broken thermal sensor xD.

I did discover yesterday that the fan of my GPU spins relatively slow under
high load. When the GPU reached ~80 degrees Celsius, the fan didn't even spin
at half the maximum RPM! I used the pwmconfig script and the fancontrol service
from lm_sensors to force the fan to go to the maximum RPM just before reaching
80 degrees Celsius. It's very noisy, *but* the GPU stays well below 70 degrees
Celsius now, even under heavy load. As this issue seems to occur only when the
GPU is hotter then ~75 degrees Celsius, I'm hoping that this will help in
preventing the problem.

I'm still confused as to why this is at all necessary, the critical temperature
is 91, so why do I encounter these issues at ~80?

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
