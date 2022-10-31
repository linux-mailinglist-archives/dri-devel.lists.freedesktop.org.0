Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8CB613A58
	for <lists+dri-devel@lfdr.de>; Mon, 31 Oct 2022 16:40:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B515710E0E0;
	Mon, 31 Oct 2022 15:40:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F77010E0E0
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Oct 2022 15:40:26 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 204EB612FC
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Oct 2022 15:40:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8FC54C43145
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Oct 2022 15:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667230825;
 bh=ckqz1labugod+h9H+tBY8ExQe4ToBqDNozj5kGC7FFQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=IYt2x60RJC3O0juwLt+NJWmtsY4os+P1ikvfE75FkFqzuYntn4+AnKMOvDqJQA/AR
 jSZYhnNbk/1Gy7zi7clbcIfLHJmGxZ9xZ4E5+wWzdg5/8R6YFjxfcnkl2quKEI84n9
 CDt2EZszPwT0/AE7S45Kw6gm8ov7wuTy1UarFEse87Dy2ceRNjC1LT7TF4Ss/Y6dsF
 qpkLXzEV2D6DBZhFzs3v4ayNIWGi6HkR5YuYM6vd67r+baMaEKRuhXvzJ/FcD7E9ZW
 U2K6nekdZlhIefRZLuiFu60LvmWcuvdIa682YYcxL6WvdkQuXJg5qi1ekJ9ub33+9U
 t71Z1Gl0vT12Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 74176C433E6; Mon, 31 Oct 2022 15:40:25 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216645] Fence fallback timer expired on ring gfx
Date: Mon, 31 Oct 2022 15:40:25 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-216645-2300-HpZ0K50tEA@https.bugzilla.kernel.org/>
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

Alex Deucher (alexdeucher@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |alexdeucher@gmail.com

--- Comment #1 from Alex Deucher (alexdeucher@gmail.com) ---
(In reply to Martin =C5=A0u=C5=A1la from comment #0)
>=20
> Would someone also tell us which workaround should be used under which
> performace/latency requirements? ("Maybe wrong but still an" EXAMPLE: Use=
rs
> who need the best performace or lowest latency should use pcie_port_pm=3D=
off,
> users who need the best battery life should use amdgpu.msi=3D0.)
>=20

You should not need to override any of the defaults other than for debuggin=
g.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
