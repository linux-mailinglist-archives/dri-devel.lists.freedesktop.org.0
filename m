Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C489D48346B
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jan 2022 16:48:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64AF389996;
	Mon,  3 Jan 2022 15:48:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D35189996
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jan 2022 15:48:03 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5ECD361156
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jan 2022 15:48:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C986FC36AF1
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jan 2022 15:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641224881;
 bh=xqnydNyhdQXcp2zzLBDlgzqT1EYkZtLos1459BIT6vI=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=hx0W2qqGftJxxP+iR43tTGdUc1hIP0YAbP3c6QzEcbzKAFGaUScwYHUGNmlPDa6L/
 JS/0FyhMEYUorycElae8ysPmE4nvlvTvlFm5gGiFB35+5aj8R9Uob5toDOwSOwz9cr
 LROOR4T0ADrz7bP+AaQS6NjeVPoggKelateI0GcisYy3h67k91voOq2ET5ilCEkCR+
 65dS1kIHKayYWg9MUVqlmlo/sILu2FEcVoXAfaKyeU/kLVFULV0GTd62P18JBBpgEo
 gdRM/KI79FZHvOyIUSydhQBf6EnW4m3nSzMYbxBOMwwSpM7fk3zwlylxak23+wuRT6
 k3VIz5DvGiW7A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id B0894C05FD7; Mon,  3 Jan 2022 15:48:01 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215436] admgpu: suspend and resuming from suspend don't work
Date: Mon, 03 Jan 2022 15:48:01 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc attachments.created
Message-ID: <bug-215436-2300-a0piM9yQWE@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215436-2300@https.bugzilla.kernel.org/>
References: <bug-215436-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215436

mario.limonciello@amd.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mario.limonciello@amd.com

--- Comment #15 from mario.limonciello@amd.com ---
Created attachment 300214
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D300214&action=3Dedit
Possible patch that ignores WA in s0ix

Actually this is more like what I was suggesting.  It effectively doesn't u=
se
the WA during s0ix suspend or resume.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
