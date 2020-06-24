Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 054FE207D19
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jun 2020 22:33:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C238D6E457;
	Wed, 24 Jun 2020 20:33:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FBF26E457
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 20:33:25 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 206475] amdgpu under load drop signal to monitor until hard reset
Date: Wed, 24 Jun 2020 20:33:24 +0000
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
Message-ID: <bug-206475-2300-ltqfoIk2Za@https.bugzilla.kernel.org/>
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

--- Comment #15 from Andrew Ammerlaan (andrewammerlaan@riseup.net) ---
So today it was *really* hot, and I had this issue occur a couple of times.
(The solution with the extra fans was nice and all, but not enough to prevent
it entirely)

However, now that the iGPU is default, I can still see the system monitor that
I usually run on the other monitor when this issue occurs. Every single time
the thermal sensor of the GPU would show a ridiculous value (e.g. 511 degrees
Celsius).

Now, this could explain why the GPU does a reset. If the thermal sensor would
all of a sudden return a value of e.g. 511, then of course the GPU will shut
itself down. 

As it is clearly impossible for the temperature of the GPU to jump from being
somewhere between 80 to 90, to over 500 within a couple of milliseconds. I
conclude that there is something wrong, either physically with the thermal
sensor, or with the way the firmware/driver handles the temperature reporting
from the sensor. Also, if the GPU would have actually reached a temperature of
511 it would be broken now, as the melting temperature of tin is about 230
degrees Celsius.

I happen to work with thermometers quite a lot, and I have seen temperature
readings do stuff like this. Usually the cause is either a broken, or shorted
sensor (which is unlikely in this case, cause it works normally most of the
time), or a wrong/incomplete calibration curve. (Usually thermal sensors are
only calibrated within the range they are expected to operate, but the high
limit of this calibration curve might be too low.)

Anyway, either the GPU reset is caused by the incorrect temperature readings,
or the incorrect temperature readings are caused by the GPU reset (which is
also possible I guess). In any case, it would be great if AMD could look into
this soon. Because clearly something is wrong.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
