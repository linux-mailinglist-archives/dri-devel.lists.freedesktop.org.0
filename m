Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07AA2971BDC
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 15:57:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EAEE10E596;
	Mon,  9 Sep 2024 13:57:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eqa6afL1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4846F10E596
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2024 13:57:06 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-374d29ad8a7so2846545f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Sep 2024 06:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725890224; x=1726495024; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7+QMbzautmlcHBhreHHmtbMmq5qanob45DDspc/nC+0=;
 b=eqa6afL1rlQldJ5UckSIX1cdQ5itIOoVjhydonHsajA2dAlWKD4/Mow02z5JHDKo30
 dWqWGXWi1K7hL2HCJe9ui1U/cDE1wUSJrO3jhRaF6MYHbs+a5SgQ8dWnBF2N9idqePue
 rCdJU3TYgOLEl5h9l8Dnga1ASCZm0IO6qM8yicniFzh8U+EBQ0eVB/vKV8uRC+LumdGO
 ARtXIaRAMP70P8jlrZz10c+bR6hDBFw3ZDSugboAXun6P4bmzEU/N0qIBwA1AUIhUcLm
 XLN9tNjvkHAoC2RPteDZyDHL7NgbaifAge0i+IKTDF4rdg/1e8y21f7EvueS1GgkZuzX
 NxZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725890224; x=1726495024;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7+QMbzautmlcHBhreHHmtbMmq5qanob45DDspc/nC+0=;
 b=pAS4bPiDiWZHeILd1VlmgPPHd84dUVllSnZiscOlLBF9pX0VZeMmNH59hPEwP6v/rC
 79KFMW5+ukGso9I71rLVaF3R5mEvoXRZNhvNdXDipwgbiJT1keRusgyxh4kIt0662mC+
 6x7KeBkWXykwl81I9DwnRN6QCuoDArDqB0pZ+FywO0Vn5os7C0gI/4KEdgpiVnN3vKjP
 UDWs8vW2+7u3Z55XWDcZLt4yMJe+I1gag1UyaBJB01j+t3z6fQu7YAs6Gl0f+FL45I00
 Nk/6bVzd0zCFU13xK/yewiCzOsF8PJYcI8bsbvnoBAmuaBqn4WGikKXXy5KnUOKJvIjf
 5QWg==
X-Gm-Message-State: AOJu0YxtvR8LEY529zkCvXZlXbIt9Sd6Hk+l5OSJ+tX3RUn5nXEJ0xgq
 qI1kCeBT4tuTO4G4Z9Hy24ReMav1UoLNpGaD/4ha/Q/0u/ChJ6zy
X-Google-Smtp-Source: AGHT+IGNiwsklAcwJsZ31JpPrYhy+/GxiLBGkeOy+QCaF9wlyRktASdo5P3FRt0YHXiCITrSxdhrHg==
X-Received: by 2002:a05:6000:136e:b0:371:8ed6:663f with SMTP id
 ffacd0b85a97d-3788967492emr7094167f8f.37.1725890223631; 
 Mon, 09 Sep 2024 06:57:03 -0700 (PDT)
Received: from void.void ([141.226.14.150]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-378956d3743sm6147963f8f.79.2024.09.09.06.57.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 06:57:03 -0700 (PDT)
From: Andrew Kreimer <algonell@gmail.com>
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org, Andrew Kreimer <algonell@gmail.com>,
 Matthew Wilcox <willy@infradead.org>
Subject: [PATCH] accel/ivpu: Fix a typo
Date: Mon,  9 Sep 2024 16:56:38 +0300
Message-ID: <20240909135655.45938-1-algonell@gmail.com>
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
 drivers/accel/ivpu/vpu_boot_api.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/ivpu/vpu_boot_api.h b/drivers/accel/ivpu/vpu_boot_api.h
index 82954b91b748..d474bc7b15c0 100644
--- a/drivers/accel/ivpu/vpu_boot_api.h
+++ b/drivers/accel/ivpu/vpu_boot_api.h
@@ -8,7 +8,7 @@
 
 /*
  * =========== FW API version information beginning ================
- *  The bellow values will be used to construct the version info this way:
+ *  The below values will be used to construct the version info this way:
  *  fw_bin_header->api_version[VPU_BOOT_API_VER_ID] = (VPU_BOOT_API_VER_MAJOR << 16) |
  *  VPU_BOOT_API_VER_MINOR;
  *  VPU_BOOT_API_VER_PATCH will be ignored. KMD and compatibility is not affected if this changes
-- 
2.46.0

