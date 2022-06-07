Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9E354279F
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 09:39:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 670F510ECD8;
	Wed,  8 Jun 2022 07:39:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 484 seconds by postgrey-1.36 at gabe;
 Tue, 07 Jun 2022 15:27:47 UTC
Received: from smtp.ruc.edu.cn (m177126.mail.qiye.163.com [123.58.177.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4EAE10E8AE;
 Tue,  7 Jun 2022 15:27:47 +0000 (UTC)
Received: from localhost.localdomain (unknown [202.112.113.212])
 by smtp.ruc.edu.cn (Hmail) with ESMTPSA id 79D2D80053;
 Tue,  7 Jun 2022 23:19:39 +0800 (CST)
From: Xiaohui Zhang <xiaohuizhang@ruc.edu.cn>
To: Xiaohui Zhang <xiaohuizhang@ruc.edu.cn>,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] drm/radeon: Initialize fences array entries in
 radeon_sa_bo_next_hole
Date: Tue,  7 Jun 2022 23:19:33 +0800
Message-Id: <20220607151933.32850-1-xiaohuizhang@ruc.edu.cn>
X-Mailer: git-send-email 2.17.1
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZCBgUCR5ZQVlLVUtZV1
 kWDxoPAgseWUFZKDYvK1lXWShZQUhPN1dZLVlBSVdZDwkaFQgSH1lBWRoZGB5WSkpPGU4fSR5IGk
 MaVRMBExYaEhckFA4PWVdZFhoPEhUdFFlBWU9LSFVKSktITUpVS1kG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MhA6Nio4Qj01ORcoSjAzDTQa
 PRgaCg9VSlVKTU5PTUpOSkNLSk5JVTMWGhIXVQMSGhQTDhIBExoVHDsJDhhVHh8OVRgVRVlXWRIL
 WUFZSUtJVUpKSVVKSkhVSUpJWVdZCAFZQUlOTEs3Bg++
X-HM-Tid: 0a813ec0021e2c20kusn79d2d80053
X-Mailman-Approved-At: Wed, 08 Jun 2022 07:39:02 +0000
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

Similar to the handling of amdgpu_sa_bo_next_hole in commit 6a15f3ff19a8
("drm/amdgpu: Initialize fences array entries in amdgpu_sa_bo_next_hole"),
we thought a patch might be needed here as well.

The entries were only initialized once in radeon_sa_bo_new. If a fence
wasn't signalled yet in the first radeon_sa_bo_next_hole call, but then
got signalled before a later radeon_sa_bo_next_hole call, it could
destroy the fence but leave its pointer in the array, resulting in
use-after-free in radeon_sa_bo_new.

Signed-off-by: Xiaohui Zhang <xiaohuizhang@ruc.edu.cn>
---
 drivers/gpu/drm/radeon/radeon_sa.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_sa.c b/drivers/gpu/drm/radeon/radeon_sa.c
index 310c322c7112..0981948bd9ed 100644
--- a/drivers/gpu/drm/radeon/radeon_sa.c
+++ b/drivers/gpu/drm/radeon/radeon_sa.c
@@ -267,6 +267,8 @@ static bool radeon_sa_bo_next_hole(struct radeon_sa_manager *sa_manager,
 	for (i = 0; i < RADEON_NUM_RINGS; ++i) {
 		struct radeon_sa_bo *sa_bo;
 
+		fences[i] = NULL;
+
 		if (list_empty(&sa_manager->flist[i])) {
 			continue;
 		}
@@ -332,10 +334,8 @@ int radeon_sa_bo_new(struct radeon_device *rdev,
 
 	spin_lock(&sa_manager->wq.lock);
 	do {
-		for (i = 0; i < RADEON_NUM_RINGS; ++i) {
-			fences[i] = NULL;
+		for (i = 0; i < RADEON_NUM_RINGS; ++i)
 			tries[i] = 0;
-		}
 
 		do {
 			radeon_sa_bo_try_free(sa_manager);
-- 
2.17.1

