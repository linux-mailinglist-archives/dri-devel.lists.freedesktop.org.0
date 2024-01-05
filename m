Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 422E0825A67
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jan 2024 19:46:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 073E410E66E;
	Fri,  5 Jan 2024 18:46:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [IPv6:2a00:1098:ed:100::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5402410E66A
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jan 2024 18:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1704480409;
 bh=ptvxcc6NBB3ZGswpKHFL88IdpqznzAuLiZMI6wVLSM8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=tJ2pdd+pvOEsV/MddsX+Rhpq10rQUgrH8iMoWqsE7sbqJj2DiHIbSlFYhxXUeJYe7
 7BGFC5fvX/r/XKQR0X/OOEbXX/Am1YkrB/hrnW3yrbNUXnVguTcn3dzUqQiGlRkLQy
 knPw1o4W2gcMLpWddKcmZUTf2OeZPsMq5vWBm1n9X3C1mZg/GLQ+rm2i+FJNmQQIiw
 Cozz73jTI07/xgH2AFJJ7p19o2+J1YPwqmJzre52rzcpeYv2cqMQR4x+xmI/RtRyph
 TTjY+9ntgII34qtCuS71YoTCGs7ayEtdxt6O6MAuqsrafsAehlAKaupMgVxxQHf4Bh
 amDBvdPr55FVQ==
Received: from workpc.. (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id D499B378203D;
 Fri,  5 Jan 2024 18:46:47 +0000 (UTC)
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
 Emma Anholt <emma@anholt.net>, Melissa Wen <mwen@igalia.com>
Subject: [PATCH v19 03/30] drm/gem: Document locking rule of vmap and evict
 callbacks
Date: Fri,  5 Jan 2024 21:45:57 +0300
Message-ID: <20240105184624.508603-4-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240105184624.508603-1-dmitry.osipenko@collabora.com>
References: <20240105184624.508603-1-dmitry.osipenko@collabora.com>
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
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The vmap/vunmap/evict GEM callbacks are always invoked with a held GEM's
reservation lock. Document this locking rule for clarity.

Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 include/drm/drm_gem.h | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index f835fdee6a5e..021f64371056 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -156,7 +156,8 @@ struct drm_gem_object_funcs {
 	 * @vmap:
 	 *
 	 * Returns a virtual address for the buffer. Used by the
-	 * drm_gem_dmabuf_vmap() helper.
+	 * drm_gem_dmabuf_vmap() helper. Called with a held GEM reservation
+	 * lock.
 	 *
 	 * This callback is optional.
 	 */
@@ -166,7 +167,8 @@ struct drm_gem_object_funcs {
 	 * @vunmap:
 	 *
 	 * Releases the address previously returned by @vmap. Used by the
-	 * drm_gem_dmabuf_vunmap() helper.
+	 * drm_gem_dmabuf_vunmap() helper. Called with a held GEM reservation
+	 * lock.
 	 *
 	 * This callback is optional.
 	 */
@@ -189,7 +191,8 @@ struct drm_gem_object_funcs {
 	 * @evict:
 	 *
 	 * Evicts gem object out from memory. Used by the drm_gem_object_evict()
-	 * helper. Returns 0 on success, -errno otherwise.
+	 * helper. Returns 0 on success, -errno otherwise. Called with a held
+	 * GEM reservation lock.
 	 *
 	 * This callback is optional.
 	 */
-- 
2.43.0

