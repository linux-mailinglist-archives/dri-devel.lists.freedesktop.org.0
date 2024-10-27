Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC909B1C63
	for <lists+dri-devel@lfdr.de>; Sun, 27 Oct 2024 08:51:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C500510E21D;
	Sun, 27 Oct 2024 07:51:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nImrdwPQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D477F10E21D
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Oct 2024 07:51:31 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-20cf3e36a76so32561105ad.0
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Oct 2024 00:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730015491; x=1730620291; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=95caNnI7hgOLxEqas86hhjYPjq4p60okYGlZe1W9+VQ=;
 b=nImrdwPQeB9bL2sbAoAicchtSWb+JJZ81Qeqwr+TkoCI2o66Sufif7i8FqS9T/oLf+
 9XGoZ8sKyYdh4K/91UdhEULcMyf5jjPIBKDF/A/ih188a1lzZ/B0dc3ZknKcmxS6i0HR
 5bH2CvNxNeDa6SXIJTA+yYM5RcdF/ExxDivcRAi0x/R5jap5J5GV9sPNpLI9GANhG0oY
 PFyD99Xlx/rTnO/EhFduJvfIg7caCOnoCpHzaJ+7UP/rpFCWgEstP9XHOGP3M/D2dP0V
 NBGaOgVUeV/4B/8KBtnV5yR+QBhoPJpJF5EjdJuR9dCxFF9M/Xvabq7deR5C7HUkLDPD
 kz6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730015491; x=1730620291;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=95caNnI7hgOLxEqas86hhjYPjq4p60okYGlZe1W9+VQ=;
 b=AgpVbYwevMHFGrO272RubqsmgkCWnzC9pyIj3dq8f1WidQfG30a1QIweW4bSeY3jsA
 j3fq5iH+dxYpLahqnG84WsKME0mxNuxzhSLNY27YJYwZIAonyGLurHx5Vm6yyzFU16zl
 /FANhuSDBCiwYGp0TYew84QWt65aRET3TmjGdaWeiyohEVv3nDOCDtdJf8dE2qGhz9TY
 YWyQtQKLW4KAYuUdAbMqv2vvPHuMQIb825jtOSIPP+VgsNmxT0EZ1j0tJf6rYJuERT11
 aANdIsaPf3d1ou9wRY1/dq6BXq6WUUb5QOe+xUvXNDaoH2BZ30BdE9p1f/LpxhGYk7gv
 Q0Ew==
X-Forwarded-Encrypted: i=1;
 AJvYcCWb1vw8fRi3yuXEcLmiwgqMcd/ZJSXvqFp/TbHxjzaiWfw3V49ULctfe7VdxJIv89Lz6JYsc1eiDIU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy7aPTW+ap4cDmaYmhUnuOVypZdJwTVT9F+W/ZaKiN6hjvfxiR2
 oKysaXcOJRBlqrvhXIlcnuBPatWFm85s+Cke2ZOZL2NR8GpP9rk/
X-Google-Smtp-Source: AGHT+IH7qS5niQmAAfTA2UGQJF1s0kcotIcMoHkxWCvAmGRljhi8/z+HxbR/00ppveIZ8SYyL8JZRA==
X-Received: by 2002:a05:6a21:6282:b0:1cc:9f25:54d4 with SMTP id
 adf61e73a8af0-1d9a84d9ddfmr6268806637.38.1730015491155; 
 Sun, 27 Oct 2024 00:51:31 -0700 (PDT)
Received: from fedora.. ([2405:201:d007:50c2:b7e7:6df3:9958:a45d])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7205794f9a1sm3785551b3a.90.2024.10.27.00.51.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Oct 2024 00:51:30 -0700 (PDT)
From: Vamsi Krishna Brahmajosyula <vamsikrishna.brahmajosyula@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, jani.nikula@linux.intel.com
Cc: skhan@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] drm/edid: convert drm_parse_vcdb to use struct cea_db *
Date: Sun, 27 Oct 2024 13:21:07 +0530
Message-ID: <20241027075108.14273-5-vamsikrishna.brahmajosyula@gmail.com>
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
in the parser drm_parse_vcdb

cea_db contains len and then data. Appropriately change the indices
when referring to individual elements (db[n] becomes data[n-1]).

Signed-off-by: Vamsi Krishna Brahmajosyula <vamsikrishna.brahmajosyula@gmail.com>
---
 drivers/gpu/drm/drm_edid.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index e2ef07d00aaf..d9fa994a3acc 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -6065,14 +6065,15 @@ static void parse_cta_y420vdb(struct drm_connector *connector,
 	}
 }
 
-static void drm_parse_vcdb(struct drm_connector *connector, const u8 *db)
+static void drm_parse_vcdb(struct drm_connector *connector, const struct cea_db *db)
 {
 	struct drm_display_info *info = &connector->display_info;
+	const u8 *data = cea_db_data(db);
 
 	drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s] CEA VCDB 0x%02x\n",
-		    connector->base.id, connector->name, db[2]);
+		    connector->base.id, connector->name, data[1]);
 
-	if (db[2] & EDID_CEA_VCDB_QS)
+	if (data[1] & EDID_CEA_VCDB_QS)
 		info->rgb_quant_range_selectable = true;
 }
 
@@ -6430,7 +6431,7 @@ static void drm_parse_cea_ext(struct drm_connector *connector,
 		else if (cea_db_is_y420vdb(db))
 			parse_cta_y420vdb(connector, db);
 		else if (cea_db_is_vcdb(db))
-			drm_parse_vcdb(connector, data);
+			drm_parse_vcdb(connector, db);
 		else if (cea_db_is_hdmi_hdr_metadata_block(db))
 			drm_parse_hdr_metadata_block(connector, data);
 		else if (cea_db_tag(db) == CTA_DB_VIDEO)
-- 
2.47.0

