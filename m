Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF0B209A88
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jun 2020 09:31:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C99FC6E459;
	Thu, 25 Jun 2020 07:31:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B6E36E3CE
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 18:25:34 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id h5so3242717wrc.7
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 11:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7WaodMYBOyVGbdVeGEt7SMsusQ8yb/eu7Pd7OTP18Lc=;
 b=Y+nhEkClZCDMJGWiTQLNRrjj3ydytjEaZNFG8ucfmGpY5xfR0RUHhFcVSIgcwXzLTw
 gMGHXjsihu925fiXAaVrJkpL9ZuG7mocRrQuXX5sZYfgpCZJY1LP4XrXO1Cl6YTQVaeT
 6Zac+gaGELzkeRZmlwKcfMXn2BqDLFw+GyMsfWvgac1Az5ePl7kNUrkf1v7GHm4O9Qf9
 PkbGKqZqnhIn2RW2Nz0e4tqBXvS9Ad6QCMggYTzeXP35dceM9vtYcmbBfsSgDg2gB2Ge
 aINk46A8eMZWmvFJHSqDp+YWNMJGTtNrSLZ9RqkZHuG4mX7Lw53ptBBZj+k5h9JSAct3
 NIUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7WaodMYBOyVGbdVeGEt7SMsusQ8yb/eu7Pd7OTP18Lc=;
 b=k/vp71dPPwSFj6dIB3dYzNJsS0ew0wbT8pj65iARYQZfNgb/PlUupjD6Ex9oRS8NEb
 u38VGSnoC5wFMDzQO5d1wfD1xRD3/Tbe8uM7NE+axIGLynAMnpuYh/X/QpLTRIXg9NRs
 cVbmPsKyKTtxswH1IF+L7dmihEeqXQGFmSO6W4c+BHncUF/5jQT9ywBcPzImR3cYgIYS
 WKU3t2y3rYsie/dx4+/1hoODvCEPmVy3d7CFVpbVKaBvKYJSVNEYLK1LXtJci/kVldbk
 KnY+/GD+LzYahCpJo/9A0Nqe5Vjx/W54tkRnEyeUuyy/1viwSReuzvWarGNcEl14PZzm
 jFdg==
X-Gm-Message-State: AOAM532wlNYGKfzN0upuM+QBTllIJUNtICFr8rF1KXOVP3plzJUJAE40
 yXgySi/3Zmmk0W+hawwYB+AI9BntwsrE4svw
X-Google-Smtp-Source: ABdhPJwSqii72nJNtMDscNUPDneMSPxXPaKhVzwJk2LGBw5so/4tAFaQLP3HrEN5k1U2wbyPBvop0Q==
X-Received: by 2002:adf:db4d:: with SMTP id f13mr28596170wrj.336.1593023132737; 
 Wed, 24 Jun 2020 11:25:32 -0700 (PDT)
Received: from brihaspati.fritz.box (pd9567914.dip0.t-ipconnect.de.
 [217.86.121.20])
 by smtp.gmail.com with ESMTPSA id a22sm8734086wmb.4.2020.06.24.11.25.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2020 11:25:32 -0700 (PDT)
From: Nirmoy Das <nirmoy.aiemd@gmail.com>
X-Google-Original-From: Nirmoy Das <nirmoy.das@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/8] drm/vmwgfx: don't use ttm bo->offset
Date: Wed, 24 Jun 2020 20:26:43 +0200
Message-Id: <20200624182648.6976-4-nirmoy.das@amd.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200624182648.6976-1-nirmoy.das@amd.com>
References: <20200624182648.6976-1-nirmoy.das@amd.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 25 Jun 2020 07:31:01 +0000
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
Cc: sashal@kernel.org, thellstrom@vmware.com, airlied@linux.ie,
 kenny.ho@amd.com, brian.welty@intel.com, nirmoy.das@amd.com,
 linux-graphics-maintainer@vmware.com, bskeggs@redhat.com,
 alexander.deucher@amd.com, sean@poorly.run, christian.koenig@amd.com,
 kraxel@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Calculate GPU offset within vmwgfx driver itself without depending on
bo->offset.

Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c         | 4 ++--
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c    | 2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c       | 2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c | 2 --
 4 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
index 8b71bf6b58ef..1e59c019affa 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
@@ -258,7 +258,7 @@ int vmw_bo_pin_in_start_of_vram(struct vmw_private *dev_priv,
 		ret = ttm_bo_validate(bo, &placement, &ctx);

 	/* For some reason we didn't end up at the start of vram */
-	WARN_ON(ret == 0 && bo->offset != 0);
+	WARN_ON(ret == 0 && bo->mem.start != 0);
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
index 367d5b87ee6a..4284c4bd444d 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
@@ -3696,7 +3696,7 @@ static void vmw_apply_relocations(struct vmw_sw_context *sw_context)
 		bo = &reloc->vbo->base;
 		switch (bo->mem.mem_type) {
 		case TTM_PL_VRAM:
-			reloc->location->offset += bo->offset;
+			reloc->location->offset += bo->mem.start << PAGE_SHIFT;
 			reloc->location->gmrId = SVGA_GMR_FRAMEBUFFER;
 			break;
 		case VMW_PL_GMR:
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c b/drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c
index 6941689085ed..a95156fc5db7 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c
@@ -610,7 +610,7 @@ static int vmw_fifo_emit_dummy_legacy_query(struct vmw_private *dev_priv,

 	if (bo->mem.mem_type == TTM_PL_VRAM) {
 		cmd->body.guestResult.gmrId = SVGA_GMR_FRAMEBUFFER;
-		cmd->body.guestResult.offset = bo->offset;
+		cmd->body.guestResult.offset = bo->mem.start << PAGE_SHIFT;
 	} else {
 		cmd->body.guestResult.gmrId = bo->mem.start;
 		cmd->body.guestResult.offset = 0;
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
index bf0bc4697959..fbcd11a7b215 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
@@ -750,7 +750,6 @@ static int vmw_init_mem_type(struct ttm_bo_device *bdev, uint32_t type,
 	case TTM_PL_VRAM:
 		/* "On-card" video ram */
 		man->func = &vmw_thp_func;
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
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
