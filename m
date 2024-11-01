Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75DA49B8E8C
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2024 11:04:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA85A10E834;
	Fri,  1 Nov 2024 10:04:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EdoxWvjL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF83F10E834
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Nov 2024 10:04:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 572A5A41A45
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Nov 2024 10:02:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B6197C4CECD
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Nov 2024 10:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730455487;
 bh=ExCz1r6ef+EANIv06xlZ973J3oSuTMnVxu2ZEmxXMkc=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=EdoxWvjLtsgU4cLacaGPKWU8UxVJ7xbf8PsqAeUUqlnmtPvdx55zALwLhXMnpXB8R
 oNC4vj/Dfmg/8cY+Z2Jk0HUuOOgBNRkPTc5Ja/BuAynzdbT3/gmCgT4iF6xokTTUwZ
 WuiqDE+YieGxsuadSOQuorsvomBYC3i54K597RoK0AkSlRmda+c6YjqOBKaO3h+kPU
 tcaJpkw3/3esZ1WOPRljPA6sLr1twA2bq5hBSmDW0x9VcmyEUwOuQvKMoP+BmDA8zf
 cf4c0EcXxlnHyfPm7VOwNpHFpDTN7SYP/b1dBYLbBjx4s93uheKWzt5JuHCHVqFAGO
 y0AXo7kvp+Huw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id A632BC53BC9; Fri,  1 Nov 2024 10:04:47 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 206225] nouveau: Screen distortion and lockup on resume
Date: Fri, 01 Nov 2024 10:04:47 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: lukasz.wojnilowicz@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-206225-2300-RnaBHcwJgG@https.bugzilla.kernel.org/>
In-Reply-To: <bug-206225-2300@https.bugzilla.kernel.org/>
References: <bug-206225-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D206225

lukasz.wojnilowicz@gmail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |lukasz.wojnilowicz@gmail.co
                   |                            |m

--- Comment #13 from lukasz.wojnilowicz@gmail.com ---
We have 2024 and https://nouveau.freedesktop.org/KernelModuleParameters.html
(updated in 2024) still recommends using nouveau.config=3DPCRYPT=3D0 instea=
d of
nouveau.config=3Dcipher=3D0.

I believe that correct names can be taken at
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/dri=
vers/gpu/drm/nouveau/nvkm/engine
from the directory names.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
