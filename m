Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CBAC59F7AD
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 12:27:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43B9510E7D5;
	Wed, 24 Aug 2022 10:27:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB73B10E9A0;
 Wed, 24 Aug 2022 10:24:13 +0000 (UTC)
Received: from dimapc.. (109-252-119-13.nat.spd-mgts.ru [109.252.119.13])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 02D2A6601E84;
 Wed, 24 Aug 2022 11:23:53 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1661336636;
 bh=IF0WjJALlax5Sjcmk8CHr8CPUOmvo3HEAaymEv/yVHY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YGplYiTHLmmSLMfF20eO3q+05nXHZVdZDVBv77WBzMe0j6JOLi/+yjURFm5wIxfeR
 L2UQYrUHT+FkTSUz+q5bLy1eLS2OZg0IshXKGyAawacYjySjVw0b6BqpCBReZYSqTl
 qOmZJn6DXGOOoaOMjFFtWQ751z1+0TvrwmZwYjKyA1dQEFNSQCGe+GH19qnhAn6jEE
 K7T0VkAEZnAdHhfadMxupLSRCFOef0d9J+SuosVSOltE6sq6U+g+I5A66oUHkDBdUd
 gz79Q4ZQVWouf+FIj72SdWwjQ0Nqt2gzaxsQbdQe2ZzKFOTbn18PJSqniVuEGo8ckv
 ckAsVTWOek40A==
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
 Qiang Yu <yuq825@gmail.com>
Subject: [PATCH v3 7/9] dma-buf: Document dynamic locking convention
Date: Wed, 24 Aug 2022 13:22:46 +0300
Message-Id: <20220824102248.91964-8-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220824102248.91964-1-dmitry.osipenko@collabora.com>
References: <20220824102248.91964-1-dmitry.osipenko@collabora.com>
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
Cc: lima@lists.freedesktop.org, linux-rdma@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linaro-mm-sig@lists.linaro.org,
 dri-devel@lists.freedesktop.org, Dmitry Osipenko <digetx@gmail.com>,
 kernel@collabora.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add documentation for the dynamic locking convention. The documentation
tells dma-buf API users when they should take the reservation lock and
when not.

Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 Documentation/driver-api/dma-buf.rst |  6 +++
 drivers/dma-buf/dma-buf.c            | 63 ++++++++++++++++++++++++++++
 2 files changed, 69 insertions(+)

diff --git a/Documentation/driver-api/dma-buf.rst b/Documentation/driver-api/dma-buf.rst
index 36a76cbe9095..622b8156d212 100644
--- a/Documentation/driver-api/dma-buf.rst
+++ b/Documentation/driver-api/dma-buf.rst
@@ -119,6 +119,12 @@ DMA Buffer ioctls
 
 .. kernel-doc:: include/uapi/linux/dma-buf.h
 
+DMA-BUF locking convention
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+.. kernel-doc:: drivers/dma-buf/dma-buf.c
+   :doc: locking convention
+
 Kernel Functions and Structures Reference
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index f2a5a122da4a..696d132b02f4 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -794,6 +794,69 @@ static struct sg_table * __map_dma_buf(struct dma_buf_attachment *attach,
 	return sg_table;
 }
 
+/**
+ * DOC: locking convention
+ *
+ * In order to avoid deadlock situations between dma-buf exports and importers,
+ * all dma-buf API users must follow the common dma-buf locking convention.
+ *
+ * Convention for importers
+ *
+ * 1. Importers must hold the dma-buf reservation lock when calling these
+ *    functions:
+ *
+ *     - dma_buf_pin()
+ *     - dma_buf_unpin()
+ *     - dma_buf_map_attachment()
+ *     - dma_buf_unmap_attachment()
+ *     - dma_buf_vmap()
+ *     - dma_buf_vunmap()
+ *
+ * 2. Importers must not hold the dma-buf reservation lock when calling these
+ *    functions:
+ *
+ *     - dma_buf_attach_unlocked()
+ *     - dma_buf_dynamic_attach_unlocked()
+ *     - dma_buf_detach_unlocked()
+ *     - dma_buf_export(
+ *     - dma_buf_fd()
+ *     - dma_buf_get()
+ *     - dma_buf_put()
+ *     - dma_buf_begin_cpu_access()
+ *     - dma_buf_end_cpu_access()
+ *     - dma_buf_map_attachment_unlocked()
+ *     - dma_buf_unmap_attachment_unlocked()
+ *     - dma_buf_vmap_unlocked()
+ *     - dma_buf_vunmap_unlocked()
+ *
+ * Convention for exporters
+ *
+ * 1. These &dma_buf_ops callbacks are invoked with unlocked dma-buf
+ *    reservation and exporter can take the lock:
+ *
+ *     - &dma_buf_ops.attach()
+ *     - &dma_buf_ops.detach()
+ *     - &dma_buf_ops.release()
+ *     - &dma_buf_ops.begin_cpu_access()
+ *     - &dma_buf_ops.end_cpu_access()
+ *
+ * 2. These &dma_buf_ops callbacks are invoked with locked dma-buf
+ *    reservation and exporter can't take the lock:
+ *
+ *     - &dma_buf_ops.pin()
+ *     - &dma_buf_ops.unpin()
+ *     - &dma_buf_ops.map_dma_buf()
+ *     - &dma_buf_ops.unmap_dma_buf()
+ *     - &dma_buf_ops.mmap()
+ *     - &dma_buf_ops.vmap()
+ *     - &dma_buf_ops.vunmap()
+ *
+ * 3. Exporters must hold the dma-buf reservation lock when calling these
+ *    functions:
+ *
+ *     - dma_buf_move_notify()
+ */
+
 /**
  * dma_buf_dynamic_attach_unlocked - Add the device to dma_buf's attachments list
  * @dmabuf:		[in]	buffer to attach device to.
-- 
2.37.2

