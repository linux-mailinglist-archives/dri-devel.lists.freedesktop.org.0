Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7BF6FCDDB
	for <lists+dri-devel@lfdr.de>; Tue,  9 May 2023 20:33:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DABB10E3C1;
	Tue,  9 May 2023 18:33:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15BAC10E3C3;
 Tue,  9 May 2023 18:33:42 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-645c4a0079dso569174b3a.1; 
 Tue, 09 May 2023 11:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683657222; x=1686249222;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i7PfYPe4eLOcjabfDmHF25blL1VDKiKWkJ3EDvbFzf8=;
 b=OUq+jY1cWxHDlHQVpMVYAxI7+5PjgOLZ/8dIIsVbA54+8JMpa8n77xaT3BaGQTHovS
 Qd00zDJyevC01SlA5D5Lv0ZXoe/MSEdVoKbxQtXQaPsrzIqSCVJyrCRNeAeD3CWz7o0N
 eiy6P8aLVFXuctqhyqry3WkAyX7m6/xAtiT2NZJTWCzRXdU/kDAj7uFiao9pEQ8mj6cU
 5ECR9IF580WdZpsN/d611xfjjmKB3Sk8KRvhf5rxbRfB+j/ezFrWFe2XWdFI8GKmQAMK
 wcJmDJVQuFSo3btqpoODBEpCcOyVpLbSsCB5PMMOl6CaKVj3azWWmOJMCDONEHLxG/H9
 34iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683657222; x=1686249222;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i7PfYPe4eLOcjabfDmHF25blL1VDKiKWkJ3EDvbFzf8=;
 b=aHzkIJvFD+OZeGdXTgTCR0rRAYMQ0ztHQZ6H8ZasH42lMnFo1kfFFVjzvc6JY0Q/Qq
 lE6KZdIpDTLXry2sUmvks4lixvXAaKZ/hLtTQWvdJjNr1akFWXXASL4ZpU71S2X+yio0
 DIBOlsS2/+c1bVX5hliyj18Ei1emv3HsdxnIquADN/RrAkYHLPyU44CMdVlRwzoIOSQ/
 ICfCGSS6g6Vq05YIUwEMoKntovKRCw3EI8ca9kxzOIf/OB/izwbYVquhMXbB98L6oIMI
 EqWhVPLy8QQg1jhqbsT9SfgNUXZbYFCG5ALfKSr5YEyKbvmp6MY86+i0J6sl82F29/+f
 b3Ig==
X-Gm-Message-State: AC+VfDzxEGN7UfCzusalNP/bTnE/KgkOPp0QukO3JtSC9jXMz8N5OayT
 78x6TfLjsOmamnuhYflOq8HpDBNSqYTR3g==
X-Google-Smtp-Source: ACHHUZ4ZMRUTtN6PGcyLIB307BJIMOx28+ffbqDtxYzDR9taPLU25CQwNbMZuwM0pgv+yb72EPBnmQ==
X-Received: by 2002:a17:902:e74f:b0:19e:94ff:6780 with SMTP id
 p15-20020a170902e74f00b0019e94ff6780mr18970863plf.6.1683657216944; 
 Tue, 09 May 2023 11:33:36 -0700 (PDT)
Received: from olv-ct-22.c.googlers.com.com
 (217.108.125.34.bc.googleusercontent.com. [34.125.108.217])
 by smtp.gmail.com with ESMTPSA id
 13-20020a170902e9cd00b001ab0669d84csm1948277plk.26.2023.05.09.11.33.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 May 2023 11:33:36 -0700 (PDT)
From: Chia-I Wu <olvaffe@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] amdgpu: validate drm_amdgpu_gem_va against overflows
Date: Tue,  9 May 2023 11:32:55 -0700
Message-ID: <20230509183301.1745462-2-olvaffe@gmail.com>
X-Mailer: git-send-email 2.40.1.521.gf1e218fcd8-goog
In-Reply-To: <20230509183301.1745462-1-olvaffe@gmail.com>
References: <20230509183301.1745462-1-olvaffe@gmail.com>
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
 Jammy Zhou <Jammy.Zhou@amd.com>, Mukul Joshi <mukul.joshi@amd.com>,
 Suren Baghdasaryan <surenb@google.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 =?UTF-8?q?Marek=20Ol=C5=A1=C3=A1k?= <marek.olsak@amd.com>,
 Luben Tuikov <luben.tuikov@amd.com>, Yang Li <yang.lee@linux.alibaba.com>,
 Danijel Slivka <danijel.slivka@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The existing validations are incorrect and insufficient.  This is
motivated by OOB access in amdgpu_vm_update_range when
offset_in_bo+map_size overflows.

Fixes: 9f7eb5367d00 ("drm/amdgpu: actually use the VM map parameters")
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c | 7 +++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c  | 6 ++----
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
index 071f6565cf971..36d5adfdf0f69 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
@@ -688,8 +688,11 @@ int amdgpu_gem_va_ioctl(struct drm_device *dev, void *data,
 		return -EINVAL;
 	}
 
-	if (args->map_size == 0) {
-		dev_dbg(dev->dev, "invalid map_size 0x%LX\n", args->map_size);
+	if (args->map_size == 0 ||
+	    args->va_address + args->map_size < args->va_address ||
+	    args->offset_in_bo + args->map_size < args->offset_in_bo) {
+		dev_dbg(dev->dev, "invalid map_size 0x%LX (va_address 0x%LX, offset_in_bo 0x%LX)\n",
+			args->map_size, args->va_address, args->offset_in_bo);
 		return -EINVAL;
 	}
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index fa5819d581655..cd0a0f06e11ef 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -1437,8 +1437,7 @@ int amdgpu_vm_bo_map(struct amdgpu_device *adev,
 
 	/* make sure object fit at this offset */
 	eaddr = saddr + size - 1;
-	if (saddr >= eaddr ||
-	    (bo && offset + size > amdgpu_bo_size(bo)) ||
+	if ((bo && offset + size > amdgpu_bo_size(bo)) ||
 	    (eaddr >= adev->vm_manager.max_pfn << AMDGPU_GPU_PAGE_SHIFT))
 		return -EINVAL;
 
@@ -1498,8 +1497,7 @@ int amdgpu_vm_bo_replace_map(struct amdgpu_device *adev,
 
 	/* make sure object fit at this offset */
 	eaddr = saddr + size - 1;
-	if (saddr >= eaddr ||
-	    (bo && offset + size > amdgpu_bo_size(bo)) ||
+	if ((bo && offset + size > amdgpu_bo_size(bo)) ||
 	    (eaddr >= adev->vm_manager.max_pfn << AMDGPU_GPU_PAGE_SHIFT))
 		return -EINVAL;
 
-- 
2.40.1.521.gf1e218fcd8-goog

