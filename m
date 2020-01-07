Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54841133CE5
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2020 09:13:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90A746E874;
	Wed,  8 Jan 2020 08:13:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc44.google.com (mail-yw1-xc44.google.com
 [IPv6:2607:f8b0:4864:20::c44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73A6A6E83A
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2020 19:26:05 +0000 (UTC)
Received: by mail-yw1-xc44.google.com with SMTP id u139so196448ywf.13
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jan 2020 11:26:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=digitalocean.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=tQjRs3gNjU2oRCRkkGnPvWhg7epwoT3OSGkU89AkxDQ=;
 b=RBjyUZwp3oCaYSH4lBnXhf98sJuriMFFB8O7XKfK7ldWb6ngmv2f9qtFr6pCkkxgGw
 7CXrDYukjNwKP67z0Lw1byh8GcFRee92q4Li3sqQ/YUX/yWYSTzzPS0CWi7nplUTz0tb
 Jc7R/IvQnQExyScOkuyYIt2H8ViWXed3K25ks=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=tQjRs3gNjU2oRCRkkGnPvWhg7epwoT3OSGkU89AkxDQ=;
 b=SN711QhzozSulBVDSFO7r4HHDMxlvUSWl3xCtAN45Bi12zQPuRv/4VUsYUMIIKZVwi
 GOKyW/HaGg326ldab8d+UUBKtpWPyQABlcMiV15C/Cs+jOENdEoO1fzsk6N8tkfUsrxO
 xTf+LzS3M96PrXkgO8TpqdwHNPAcEhWIrOcxwfnOVIMgfZ+AkeP5ylqdG4+5f4ZTDSYZ
 TuaR3mxs+Q/9Bkxfx5rkry/4K9g5E+ybKjb5RlwbOQCbkctLxy2tODVjDQFzoSGuGQXd
 QU1G6N4la+NyBPhnRhw5EfzesoE52lTz2A1Wh26KFFSztB4QyXwQVmuaIG8G0BCfoh+N
 zESQ==
X-Gm-Message-State: APjAAAVVtPXkIW8RnCVWRX1pXl3m7HzYNz9Y4jZg3PK92szPCk1+1jVi
 +PgZN1uuNBi7bs2mZP2DLguF
X-Google-Smtp-Source: APXvYqxUxZ+QGpsSnWO2wfDZLiBGzqQSyJZLkZZl9iPaevdfkH2M+Sp/oQ3CIezE7wg13+qNsbCYpQ==
X-Received: by 2002:a81:9c14:: with SMTP id m20mr702845ywa.143.1578425164670; 
 Tue, 07 Jan 2020 11:26:04 -0800 (PST)
Received: from tina-kpatch ([162.243.188.76])
 by smtp.gmail.com with ESMTPSA id e131sm229025ywb.81.2020.01.07.11.26.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2020 11:26:04 -0800 (PST)
From: Tianlin Li <tli@digitalocean.com>
To: kernel-hardening@lists.openwall.com,
	keescook@chromium.org
Subject: [PATCH 1/2] drm/radeon: have the callers of set_memory_*() check the
 return value
Date: Tue,  7 Jan 2020 13:25:54 -0600
Message-Id: <20200107192555.20606-2-tli@digitalocean.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200107192555.20606-1-tli@digitalocean.com>
References: <20200107192555.20606-1-tli@digitalocean.com>
X-Mailman-Approved-At: Wed, 08 Jan 2020 08:12:31 +0000
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Tianlin Li <tli@digitalocean.com>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 christian.koenig@amd.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Have the callers of set_memory_*() in drm/radeon check the return value.
Change the return type of the callers properly. 

Signed-off-by: Tianlin Li <tli@digitalocean.com>
---
 drivers/gpu/drm/radeon/radeon.h      |  2 +-
 drivers/gpu/drm/radeon/radeon_gart.c | 22 ++++++++++++++++++----
 2 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon.h b/drivers/gpu/drm/radeon/radeon.h
index 30e32adc1fc6..a23e58397293 100644
--- a/drivers/gpu/drm/radeon/radeon.h
+++ b/drivers/gpu/drm/radeon/radeon.h
@@ -661,7 +661,7 @@ struct radeon_gart {
 };
 
 int radeon_gart_table_ram_alloc(struct radeon_device *rdev);
-void radeon_gart_table_ram_free(struct radeon_device *rdev);
+int radeon_gart_table_ram_free(struct radeon_device *rdev);
 int radeon_gart_table_vram_alloc(struct radeon_device *rdev);
 void radeon_gart_table_vram_free(struct radeon_device *rdev);
 int radeon_gart_table_vram_pin(struct radeon_device *rdev);
diff --git a/drivers/gpu/drm/radeon/radeon_gart.c b/drivers/gpu/drm/radeon/radeon_gart.c
index d4d3778d0a98..59039ab602e8 100644
--- a/drivers/gpu/drm/radeon/radeon_gart.c
+++ b/drivers/gpu/drm/radeon/radeon_gart.c
@@ -71,6 +71,7 @@
 int radeon_gart_table_ram_alloc(struct radeon_device *rdev)
 {
 	void *ptr;
+	int ret;
 
 	ptr = pci_alloc_consistent(rdev->pdev, rdev->gart.table_size,
 				   &rdev->gart.table_addr);
@@ -80,8 +81,16 @@ int radeon_gart_table_ram_alloc(struct radeon_device *rdev)
 #ifdef CONFIG_X86
 	if (rdev->family == CHIP_RS400 || rdev->family == CHIP_RS480 ||
 	    rdev->family == CHIP_RS690 || rdev->family == CHIP_RS740) {
-		set_memory_uc((unsigned long)ptr,
+		ret = set_memory_uc((unsigned long)ptr,
 			      rdev->gart.table_size >> PAGE_SHIFT);
+		if (ret) {
+			pci_free_consistent(rdev->pdev, rdev->gart.table_size,
+						(void *)rdev->gart.ptr,
+						rdev->gart.table_addr);
+			rdev->gart.ptr = NULL;
+			rdev->gart.table_addr = 0;
+			return ret;
+		}
 	}
 #endif
 	rdev->gart.ptr = ptr;
@@ -98,16 +107,20 @@ int radeon_gart_table_ram_alloc(struct radeon_device *rdev)
  * (r1xx-r3xx, non-pcie r4xx, rs400).  These asics require the
  * gart table to be in system memory.
  */
-void radeon_gart_table_ram_free(struct radeon_device *rdev)
+int radeon_gart_table_ram_free(struct radeon_device *rdev)
 {
+	int ret;
+
 	if (rdev->gart.ptr == NULL) {
-		return;
+		return 0;
 	}
 #ifdef CONFIG_X86
 	if (rdev->family == CHIP_RS400 || rdev->family == CHIP_RS480 ||
 	    rdev->family == CHIP_RS690 || rdev->family == CHIP_RS740) {
-		set_memory_wb((unsigned long)rdev->gart.ptr,
+		ret = set_memory_wb((unsigned long)rdev->gart.ptr,
 			      rdev->gart.table_size >> PAGE_SHIFT);
+		if (ret)
+			return ret;
 	}
 #endif
 	pci_free_consistent(rdev->pdev, rdev->gart.table_size,
@@ -115,6 +128,7 @@ void radeon_gart_table_ram_free(struct radeon_device *rdev)
 			    rdev->gart.table_addr);
 	rdev->gart.ptr = NULL;
 	rdev->gart.table_addr = 0;
+	return 0;
 }
 
 /**
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
