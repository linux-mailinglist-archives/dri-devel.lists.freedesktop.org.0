Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7571AB84340
	for <lists+dri-devel@lfdr.de>; Thu, 18 Sep 2025 12:46:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D02B510E6C2;
	Thu, 18 Sep 2025 10:46:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LLKocsik";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BD2C10E6C2
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 10:46:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A235443D58
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 10:46:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 82B90C4CEFA
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 10:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758192365;
 bh=KdAqfrPb3jXE9fPoYSEwCLrxbaq6Lo52gXsKQ8Q1Pho=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=LLKocsikuJGxuEuuHMzXEZjLVoTATdyAN8Bmy1K7skJVuluoPto+QH+vqqtzuQ6Xv
 XKDK6X71L0hKYuZDv0mJoZyddAqzeRbPSNgw3vexv6SwUsF6lPS4PnDQdHOK342s5O
 Es4dMkrDlI7LpDPcBzjElhveyCdXQV6u1WybgzZ+GJ3Rh4uZJZRe+KKAnseK0i8e6G
 z06+H8xjlhbff3hJD+BQf4efuGQ89r7l0m8pdEjTGu29HYyIlm/rNZE6lycEDQFSoU
 b3t6QszYiyabLUlP8pGEBJMzxzhAJSRhySbFOrcr1wXyvzlLVGRw/kbVNEavcNbDbz
 w0cPk8vlPNcNA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 7A5E0C41614; Thu, 18 Sep 2025 10:46:05 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 220428] UBSAN array-index-out-of-bounds warning in
 radeon_atombios.c on kernel 6.15.9 with AMD Radeon HD 6250
Date: Thu, 18 Sep 2025 10:46:05 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: r.szwajkowski@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-220428-2300-GcaOO7Nu4O@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220428-2300@https.bugzilla.kernel.org/>
References: <bug-220428-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220428

--- Comment #2 from r.szwajkowski@gmail.com ---
Created attachment 308692
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D308692&action=3Dedit
stack trace with 2 errors on 6.16.5-200.fc42.x86_64

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
