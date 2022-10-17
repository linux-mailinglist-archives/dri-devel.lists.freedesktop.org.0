Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43BF6601534
	for <lists+dri-devel@lfdr.de>; Mon, 17 Oct 2022 19:26:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24E2410EDE6;
	Mon, 17 Oct 2022 17:26:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2423C10EDCC;
 Mon, 17 Oct 2022 17:25:12 +0000 (UTC)
Received: from dimapc.. (109-252-119-114.nat.spd-mgts.ru [109.252.119.114])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id C65856602392;
 Mon, 17 Oct 2022 18:25:05 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1666027509;
 bh=66yORAV2VtaBLYK6ZDQXn3jm0axpgjq07+Vjv6hDHOM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Yt+6YpjTd2k6o0eDpmcJu0sF+A6aPsemDGwj+QbhYhf58HXdKN7jbBpJiMIOzHAtE
 iEB4EBKmJo//AkXrY6GUMzqXcMxPNvB/ZJ+Dq54XA4kIQ8IditSVC0L5DysL/LPG2m
 of9J1K7592sk2i74mum6W68hs2Lvp728HU8ExrePOOX094AYSkzSP84PDtmLJ2PFoR
 fHBBm1V5ziUb4ZEjvVIXxzdDNU58pBPedjcUi/k5dmVKu8MWK+YN00vP5XYHnTH0Rf
 oyZv8wJ+7RuGNWJiROMNuoyqnRVml7yEcYRLbu1Cd87UqkijnLpfRhgbLgmFLUzfjB
 hUqyMWZcNwpUQ==
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
Subject: [PATCH v7 15/21] dma-buf: Move dma_buf_vmap() to dynamic locking
 specification
Date: Mon, 17 Oct 2022 20:22:23 +0300
Message-Id: <20221017172229.42269-16-dmitry.osipenko@collabora.com>
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

Move dma_buf_vmap/vunmap() functions to the dynamic locking
specification by asserting that the reservation lock is held.

Acked-by: Sumit Semwal <sumit.semwal@linaro.org>
Acked-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/dma-buf/dma-buf.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 3e4060dadb74..2c4381bb9478 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -1450,6 +1450,8 @@ int dma_buf_vmap(struct dma_buf *dmabuf, struct iosys_map *map)
 	if (WARN_ON(!dmabuf))
 		return -EINVAL;
 
+	dma_resv_assert_held(dmabuf->resv);
+
 	if (!dmabuf->ops->vmap)
 		return -EINVAL;
 
@@ -1515,6 +1517,8 @@ void dma_buf_vunmap(struct dma_buf *dmabuf, struct iosys_map *map)
 	if (WARN_ON(!dmabuf))
 		return;
 
+	dma_resv_assert_held(dmabuf->resv);
+
 	BUG_ON(iosys_map_is_null(&dmabuf->vmap_ptr));
 	BUG_ON(dmabuf->vmapping_counter == 0);
 	BUG_ON(!iosys_map_is_equal(&dmabuf->vmap_ptr, map));
-- 
2.37.3

