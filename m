Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51FB3972564
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2024 00:41:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61B7F10E5FB;
	Mon,  9 Sep 2024 22:41:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="E1LMAlfC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98D8510E5FB;
 Mon,  9 Sep 2024 22:41:35 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-374c84dcc64so3728170f8f.1; 
 Mon, 09 Sep 2024 15:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725921694; x=1726526494; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Czccy5fQseI/IqoQS9L/TpwH/mxQYjj8nomGHBFfYmk=;
 b=E1LMAlfCTE+JkYh4gnu9nHnIv4u9AL6+nExw2AAya/7NA+4yTXdDPvf/DfWxnp9i09
 CIWO0hMJT9pUbxHGB4u6YJ9EBjDEpM9pLWevBS8JTnIzvgOFyBSFo3gw2vbze5CyrMQX
 43HyjPeO8fRfqkcigUBuwZDfZeo0j67q3C4WxzEmTjSW/p85bLPtaNqfoJ78AOoMrd6b
 VtNcd2J0No9lJb45TyHlfyPuH4W2uPC3IHE7Y9SzG2z+FRqw3ivLc8ZE+GzRPRjlzGMR
 gecS9kSmqPq6hUhw2sppmxMJ2JjAZOHIQ24l4gS5/fl+Lffc5xBvdGf8oZZ9t5E85Nz+
 SCIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725921694; x=1726526494;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Czccy5fQseI/IqoQS9L/TpwH/mxQYjj8nomGHBFfYmk=;
 b=CVtVxno4yUIxhj8H0UMlq/ASlLb3CcDGw94VB/oMIOrZxkEcI2ZrJbUplR5fq4Y3Tg
 9392nFWK9aVB1i+oND+HeJ2bo26vCQUWte9rWAMbxoTNW6P3Yu+2Z9jF4mHb8tVsgw+M
 /8hxuE3DJUO1Wsmb6Ghs9+gNxlPkglnRYyFwwB6gXD1rPTwApne2cvCrUUvZ6UgkMMSG
 gE92uCm+zwkQrR7PcOrkWJT4L+tZI8cAXjBKEW+snsXIbN4xOSXWoXK8dW3pPzUstQPQ
 rJXfVSUJYPEAHllpI5bHbua5r7VXvmmbMu2zgnLiw8/HrRAoEWoo3rbV2Rnjd+eU8Dnt
 XzMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnK1gYOWPLrUvlsPUXRVT4GqdZgE+eZfkrZqthlXCAb2Bajv3141YCCYNwNZAt7K+4r3q1hNOWkK0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwAk9iLVv2Jbka9dcBjxnY/6S/hdWDDb1v543LDJ0laXkRrYnhS
 hQq8oOqJnwoYBziWyuqIyvMEMrOvAy3095nPukySms/3cJ0ZPbjP
X-Google-Smtp-Source: AGHT+IG66+N4aswIJh7BoLAZq9oScW41fFewcBVIDHfk1+X70Qo4RhWHc9z3rRKiXcZ0ip/VIixKQA==
X-Received: by 2002:adf:9b89:0:b0:374:b363:2dea with SMTP id
 ffacd0b85a97d-3789229bc11mr6426973f8f.10.1725921693172; 
 Mon, 09 Sep 2024 15:41:33 -0700 (PDT)
Received: from void.void ([141.226.14.150]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-378956653c6sm7098887f8f.32.2024.09.09.15.41.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 15:41:32 -0700 (PDT)
From: Andrew Kreimer <algonell@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Hawking Zhang <Hawking.Zhang@amd.com>,
 Candice Li <candice.li@amd.com>, Tao Zhou <tao.zhou1@amd.com>,
 "Stanley . Yang" <Stanley.Yang@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Yang Wang <kevinyang.wang@amd.com>, Lijo Lazar <lijo.lazar@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Andrew Kreimer <algonell@gmail.com>, Matthew Wilcox <willy@infradead.org>
Subject: [PATCH] drm/amdgpu: Fix a typo
Date: Tue, 10 Sep 2024 01:41:05 +0300
Message-ID: <20240909224122.14780-1-algonell@gmail.com>
X-Mailer: git-send-email 2.46.0
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

Fix a typo in comments.

Reported-by: Matthew Wilcox <willy@infradead.org>
Signed-off-by: Andrew Kreimer <algonell@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c
index aab8077e5098..f28f6b4ba765 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c
@@ -58,7 +58,7 @@
 #define EEPROM_I2C_MADDR_4      0x40000
 
 /*
- * The 2 macros bellow represent the actual size in bytes that
+ * The 2 macros below represent the actual size in bytes that
  * those entities occupy in the EEPROM memory.
  * RAS_TABLE_RECORD_SIZE is different than sizeof(eeprom_table_record) which
  * uses uint64 to store 6b fields such as retired_page.
-- 
2.46.0

