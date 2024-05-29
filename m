Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA23E8D34B5
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 12:42:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 891EC1137CB;
	Wed, 29 May 2024 10:42:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QmD5CQ+1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A7B41137CB
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 10:41:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 36074CE0FBB
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 10:41:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 67207C32786
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 10:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1716979315;
 bh=XUM6h9rbYyJh5pFVforU5o4p1e1hDKm400FvtU33yaU=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=QmD5CQ+1TpTKeDt22ScF5SLZ95+Z2Ov95m7M+4+nEMOy4w4tT28vFDegnbGAOlubT
 XnD5LgNR0pRNcP+k4M6spwb33jHZ4Pb0bDZ5lJEQ7DITXDmfqvM5BJ7Z0Ax9gSp9Ze
 4ut2tfxUvuRkjSoz3eYcVu3n33qH2e+4Y5YNEKRNOD+nOnSktIIeQmdV0tveM1/00G
 eFywaMfUxKMdBGCbGon0gvpUURcQ2ht2pDSrLkvQdgyH9NSg020XWfwmp/OiKwy9WF
 9paByg1Ct66hO7GYI53iLaWCTmPupSBJw9TYSJgL+kc+hi5+Svj4jEwkLlgMCDT5Zd
 NjAiglgWj/EMQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 5F2C8C53B73; Wed, 29 May 2024 10:41:55 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 218900] amdgpu: Fatal error during GPU init
Date: Wed, 29 May 2024 10:41:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: vasant.hegde@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218900-2300-mmo0Qd9Z0G@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218900-2300@https.bugzilla.kernel.org/>
References: <bug-218900-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218900

--- Comment #9 from Vasant Hegde (vasant.hegde@amd.com) ---
(In reply to Jean-Christophe Guillain from comment #8)
> Hi,
>=20
> I plan to finish the bisection today, and I'll test your patch.
>=20

You mean bisecting for this issue? If so we know the culprit commit. Issue =
is
happening because IOMMU driver tried to enable PPR bit in DTE without check=
ing
Enhanced PPR support in EFR register.



-Vasant

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
