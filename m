Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABEF939308F
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 16:14:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 824246E970;
	Thu, 27 May 2021 14:13:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46DE26E8CE
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 14:13:47 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 y184-20020a1ce1c10000b02901769b409001so566502wmg.3
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 07:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ta+1QGRj8qkvW03oDuYFdeLGx74AAZepqtGEBPaAeu4=;
 b=UjgqXOaXPTTQXUGt2iIa74wJo+KnY5lzqMYC5vcVxLQODTyY+9c1PF+T6RqT3zTQ+A
 E9nLxY7twIo2LQWn3NfSqVZYAoScsGHAmyRtnM1qmPwmKxh0kKGer8bWfM+7xFpl88lG
 IJeCFyEfeVKtawMgTeqKkdxy/HRVTdMf3lkVU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ta+1QGRj8qkvW03oDuYFdeLGx74AAZepqtGEBPaAeu4=;
 b=FJ+vx4UWcl7hV1LUBuFgOoATpxLiecB622kk24J/EbxH4uQxTHL2HrE/70QUzjR2/1
 vATDdkPFsR4LJVYdYWDY+xNvmcUhEq833MU3TjKLPhcStrGnpV+SKjwfEUyEWfJx68B1
 i/KGeuP57I3mh4Y8Gw5v2et1H2q0B2+YAg1b9Kgmd6UKAa/3boQPoS+mk2lVbOoJ5ipY
 HJ/eli/Z/apiLKEPRCyw7Fz/NsaVY34ygfW2+vJWSmzyC82oGZkVM3pJTu9d8pk9BK7e
 Ogfnk8fxFaUFIDK6grYd02i95pc3BuWcQc8UwHsLK8qgjlwGhQBjDxE3rtSefLigT1sK
 alww==
X-Gm-Message-State: AOAM531kruxy3f3HrnipuzwVp6FQveziYpYcKOQUKbM6lRMrdpO5Nz1M
 DRouJ5cZtDPJM8tJSe3Y16IWXw==
X-Google-Smtp-Source: ABdhPJz4/ptsWZrOaLs3P+RA+DUiiv3OiIo7JsBVgU/moAVAMl5UiS1z/qa22fJSaFue+dDWwH5ouw==
X-Received: by 2002:a1c:e243:: with SMTP id z64mr3681766wmg.25.1622124825935; 
 Thu, 27 May 2021 07:13:45 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id x10sm3381136wrt.65.2021.05.27.07.13.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 May 2021 07:13:45 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Subject: [PATCH 3/4] drm/shmem-helper: Switch to vmf_insert_pfn
Date: Thu, 27 May 2021 16:13:36 +0200
Message-Id: <20210527141337.3857901-4-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210527141337.3857901-1-daniel.vetter@ffwll.ch>
References: <20210527141337.3857901-1-daniel.vetter@ffwll.ch>
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

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

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

