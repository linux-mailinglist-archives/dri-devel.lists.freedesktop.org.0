Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D0469F89D
	for <lists+dri-devel@lfdr.de>; Wed, 22 Feb 2023 17:06:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEA4C10E10D;
	Wed, 22 Feb 2023 16:06:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DA4510E10D
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Feb 2023 16:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NSW16hsq60Yks92NWJu7M+UAPLB9fRTrFGr3d8deLn4=; b=kHbGOtFY/m5d4SCpsnHDsgt1Rn
 3zgWYlnC5Dg0VOrbuNKza8kjD8QkMFFDKtERTJLUiCY7zt1Vk09kDe9wJgLFQ2e7rNinEBq99Lagy
 EMUSiFGgQg49OTT0UaAhEzCmCd/vsd17nYJebtJ132VnEsuewylQtECqG5tpm0VRT5CoJ/tjY0h1n
 7BVyAobtZr0zY7ysKTYxDB7jZYv4J2Ra9gws1unwz+bccIXqbq0mrIrIbwocXgUygXJjH3FmoFSDw
 H46mNiNutjddDhEbAOILzx4ywlzJzsMFSLTE/Dasxwg8w08xRTeulo8hZ2q2nR/4saYkOvSYP3yNB
 6LaS52Lw==;
Received: from [187.36.234.139] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pUrdd-00Awxt-Fx; Wed, 22 Feb 2023 17:06:38 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Melissa Wen <mwen@igalia.com>
Subject: [PATCH] drm/vgem: Drop struct drm_vgem_gem_object
Date: Wed, 22 Feb 2023 13:06:17 -0300
Message-Id: <20230222160617.171429-1-mcanal@igalia.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit 45d9c8dde4cd ("drm/vgem: use shmem helpers") introduced shmem
helpers to vgem and with that, removed all uses of the struct
drm_vgem_gem_object. So, as the struct is no longer used, delete it.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/vgem/vgem_drv.h | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/gpu/drm/vgem/vgem_drv.h b/drivers/gpu/drm/vgem/vgem_drv.h
index 0ed300317f87..34cf63e6fb3d 100644
--- a/drivers/gpu/drm/vgem/vgem_drv.h
+++ b/drivers/gpu/drm/vgem/vgem_drv.h
@@ -39,17 +39,6 @@ struct vgem_file {
 	struct mutex fence_mutex;
 };
 
-#define to_vgem_bo(x) container_of(x, struct drm_vgem_gem_object, base)
-struct drm_vgem_gem_object {
-	struct drm_gem_object base;
-
-	struct page **pages;
-	unsigned int pages_pin_count;
-	struct mutex pages_lock;
-
-	struct sg_table *table;
-};
-
 int vgem_fence_open(struct vgem_file *file);
 int vgem_fence_attach_ioctl(struct drm_device *dev,
 			    void *data,
-- 
2.39.2

