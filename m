Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 987B83E3C7E
	for <lists+dri-devel@lfdr.de>; Sun,  8 Aug 2021 21:18:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DB9C89ABA;
	Sun,  8 Aug 2021 19:18:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77CD889ABA
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Aug 2021 19:18:02 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 48C846054E
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Aug 2021 19:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628450282;
 bh=+xFD91bL0ilDLAHwP6CPHFZoP70wSyDL/oNdeiPsBzc=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=cHRohv0Pqnd4nS+Lm2oWinH+t/QTnmm5RyyeGz/nz+Rqa+QJkbgm1K5Ztk2j/tKxy
 9Wj3E/8HHL/HWrpDFmuB3hPulvnpAOaXa8z8BI4JsWvdABfwKpdY0v/ptquSMeYsyb
 tolpZAW7QjOaM9jgDHstXS+Bz9/B0vixXeawiu1qxIFc+RIIquH01phmPP8SE/HfrO
 0rITuqBOqMaoX+y2XaLJ+C0xG3jMe7yflc7BtoeElPk6Mc0clGZZ7lucl2B++iN5jS
 joZXeQMtYdxErw/bve5XYAAmRz2YRGa5Q4VG54f6T/mACI5Q7jhFyYejce/moxG/G1
 cwudDOCXUlrtA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 3F2A760FD8; Sun,  8 Aug 2021 19:18:02 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214001] [bisected][regression] After commit "drm/ttm:
 Initialize debugfs from ttm_global_init()" kernels without debugfs explicitly
 set to 'allow all' fail to boot
Date: Sun, 08 Aug 2021 19:18:02 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: untaintableangel@hotmail.co.uk
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214001-2300-FbLOkMqpjr@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214001-2300@https.bugzilla.kernel.org/>
References: <bug-214001-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214001

--- Comment #1 from Linux_Chemist (untaintableangel@hotmail.co.uk) ---
As an addendum, I suppose a slight source of confusion is the info for=20

CONFIG_DEBUG_FS which reads:

"debugfs is a virtual file system that kernel developers use to put
debugging files into. Enable this option to be able to read and
write to these files.

For detailed documentation on the debugfs API, see
Documentation/filesystems/.

If unsure, say N."

which implies: a) that it isn't strictly necessary to have enabled in order=
 to
boot/run normally (highlighting this bug) and b) that you would have zero n=
eed
for it if you weren't reading/writing to these debugging files.=20


To then have the option to enable debugfs but only run minimally with
CONFIG_DEBUG_FS_ALLOW_NONE:
"Access is off. Clients get -PERM when trying to create nodes in
debugfs tree and debugfs is not registered as a filesystem.
Client can then back-off or continue without debugfs access."

leaves the question of 'why have it on and set to "allow none" rather than =
off
completely?'

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
