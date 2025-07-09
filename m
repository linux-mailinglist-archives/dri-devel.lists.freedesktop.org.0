Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA42AFE083
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 08:51:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B1C310E73A;
	Wed,  9 Jul 2025 06:51:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Z6f5fuZr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 885BB10E73A;
 Wed,  9 Jul 2025 06:51:49 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-748d982e92cso3251990b3a.1; 
 Tue, 08 Jul 2025 23:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752043909; x=1752648709; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wsXmoNVf8gqhHwpX7v98CH6HHO1K78Rr2kE9W8JmaiQ=;
 b=Z6f5fuZrV2VldFscmlrdo440L1xMGgpuWa3TmrOdtp0t4jOZAPTO+gmVxNXww3jGNO
 lwifJzqittRkPUzBtcmLUorB0DvjAZjSw/qTPrX+duSc9yqNu23Ntd66ZksWB46lb5ph
 mwAewxf59zheZFUMajZMuUptK3tqJ9saeJfDUq8I3bV8Jpu2RbBH69M+waOTdjbGt6Fb
 Yy5CKTVDMBbwFmNLYolXgaF9tCHBjMc5VsV8NJ9og06kMM8at91oEA+kqX5z7az8y1V1
 ApyCiQm8cyeEJ4MEu3naUh9ZzrDOIXzJvU/yXcuy/9SGCQWSMiGnne0BzHeBU3CP9PD4
 YZbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752043909; x=1752648709;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wsXmoNVf8gqhHwpX7v98CH6HHO1K78Rr2kE9W8JmaiQ=;
 b=E0z9EEc3AVOQTbO04bR8q9vKJByEZ6PNkiZqwSa2SZp5sSeiST75QIdYwDsD80UqI7
 B07KJ+3WbPIksiilWxG4S3h6dV9tmM1vsYww8sfUmq2p0UhKJdO+TNG1E/Cr2SSRr0XV
 +3BUo/4Lbvsyou2feQUR1PtoHKsGxWGWp7VaIhyMHDGo7zoIukOZnBkPOPmrvQKAwPzx
 UZOkhNSTYXs1ftUEXJbUk1zr1yU+YkrTIOq3YUAGl9taM40BUTn9v+QlanLEZ06LRIv5
 FBLWTGaOHMv0XxZlOSnBabG5KMvjbNQyCm9eziJxquZ5m7NHdTG3CMxdzB5N0FYmPAoZ
 xgNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8TxrAphR/k+dn+StJQRb4KIWfKe7COQS9+UZjEBVIispFnBm7tne7RMdeQGboJTXoVYiFGlqWqmX2@lists.freedesktop.org,
 AJvYcCV+i8beotySP3LvmlgPojsS2k2loycbM7gOKkDt5XBPXBEVamT4LrY6mbi+ALUvXwDUzkSCdNBh@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyVp6OsYy3MgT3z7CSWAZaaLEAFVGvD2AftXx/pj+XNlIugPrQy
 Z/LW1i5JmVjint+cWaYN1Nmf7Ch3402+UC8F/b9skvCHzjXNKaY9QrNl
X-Gm-Gg: ASbGnctBrFmBEtJ3D8CWg4J5gGjnaXwfVhv6UVvAUkDfRawVoIgvWRU1GdjA/Q/oj8W
 xEfRrbR5sQJk4XJnGHnRHuoepdLhOEpaEM6ufCEltx6HsRKTxcqH5vTVy5taciwcAjXP8UT3VQV
 uKHR/kWE8BMPaL0evbziy5kutDBltYa6HyTt2XRW3yNvsa5pKCVy9MKbEuiaNjLsISpuPSyigYU
 V67ok+2lYAfNy8pU3T5USHGeEfFt1hInm6wMTQ+kSQKsKtcxlxkrBfsOM+tUpbFMU97OEM+vIjQ
 GWAToNVzP7zFekZG/qM2JqGtnS9xUkon+3DnXH6duab829FP0xIPAjyCWOTNig6Rf9BNTy3b
X-Google-Smtp-Source: AGHT+IHhwVqmIexE3eKGz91oczxiizHyu03L1oLCkTdwBUOHIgnDLMOxZ5EJMI1a3H3LD8QK/1k+bQ==
X-Received: by 2002:a05:6a20:6a24:b0:21c:e870:d77 with SMTP id
 adf61e73a8af0-22cd5ff1630mr2141698637.15.1752043908408; 
 Tue, 08 Jul 2025 23:51:48 -0700 (PDT)
Received: from localhost.localdomain ([119.8.44.69])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b38ee62dd6asm13324561a12.64.2025.07.08.23.51.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jul 2025 23:51:48 -0700 (PDT)
From: Han Gao <rabenda.cn@gmail.com>
To: Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Han Gao <rabenda.cn@gmail.com>
Cc: Xinmudotmoe <xinmu@xinmu.moe>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/amdkfd: enable kfd on LoongArch systems
Date: Wed,  9 Jul 2025 14:51:38 +0800
Message-ID: <ecedf70051b805c5cfdcc2b91f9304af24b3c3fd.1752043543.git.rabenda.cn@gmail.com>
X-Mailer: git-send-email 2.47.2
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

KFD has been confirmed that can run on LoongArch systems.
It's necessary to support CONFIG_HSA_AMD on LoongArch.

Signed-off-by: Han Gao <rabenda.cn@gmail.com>
---

Changes in v2:
  Add 64BIT

v1: https://lore.kernel.org/amd-gfx/56e7ec54-9820-4e02-be97-2a9e1dedd117@amd.com/T/#t

 drivers/gpu/drm/amd/amdkfd/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/Kconfig b/drivers/gpu/drm/amd/amdkfd/Kconfig
index 62e88e5362e9..16e12c9913f9 100644
--- a/drivers/gpu/drm/amd/amdkfd/Kconfig
+++ b/drivers/gpu/drm/amd/amdkfd/Kconfig
@@ -5,7 +5,7 @@
 
 config HSA_AMD
 	bool "HSA kernel driver for AMD GPU devices"
-	depends on DRM_AMDGPU && (X86_64 || ARM64 || PPC64 || (RISCV && 64BIT))
+	depends on DRM_AMDGPU && (X86_64 || ARM64 || PPC64 || (RISCV && 64BIT) || (LOONGARCH && 64BIT))
 	select HMM_MIRROR
 	select MMU_NOTIFIER
 	select DRM_AMDGPU_USERPTR
-- 
2.47.2

