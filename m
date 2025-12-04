Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D2FCA3C4D
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 14:20:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97BE410E95A;
	Thu,  4 Dec 2025 13:20:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="dGjcutSO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBE5910E974
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Dec 2025 13:20:23 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4779a4fc95aso14771815e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Dec 2025 05:20:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1764854422; x=1765459222; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YklG8feiR5FU/k+rcsWunlToF1mBL/k2qOqrOj6/0mM=;
 b=dGjcutSOBWPiEev/EZaudR/GqLd0z6CzAvEGWJ/CQs3lotnTAFzTVVQb/dLvCFM7pM
 Q30ZSq6vZMIkY6/8Ge0kn0h7HoHJ+ZkrSeCqYUdxMJrGNf1WDmVQE9wfo4WPyndRZDhF
 RZJ9C8WYH/2jqHz7QbgTjT09MxhbhMJ0CNQRPPKejp7dsLpeugVBugEIJjl6+82r5isL
 K+8iR7R//xTo+1E8hUSiV9/mvOgjwYMtmm+rRbrHGwH7bg1uRm79K5b1ZVXeWplidC+J
 5UIx/asSKzrKNvPebAccyyAwqOzUIOkorWVOmQznkb0VFJwJim8qpbkTxBxcUe90BkKH
 X2LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764854422; x=1765459222;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YklG8feiR5FU/k+rcsWunlToF1mBL/k2qOqrOj6/0mM=;
 b=oYlWUY/Zx0uiLWWwsE46zlMLh3my9xrPy7a9HSMVMhqd87OCpCtcE4Vw8V8/n0ibvY
 N3PlOCog5y4zI2haV+kaqxJKdmCfCDubsOgLccpG4la7uNk8lUTHxfNfygjOAkU1g34e
 GoDPr8Kh7jwii9akXddU4PyPvJLsXW5ErYnpRD5OkDVrs52gRGbY3XjM5LV4dXz9CLkz
 v0rCk2niQq8x9GC7w403gGYsDzogdPxnKumEnyV6UepLgc4zY/8r8U/gg3pmSdbCmBdm
 7drDdfjZyq5h86W6yk3DAYpvXBde7ncZFvTfAzV1dtBd5KnPgQSzjNqV3fQX4oEfBFfo
 akMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVbWhFKe64Hu448otakikgkZ+numnLqGcGxF3zsB/h2WGWHkKVi8KNRzqUy9LOT5dZRtPf2Puqx7G8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YylCRNJpA3MyFYYTtBW5VHusbobEldc+szjD7gs5WFtV6vvpQxi
 ofi9olA3GooYGAErKNq5wtZLTIDvzaLgK62cz/izadYOGtn8dggOBd01YiQYnL24U0g=
X-Gm-Gg: ASbGncvOqugPlOyLgOW0D9k/vjznUnwdGIc3fYMY8c2X1D5pjYWghqkTjqHx47mtR31
 hmn8GQjya2bDZcAAdo1m7mMjb5NJ7+tn7kgoz13BXWPWm+J5egvMaIHisI+aHO/VYt8ddd8j3oa
 p+1fJ90qZhxDf2WwH3/VFwhC8YUpDJBRB4I+uAR9j2033GuyYI0jSzAKab9qxO+paxjhM1+ledp
 e3HDSP0jXQt/9JpvYF6n3+m7GmHv1PvmBEp7Sksy8WV11dU4693nsLPdwMnZMMWHNtJTOWjA5kq
 HaG7x9xrkqZ0nMEtNj2nGdk3ZKtMxrNnEKu+i1yy5khcKeL6MipfYFP9CkWIdNDFZV9TxRrPtsi
 Lb6I+8S1zG+SdPbg1QrskURz7uE2IXrxC/Z6fbYBLNUUkK7oApRtFTKkoHA9aH+8EbI8K+Qk+g0
 iy7akG4GHiujZ25nVYiiOaUl+0A8OGDKmbdPoJ
X-Google-Smtp-Source: AGHT+IFcjjEFgmXKpF7SlmgB5UtUoXukvdBKYhqBaRbor0ZYnolgBTjOqdu8w3shLE1sDh0KfSPfjQ==
X-Received: by 2002:a05:600c:a07:b0:477:9890:9ab8 with SMTP id
 5b1f17b1804b1-4792eb10ddcmr30456395e9.3.1764854422033; 
 Thu, 04 Dec 2025 05:20:22 -0800 (PST)
Received: from localhost (h1f65.n1.ips.mtn.co.ug. [41.210.159.101])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-479310b8e70sm31237805e9.5.2025.12.04.05.20.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Dec 2025 05:20:21 -0800 (PST)
Date: Thu, 4 Dec 2025 16:20:18 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Hersen Wu <hersenxs.wu@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 "ChiaHsuan (Tom) Chung" <chiahsuan.chung@amd.com>,
 Roman Li <roman.li@amd.com>, Peter Shkenev <mustela@erminea.space>,
 Timur =?iso-8859-1?Q?Krist=F3f?= <timur.kristof@gmail.com>,
 Wayne Lin <Wayne.Lin@amd.com>, Alex Hung <alex.hung@amd.com>,
 Kun Liu <Kun.Liu2@amd.com>, Ray Wu <ray.wu@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/amd/display: Fix debugfs output in dp_link_settings_read()
Message-ID: <aTGKkpf2p-Dqg5RL@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
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

This code passes the wrong limit to snprintf().  It does:

	str_len = strlen("Current:  %d  0x%x  %d  ");
	snprintf(rd_buf_ptr, str_len, "....

The limit should  normally be the number of bytes remaining in the
buffer but instead of that it's using the number of bytes in the
unexpanded format string.  So if any of the numbers are more than 1
digit then the output string will have characters missing from the
middle of the output.

Normally, we would do it like this:

	off += scnprintf(p + off, buf_size - off, "...

Also we can use cleanup.h magic to free the "buf" and
simple_read_from_buffer() to copy the buffer to the user as a bit
of a cleanup.

Fixes: 41db5f1931ec ("drm/amd/display: set-read link rate and lane count through debugfs")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
Not tested.

 .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.c | 94 ++++++-------------
 1 file changed, 31 insertions(+), 63 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
index cb4bb67289a4..028dfd0aa43d 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
@@ -185,72 +185,40 @@ static int parse_write_buffer_into_params(char *wr_buf, uint32_t wr_buf_size,
  * check current and preferred settings.
  *
  */
-static ssize_t dp_link_settings_read(struct file *f, char __user *buf,
-				 size_t size, loff_t *pos)
+static ssize_t dp_link_settings_read(struct file *f, char __user *ubuf,
+				     size_t count, loff_t *pos)
 {
 	struct amdgpu_dm_connector *connector = file_inode(f)->i_private;
 	struct dc_link *link = connector->dc_link;
-	char *rd_buf = NULL;
-	char *rd_buf_ptr = NULL;
-	const uint32_t rd_buf_size = 100;
-	uint32_t result = 0;
-	uint8_t str_len = 0;
-	int r;
-
-	if (*pos & 3 || size & 3)
-		return -EINVAL;
-
-	rd_buf = kcalloc(rd_buf_size, sizeof(char), GFP_KERNEL);
-	if (!rd_buf)
-		return 0;
-
-	rd_buf_ptr = rd_buf;
-
-	str_len = strlen("Current:  %d  0x%x  %d  ");
-	snprintf(rd_buf_ptr, str_len, "Current:  %d  0x%x  %d  ",
-			link->cur_link_settings.lane_count,
-			link->cur_link_settings.link_rate,
-			link->cur_link_settings.link_spread);
-	rd_buf_ptr += str_len;
-
-	str_len = strlen("Verified:  %d  0x%x  %d  ");
-	snprintf(rd_buf_ptr, str_len, "Verified:  %d  0x%x  %d  ",
-			link->verified_link_cap.lane_count,
-			link->verified_link_cap.link_rate,
-			link->verified_link_cap.link_spread);
-	rd_buf_ptr += str_len;
-
-	str_len = strlen("Reported:  %d  0x%x  %d  ");
-	snprintf(rd_buf_ptr, str_len, "Reported:  %d  0x%x  %d  ",
-			link->reported_link_cap.lane_count,
-			link->reported_link_cap.link_rate,
-			link->reported_link_cap.link_spread);
-	rd_buf_ptr += str_len;
-
-	str_len = strlen("Preferred:  %d  0x%x  %d  ");
-	snprintf(rd_buf_ptr, str_len, "Preferred:  %d  0x%x  %d\n",
-			link->preferred_link_setting.lane_count,
-			link->preferred_link_setting.link_rate,
-			link->preferred_link_setting.link_spread);
-
-	while (size) {
-		if (*pos >= rd_buf_size)
-			break;
-
-		r = put_user(*(rd_buf + result), buf);
-		if (r) {
-			kfree(rd_buf);
-			return r; /* r = -EFAULT */
-		}
-
-		buf += 1;
-		size -= 1;
-		*pos += 1;
-		result += 1;
-	}
-
-	kfree(rd_buf);
-	return result;
+	size_t size = 1024;
+	int off;
+
+	char *buf __free(kfree) = kcalloc(size, sizeof(char), GFP_KERNEL);
+	if (!buf)
+		return  -ENOMEM;
+
+	off = 0;
+	off += scnprintf(buf + off, size - off, "Current:  %d  0x%x  %d  ",
+			 link->cur_link_settings.lane_count,
+			 link->cur_link_settings.link_rate,
+			 link->cur_link_settings.link_spread);
+
+	off += scnprintf(buf + off, size - off, "Verified:  %d  0x%x  %d  ",
+			 link->verified_link_cap.lane_count,
+			 link->verified_link_cap.link_rate,
+			 link->verified_link_cap.link_spread);
+
+	off += scnprintf(buf + off, size - off, "Reported:  %d  0x%x  %d  ",
+			 link->reported_link_cap.lane_count,
+			 link->reported_link_cap.link_rate,
+			 link->reported_link_cap.link_spread);
+
+	off += scnprintf(buf + off, size - off, "Preferred:  %d  0x%x  %d\n",
+			 link->preferred_link_setting.lane_count,
+			 link->preferred_link_setting.link_rate,
+			 link->preferred_link_setting.link_spread);
+
+	return simple_read_from_buffer(ubuf, count, pos, buf, off);
 }
 
 static ssize_t dp_link_settings_write(struct file *f, const char __user *buf,
-- 
2.51.0

