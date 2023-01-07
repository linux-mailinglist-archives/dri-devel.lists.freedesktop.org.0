Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6707D661074
	for <lists+dri-devel@lfdr.de>; Sat,  7 Jan 2023 18:24:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B4D910E33F;
	Sat,  7 Jan 2023 17:23:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender-of-o50.zoho.in (sender-of-o50.zoho.in [103.117.158.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C83A810E334
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Jan 2023 17:23:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1673112190; cv=none; d=zohomail.in; s=zohoarc; 
 b=R1mrQ4F3Ue9uLmF3hdVCIJGqIdNH8yLqxX66hcHQOzS2jo9KAJtR8rJ8KxqdRm6/0y7B5tsyfpR4ijFC2DeQMxOE3rGVTVz1GDwwlOaeunm1/d8c4gMB2WH3LnNNahHtwlF/fbLRrvelnbcsWPUBOsMsJMKpdb1gn9zjid7m7Wo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1673112190;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=YAXTlBSpddAOoRl/rgdcXT/UmQnPneK4iAsjBbqHVFE=; 
 b=OnnVbJ5KJ+wIunl2sbKSWbrAGYCwROtMWP8kEGPrAfSzt0x4O/l7vNeAbVSXSVkM9q0HF0hEc7MqswXyOiYbAzXw85bN9NAW6Js44KjYQmqH66+rXJpTGKJVZXs0xxPXhvn9LG3OnKbKKhA6EUD/tf3Jlei1LGOXS2kYO/PkXr4=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=code@siddh.me;
 dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1673112190; 
 s=zmail; d=siddh.me; i=code@siddh.me;
 h=From:From:To:To:Cc:Cc:Message-ID:Subject:Subject:Date:Date:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=YAXTlBSpddAOoRl/rgdcXT/UmQnPneK4iAsjBbqHVFE=;
 b=eFmF/hSfTGZhghmBExiaqdRIEOVPdMaYRmH5DEnHpjbwgxoRmq1fHZDTkX3Rmh8z
 Le8UbLTSaxcoiSm5dkOynm7sMe4BIGaywSWNeu37zagqc0TeSZnUSRwmZ++WdEmCL/n
 5uA2gxbJVJDXx0gwEw3Hyr/as9polEdQ7QuVD/BM=
Received: from kampyooter.. (110.226.31.37 [110.226.31.37]) by mx.zoho.in
 with SMTPS id 1673112189539240.16651329667513;
 Sat, 7 Jan 2023 22:53:09 +0530 (IST)
From: Siddh Raman Pant <code@siddh.me>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Simon Ser <contact@emersion.fr>,
 Jim Cromie <jim.cromie@gmail.com>
Message-ID: <775e3800eed1f62df950063dc623037ca3840828.1673110890.git.code@siddh.me>
Subject: [PATCH v5 08/10] drm: Remove usage of deprecated DRM_DEBUG_PRIME
Date: Sat,  7 Jan 2023 22:52:28 +0530
X-Mailer: git-send-email 2.39.0
In-Reply-To: <cover.1673110890.git.code@siddh.me>
References: <cover.1673110890.git.code@siddh.me>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External
Content-Type: text/plain; charset=utf8
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
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_print.h says DRM_DEBUG_PRIME is deprecated in favor of
drm_dbg_prime().

Signed-off-by: Siddh Raman Pant <code@siddh.me>
Reviewed-by: Simon Ser <contact@emersion.fr>
---
 drivers/gpu/drm/drm_gem_dma_helper.c   | 4 ++--
 drivers/gpu/drm/drm_gem_shmem_helper.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_dma_helper.c b/drivers/gpu/drm/drm_gem=
_dma_helper.c
index 1ba551b0ab97..0f903cc8914a 100644
--- a/drivers/gpu/drm/drm_gem_dma_helper.c
+++ b/drivers/gpu/drm/drm_gem_dma_helper.c
@@ -477,8 +477,8 @@ drm_gem_dma_prime_import_sg_table(struct drm_device *de=
v,
 =09dma_obj->dma_addr =3D sg_dma_address(sgt->sgl);
 =09dma_obj->sgt =3D sgt;
=20
-=09DRM_DEBUG_PRIME("dma_addr =3D %pad, size =3D %zu\n", &dma_obj->dma_addr=
,
-=09=09=09attach->dmabuf->size);
+=09drm_dbg_prime(dev, "dma_addr =3D %pad, size =3D %zu\n", &dma_obj->dma_a=
ddr,
+=09=09      attach->dmabuf->size);
=20
 =09return &dma_obj->base;
 }
diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_g=
em_shmem_helper.c
index e99426b5be93..c8780b72e4e8 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -760,7 +760,7 @@ drm_gem_shmem_prime_import_sg_table(struct drm_device *=
dev,
=20
 =09shmem->sgt =3D sgt;
=20
-=09DRM_DEBUG_PRIME("size =3D %zu\n", size);
+=09drm_dbg_prime(dev, "size =3D %zu\n", size);
=20
 =09return &shmem->base;
 }
--=20
2.39.0


