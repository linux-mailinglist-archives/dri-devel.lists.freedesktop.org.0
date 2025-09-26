Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB47ABA3320
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 11:40:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DC2510E35D;
	Fri, 26 Sep 2025 09:40:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.b="XcfYHaNt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CB3110E363
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 09:40:19 +0000 (UTC)
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id BF1923FD03
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 09:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1758879616;
 bh=Z5kDmnvnhlDRdp/yu6a3wA2T9wPYLylMulJWmEaCrD0=;
 h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
 b=XcfYHaNtgQsJqVg0nhOioS5sDCNFWbq0m/kymCYVAIdCzIUoZ+8efwTDQgO7Ud3Nk
 1Aj1LxdelyVH/jW2LwZwGR5kHQ0XDhsljewgnKr5Tb61HonJR/3jtv1kMM0DaUORDU
 lBhtmpz3UztDFmOQMws6L/Pnm3+LAk1sm5Q8K7RjVvRZMomj/+3baFIhJ7LHjfQir7
 PpXQL0xZSGW72p3RxclwYQXM0cLXd5ccOwCvCPp3EhhrMW7RPpQznLPC/kcpVqZLur
 RHExJMhZ8SYRESE8/LVgnbhV4CHjtKcq072syu0QmxvOiS6YSOTxLVJsln9IWnVzc7
 1klgQE9P47hww==
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4de2c597a6eso7957971cf.1
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 02:40:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758879615; x=1759484415;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Z5kDmnvnhlDRdp/yu6a3wA2T9wPYLylMulJWmEaCrD0=;
 b=I+tTdFtEykH6HZnrdcQScVX4ZXywigNloRuk69qxJMs+rmIPKJp1/qUswhzPwE2AVm
 UUIYxcsXuYlfV1+/mOBAdWw6e/bHaTmqZTDAv+zCyM0G8xkVElyhW23YqNJeSYsPGvlK
 KQWcbHYpwPEmcTgS/6gv7+4yo95/TdSdQPxl9dkc13hA39iQoHQXns2nIWhs0UXEHWgn
 X0Jv9aQfXgC4oHjyQqu55e6as4xewZww7fNM/PE95qlyf96BzRN9aWmBi78bB2+1dVb1
 mUQuETeUt82lFoB6JxapzXia4Gnv2/1Qzn+KynKCacymoBYAXtRPeY/KX0+ShadxF+BA
 N30w==
X-Gm-Message-State: AOJu0Yzqras8ZMEzL3Qk5oODn3EcNBoBS/EX4qVbpq8CtwwWYryzA6J0
 bdmrbImM8/0Y7czCR8O/0vUy9JSpxAhTwjo/3CZqL+tvjZGZqz8hIfat7c2Bjz5fcAFRnx75+sM
 lpoOqM8kQ/FzrgLJOT7pqkThJr13v8Q0oPxizxsANKW27IjRHLnF7kOo1hLe5wzrna26udrgxys
 fgZI4L2PyBtuwzTAISCNiO
X-Gm-Gg: ASbGncu/Gl9ozlrHmlUx+xT8tfl4+HDsAApmbMZwjfe/F0HlA5R5naJJfRqK8oWH+wS
 RVcPIxhW3Nj5GC4V2PkegawDo2yCIZzggSXAQ3/B2zk9czKcEvLb8YZImK1IOfbvIcAQkU4CARC
 wHeJQsjdM1NQKzinjUnIRZJQUQSmjLbY+a5E60LFCEb/kZ0m5jHUeWJfoaH68eE3A5XSbCGLWWy
 aH9C29nu/9Das8QtiGN0S3NVA8C4NPAjccmjGQN97kWTYPOeydxwDeB69f7NM/KInOOIIEAK4BG
 zjD8dYRQgArt8rcekQBnH/EoZK24SO6M/KQGC4knhGAL/sKzKZ5iEPFh
X-Received: by 2002:a05:622a:3d2:b0:4b5:e8b9:30f7 with SMTP id
 d75a77b69052e-4da4b807e9bmr98240371cf.46.1758879615469; 
 Fri, 26 Sep 2025 02:40:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGDKtjAu7rS5XGAm/zzFv4YkYyqjAXqHUIUP7F2BwPon3qUmzfWY0fG/FuWugk1l3HM5ToH/Q==
X-Received: by 2002:a05:622a:3d2:b0:4b5:e8b9:30f7 with SMTP id
 d75a77b69052e-4da4b807e9bmr98240231cf.46.1758879615163; 
 Fri, 26 Sep 2025 02:40:15 -0700 (PDT)
Received: from localhost.localdomain ([103.155.100.14])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-80135b563b2sm23419766d6.14.2025.09.26.02.40.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Sep 2025 02:40:14 -0700 (PDT)
From: Aaron Ma <aaron.ma@canonical.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, jani.nikula@linux.intel.com,
 rodrigo.vivi@intel.com, suraj.kandpal@intel.com, imre.deak@intel.com,
 joonas.lahtinen@linux.intel.com, aaron.ma@canonical.com
Subject: [PATCH v2 1/2] drm/dp: Add drm_edp_backlight_get_level
Date: Fri, 26 Sep 2025 17:38:31 +0800
Message-ID: <20250926093832.2811200-1-aaron.ma@canonical.com>
X-Mailer: git-send-email 2.43.0
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

Implement drm_edp_backlight_get_level() to read the current
backlight brightness level from eDP DPCD registers via AUX channel.

Signed-off-by: Aaron Ma <aaron.ma@canonical.com>
---
v1 -> v2: Use drm_err.

 drivers/gpu/drm/display/drm_dp_helper.c | 52 +++++++++++++++++++++++++
 include/drm/display/drm_dp_helper.h     |  1 +
 2 files changed, 53 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index 1ecc3df7e3167..16da5df805aa5 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -3945,6 +3945,58 @@ int drm_dp_pcon_convert_rgb_to_ycbcr(struct drm_dp_aux *aux, u8 color_spc)
 }
 EXPORT_SYMBOL(drm_dp_pcon_convert_rgb_to_ycbcr);
 
+/**
+ * drm_edp_backlight_get_level - Get the backlight level of eDP DPCD via AUX
+ * @aux: The DP aux device
+ * @bl: Backlight capability info from the panel
+ *
+ * Reads the current backlight brightness level from luminance mode
+ * (24-bit value in nits) or DPCD AUX mode(16-bit and 8-bit modes).
+ *
+ * Returns: Current backlight level.
+ */
+u32 drm_edp_backlight_get_level(struct drm_dp_aux *aux, const struct drm_edp_backlight_info *bl)
+{
+	int ret;
+	u8 buf[3] = { 0 };
+	u32 level = 0;
+
+	if (!(bl->aux_set || bl->luminance_set))
+		return 0;
+
+	if (bl->luminance_set) {
+		ret = drm_dp_dpcd_read(aux, DP_EDP_PANEL_TARGET_LUMINANCE_VALUE, buf, sizeof(buf));
+		if (ret < 0) {
+			drm_err(aux->drm_dev,
+				      "%s: Failed to read luminance value: %d\n",
+				      aux->name, ret);
+			return 0;
+		}
+		level = (buf[2] << 16 | buf[1] << 8 | buf[0]) / 1000;
+	} else if (bl->lsb_reg_used) {
+		ret = drm_dp_dpcd_read(aux, DP_EDP_BACKLIGHT_BRIGHTNESS_MSB, buf, 2);
+		if (ret < 0) {
+			drm_err(aux->drm_dev,
+				      "%s: Failed to read backlight level: %d\n",
+				      aux->name, ret);
+			return 0;
+		}
+		level = buf[0] << 8 | buf[1];
+	} else {
+		ret = drm_dp_dpcd_read(aux, DP_EDP_BACKLIGHT_BRIGHTNESS_MSB, buf, 1);
+		if (ret < 0) {
+			drm_err(aux->drm_dev,
+				      "%s: Failed to read backlight level: %d\n",
+				      aux->name, ret);
+			return 0;
+		}
+		level = buf[0];
+	}
+
+	return level;
+}
+EXPORT_SYMBOL(drm_edp_backlight_get_level);
+
 /**
  * drm_edp_backlight_set_level() - Set the backlight level of an eDP panel via AUX
  * @aux: The DP AUX channel to use
diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index 87caa4f1fdb86..0b045a47ae573 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -864,6 +864,7 @@ drm_edp_backlight_init(struct drm_dp_aux *aux, struct drm_edp_backlight_info *bl
 		       u32 max_luminance,
 		       u16 driver_pwm_freq_hz, const u8 edp_dpcd[EDP_DISPLAY_CTL_CAP_SIZE],
 		       u32 *current_level, u8 *current_mode, bool need_luminance);
+u32 drm_edp_backlight_get_level(struct drm_dp_aux *aux, const struct drm_edp_backlight_info *bl);
 int drm_edp_backlight_set_level(struct drm_dp_aux *aux, const struct drm_edp_backlight_info *bl,
 				u32 level);
 int drm_edp_backlight_enable(struct drm_dp_aux *aux, const struct drm_edp_backlight_info *bl,
-- 
2.43.0

