Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 79AF678A0A5
	for <lists+dri-devel@lfdr.de>; Sun, 27 Aug 2023 19:56:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 563D810E1E6;
	Sun, 27 Aug 2023 17:56:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBF4910E1D8;
 Sun, 27 Aug 2023 17:56:10 +0000 (UTC)
Received: from workpc.. (109-252-153-31.dynamic.spd-mgts.ru [109.252.153.31])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 07E93660729C;
 Sun, 27 Aug 2023 18:56:07 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1693158969;
 bh=M5/xgmgYN0s36JVYHmGw/X427TQVf2NMGXsEGCVdXvc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=auSupVBWNLHWAWDVXWjgaW/AZJUx8stY7+syvdibV1xVrcSxOL5j4DHNZBO9JXHKJ
 iqALbtRa7tjggEC4KHp+M0/5uS+w0FnG1c6zwai1Eois9bFQRHq6ZxJlIz/gEvbwxV
 xIwLk4Nqs0yutZZ0BVs4gyRz6O2inG8QTQi01tA4D4Ov/q2H1DbjmY32nfDYDEToim
 yDj3RQSqElgNj+9SRbx0D9FS0IKfT+SoH59si8XXKTmqVo5OrGJenUBhVs7U1EcGZw
 LI1VPszTF93y5GByRJxiEzLnp6xM/g2rEJb3yLQ1gRu3j41GNIMmRzTLDgnLwBQkFM
 9rzLK43Ye7clw==
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: David Airlie <airlied@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Qiang Yu <yuq825@gmail.com>, Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Emma Anholt <emma@anholt.net>, Melissa Wen <mwen@igalia.com>,
 Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Boqun Feng <boqun.feng@gmail.com>, Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v15 11/23] dma-resv: Add kref_put_dma_resv()
Date: Sun, 27 Aug 2023 20:54:37 +0300
Message-ID: <20230827175449.1766701-12-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230827175449.1766701-1-dmitry.osipenko@collabora.com>
References: <20230827175449.1766701-1-dmitry.osipenko@collabora.com>
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
Cc: intel-gfx@lists.freedesktop.org, kernel@collabora.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add simple kref_put_dma_resv() helper that wraps around kref_put_ww_mutex()
for drivers that needs to lock dma-resv on kref_put().

It's not possible to easily add this helper to kref.h because of the
headers inclusion dependency, hence add it to dma-resv.h.

Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 include/linux/dma-resv.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
index 8d0e34dad446..c5cf302e4194 100644
--- a/include/linux/dma-resv.h
+++ b/include/linux/dma-resv.h
@@ -41,6 +41,7 @@
 
 #include <linux/ww_mutex.h>
 #include <linux/dma-fence.h>
+#include <linux/kref.h>
 #include <linux/slab.h>
 #include <linux/seqlock.h>
 #include <linux/rcupdate.h>
@@ -464,6 +465,14 @@ static inline void dma_resv_unlock(struct dma_resv *obj)
 	ww_mutex_unlock(&obj->lock);
 }
 
+static inline int kref_put_dma_resv(struct kref *kref,
+				    void (*release)(struct kref *kref),
+				    struct dma_resv *resv,
+				    struct ww_acquire_ctx *ctx)
+{
+	return kref_put_ww_mutex(kref, release, &resv->lock, ctx);
+}
+
 void dma_resv_init(struct dma_resv *obj);
 void dma_resv_fini(struct dma_resv *obj);
 int dma_resv_reserve_fences(struct dma_resv *obj, unsigned int num_fences);
-- 
2.41.0

