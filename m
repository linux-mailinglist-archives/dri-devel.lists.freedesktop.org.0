Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF56047344B
	for <lists+dri-devel@lfdr.de>; Mon, 13 Dec 2021 19:47:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74ADC10E896;
	Mon, 13 Dec 2021 18:47:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C36110E896
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Dec 2021 18:47:18 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id e3so56139803edu.4
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Dec 2021 10:47:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RUMn6MjFzrXHUKVokwPRISMgt7vvrPNIYL51NxhBoEw=;
 b=ZyaPJRH81bXj/YKNpbPb/FQa9djfdfhGiBJssQ+LSlhIm3OICqERoGZymxrjzVPCWZ
 ktYmAb3s3VZzWokXbPT21GKYGIYkuFGtnJ4MSubTJTWsraSqYMVFOf00FRj90eaqy+aU
 4AO70TFfdGy+eAqE1ng3k6fj2ZHE2Zy3Hg2JtOrSXNqbDNTr5zNU5TapbFNtYQzujbZo
 507sAh7cw5zQ1RjaIZ+tA9b2SZ1uXVnlgSsBVxOSm3vWfVYTewoJnWfxbOMZlRpI/FI3
 HossXSSHuwpxnnH7E1oRcjgzzg2ApZiqDqo0g95TZV8HKAxTd6dwHz918+/XC9zFptq+
 FaVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RUMn6MjFzrXHUKVokwPRISMgt7vvrPNIYL51NxhBoEw=;
 b=4oIpIfd8X7mYclhKTbyfBicLnPU4PCv5BXezQoHYaP8ZpJN2KcFlXno6kRMDYNYflO
 PQ09c3Lh5dPUsz3ZpL+sYH3LOu+MCmZAIzbpb5VQ0mURTlCVFMgZH/sX33uKvnmliAn+
 jvRhLFNVnnZUAhg1+eBlxgGa/1J596ptca9dx+rBiPu4U9qhkeI7nFs9rQGw9tKiucsz
 XYfoHlROVgitLQZK3EPc9iLywmWWfhqOfuzMWRF6Op9b9fSKLVDkX5mQ09RPyI1WsILF
 8gIBA44ojrfYQIsrf2+3Sk/7K5OfU+trqGItZ7pgmvkWbn7k2JX5gLdhcEU72HlqFOBx
 +g8g==
X-Gm-Message-State: AOAM533TphB96ee/yVDzvA11iJSV9nB51nNHFr4bFLeDP3kIYsolN8Ip
 9ueU7zDqVK6nsF79grqeM9xXtkdQ47dCqg==
X-Google-Smtp-Source: ABdhPJxck1od+Xk+qW2iXgTOTugWurCERPzN2szGgbyGPI3QQcNo4BE/LxJqE3IIkOFRwffjDA+nHA==
X-Received: by 2002:a17:907:7245:: with SMTP id
 ds5mr227148ejc.206.1639421237034; 
 Mon, 13 Dec 2021 10:47:17 -0800 (PST)
Received: from ped.lan (dynamic-046-114-038-005.46.114.pool.telefonica.de.
 [46.114.38.5])
 by smtp.googlemail.com with ESMTPSA id sg39sm6107015ejc.66.2021.12.13.10.47.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 10:47:16 -0800 (PST)
From: Philipp Zabel <philipp.zabel@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/edid: support Microsoft extension for HMDs and
 specialized monitors
Date: Mon, 13 Dec 2021 19:47:06 +0100
Message-Id: <20211213184706.5776-1-philipp.zabel@gmail.com>
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
Cc: Jakob Bornecrantz <jakob@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add minimal support for parsing VSDBs documented in Microsoft's "EDID
extension for head-mounted and specialized monitors" [1]. The version
field and the desktop usage flag can be used to set the non_desktop
connector property.

Remove the non-desktop quirk for devices that are verified to contain
the VSDB: HPN-3515 and LEN-B800. Presumably most of the other Windows
Mixed Reality headsets contain it as well, but there are ACR-7FCE and
SEC-5194 devices without it.

[1] https://docs.microsoft.com/en-us/windows-hardware/drivers/display/specialized-monitors-edid-extension

Tested with HPN-36C1 and LEN-B800.

Signed-off-by: Philipp Zabel <philipp.zabel@gmail.com>
---
 drivers/gpu/drm/drm_edid.c | 36 ++++++++++++++++++++++++++++++++++--
 1 file changed, 34 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 12893e7be89b..baea65dfff7d 100644
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
@@ -212,9 +214,7 @@ static const struct edid_quirk {
 
 	/* Windows Mixed Reality Headsets */
 	EDID_QUIRK('A', 'C', 'R', 0x7fce, EDID_QUIRK_NON_DESKTOP),
-	EDID_QUIRK('H', 'P', 'N', 0x3515, EDID_QUIRK_NON_DESKTOP),
 	EDID_QUIRK('L', 'E', 'N', 0x0408, EDID_QUIRK_NON_DESKTOP),
-	EDID_QUIRK('L', 'E', 'N', 0xb800, EDID_QUIRK_NON_DESKTOP),
 	EDID_QUIRK('F', 'U', 'J', 0x1970, EDID_QUIRK_NON_DESKTOP),
 	EDID_QUIRK('D', 'E', 'L', 0x7fce, EDID_QUIRK_NON_DESKTOP),
 	EDID_QUIRK('S', 'E', 'C', 0x144a, EDID_QUIRK_NON_DESKTOP),
@@ -4222,6 +4222,17 @@ static bool cea_db_is_hdmi_forum_vsdb(const u8 *db)
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
@@ -5149,6 +5160,25 @@ drm_parse_hdmi_vsdb_video(struct drm_connector *connector, const u8 *db)
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
+		info->non_desktop = 1;
+
+	drm_dbg_kms(connector->dev, "HMD or specialized display VSDB version %u: 0x%02x\n",
+		    version, db[5]);
+}
+
 static void drm_parse_cea_ext(struct drm_connector *connector,
 			      const struct edid *edid)
 {
@@ -5179,6 +5209,8 @@ static void drm_parse_cea_ext(struct drm_connector *connector,
 			drm_parse_hdmi_vsdb_video(connector, db);
 		if (cea_db_is_hdmi_forum_vsdb(db))
 			drm_parse_hdmi_forum_vsdb(connector, db);
+		if (cea_db_is_microsoft_vsdb(db))
+			drm_parse_microsoft_vsdb(connector, db);
 		if (cea_db_is_y420cmdb(db))
 			drm_parse_y420cmdb_bitmap(connector, db);
 		if (cea_db_is_vcdb(db))

base-commit: fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf
-- 
2.34.1

