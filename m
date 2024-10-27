Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12BAD9B1C61
	for <lists+dri-devel@lfdr.de>; Sun, 27 Oct 2024 08:51:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69AF510E1DA;
	Sun, 27 Oct 2024 07:51:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HsMDsWu6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBB5D10E1DA
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Oct 2024 07:51:27 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id
 41be03b00d2f7-7ed9f1bcb6bso2156947a12.1
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Oct 2024 00:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730015487; x=1730620287; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nzgoY73OAH7IN4I8JIVtQ+45LcH7GhgBHjlXlGpHvfY=;
 b=HsMDsWu6CRVA5hBeBXnlJDO+foTR1deZlcnlt0JzCHW6823hHUX34IED6vAYlhudnd
 vYw8SgUNhU2c3+X7DpoIsQRMFT2QsllncV+NRK9TGc6CqH48ORNkVjgCKe0vjcn6mfhv
 BHgJfbhzMU3/+EdVchhktNuTt4Ew1GycGdHhY6D4dnif6GXrIXZPfpOaWNMCXbdfWAeT
 teLtkmel4Q4CL6bTKGG014hRoncf1PHKqyiPStNyQFpbfTTgAD1z51WkgK4RYZOnqBxh
 CyDriZk55bPtcNDQ9HUVa+ibi4BLLjTqyLNDZlB5h6rEghZ90AcHfwf7SXRbIQtIvHNE
 mUbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730015487; x=1730620287;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nzgoY73OAH7IN4I8JIVtQ+45LcH7GhgBHjlXlGpHvfY=;
 b=Wb9sdgWUQrzI5/jdMT6mojdB6nDyndrdUgv0Yz7V7uthlxtMHzLroXZqie19sdCFuC
 SLO5kaOd4hqk561VEv+/DCyuwEg4ZMudUX2QOikwFP+FdJO59xam/VAhOC9nauYa82Fk
 kTHgzSfbiFaibMDRJ3G+TVrnj2jPnyyeJqTh2zA4VYRnkg7wnf3n9zeavF45x/Kfg+MI
 nVYvmkaId16aj2xEMPSnQEV3IV9M4KgQsQDjBJfGmyglbsJxaYrkIO0i0epsVhv+GqGC
 ON2Dau0nmyNEpBndWhhDJzJ1eJFLEg5hDNTIn5vAb9llvNCjPIcqLZgM3LR5TqFaAHLj
 d3Ug==
X-Forwarded-Encrypted: i=1;
 AJvYcCUm3SFkC79m/UxGTDn+lrhSJJmKZJlZyGw0x/vDQUZO3t1V7nn4q/+JCvc3luTLTS9dSReqmnn0qw4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxixYFQaEPfNDdPHnLZAsv4RJ50SPvKAkJ1kq4Z9whvPEcLAuo4
 mFLews9NwEF64K8zMabxYR2g48naweeQwbE/KuHDi60Vv+gq0bHV
X-Google-Smtp-Source: AGHT+IFIvv3jnR4vgZY784qrPZUlPI3xPYuwCE5+QmhB3umvWUCbhT9ijcuc5ukibYVcOx+Qde/7kQ==
X-Received: by 2002:a05:6a21:1193:b0:1d9:61:e779 with SMTP id
 adf61e73a8af0-1d9a83ab127mr6572670637.4.1730015487264; 
 Sun, 27 Oct 2024 00:51:27 -0700 (PDT)
Received: from fedora.. ([2405:201:d007:50c2:b7e7:6df3:9958:a45d])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7205794f9a1sm3785551b3a.90.2024.10.27.00.51.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Oct 2024 00:51:26 -0700 (PDT)
From: Vamsi Krishna Brahmajosyula <vamsikrishna.brahmajosyula@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, jani.nikula@linux.intel.com
Cc: skhan@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] drm/edid: convert drm_parse_microsoft_vsdb to use struct
 cea_db *
Date: Sun, 27 Oct 2024 13:21:06 +0530
Message-ID: <20241027075108.14273-4-vamsikrishna.brahmajosyula@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241027075108.14273-1-vamsikrishna.brahmajosyula@gmail.com>
References: <20241027075108.14273-1-vamsikrishna.brahmajosyula@gmail.com>
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

Address the following
	FIXME: convert parsers to use struct cea_db
in the parser drm_parse_microsoft_vsdb

cea_db contains len and then data. Appropriately change the indices
when referring to individual elements (db[n] becomes data[n-1]).

Signed-off-by: Vamsi Krishna Brahmajosyula <vamsikrishna.brahmajosyula@gmail.com>
---
 drivers/gpu/drm/drm_edid.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index f79d8fbdb62b..e2ef07d00aaf 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -6361,11 +6361,12 @@ drm_parse_hdmi_vsdb_video(struct drm_connector *connector, const struct cea_db *
  * https://docs.microsoft.com/en-us/windows-hardware/drivers/display/specialized-monitors-edid-extension
  */
 static void drm_parse_microsoft_vsdb(struct drm_connector *connector,
-				     const u8 *db)
+				     const struct cea_db *db)
 {
 	struct drm_display_info *info = &connector->display_info;
-	u8 version = db[4];
-	bool desktop_usage = db[5] & BIT(6);
+	const u8 *data = cea_db_data(db);
+	u8 version = data[3];
+	bool desktop_usage = data[4] & BIT(6);
 
 	/* Version 1 and 2 for HMDs, version 3 flags desktop usage explicitly */
 	if (version == 1 || version == 2 || (version == 3 && !desktop_usage))
@@ -6373,7 +6374,7 @@ static void drm_parse_microsoft_vsdb(struct drm_connector *connector,
 
 	drm_dbg_kms(connector->dev,
 		    "[CONNECTOR:%d:%s] HMD or specialized display VSDB version %u: 0x%02x\n",
-		    connector->base.id, connector->name, version, db[5]);
+		    connector->base.id, connector->name, version, data[4]);
 }
 
 static void drm_parse_cea_ext(struct drm_connector *connector,
@@ -6423,7 +6424,7 @@ static void drm_parse_cea_ext(struct drm_connector *connector,
 			 cea_db_is_hdmi_forum_scdb(db))
 			drm_parse_hdmi_forum_scds(connector, db);
 		else if (cea_db_is_microsoft_vsdb(db))
-			drm_parse_microsoft_vsdb(connector, data);
+			drm_parse_microsoft_vsdb(connector, db);
 		else if (cea_db_is_y420cmdb(db))
 			parse_cta_y420cmdb(connector, db, &y420cmdb_map);
 		else if (cea_db_is_y420vdb(db))
-- 
2.47.0

