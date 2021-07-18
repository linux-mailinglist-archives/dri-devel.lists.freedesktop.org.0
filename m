Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C7C3CCB86
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jul 2021 01:18:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CE1689EBD;
	Sun, 18 Jul 2021 23:18:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 667BF89EBD
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Jul 2021 23:18:35 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id EF37060FD7
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Jul 2021 23:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626650315;
 bh=zsOiteVFoQZniSnEJVBnXyWbPcihjEYdKrmF2SPqE44=;
 h=From:To:Subject:Date:From;
 b=RsYq4+fD65mPDlh5O9aNB9ZH0ze8QGhdOGCJ78XUMMbEsExPsSTUe2PK/TEhIdjUz
 UgTmk7b1qJIZuUze6/rdysohemaFep1S3Bc1f+0ZpTHge2daGUWHlB6QQ8J7O8AGLP
 6SyiL1qihE1l0w3jL8nzt4qJnW0+EFpo5zWH9vevb3ZF+ez+PWRcv4XXxqKSXLnnET
 Yz3BGc5Z0VJr2tWVE0jrW+CjOOArZwz4GkzfLps25XflTPFlnrKaPs1abu9HCCom+t
 luTWCy9X/QAtOswwDLMF++CIvt3H3oETQWItZ4ApDMC5EUmIuQ9LC8BnPsmoHhUJeg
 FPWzvYlJfIqhw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id E57CB61106; Sun, 18 Jul 2021 23:18:34 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213779] New: Screen  stays blank on resume. from hibernate
Date: Sun, 18 Jul 2021 23:18:34 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: alex14641@yahoo.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-213779-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213779

            Bug ID: 213779
           Summary: Screen  stays blank on resume. from hibernate
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.13
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: high
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: alex14641@yahoo.com
        Regression: No

If I close my laptop lid and reopen it, the screen stays blank. Reverting t=
he
following commit fixes the issue:

commit 9127daa0a8d88a6e6452eb8b7c9be4c3f42a867e
Author: Stylon Wang <stylon.wang@amd.com>
Date:   Tue Mar 2 19:25:56 2021 +0800

    drm/amd/display: Guard ASSR with internal display flag

    [Why]
    ASSR enabling only considers capability declared in DPCD.
    We also need to check whether the connector is internal.

    [How]
    ASSR enabling need to check both DPCD capability and internal display
    flag.

    Signed-off-by: Stylon Wang <stylon.wang@amd.com>
    Reviewed-by: Harry Wentland <Harry.Wentland@amd.com>
    Acked-by: Anson Jacob <Anson.Jacob@amd.com>
    Tested-by: Dan Wheeler <daniel.wheeler@amd.com>
    Signed-off-by: Alex Deucher <alexander.deucher@amd.com>

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
