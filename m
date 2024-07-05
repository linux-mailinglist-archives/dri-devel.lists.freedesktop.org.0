Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E22928C1F
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2024 18:14:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 047A510EBFC;
	Fri,  5 Jul 2024 16:14:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MlsJsObI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9B0D10EBFC
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2024 16:14:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id E938ECE3E4D
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2024 16:14:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BF638C116B1
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2024 16:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1720196051;
 bh=1fZn6cMgw8jRXvrTwn5rfA7mH3k2Qhvgqn8wWQWp9zQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=MlsJsObIxNMVICEq0vrSUKRI+rYLYR9zIzujZ3NKZzaX/gEMyN3ZdThnp7JHW6tTX
 CCGYdGyZtROu/Zt5YubYze69cN2rdGSk/tJZ2YWX23c7a/GvEabEaGNmtrGALHX4f0
 qMcB9hLGfG9PA9TaFkegWBM0Cot90DVOznSLTziFqSM+hQFzT1PTxwFmeryQ0+/oOg
 ZTi8kf9howpsVPllL9YQfi0th/OZrq2Cp47V9MmUtG6ghXnDZd9DX2//2mLriaOabZ
 tDwMnpkWDnvKd1pJXPK2lBFpIaP8TFUvA0IVG+uiuIPdR8ZN2jYBOLMssD8SsFHHkT
 He6VJ+OdF/XPw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id B0091C53B7F; Fri,  5 Jul 2024 16:14:11 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 219007] opening and closing /dev/dri/card0 in a QEMU KVM
 instance will shutdown system, 6.10.0-rc6+
Date: Fri, 05 Jul 2024 16:14:11 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: colin.i.king@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219007-2300-wydBnbqP07@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219007-2300@https.bugzilla.kernel.org/>
References: <bug-219007-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219007

--- Comment #1 from Colin Ian King (colin.i.king@gmail.com) ---
Note this also can reproduce when running *without* root privileged too, so
this is a user space DoS attack vector.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
