Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5974C3CC7
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 04:56:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5FDD10E72E;
	Fri, 25 Feb 2022 03:56:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EF7410E630
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Feb 2022 03:56:15 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 bx9-20020a17090af48900b001bc64ee7d3cso3709207pjb.4
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Feb 2022 19:56:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=t1YLXoniWu3jrtmL+uCy1jECjrrpF17pHln6fAOn2n8=;
 b=EQ8sDEC4veLnMVpqMOWCemJqVV4A/T0kWbaYbsy4HrDd3J+hgLPFr87nfMeHoP69eE
 5CGIDZF3DYzdVjoL30WQ579opBa3sI8PY9akERrv9MkpP749itHUKrRBSi+qvDc96OG/
 ZBxkfnDsokLI52Dg0z9j5giVU6zhavAPmxfzc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=t1YLXoniWu3jrtmL+uCy1jECjrrpF17pHln6fAOn2n8=;
 b=lCO8BkXdJNzXlSr99mnWBTgXb+yXAC+jEQfc5hgm/ZvkcduZ6IP+xXxXR3IZD3ebqx
 K2LNAwHeph53rCvlr/xy1vqWpJxESlP3Zch1e3KC6vMXGICG7u4Y1tkfLZmxJV4Hx4EK
 3kjt8lcli4P0NxwpysVUxYY8WnFeaXQDC1k3LJEzaFHRYBnqnRJXIPB3JSx4mRY+gUvR
 Kz3eBF47lhC0WgoVGXl4724DzBJLzfjXRsBF0pVjewyn+5YITSoipp+Jfm9t4yVO/aaq
 wYTcFAOpghKqYGG+84HC2Y5GZcbNh80Yne1RnkxyAC1XZMZKk6SuO648CMdifjcEhLMj
 w1vQ==
X-Gm-Message-State: AOAM531mTaPVfnoRMy+dy7j97H8QEDh49GsuhzGThYNB4m6KfUbTYdhd
 XqhhtAUXbVRdlk7fzXB/87YojQ==
X-Google-Smtp-Source: ABdhPJyvsfwDWHtraGkWKHzQl5t0UqG9qA17+lPffgcNfhBwhleZBUpk0aciqN27yz1NpueBnjzKZw==
X-Received: by 2002:a17:90a:3944:b0:1bc:b6a2:f14d with SMTP id
 n4-20020a17090a394400b001bcb6a2f14dmr1288168pjf.124.1645761374904; 
 Thu, 24 Feb 2022 19:56:14 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 my6-20020a17090b4c8600b001bc2cb011dasm705551pjb.4.2022.02.24.19.56.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 19:56:14 -0800 (PST)
From: Kees Cook <keescook@chromium.org>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v3 2/2] drm/dp: Fix OOB read when handling Post Cursor2
 register
Date: Thu, 24 Feb 2022 19:56:10 -0800
Message-Id: <20220225035610.2552144-3-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220225035610.2552144-1-keescook@chromium.org>
References: <20220225035610.2552144-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4091; h=from:subject;
 bh=96sk9Gtx/XNCiooctnCaqAKLVeawEGKb7AZz4nCMFf0=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBiGFNadg22VDVgjy8AQWiUERRf01Zq/MODlSMQoZ58
 a8tOe/eJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYhhTWgAKCRCJcvTf3G3AJr2MEA
 CBjU4bY3VxDS3wV7gdhWpz4b/0P9Ujgue2yyAHPN90Srm5SEbd9jMDRfp9H3dMTE6A7BySPc4o4gCR
 H8DpGL5CHRY0FwK8TG4Cr5Zlzz9LxG6uR1SmCoPMKTL/XffQmUhYksEoIu/3dEgJZ7eoM+vpJFskuW
 1T7Rcvu7jZ67Fx9sx6UfydjkuT6ETIT2gXIcDQXoHV8yCTYlmeDitJC1PApnRtnt5jgsfijdWuaSiU
 eRQjO6kjpgRtVOQlIz+hSyrPRksjiOY8OP+BGBaOLSFmQKF/Dkq49nk6Tu35mBToYfI8ia6o9ad9jo
 phgnUAVHAb+HZNPaWujqkDUhtjnj2tEw18prgdSuhZDOg6h8F0asOGLDwphnrAek3sC38g+sqACLjI
 t4KGvAf/MLwYNA9ikaSgtexLqdviP6zkiRni6rIWS2Yq+reSSGMnhD9dN9hJXQLZn/Fe0bLEO6CK/V
 4tNBT8bwGzxQvENSJcZ5J2nEK7E6q0hNscsbSpm26rQk6F5GBzHgYpaanauTxZrAzvdTAKLeI3+ekA
 2ldZ2W9gkc3qihSz/5JUWAEhXQnu7vmiEiUiXEJMKNRRl1kR4lAF2nWF5+EeGQOdDNWzuDP3bo2MGY
 RPn4uZ8FQrQ/wlvt862eva/iKsmIKqTzYp32O+WmGyCqNgisw2umSF8GYzHg==
X-Developer-Key: i=keescook@chromium.org; a=openpgp;
 fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
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
Cc: Douglas Anderson <dianders@chromium.org>, Kees Cook <keescook@chromium.org>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 "Gustavo A . R . Silva" <gustavoars@kernel.org>,
 dri-devel@lists.freedesktop.org, Jonathan Hunter <jonathanh@nvidia.com>,
 Jani Nikula <jani.nikula@intel.com>, Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-tegra@vger.kernel.org,
 Dave Airlie <airlied@redhat.com>, Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Uma Shankar <uma.shankar@intel.com>, linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The link_status array was not large enough to read the Adjust Request
Post Cursor2 register, so remove the common helper function to avoid
an OOB read, found with a -Warray-bounds build:

drivers/gpu/drm/drm_dp_helper.c: In function 'drm_dp_get_adjust_request_post_cursor':
drivers/gpu/drm/drm_dp_helper.c:59:27: error: array subscript 10 is outside array bounds of 'const u8[6]' {aka 'const unsigned char[6]'} [-Werror=array-bounds]
   59 |         return link_status[r - DP_LANE0_1_STATUS];
      |                ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/drm_dp_helper.c:147:51: note: while referencing 'link_status'
  147 | u8 drm_dp_get_adjust_request_post_cursor(const u8 link_status[DP_LINK_STATUS_SIZE],
      |                                          ~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Replace the only user of the helper with an open-coded fetch and decode,
similar to drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c.

Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@linux.ie>
Cc: dri-devel@lists.freedesktop.org
Fixes: 79465e0ffeb9 ("drm/dp: Add helper to get post-cursor adjustments")
Signed-off-by: Kees Cook <keescook@chromium.org>
Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>
Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Link: https://lore.kernel.org/r/20220105173507.2420910-1-keescook@chromium.org
---
 drivers/gpu/drm/dp/drm_dp.c    | 10 ----------
 drivers/gpu/drm/tegra/dp.c     | 11 ++++++++++-
 include/drm/dp/drm_dp_helper.h |  2 --
 3 files changed, 10 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/dp/drm_dp.c b/drivers/gpu/drm/dp/drm_dp.c
index e159b81800d4..703972ae14c6 100644
--- a/drivers/gpu/drm/dp/drm_dp.c
+++ b/drivers/gpu/drm/dp/drm_dp.c
@@ -208,16 +208,6 @@ bool drm_dp_128b132b_link_training_failed(const u8 link_status[DP_LINK_STATUS_SI
 }
 EXPORT_SYMBOL(drm_dp_128b132b_link_training_failed);
 
-u8 drm_dp_get_adjust_request_post_cursor(const u8 link_status[DP_LINK_STATUS_SIZE],
-					 unsigned int lane)
-{
-	unsigned int offset = DP_ADJUST_REQUEST_POST_CURSOR2;
-	u8 value = dp_link_status(link_status, offset);
-
-	return (value >> (lane << 1)) & 0x3;
-}
-EXPORT_SYMBOL(drm_dp_get_adjust_request_post_cursor);
-
 static int __8b10b_clock_recovery_delay_us(const struct drm_dp_aux *aux, u8 rd_interval)
 {
 	if (rd_interval > 4)
diff --git a/drivers/gpu/drm/tegra/dp.c b/drivers/gpu/drm/tegra/dp.c
index e4369e5b2943..7295975e5733 100644
--- a/drivers/gpu/drm/tegra/dp.c
+++ b/drivers/gpu/drm/tegra/dp.c
@@ -549,6 +549,15 @@ static void drm_dp_link_get_adjustments(struct drm_dp_link *link,
 {
 	struct drm_dp_link_train_set *adjust = &link->train.adjust;
 	unsigned int i;
+	u8 post_cursor;
+	int err;
+
+	err = drm_dp_dpcd_read(link->aux, DP_ADJUST_REQUEST_POST_CURSOR2,
+			       &post_cursor, sizeof(post_cursor));
+	if (err < 0) {
+		DRM_ERROR("failed to read post_cursor2: %d\n", err);
+		post_cursor = 0;
+	}
 
 	for (i = 0; i < link->lanes; i++) {
 		adjust->voltage_swing[i] =
@@ -560,7 +569,7 @@ static void drm_dp_link_get_adjustments(struct drm_dp_link *link,
 				DP_TRAIN_PRE_EMPHASIS_SHIFT;
 
 		adjust->post_cursor[i] =
-			drm_dp_get_adjust_request_post_cursor(status, i);
+			(post_cursor >> (i << 1)) & 0x3;
 	}
 }
 
diff --git a/include/drm/dp/drm_dp_helper.h b/include/drm/dp/drm_dp_helper.h
index 2a0e75e69e80..51e02cf75277 100644
--- a/include/drm/dp/drm_dp_helper.h
+++ b/include/drm/dp/drm_dp_helper.h
@@ -1530,8 +1530,6 @@ u8 drm_dp_get_adjust_request_pre_emphasis(const u8 link_status[DP_LINK_STATUS_SI
 					  int lane);
 u8 drm_dp_get_adjust_tx_ffe_preset(const u8 link_status[DP_LINK_STATUS_SIZE],
 				   int lane);
-u8 drm_dp_get_adjust_request_post_cursor(const u8 link_status[DP_LINK_STATUS_SIZE],
-					 unsigned int lane);
 
 #define DP_BRANCH_OUI_HEADER_SIZE	0xc
 #define DP_RECEIVER_CAP_SIZE		0xf
-- 
2.30.2

