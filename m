Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 441CDB49BAF
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 23:16:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A76E210E5D8;
	Mon,  8 Sep 2025 21:16:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="SZVNXgjb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com
 [91.218.175.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8185D10E5D8
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 21:16:47 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1757366205;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=QZs1MddN1kGIVjCYk+noKB3uCgeYjjNDvqCYGlqZzmg=;
 b=SZVNXgjb9TnYg2XcQ9CFKP0Qu82TKnE8YlVs6g7p/R22Jgq8Qo+SV+ZfhhqZpjaZqo0qNZ
 /R0b/0VH1oYOuCXUORdj8Dfm56YLe4zAzueii2cJh9+BVjt6/zY/l1tOeZVQS2U33/oBMt
 SzkZIe7g6277KvWd5pyPN44fgBO8zyk=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Thorsten Blum <thorsten.blum@linux.dev>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amdgpu: Replace kzalloc + copy_from_user with memdup_user
Date: Mon,  8 Sep 2025 23:15:54 +0200
Message-ID: <20250908211559.519892-1-thorsten.blum@linux.dev>
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
improve and simplify ta_if_load_debugfs_write() and
ta_if_invoke_debugfs_write().

No functional changes intended.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c
index 38face981c3e..6e8aad91bcd3 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c
@@ -171,13 +171,9 @@ static ssize_t ta_if_load_debugfs_write(struct file *fp, const char *buf, size_t
 
 	copy_pos += sizeof(uint32_t);
 
-	ta_bin = kzalloc(ta_bin_len, GFP_KERNEL);
-	if (!ta_bin)
-		return -ENOMEM;
-	if (copy_from_user((void *)ta_bin, &buf[copy_pos], ta_bin_len)) {
-		ret = -EFAULT;
-		goto err_free_bin;
-	}
+	ta_bin = memdup_user(&buf[copy_pos], ta_bin_len);
+	if (IS_ERR(ta_bin))
+		return PTR_ERR(ta_bin);
 
 	/* Set TA context and functions */
 	set_ta_context_funcs(psp, ta_type, &context);
@@ -327,13 +323,9 @@ static ssize_t ta_if_invoke_debugfs_write(struct file *fp, const char *buf, size
 		return -EFAULT;
 	copy_pos += sizeof(uint32_t);
 
-	shared_buf = kzalloc(shared_buf_len, GFP_KERNEL);
-	if (!shared_buf)
-		return -ENOMEM;
-	if (copy_from_user((void *)shared_buf, &buf[copy_pos], shared_buf_len)) {
-		ret = -EFAULT;
-		goto err_free_shared_buf;
-	}
+	shared_buf = memdup_user(&buf[copy_pos], shared_buf_len);
+	if (IS_ERR(shared_buf))
+		return PTR_ERR(shared_buf);
 
 	set_ta_context_funcs(psp, ta_type, &context);
 
-- 
2.51.0

