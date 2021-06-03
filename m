Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E85C639A3EC
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 17:03:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B41216F497;
	Thu,  3 Jun 2021 15:03:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46FE56F492
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jun 2021 15:03:35 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id a11so9015258ejf.3
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Jun 2021 08:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6MGYQk8ey/5a21IsuK4G3QHZtJdzwBpRD05vytZmRlE=;
 b=MfaON4DM1tv3vxaJ+6htTHQggaxs3enz6m9iqbk3RYMVRA2t+XeFpxMgatMelnFzo0
 d4SADi4p5ksfkGHY06CJovxjgyyfil2XtJTPzXRXY3bJtaFADeN7Q2hreQWasoAiu9RO
 X7r3b/34rfgqldI6oJlkfNB7D3AihW/M3UVpc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6MGYQk8ey/5a21IsuK4G3QHZtJdzwBpRD05vytZmRlE=;
 b=JW4iNtDL1aHTVfLdc6Al65Kbq8L8hRDgXWO3wlPO8qponFAj6rN0U3UD/og33Zap88
 p1lYkNCxoskGlXuq5gneMOsjxhBbJVr/Mf4KbCjE1Am80NBJY2n5mMn40T4WdQFjcf+N
 WNtkkUmsU+YkWXiZlGI6Xq+KKQHH30VCEOOZEQSF8DjidasfhNDBzPLUHEs2vCNh4YKm
 xZFZTzjdYNFO1iHI3eJ2ZnJ1DKav0DP2/5q+AqZDaxT8RtpVmY2puJywfKwVAI84yZ21
 W1U2Fog0JHQwzeLVd19z8O2QWAmuk1g4pEzDzGjsLoo8r4Xz1swoCefssxDpyoNq90XV
 mTkQ==
X-Gm-Message-State: AOAM533CtiWIeGzmErA2mF5uT4V1iRZoP6bwivYgLEbD1tT2lyZuGk6Z
 wF6tfkWu/rA3Og/7fitM2as9Gw==
X-Google-Smtp-Source: ABdhPJwVkJUk/24oldMBZ63l0Ip19l27jqfvJGs2ldUynXLR24tEN0xsEK39yZBwMRzgozKESzfsUA==
X-Received: by 2002:a17:906:b1cc:: with SMTP id
 bv12mr15353ejb.407.1622732613918; 
 Thu, 03 Jun 2021 08:03:33 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id hz10sm1621791ejc.40.2021.06.03.08.03.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 08:03:33 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Subject: [PATCH v2 2/4] drm/shmem-helper: Switch to vmf_insert_pfn
Date: Thu,  3 Jun 2021 17:03:24 +0200
Message-Id: <20210603150326.1326658-3-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210603150326.1326658-1-daniel.vetter@ffwll.ch>
References: <20210603150326.1326658-1-daniel.vetter@ffwll.ch>
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
index 4439004e62fe..32f1d7601ec6 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -543,7 +543,7 @@ static vm_fault_t drm_gem_shmem_fault(struct vm_fault *vmf)
 	} else {
 		page = shmem->pages[page_offset];
 
-		ret = vmf_insert_page(vma, vmf->address, page);
+		ret = vmf_insert_pfn(vma, vmf->address, page_to_pfn(page));
 	}
 
 	mutex_unlock(&shmem->pages_lock);
@@ -613,7 +613,7 @@ int drm_gem_shmem_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
 		return ret;
 	}
 
-	vma->vm_flags |= VM_MIXEDMAP | VM_DONTEXPAND;
+	vma->vm_flags |= VM_PFNMAP | VM_DONTEXPAND;
 	vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
 	if (shmem->map_wc)
 		vma->vm_page_prot = pgprot_writecombine(vma->vm_page_prot);
-- 
2.31.0

