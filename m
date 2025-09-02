Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E0C2B40CE3
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 20:10:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C141310E817;
	Tue,  2 Sep 2025 18:10:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="S5O4Ohyk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1455810E812
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 18:10:26 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id
 d2e1a72fcca58-7722bcb989aso3166600b3a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 11:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756836625; x=1757441425; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=1TH0A07StqxqCETJBwzgyuGcbJt6lyB5z/jM8qgdsuU=;
 b=S5O4OhykjbAE5l4au2OJMs6gmUCnCrQ2Xk8Rcjzj/yB7xofiYQbaxTOlB47oXMcreI
 FyTm4zKAbo/RWNqwtUCZuMQkvJ1GhAz7u/pZSj2QA+zXOdg7kpnTx3VPTVv6E+djeY/a
 FbHkq1IC2K5tZpQuU9o8kraKet6UPs1w/qFeTlfPpmXq7nzA+v5TG5t/HuetfOBM14Jp
 sl0IotpKp1aW9UXM911rL0XWETE5fcN6FOY6+/I3UU4JnYkRhuGQJ8RHYEntLgpmxOap
 1b48YaPAuEqdJd28W3UpRQ+T6KeoyUoV4MjyoVfsKVzO9l3UvXsLzyA0NLybdf+Am5T7
 xqCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756836625; x=1757441425;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1TH0A07StqxqCETJBwzgyuGcbJt6lyB5z/jM8qgdsuU=;
 b=EaZr2z3nsLdS13VqK5E+Qii5fjBtDohAmiHAA4AdeUYCHQ9os4OfNs4YdFBtmQokYf
 BmjUqlZ+tzLmgTBp+tVFdR7KIj4jA8sswgRJ2hqxI6Ga12QtcrQ8xU0zyY50cx+SO93G
 B8mPNhinlX9kthiplL2dt7E2qla5TNxvYZqf1hYBErt/ilXihp2NwjBViijXtCcKz6F1
 sTs6OkZjbCJY7eqz0QjOQhax7K0aWK7QrUNo+dDv/dvpWRq6xI6mx77dHuNK9aenPJzT
 sGTxNBHZDXLUjJX0DUJACr2zsYvjauALLI1IMgp1W1PjSHLT0OJi1y5lvgu/yQKeSNal
 tChA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVbIXTGLIHh3VQLozB2QEkSMDu3WyyYxNae5cS5Jyev8X5UPPi1XR6lLut4AsNQO9gnw8FE9D5fhHQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxIRJX3dLQdGOS1pD/JQR+AFvHKNHMk2h2AMuaoFAYIleYJtnbx
 0MnAUph6an6zmRgwQY023liezxA5kIsqvOoP2t+QLbLJmIDR8QBN/7nl
X-Gm-Gg: ASbGncvqtIZahM5qi8ORPJuFaFKnp6z/Wp3F6vPI/mi20h8fdOTReHed9PtwGglFLGG
 r/wd1xnjzXKxKed1+KJBm1+Z0sIB/OS/7Be/SVg+8dl5DbzKeF6Vp5fOxyaTDlIBUXiVtUD7OMG
 sD37IIsc9+Qmz4YqiRTjaC3HuIbcmWUEYsrZaebp8GFM80rBl5p3D9+xeNDkVx/ZTbxaTfL3OUS
 mA/VnOiJZ8iE2EXjk463jgotjU+hwcwqnaXaEAbu5EoZ8OdY+DashEy1hdT6ivGZuPTZicBCZqx
 0MA03fHfwJWekUanWXNCGy/QO098NkdX+g01EcN35Bn/HWiXY+rAHwvd234woCJ5jsERVltsyj+
 QnKJ6Ri6eacWUVa28cg==
X-Google-Smtp-Source: AGHT+IGFHCri7WeJln98XxJPVPtUkEe7QIgxGiwCcpWDJ+7ZO0ZQMfaPJ4nVVMR14D8qz0BRhvzB1g==
X-Received: by 2002:a05:6a00:2e04:b0:772:5b16:1081 with SMTP id
 d2e1a72fcca58-7725b161490mr8303874b3a.28.1756836625470; 
 Tue, 02 Sep 2025 11:10:25 -0700 (PDT)
Received: from Terra ([2001:df0:b240:6cbd:e842:2f6a:96d:9188])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7722a2b362dsm14334484b3a.32.2025.09.02.11.10.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Sep 2025 11:10:25 -0700 (PDT)
Date: Tue, 2 Sep 2025 23:40:20 +0530
From: Athul Raj Kollareth <krathul3152@gmail.com>
To: michal.wajdeczko@intel.com, tzimmermann@suse.de
Cc: skhan@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org,
 simona@ffwll.ch, mripard@kernel.org
Subject: [PATCH v5] drm: Replace the deprecated DRM_* logging macros in gem
 helper files
Message-ID: <aLczDHV_yGnnRKbr@Terra>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a5cc1e0-ea0a-4d7f-8834-20a371346d79@intel.com>
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

Replace the DRM_* logging macros used in gem helper files with the
appropriate ones specified in /include/drm/drm_print.h.

Signed-off-by: Athul Raj Kollareth <krathul3152@gmail.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
Changes in v5:
    - Minor style fix.

Changes in v4:
    - Some codestyle corrections.
    - Remove OOM error logging in drm_gem_init().

Changes in v3:
    - Revert all changes to drm_gem_objects_lookup().
    - Use drm_device from minor.

Changes in v2:
    - Change drm_gem_objects_lookup() to take a drm_device* argument.
    - Make appropriate changes to all calls of drm_gem_objects_lookup().
---
 drivers/gpu/drm/drm_gem.c            | 16 ++++++++--------
 drivers/gpu/drm/drm_gem_dma_helper.c |  2 +-
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 4a89b6acb6af..fb12cc2051d8 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -101,10 +101,8 @@ drm_gem_init(struct drm_device *dev)
 
 	vma_offset_manager = drmm_kzalloc(dev, sizeof(*vma_offset_manager),
 					  GFP_KERNEL);
-	if (!vma_offset_manager) {
-		DRM_ERROR("out of memory\n");
+	if (!vma_offset_manager)
 		return -ENOMEM;
-	}
 
 	dev->vma_offset_manager = vma_offset_manager;
 	drm_vma_offset_manager_init(vma_offset_manager,
@@ -783,9 +781,10 @@ static int objects_lookup(struct drm_file *filp, u32 *handle, int count,
 int drm_gem_objects_lookup(struct drm_file *filp, void __user *bo_handles,
 			   int count, struct drm_gem_object ***objs_out)
 {
-	int ret;
-	u32 *handles;
+	struct drm_device *dev = filp->minor->dev;
 	struct drm_gem_object **objs;
+	u32 *handles;
+	int ret;
 
 	if (!count)
 		return 0;
@@ -805,7 +804,7 @@ int drm_gem_objects_lookup(struct drm_file *filp, void __user *bo_handles,
 
 	if (copy_from_user(handles, bo_handles, count * sizeof(u32))) {
 		ret = -EFAULT;
-		DRM_DEBUG("Failed to copy in GEM handles\n");
+		drm_dbg_core(dev, "Failed to copy in GEM handles\n");
 		goto out;
 	}
 
@@ -853,12 +852,13 @@ EXPORT_SYMBOL(drm_gem_object_lookup);
 long drm_gem_dma_resv_wait(struct drm_file *filep, u32 handle,
 				    bool wait_all, unsigned long timeout)
 {
-	long ret;
+	struct drm_device *dev = filep->minor->dev;
 	struct drm_gem_object *obj;
+	long ret;
 
 	obj = drm_gem_object_lookup(filep, handle);
 	if (!obj) {
-		DRM_DEBUG("Failed to look up GEM BO %d\n", handle);
+		drm_dbg_core(dev, "Failed to look up GEM BO %d\n", handle);
 		return -EINVAL;
 	}
 
diff --git a/drivers/gpu/drm/drm_gem_dma_helper.c b/drivers/gpu/drm/drm_gem_dma_helper.c
index 4f0320df858f..a507cf517015 100644
--- a/drivers/gpu/drm/drm_gem_dma_helper.c
+++ b/drivers/gpu/drm/drm_gem_dma_helper.c
@@ -582,7 +582,7 @@ drm_gem_dma_prime_import_sg_table_vmap(struct drm_device *dev,
 
 	ret = dma_buf_vmap_unlocked(attach->dmabuf, &map);
 	if (ret) {
-		DRM_ERROR("Failed to vmap PRIME buffer\n");
+		drm_err(dev, "Failed to vmap PRIME buffer\n");
 		return ERR_PTR(ret);
 	}
 
-- 
2.51.0

