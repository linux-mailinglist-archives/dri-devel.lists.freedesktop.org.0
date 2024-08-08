Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF7A94C3D8
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2024 19:41:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAA1A10E7B4;
	Thu,  8 Aug 2024 17:41:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gfxzFNSh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AC3410E68E
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2024 08:41:28 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-1fc491f9b55so6769265ad.3
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Aug 2024 01:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723106488; x=1723711288; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Prg3p4IJXod2uYAeJPsfBfeNoizjg8s9RfmusbUKHaE=;
 b=gfxzFNShW7oOb8hb9HPQi2US+yQx9ThZZEZr1Q0Beu4aq8ROzbp61tl41QrXO+m7If
 5LwaKZ9TXd+K/+0OcQ20bHrfhkihZL2UjbmUKR/SVwRXEcxle/Ads92GrHVQj85C1BLJ
 BNEzVDn3pYDGDbbYksPlU/+xgbCQuysKT1RhbVKaQ7HXWizQkTTDRx0KGllhdkZzvdck
 Jsd/b74MZvH3yziEYPaXO4y/FPZ0mtr/Lj3UknmISdaSU31okdK3tdKoYPYDspSrwGXQ
 2ru+R6P9PKq/Y2Kc5S2TRTmZ4q1CtDA09AbI0JjViet0rYrIHKJcQ4x1Dl1lN2RVhdqa
 gp2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723106488; x=1723711288;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Prg3p4IJXod2uYAeJPsfBfeNoizjg8s9RfmusbUKHaE=;
 b=rQmOj1YOHI99Dh4UfSBYdiHXRyHlT2j07pGCG2eoby9S+pkc9dfSZQna6UmG6/IR4q
 v8it/NiiOGAytSRs9I15+SF2E/OSFLZINid3FBTHL3LwAmMXbhhiAg6wK0KOfpsX3FnF
 sQGmT1l2OloGLimQiJW7ti2XbrXvLWbGkTT13PZu+9WmtDwi6cAXGgc4XYJpAHsUIURa
 E6iLRnEGX4eX+0ZBj3h7JCpwBWsGkQDQuvQBG2kKSG7md4Vk3R3Kw32r51uKOGXJ8X5i
 jHMafzSM/lQsM/ixBl8N5C2G9wRuVBGDDnl4QW0Ax99F0vzU1eB5XPrciWkFTfxPDJxr
 js7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkhLJLxWEQnbROWTjOyrjFh49hk7S3ZqzPqbiVUZaITweZMHe/IfrS5PrO+Bfj3qXYapVxO6XQfLLpSHTW7IMEDiyjStcjUNdUCpuU5Y16
X-Gm-Message-State: AOJu0YxOMJ6bvVI36wL32G9F0mK9V0IyEyRPu4324OQw2TMyfRucvBjr
 nxdj43V2BEVzdOMdXYJESubPCcx6s7u9d5qQ6OSg+T+5HmzL69o1
X-Google-Smtp-Source: AGHT+IGf3LYFo/KitokxOs8qD5G6qV0YnD3haJ/FkUl/QoGSzNpGYzzB9WmJzXyty11nqtWDCa1YrA==
X-Received: by 2002:a17:903:22cf:b0:200:7d10:b88a with SMTP id
 d9443c01a7336-20095303b3amr14581445ad.56.1723106487794; 
 Thu, 08 Aug 2024 01:41:27 -0700 (PDT)
Received: from localhost.localdomain (c-76-133-147-99.hsd1.ca.comcast.net.
 [76.133.147.99]) by smtp.googlemail.com with ESMTPSA id
 d9443c01a7336-1ff592ac867sm119091335ad.277.2024.08.08.01.41.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Aug 2024 01:41:27 -0700 (PDT)
From: Daniel Yang <danielyangkang@gmail.com>
To: skhan@linuxfoundation.org
Cc: danielyangkang@gmail.com,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] kerneldoc: Fix two missing newlines in drm_connector.c
Date: Thu,  8 Aug 2024 01:40:58 -0700
Message-Id: <20240808084058.223770-1-danielyangkang@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 08 Aug 2024 17:41:39 +0000
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

drm_connector.c has two kerneldoc comments that were missing newlines.
This results in the following warnings when running make htmldocs:

./Documentation/gpu/drm-kms:538: ./drivers/gpu/drm/drm_connector.c:2344:
WARNING: Definition list ends without a blank line; unexpected unindent.
[docutils] ./Documentation/gpu/drm-kms:538:

./drivers/gpu/drm/drm_connector.c:2346: ERROR: Unexpected indentation.
[docutils] ./Documentation/gpu/drm-kms:538:

./drivers/gpu/drm/drm_connector.c:2368: WARNING: Block quote ends without a
blank line; unexpected unindent. [docutils] ./Documentation/gpu/drm-kms:538:

./drivers/gpu/drm/drm_connector.c:2381: ERROR: Unexpected indentation.
[docutils]

Signed-off-by: Daniel Yang <danielyangkang@gmail.com>
---
 drivers/gpu/drm/drm_connector.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 80e239a6493..fc35f47e284 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -2342,7 +2342,9 @@ EXPORT_SYMBOL(drm_mode_create_aspect_ratio_property);
  *
  *	Default:
  *		The behavior is driver-specific.
+ *
  *	BT2020_RGB:
+ *
  *	BT2020_YCC:
  *		User space configures the pixel operation properties to produce
  *		RGB content with Rec. ITU-R BT.2020 colorimetry, Rec.
@@ -2366,6 +2368,7 @@ EXPORT_SYMBOL(drm_mode_create_aspect_ratio_property);
  *		range.
  *		The variants BT2020_RGB and BT2020_YCC are equivalent and the
  *		driver chooses between RGB and YCbCr on its own.
+ *
  *	SMPTE_170M_YCC:
  *	BT709_YCC:
  *	XVYCC_601:
@@ -2378,6 +2381,7 @@ EXPORT_SYMBOL(drm_mode_create_aspect_ratio_property);
  *	DCI-P3_RGB_Theater:
  *	RGB_WIDE_FIXED:
  *	RGB_WIDE_FLOAT:
+ *
  *	BT601_YCC:
  *		The behavior is undefined.
  *
-- 
2.39.2

