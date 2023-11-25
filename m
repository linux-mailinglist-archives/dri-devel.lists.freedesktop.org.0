Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B647F8F4B
	for <lists+dri-devel@lfdr.de>; Sat, 25 Nov 2023 21:55:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6762610E046;
	Sat, 25 Nov 2023 20:55:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 258AB10E046
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Nov 2023 20:55:42 +0000 (UTC)
Received: from sobremesa.fritz.box (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: alarumbe)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 32E106602F30;
 Sat, 25 Nov 2023 20:55:40 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1700945740;
 bh=UCnojBz357ehFcHJCdupwHygUfwmTRP1P4SkpuCnJmY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SBuySs8gmpXp1f5nRNwaMV9TqS56Xb9Ss5nuXB9Mooj9F/tlXqBYWyPMXXwxNhJwz
 wLAxH/nw+MhDUi4yHBnw5QlKpmYquscX1iirdz6UFZgVJDmv2eS6wSTrD+7hIEaB88
 pzRjyf7GY6JKc1ugLE1hxSYklw5fyJLXD+5g4Lsze8a5T6orkdJJQcun3SRAYEV+g0
 2rAtRih/5RUys73ZVedlZ0haETz+V3cGctiR6l2+VbpR5SNeGS40dYmo/iN3r1L91K
 ClHtipM5mnkCWfsv0jN+cgzFs2assJT+W64XiYlYOuM3EXQNn4xCKr5i6cnabMjtU2
 GfgaVOuvmiChQ==
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 1/2] drm/panfrost: Consider dma-buf imported objects as
 resident
Date: Sat, 25 Nov 2023 20:52:02 +0000
Message-ID: <20231125205438.375407-2-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231125205438.375407-1-adrian.larumbe@collabora.com>
References: <20231125205438.375407-1-adrian.larumbe@collabora.com>
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
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A GEM object constructed from a dma-buf imported sgtable should be regarded
as being memory resident, because the dma-buf API mandates backing storage
to be allocated when attachment succeeds.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
Fixes: 9ccdac7aa822 ("drm/panfrost: Add fdinfo support for memory stats")
Reported-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_gem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/panfrost/panfrost_gem.c
index 0cf64456e29a..d47b40b82b0b 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gem.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
@@ -200,7 +200,7 @@ static enum drm_gem_object_status panfrost_gem_status(struct drm_gem_object *obj
 	struct panfrost_gem_object *bo = to_panfrost_bo(obj);
 	enum drm_gem_object_status res = 0;
 
-	if (bo->base.pages)
+	if (bo->base.base.import_attach || bo->base.pages)
 		res |= DRM_GEM_OBJECT_RESIDENT;
 
 	if (bo->base.madv == PANFROST_MADV_DONTNEED)
-- 
2.42.0

