Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E27A393A37B
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2024 17:05:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5293110E5EF;
	Tue, 23 Jul 2024 15:05:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="P29ElVjE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E44110E5EF
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2024 15:04:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1B347612CF
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2024 15:04:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C3926C4AF09
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2024 15:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1721747097;
 bh=9yRMyiJ2tHsXghnGPN+xrajp8G4FgDslh6dBjOBa6P4=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=P29ElVjEluPgGjnwBtsEDLQarYXQXCW6aQzn1B19Kfzd9kaOK97vJFQ1ExGZURYHQ
 1s5CLKodUAmpptW1Yb3+IthnQolrChqR43xmMpRS3wmZh6V2fAc3D+dgpJ+2REizTp
 qb/ksIa2005jiik5kESqgBcenLSJY/Q1L4cCWWNfOUNc+NJOJWHGFBMKzQr0j1Hzgg
 zwgiYdbtIxEbEh0T+LyRsgWe7VX13soeWXt15kSYstH8Vaylgsl11rszGvvkK1rnKK
 u0p/uPYXN4SxArqquxltg6Gd0ebs6PlcX0y+ajlhto0nGVKahpFbzMKocTV75jGODt
 uMOhuqXNUbdEQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id B0951C433E5; Tue, 23 Jul 2024 15:04:57 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 219007] opening and closing /dev/dri/card0 in a QEMU KVM
 instance will shutdown system, 6.10.0-rc6+
Date: Tue, 23 Jul 2024 15:04:57 +0000
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
X-Bugzilla-Changed-Fields: cc attachments.created
Message-ID: <bug-219007-2300-plCooXTwCJ@https.bugzilla.kernel.org/>
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

Colin Ian King (colin.i.king@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |colin.i.king@gmail.com

--- Comment #5 from Colin Ian King (colin.i.king@gmail.com) ---
Created attachment 306610
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D306610&action=3Dedit
dmesg 6.10 log

Attached, dmesg log. Apologies for the delayed reply.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
