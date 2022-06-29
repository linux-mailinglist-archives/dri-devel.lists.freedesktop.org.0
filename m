Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2669C55F22A
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 02:03:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55CFC11BB13;
	Wed, 29 Jun 2022 00:03:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDA0111BB13
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 00:03:33 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1DA3DB81F16
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 00:03:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CB382C341C8
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 00:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656461010;
 bh=thb8MvuIBSxYiZbLY9st6AnMrqkegndS/9Ixpcs+pGs=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=u4YPK+5CjJmiY6sMfXV2RgdQA/UkbK4zpoul02p7G4GU39k68Xv1Uljsm0sJhPNwg
 DzNcAM2CgCJrQmMu6xAzns7yyGv6GKBsqSRbKpFZO6pe7/pxGzVswAAFEnq/VnXq8i
 FinsT0A9v74Kz5zRbxGxGYlqWtvUM+M67vPL1XlbzU7Jm8pZnroxSNtgaejeHjiF2n
 UoqCCFmOWr0TgWmq59Skkl4mmsgsIVE+QpFODU6deaYyZuX6QX66CQ1m1KMw5PaquH
 vYQF6wfWRQGpMK5r99+Jahzd3X46bNgLmAxV+321rGIecZfZ8KURGiOBHH9C/QQEeF
 V06sRT6EfqKbQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id B32ABC05FD5; Wed, 29 Jun 2022 00:03:30 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216173] amdgpu [gfxhub] page fault (src_id:0 ring:173 vmid:1
 pasid:32769, for process Xorg pid 2994 thread Xorg:cs0 pid 3237)
Date: Wed, 29 Jun 2022 00:03:30 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: witold.baryluk+kernel@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216173-2300-GbwngjPtEb@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216173-2300@https.bugzilla.kernel.org/>
References: <bug-216173-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216173

--- Comment #9 from Witold Baryluk (witold.baryluk+kernel@gmail.com) ---
Bisected:

9cad937c0c58618fe5b0310fd539a854dc1ae95 is the first bad commit
commit c9cad937c0c58618fe5b0310fd539a854dc1ae95
Author: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Date:   Fri Apr 8 04:18:43 2022 +0530

    drm/amdgpu: add drm buddy support to amdgpu

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
