Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C223558E04A
	for <lists+dri-devel@lfdr.de>; Tue,  9 Aug 2022 21:39:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83431A38BE;
	Tue,  9 Aug 2022 19:38:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C3788B756
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Aug 2022 19:38:25 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1B5A46133D
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Aug 2022 19:38:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7D57DC4347C
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Aug 2022 19:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660073902;
 bh=lpeksKkm2WlmXmIwBmNdc+g2SPoUND+xS79BF+W8siY=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=JrBul86eNuqmiG54w3LVL8ArlZcJqSsoKei2FlOn4w1OGedMRkuzyU2DqEUk5vWv2
 2pE7vpOpXa1xVMl1fa7WUAsYsJ1aB16Ajln0P5C8kgVcjS5Oowhy3v10NOxubTPyeU
 RmBQXrqtnCjH6S0G4C6EtUX2mHqcsL6p3VTcSyYWh+W0nznM08bn7BT0wUwgZxZy/e
 UgtkOX56iFZs+bMzH+N+jVGuOcY+gm+yIKEfJ2zlkXVR0SzVIqzIZwfu/gxiWAu1IU
 7Dl7fE+WnK0cHnAzGMNgmGR6X2p9CxXzjOeq6o4xHU3qFfhlUxyPRPNiToScbDr+H7
 LQ2qcjorFJ8kQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 6857BC433E9; Tue,  9 Aug 2022 19:38:22 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216119] 087451f372bf76d breaks hibernation on amdgpu Radeon R9
 390
Date: Tue, 09 Aug 2022 19:38:22 +0000
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
Message-ID: <bug-216119-2300-ZtzFHY5G8h@https.bugzilla.kernel.org/>
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

--- Comment #38 from Alex Deucher (alexdeucher@gmail.com) ---
(In reply to Harald Judt from comment #36)
> Maybe these are also relevant, they occur right after resuming, before all
> those other messages:
> [drm] Fence fallback timer expired on ring sdma0
> [drm] Fence fallback timer expired on ring sdma0

Those are usually a sign of interrupt issues on the platform.  E.g., interr=
upts
not being proper enabled on the platform after resume.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
