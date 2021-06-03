Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 134EF39A5F7
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 18:41:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B4A66F4E4;
	Thu,  3 Jun 2021 16:41:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C0F26F4D7
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jun 2021 16:41:22 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id z8so6491418wrp.12
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Jun 2021 09:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=K1coG7h5qOcyX3TFCJmN3+NrXWbu3EM0vaiSUmJb+cQ=;
 b=iT0TkCUe47sCYoE0R8lPsgerUgl+UUr8wId2z+ti4HG9GCip9541EPKb+DYZXwdg7M
 yFE4I+jGnVLH28vPT5cSOkRlg2MvionTyBDlfewv2zcX0OJi2/N5/GnUYFq+NnAmbJgG
 Nicjf8q12LROCfcKQV/JhlyG9ylGEcu+qBZtM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K1coG7h5qOcyX3TFCJmN3+NrXWbu3EM0vaiSUmJb+cQ=;
 b=fm6RYH6MZcLWy/S+OI5qdRJaDwyAWBxmm/c+E40eMT64Bs9L56C9Syx74GmK+gaiG6
 jfPAiv7wx/BPvTOLqqM6jTOP+fl3bJnHckGIhSuU2R3Cd5M3DoZRZNxrOVKFSqn8EV4w
 OVstMu7gR00O14yBOxDfev6IJItfMe7tvuxuHrVcfa97i855RsQzc6L7N8As/MMQxNuw
 H+gfXq4snGZ8VcTmG8eID6pQEUoHLCv35D7aiuHZW6PlmDHad+PIrP4TzXy32CwoyrZn
 MMtQjAum89hL3zPAkqYl8AiDJFdE4VTdyikxDGAvYG0wbKd7oRv2Bpd6Jrj+DR5AW/bx
 s8Ng==
X-Gm-Message-State: AOAM533k0iI+AHQKT5FiWk1TV7Aj4qKZP6h8QUFUvrNg+VRSEBCvUDwf
 XEmhWRftbf9PN+VL1qy0bptU2w==
X-Google-Smtp-Source: ABdhPJyccpt0vxIl1cj19XwIonfd0dSd4WRLufAv3yBr1mSisrtAHv/xNrVbvdPNmZp6sIgOiarvIg==
X-Received: by 2002:a5d:6187:: with SMTP id j7mr801909wru.107.1622738480977;
 Thu, 03 Jun 2021 09:41:20 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s28sm4992683wra.54.2021.06.03.09.41.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 09:41:20 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Subject: [PATCH v3 2/4] drm/shmem-helper: Switch to vmf_insert_pfn
Date: Thu,  3 Jun 2021 18:41:11 +0200
Message-Id: <20210603164113.1433476-3-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210603164113.1433476-1-daniel.vetter@ffwll.ch>
References: <20210603164113.1433476-1-daniel.vetter@ffwll.ch>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We want to stop gup, which isn't the case if we use vmf_insert_page
and VM_MIXEDMAP, because that does not set pte_special.

v2: With this shmem gem helpers now definitely need CONFIG_MMU (0day)

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 drivers/gpu/drm/Kconfig                | 2 +-
 drivers/gpu/drm/drm_gem_shmem_helper.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 56a55a6e6239..9c21527b791f 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -206,7 +206,7 @@ config DRM_KMS_CMA_HELPER
 
 config DRM_GEM_SHMEM_HELPER
 	bool
-	depends on DRM
+	depends on DRM && MMU
 	help
 	  Choose this if you need the GEM shmem helper functions
 
diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index 6d625cee7a6a..11edd54f0580 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -542,7 +542,7 @@ static vm_fault_t drm_gem_shmem_fault(struct vm_fault *vmf)
 	} else {
 		page = shmem->pages[page_offset];
 
-		ret = vmf_insert_page(vma, vmf->address, page);
+		ret = vmf_insert_pfn(vma, vmf->address, page_to_pfn(page));
 	}
 
 	mutex_unlock(&shmem->pages_lock);
@@ -612,7 +612,7 @@ int drm_gem_shmem_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
 		return ret;
 	}
 
-	vma->vm_flags |= VM_MIXEDMAP | VM_DONTEXPAND;
+	vma->vm_flags |= VM_PFNMAP | VM_DONTEXPAND;
 	vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
 	if (shmem->map_wc)
 		vma->vm_page_prot = pgprot_writecombine(vma->vm_page_prot);
-- 
2.31.0

