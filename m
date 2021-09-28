Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA84241B2DD
	for <lists+dri-devel@lfdr.de>; Tue, 28 Sep 2021 17:21:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B9D389F53;
	Tue, 28 Sep 2021 15:21:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A26889F53
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Sep 2021 15:21:21 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id F17556124B
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Sep 2021 15:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632842481;
 bh=ekXtLPPnFKFT9Q7CakRggZ/faN0yDXHylzq5142RCd0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=tyk/5XQFgMrXAxqzmWIQE3t6xRmdMoR4mG301onsfpwSISjJ4w2E3uLo5CRLnnzON
 CfO8S6V0sknNDDiNpAGxuSJ0D5OIAWAjDRlgbYsY4NIqu4fYJZiMGhzyGeL8wpNHPI
 xwRXFPXi7HR7XUCTCpyOKt1uqkVGKS5Ifzf8izXsx89wHsOPXle9dmODevqHd9yCov
 8KdnsOP0xSCoZ8SUT9dgH0WZr4TH1Rbr/DTQaknsw/cy1TaWte7SWX9tNpMWEyiRwi
 Z6limSYneGKIgBqjPx7SL4RaAP8nxk6dxo4rtsgpskswshgaZuhGiVHjCrZBZu1bV8
 eOCLKoyrTA4Bg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id EF00260EBE; Tue, 28 Sep 2021 15:21:20 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214029] [bisected] [amdgpu] Several memory leaks in amdgpu and
 ttm
Date: Tue, 28 Sep 2021 15:21:20 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-214029-2300-Ugs7hFgzqq@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214029-2300@https.bugzilla.kernel.org/>
References: <bug-214029-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214029

Erhard F. (erhard_f@mailbox.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |christian.koenig@amd.com

--- Comment #15 from Erhard F. (erhard_f@mailbox.org) ---
I got around skipping commits by cherry-picking
9551158069ba8fcc893798d42dc4f978b62ef60f (kfence: make compatible with
kmemleak) and finally was able to complete the bisect. The offending commit
was:

 # git bisect good
d02117f8efaa5fbc37437df1ae955a147a2a424a is the first bad commit
commit d02117f8efaa5fbc37437df1ae955a147a2a424a
Author: Christian K=C3=B6nig <christian.koenig@amd.com>
Date:   Sat Apr 17 19:09:30 2021 +0200

    drm/ttm: remove special handling for non GEM drivers

    vmwgfx is the only driver actually using this. Move the handling into
    the driver instead.

    Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
    Acked-by: Huang Rui <ray.huang@amd.com>
    Reviewed-by: Zack Rusin <zackr@vmware.com>
    Link:
https://patchwork.freedesktop.org/patch/msgid/20210419092853.1605-1-christi=
an.koenig@amd.com

 drivers/gpu/drm/ttm/ttm_bo.c       | 11 -----------
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c | 10 ++++++++++
 include/drm/ttm/ttm_bo_api.h       | 19 -------------------
 3 files changed, 10 insertions(+), 30 deletions(-)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
