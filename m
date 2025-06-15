Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 538BFADA1B9
	for <lists+dri-devel@lfdr.de>; Sun, 15 Jun 2025 14:12:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3FF810E123;
	Sun, 15 Jun 2025 12:12:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tbxe77i8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C509710E226
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Jun 2025 12:12:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 3A8F4A50053
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Jun 2025 12:12:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 93FC3C4CEE3
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Jun 2025 12:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749989556;
 bh=br/6pJ/lbhbURXtNN6BHcNBAvmZia7opywgrpvDQkO0=;
 h=From:To:Subject:Date:From;
 b=tbxe77i8T98OCW/82hMY1q0doLN5XgWsEopurQ6Ajv/XnmlFU56NrLvRiGYRDff0W
 eRamcQ1TU/XNctLAYsH3p2uUG9hToAYYcyY04/5xAtdgFRfnhbNh2R8mvpzVvhu6v5
 F6ww+B9/Vd3Us7yADX9i2hu8vVS0s1T/mSzg8ZL2uJCkubW40GI5y1rX+lXeFgVC77
 ntvp0ksyti8YDWBPlmtzjvYJzWIMrgm7FRROdzlx7TygEb0y+IiYMIm5/14U1an4T+
 u3zbfHmv1dn3KS2oVE4KU92kdhjeTQOcny6UB0XHh3K4iGyP0zO43WJGTT2MFQLV1F
 8HyRmkD/TXNoQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 87964C41612; Sun, 15 Jun 2025 12:12:36 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 220232] New: Title: RX 7900 XT/XTX DPM states incorrectly
 ordered - idle state in wrong position
Date: Sun, 15 Jun 2025 12:12:36 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: a.von.blumenthal@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-220232-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220232

            Bug ID: 220232
           Summary: Title: RX 7900 XT/XTX DPM states incorrectly ordered -
                    idle state in wrong position
           Product: Drivers
           Version: 2.5
          Hardware: AMD
                OS: Linux
            Status: NEW
          Severity: high
          Priority: P3
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: a.von.blumenthal@gmail.com
        Regression: No

Description:
  The GPU DPM states are incorrectly ordered on AMD RX 7900 XT/XTX. The low=
est
idle clock state appears
  in position 1 instead of position 0, causing inefficient power state
transitions.

  System Information:
  - GPU: AMD Radeon RX 7900 XT/XTX (PCI ID: 03:00.0)
  - Kernel: 6.14.9-300.fc42.x86_64
  - Distribution: Fedora 42
  - Driver: amdgpu

  Current Behavior:
  $ cat /sys/class/drm/card1/device/pp_dpm_sclk
  0: 500Mhz
  1: 120Mhz *
  2: 2482Mhz

  Expected Behavior:
  DPM states should be ordered from lowest to highest:
  0: 120Mhz *
  1: 500Mhz
  2: 2482Mhz

  Impact:
  - GPU idles at wrong state priority
  - Potential increased idle power consumption
  - Affects all power profile modes (BOOTUP_DEFAULT, 3D_FULL_SCREEN, COMPUT=
E,
CUSTOM, etc.)

  Steps to Reproduce:
  1. Check DPM states: cat /sys/class/drm/card*/device/pp_dpm_sclk
  2. Observe state 0 is 500MHz while state 1 is ~120MHz
  3. Issue persists across all power profiles and after GPU reset

  Additional Information:
  - Issue confirmed on kernel 6.14.9
  - GPU reset via rocm-smi -d 0 --gpureset does not resolve the issue
  - Memory clock DPM states appear correctly ordered

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
