Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D566B7E660
	for <lists+dri-devel@lfdr.de>; Wed, 17 Sep 2025 14:48:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C1C310E1BB;
	Wed, 17 Sep 2025 12:48:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="DLWfJ8m9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com
 [95.215.58.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57E3710E1BB
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 12:48:29 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1758113307;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=RxC0Cr1ehjCehxLTRmCnW2KEy7H4kgU7hqTV5OPVQ4E=;
 b=DLWfJ8m9FnrZpN8BguJme7ABqGmSf3zIFcoWvcLxgdaBycv0s/Ijb+niC6ghLpBZD9CEqb
 NUvhG/2ofU0fRZABlhMCsYKmqNgX/0PfTY+LP95adRmlpjbZS2o6grLy0XZUq7KzlHZEWS
 WvQC3yhtf1D+DZd5zkLbD6jkt1SAvNg=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
 Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
 Oded Gabbay <ogabbay@kernel.org>
Cc: Thorsten Blum <thorsten.blum@linux.dev>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] accel/qaic: Replace kzalloc + copy_from_user with
 memdup_user
Date: Wed, 17 Sep 2025 14:48:04 +0200
Message-ID: <20250917124805.90395-2-thorsten.blum@linux.dev>
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

Replace kzalloc() followed by copy_from_user() with memdup_user() to
improve and simplify qaic_attach_slice_bo_ioctl().

No functional changes intended.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/accel/qaic/qaic_data.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/accel/qaic/qaic_data.c b/drivers/accel/qaic/qaic_data.c
index 797289e9d780..202bdca58847 100644
--- a/drivers/accel/qaic/qaic_data.c
+++ b/drivers/accel/qaic/qaic_data.c
@@ -18,6 +18,7 @@
 #include <linux/scatterlist.h>
 #include <linux/spinlock.h>
 #include <linux/srcu.h>
+#include <linux/string.h>
 #include <linux/types.h>
 #include <linux/uaccess.h>
 #include <linux/wait.h>
@@ -984,18 +985,12 @@ int qaic_attach_slice_bo_ioctl(struct drm_device *dev, void *data, struct drm_fi
 
 	user_data = u64_to_user_ptr(args->data);
 
-	slice_ent = kzalloc(arg_size, GFP_KERNEL);
-	if (!slice_ent) {
-		ret = -EINVAL;
+	slice_ent = memdup_user(user_data, arg_size);
+	if (IS_ERR(slice_ent)) {
+		ret = PTR_ERR(slice_ent);
 		goto unlock_dev_srcu;
 	}
 
-	ret = copy_from_user(slice_ent, user_data, arg_size);
-	if (ret) {
-		ret = -EFAULT;
-		goto free_slice_ent;
-	}
-
 	obj = drm_gem_object_lookup(file_priv, args->hdr.handle);
 	if (!obj) {
 		ret = -ENOENT;
-- 
2.51.0

