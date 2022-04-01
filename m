Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 618CF4EEF73
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 16:26:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F2FF10E3F7;
	Fri,  1 Apr 2022 14:26:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBBC710E3EB;
 Fri,  1 Apr 2022 14:26:14 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6B4D461C52;
 Fri,  1 Apr 2022 14:26:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE532C36AE5;
 Fri,  1 Apr 2022 14:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648823174;
 bh=OBPbGbaO8x6r6b9mYxviduU9OXtQWOmDlqCVDbt1XsE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XQxB0H6RTfEH9MPuwkcFi4b3cAMT6gLOtPWLFFmED1evGXJTojBjwkTSGC6Qmis5s
 DsUTsLlFRi0d4ef2OwfFCNYkMQKv9PlOwv4f9vJxec1rKDSA4ap0oYuZrY6lz10T1V
 pzgzVKE8gXkMfAMJhtGE+qSwjEjFa9de+nmQX3VK47f6vZdeVOM4CVVqnGSvkUL/+d
 EvBLH3VcrXtnlb7mC1m7887O2xfdjoDvRX2U40Ws58Dz0OjAdM+3QhUdp+UeSYYcmW
 V7gthgIChw/bW3vNvccua0zj+0PHU1Jxy6+ibqgTTA+Te/MoaBBWy5EnsT/10AeZor
 dCFNlA6SHp3zw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.17 012/149] drm/amd/display: Fix memory leak
Date: Fri,  1 Apr 2022 10:23:19 -0400
Message-Id: <20220401142536.1948161-12-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220401142536.1948161-1-sashal@kernel.org>
References: <20220401142536.1948161-1-sashal@kernel.org>
MIME-Version: 1.0
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
Cc: Sasha Levin <sashal@kernel.org>, Anson.Jacob@amd.com,
 dri-devel@lists.freedesktop.org, Yongzhi Liu <lyz_cs@pku.edu.cn>,
 airlied@linux.ie, Xinhui.Pan@amd.com, Rodrigo.Siqueira@amd.com,
 victorchengchi.lu@amd.com, sunpeng.li@amd.com, Jerry.Zuo@amd.com,
 aurabindo.pillai@amd.com, seanpaul@chromium.org, amd-gfx@lists.freedesktop.org,
 Wayne.Lin@amd.com, Alex Deucher <alexander.deucher@amd.com>,
 mikita.lipski@amd.com, christian.koenig@amd.com, greenfoo@u92.eu
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Yongzhi Liu <lyz_cs@pku.edu.cn>

[ Upstream commit 5d5c6dba2b43e28845d7d7ed32a36802329a5f52 ]

[why]
Resource release is needed on the error handling path
to prevent memory leak.

[how]
Fix this by adding kfree on the error handling path.

Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Yongzhi Liu <lyz_cs@pku.edu.cn>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.c | 80 ++++++++++++++-----
 1 file changed, 60 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
index 26719efa5396..12d437d9a0e4 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
@@ -227,8 +227,10 @@ static ssize_t dp_link_settings_read(struct file *f, char __user *buf,
 			break;
 
 		r = put_user(*(rd_buf + result), buf);
-		if (r)
+		if (r) {
+			kfree(rd_buf);
 			return r; /* r = -EFAULT */
+		}
 
 		buf += 1;
 		size -= 1;
@@ -389,8 +391,10 @@ static ssize_t dp_phy_settings_read(struct file *f, char __user *buf,
 			break;
 
 		r = put_user((*(rd_buf + result)), buf);
-		if (r)
+		if (r) {
+			kfree(rd_buf);
 			return r; /* r = -EFAULT */
+		}
 
 		buf += 1;
 		size -= 1;
@@ -1359,8 +1363,10 @@ static ssize_t dp_dsc_clock_en_read(struct file *f, char __user *buf,
 				break;
 	}
 
-	if (!pipe_ctx)
+	if (!pipe_ctx) {
+		kfree(rd_buf);
 		return -ENXIO;
+	}
 
 	dsc = pipe_ctx->stream_res.dsc;
 	if (dsc)
@@ -1376,8 +1382,10 @@ static ssize_t dp_dsc_clock_en_read(struct file *f, char __user *buf,
 			break;
 
 		r = put_user(*(rd_buf + result), buf);
-		if (r)
+		if (r) {
+			kfree(rd_buf);
 			return r; /* r = -EFAULT */
+		}
 
 		buf += 1;
 		size -= 1;
@@ -1546,8 +1554,10 @@ static ssize_t dp_dsc_slice_width_read(struct file *f, char __user *buf,
 				break;
 	}
 
-	if (!pipe_ctx)
+	if (!pipe_ctx) {
+		kfree(rd_buf);
 		return -ENXIO;
+	}
 
 	dsc = pipe_ctx->stream_res.dsc;
 	if (dsc)
@@ -1563,8 +1573,10 @@ static ssize_t dp_dsc_slice_width_read(struct file *f, char __user *buf,
 			break;
 
 		r = put_user(*(rd_buf + result), buf);
-		if (r)
+		if (r) {
+			kfree(rd_buf);
 			return r; /* r = -EFAULT */
+		}
 
 		buf += 1;
 		size -= 1;
@@ -1731,8 +1743,10 @@ static ssize_t dp_dsc_slice_height_read(struct file *f, char __user *buf,
 				break;
 	}
 
-	if (!pipe_ctx)
+	if (!pipe_ctx) {
+		kfree(rd_buf);
 		return -ENXIO;
+	}
 
 	dsc = pipe_ctx->stream_res.dsc;
 	if (dsc)
@@ -1748,8 +1762,10 @@ static ssize_t dp_dsc_slice_height_read(struct file *f, char __user *buf,
 			break;
 
 		r = put_user(*(rd_buf + result), buf);
-		if (r)
+		if (r) {
+			kfree(rd_buf);
 			return r; /* r = -EFAULT */
+		}
 
 		buf += 1;
 		size -= 1;
@@ -1912,8 +1928,10 @@ static ssize_t dp_dsc_bits_per_pixel_read(struct file *f, char __user *buf,
 				break;
 	}
 
-	if (!pipe_ctx)
+	if (!pipe_ctx) {
+		kfree(rd_buf);
 		return -ENXIO;
+	}
 
 	dsc = pipe_ctx->stream_res.dsc;
 	if (dsc)
@@ -1929,8 +1947,10 @@ static ssize_t dp_dsc_bits_per_pixel_read(struct file *f, char __user *buf,
 			break;
 
 		r = put_user(*(rd_buf + result), buf);
-		if (r)
+		if (r) {
+			kfree(rd_buf);
 			return r; /* r = -EFAULT */
+		}
 
 		buf += 1;
 		size -= 1;
@@ -2088,8 +2108,10 @@ static ssize_t dp_dsc_pic_width_read(struct file *f, char __user *buf,
 				break;
 	}
 
-	if (!pipe_ctx)
+	if (!pipe_ctx) {
+		kfree(rd_buf);
 		return -ENXIO;
+	}
 
 	dsc = pipe_ctx->stream_res.dsc;
 	if (dsc)
@@ -2105,8 +2127,10 @@ static ssize_t dp_dsc_pic_width_read(struct file *f, char __user *buf,
 			break;
 
 		r = put_user(*(rd_buf + result), buf);
-		if (r)
+		if (r) {
+			kfree(rd_buf);
 			return r; /* r = -EFAULT */
+		}
 
 		buf += 1;
 		size -= 1;
@@ -2145,8 +2169,10 @@ static ssize_t dp_dsc_pic_height_read(struct file *f, char __user *buf,
 				break;
 	}
 
-	if (!pipe_ctx)
+	if (!pipe_ctx) {
+		kfree(rd_buf);
 		return -ENXIO;
+	}
 
 	dsc = pipe_ctx->stream_res.dsc;
 	if (dsc)
@@ -2162,8 +2188,10 @@ static ssize_t dp_dsc_pic_height_read(struct file *f, char __user *buf,
 			break;
 
 		r = put_user(*(rd_buf + result), buf);
-		if (r)
+		if (r) {
+			kfree(rd_buf);
 			return r; /* r = -EFAULT */
+		}
 
 		buf += 1;
 		size -= 1;
@@ -2217,8 +2245,10 @@ static ssize_t dp_dsc_chunk_size_read(struct file *f, char __user *buf,
 				break;
 	}
 
-	if (!pipe_ctx)
+	if (!pipe_ctx) {
+		kfree(rd_buf);
 		return -ENXIO;
+	}
 
 	dsc = pipe_ctx->stream_res.dsc;
 	if (dsc)
@@ -2234,8 +2264,10 @@ static ssize_t dp_dsc_chunk_size_read(struct file *f, char __user *buf,
 			break;
 
 		r = put_user(*(rd_buf + result), buf);
-		if (r)
+		if (r) {
+			kfree(rd_buf);
 			return r; /* r = -EFAULT */
+		}
 
 		buf += 1;
 		size -= 1;
@@ -2289,8 +2321,10 @@ static ssize_t dp_dsc_slice_bpg_offset_read(struct file *f, char __user *buf,
 				break;
 	}
 
-	if (!pipe_ctx)
+	if (!pipe_ctx) {
+		kfree(rd_buf);
 		return -ENXIO;
+	}
 
 	dsc = pipe_ctx->stream_res.dsc;
 	if (dsc)
@@ -2306,8 +2340,10 @@ static ssize_t dp_dsc_slice_bpg_offset_read(struct file *f, char __user *buf,
 			break;
 
 		r = put_user(*(rd_buf + result), buf);
-		if (r)
+		if (r) {
+			kfree(rd_buf);
 			return r; /* r = -EFAULT */
+		}
 
 		buf += 1;
 		size -= 1;
@@ -3459,8 +3495,10 @@ static ssize_t dcc_en_bits_read(
 	dc->hwss.get_dcc_en_bits(dc, dcc_en_bits);
 
 	rd_buf = kcalloc(rd_buf_size, sizeof(char), GFP_KERNEL);
-	if (!rd_buf)
+	if (!rd_buf) {
+		kfree(dcc_en_bits);
 		return -ENOMEM;
+	}
 
 	for (i = 0; i < num_pipes; i++)
 		offset += snprintf(rd_buf + offset, rd_buf_size - offset,
@@ -3473,8 +3511,10 @@ static ssize_t dcc_en_bits_read(
 		if (*pos >= rd_buf_size)
 			break;
 		r = put_user(*(rd_buf + result), buf);
-		if (r)
+		if (r) {
+			kfree(rd_buf);
 			return r; /* r = -EFAULT */
+		}
 		buf += 1;
 		size -= 1;
 		*pos += 1;
-- 
2.34.1

