Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87134A63B39
	for <lists+dri-devel@lfdr.de>; Mon, 17 Mar 2025 03:16:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DE7A10E296;
	Mon, 17 Mar 2025 02:16:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bpIFRBEw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8227310E296
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 02:16:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 4E69FA48CD5
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 02:10:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9F17FC4CEEE
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 02:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742177765;
 bh=CAwI6vCtXruff3qjcDseQVJno3Jcs50Mvf5DruhnOi8=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=bpIFRBEw6O7oBC0CPfSq8y84xxbyDPZYRCeQIHeN2slMQFzggpCLnVCTW1jE4WkC1
 ZqcSZmpBSNbGFjRU4615T7DKlyWgi5vdB4jz3QdEGlrhqDha+AV4Js1uBiGJNpMu87
 K5LJ69gjL9wexvhxB31rd5ct7muwZQRtI2uKfzI9OFfaRSIv9W75lwj69ja8bhgk0+
 /HNMfv8KckBzEHEyONVUgPtHZoA7kLS7zOuCvjNBgP78kuiw7/cXY4pn710zYMDJ69
 42kI7owAs2hjjxcsVymAQNpjeK3FQ19JK6PJDiGk5wF+Ebku63QkzXfc1NG6TMtKYT
 BKlozUD3OTlJg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 96D10C53BC5; Mon, 17 Mar 2025 02:16:05 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 219888] amdgpu: Oops connecting HDMI/DVI/DP on HD 7850 (Pitcairn)
Date: Mon, 17 Mar 2025 02:16:05 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: alexandre.f.demers@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219888-2300-1w2e4jqdFN@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219888-2300@https.bugzilla.kernel.org/>
References: <bug-219888-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219888

--- Comment #5 from Alexandre Demers (alexandre.f.demers@gmail.com) ---
bisecting found out the following culprit:

e6a901a00822659181c93c86d8bbc2a17779fddc is the first bad commit
commit e6a901a00822659181c93c86d8bbc2a17779fddc (HEAD)
Author: Wenjing Liu <wenjing.liu@amd.com>
Date:   Wed Apr 17 15:23:08 2024 -0400

    drm/amd/display: use even ODM slice width for two pixels per container

    [why]
    When optc uses two pixel per container, each ODM slice width must be an
    even number.

    [how]
    If ODM slice width is odd number increase it by 1.

    Reviewed-by: Dillon Varone <dillon.varone@amd.com>
    Acked-by: Wayne Lin <wayne.lin@amd.com>
    Signed-off-by: Wenjing Liu <wenjing.liu@amd.com>
    Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
    Signed-off-by: Alex Deucher <alexander.deucher@amd.com>

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
