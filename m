Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D13434915B5
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jan 2022 03:29:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDA211128D8;
	Tue, 18 Jan 2022 02:29:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0E8F1128DA;
 Tue, 18 Jan 2022 02:29:36 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A3752B81256;
 Tue, 18 Jan 2022 02:29:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9B01C36AE3;
 Tue, 18 Jan 2022 02:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642472973;
 bh=35lOTX6cm3m1nD+3sw8XpEL6aINTmKJuCTuO6dclzwU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XUpoT09WMnww8FSzJFmKYdwDgYaKnRjjdwSLhsGPXizsEA6RmRww1ShDnXgoXU56z
 /HAo96TGK3Y07dxCQbBpcJs6TJvwo4/cvPjHcveDE/wNJ1ntvqCXp+YNkn+/pKEFHU
 m8pKd4VtC211ItgWnvTQsPMCgIBa98j/vG6rOueeo/KxjHjadQ2O5yaRkDZpA7XxMF
 9rypR/mdL/7uKkth/PYlLzjyKETA+YbyyQD+dcKvBqad3rYKU20eZ0lM6piF7kmuz5
 oJycPR/A5O3bVKXESHH4iKdBzPMelgSziWll9Z7wM/LVAsSrA2u1UKbh6hpbyOJ6rm
 DFFRHPUMTpbRQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.16 185/217] drm/amdgpu: Don't inherit GEM object
 VMAs in child process
Date: Mon, 17 Jan 2022 21:19:08 -0500
Message-Id: <20220118021940.1942199-185-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220118021940.1942199-1-sashal@kernel.org>
References: <20220118021940.1942199-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
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
Cc: Sasha Levin <sashal@kernel.org>, colin.king@intel.com, tzimmermann@suse.de,
 airlied@linux.ie, Felix Kuehling <Felix.Kuehling@amd.com>, Xinhui.Pan@amd.com,
 nirmoy.das@amd.com, Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>,
 amd-gfx@lists.freedesktop.org, JinhuiEric.Huang@amd.com,
 David Yat Sin <david.yatsin@amd.com>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, evan.quan@amd.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>

[ Upstream commit fbcdbfde87509d523132b59f661a355c731139d0 ]

When an application having open file access to a node forks, its shared
mappings also get reflected in the address space of child process even
though it cannot access them with the object permissions applied. With the
existing permission checks on the gem objects, it might be reasonable to
also create the VMAs with VM_DONTCOPY flag so a user space application
doesn't need to explicitly call the madvise(addr, len, MADV_DONTFORK)
system call to prevent the pages in the mapped range to appear in the
address space of the child process. It also prevents the memory leaks
due to additional reference counts on the mapped BOs in the child
process that prevented freeing the memory in the parent for which we had
worked around earlier in the user space inside the thunk library.

Additionally, we faced this issue when using CRIU to checkpoint restore
an application that had such inherited mappings in the child which
confuse CRIU when it mmaps on restore. Having this flag set for the
render node VMAs helps. VMAs mapped via KFD already take care of this so
this is needed only for the render nodes.

To limit the impact of the change to user space consumers such as OpenGL
etc, limit it to KFD BOs only.

Acked-by: Felix Kuehling <Felix.Kuehling@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
Signed-off-by: David Yat Sin <david.yatsin@amd.com>
Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
index a1e63ba4c54a5..630dc99e49086 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
@@ -264,6 +264,9 @@ static int amdgpu_gem_object_mmap(struct drm_gem_object *obj, struct vm_area_str
 	    !(vma->vm_flags & (VM_READ | VM_WRITE | VM_EXEC)))
 		vma->vm_flags &= ~VM_MAYWRITE;
 
+	if (bo->kfd_bo)
+		vma->vm_flags |= VM_DONTCOPY;
+
 	return drm_gem_ttm_mmap(obj, vma);
 }
 
-- 
2.34.1

