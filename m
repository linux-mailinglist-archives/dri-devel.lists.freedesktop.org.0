Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CFED6014EC
	for <lists+dri-devel@lfdr.de>; Mon, 17 Oct 2022 19:25:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DE0910EDC2;
	Mon, 17 Oct 2022 17:24:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F231310E87B;
 Mon, 17 Oct 2022 17:24:32 +0000 (UTC)
Received: from dimapc.. (109-252-119-114.nat.spd-mgts.ru [109.252.119.114])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id C55A566022A5;
 Mon, 17 Oct 2022 18:24:27 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1666027471;
 bh=Ov9ZX8VHbwHToZzjcmjiNJ0jjSTvXmYhNQje1p3xR4A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JfSEiFZ0bP/1PLxM6GvHz8c2tanrpN/nrTAMtAjaS+tiBEO2rTyRl2yV6inEdPTYz
 filtgkfBWoHGG9we80879CphfgBgCm6DB6qPBvlIm4TSS8FvEMd0WD9UBv8W0TvnDQ
 hNW/CRs1u5OAOaZwr87WYLuVN5Fu+0f0pNNuOMnhWDIpJLkvwUTudI5SGs/HaJ5lm+
 16HXJckBVf+u/EzHvS+seAwvWtLZA6OdJfWF8dFR+cv7DuFoyrtn6QGbSyHhUSH0Nw
 lc7G1erOvRKc++n1Yv/355sd1xVVuLAdS2T77xsDQVAoImnQBJBhRtoOGTcX7SESkD
 K39eW7DM3pE5g==
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gert Wollny <gert.wollny@collabora.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Daniel Stone <daniel@fooishbar.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Clark <robdclark@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Tomasz Figa <tfiga@chromium.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas_os@shipmail.org>,
 Qiang Yu <yuq825@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Amol Maheshwari <amahesh@qti.qualcomm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Leon Romanovsky <leon@kernel.org>, Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Tomi Valkeinen <tomba@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Lucas Stach <l.stach@pengutronix.de>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Ruhl Michael J <michael.j.ruhl@intel.com>
Subject: [PATCH v7 05/21] drm/armada: Prepare to dynamic dma-buf locking
 specification
Date: Mon, 17 Oct 2022 20:22:13 +0300
Message-Id: <20221017172229.42269-6-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221017172229.42269-1-dmitry.osipenko@collabora.com>
References: <20221017172229.42269-1-dmitry.osipenko@collabora.com>
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
Cc: linux-rdma@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 Dmitry Osipenko <digetx@gmail.com>, kernel@collabora.com,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Prepare Armada driver to the common dynamic dma-buf locking convention
by starting to use the unlocked versions of dma-buf API functions.

Acked-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/armada/armada_gem.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/armada/armada_gem.c b/drivers/gpu/drm/armada/armada_gem.c
index 5430265ad458..26d10065d534 100644
--- a/drivers/gpu/drm/armada/armada_gem.c
+++ b/drivers/gpu/drm/armada/armada_gem.c
@@ -66,8 +66,8 @@ void armada_gem_free_object(struct drm_gem_object *obj)
 	if (dobj->obj.import_attach) {
 		/* We only ever display imported data */
 		if (dobj->sgt)
-			dma_buf_unmap_attachment(dobj->obj.import_attach,
-						 dobj->sgt, DMA_TO_DEVICE);
+			dma_buf_unmap_attachment_unlocked(dobj->obj.import_attach,
+							  dobj->sgt, DMA_TO_DEVICE);
 		drm_prime_gem_destroy(&dobj->obj, NULL);
 	}
 
@@ -539,8 +539,8 @@ int armada_gem_map_import(struct armada_gem_object *dobj)
 {
 	int ret;
 
-	dobj->sgt = dma_buf_map_attachment(dobj->obj.import_attach,
-					   DMA_TO_DEVICE);
+	dobj->sgt = dma_buf_map_attachment_unlocked(dobj->obj.import_attach,
+						    DMA_TO_DEVICE);
 	if (IS_ERR(dobj->sgt)) {
 		ret = PTR_ERR(dobj->sgt);
 		dobj->sgt = NULL;
-- 
2.37.3

