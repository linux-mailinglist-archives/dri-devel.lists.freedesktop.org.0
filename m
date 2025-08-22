Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A510B31B8C
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 16:30:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D8C810EB26;
	Fri, 22 Aug 2025 14:30:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gfxstrand-net.20230601.gappssmtp.com header.i=@gfxstrand-net.20230601.gappssmtp.com header.b="Mr4jsYPt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C277F10EB1F
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 14:30:17 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id
 d75a77b69052e-4b109bcceb9so25450591cf.2
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 07:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gfxstrand-net.20230601.gappssmtp.com; s=20230601; t=1755873016; x=1756477816;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1/nxjz8USQYxQpF1zMTLrFBHQ6hkU3N+2HfzJY9Zm74=;
 b=Mr4jsYPt91lqXBfWErSQNrYZaF1LvY8JfO0ynup39XTv0c0Urah6obgcsfekLXXuOA
 yifZL4OPiNGIKGBowb/4uP4ZcJ78ISwGAThhocXp73aQ8OUeTKi6P6v++DG2X54wf8Gm
 pmXzhm3cloCEc3a1KnXOfz43K9Vdq7teCfa/8GlSNNwRFo/+AHmX3gVJUX+yHOpmpNXL
 KafWnzOM8S6tG2qNAjG95/mNG7Ry61iMTYFuP2Aj+gIwM9QDCt8j6g+hhzyfa40IDeb4
 C1REHYOIk1rx6G3vJ15nuCyhiqgtYFe5b80vHtAyE3eoNDA5V5UoLNK4ms9X67t0Kxup
 sxLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755873016; x=1756477816;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1/nxjz8USQYxQpF1zMTLrFBHQ6hkU3N+2HfzJY9Zm74=;
 b=P7eVWpQ1jyfATmRkf4uK81zYwBKBb26u82p19yNXdkjdSUdOQrIG8kYmBtf/BMdCr9
 1nN2ziZeCS8UN0lxaeZTNy7KW7t8GWyjXcqZ77eZ2N4MhVpPsoVLESTj425r5GV5rHOa
 k2nTCa7OQcg2clIINlaGiQaZDuE4XTc82ZuDY5DmS3F3MJU5g5NUiL9eGuKEZ3e9zTic
 w38+yTeesrStjKMAq2O+HLYiS4v++aTUh7qONss44Fy18UeVA6uImEVABEKOZZ7qm8qR
 VWYTSHPXaGcQa9DX1H7/lMPwcTEV63UlUd+jq3zqKeH1me0VVfeMzSRcZRYWulFOueyr
 qlCQ==
X-Gm-Message-State: AOJu0YxdoEK0d3x6wCpkOus8EepFivUN9gCWOx1ZrY7kRbSalFNkEw/U
 OPJVmBTqu1rtC98f/j2RZIh2y8U/G6CV94KTBgMDSFiiBadga/sqQp74+KV1qW3KdIvKpNoHQtQ
 wnggcdHs=
X-Gm-Gg: ASbGncvAHTBTSiUOsX6Cb6Xau1GwlTToxzfD0KJZHtOzjSNXXau5GAo2RDtI2BEpiqS
 CC9sR4zKiDKRTmrCF8KUUFxzsTlG020xzKnB2n6jCwRuVcwXy4uD6HGPes50qrP8R9bbSU3rP2I
 046LyFOkm1OUcmYO8NagtgIS9Kg1jOfUBA3b7zpNtcqIGQur6HnXp8FxGUseWhHpxJczRSNMFYp
 3Aj42t5XehnFknAl+tVLArJ1/ACZPbJsrWxd+YOdtVf1fW5yd2lEsJ0CvtQqYo+Pkus8NE+94fH
 et/oyHAhYksCmrf637Skg6Q0s1LAnT44jup3vI365wD0EPz+FshKDZckfsEbt9Y/mgVSHFwXu7r
 3hpqer0OAFS70ZFMhPO+HVuBjKNmlcpU=
X-Google-Smtp-Source: AGHT+IF1yOTysF9G50lDmVdX8Kh6sI+66kN2rYGqcgsoOUvqJxngsNngRwx8BG4nh+Rg9B9UUKXUGg==
X-Received: by 2002:a05:622a:486:b0:4b0:8f6e:d70f with SMTP id
 d75a77b69052e-4b2aaacfbaemr32335431cf.43.1755873016348; 
 Fri, 22 Aug 2025 07:30:16 -0700 (PDT)
Received: from kermit.lan ([65.93.159.244]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4b2b8e6023asm420131cf.53.2025.08.22.07.30.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Aug 2025 07:30:15 -0700 (PDT)
From: Faith Ekstrand <faith@gfxstrand.net>
X-Google-Original-From: Faith Ekstrand <faith.ekstrand@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: Faith Ekstrand <faith.ekstrand@collabora.com>
Subject: [PATCH 7/7] drm/panfrost: Bump the driver version to 1.5
Date: Fri, 22 Aug 2025 10:29:16 -0400
Message-ID: <20250822142954.902402-8-faith.ekstrand@collabora.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250822142954.902402-1-faith.ekstrand@collabora.com>
References: <20250822142954.902402-1-faith.ekstrand@collabora.com>
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

Signed-off-by: Faith Ekstrand <faith.ekstrand@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_drv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 7d6e2b803a2b..8b841c6c8150 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -759,6 +759,7 @@ static void panfrost_debugfs_init(struct drm_minor *minor)
  * - 1.3 - adds JD_REQ_CYCLE_COUNT job requirement for SUBMIT
  *       - adds SYSTEM_TIMESTAMP and SYSTEM_TIMESTAMP_FREQUENCY queries
  * - 1.4 - adds SET_LABEL_BO
+ * - 1.5 - adds PANFROST_BO_MAP_WB and PANFROST_IOCTL_SYNC_BO
  */
 static const struct drm_driver panfrost_drm_driver = {
 	.driver_features	= DRIVER_RENDER | DRIVER_GEM | DRIVER_SYNCOBJ,
@@ -771,7 +772,7 @@ static const struct drm_driver panfrost_drm_driver = {
 	.name			= "panfrost",
 	.desc			= "panfrost DRM",
 	.major			= 1,
-	.minor			= 4,
+	.minor			= 5,
 
 	.gem_create_object	= panfrost_gem_create_object,
 	.gem_prime_import_sg_table = panfrost_gem_prime_import_sg_table,
-- 
2.50.1

