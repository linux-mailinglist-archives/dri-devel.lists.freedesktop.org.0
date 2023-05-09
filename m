Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB0C6FCDD8
	for <lists+dri-devel@lfdr.de>; Tue,  9 May 2023 20:33:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CBE710E133;
	Tue,  9 May 2023 18:33:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A212310E0A3;
 Tue,  9 May 2023 18:33:26 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-6463185f761so485842b3a.0; 
 Tue, 09 May 2023 11:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683657205; x=1686249205;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=66XYrn3OxsOriMI735FsztsxhCcCNS7VnQ9CyIcun0k=;
 b=sD2zZgzdekBu3FUs7ZFXAQMXGzFhvP8+sBg6DAO4BZLNDpTCTmYNeGQU+UOojZofXJ
 xqyI9/Y1RjrFijaVMExTnl9BcPCd9enm5IyFR2hefmItlaUL7N2A1TJq3XAdbDK4rqFA
 FssWB9V1vzAKCl31twmjXh6+4OuXkvE6X4zjUTuUbCvOgfTsKWufrA7fMb8xYg551lOp
 C1/hL6gzqedWSlFvzv1KbFpQe9N3ociSmmTzu3Sn88X0/GTTVVTRlfyFF8ozDXL7IN4S
 gqwVCWpyNL7ZFwuIz8lWOgbXqO7RKq0IItC9rQZn1rh2vgcIdkcRfwY3qaG/DaU/vvZT
 S0KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683657205; x=1686249205;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=66XYrn3OxsOriMI735FsztsxhCcCNS7VnQ9CyIcun0k=;
 b=cyWXsCFFpALAeoTCRhbhLn489tZyS9F1SoxpCwYX4qvYOpm8dge8uEaN8E0iJejQsm
 gBADl9E/7jN98UJb+YfJRRmrPQgwl5PrxiQenK4+GVt1q6hov7n0e/D39lWl1fbGnW+C
 DrdS62C9xBeDR0GfK5mEZHsXNL1cyRL00sdC7zdjQbbLJvikRohSho+f006Qj3J2oCL8
 NglSYJuqdJNV0sG8NTFTD5kFMnYQSbpHHGe9dowgVoyFze3oSJbUocX6laoS5q1dK9aE
 l4DiOC/Inybg5TzJfh1w9XNKIXVx0DzmwKgFRuLtOIiUfAbhiXyHYC16XrRq0HuAFI0N
 aDOA==
X-Gm-Message-State: AC+VfDxfzZPdxCYgTxw21d7jyLGoZTEetIly7IfLtIeljIuMBYGcTMFk
 pLG8Wcn06KW6jHCVncMKozfFBQvQe4o=
X-Google-Smtp-Source: ACHHUZ4rEOCYnDYqNb/IIjjLkiAa8OHVI4MvSoSXzD0ClVpDs5JvDmkrE1YCeIWLD/OeZ7J4npNQ8g==
X-Received: by 2002:a17:903:41ca:b0:1a4:f4e6:b68 with SMTP id
 u10-20020a17090341ca00b001a4f4e60b68mr19020579ple.3.1683657205076; 
 Tue, 09 May 2023 11:33:25 -0700 (PDT)
Received: from olv-ct-22.c.googlers.com.com
 (217.108.125.34.bc.googleusercontent.com. [34.125.108.217])
 by smtp.gmail.com with ESMTPSA id
 13-20020a170902e9cd00b001ab0669d84csm1948277plk.26.2023.05.09.11.33.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 May 2023 11:33:24 -0700 (PDT)
From: Chia-I Wu <olvaffe@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] amdgpu: validate drm_amdgpu_gem_va addrs for all ops
Date: Tue,  9 May 2023 11:32:54 -0700
Message-ID: <20230509183301.1745462-1-olvaffe@gmail.com>
X-Mailer: git-send-email 2.40.1.521.gf1e218fcd8-goog
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
Cc: Philip Yang <Philip.Yang@amd.com>, Kefeng Wang <wangkefeng.wang@huawei.com>,
 amd-gfx@lists.freedesktop.org,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 Suren Baghdasaryan <surenb@google.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, Mukul Joshi <mukul.joshi@amd.com>,
 =?UTF-8?q?Marek=20Ol=C5=A1=C3=A1k?= <marek.olsak@amd.com>,
 Luben Tuikov <luben.tuikov@amd.com>, Yang Li <yang.lee@linux.alibaba.com>,
 Danijel Slivka <danijel.slivka@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Extend the address and size validations to AMDGPU_VA_OP_UNMAP and
AMDGPU_VA_OP_CLEAR by moving the validations to amdgpu_gem_va_ioctl.

Internal users of amdgpu_vm_bo_map are no longer validated but they
should be fine.

Userspace (radeonsi and radv) seems fine as well.
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c | 12 ++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c  | 10 ----------
 2 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
index d8e683688daab..071f6565cf971 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
@@ -681,6 +681,18 @@ int amdgpu_gem_va_ioctl(struct drm_device *dev, void *data,
 	uint64_t vm_size;
 	int r = 0;
 
+	if (args->va_address & ~PAGE_MASK || args->offset_in_bo & ~PAGE_MASK ||
+	    args->map_size & ~PAGE_MASK) {
+		dev_dbg(dev->dev, "unaligned va_address 0x%LX, offset_in_bo 0x%LX, or map_size 0x%LX\n",
+			args->va_address, args->offset_in_bo, args->map_size);
+		return -EINVAL;
+	}
+
+	if (args->map_size == 0) {
+		dev_dbg(dev->dev, "invalid map_size 0x%LX\n", args->map_size);
+		return -EINVAL;
+	}
+
 	if (args->va_address < AMDGPU_VA_RESERVED_SIZE) {
 		dev_dbg(dev->dev,
 			"va_address 0x%LX is in reserved area 0x%LX\n",
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index b9441ab457ea7..fa5819d581655 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -1435,11 +1435,6 @@ int amdgpu_vm_bo_map(struct amdgpu_device *adev,
 	struct amdgpu_vm *vm = bo_va->base.vm;
 	uint64_t eaddr;
 
-	/* validate the parameters */
-	if (saddr & ~PAGE_MASK || offset & ~PAGE_MASK ||
-	    size == 0 || size & ~PAGE_MASK)
-		return -EINVAL;
-
 	/* make sure object fit at this offset */
 	eaddr = saddr + size - 1;
 	if (saddr >= eaddr ||
@@ -1501,11 +1496,6 @@ int amdgpu_vm_bo_replace_map(struct amdgpu_device *adev,
 	uint64_t eaddr;
 	int r;
 
-	/* validate the parameters */
-	if (saddr & ~PAGE_MASK || offset & ~PAGE_MASK ||
-	    size == 0 || size & ~PAGE_MASK)
-		return -EINVAL;
-
 	/* make sure object fit at this offset */
 	eaddr = saddr + size - 1;
 	if (saddr >= eaddr ||
-- 
2.40.1.521.gf1e218fcd8-goog

