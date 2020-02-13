Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD7C15D371
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 09:08:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8F886E9E0;
	Fri, 14 Feb 2020 08:08:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64B5C6E2D7;
 Thu, 13 Feb 2020 11:59:37 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id c84so6399768wme.4;
 Thu, 13 Feb 2020 03:59:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=d0GQRE02vUXi0zNjm8nV6kYxKwm5bxqPMS742gEhTks=;
 b=XnCVljShLXO+p8Zv7HKzmmomKCSoeMh7ewgQ+ZBdfTMq+wVDu2sIrdKpbrVv872Ft0
 cEiPsG6QtEQacpquGZRNEbYCga4I0rAgre8p7DIDbFm7Ni9EJmy85AcwGCw6ykGT8abg
 o3DwBtSVlPbWItMExKLOWdgZAUo2zdt6GSxHYC+JfZboootdkEO9cDP4jEmMMLNp6w3d
 IcoKOGCLRH77mfms0K9soLPhkXl/nVemseH7fpxaF6uqG1ouWKqkNr/VMIEsmy2gHUsL
 Q2dYDDWAlX1dGNkD3BgvKN55HMql1Qc5ir4PILCzvKhoLDJe79JaVm1sbiZpAYCiX6Gh
 uOeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=d0GQRE02vUXi0zNjm8nV6kYxKwm5bxqPMS742gEhTks=;
 b=rEHD7+K2GJh+bFVUUwXF3UjYL9B/Y3/RgEp/IYaE/liUkC3x7hoNo2Fv+EKyeGusQq
 lHsZJO0T2kHFgNVrNHDRKVLxoVP9Zf0w8mwoirfxAlciqYrTSclVYKtCI3eoogJHl0vO
 usYZRKlyNhwRftsbLobAiIgZCIGgl4Ma0vdG4TRFjNgE3K1lvV4lu3F1YNTFX0on7jYN
 X6EBK1Z3PfuyT8wJfdTWC+ndUszQrguCYudi0Sdx6fWemPvsLyMoudVNrgZxEaBeuR4q
 DKZExXAoKNjTT0ROijzQF+MxmyhqfEfk570zRRlwgCxTe4vzfGfIer9Myal/BstsXReU
 zsuQ==
X-Gm-Message-State: APjAAAVPHHP0nq3ctUvvY5pe/g19z5zvLaJKrtFo4qw5MxtS7x/n7Yyw
 kk4/3pLM8oq9gfEyBzStKlB4BZ4jaQHGWQ==
X-Google-Smtp-Source: APXvYqwIgOJn6t6ycaz0hbEhIDcCp6locCgMNIGkS1xANRQbXyY1bAsiMiTzflne5BQRmOTu4VnqMw==
X-Received: by 2002:a7b:cb97:: with SMTP id m23mr5205631wmi.37.1581595175678; 
 Thu, 13 Feb 2020 03:59:35 -0800 (PST)
Received: from brihaspati.fritz.box
 (p200300C58F2A5E004DB99F42976E8A13.dip0.t-ipconnect.de.
 [2003:c5:8f2a:5e00:4db9:9f42:976e:8a13])
 by smtp.gmail.com with ESMTPSA id y131sm2803985wmc.13.2020.02.13.03.59.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2020 03:59:35 -0800 (PST)
From: Nirmoy Das <nirmoy.aiemd@gmail.com>
X-Google-Original-From: Nirmoy Das <nirmoy.das@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 3/6] drm/vmwgfx: don't use ttm bo->offset
Date: Thu, 13 Feb 2020 13:02:00 +0100
Message-Id: <20200213120203.29368-4-nirmoy.das@amd.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200213120203.29368-1-nirmoy.das@amd.com>
References: <20200213120203.29368-1-nirmoy.das@amd.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 14 Feb 2020 08:07:58 +0000
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
Cc: thellstrom@vmware.com, airlied@linux.ie, kenny.ho@amd.com,
 brian.welty@intel.com, amd-gfx@lists.freedesktop.org, nirmoy.das@amd.com,
 linux-graphics-maintainer@vmware.com, bskeggs@redhat.com,
 alexander.deucher@amd.com, sean@poorly.run, christian.koenig@amd.com,
 kraxel@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c         | 4 ++--
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c    | 2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c       | 2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c | 2 --
 4 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
index 74016a08d118..dd9fd609d37c 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
@@ -258,7 +258,7 @@ int vmw_bo_pin_in_start_of_vram(struct vmw_private *dev_priv,
 		ret = ttm_bo_validate(bo, &placement, &ctx);
 
 	/* For some reason we didn't end up at the start of vram */
-	WARN_ON(ret == 0 && bo->offset != 0);
+	WARN_ON(ret == 0 && (bo->mem.start << PAGE_SHIFT) != 0);
 	if (!ret)
 		vmw_bo_pin_reserved(buf, true);
 
@@ -317,7 +317,7 @@ void vmw_bo_get_guest_ptr(const struct ttm_buffer_object *bo,
 {
 	if (bo->mem.mem_type == TTM_PL_VRAM) {
 		ptr->gmrId = SVGA_GMR_FRAMEBUFFER;
-		ptr->offset = bo->offset;
+		ptr->offset = bo->mem.start << PAGE_SHIFT;
 	} else {
 		ptr->gmrId = bo->mem.start;
 		ptr->offset = 0;
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
index ff86d49dc5e8..e8a3351f35cf 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
@@ -3305,7 +3305,7 @@ static void vmw_apply_relocations(struct vmw_sw_context *sw_context)
 		bo = &reloc->vbo->base;
 		switch (bo->mem.mem_type) {
 		case TTM_PL_VRAM:
-			reloc->location->offset += bo->offset;
+			reloc->location->offset += bo->mem.start << PAGE_SHIFT;
 			reloc->location->gmrId = SVGA_GMR_FRAMEBUFFER;
 			break;
 		case VMW_PL_GMR:
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c b/drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c
index e5252ef3812f..1cdc445b24c3 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c
@@ -612,7 +612,7 @@ static int vmw_fifo_emit_dummy_legacy_query(struct vmw_private *dev_priv,
 
 	if (bo->mem.mem_type == TTM_PL_VRAM) {
 		cmd->body.guestResult.gmrId = SVGA_GMR_FRAMEBUFFER;
-		cmd->body.guestResult.offset = bo->offset;
+		cmd->body.guestResult.offset = bo->mem.start << PAGE_SHIFT;
 	} else {
 		cmd->body.guestResult.gmrId = bo->mem.start;
 		cmd->body.guestResult.offset = 0;
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
index d8ea3dd10af0..1e69c013b47f 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
@@ -755,7 +755,6 @@ static int vmw_init_mem_type(struct ttm_bo_device *bdev, uint32_t type,
 	case TTM_PL_VRAM:
 		/* "On-card" video ram */
 		man->func = &ttm_bo_manager_func;
-		man->gpu_offset = 0;
 		man->flags = TTM_MEMTYPE_FLAG_FIXED | TTM_MEMTYPE_FLAG_MAPPABLE;
 		man->available_caching = TTM_PL_FLAG_CACHED;
 		man->default_caching = TTM_PL_FLAG_CACHED;
@@ -768,7 +767,6 @@ static int vmw_init_mem_type(struct ttm_bo_device *bdev, uint32_t type,
 		 *  slots as well as the bo size.
 		 */
 		man->func = &vmw_gmrid_manager_func;
-		man->gpu_offset = 0;
 		man->flags = TTM_MEMTYPE_FLAG_CMA | TTM_MEMTYPE_FLAG_MAPPABLE;
 		man->available_caching = TTM_PL_FLAG_CACHED;
 		man->default_caching = TTM_PL_FLAG_CACHED;
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
