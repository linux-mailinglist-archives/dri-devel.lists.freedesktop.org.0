Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14917B5A398
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 23:08:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D65B810E79D;
	Tue, 16 Sep 2025 21:08:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AL7ocQM/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0681110E78F
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 21:08:34 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-77287fb79d3so4555465b3a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 14:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758056913; x=1758661713; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=3aO3jHV+TCdh3X4sNWUTMqSI+YaJsDjuOHp0znGhivY=;
 b=AL7ocQM/G9/JjR4mR4FtlxDi1aRy77FETMJDd3G6n55T+rhBvQtxodaO11k9uMF7Ax
 Ym5UTs3BBQcMWCTpzly3iDvZj3EGM5mewjYgfGGNLyzyFncNzh0brQ+QKbGxuBCdh5xj
 0Rede5FXrOiFPyguPTgUXInhNuZVd8enfaUfXC6ytxE/mpI47QMtBal4VvvlgTrMDuMa
 b8gRgjXiwHVu+qP+YeF8Czf+LZ6cMotUKYzy593Wsqw7+BOu3DoZbsEm13hwJHNoqjix
 iz+jAEduqDIlb6BoQP+nubHoZlE6IrVIEHP/FDSHi1r7hR/IaK/gAsZcU/VFo/3/7Lmw
 VBrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758056913; x=1758661713;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3aO3jHV+TCdh3X4sNWUTMqSI+YaJsDjuOHp0znGhivY=;
 b=rWvwu7lSX6rWea+gqdOnVporQI+0ANBzaHZR5wv72Yn3t0NFvBFppf09+d0qRbV07R
 M/1/14Ptc8HNZpOmdhCkTofqqZeC+0TfpSW+gKQ5VmVRCubYNGUMPXIhU/vbcSu+aGAy
 PSodtSTqpt1yKoVLpGikYpHfsKamErvohKh5IQnuUE66r6vYVbJlcQNl36+J+c2iEdit
 yHYEoQU6CgoOCk0KJ+tqGGUHVVCfHCpoWWRl3l+QN8PERJ1jBhpD/ZYVdFs7TZvXVo16
 2rAaWlUnm77bJaFvhkHHcToBlqIbfKK3p+vBIvdQoMd5T8ho2gNeqZoP2WmXngiDYZsG
 nRYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6SPl0f+RMW8C/VC/bjku5eAxWAm1tsScTBsw/UYBJyw8nwf5o/rlZgVaJJTUzLNFSAPZr2tXlgco=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwFjpOFjlBNLikMZsciwfGhbemC3Jra+SaWiqouNg1El3hQG8PY
 n0p9kG0ohnhsZf8jHQXb8rg46DBMZlG74nEu9/GoXShxi05C4aDbZ0gV
X-Gm-Gg: ASbGncuwWlQGBXvL2o3f9nZc/TGcGoNegqtD3N8WPKjYYy1xbAcWK/nAAauohSRgTAA
 SqF530aL0mebESTXhRBo/A0Ooj1XT/SI2xCMu88WZ5Q3Y3o9qk4K4ctCT4OXBQKs23AiAGNkWdA
 ximyKiRLo4w0TM3KhlOR2ld4XQRL7Tu3ALPNpWRnACXGeE0f6lVinHjfaoCqSY1fBM6vXKRXyWt
 /vbVd9625ghVSUmSb2VtDvK2oulA/dFZ2yKZcqb0OlA6hGXnSncC1g/DkFSHE0IpxDASXXgJP51
 16aCj3LMJSisdPJ280ZyPX4nzTsdj7DWm4JNp5Es0XMaLj0r538bZ0NBODoAIKf/838/js4b9Rz
 jJjybCZ7O7tMReEZTf667GtRhsJRbN7RCw9D2PkqtpGfXP7Q9xKf9eFKJRrDbNfBF5sUFoyigV4
 q4LFImjwjJhLJeXMhAFlEf
X-Google-Smtp-Source: AGHT+IErllrXZhiuO08ZvjuaFN67hMPleqZ0DLgAdBUq+kGFJqCmxYGCY5kLycBvM6DB//Dz8cM39w==
X-Received: by 2002:a05:6a00:1415:b0:776:1dbf:375b with SMTP id
 d2e1a72fcca58-7761dbf39f0mr18060001b3a.6.1758056913491; 
 Tue, 16 Sep 2025 14:08:33 -0700 (PDT)
Received: from localhost (185.3.125.34.bc.googleusercontent.com.
 [34.125.3.185]) by smtp.gmail.com with UTF8SMTPSA id
 d2e1a72fcca58-77607b392fcsm16649240b3a.87.2025.09.16.14.08.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Sep 2025 14:08:33 -0700 (PDT)
From: Chia-I Wu <olvaffe@gmail.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Grant Likely <grant.likely@linaro.org>,
 Heiko Stuebner <heiko@sntech.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 02/10] drm/panthor: rename and document lock_region
Date: Tue, 16 Sep 2025 14:08:15 -0700
Message-ID: <20250916210823.4033529-3-olvaffe@gmail.com>
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

Rename lock_region to mmu_hw_cmd_lock.

Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
---
 drivers/gpu/drm/panthor/panthor_mmu.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index d3af4f79012b4..8600d98842345 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -545,8 +545,17 @@ static int write_cmd(struct panthor_device *ptdev, u32 as_nr, u32 cmd)
 	return status;
 }
 
-static void lock_region(struct panthor_device *ptdev, u32 as_nr,
-			u64 region_start, u64 size)
+/**
+ * mmu_hw_cmd_lock() - Issue a LOCK command
+ * @ptdev: Device.
+ * @as_nr: AS to issue command to.
+ * @region_start: Start of the region.
+ * @size: Size of the region.
+ *
+ * Issue a LOCK command to invalidate MMU caches and block future transactions
+ * for a region.
+ */
+static void mmu_hw_cmd_lock(struct panthor_device *ptdev, u32 as_nr, u64 region_start, u64 size)
 {
 	u8 region_width;
 	u64 region;
@@ -609,7 +618,7 @@ static int mmu_hw_do_operation_locked(struct panthor_device *ptdev, int as_nr,
 	 * power it up
 	 */
 
-	lock_region(ptdev, as_nr, iova, size);
+	mmu_hw_cmd_lock(ptdev, as_nr, iova, size);
 
 	ret = mmu_hw_wait_ready(ptdev, as_nr);
 	if (ret)
-- 
2.51.0.384.g4c02a37b29-goog

