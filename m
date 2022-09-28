Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6345EE54E
	for <lists+dri-devel@lfdr.de>; Wed, 28 Sep 2022 21:19:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9517010E88F;
	Wed, 28 Sep 2022 19:19:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ED3010E812;
 Wed, 28 Sep 2022 19:18:00 +0000 (UTC)
Received: from dimapc.. (unknown [109.252.125.248])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id F35BD66022B6;
 Wed, 28 Sep 2022 20:17:55 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1664392679;
 bh=f3G12g+5czfdXru1FeeGI7Ybfs2QOu1D1lZN+8ABGmM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PtCLdIMfXvqh6cEs8jT8c5CUa4kud+N1s6CpLl8wJwPcqYx63cK46fxVUNSmpB5dW
 YKBxz53PUOaj5NZTocXMbYgc7BSDkST7AUOg6x9l1RIXwmPsnVn7kzx4TYXHgK27TP
 bKMXgdJEQfUpZjabDQ1jWXu/u+sUluGsl9CSveFIwr0e16HCNI/xW9v/SE9ObGmklU
 qgqufjJFDhSWVkok2eQqRvdufhpvSbN+Ff29+ikbqk8pGu6zqBsf4Gy5PmQLj5vq20
 EivXDNIeK0GpMV/1+gAhSdaPlgZc8AI08eGnsuPu4dLQhxxk2hdVS8zWhB89DgyGbN
 vEEHMqXY8WSeA==
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
Subject: [PATCH v6 11/21] misc: fastrpc: Prepare to dynamic dma-buf locking
 specification
Date: Wed, 28 Sep 2022 22:15:50 +0300
Message-Id: <20220928191600.5874-12-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220928191600.5874-1-dmitry.osipenko@collabora.com>
References: <20220928191600.5874-1-dmitry.osipenko@collabora.com>
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

Prepare fastrpc to the common dynamic dma-buf locking convention by
starting to use the unlocked versions of dma-buf API functions.

Acked-by: Christian König <christian.koenig@amd.com>
Acked-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/misc/fastrpc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 7ff0b63c25e3..1ad580865525 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -310,8 +310,8 @@ static void fastrpc_free_map(struct kref *ref)
 				return;
 			}
 		}
-		dma_buf_unmap_attachment(map->attach, map->table,
-					 DMA_BIDIRECTIONAL);
+		dma_buf_unmap_attachment_unlocked(map->attach, map->table,
+						  DMA_BIDIRECTIONAL);
 		dma_buf_detach(map->buf, map->attach);
 		dma_buf_put(map->buf);
 	}
@@ -726,7 +726,7 @@ static int fastrpc_map_create(struct fastrpc_user *fl, int fd,
 		goto attach_err;
 	}
 
-	map->table = dma_buf_map_attachment(map->attach, DMA_BIDIRECTIONAL);
+	map->table = dma_buf_map_attachment_unlocked(map->attach, DMA_BIDIRECTIONAL);
 	if (IS_ERR(map->table)) {
 		err = PTR_ERR(map->table);
 		goto map_err;
-- 
2.37.3

