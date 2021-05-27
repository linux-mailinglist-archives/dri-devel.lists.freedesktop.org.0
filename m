Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0F93938F2
	for <lists+dri-devel@lfdr.de>; Fri, 28 May 2021 01:10:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09BA86F4EB;
	Thu, 27 May 2021 23:09:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45C006F4EA;
 Thu, 27 May 2021 23:09:58 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id n10so2248645ion.8;
 Thu, 27 May 2021 16:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rXMEJXZjUbtBJkh2+REg2+RPpXku92/vdnGkFUqmhuc=;
 b=Ay93GmLCUIM7OteWbUa90Gw5fkekkkBc+XOVdI8G84UMUZ/kuiX/h2Ao2PW5vHiFB6
 hQZPvmdGX7vzVDQMkXNpkSEkc/zmFtCmCRxDII/7InR6IyjNW/4f/uZ5OZ7xZqyO4a89
 stoaqe9D38iucOA8h8bF8IbwTqqroGwp4KG5inSRTrKAvQa2KQjMiKzzKmk+xIFqRIKX
 daGZ65vuyKaYYpcK5mJB9vWsr9S8x2sXLjTXqTFQjQkajyxjMBNZuToZ7/0S4T/4dsXI
 FG9HLXMIthbY0L9GMsDBQWF3QNGmGO6su0wuZlxkjAPLI/ZxjKUxstdPY0bwKHceGX2x
 SAmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rXMEJXZjUbtBJkh2+REg2+RPpXku92/vdnGkFUqmhuc=;
 b=QhGlGH70xDLo54m+6X7jGBO1jpGeSLFK9IbhVjtER94LEVI0wIDK5U1MH2XD67DPPD
 CQUlchKqBzCznh/w4w/R1K/91o5Zqhj2peN9+qXVk0vho5+5+XUgI4os33WxTyK/CAbJ
 icefYpxlHKEH17+QjqJGEBRE2vuSJmTkFgp1m6SaPE2w77hfnq9m0tEMuvgl85YR64dh
 nLVA3o+wyT6iWmjrIlrfSwbgiFNYcT9xdTLc3HgXzvYRaujeVsroMIdm21SKeW6G27XS
 YeFF/aNcG6sqtfydsArL0JgxZECjZ2Q/6QwsXsHRRuQh50UBIPW6VBtO1MTdgSKdcZOK
 aeGA==
X-Gm-Message-State: AOAM530O+DpojpD8xfIFl/kYJxTTwG/02hBC/Q7Ii6DKCSJ54rXZv35E
 rtwyWhwIy7D6HnP8lr/jIdPa+U4JYDSG2zoc
X-Google-Smtp-Source: ABdhPJyzp92hDnF8efLXJm+0tvdMSeJf8uS6fJ+jMitfdarllFRWiq1kbTXZrJAJlWHy2hx5t+p1uw==
X-Received: by 2002:a6b:5015:: with SMTP id e21mr4817176iob.104.1622156997727; 
 Thu, 27 May 2021 16:09:57 -0700 (PDT)
Received: from Harpoon.amd.com ([165.204.55.251])
 by smtp.gmail.com with ESMTPSA id r5sm1860014ilb.1.2021.05.27.16.09.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 May 2021 16:09:48 -0700 (PDT)
From: Felix Kuehling <felix.kuehling@gmail.com>
X-Google-Original-From: Felix Kuehling <Felix.Kuehling@amd.com>
To: felix.kuehling@amd.com,
	akpm@linux-foundation.org,
	linux-mm@kvack.org
Subject: [RFC PATCH 2/5] drm/amdkfd: generic type as sys mem on migration to
 ram
Date: Thu, 27 May 2021 19:08:06 -0400
Message-Id: <20210527230809.3701-3-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210527230809.3701-1-Felix.Kuehling@amd.com>
References: <20210527230809.3701-1-Felix.Kuehling@amd.com>
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
Cc: Alex Sierra <alex.sierra@amd.com>, dri-devel@lists.freedesktop.org,
 jglisse@redhat.com, amd-gfx@lists.freedesktop.org, jgg@nvidia.com, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alex Sierra <alex.sierra@amd.com>

Generic device type memory on VRAM to RAM migration,
has similar access as System RAM from the CPU. This flag sets
the source from the sender. Which in Generic type case,
should be set as SYSTEM.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index f5939449a99f..7b41006c1164 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -653,8 +653,9 @@ svm_migrate_vma_to_ram(struct amdgpu_device *adev, struct svm_range *prange,
 	migrate.vma = vma;
 	migrate.start = start;
 	migrate.end = end;
-	migrate.flags = MIGRATE_VMA_SELECT_DEVICE_PRIVATE;
 	migrate.pgmap_owner = SVM_ADEV_PGMAP_OWNER(adev);
+	migrate.flags = adev->gmc.xgmi.connected_to_cpu ?
+			MIGRATE_VMA_SELECT_SYSTEM : MIGRATE_VMA_SELECT_DEVICE_PRIVATE;
 
 	size = 2 * sizeof(*migrate.src) + sizeof(uint64_t) + sizeof(dma_addr_t);
 	size *= npages;
-- 
2.31.1

