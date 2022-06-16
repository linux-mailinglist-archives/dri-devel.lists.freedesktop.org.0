Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A7554ECEC
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 23:57:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADF8110ED8A;
	Thu, 16 Jun 2022 21:57:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0687510ED8A
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 21:57:07 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CA1A761EF6
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 21:57:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3A2C1C34114
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 21:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655416625;
 bh=mHxvFjdweqsL0pTi0rwGYTQeGZ2IoG05fnx1thkFikA=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=ioiBWr/JUHj9AfqokaStul83i/djYz+b+idXDcDXUSWi1qvbBaLr1aKss3PzL8JOE
 Q8vwEFzzUEvdWncp47lYNqiO8vqjOIuIeD7CwC/W8W2GbH3IW4vmqBD0tZYebtYnsV
 Q/SViww6HTy/uA33LA803fs0/soUCH1/mnPzGuG7oAuS5i228aewlLM/MnitgxZep9
 I3UqV4bI3wSzVGn/Gbe2vlIaqfllt3TAYUOLkbOFa1AoqHnfHoWQGvioPrVpfXxO+9
 WKbvE6H/OVoZjS5UQsqBgORkrY6J11lY4T92tEQMWAmFPWxM05s/dmK4h+ZRSjNYv1
 t4U9Vwt/ciTmg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 24287CC13B3; Thu, 16 Jun 2022 21:57:04 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216119] 087451f372bf76d breaks hibernation on amdgpu Radeon R9
 390
Date: Thu, 16 Jun 2022 21:57:03 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216119-2300-NhwkqwrIMT@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216119-2300@https.bugzilla.kernel.org/>
References: <bug-216119-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216119

--- Comment #11 from Alex Deucher (alexdeucher@gmail.com) ---
Does changing the the prefer_shadow hint help?  E.g., something like:

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index c2bc7db85d7e..4b6bd1a5804a 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -3852,7 +3852,7 @@ static int amdgpu_dm_mode_config_init(struct
amdgpu_device *adev)
        adev_to_drm(adev)->mode_config.max_height =3D 16384;

        adev_to_drm(adev)->mode_config.preferred_depth =3D 24;
-       adev_to_drm(adev)->mode_config.prefer_shadow =3D 1;
+       adev_to_drm(adev)->mode_config.prefer_shadow =3D 0;
        /* indicates support for immediate flip */
        adev_to_drm(adev)->mode_config.async_page_flip =3D true;

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
