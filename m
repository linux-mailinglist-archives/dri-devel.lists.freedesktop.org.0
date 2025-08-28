Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88AC8B3AB35
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 22:01:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5D3010E02A;
	Thu, 28 Aug 2025 20:01:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UeihXpyQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3124010E02A
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 20:01:27 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-76e4fc419a9so1466549b3a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 13:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756411286; x=1757016086; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=DoX+D3KaxG6mhPRJt1jiYUNQEj7P2IZ5gRQ1rTq/NJ4=;
 b=UeihXpyQwnvys62s5mOWd43FlUL65R59UJJV9UwaNidQJLGQv8jq9QjS1F0voXbqnl
 /9PNng4CAbyHk9gymGml/5OTcsc/0HCdzuEnITSaPsRXLZid0agvZdSDWVUstb7aUc+t
 qizLyPxH1vP3kzLyz45L3A5IObVPC6tGJZtmPJu6lQDBT89svb2NumLm39zrDxfESVvI
 gWF12XPqfhfM5AmwKqlQamNv1/8C/98R/Yjk/F+sV0npPbbVWp4rFfODXY8nneRlrUA3
 iwADXBHGSJIYBA291NqS54PvE3UnoBJnyvzwYa/uigYTzO+pe/CN+7I8j5+zESzLs69q
 7CzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756411286; x=1757016086;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DoX+D3KaxG6mhPRJt1jiYUNQEj7P2IZ5gRQ1rTq/NJ4=;
 b=uXbpiOSArppYX4lZml7OPpX96Lvi1JvTvLbrvPEUyTfsyh0ipImi3FcJfYP34t6+J7
 VvkZDLwHwwmZHnPL2fCnTEMp3fIigfG9QGhfqYbf7nzoiX3t27Um2Kv3EJtND/xbVIK1
 rJgJb9qLcEIPfJVcbFC0kuvZpA3s7qkxsjtpFgV8NrqpclYJ3iGW1c+p1jIyfb0IVT+5
 94ev83oC+flaeMyIV6nJjIxpzT1wItRY5Fo35JsSj4OV02ExsV9SYVCQDanxdTtHGrAE
 Tk3T7wsz5Ttt6QB8ONgajHgSCkXRFXYkA5JmWg+e/SONuZpRXxoau5Mm7G0KCKg9zD2R
 mdvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/JYh4FspQOQRH0811rDVHZF1uNAqHAWiHUpcFTMam8Dk8kF/Y50WAnS+kT5mqPBPKJ2Z5mVmy+TQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzoaimthLHaQjXWeXlpjzT1gUU2JYbYwbaKB4tmCZqS7+rXF0Jo
 /VMm0kND5hKTyhJCOakY/xRecCs+WwLgCLf3y1Ymf8mjKfmt7ibpToQT
X-Gm-Gg: ASbGncvzBuevXw8gg9Kl4QTnqCdEW45o3hj3fp4bv/0Q5rGTu+O/b0vozhl35bi+LsO
 1XPKPVk2fWkCfQxzWWD0dIz9W62neEL43ucUKnwg4r4daDja+Gz01VprRZn6OADipwKF3uCuvE2
 nwf/RfzocrkJDWj07i+Z8Q2IdzoK5aOXVCfUliiiKL3W4JwgSEDpHrQBtftXb325RTfMQnpvu7v
 bhAr/1dS7TNWeb/nY43Ng58b4BYGjsqAk3D1XgiMnzIWVrqlWSrRaUUlTVLo3eeaQSdwcVpQJ2N
 fGzPa9phhM1+OQJHv0Z7etbV37GiKfyhBV3JXJnImzozuW0CmUJQHaDz00nYPmUay6T2TzVX0N3
 bJEQ18INsf/MZRnBrNUvNNfR5Ypw1CPUbd+kxHCXMg73bieWEVfxYHw==
X-Google-Smtp-Source: AGHT+IG3iIFJQWz+lf0lUAPD1+rtke3zrgqOtQQFIlzOWjMf2Xm3ZfvP61CcKTGB/JPPwSX1rFi7+g==
X-Received: by 2002:a05:6a20:7290:b0:23e:19fd:e18f with SMTP id
 adf61e73a8af0-24340daf747mr33344878637.35.1756411285859; 
 Thu, 28 Aug 2025 13:01:25 -0700 (PDT)
Received: from localhost (185.3.125.34.bc.googleusercontent.com.
 [34.125.3.185]) by smtp.gmail.com with UTF8SMTPSA id
 d2e1a72fcca58-7722a2af911sm279861b3a.23.2025.08.28.13.01.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Aug 2025 13:01:25 -0700 (PDT)
From: Chia-I Wu <olvaffe@gmail.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/panthor: check bo offset alignment in vm bind
Date: Thu, 28 Aug 2025 13:01:16 -0700
Message-ID: <20250828200116.3532255-1-olvaffe@gmail.com>
X-Mailer: git-send-email 2.51.0.318.gd7df087d1a-goog
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fail early from panthor_vm_bind_prepare_op_ctx instead of late from
ops->map_pages.

Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_mmu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index bad720f23eb70..6dec4354e3789 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -1222,7 +1222,7 @@ static int panthor_vm_prepare_map_op_ctx(struct panthor_vm_op_ctx *op_ctx,
 	    (flags & DRM_PANTHOR_VM_BIND_OP_TYPE_MASK) != DRM_PANTHOR_VM_BIND_OP_TYPE_MAP)
 		return -EINVAL;
 
-	/* Make sure the VA and size are aligned and in-bounds. */
+	/* Make sure the VA and size are in-bounds. */
 	if (size > bo->base.base.size || offset > bo->base.base.size - size)
 		return -EINVAL;
 
@@ -2447,7 +2447,7 @@ panthor_vm_bind_prepare_op_ctx(struct drm_file *file,
 	int ret;
 
 	/* Aligned on page size. */
-	if (!IS_ALIGNED(op->va | op->size, vm_pgsz))
+	if (!IS_ALIGNED(op->va | op->size | op->bo_offset, vm_pgsz))
 		return -EINVAL;
 
 	switch (op->flags & DRM_PANTHOR_VM_BIND_OP_TYPE_MASK) {
-- 
2.51.0.318.gd7df087d1a-goog

