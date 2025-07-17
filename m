Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69655B09607
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jul 2025 22:55:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5092F10E89C;
	Thu, 17 Jul 2025 20:54:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 381 seconds by postgrey-1.36 at gabe;
 Thu, 17 Jul 2025 20:54:57 UTC
Received: from erminea.space (erminea.space [51.250.125.203])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AEF310E29F;
 Thu, 17 Jul 2025 20:54:57 +0000 (UTC)
Received: from alyaptyap (unknown [37.204.49.201])
 by erminea.space (Postfix) with ESMTPSA id 37F0213CE;
 Thu, 17 Jul 2025 23:54:56 +0300 (MSK)
From: Peter Shkenev <mustela@erminea.space>
To: alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org,
 christian.koenig@amd.com
Cc: airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amdgpu: check if hubbub is NULL in
 debugfs/amdgpu_dm_capabilities
Date: Thu, 17 Jul 2025 23:54:48 +0300
Message-ID: <20250717205449.763512-1-mustela@erminea.space>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

HUBBUB structure is not initialized on DCE hardware, so check if it is NULL
to avoid null dereference while accessing amdgpu_dm_capabilities file in
debugfs.

Signed-off-by: Peter Shkenev <mustela@erminea.space>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
index c7d13e743e6c..b726bcd18e29 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
@@ -3988,7 +3988,7 @@ static int capabilities_show(struct seq_file *m, void *unused)
 
 	struct hubbub *hubbub = dc->res_pool->hubbub;
 
-	if (hubbub->funcs->get_mall_en)
+	if (hubbub && hubbub->funcs->get_mall_en)
 		hubbub->funcs->get_mall_en(hubbub, &mall_in_use);
 
 	if (dc->cap_funcs.get_subvp_en)
-- 
2.50.1

