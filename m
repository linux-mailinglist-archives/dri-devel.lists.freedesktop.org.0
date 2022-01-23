Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B20BD4970E5
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jan 2022 11:17:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDF0B10E76E;
	Sun, 23 Jan 2022 10:17:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD56410E76E
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jan 2022 10:17:26 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id h7so13075979ejf.1
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jan 2022 02:17:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2iy16eZ/8KIu1y+yI2Pifo0EJLpB2bXPz8ItH4g7xCg=;
 b=TFCbwtAYhoCN60QorwD7oa8TeSNVxX6NolFhQF/xg/vt20xkaEstssYzGYSLtZtZN8
 Svbams48D2z46rk1mfUgUVp1yx6c/thiFA/dFIFoiVXX5Mo3T7BkwWSauCcJjbQUNVuv
 uGZpwZB4d/yMC8gKv6kwEQqtMZVwYiaQ8iaeq1448MIVkD8QOuzcD9TtKWW/XsL1eFEE
 gliRhfPHQ+BsV2BVHzSGMOrdOoM2uRp/Fsf0u1kVgJSzmzdbVw/ToaTHxiVVcgsQxXsT
 H7TWrNnrQ+kGhuTcSA/Gk0soIDaCxV5NSBhyFT9aSoKIxuwFm+voRulhIkH9bfkpTSgF
 m6nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2iy16eZ/8KIu1y+yI2Pifo0EJLpB2bXPz8ItH4g7xCg=;
 b=hJQRqF8RDtsbMUYHYppTiYEHNfaB3UXUJECw9wie74OsV4z0OL4ZZMdTyGLjggArQ6
 cAxWKZXa/qMGj98/TIj1G9JowScC7VjQXuM4IFUb+WiCKy3fLUzfcLfTVMJT+wiAW+2r
 EmXF6RlKpTHnOFh9AiGtPWR3oEeIzPbY7m6OJSGwrWGUao+4meqwHIXB5LkYu9bKWjhn
 9H5YiPj7x0N5Ljgf1hW465NKLOq1cOSSpY4LkUGjRb2f0+g4fEGjW+bcpAfwyUJYUknK
 iC+4bQd3w2xlAQfjEkBukafFxrcI0r6YF7zXuN7FI/gMLg55yp2ioueg8/xnULG3bOBJ
 IQ9Q==
X-Gm-Message-State: AOAM530LYvlDtPlkZNAYGaPsEBk4ldmEePzHfuhF7hZPVU4kHWuLj8ne
 44Kw31Pe9gbZ8EKC2zjIBeGoBQaI0ubJuw==
X-Google-Smtp-Source: ABdhPJwh+ipTYY+mupzO1oxSTio825DFYWg0CilhjqUU01oA3tdPpLKfHIrYJW222jGnV2wtAjSFRw==
X-Received: by 2002:a17:907:a41f:: with SMTP id
 sg31mr383840ejc.359.1642933045302; 
 Sun, 23 Jan 2022 02:17:25 -0800 (PST)
Received: from ped.lan (dynamic-046-114-141-233.46.114.pool.telefonica.de.
 [46.114.141.233])
 by smtp.googlemail.com with ESMTPSA id by22sm3670552ejb.5.2022.01.23.02.17.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jan 2022 02:17:24 -0800 (PST)
From: Philipp Zabel <philipp.zabel@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/2] drm/edid: support Microsoft extension for HMDs and
 specialized monitors
Date: Sun, 23 Jan 2022 11:16:52 +0100
Message-Id: <20220123101653.147333-1-philipp.zabel@gmail.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Jani Nikula <jani.nikula@intel.com>,
 Jakob Bornecrantz <jakob@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add minimal support for parsing VSDBs documented in Microsoft's "EDID
extension for head-mounted and specialized monitors" [1]. The version
field and the desktop usage flag can be used to set the non_desktop
connector property.

[1] https://docs.microsoft.com/en-us/windows-hardware/drivers/display/specialized-monitors-edid-extension

Tested with HPN-36C1 and LEN-B800.

Signed-off-by: Philipp Zabel <philipp.zabel@gmail.com>
Reviewed-by: Jani Nikula <jani.nikula@intel.com>
---
Changes since v1 [2]:
 - Split out quirk removal into a separate patch.
 - Set non_desktop to true instead of 1.

[2] https://lore.kernel.org/all/20211213184706.5776-1-philipp.zabel@gmail.com/
---
 drivers/gpu/drm/drm_edid.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 12893e7be89b..271b5616cfaf 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -93,6 +93,8 @@ static int oui(u8 first, u8 second, u8 third)
 /* Non desktop display (i.e. HMD) */
 #define EDID_QUIRK_NON_DESKTOP			(1 << 12)
 
+#define MICROSOFT_IEEE_OUI	0xca125c
+
 struct detailed_mode_closure {
 	struct drm_connector *connector;
 	struct edid *edid;
@@ -4222,6 +4224,17 @@ static bool cea_db_is_hdmi_forum_vsdb(const u8 *db)
 	return oui(db[3], db[2], db[1]) == HDMI_FORUM_IEEE_OUI;
 }
 
+static bool cea_db_is_microsoft_vsdb(const u8 *db)
+{
+	if (cea_db_tag(db) != VENDOR_BLOCK)
+		return false;
+
+	if (cea_db_payload_len(db) != 21)
+		return false;
+
+	return oui(db[3], db[2], db[1]) == MICROSOFT_IEEE_OUI;
+}
+
 static bool cea_db_is_vcdb(const u8 *db)
 {
 	if (cea_db_tag(db) != USE_EXTENDED_TAG)
@@ -5149,6 +5162,25 @@ drm_parse_hdmi_vsdb_video(struct drm_connector *connector, const u8 *db)
 	drm_parse_hdmi_deep_color_info(connector, db);
 }
 
+/*
+ * See EDID extension for head-mounted and specialized monitors, specified at:
+ * https://docs.microsoft.com/en-us/windows-hardware/drivers/display/specialized-monitors-edid-extension
+ */
+static void drm_parse_microsoft_vsdb(struct drm_connector *connector,
+				     const u8 *db)
+{
+	struct drm_display_info *info = &connector->display_info;
+	u8 version = db[4];
+	bool desktop_usage = db[5] & BIT(6);
+
+	/* Version 1 and 2 for HMDs, version 3 flags desktop usage explicitly */
+	if (version == 1 || version == 2 || (version == 3 && !desktop_usage))
+		info->non_desktop = true;
+
+	drm_dbg_kms(connector->dev, "HMD or specialized display VSDB version %u: 0x%02x\n",
+		    version, db[5]);
+}
+
 static void drm_parse_cea_ext(struct drm_connector *connector,
 			      const struct edid *edid)
 {
@@ -5179,6 +5211,8 @@ static void drm_parse_cea_ext(struct drm_connector *connector,
 			drm_parse_hdmi_vsdb_video(connector, db);
 		if (cea_db_is_hdmi_forum_vsdb(db))
 			drm_parse_hdmi_forum_vsdb(connector, db);
+		if (cea_db_is_microsoft_vsdb(db))
+			drm_parse_microsoft_vsdb(connector, db);
 		if (cea_db_is_y420cmdb(db))
 			drm_parse_y420cmdb_bitmap(connector, db);
 		if (cea_db_is_vcdb(db))

base-commit: e783362eb54cd99b2cac8b3a9aeac942e6f6ac07
-- 
2.34.1

