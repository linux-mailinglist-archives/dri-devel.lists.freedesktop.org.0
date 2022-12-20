Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C54C0652DE2
	for <lists+dri-devel@lfdr.de>; Wed, 21 Dec 2022 09:29:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9149C10E423;
	Wed, 21 Dec 2022 08:29:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender-of-o50.zoho.in (sender-of-o50.zoho.in [103.117.158.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89F7410E3E4
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 20:17:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1671567424; cv=none; d=zohomail.in; s=zohoarc; 
 b=VA18Qyj1+hTXmsUNGkVJt/4v1h0usPLxFjEHLUmMUlrbsrfs3ZzzUzeml7cmE2VFjSeCAdgchHQuddFyFG8CzfSJTShR5lWQyuh24fmae/gyAR6F5WP44ITSnt39X2PT2R1hDr7Na0zYffwbTCallHBOJioDm+OyQspe+i7z6FM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1671567424;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=1MCKPJOG9ImRBJLySDbjsiaY3Ui5PpMZ+NWkNcMBJcc=; 
 b=Rl+nkLCvfyrKasYYY1kRXD9UKdNXFdVYLMFtLnBdwMjrJppyHvVh0j4tK7lQsc/wP7knqTzqQDnuRIalcFNEcG5wV12f52oL+YZuf224n2lzk/bp5n9cstoYGxpdfq6ebQ6h7NZDgAynVl4kplbHov0mBGaoYki/T5XERSP/k2I=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=code@siddh.me;
 dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1671567424; 
 s=zmail; d=siddh.me; i=code@siddh.me;
 h=From:From:To:To:Cc:Cc:Message-ID:Subject:Subject:Date:Date:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=1MCKPJOG9ImRBJLySDbjsiaY3Ui5PpMZ+NWkNcMBJcc=;
 b=MmzjsOjAZ4B1e5lYB27BAXIUJhLZ5717E7j8/Kbex69gSuKur+GhAFAyu2h1Ok5H
 jxsqaKK/eS9NQlGgfiXQQSDbcxSHiBvn5hZ6AZ6wcBKJ5mpMvGnwctTKZHsjOEiw+Hx
 L3NPpPEgX0mNz0sbvWHRFefLnYXXXuwKhn5RRyNQ=
Received: from kampyooter.. (110.226.31.37 [110.226.31.37]) by mx.zoho.in
 with SMTPS id 167156742434744.86757288551098;
 Wed, 21 Dec 2022 01:47:04 +0530 (IST)
From: Siddh Raman Pant <code@siddh.me>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Message-ID: <ff1282e6787f2b23fcffa253176420afc6b6d315.1671566741.git.code@siddh.me>
Subject: [PATCH 08/10] drm: Remove usage of deprecated DRM_DEBUG_PRIME
Date: Wed, 21 Dec 2022 01:46:43 +0530
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1671566741.git.code@siddh.me>
References: <cover.1671566741.git.code@siddh.me>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External
Content-Type: text/plain; charset=utf8
X-Mailman-Approved-At: Wed, 21 Dec 2022 08:29:21 +0000
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
index f0b6b69f4baf..1b9a6b357d8a 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -764,7 +764,7 @@ drm_gem_shmem_prime_import_sg_table(struct drm_device *=
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
2.35.1


