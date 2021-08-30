Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3753FBDBA
	for <lists+dri-devel@lfdr.de>; Mon, 30 Aug 2021 22:59:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B72D89C1B;
	Mon, 30 Aug 2021 20:58:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B983189C1B
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Aug 2021 20:58:48 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 7352260F6C
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Aug 2021 20:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630357128;
 bh=8DyE4HvhEGnqwxxiC/9f6CMfwcumQDAcDoUzjet+uk8=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=LYWTinO1dIfkjMwIqpndKLfEGtgusLwDfS3zjhajVttfZG+zUgiRr1gE8GTcMyK67
 bLUwiBB/U+1yfj5/o+MJXI0iWlRBOX6ex2yKECr9tjnGRRF16i4cNsG6x26nsLxZM0
 2fSabQZ5MCa70/AE/SfhqhBeZEEm3IrBZvVlVxQ+on9Su9MLWiJ1HfYfKNML4aBhbG
 F95tdcx8OVwJapEFjygOFOZgk33UqPVv22QE2RJNj9J242AE60xtxLW+yhFANGwZrd
 eXzcl9FqxVWfnOA9DhPIm+Pp7WRo6BilReNw8NNpS7ZBYLfKrDR4/auV3H/eZkklSx
 YPOTXj6mtZ95Q==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 6BA4160F94; Mon, 30 Aug 2021 20:58:48 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214199] Sapphire NITRO+ RX 580 4G G5 - Secondary display
 doesn't wake up on boot, both displays won't wake up from suspend
Date: Mon, 30 Aug 2021 20:58:48 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kernel@zeljko.anonaddy.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214199-2300-5DRVtGET5H@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214199-2300@https.bugzilla.kernel.org/>
References: <bug-214199-2300@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

https://bugzilla.kernel.org/show_bug.cgi?id=3D214199

--- Comment #2 from Zeljko (kernel@zeljko.anonaddy.com) ---
At first, I've got both monitors to work correctly with amdgpu.dc=3D0 kernel
parameter.


After analyzing the dmesg outputs without the above kernel parameter I've
noticed that, on boot, my second monitor (connected on HDMI-A-2) was detect=
ed
but went on some kind of loop reporting that the Edid was changed.

[drm:dc_link_detect_helper [amdgpu]] link=3D3, dc_sink_in=3D000000000000000=
0 is now
Disconnected prev_sink=3D000000009ae23fd3 dpcd same=3D1 edid same=3D0
[drm:amdgpu_dm_update_connector_after_detect [amdgpu]] DCHPD: connector_id=
=3D3:
Old sink=3D000000009ae23fd3 New sink=3D0000000000000000
[drm:drm_connector_update_edid_property [drm]] [CONNECTOR:79:HDMI-A-2] Edid=
 was
changed.
[drm:drm_connector_update_edid_property [drm]] Updating change counter to 61


Same thing happens when the computer wakes up from suspend, but than both
monitors go into the same kind of loop.

[drm:dc_link_detect_helper [amdgpu]] link=3D3, dc_sink_in=3D000000000000000=
0 is now
Disconnected prev_sink=3D000000003f9f81c9 dpcd same=3D1 edid same=3D0
[drm:amdgpu_dm_update_connector_after_detect [amdgpu]] DCHPD: connector_id=
=3D3:
Old sink=3D000000003f9f81c9 New sink=3D0000000000000000
[drm:drm_connector_update_edid_property [drm]] [CONNECTOR:79:HDMI-A-2] Edid=
 was
changed.
[drm:drm_connector_update_edid_property [drm]] Updating change counter to 1=
18

[drm:dc_link_detect_helper [amdgpu]] link=3D2, dc_sink_in=3D000000000000000=
0 is now
Disconnected prev_sink=3D000000006f240528 dpcd same=3D1 edid same=3D0
[drm:amdgpu_dm_update_connector_after_detect [amdgpu]] DCHPD: connector_id=
=3D2:
Old sink=3D000000006f240528 New sink=3D0000000000000000
[drm:drm_connector_update_edid_property [drm]] [CONNECTOR:74:HDMI-A-1] Edid=
 was
changed.
[drm:drm_connector_update_edid_property [drm]] Updating change counter to 41


After some googling I've managed to get both monitors working correctly wit=
hout
amdgpu.dc=3D0 by forcing edid files extracted from both monitors using these
kernel parameters:

video=3DHDMI-A-1:e video=3DHDMI-A-2:e
drm.edid_firmware=3DHDMI-A-1:edid/edid1.bin,HDMI-A-2:edid/edid2.bin


Couple more details that may help:
- both monitors are the same model BenQ GW2470
- they are both connected via a HDMI 2.0 cable from the same maker and are =
the
same length
- I've decoded and compared both edid files and the only differences are the
"Display Product Serial Number" and "Checksum"

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
