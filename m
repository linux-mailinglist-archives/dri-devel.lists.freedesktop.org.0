Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB34D37B336
	for <lists+dri-devel@lfdr.de>; Wed, 12 May 2021 02:50:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A385F6EB3E;
	Wed, 12 May 2021 00:50:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 920496EB3E
 for <dri-devel@lists.freedesktop.org>; Wed, 12 May 2021 00:50:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id AB5336192B
 for <dri-devel@lists.freedesktop.org>; Wed, 12 May 2021 00:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620780641;
 bh=+OUVeuS1PBXJfpG0E5rCfEQAllJQMGrpYEa+Fhr0raA=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=YR5FNEhiCQG143Mr+xjuEFyzTLRYYzlndXS1mT2Yb6SWRlg0mc7lr6rQqKYOw+V6A
 NXoxBV2V3AlA0VR1JDfit3TitrBrl8Qgpqes9clxgWi3HtLTXy6Gu/lQpufTl7qQUn
 wnlXb+Ye2ShbwtQEdMO6olRGtIjqgclWa1gSkXFWXTeIxrJl/AHKC3KSj47xe0h7Vm
 XYfpvJ8HqXY1qST9daW8eoZyY5dsyxqqsnN9bmQtCKu7lgOU3aT5n5yIfWWOVAKA2W
 PhlZy2kFw/WC70F08re6geb1urnLtbECWzQI9WihXhQpG/+rd9dIFs8qFvSv/M8Doq
 BkL5tpMtP24cg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 9C62161264; Wed, 12 May 2021 00:50:41 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212957] [radeon] kernel NULL pointer dereference during system
 boot
Date: Wed, 12 May 2021 00:50:41 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: mail@dennisfoster.us
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-212957-2300-VZCtg2RazP@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212957-2300@https.bugzilla.kernel.org/>
References: <bug-212957-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D212957

--- Comment #3 from Dennis Foster (mail@dennisfoster.us) ---
(In reply to Alex Deucher from comment #1)
> Can you bisect?

0575ff3d33cd62123991d2a5d0d8459d72592388 is the first bad commit
commit 0575ff3d33cd62123991d2a5d0d8459d72592388
Author: Christian K=C3=B6nig <christian.koenig@amd.com>
Date:   Thu Oct 8 13:01:35 2020 +0200

    drm/radeon: stop using pages with drm_prime_sg_to_page_addr_arrays v2

    This is deprecated.

    v2: also use ttm_sg_tt_init to avoid allocating the page array.

    Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
    Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
    Link: https://patchwork.freedesktop.org/patch/403832/

 drivers/gpu/drm/radeon/radeon_ttm.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)


I wasn't able to revert this commit on v5.12, because there's another commit
c67e62790f5c156705fb162da840c6d89d0af6e0 where it seems like that file was
changed drastically, in particular drm_prime_sg_to_page_addr_arrays() was
replaced with drm_prime_sg_to_dma_addr_array().

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
