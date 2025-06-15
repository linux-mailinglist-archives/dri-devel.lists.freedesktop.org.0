Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B72ADA157
	for <lists+dri-devel@lfdr.de>; Sun, 15 Jun 2025 10:53:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69E6210E0C5;
	Sun, 15 Jun 2025 08:53:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="C80i2iJ5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0B1D10E0C5
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Jun 2025 08:52:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B68A15C4623
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Jun 2025 08:50:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C3C13C4CEEE
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Jun 2025 08:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749977569;
 bh=8bFvMU8K0O0nfpki12UEhb6leHCCD1vAsE6sh6p+sbE=;
 h=From:To:Subject:Date:From;
 b=C80i2iJ5oR8DTi4j0B8/IhRzSRaqyVSJ0VHBUY2CW+JabP9HLWSECVNR+k7edyTwV
 Pc+6k3SdovsF7iSYXR8rqZM0xIlpgvGgViGz/qPf3JrDjL3uG8PGSKwoO+2HmUDt7v
 jDenKxsGpdppLvEAKekeYyIPmEumGIiCVQy8VWZGk3JSNCEVRhhKO0Wuy6N8XO9hm1
 oYNq7scpmVHzN/z7Fb9aI4S+GchCL3dZ496h4GKKOrp8jPYXCxWZTQIZbeejvCD9VJ
 1dHBov7PDr4f5Hnigh7RPifIPojJ2NIFj07bkZykRW5c10IPfwLHjilPGG6zNFr1mv
 oDxhdadxu+/Dg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id B2F41C41612; Sun, 15 Jun 2025 08:52:49 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 220230] New: linux-firmware 20250613 breaks AMD iGPU
Date: Sun, 15 Jun 2025 08:52:49 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: therealgraysky@proton.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-220230-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220230

            Bug ID: 220230
           Summary: linux-firmware 20250613 breaks AMD iGPU
           Product: Drivers
           Version: 2.5
          Hardware: Intel
                OS: Linux
            Status: NEW
          Severity: high
          Priority: P3
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: therealgraysky@proton.me
        Regression: No

Upon booting the system with the tagged version of linux-firmware 20250613
installed, iGPU on the Ryzen 9950X does not work. The monitor does not dete=
ct a
signal and the following is printed to journalctl. Could this be related to=
 the
following commit?

e663dc7a2122 amdgpu: updates for dcn 3.20 and dcn 4.01 firmware to 0.1.10.0

journal output:
kernel: amdgpu 0000:76:00.0: [drm] *ERROR* dc_dmub_srv_log_diagnostic_data:
DMCUB error - collecting diagnostic data
kernel: amdgpu 0000:76:00.0: [drm] *ERROR* dc_dmub_srv_log_diagnostic_data:
DMCUB error - collecting diagnostic data
kernel: [drm:parse_hdmi_amd_vsdb [amdgpu]] *ERROR* EDID CEA parser failed
kernel: amdgpu 0000:76:00.0: [drm] *ERROR* dc_dmub_srv_log_diagnostic_data:
DMCUB error - collecting diagnostic data
kernel: amdgpu 0000:76:00.0: [drm] *ERROR* dc_dmub_srv_log_diagnostic_data:
DMCUB error - collecting diagnostic data
kernel: amdgpu 0000:76:00.0: [drm] *ERROR* dc_dmub_srv_log_diagnostic_data:
DMCUB error - collecting diagnostic data
kernel: amdgpu 0000:76:00.0: [drm] *ERROR* dc_dmub_srv_log_diagnostic_data:
DMCUB error - collecting diagnostic data
kernel: amdgpu 0000:76:00.0: [drm] *ERROR* dc_dmub_srv_log_diagnostic_data:
DMCUB error - collecting diagnostic data
kernel: amdgpu 0000:76:00.0: [drm] *ERROR* dc_dmub_srv_log_diagnostic_data:
DMCUB error - collecting diagnostic data
kernel: amdgpu 0000:76:00.0: [drm] *ERROR* dc_dmub_srv_log_diagnostic_data:
DMCUB error - collecting diagnostic data
kernel: amdgpu 0000:76:00.0: [drm] *ERROR* dc_dmub_srv_log_diagnostic_data:
DMCUB error - collecting diagnostic data
kernel: amdgpu 0000:76:00.0: [drm] *ERROR* dc_dmub_srv_log_diagnostic_data:
DMCUB error - collecting diagnostic data
kernel: [drm:parse_hdmi_amd_vsdb [amdgpu]] *ERROR* EDID CEA parser failed
kernel: amdgpu 0000:76:00.0: [drm] *ERROR* dc_dmub_srv_log_diagnostic_data:
DMCUB error - collecting diagnostic data
kernel: amdgpu 0000:76:00.0: [drm] *ERROR* dc_dmub_srv_log_diagnostic_data:
DMCUB error - collecting diagnostic data
kernel: [drm:parse_hdmi_amd_vsdb [amdgpu]] *ERROR* EDID CEA parser failed
kernel: amdgpu 0000:76:00.0: [drm] *ERROR* dc_dmub_srv_log_diagnostic_data:
DMCUB error - collecting diagnostic data
kernel: [drm:parse_hdmi_amd_vsdb [amdgpu]] *ERROR* EDID CEA parser failed
kernel: amdgpu 0000:76:00.0: [drm] *ERROR* dc_dmub_srv_log_diagnostic_data:
DMCUB error - collecting diagnostic data
kernel: amdgpu 0000:76:00.0: [drm] *ERROR* dc_dmub_srv_log_diagnostic_data:
DMCUB error - collecting diagnostic data
kernel: amdgpu 0000:76:00.0: [drm] *ERROR* dc_dmub_srv_log_diagnostic_data:
DMCUB error - collecting diagnostic data
kernel: amdgpu 0000:76:00.0: [drm] *ERROR* dc_dmub_srv_log_diagnostic_data:
DMCUB error - collecting diagnostic data
kernel: amdgpu 0000:76:00.0: [drm] *ERROR* dc_dmub_srv_log_diagnostic_data:
DMCUB error - collecting diagnostic data
kernel: amdgpu 0000:76:00.0: [drm] *ERROR* dc_dmub_srv_log_diagnostic_data:
DMCUB error - collecting diagnostic data
kernel: amdgpu 0000:76:00.0: [drm] *ERROR* dc_dmub_srv_log_diagnostic_data:
DMCUB error - collecting diagnostic data
kernel: amdgpu 0000:76:00.0: [drm] *ERROR* dc_dmub_srv_log_diagnostic_data:
DMCUB error - collecting diagnostic data
kernel: amdgpu 0000:76:00.0: [drm] *ERROR* dc_dmub_srv_log_diagnostic_data:
DMCUB error - collecting diagnostic data
kernel: [drm:parse_hdmi_amd_vsdb [amdgpu]] *ERROR* EDID CEA parser failed
kernel: amdgpu 0000:76:00.0: [drm] *ERROR* dc_dmub_srv_log_diagnostic_data:
DMCUB error - collecting diagnostic data
kernel: amdgpu 0000:76:00.0: [drm] *ERROR* dc_dmub_srv_log_diagnostic_data:
DMCUB error - collecting diagnostic data
kernel: [drm:parse_hdmi_amd_vsdb [amdgpu]] *ERROR* EDID CEA parser failed

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
