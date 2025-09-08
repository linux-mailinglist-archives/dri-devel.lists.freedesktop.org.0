Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19FCBB49B23
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 22:36:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A30D810E5CF;
	Mon,  8 Sep 2025 20:36:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="d10K6DCm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-181.mta1.migadu.com (out-181.mta1.migadu.com
 [95.215.58.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07EC910E5CF
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 20:36:32 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1757363789;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=GNHJ0bIbs+9uwV2RFN4E26x/2ypGovp+e5ynogemSoo=;
 b=d10K6DCmMivJpleOcmGAuPHmwT78mZdsoxJxppDSl9YvYo3iIduFstbkpjHlAy+2V0kMOA
 vzVTTumtIaHU3gvl4i1xVyG/tLCfN/vrr5WEPU05R/pK92TPKf3pMAEsVelxzjJEDQVfXn
 j7FvgcvW8fxfgCQsKSe4xd4ptddJ0r8=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Koby Elbaz <koby.elbaz@intel.com>,
 Konstantin Sinyuk <konstantin.sinyuk@intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 Easwar Hariharan <easwar.hariharan@linux.microsoft.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Thorsten Blum <thorsten.blum@linux.dev>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] accel/habanalabs: Replace kmalloc_array + copy_from_user with
 memdup_array_user
Date: Mon,  8 Sep 2025 22:35:37 +0200
Message-ID: <20250908203540.475303-1-thorsten.blum@linux.dev>
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

Replace kmalloc_array() followed by copy_from_user() with
memdup_array_user() to improve and simplify cs_ioctl_engine_cores(),
cs_ioctl_engines(), and hl_multi_cs_wait_ioctl().

Remove the unused variable 'size_to_copy' from hl_multi_cs_wait_ioctl().

No functional changes intended.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 .../habanalabs/common/command_submission.c    | 34 +++++--------------
 1 file changed, 9 insertions(+), 25 deletions(-)

diff --git a/drivers/accel/habanalabs/common/command_submission.c b/drivers/accel/habanalabs/common/command_submission.c
index dee487724918..a5e339eb7a4f 100644
--- a/drivers/accel/habanalabs/common/command_submission.c
+++ b/drivers/accel/habanalabs/common/command_submission.c
@@ -2481,14 +2481,10 @@ static int cs_ioctl_engine_cores(struct hl_fpriv *hpriv, u64 engine_cores,
 	}
 
 	engine_cores_arr = (void __user *) (uintptr_t) engine_cores;
-	cores = kmalloc_array(num_engine_cores, sizeof(u32), GFP_KERNEL);
-	if (!cores)
-		return -ENOMEM;
-
-	if (copy_from_user(cores, engine_cores_arr, num_engine_cores * sizeof(u32))) {
+	cores = memdup_array_user(engine_cores_arr, num_engine_cores, sizeof(u32));
+	if (IS_ERR(cores)) {
 		dev_err(hdev->dev, "Failed to copy core-ids array from user\n");
-		kfree(cores);
-		return -EFAULT;
+		return PTR_ERR(cores);
 	}
 
 	rc = hdev->asic_funcs->set_engine_cores(hdev, cores, num_engine_cores, core_command);
@@ -2523,14 +2519,10 @@ static int cs_ioctl_engines(struct hl_fpriv *hpriv, u64 engines_arr_user_addr,
 	}
 
 	engines_arr = (void __user *) (uintptr_t) engines_arr_user_addr;
-	engines = kmalloc_array(num_engines, sizeof(u32), GFP_KERNEL);
-	if (!engines)
-		return -ENOMEM;
-
-	if (copy_from_user(engines, engines_arr, num_engines * sizeof(u32))) {
+	engines = memdup_array_user(engines_arr, num_engines, sizeof(u32));
+	if (IS_ERR(engines)) {
 		dev_err(hdev->dev, "Failed to copy engine-ids array from user\n");
-		kfree(engines);
-		return -EFAULT;
+		return PTR_ERR(engines);
 	}
 
 	rc = hdev->asic_funcs->set_engines(hdev, engines, num_engines, command);
@@ -3013,7 +3005,6 @@ static int hl_multi_cs_wait_ioctl(struct hl_fpriv *hpriv, void *data)
 	struct hl_ctx *ctx = hpriv->ctx;
 	struct hl_fence **fence_arr;
 	void __user *seq_arr;
-	u32 size_to_copy;
 	u64 *cs_seq_arr;
 	u8 seq_arr_len;
 	int rc, i;
@@ -3037,19 +3028,12 @@ static int hl_multi_cs_wait_ioctl(struct hl_fpriv *hpriv, void *data)
 		return -EINVAL;
 	}
 
-	/* allocate memory for sequence array */
-	cs_seq_arr =
-		kmalloc_array(seq_arr_len, sizeof(*cs_seq_arr), GFP_KERNEL);
-	if (!cs_seq_arr)
-		return -ENOMEM;
-
 	/* copy CS sequence array from user */
 	seq_arr = (void __user *) (uintptr_t) args->in.seq;
-	size_to_copy = seq_arr_len * sizeof(*cs_seq_arr);
-	if (copy_from_user(cs_seq_arr, seq_arr, size_to_copy)) {
+	cs_seq_arr = memdup_array_user(seq_arr, seq_arr_len, sizeof(*cs_seq_arr));
+	if (IS_ERR(cs_seq_arr)) {
 		dev_err(hdev->dev, "Failed to copy multi-cs sequence array from user\n");
-		rc = -EFAULT;
-		goto free_seq_arr;
+		return PTR_ERR(cs_seq_arr);
 	}
 
 	/* allocate array for the fences */
-- 
2.51.0

