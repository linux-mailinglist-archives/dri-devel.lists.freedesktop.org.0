Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33604612BAF
	for <lists+dri-devel@lfdr.de>; Sun, 30 Oct 2022 17:57:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 505EE10E10B;
	Sun, 30 Oct 2022 16:57:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9059A10E10B
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Oct 2022 16:57:22 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D895C60F0C
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Oct 2022 16:57:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CD9CAC43143
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Oct 2022 16:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667149039;
 bh=LYtBqNKJsz4p071BQBDnoWOCu8aKYsARDEMe4jRB6tk=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=HkDG8aaLUkg7zmvS3WDa1g/sDPE0PgVTPyx61i+VNEShmpPM+l4tNkCo5m+Z16djz
 4MgNI3Krd8+TguUcHeYFZpbvCLeSnD1OpVSBiOUqot4k4nXB7XvsX1g2wmND3hk3BQ
 tmU6R6T5KyQiQ2WneWsw8kc0D6UGSLybAqOJ9DFI3lr5p/LyaLLwLMUQ9cDBxDMzS3
 nHf/z4JR8OUc1yW0eYxDw/4N2uADNNYw5LsO8KGui9MqL+HoxMwx5KclSgcqWcCA2J
 T8iQRqD/81QySxObMDqjiXs2EQYBVs6nWswDyQSMj2Nt0RxkIBs+e9Fq1uqPAPDRGs
 FT/C8EmmPFPng==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id BA6FAC433E4; Sun, 30 Oct 2022 16:57:19 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213145] AMDGPU resets, timesout and crashes after "*ERROR*
 Waiting for fences timed out!"
Date: Sun, 30 Oct 2022 16:57:19 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: nvaert1986@hotmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-213145-2300-rlwYNCLoEO@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213145-2300@https.bugzilla.kernel.org/>
References: <bug-213145-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213145

--- Comment #27 from nvaert1986 (nvaert1986@hotmail.com) ---
(In reply to rv1sr from comment #24)
> Do you guys by any chance use KWin?
>=20
> Had experienced this exact issue on a daily basis (kernel 5.19 + amdgpu),
> especially while running Firefox or Vivaldi.
>=20
> After setting the following environment variable in /etc/environment two
> weeks ago, the issue no longer persists.
>=20
> KWIN_DRM_NO_DIRECT_SCANOUT=3D1

I tried this for a couple of days, but after a few days Xorg still crashed
unfortunately. It does seem to be less frequent though.

plasmashell[1280]: amdgpu: amdgpu_cs_query_fence_status failed.
kwin_x11[1255]: amdgpu: amdgpu_cs_query_fence_status failed.
plasmashell[447733]: amdgpu: amdgpu_cs_query_fence_status failed.
plasmashell[447733]: Crash Annotation GraphicsCriticalError: |[0][GFX1-]: G=
FX:
RenderThread detected a device reset in PostUpdate (t=3D5437.93) [GFX1-]: G=
FX:
RenderThrea>
plasmashell[1280]: amdgpu: The CS has been cancelled because the context is
lost.
plasmashell[1280]: amdgpu: amdgpu_cs_query_fence_status failed.
plasmashell[1280]: amdgpu: The CS has been cancelled because the context is
lost.
plasmashell[447733]: ATTENTION: default value of option mesa_glthread
overridden by environment.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
