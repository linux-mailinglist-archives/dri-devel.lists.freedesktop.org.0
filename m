Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC21A24B5B
	for <lists+dri-devel@lfdr.de>; Sat,  1 Feb 2025 19:03:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 802B010E30F;
	Sat,  1 Feb 2025 18:03:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DwR3GGql";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com
 [209.85.166.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1520C10E0EF;
 Thu, 30 Jan 2025 21:26:54 +0000 (UTC)
Received: by mail-io1-f43.google.com with SMTP id
 ca18e2360f4ac-84ceaf2667aso86775539f.3; 
 Thu, 30 Jan 2025 13:26:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738272413; x=1738877213; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Tqkamo/W6pMKSnOTnzoBwQwZ/NjYd08MuGkepnhxhX0=;
 b=DwR3GGqlSr/x0TwXZ6YUNEe8vcxrr/yZaEIziATJElBxSMzaB7IZcNYvKFVR8MEQn+
 7dOvY1q8Rdh+DPjcM0hWJ8jx3J0eoEZhTBoxllAFtt5xLbIDL1fJcnsTUD0jlZvcsUIr
 EOPtp0Q2rUxP4ge0OTenF4L/BqzsFfoU32l+OmxXn8gMgkaSLYNqQsTM7vODOG6LP8O1
 eegjrRyyNCxJeT1Z1GDfK5hMZT3i5gKpaJhlh//s1icVQutj0d39kZbcNyvfK7ZPdPVX
 GnIDLWSeJZPOlgtn79OYFMRgGjaAmVhPJguez/2YY5IAdWPp1027qnr+p074Mb/LI3YV
 oYug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738272413; x=1738877213;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Tqkamo/W6pMKSnOTnzoBwQwZ/NjYd08MuGkepnhxhX0=;
 b=EtY+1aeEjzX53zzbtKFzuCyV0IY6QfXf+R99hzwKBgqF96YBYvhtrjTxApuH9qhZq9
 Z2K0F0DgT9zbRBLbH1nT5zalVGvvWKAqIwbBqg1k7NakBopfVSaaaq3OrU//6zd+mJHG
 HKrD8y2BxwIvYmOOQ3BNIbgWeV3gajWxruxin8HKZ0SBOlmjZ4CXGG3Ifob+YIOZqKA6
 mGbYzvuttoWrT6O1FnSJR3jDg6j6NG/Ah2fnWgv0zx7U6WGTxdQdWYTbFAvhaqr8tN0Y
 FhnoBHezSbYpZV7h1D4p5evqfEiEuit3AMgbLmraRI03iyfv0wrkE20GMLOjMiOdfx+v
 aiTA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAe3RYpDrPgIF0MnNTAAeHj0+3d/9ZNkic5XsNwYpi8q/W7BsUuIx/DPagbs1KVJCsBaaJ7NJeuFw=@lists.freedesktop.org,
 AJvYcCW41ywJZDZkSCSiXngWYkBhu4k7Apcxb6BB7S7wjl/vwJAOHlysriqq5r3d/BESoZv8pneVzGMx4g==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxuiO1zw4NZFAq91PFv0Onwh6x8/56wZmtmOpVTJ2ZlzGQZ05az
 AcE8O77isPW7SkYdfE+6Y1Kjx1mS+TJ4bhV9cm1DxoVjB3L2ufDq
X-Gm-Gg: ASbGncv5Jh1UdyeJXh9kj76y+KZJee/huc98COSwV15ECn/9EOi2l2I/0vGSgYVYtbM
 RWzdPOexUAETfMTj9G187IbbI7bw87vGRlzOAzyokTAA9+N7PQ+hh4WbdYAHaR0571/J2TGSaRr
 2y3ut9SRRMMF8JTYDB+JXyonZOWYf9ua1oddVy9xLmuT8Y9nBKY59bHJMDuzHI2J9r4C2EyZkaE
 qMBqsvszrGUYM3GNSIlL2d4+QxaQGQ6nDy4H/BkbpJ63DKqlgV4bNY23alP03aJCkY2p1pmVEsT
 Fqf9KPCK6wWj5/DzbNMcvkk0vg==
X-Google-Smtp-Source: AGHT+IEkLqBHFekG09YoFWTOutpig+q5kged9l+7F7EfV+49vPiL2hEWO25pIxOb0Uvq/rD9kwXQwg==
X-Received: by 2002:a05:6602:418b:b0:843:e8d0:a728 with SMTP id
 ca18e2360f4ac-8541111199cmr945896239f.4.1738272413235; 
 Thu, 30 Jan 2025 13:26:53 -0800 (PST)
Received: from vengeance.tcpc.lan ([97.75.251.196])
 by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ec745b49bcsm518959173.37.2025.01.30.13.26.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jan 2025 13:26:52 -0800 (PST)
From: Aaron Kling <luceoscutum@gmail.com>
X-Google-Original-From: Aaron Kling <webgeek1234@gmail.com>
To: 
Cc: Aaron Kling <webgeek1234@gmail.com>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Ben Skeggs <bskeggs@redhat.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/nouveau/pmu: Fix gp10b firmware guard
Date: Thu, 30 Jan 2025 15:25:21 -0600
Message-ID: <20250130212525.2508700-1-webgeek1234@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 01 Feb 2025 18:02:57 +0000
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

Fixes: 989863d7cbe5 ("drm/nouveau/pmu: select implementation based on available firmware")
Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gp10b.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gp10b.c b/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gp10b.c
index a6f410ba60bc9..d393bc540f862 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gp10b.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gp10b.c
@@ -75,7 +75,7 @@ gp10b_pmu_acr = {
 	.bootstrap_multiple_falcons = gp10b_pmu_acr_bootstrap_multiple_falcons,
 };
 
-#if IS_ENABLED(CONFIG_ARCH_TEGRA_210_SOC)
+#if IS_ENABLED(CONFIG_ARCH_TEGRA_186_SOC)
 MODULE_FIRMWARE("nvidia/gp10b/pmu/desc.bin");
 MODULE_FIRMWARE("nvidia/gp10b/pmu/image.bin");
 MODULE_FIRMWARE("nvidia/gp10b/pmu/sig.bin");
-- 
2.47.1

