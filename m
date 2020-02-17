Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB8A1621C8
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2020 08:56:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5808B6E160;
	Tue, 18 Feb 2020 07:55:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F2406E906;
 Mon, 17 Feb 2020 10:16:04 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id z3so19004040wru.3;
 Mon, 17 Feb 2020 02:16:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RmacnuyzAA19XBpDKfCDUiqSo+PKMyCxvJ35QrGZpKw=;
 b=GFOLO9SL+A3h5x/3pKA62syV55N3PwrrW3WJu0F9sMcAa+g2+uKfd47NAQ2wp4jCza
 SKeold1fObuv5UAiViNbT+J3QpjkESUQ9JIjJkAulko6kyvLds+cUucbpWFEfnessesG
 MBoFDprp6oNi+Bwuk95PRLT2uEmid0OwQwVJQEvMArkIEPYc7E1i+YGB5LujSEbRpu7S
 xF7bpU63eu1WZ7kXlkofYrPEo9MpfmFLvx41LJm+zaXzShW+dgG+/RH47QKHl/55G2NW
 14FpB/rboEzZ9+2MMDXxQqbwH9f/dq9OAPIbltzM6sB1whLQjZfXLert7eoeLEKjy2mJ
 5/Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RmacnuyzAA19XBpDKfCDUiqSo+PKMyCxvJ35QrGZpKw=;
 b=BPN9mutSdTOBOXDJ7F5kLOSjiMV2bwFQ02uKhFBV6nw9Rb3aFJVntPe1+KvsqZCbYk
 XjKRX4cP2IDVbaC6JadnU2Z5E1QOAXZRKM+sa8mWeNKPSw1fsd7Gl+I7dy13wAL7HRvT
 yAXPwZLdTlwPioVzqcRbnqbwWKvoMYoPqAcq1EcYWm4+kHJYBDRhNMo31Yy4Seajq4iE
 gKpBBmEFshh5p4gQgyg+ADit6DOcepQ4jDMz0bW51sx6gU8dll4p9UVgmdD4yjawHnWs
 UiiczRV/hsa3+gHzwxAnXdyB7Zh+DzpMDz94c5UDcezj46lNkV6ZPvkV3EjFNyFFRDsY
 k8Iw==
X-Gm-Message-State: APjAAAUq31gK+u67ea3Vijjc9ZutwBRMs1NlsTOwjMlp1wKPdGa6ttw3
 z/qMUwapyHMW2PasDB6pehc/FwV03NbA8w==
X-Google-Smtp-Source: APXvYqx48SKwCa5RNMwF8b6EXfEqI2bAW536baBSRdkca35JTgpOtVm7cmym+sVF7Mr/OfaUI+SrKg==
X-Received: by 2002:a5d:61cb:: with SMTP id q11mr22417601wrv.71.1581934562762; 
 Mon, 17 Feb 2020 02:16:02 -0800 (PST)
Received: from brihaspati.fritz.box
 (p200300C58F261400BC111EAD619EC67C.dip0.t-ipconnect.de.
 [2003:c5:8f26:1400:bc11:1ead:619e:c67c])
 by smtp.gmail.com with ESMTPSA id a16sm278487wrt.30.2020.02.17.02.16.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2020 02:16:02 -0800 (PST)
From: Nirmoy Das <nirmoy.aiemd@gmail.com>
X-Google-Original-From: Nirmoy Das <nirmoy.das@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/7] drm/vmwgfx: don't use ttm bo->offset
Date: Mon, 17 Feb 2020 11:18:37 +0100
Message-Id: <20200217101841.7437-4-nirmoy.das@amd.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200217101841.7437-1-nirmoy.das@amd.com>
References: <20200217101841.7437-1-nirmoy.das@amd.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 18 Feb 2020 07:55:25 +0000
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

Calculate GPU offset within vmwgfx driver itself without depending on
bo->offset

Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c         | 4 ++--
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c    | 2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c       | 2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c | 2 --
 4 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
index 8b71bf6b58ef..a714582bb61c 100644
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
index 73489a45decb..72c2cf4053df 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
@@ -3313,7 +3313,7 @@ static void vmw_apply_relocations(struct vmw_sw_context *sw_context)
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
index 3f3b2c7a208a..e7134aebeb81 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
@@ -750,7 +750,6 @@ static int vmw_init_mem_type(struct ttm_bo_device *bdev, uint32_t type,
 	case TTM_PL_VRAM:
 		/* "On-card" video ram */
 		man->func = &ttm_bo_manager_func;
-		man->gpu_offset = 0;
 		man->flags = TTM_MEMTYPE_FLAG_FIXED | TTM_MEMTYPE_FLAG_MAPPABLE;
 		man->available_caching = TTM_PL_FLAG_CACHED;
 		man->default_caching = TTM_PL_FLAG_CACHED;
@@ -763,7 +762,6 @@ static int vmw_init_mem_type(struct ttm_bo_device *bdev, uint32_t type,
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
