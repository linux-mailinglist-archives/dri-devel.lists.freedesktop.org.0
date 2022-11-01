Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68BF16145DD
	for <lists+dri-devel@lfdr.de>; Tue,  1 Nov 2022 09:42:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C7CB10E2A3;
	Tue,  1 Nov 2022 08:41:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FBC910E2A3
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Nov 2022 08:41:52 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 07232B81BFB
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Nov 2022 08:41:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A8448C433B5
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Nov 2022 08:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667292108;
 bh=6BrIF/SGJjo5dBlIA1/LxjgjrVaHL1D1k4cC7tDXQ74=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=LMpVMQAg7m6hhMp/9Rl6JUrwR8qtMrblmlB59ERnPlppP6Oh70brn+MV0w/Nr5Thw
 frU8mcvkjLhXV5osQvPMozWISrshvpD/PmbIIo7BlDsFM0tL1SIsGnhBrbs6UQJFaq
 CN3f+oFzGmrXfT/CPBLBSOUdUyidLdmz2FMlngmh4I0a+GvsIwo1+lrwTEamM1yXhS
 +l+a8FBOcfqF8oHJ0/WZlaEob4Mt+2t0cdhB6L7c/mX3h7/riO5oi0InezYyw9BWzQ
 fAydNuwOzYovyS44gaPO7ZQnIKVNVuz+vJ8Yglj+jtKmZ37a67Us31+NWYddnP8kky
 PL64/Amp62nYw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 8DBCCC433E6; Tue,  1 Nov 2022 08:41:48 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216645] Fence fallback timer expired on ring gfx
Date: Tue, 01 Nov 2022 08:41:48 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ask4support@email.cz
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216645-2300-drONIl2F6h@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216645-2300@https.bugzilla.kernel.org/>
References: <bug-216645-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216645

--- Comment #7 from Martin =C5=A0u=C5=A1la (ask4support@email.cz) ---
Sure, the GPU (at 0000:03:00.0) being initialized before the message mentio=
ned
in the title appears is the dGPU. Line 1078 in the "Kernel log created by t=
he
script in the menuentry" confirms this as the APU (at 0000:07:00.0, line 11=
84)
doesn't use 6128M VRAM, it uses just 512M.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
