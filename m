Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6FFE6D393C
	for <lists+dri-devel@lfdr.de>; Sun,  2 Apr 2023 18:49:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F087510E20F;
	Sun,  2 Apr 2023 16:49:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CAC410E1E4;
 Sun,  2 Apr 2023 16:49:23 +0000 (UTC)
Received: from workpc.. (109-252-124-32.nat.spd-mgts.ru [109.252.124.32])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id C97F16603149;
 Sun,  2 Apr 2023 17:49:19 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1680454162;
 bh=eVCdRV5qU8vynb/wrbVZGCbVBKV3Y+cRuke8yPhNiSw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hP3BTt5MkgWeSKeeRJnyPJdkJiCW4vh+CO/RD3NLk4Z71S6FposyyUQvkf+9iAEvm
 ViYtSop9tvAbEeer3NCbYe/ksUYBAaDKPI3yk3PY0jdHSlWullovFmAkAfywGn72+0
 2OtqCX755RxvHKTzm25LdjO5bt5nv8+gWe29xcH+PpxoxeOnqihfOjDkPwGXBE5BXL
 1lqsBdysM0KsO7CnNJwE2ewR/DFm45y2iNyqIP0Cb8x8BRonPuUZ5zplmcGUhKu5v1
 y05NU/gTqSAzoeyRYtqoewGziWoxECJQKdv7R6MP1tZ7uftHxjroX9+JHenoswzVCr
 7I8ScLsqJwgbw==
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Liam Mark <lmark@codeaurora.org>, Brian Starkey <Brian.Starkey@arm.com>,
 John Stultz <jstultz@google.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Tomi Valkeinen <tomba@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Tomasz Figa <tfiga@chromium.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Amol Maheshwari <amahesh@qti.qualcomm.com>
Subject: [PATCH v1 4/7] Revert "fastrpc: Assert held reservation lock for
 dma-buf mmapping"
Date: Sun,  2 Apr 2023 19:48:23 +0300
Message-Id: <20230402164826.752842-5-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230402164826.752842-1-dmitry.osipenko@collabora.com>
References: <20230402164826.752842-1-dmitry.osipenko@collabora.com>
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
Cc: linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, kernel@collabora.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Don't assert held dma-buf reservation lock on memory mapping of exported
buffer.

We're going to change dma-buf mmap() locking policy such that exporters
will have to handle the lock. The previous locking policy caused deadlock
problem for DRM drivers in a case of self-imported dma-bufs, it's solved
by moving the lock down to exporters.

Fixes: 265751a513ad ("fastrpc: Assert held reservation lock for dma-buf mmapping")
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/misc/fastrpc.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index a701132638cf..7e9c9ad37fd9 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -6,7 +6,6 @@
 #include <linux/device.h>
 #include <linux/dma-buf.h>
 #include <linux/dma-mapping.h>
-#include <linux/dma-resv.h>
 #include <linux/idr.h>
 #include <linux/list.h>
 #include <linux/miscdevice.h>
@@ -733,8 +732,6 @@ static int fastrpc_mmap(struct dma_buf *dmabuf,
 	struct fastrpc_buf *buf = dmabuf->priv;
 	size_t size = vma->vm_end - vma->vm_start;
 
-	dma_resv_assert_held(dmabuf->resv);
-
 	return dma_mmap_coherent(buf->dev, vma, buf->virt,
 				 FASTRPC_PHYS(buf->phys), size);
 }
-- 
2.39.2

