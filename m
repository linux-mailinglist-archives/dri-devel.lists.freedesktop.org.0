Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D5D3CAE57
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jul 2021 23:05:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E92646E8BB;
	Thu, 15 Jul 2021 21:05:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 124486E8BB
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jul 2021 21:05:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id E0A116128B
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jul 2021 21:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626383116;
 bh=ZNlz3mnSPyL35iPOwrqlEz/Qn3+XRjOw6qY3hM7Jr1g=;
 h=From:To:Subject:Date:From;
 b=Ymoo62dkIdaJXDyokJCt+V7fz+iavtV7F0i6oK4T6F1ABAYcnwSS1OMGTYoxth65X
 3jubOcKvPd8nScjepY2MQ0vpMXVMcK8DOZNcQCF9uEkK8hmb59+Fs/HAhygtEgpGUr
 ncUgQSDe5CVhS4G4hLLvYEJkfE64E5mvAP2NAdExqbooQyLIZDFmHs0eLuUiqKwZCT
 L/NHXU4DGQa3NBucaMZ196RNyPJstl6+A2rFB8nD6RT43lBrVgAXQaLUeiDz+7HeMe
 g41Vm7/Yz3rIf020vBst6O0FvTXLj7X61hdvgsOZgYcmMnEExsDzxg/ttAjT58q66h
 9tVeUypHSgHOQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id D5CCA612A6; Thu, 15 Jul 2021 21:05:16 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213751] New: KVM virt w/ qxl fails boot at latest 5.14.0-rc1+
Date: Thu, 15 Jul 2021 21:05:16 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: jpittman@redhat.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-213751-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213751

            Bug ID: 213751
           Summary: KVM virt w/ qxl fails boot at latest 5.14.0-rc1+
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.14.0-rc1+
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: blocking
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: jpittman@redhat.com
        Regression: No

KVM virt w/ qxl fails boot at latest 5.14.0-rc1+

Limited backtrace:

RIP: 0010:qxl_bo_move_notify.part.1+0xc/0x40 [qxl]
ttm_bo_cleanup_memtype_use+0x22/0x60 [ttm]
ttm_bo_release+0x1b0/0x310 [ttm]

Issue bisected to the below commit.

[root@localhost linux]# git bisect bad
bfa3357ef9abc9d56a2910222d2deeb9f15c91ff is the first bad commit
commit bfa3357ef9abc9d56a2910222d2deeb9f15c91ff
Author: Christian K=C3=B6nig <christian.koenig@amd.com>
Date:   Thu Apr 15 09:52:58 2021 +0200

    drm/ttm: allocate resource object instead of embedding it v2

    To improve the handling we want the establish the resource object as ba=
se
    class for the backend allocations.

    v2: add missing error handling

    Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
    Acked-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
    Link:
https://patchwork.freedesktop.org/patch/msgid/20210602100914.46246-1-christ=
ian.koenig@amd.com

 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c |  4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    | 54 +++++++++----------
 drivers/gpu/drm/nouveau/nouveau_bo.c       |  2 +-
 drivers/gpu/drm/radeon/radeon_ttm.c        |  2 +-
 drivers/gpu/drm/ttm/ttm_bo.c               | 83 ++++++++++----------------=
----
 drivers/gpu/drm/ttm/ttm_bo_util.c          | 43 ++++++++--------
 drivers/gpu/drm/ttm/ttm_resource.c         | 31 ++++++++---
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c |  2 +-
 include/drm/ttm/ttm_bo_api.h               |  1 -
 include/drm/ttm/ttm_bo_driver.h            | 10 ++--
 include/drm/ttm/ttm_resource.h             |  4 +-
 11 files changed, 110 insertions(+), 126 deletions(-)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
