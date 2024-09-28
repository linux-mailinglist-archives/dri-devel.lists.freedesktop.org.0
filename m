Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2CDD988F36
	for <lists+dri-devel@lfdr.de>; Sat, 28 Sep 2024 14:38:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B322010E17F;
	Sat, 28 Sep 2024 12:38:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="IT02zXoz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E49710E02A
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Sep 2024 02:40:37 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-2055a3f80a4so18425645ad.2
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2024 19:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1727491237; x=1728096037;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LnTsq4VEfa3DVUeX5+2WsJ45Yn/L9lDZxQSrrKE2Knw=;
 b=IT02zXozJnLysdeFxNsfQH/tEnfL0luq9gaLgRffqAN1p2hojIZlCvohWTQCTnl3fm
 o13MBZ/ATRSlClHkUaQ6+/AQoOuA7lKVW6EnZY7fVifk+W8A3K5FdUTRDoUPlUSb8lUD
 tpnFTZmJNbe6LpoD2A5C9kF+/pIP4/XHbIUBM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727491237; x=1728096037;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LnTsq4VEfa3DVUeX5+2WsJ45Yn/L9lDZxQSrrKE2Knw=;
 b=KSq2TgFyr/c+arC5rhbl09ponfGIN38YAppx/wK07KQnnToCP8knzaXGpl8bf/wAdt
 BSA3mxTnrwY/fM0htzuCMUv6coXAZ6EYOL8I7tp0cAKOik0KsJQl8Bd1HPhTOFy19tp7
 ljByJVOKw6Gs5IGJxURlsOdcG8z78UB92yhnoo1JPWaxIKZKkWY/FbBPWL+e/8iIT3JJ
 A1KdhJw/hd+IYwXKxHuzpa9VwkKDo0JEdnvV+Ns/4CSs4y0iPH78AsFSPMQRpEOzMvjT
 gVai42HwX7BClFOXc7jMX6dRpnqjNbeNnF48K63+/dDoqNoZARHK41pB28qjKVKPgtzt
 eRlg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXY7uBPcWFM/8hS1sIXJXjzznYu65Js1GFc8hwrP78FyzoMZLkSvD7WR4NvOEKQMB/u2KR+fbl29Go=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yztgs8AwleIUNNheZm3+088zrBHWBzlDtbafqLmI0fqccCefh+o
 NvrTgk7P2OB5mfJaw09x9lTcKBJVrv6tZnt0NWJk4IZxJhH+/qlnDYg/p9zIKA==
X-Google-Smtp-Source: AGHT+IGMtSlIL5dzrEwafO9gPcWiqC1NF4q8PhLQ4Zacu1bMXW87bbHAECMzRgIokClUg8/fjODRog==
X-Received: by 2002:a17:902:e884:b0:201:efe7:cafc with SMTP id
 d9443c01a7336-20b36ad291emr91904655ad.23.1727491236778; 
 Fri, 27 Sep 2024 19:40:36 -0700 (PDT)
Received: from shivania.eng.vmware.com ([66.170.99.1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-20b37e50c2esm19434185ad.235.2024.09.27.19.40.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Sep 2024 19:40:36 -0700 (PDT)
From: Shivani Agarwal <shivani.agarwal@broadcom.com>
To: stable@vger.kernel.org,
	gregkh@linuxfoundation.org
Cc: zack.rusin@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.c, krastevm@vmware.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 ajay.kaher@broadcom.com, alexey.makhalov@broadcom.com,
 vasavi.sirnapalli@broadcom.com,
 Martin Krastev <martin.krastev@broadcom.com>,
 Maaz Mombasawala <maaz.mombasawala@broadcom.com>,
 Shivani Agarwal <shivani.agarwal@broadcom.com>
Subject: [PATCH v6.1] drm/vmwgfx: Prevent unmapping active read buffers
Date: Fri, 27 Sep 2024 19:40:27 -0700
Message-Id: <20240928024027.154907-1-shivani.agarwal@broadcom.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 28 Sep 2024 12:38:53 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Zack Rusin <zack.rusin@broadcom.com>

commit aba07b9a0587f50e5d3346eaa19019cf3f86c0ea upstream.

The kms paths keep a persistent map active to read and compare the cursor
buffer. These maps can race with each other in simple scenario where:
a) buffer "a" mapped for update
b) buffer "a" mapped for compare
c) do the compare
d) unmap "a" for compare
e) update the cursor
f) unmap "a" for update
At step "e" the buffer has been unmapped and the read contents is bogus.

Prevent unmapping of active read buffers by simply keeping a count of
how many paths have currently active maps and unmap only when the count
reaches 0.

Fixes: 485d98d472d5 ("drm/vmwgfx: Add support for CursorMob and CursorBypass 4")
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: dri-devel@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v5.19+
Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20240816183332.31961-2-zack.rusin@broadcom.com
Reviewed-by: Martin Krastev <martin.krastev@broadcom.com>
Reviewed-by: Maaz Mombasawala <maaz.mombasawala@broadcom.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
[Shivani: Modified to apply on v6.1.y]
Signed-off-by: Shivani Agarwal <shivani.agarwal@broadcom.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c  | 12 +++++++++++-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h |  3 +++
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
index c46f380d9149..733b0013eda1 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
@@ -348,6 +348,8 @@ void *vmw_bo_map_and_cache(struct vmw_buffer_object *vbo)
 	void *virtual;
 	int ret;
 
+	atomic_inc(&vbo->map_count);
+
 	virtual = ttm_kmap_obj_virtual(&vbo->map, &not_used);
 	if (virtual)
 		return virtual;
@@ -370,10 +372,17 @@ void *vmw_bo_map_and_cache(struct vmw_buffer_object *vbo)
  */
 void vmw_bo_unmap(struct vmw_buffer_object *vbo)
 {
+	int map_count;
+
 	if (vbo->map.bo == NULL)
 		return;
 
-	ttm_bo_kunmap(&vbo->map);
+	map_count = atomic_dec_return(&vbo->map_count);
+
+	if (!map_count) {
+		ttm_bo_kunmap(&vbo->map);
+		vbo->map.bo = NULL;
+	}
 }
 
 
@@ -510,6 +519,7 @@ int vmw_bo_init(struct vmw_private *dev_priv,
 	BUILD_BUG_ON(TTM_MAX_BO_PRIORITY <= 3);
 	vmw_bo->base.priority = 3;
 	vmw_bo->res_tree = RB_ROOT;
+	atomic_set(&vmw_bo->map_count, 0);
 
 	size = ALIGN(size, PAGE_SIZE);
 	drm_gem_private_object_init(vdev, &vmw_bo->base.base, size);
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
index b0c23559511a..bca10214e0bf 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
@@ -116,6 +116,8 @@ struct vmwgfx_hash_item {
  * @base: The TTM buffer object
  * @res_tree: RB tree of resources using this buffer object as a backing MOB
  * @base_mapped_count: ttm BO mapping count; used by KMS atomic helpers.
+ * @map_count: The number of currently active maps. Will differ from the
+ * cpu_writers because it includes kernel maps.
  * @cpu_writers: Number of synccpu write grabs. Protected by reservation when
  * increased. May be decreased without reservation.
  * @dx_query_ctx: DX context if this buffer object is used as a DX query MOB
@@ -129,6 +131,7 @@ struct vmw_buffer_object {
 	/* For KMS atomic helpers: ttm bo mapping count */
 	atomic_t base_mapped_count;
 
+	atomic_t map_count;
 	atomic_t cpu_writers;
 	/* Not ref-counted.  Protected by binding_mutex */
 	struct vmw_resource *dx_query_ctx;
-- 
2.39.4

