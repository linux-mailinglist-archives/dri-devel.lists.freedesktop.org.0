Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 099D365BFB8
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jan 2023 13:16:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E6FB10E197;
	Tue,  3 Jan 2023 12:16:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B18310E197
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jan 2023 12:16:26 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C0314612D5
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jan 2023 12:16:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C4124C43396
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jan 2023 12:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1672748184;
 bh=jC0DzV6H0cSzXMKtvRjcXKdGj9DB7TBMvIuybptfLH4=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=oRwmidD9C6Pl0EQhLNvD/bHLWUX23b5BI9oFIrHOYocH+0Jw4z0DeumAmREPOLCJi
 ejPEeB5hR1SAhZL41ZYKfogd7FjXZMCqvFGWPnA6PoBcpZNBt3wEwh73hZaVfFBfwi
 cVk+qQane+tJUuRDxKb/aa4cXuildLkpm4IISFVeN3PelGfJD8f9ClyMlYMSlNmPwl
 XRa5v+o1hzCJuctqG7N8yuqyytyAfXKzpDYBa49mbwKKhH1oKaDxCN53zSygHq1VHE
 2A9fBc3EfvM059h+wiIYgMWdgvRLFLGLsQkxpSH0TZEGSm5Edc1YruLJ4OocJXpH9R
 IWyTLUTSKicpg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id B4DBBC43141; Tue,  3 Jan 2023 12:16:24 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 172421] radeon: allow to set the TMDS frequency by a special
 kernel parameter
Date: Tue, 03 Jan 2023 12:16:24 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: enhancement
X-Bugzilla-Who: blade@debian.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-172421-2300-PXdyQNK8CV@https.bugzilla.kernel.org/>
In-Reply-To: <bug-172421-2300@https.bugzilla.kernel.org/>
References: <bug-172421-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D172421

Eduard Bloch (blade@debian.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |blade@debian.org

--- Comment #24 from Eduard Bloch (blade@debian.org) ---
Hey guys, I am trying to port this mod to AMDGPU. The intention is, however,
not to unlock the advertised features but to force an APU to accept HDMI cl=
ocks
over a DVI port (with DVI-HDMI cable, the monitor expects HDMI signal).

The port itself is easy but it does not work. amdgpu.hdmimhz=3D... paramete=
r has
apparently no effect, Xorg keeps reporting:

[    16.107] (--) AMDGPU(0): HDMI max TMDS frequency 280000KHz

Does anyone have an idea how to tackle this?

Here is the patch:
https://github.com/Code7R/linux/commits/amdgpu-custom-maxtdmsclock

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
