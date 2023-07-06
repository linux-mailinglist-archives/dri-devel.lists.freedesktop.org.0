Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FFF7749FD0
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jul 2023 16:51:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E255410E419;
	Thu,  6 Jul 2023 14:51:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8C1610E419
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jul 2023 14:51:49 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 699916199C
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jul 2023 14:51:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CF024C433CC
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jul 2023 14:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1688655107;
 bh=1H/rUbZFAuVKVCFigajJvkCQpB2t8Ly1b8f3TEKjues=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=rV50BTmxvZ/o9NYJRsW57y6dDIWFA1/o8+m2RDsgF2cO0spIXiVLCfkc4eg+2+1on
 nxOAAXrTb9GUtDWAYwWV1T0Xs6ByAwtneFBsiV2px04P6a9XbdYdNU5gVM9VaHz4qq
 ent6OvwSQRTJT5TDE+mcTa50RHXaP8S+fBBD2r6hmX/Fu8YhXs0LKVYH5Tp+DYCN2G
 V65pSAbRUy8Mpc48P0z+lY7Wl5HA11BfVOl6Dx4GWLH7m9t8zUZ6yFzTgSmYBq6/W6
 7GZQlIZRspD+E0qeN7uBRYM9C8eqyxnlKhOV/pJrC3Amq+nyp2pP8KmOiWnYZw487r
 nRComgWFky/IQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id BA463C53BD4; Thu,  6 Jul 2023 14:51:47 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216119] 087451f372bf76d breaks hibernation on amdgpu Radeon R9
 390
Date: Thu, 06 Jul 2023 14:51:47 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: PATCH_ALREADY_AVAILABLE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216119-2300-dxN7CEAYDi@https.bugzilla.kernel.org/>
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

--- Comment #57 from Alex Deucher (alexdeucher@gmail.com) ---
Does this patch help?
https://gitlab.freedesktop.org/drm/amd/uploads/64dc2a05039b583e89da17309969=
fa50/0001-client-register-fix-plus-fbdev-debug-noise-2.patch

It's pretty noisy.  The meat of the patch is this hunk:

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helpe=
r.c
index 76e46713b2f0..5d28c54b2512 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -2634,10 +2678,12 @@ void drm_fbdev_generic_setup(struct drm_device *dev,
                preferred_bpp =3D 32;
        fb_helper->preferred_bpp =3D preferred_bpp;

+       drm_client_register(&fb_helper->client);
+
        ret =3D drm_fbdev_client_hotplug(&fb_helper->client);
        if (ret)
                drm_dbg_kms(dev, "client hotplug ret=3D%d\n", ret);

-       drm_client_register(&fb_helper->client);
+       drm_warn(dev, "%s:%d\n", __FILE__, __LINE__);
 }
 EXPORT_SYMBOL(drm_fbdev_generic_setup);

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
