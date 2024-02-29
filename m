Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6935086D3CB
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 20:56:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 821AD10E5D1;
	Thu, 29 Feb 2024 19:55:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XwZtmhdD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DF2710E5B2;
 Thu, 29 Feb 2024 19:55:58 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-a44628725e3so96093766b.0; 
 Thu, 29 Feb 2024 11:55:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709236556; x=1709841356; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=y3dRCI30Cqlop6Z/piqJrZ5N5wWPVcx8trh55DUTij0=;
 b=XwZtmhdDmMYLOY7+NuYxq7LqSTWMD0nY8kq/VyhUkcxZpHnUaiUmKkNgaCmwc8TVc4
 2emVkmWxVEeRXxzGzEzuRZD3fsbWzbynYDq6c+KYI9ejFE1S+gBiwv38qGGeYzVHhX61
 SICUT6Al77YOu1BdfOQytqzHoKSnIpJIa1lbrcpQnAVpq2mkjdzC9s3VySN7fNc2zzON
 xjPvvmSCccrMHjZq3N1CxWklLEzGTouZBVce8xV/Wo7E4zCHXn/cVwxlJ0UARRV7eft1
 4iMVQxjQm7PRcNlucSS5VoOz25/bUnGPd2eFSWNpBWs3TK1gIBfTr1LsFluJ0lWs7FuE
 I1/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709236556; x=1709841356;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=y3dRCI30Cqlop6Z/piqJrZ5N5wWPVcx8trh55DUTij0=;
 b=hmhYX23efhWJKZYpl+gvCqlU8AZ7zOdl6K3VnjroI7a5Ymx5NnsDu2apKPnPvLMEd7
 a5Uu8lSY7XprezDuXvKDq1KeE6c+COpQzsGn18W+oMWsXAKw9ibgjpG8OPDJtV48q2FS
 LN8DwhVoGoa75X6aPPU95av0llzAnZIezxUvKqjTZ5CpukNX086jSXSOsbf06YsgYfaU
 /KwwHeBrSm2zLt3H7zXQyNgtWROePsx0tkHheGhIOz5s6KRGpb31sqfsPrmbSlekaNUa
 GAMOuoyciKljFxR0cDjgNCFxotGnDGe53BHevZv4BMtWBSJ4ZcqR5xaruPOd38RlH1xQ
 8NeQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkTSnwRYB9FiSoYBt4d/qpUh4S92s/osgtvYEYp9752bKG7cCJ80wnKBs8B2tyYiGm+sbgt01fpSXIEAt2f/i6ibbOFtUs7wnnCgQtH6qwdlyfjAMwwxpKOfT0xbxXV3wsZ/eJcfAUNLLZuko5kQ==
X-Gm-Message-State: AOJu0Yz4GTIogZ7ix6B+WUlvOcmseNckRAfQevcqsccE9sTCKQ7LGAWG
 UR3KaqCsLsVgbB0ehWUzbQDgxsHm0WWsNeIPA9IznPSon4zkoEtM
X-Google-Smtp-Source: AGHT+IEL9jkj54S+9kUY1V3QOVu73bHEonB9uQVtq3A5M1oTgOFv1MjQ8H5XvVG8CsK/6VnEfZlLhg==
X-Received: by 2002:a17:906:71d8:b0:a41:2f5e:f9b4 with SMTP id
 i24-20020a17090671d800b00a412f5ef9b4mr2226517ejk.59.1709236556351; 
 Thu, 29 Feb 2024 11:55:56 -0800 (PST)
Received: from localhost.localdomain (80-108-76-242.cable.dynamic.surfer.at.
 [80.108.76.242]) by smtp.gmail.com with ESMTPSA id
 ti9-20020a170907c20900b00a43a4e405bbsm983214ejc.115.2024.02.29.11.55.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Feb 2024 11:55:55 -0800 (PST)
From: Christian Gmeiner <christian.gmeiner@gmail.com>
To: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Christian Gmeiner <cgmeiner@igalia.com>, stable@vger.kernel.org,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] etnaviv: Restore some id values
Date: Thu, 29 Feb 2024 20:55:31 +0100
Message-ID: <20240229195532.7815-1-christian.gmeiner@gmail.com>
X-Mailer: git-send-email 2.44.0
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

From: Christian Gmeiner <cgmeiner@igalia.com>

The hwdb selection logic as a feature that allows it to mark some fields
as 'don't care'. If we match with such a field we memcpy(..)
the current etnaviv_chip_identity into ident.

This step can overwrite some id values read from the GPU with the
'don't care' value.

Fix this issue by restoring the affected values after the memcpy(..).

As this is crucial for user space to know when this feature works as
expected increment the minor version too.

Fixes: 4078a1186dd3 ("drm/etnaviv: update hwdb selection logic")
Cc: stable@vger.kernel.org
Signed-off-by: Christian Gmeiner <cgmeiner@igalia.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_drv.c  |  2 +-
 drivers/gpu/drm/etnaviv/etnaviv_hwdb.c | 14 ++++++++++++++
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
index 6228ce603248..9a2965741dab 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
@@ -494,7 +494,7 @@ static const struct drm_driver etnaviv_drm_driver = {
 	.desc               = "etnaviv DRM",
 	.date               = "20151214",
 	.major              = 1,
-	.minor              = 3,
+	.minor              = 4,
 };
 
 /*
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c b/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c
index 67201242438b..1e38d66702f1 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c
@@ -265,6 +265,9 @@ static const struct etnaviv_chip_identity etnaviv_chip_identities[] = {
 bool etnaviv_fill_identity_from_hwdb(struct etnaviv_gpu *gpu)
 {
 	struct etnaviv_chip_identity *ident = &gpu->identity;
+	const u32 product_id = ident->product_id;
+	const u32 customer_id = ident->customer_id;
+	const u32 eco_id = ident->eco_id;
 	int i;
 
 	for (i = 0; i < ARRAY_SIZE(etnaviv_chip_identities); i++) {
@@ -278,6 +281,17 @@ bool etnaviv_fill_identity_from_hwdb(struct etnaviv_gpu *gpu)
 			 etnaviv_chip_identities[i].eco_id == ~0U)) {
 			memcpy(ident, &etnaviv_chip_identities[i],
 			       sizeof(*ident));
+
+			/* Restore some id values if ~0U aka 'don't care' is used. */
+			if (etnaviv_chip_identities[i].product_id == ~0U)
+				ident->product_id = product_id;
+
+			if (etnaviv_chip_identities[i].customer_id == ~0U)
+				ident->customer_id = customer_id;
+
+			if (etnaviv_chip_identities[i].eco_id == ~0U)
+				ident->eco_id = eco_id;
+
 			return true;
 		}
 	}
-- 
2.44.0

