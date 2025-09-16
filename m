Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C145B5A39D
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 23:08:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3E3D10E810;
	Tue, 16 Sep 2025 21:08:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ebEKTYnp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47D2410E7A9
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 21:08:41 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-24cde6c65d1so52146785ad.3
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 14:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758056921; x=1758661721; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=1ajRjJ63Iy7rbFQ9znyyl9iKKEEIo81WL5RMkNMmqG0=;
 b=ebEKTYnpsTPfXEzkKFq30OAFI76nuNFAFGmTrYTpvR7v1KYUMYOAc9QfmhFvBFVvPY
 txKjWiAv8oVjvViOlq0uXD8q32gT80VgxXoGOCbCTTrOSWs3W4weFNYQIJv3dPMFOa+V
 Gt6JhDKVs3evVVH4jnO4q+2nAJYHSE2HNzCU0NE+m1E22lAm3XKouVDhrOByh+9bu5sd
 NaRnRUNt+N0Dx64B0gnH51FRK4F1gDDH9IIa9khQXGxtewuHDw29yqSD+46cUgtnTKQy
 +UKlNoznnwC+G4TdSqnH7SVPkLKopn37+7C88a5TU3zdwGjrLgg6tJxNdxTKNIn99f1N
 4SEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758056921; x=1758661721;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1ajRjJ63Iy7rbFQ9znyyl9iKKEEIo81WL5RMkNMmqG0=;
 b=dv7GSv4TMdKS/0fGzZjnJk78IOP7+aYo9Js1V9T5nqpu2EzGWmkEP2z308JMoN5RT0
 xq3duwsHByBeqqMHwj6jzjwv5PLHUSPPKHTBMUC4tPYU/EhvjvzXAa9qxJ0G5qNZ3SLJ
 34XsBiVS3kJadhfGd53yEQp0rmGnTzy621Yo842HA4y606ItHvwE9CmItndqUWqPg9Ha
 vbFBaLRauMObWRs+LPl9Wm5IQbjBILWtl5A4XrmOGpoZBqoClM2zwt5wkDz+K8w04dPw
 45vSG+I1h7i8zWY/U2vAiTNG42Y8G/JbXH9KX+TMW/E0au1hVcqEe9ongNk6op2o084X
 Q7Yg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUr8Y14BwUMgNTsAEYjV0oRaOTNCb2UGfXGYOd7GO0otovhVOSjY1uhZVichfLQKCHPxQoAxOEJPak=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy5OuEBNmtx4JAGhW4T+2ECfX8ZuYeRLF1oKqoiBAu6enrHqtK9
 0scqGnclUUw9E5k5C3yMM4o6v2E46t8vVyZZ8LiYDa63szL9dNYj3XAK
X-Gm-Gg: ASbGnctJJROYwi9b4K2H+EZehEYeRE9wKkxxg+cdoi7y1na3Lbt/AiubnwRXya7VIRd
 k5Xmedx/wmBgtRCa8ZnW/36X2o6O7bRlM30rdHQpxaqzwyv5aHo+BwTeMjfAIHmWVkrXjRPwiib
 oz6Uu1oDlpaU/InAGwq9fJfXQprW/XHgD+j7F6A87s4mj0y1djYyT/DyG79XNTrHfvpEGBJyyga
 soTPOOL2oeJM7JoiXGikLOIS6RFkexBp0r9rE2hOTOtqh1rJFN2hgqbWiLmq+b3G/Inaxs+ohCD
 6/0hdfRVmCtXTfLq8/EjwbGP/ekCg6BdySJT77c/5QvJEPwldmgE9cYIP9HnG7ztpEaszjmrAZD
 DSMwna6r1u5PUdSdz6Ly2G5mZ8k6uTW5iKNZWlDCHqEJ0Nf3S+CT35wghrwPCnbuYLpO79nmRhf
 UURg1wUxR7rg==
X-Google-Smtp-Source: AGHT+IHhPDuS6+StVaolktNXBb79Xxy3Tz7vX4HDANHKZKnch8Zg/57u1MSLxGZamhZZWwIp1u8D3A==
X-Received: by 2002:a17:903:3585:b0:246:b46b:1b09 with SMTP id
 d9443c01a7336-25d2686604amr200001855ad.30.1758056920763; 
 Tue, 16 Sep 2025 14:08:40 -0700 (PDT)
Received: from localhost (185.3.125.34.bc.googleusercontent.com.
 [34.125.3.185]) by smtp.gmail.com with UTF8SMTPSA id
 98e67ed59e1d1-32ed26876ffsm492508a91.3.2025.09.16.14.08.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Sep 2025 14:08:40 -0700 (PDT)
From: Chia-I Wu <olvaffe@gmail.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Grant Likely <grant.likely@linaro.org>,
 Heiko Stuebner <heiko@sntech.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 09/10] drm/panthor: move size check to mmu_hw_flush_caches
Date: Tue, 16 Sep 2025 14:08:22 -0700
Message-ID: <20250916210823.4033529-10-olvaffe@gmail.com>
X-Mailer: git-send-email 2.51.0.384.g4c02a37b29-goog
In-Reply-To: <20250916210823.4033529-1-olvaffe@gmail.com>
References: <20250916210823.4033529-1-olvaffe@gmail.com>
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

We can early return from mmu_hw_flush_caches when size is 0.

Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
---
 drivers/gpu/drm/panthor/panthor_mmu.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index 436a54e30a36d..743e9342eece7 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -570,9 +570,6 @@ static void mmu_hw_cmd_lock(struct panthor_device *ptdev, u32 as_nr, u64 region_
 	u64 region;
 	u64 region_end = region_start + size;
 
-	if (!size)
-		return;
-
 	/*
 	 * The locked region is a naturally aligned power of 2 block encoded as
 	 * log2 minus(1).
@@ -643,7 +640,7 @@ static int mmu_hw_flush_caches(struct panthor_device *ptdev, int as_nr, u64 iova
 		return -EINVAL;
 	}
 
-	if (as_nr < 0)
+	if (as_nr < 0 || !size)
 		return 0;
 
 	/*
-- 
2.51.0.384.g4c02a37b29-goog

