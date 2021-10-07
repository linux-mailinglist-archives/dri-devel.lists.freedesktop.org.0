Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 136BB425B3E
	for <lists+dri-devel@lfdr.de>; Thu,  7 Oct 2021 21:00:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EA066E529;
	Thu,  7 Oct 2021 19:00:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 637AE6E529
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Oct 2021 19:00:35 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id y207so7196772oia.11
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Oct 2021 12:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=g77xOnbp78pPRDYD8I2QJCJPz5LX5guTJqD3/cAwzVQ=;
 b=EJ/p95tlN1nrvagQ68sX2wd3ekM1PINVj+O8OF5nsrNpRJNBt8QM5Ujp6mQ3PBJtpY
 8C5bRtzIpBnEN6oTtxxN10wUZiznihP2KuONC/xS6UI+WJ65ozsZqTYftGw+SGSViy4c
 /FNqa9iHj58KRml2TnyBGxk+rChmspdHF6jbUlK0ZoeFYkBhlOeB8iUe7RUpc9NeZoKs
 8XY4uPuKIeiKXBoTma3PxyhJU1e2l/d+b2hhKvn2yQJYGurBB25UluLbRJxPqDEoVQI7
 pViW12NzQ650y05JrFXlW2Dct/rGf/Mxv29q43eKEYaHNy8liMdI6UwfZoapP89WYghZ
 8bPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=g77xOnbp78pPRDYD8I2QJCJPz5LX5guTJqD3/cAwzVQ=;
 b=t2HBp5q1aFxLEUeZ8emtecYgUVWM5Rjc1BazlEn8pxcLrIQzpe7a0hE8dmfwWiCGsu
 56Xd4xncCvAIp2tHdfNjI0bWyPyaqXypr7R7uv5pyf92vzGxa+7xPEEoZknLoufNNRM0
 0LIsZ1okpQ12IK7+oFt5SdX4lH6IBmkW2hXiGA2OwCLc+YoyZtfYbfrTCTEEZaSlpsY5
 /KdTHGotAi7QusXOGqiWFv3Gy3Ykf2m2I7+rKMaCveDyJLO3PzBvza9v2OoGKwViWWmw
 B9j2zQUf9TqUFYATxJORf8X++V4J/DWoAPeXWyUEa4GcTbTt6zBMr9LeCxc9fm4TPG5M
 tBkA==
X-Gm-Message-State: AOAM5302TaiZicwGa13/Qcash7wCfzu4qhjfTZBbF+ZNv6ItklINtAUL
 EvexaueLh39m02ta7TnNrI2w8Q==
X-Google-Smtp-Source: ABdhPJzk9jzjpX61jekzS5NvI9IU0NvmMbLzJJhX7OAMQPZbBLSiDuJu2njNOIExY9/5TaDMC4hfGw==
X-Received: by 2002:aca:120f:: with SMTP id 15mr12524966ois.62.1633633233234; 
 Thu, 07 Oct 2021 12:00:33 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
 by smtp.gmail.com with ESMTPSA id j65sm75116oif.5.2021.10.07.12.00.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 12:00:32 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/msm/dp: Simplify the dp_debug debugfs show function
Date: Thu,  7 Oct 2021 12:02:11 -0700
Message-Id: <20211007190211.3158868-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
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

The "dp_debug" show function allocates a buffer and piecemeal appends
line by line, checking for buffer overflows etc.

Migrate the function to seq_file, to remove all the extra book keeping
and simplify the function.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- const drm_mode

 drivers/gpu/drm/msm/dp/dp_debug.c | 163 +++++-------------------------
 1 file changed, 25 insertions(+), 138 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_debug.c b/drivers/gpu/drm/msm/dp/dp_debug.c
index 2f6247e80e9d..af709d93bb9f 100644
--- a/drivers/gpu/drm/msm/dp/dp_debug.c
+++ b/drivers/gpu/drm/msm/dp/dp_debug.c
@@ -31,177 +31,69 @@ struct dp_debug_private {
 	struct dp_debug dp_debug;
 };
 
-static int dp_debug_check_buffer_overflow(int rc, int *max_size, int *len)
+static int dp_debug_show(struct seq_file *seq, void *p)
 {
-	if (rc >= *max_size) {
-		DRM_ERROR("buffer overflow\n");
-		return -EINVAL;
-	}
-	*len += rc;
-	*max_size = SZ_4K - *len;
-
-	return 0;
-}
-
-static ssize_t dp_debug_read_info(struct file *file, char __user *user_buff,
-		size_t count, loff_t *ppos)
-{
-	struct dp_debug_private *debug = file->private_data;
-	char *buf;
-	u32 len = 0, rc = 0;
+	struct dp_debug_private *debug = seq->private;
 	u64 lclk = 0;
-	u32 max_size = SZ_4K;
 	u32 link_params_rate;
-	struct drm_display_mode *drm_mode;
+	const struct drm_display_mode *drm_mode;
 
 	if (!debug)
 		return -ENODEV;
 
-	if (*ppos)
-		return 0;
-
-	buf = kzalloc(SZ_4K, GFP_KERNEL);
-	if (!buf)
-		return -ENOMEM;
-
 	drm_mode = &debug->panel->dp_mode.drm_mode;
 
-	rc = snprintf(buf + len, max_size, "\tname = %s\n", DEBUG_NAME);
-	if (dp_debug_check_buffer_overflow(rc, &max_size, &len))
-		goto error;
-
-	rc = snprintf(buf + len, max_size,
-			"\tdp_panel\n\t\tmax_pclk_khz = %d\n",
+	seq_printf(seq, "\tname = %s\n", DEBUG_NAME);
+	seq_printf(seq, "\tdp_panel\n\t\tmax_pclk_khz = %d\n",
 			debug->panel->max_pclk_khz);
-	if (dp_debug_check_buffer_overflow(rc, &max_size, &len))
-		goto error;
-
-	rc = snprintf(buf + len, max_size,
-			"\tdrm_dp_link\n\t\trate = %u\n",
+	seq_printf(seq, "\tdrm_dp_link\n\t\trate = %u\n",
 			debug->panel->link_info.rate);
-	if (dp_debug_check_buffer_overflow(rc, &max_size, &len))
-		goto error;
-
-	rc = snprintf(buf + len, max_size,
-			 "\t\tnum_lanes = %u\n",
+	seq_printf(seq, "\t\tnum_lanes = %u\n",
 			debug->panel->link_info.num_lanes);
-	if (dp_debug_check_buffer_overflow(rc, &max_size, &len))
-		goto error;
-
-	rc = snprintf(buf + len, max_size,
-			"\t\tcapabilities = %lu\n",
+	seq_printf(seq, "\t\tcapabilities = %lu\n",
 			debug->panel->link_info.capabilities);
-	if (dp_debug_check_buffer_overflow(rc, &max_size, &len))
-		goto error;
-
-	rc = snprintf(buf + len, max_size,
-			"\tdp_panel_info:\n\t\tactive = %dx%d\n",
+	seq_printf(seq, "\tdp_panel_info:\n\t\tactive = %dx%d\n",
 			drm_mode->hdisplay,
 			drm_mode->vdisplay);
-	if (dp_debug_check_buffer_overflow(rc, &max_size, &len))
-		goto error;
-
-	rc = snprintf(buf + len, max_size,
-			"\t\tback_porch = %dx%d\n",
+	seq_printf(seq, "\t\tback_porch = %dx%d\n",
 			drm_mode->htotal - drm_mode->hsync_end,
 			drm_mode->vtotal - drm_mode->vsync_end);
-	if (dp_debug_check_buffer_overflow(rc, &max_size, &len))
-		goto error;
-
-	rc = snprintf(buf + len, max_size,
-			"\t\tfront_porch = %dx%d\n",
+	seq_printf(seq, "\t\tfront_porch = %dx%d\n",
 			drm_mode->hsync_start - drm_mode->hdisplay,
 			drm_mode->vsync_start - drm_mode->vdisplay);
-	if (dp_debug_check_buffer_overflow(rc, &max_size, &len))
-		goto error;
-
-	rc = snprintf(buf + len, max_size,
-			"\t\tsync_width = %dx%d\n",
+	seq_printf(seq, "\t\tsync_width = %dx%d\n",
 			drm_mode->hsync_end - drm_mode->hsync_start,
 			drm_mode->vsync_end - drm_mode->vsync_start);
-	if (dp_debug_check_buffer_overflow(rc, &max_size, &len))
-		goto error;
-
-	rc = snprintf(buf + len, max_size,
-			"\t\tactive_low = %dx%d\n",
+	seq_printf(seq, "\t\tactive_low = %dx%d\n",
 			debug->panel->dp_mode.h_active_low,
 			debug->panel->dp_mode.v_active_low);
-	if (dp_debug_check_buffer_overflow(rc, &max_size, &len))
-		goto error;
-
-	rc = snprintf(buf + len, max_size,
-			"\t\th_skew = %d\n",
+	seq_printf(seq, "\t\th_skew = %d\n",
 			drm_mode->hskew);
-	if (dp_debug_check_buffer_overflow(rc, &max_size, &len))
-		goto error;
-
-	rc = snprintf(buf + len, max_size,
-			"\t\trefresh rate = %d\n",
+	seq_printf(seq, "\t\trefresh rate = %d\n",
 			drm_mode_vrefresh(drm_mode));
-	if (dp_debug_check_buffer_overflow(rc, &max_size, &len))
-		goto error;
-
-	rc = snprintf(buf + len, max_size,
-			"\t\tpixel clock khz = %d\n",
+	seq_printf(seq, "\t\tpixel clock khz = %d\n",
 			drm_mode->clock);
-	if (dp_debug_check_buffer_overflow(rc, &max_size, &len))
-		goto error;
-
-	rc = snprintf(buf + len, max_size,
-			"\t\tbpp = %d\n",
+	seq_printf(seq, "\t\tbpp = %d\n",
 			debug->panel->dp_mode.bpp);
-	if (dp_debug_check_buffer_overflow(rc, &max_size, &len))
-		goto error;
 
 	/* Link Information */
-	rc = snprintf(buf + len, max_size,
-			"\tdp_link:\n\t\ttest_requested = %d\n",
+	seq_printf(seq, "\tdp_link:\n\t\ttest_requested = %d\n",
 			debug->link->sink_request);
-	if (dp_debug_check_buffer_overflow(rc, &max_size, &len))
-		goto error;
-
-	rc = snprintf(buf + len, max_size,
-			"\t\tnum_lanes = %d\n",
+	seq_printf(seq, "\t\tnum_lanes = %d\n",
 			debug->link->link_params.num_lanes);
-	if (dp_debug_check_buffer_overflow(rc, &max_size, &len))
-		goto error;
-
 	link_params_rate = debug->link->link_params.rate;
-	rc = snprintf(buf + len, max_size,
-			"\t\tbw_code = %d\n",
+	seq_printf(seq, "\t\tbw_code = %d\n",
 			drm_dp_link_rate_to_bw_code(link_params_rate));
-	if (dp_debug_check_buffer_overflow(rc, &max_size, &len))
-		goto error;
-
 	lclk = debug->link->link_params.rate * 1000;
-	rc = snprintf(buf + len, max_size,
-			"\t\tlclk = %lld\n", lclk);
-	if (dp_debug_check_buffer_overflow(rc, &max_size, &len))
-		goto error;
-
-	rc = snprintf(buf + len, max_size,
-			"\t\tv_level = %d\n",
+	seq_printf(seq, "\t\tlclk = %lld\n", lclk);
+	seq_printf(seq, "\t\tv_level = %d\n",
 			debug->link->phy_params.v_level);
-	if (dp_debug_check_buffer_overflow(rc, &max_size, &len))
-		goto error;
-
-	rc = snprintf(buf + len, max_size,
-			"\t\tp_level = %d\n",
+	seq_printf(seq, "\t\tp_level = %d\n",
 			debug->link->phy_params.p_level);
-	if (dp_debug_check_buffer_overflow(rc, &max_size, &len))
-		goto error;
-
-	if (copy_to_user(user_buff, buf, len))
-		goto error;
-
-	*ppos += len;
 
-	kfree(buf);
-	return len;
- error:
-	kfree(buf);
-	return -EINVAL;
+	return 0;
 }
+DEFINE_SHOW_ATTRIBUTE(dp_debug);
 
 static int dp_test_data_show(struct seq_file *m, void *data)
 {
@@ -349,11 +241,6 @@ static int dp_test_active_open(struct inode *inode,
 			inode->i_private);
 }
 
-static const struct file_operations dp_debug_fops = {
-	.open = simple_open,
-	.read = dp_debug_read_info,
-};
-
 static const struct file_operations test_active_fops = {
 	.owner = THIS_MODULE,
 	.open = dp_test_active_open,
-- 
2.29.2

