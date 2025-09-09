Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83BB5B500B8
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 17:12:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C388510E262;
	Tue,  9 Sep 2025 15:12:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="SJVa9R/d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com
 [95.215.58.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42BA910E71F
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 15:12:36 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1757430743;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=YTikDlX12kXL3j+5kwkltxNVJHuHuCGZc9SB1ihbGG4=;
 b=SJVa9R/d9JBXok4g28X5XyNlSwCYDy1Z9ugy6mZB8SX7QL4omrAASdlWcbBZOMqsE0+UPR
 /gejcTIxHMMnytu9jWBu7OHWYAw7+xtJkvtCgGPFwF5nti1t3+vx+OoWQ0GZ7Ws1QIHsoz
 4MMqCMfouJ8X6IPvREtIcp01b0wGFc8=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Thorsten Blum <thorsten.blum@linux.dev>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amdkfd: Replace kmalloc + copy_from_user with memdup_user
Date: Tue,  9 Sep 2025 17:11:46 +0200
Message-ID: <20250909151146.760450-2-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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

Replace kmalloc() followed by copy_from_user() with memdup_user() to
improve and simplify kfd_criu_restore_queue().

No functional changes intended.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 .../amd/amdkfd/kfd_process_queue_manager.c    | 22 +++++--------------
 1 file changed, 6 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
index 7fbb5c274ccc..70c17a12cadf 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
@@ -1004,13 +1004,9 @@ int kfd_criu_restore_queue(struct kfd_process *p,
 	if (*priv_data_offset + sizeof(*q_data) > max_priv_data_size)
 		return -EINVAL;
 
-	q_data = kmalloc(sizeof(*q_data), GFP_KERNEL);
-	if (!q_data)
-		return -ENOMEM;
-
-	ret = copy_from_user(q_data, user_priv_ptr + *priv_data_offset, sizeof(*q_data));
-	if (ret) {
-		ret = -EFAULT;
+	q_data = memdup_user(user_priv_ptr + *priv_data_offset, sizeof(*q_data));
+	if (IS_ERR(q_data)) {
+		ret = PTR_ERR(q_data);
 		goto exit;
 	}
 
@@ -1022,15 +1018,9 @@ int kfd_criu_restore_queue(struct kfd_process *p,
 		goto exit;
 	}
 
-	q_extra_data = kmalloc(q_extra_data_size, GFP_KERNEL);
-	if (!q_extra_data) {
-		ret = -ENOMEM;
-		goto exit;
-	}
-
-	ret = copy_from_user(q_extra_data, user_priv_ptr + *priv_data_offset, q_extra_data_size);
-	if (ret) {
-		ret = -EFAULT;
+	q_extra_data = memdup_user(user_priv_ptr + *priv_data_offset, q_extra_data_size);
+	if (IS_ERR(q_extra_data)) {
+		ret = PTR_ERR(q_extra_data);
 		goto exit;
 	}
 
-- 
2.51.0

