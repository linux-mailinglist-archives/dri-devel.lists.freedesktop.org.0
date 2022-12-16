Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7DA64F52A
	for <lists+dri-devel@lfdr.de>; Sat, 17 Dec 2022 00:34:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B933D10E641;
	Fri, 16 Dec 2022 23:33:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3AD110E641
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Dec 2022 23:33:54 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 u15-20020a17090a3fcf00b002191825cf02so3861253pjm.2
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Dec 2022 15:33:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=W/9xnFmVNF8HCZC2f7V1U4ifBu8+aTRtAP/p4VM2rg8=;
 b=K0b0h5pf0NqVxTezmemuH/EquW8gvl7w5uaBtTk+noyhROX3oQ9IpO9YFjIUrnKSLy
 v0XGQT0olmnQ0XeBhe1Ro8vMa3GWS5tu+DEvX//FwgsSnTtpiqua5GoPndg3ZoDWt+35
 Z/31iz25gyrOFNWwuDVyL4LOOch9q8jFL4hWFAeMOmAx5shEuVaiT1fdN7JyEdohs8xQ
 HXliGgpGNHj/WwchBy6fWEavCdM3c21rJuPNO6UB9N3CyZ6j0vWekKw7D/ADR7BL7fTP
 ZPvelc6Img0vFcE5f06q/BHiFOLRaBIdyg/YMrnYv0e+AtF6uoGKjilUZN0oB6FNIwl6
 Ajgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=W/9xnFmVNF8HCZC2f7V1U4ifBu8+aTRtAP/p4VM2rg8=;
 b=giUMhdTYxK8w9r1LD5nO53fUZXrVBJIS396huEkkL6rJRIXIGWfEtcC2b5G6UPHv2k
 tY7Xa6G9yU3uZMNGEZpMsRmzSVdzDsd4Dk1SX/jVM5F/zyCaCFCl/rIwbg2RNOonPCFY
 y3/W+WUcMBZR75BOfSUqaul2Mn72UjyutoWeZclXNIWrUlv1CIQ9Dko9sREgjmEIwLb4
 loFuBkDCuLSSSNv8ZvpyHtgAGk6T/RKk3ct4nD8sdW9hS6fFSeym5IFBFf+/tgOWotAz
 egTBI6WHoAacqthZrAXYdbqpaOpthdIxxzP9EOhRW3yDt3xX5CRARrWvZqAWK2ReiIC/
 pDHg==
X-Gm-Message-State: ANoB5pmly3J6/7N+qaTtqKLNVSz5qrqtCcQ79Qe7QEm4iRxPJEHTAG7G
 WLWgvEBRSSgWyjQlPL6CLvIKE6x1hRc=
X-Google-Smtp-Source: AA0mqf79fQvrWdpp4Pu80dMKCstST1/QOcQ0XulZCdbCaj6xEt6OEWe/t+TNt4tyVpMTa5hBJ22dNg==
X-Received: by 2002:a17:902:a711:b0:189:747e:97cc with SMTP id
 w17-20020a170902a71100b00189747e97ccmr32117026plq.26.1671233633052; 
 Fri, 16 Dec 2022 15:33:53 -0800 (PST)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 x9-20020a170902a38900b0018c7a5e052asm2137355pla.225.2022.12.16.15.33.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Dec 2022 15:33:52 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/panfrost: Fix GEM handle creation UAF
Date: Fri, 16 Dec 2022 15:33:54 -0800
Message-Id: <20221216233355.542197-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.38.1
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
Cc: Rob Clark <robdclark@chromium.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 open list <linux-kernel@vger.kernel.org>, Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Relying on an unreturned handle to hold a reference to an object we
dereference is not safe.  Userspace can guess the handle and race us
by closing the handle from another thread.  The _create_with_handle()
that returns an object ptr is pretty much a pattern to avoid.  And
ideally creating the handle would be done after any needed dererencing.
But in this case creation of the mapping is tied to the handle creation.
Fortunately the mapping is refcnt'd and holds a reference to the object,
so we can drop the handle's reference once we hold a mapping reference.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/panfrost/panfrost_drv.c |  7 +++++++
 drivers/gpu/drm/panfrost/panfrost_gem.c | 10 +++++++---
 2 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 2fa5afe21288..aa5848de647c 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -98,6 +98,13 @@ static int panfrost_ioctl_create_bo(struct drm_device *dev, void *data,
 		return PTR_ERR(bo);
 
 	mapping = panfrost_gem_mapping_get(bo, priv);
+
+	/*
+	 * Now that the mapping holds a reference to the bo until we no longer
+	 * need it, we can safely drop the handle's reference.
+	 */
+	drm_gem_object_put(&bo->base.base);
+
 	if (!mapping) {
 		drm_gem_object_put(&bo->base.base);
 		return -EINVAL;
diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/panfrost/panfrost_gem.c
index 293e799e2fe8..e3e21c500d24 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gem.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
@@ -234,6 +234,10 @@ struct drm_gem_object *panfrost_gem_create_object(struct drm_device *dev, size_t
 	return &obj->base.base;
 }
 
+/*
+ * NOTE: if this succeeds, both the handle and the returned object have
+ * an outstanding reference.
+ */
 struct panfrost_gem_object *
 panfrost_gem_create_with_handle(struct drm_file *file_priv,
 				struct drm_device *dev, size_t size,
@@ -261,10 +265,10 @@ panfrost_gem_create_with_handle(struct drm_file *file_priv,
 	 * and handle has the id what user can see.
 	 */
 	ret = drm_gem_handle_create(file_priv, &shmem->base, handle);
-	/* drop reference from allocate - handle holds it now. */
-	drm_gem_object_put(&shmem->base);
-	if (ret)
+	if (ret) {
+		drm_gem_object_put(&shmem->base);
 		return ERR_PTR(ret);
+	}
 
 	return bo;
 }
-- 
2.38.1

