Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AAC72CE24B
	for <lists+dri-devel@lfdr.de>; Fri,  4 Dec 2020 00:07:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D975C6E0D0;
	Thu,  3 Dec 2020 23:06:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81F8A6E0D0;
 Thu,  3 Dec 2020 23:06:58 +0000 (UTC)
From: Arnd Bergmann <arnd@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Dennis Li <Dennis.Li@amd.com>, Tao Zhou <tao.zhou1@amd.com>,
 Guchun Chen <guchun.chen@amd.com>
Subject: [PATCH] drm/amdgpu: fix debugfs creation/removal, again
Date: Fri,  4 Dec 2020 00:06:43 +0100
Message-Id: <20201203230652.1480863-1-arnd@kernel.org>
X-Mailer: git-send-email 2.27.0
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
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Le Ma <le.ma@amd.com>,
 "Stanley.Yang" <Stanley.Yang@amd.com>, dri-devel@lists.freedesktop.org,
 John Clements <john.clements@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

There is still a warning when CONFIG_DEBUG_FS is disabled:

drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:1145:13: error: 'amdgpu_ras_debugfs_create_ctrl_node' defined but not used [-Werror=unused-function]
 1145 | static void amdgpu_ras_debugfs_create_ctrl_node(struct amdgpu_device *adev)

Change the code again to make the compiler actually drop
this code but not warn about it.

Fixes: ae2bf61ff39e ("drm/amdgpu: guard ras debugfs creation/removal based on CONFIG_DEBUG_FS")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c | 13 +++++--------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h |  6 ------
 2 files changed, 5 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
index 9d11b847e6ef..c136bd449744 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
@@ -1167,7 +1167,7 @@ static void amdgpu_ras_debugfs_create_ctrl_node(struct amdgpu_device *adev)
 			con->dir, &con->disable_ras_err_cnt_harvest);
 }
 
-void amdgpu_ras_debugfs_create(struct amdgpu_device *adev,
+static void amdgpu_ras_debugfs_create(struct amdgpu_device *adev,
 		struct ras_fs_if *head)
 {
 	struct amdgpu_ras *con = amdgpu_ras_get_context(adev);
@@ -1189,7 +1189,6 @@ void amdgpu_ras_debugfs_create(struct amdgpu_device *adev,
 
 void amdgpu_ras_debugfs_create_all(struct amdgpu_device *adev)
 {
-#if defined(CONFIG_DEBUG_FS)
 	struct amdgpu_ras *con = amdgpu_ras_get_context(adev);
 	struct ras_manager *obj;
 	struct ras_fs_if fs_info;
@@ -1198,7 +1197,7 @@ void amdgpu_ras_debugfs_create_all(struct amdgpu_device *adev)
 	 * it won't be called in resume path, no need to check
 	 * suspend and gpu reset status
 	 */
-	if (!con)
+	if (!IS_ENABLED(CONFIG_DEBUG_FS) || !con)
 		return;
 
 	amdgpu_ras_debugfs_create_ctrl_node(adev);
@@ -1212,10 +1211,9 @@ void amdgpu_ras_debugfs_create_all(struct amdgpu_device *adev)
 			amdgpu_ras_debugfs_create(adev, &fs_info);
 		}
 	}
-#endif
 }
 
-void amdgpu_ras_debugfs_remove(struct amdgpu_device *adev,
+static void amdgpu_ras_debugfs_remove(struct amdgpu_device *adev,
 		struct ras_common_if *head)
 {
 	struct ras_manager *obj = amdgpu_ras_find_obj(adev, head);
@@ -1229,7 +1227,6 @@ void amdgpu_ras_debugfs_remove(struct amdgpu_device *adev,
 
 static void amdgpu_ras_debugfs_remove_all(struct amdgpu_device *adev)
 {
-#if defined(CONFIG_DEBUG_FS)
 	struct amdgpu_ras *con = amdgpu_ras_get_context(adev);
 	struct ras_manager *obj, *tmp;
 
@@ -1238,7 +1235,6 @@ static void amdgpu_ras_debugfs_remove_all(struct amdgpu_device *adev)
 	}
 
 	con->dir = NULL;
-#endif
 }
 /* debugfs end */
 
@@ -1286,7 +1282,8 @@ static int amdgpu_ras_fs_init(struct amdgpu_device *adev)
 
 static int amdgpu_ras_fs_fini(struct amdgpu_device *adev)
 {
-	amdgpu_ras_debugfs_remove_all(adev);
+	if (IS_ENABLED(CONFIG_DEBUG_FS))
+		amdgpu_ras_debugfs_remove_all(adev);
 	amdgpu_ras_sysfs_remove_all(adev);
 	return 0;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h
index 4667cce38582..762f5e46c007 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h
@@ -592,14 +592,8 @@ int amdgpu_ras_sysfs_create(struct amdgpu_device *adev,
 int amdgpu_ras_sysfs_remove(struct amdgpu_device *adev,
 		struct ras_common_if *head);
 
-void amdgpu_ras_debugfs_create(struct amdgpu_device *adev,
-		struct ras_fs_if *head);
-
 void amdgpu_ras_debugfs_create_all(struct amdgpu_device *adev);
 
-void amdgpu_ras_debugfs_remove(struct amdgpu_device *adev,
-		struct ras_common_if *head);
-
 int amdgpu_ras_error_query(struct amdgpu_device *adev,
 		struct ras_query_if *info);
 
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
