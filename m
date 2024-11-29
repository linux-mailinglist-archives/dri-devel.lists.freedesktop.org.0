Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3259D933B
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 09:26:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43CB310E1C7;
	Tue, 26 Nov 2024 08:26:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=seltendoof.de header.i=@seltendoof.de header.b="renzaNjY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 866 seconds by postgrey-1.36 at gabe;
 Mon, 25 Nov 2024 10:54:58 UTC
Received: from server02.seltendoof.de (server02.seltendoof.de [168.119.48.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6092110E3F4
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 10:54:58 +0000 (UTC)
From: =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgoettsche@seltendoof.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seltendoof.de;
 s=2023072701; t=1732531230;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BnJPwZBINKy4LES6pr7BNEYT4c7M8sYvf1DiqcmfvZQ=;
 b=renzaNjYJ9YJyG9gUtmjWqJwQ0VY7TQPB8AIE5W2eHdeqh2KtO/X4RlDCy1my/SVpQmQbZ
 wjNEjBd+3Nx5SYzGSi/4OwNEhlCfesxm4VNww0jT0OEYCfKsxUBHnyqFZjs4qmm0yXdPXf
 JQVxhmVSoR7oSv45zcTLYW4BjQnZhX+TQ9oYJfvSmhOwIXh5wbGCNS9yLVPQ//3K2TAHgl
 Eb4e91BrZZEw09F7m/z/76uD9fpDEgjnOst+2rcsjNChNW2KdjtqLgROIapy8OMfgZI/BW
 MreOsqodNcQhtkdGSCQM3CtyEM177zZSZrrnzTyeG6viMRNF26psOPQLgVZyPg==
To: linux-security-module@vger.kernel.org
Cc: =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgzones@googlemail.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Richard Weinberger <richard@nod.at>,
 Zhihao Cheng <chengzhihao1@huawei.com>, Serge Hallyn <serge@hallyn.com>,
 Julia Lawall <Julia.Lawall@inria.fr>,
 Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mtd@lists.infradead.org,
 cocci@inria.fr
Subject: [PATCH 06/11] ubifs: reorder capability check last
Date: Mon, 25 Nov 2024 11:39:58 +0100
Message-ID: <20241125104011.36552-5-cgoettsche@seltendoof.de>
In-Reply-To: <20241125104011.36552-1-cgoettsche@seltendoof.de>
References: <20241125104011.36552-1-cgoettsche@seltendoof.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 26 Nov 2024 08:26:46 +0000
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
Reply-To: cgzones@googlemail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Christian Göttsche <cgzones@googlemail.com>

capable() calls refer to enabled LSMs whether to permit or deny the
request.  This is relevant in connection with SELinux, where a
capability check results in a policy decision and by default a denial
message on insufficient permission is issued.
It can lead to three undesired cases:
  1. A denial message is generated, even in case the operation was an
     unprivileged one and thus the syscall succeeded, creating noise.
  2. To avoid the noise from 1. the policy writer adds a rule to ignore
     those denial messages, hiding future syscalls, where the task
     performs an actual privileged operation, leading to hidden limited
     functionality of that task.
  3. To avoid the noise from 1. the policy writer adds a rule to permit
     the task the requested capability, while it does not need it,
     violating the principle of least privilege.

Signed-off-by: Christian Göttsche <cgzones@googlemail.com>
---
 drivers/gpu/drm/panthor/panthor_drv.c | 2 +-
 fs/ubifs/budget.c                     | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index ac7e53f6e3f0..2de0c3627fbf 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -791,7 +791,7 @@ static int group_priority_permit(struct drm_file *file,
 		return 0;
 
 	/* Higher priorities require CAP_SYS_NICE or DRM_MASTER */
-	if (capable(CAP_SYS_NICE) || drm_is_current_master(file))
+	if (drm_is_current_master(file) || capable(CAP_SYS_NICE))
 		return 0;
 
 	return -EACCES;
diff --git a/fs/ubifs/budget.c b/fs/ubifs/budget.c
index d76eb7b39f56..6137aeadec3f 100644
--- a/fs/ubifs/budget.c
+++ b/fs/ubifs/budget.c
@@ -256,8 +256,9 @@ long long ubifs_calc_available(const struct ubifs_info *c, int min_idx_lebs)
  */
 static int can_use_rp(struct ubifs_info *c)
 {
-	if (uid_eq(current_fsuid(), c->rp_uid) || capable(CAP_SYS_RESOURCE) ||
-	    (!gid_eq(c->rp_gid, GLOBAL_ROOT_GID) && in_group_p(c->rp_gid)))
+	if (uid_eq(current_fsuid(), c->rp_uid) ||
+	    (!gid_eq(c->rp_gid, GLOBAL_ROOT_GID) && in_group_p(c->rp_gid)) ||
+	    capable(CAP_SYS_RESOURCE))
 		return 1;
 	return 0;
 }
-- 
2.45.2

