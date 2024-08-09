Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A9294C8D8
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2024 05:24:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D014110E847;
	Fri,  9 Aug 2024 03:24:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hfLBarv6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com
 [209.85.160.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE24410E847
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2024 03:24:06 +0000 (UTC)
Received: by mail-oa1-f54.google.com with SMTP id
 586e51a60fabf-260f863109cso955086fac.1
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Aug 2024 20:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723173846; x=1723778646; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZFOK/hAUa0fw7FuOJzaSSnTG1BQkQ3YWl0HKcCK5k/Y=;
 b=hfLBarv6wE9qYHTLNxUAIGg7Icr4YsE9/qLg++L/J746B7sY644cjZWQKdkDzXTrMB
 sPrMfGV/uLTyir2klP+VdO/hj5xgZQARS/078MjFIjCDwDbaP3WpVPRspqnOrYOBsX0o
 Dd7GOPCoK7Sz/TKSCHhUJI2CbfAhmLlqJzexIaJjEQVVs/NIyjA0pomZPEF9YCO8RDED
 yDQ+5juSxgYmOxGbgqIvGZq3NLnmI+ALNMzqm/eJx+aHRot88dRAP77FGbLND16uPkhF
 PEMzj19D6VQ1RYEOniH5ODN3TDdky0+fEt/FlgMQFjQ1t+QcDeM0kGs6Sn3ETZ/jKRS5
 egmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723173846; x=1723778646;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZFOK/hAUa0fw7FuOJzaSSnTG1BQkQ3YWl0HKcCK5k/Y=;
 b=Y6XFXSFcKFlJc9ZmKwAxd6X/MlFzB/oVfF7UOleODIA9hmoCFuNTJCdQakJwWAQf+c
 DVMCLhCS77C3VLeI8kjYVc/kcSDk8QPvXj2kUkodlh9H3sckkrjH8dYQGuy4SJx1+W3d
 aLXzhxMteM1dcWYXTb6Ilm04oN/gGtM4SPgaxfcHB85z27DGsfyx37C5uoKjXv8NAybN
 SbRb4kC2axX9lppC3dKEi16MwbByPFECbLsnPxAR2FxnkFoaAV/r86TuO4FXjA2blAqK
 1VuMN9RcscbGOPpdc0mpS871MpFBkh42O8W61VvsSt29VDY+5pv3FShEKFnaUaBc4OIi
 zPxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSKjVi6VM8Wq7SP/B6v4H2A1mIoQYKSJOL2mEdCQC/rJ+OSKFDLKd1+umsKHOzmDpSDB3JMBZUhB6LlkoBaimkhoGE5y2WxLyEgLtBRv99
X-Gm-Message-State: AOJu0YxRcIYnfkihtBLhWm2zP0Koor082lEuiYawKYlQWIY70CovYaUb
 +eKgOFHr0qgcYC/qtIOjESG7XYXwELR/fqUkNNC4CBJY3LIBxq+s
X-Google-Smtp-Source: AGHT+IEjse90ATIO4w5F4sCUoF9JSdEdyJCL9sLs5MTq81S3LQ9AqIZ0nZ4JFQ9tE25/41wFjdz25g==
X-Received: by 2002:a05:6870:3282:b0:261:1339:1cb9 with SMTP id
 586e51a60fabf-26c62f21d48mr379004fac.35.1723173845724; 
 Thu, 08 Aug 2024 20:24:05 -0700 (PDT)
Received: from localhost.localdomain (c-76-133-147-99.hsd1.ca.comcast.net.
 [76.133.147.99]) by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-710cb20af7csm1840447b3a.19.2024.08.08.20.24.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Aug 2024 20:24:05 -0700 (PDT)
From: Daniel Yang <danielyangkang@gmail.com>
To: skhan@linuxfoundation.org
Cc: danielyangkang@gmail.com,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2] kerneldoc: Fix two missing newlines in drm_connector.c
Date: Thu,  8 Aug 2024 20:23:50 -0700
Message-Id: <20240809032350.226382-1-danielyangkang@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240808084058.223770-1-danielyangkang@gmail.com>
References: <20240808084058.223770-1-danielyangkang@gmail.com>
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

Fix the unexpected indentation errors.

drm_connector.c has some kerneldoc comments that were missing newlines.
This results in the following warnings when running make htmldocs:
./Documentation/gpu/drm-kms:538: ./drivers/gpu/drm/drm_connector.c:2344: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]
./Documentation/gpu/drm-kms:538: ./drivers/gpu/drm/drm_connector.c:2346: ERROR: Unexpected indentation. [docutils]
./Documentation/gpu/drm-kms:538: ./drivers/gpu/drm/drm_connector.c:2368: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
./Documentation/gpu/drm-kms:538: ./drivers/gpu/drm/drm_connector.c:2381: ERROR: Unexpected indentation. [docutils]

Signed-off-by: Daniel Yang <danielyangkang@gmail.com>
---

Notes:
    v2: added "Fix the unexpected indentation errors" line to description.

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

