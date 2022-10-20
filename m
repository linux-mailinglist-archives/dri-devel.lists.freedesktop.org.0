Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2CDC606A5C
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 23:34:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8222510E15F;
	Thu, 20 Oct 2022 21:34:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B772510E15F
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Oct 2022 21:34:01 +0000 (UTC)
Received: from dimapc.. (109-252-119-114.nat.spd-mgts.ru [109.252.119.114])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id B47256602482;
 Thu, 20 Oct 2022 22:33:59 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1666301640;
 bh=W/n3zjR0a0jDhmMKl2jfwwXY/Ev21PtBnp6TxNf3TdM=;
 h=From:To:Cc:Subject:Date:From;
 b=DZg3T6V0kTVvs1FEuwfZdP0wxeYg6Jw4gcj36RvqnQAGIrYbmX6YMQ2Be8h3il2z7
 ZELjQq0HaZGNlHaiI0ddU3aSafRy5u72PmmAzU9oQ3DLBdxyRHU4bNg3UwcB69W266
 Q9uhHKOT3iT0SJAJjOEbZ/RhwiS5NJF+riGVEjXZOm3ei8adf2BRjQCvgs0y7RI17j
 xOg7iTDGHxLUaPzFCPesyG02WzHdYbYnM0BEtuksQ39pPH6eikTTk7j+6o1quI36bE
 ESw500SPsXaglHsuCn0ZDHMC9aqNyLwr+oyBr5CiD2WutBhv0vtf4paolNaXuPmuU7
 THricDcNFDM7w==
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v1] drm: Switch drm_client_buffer_delete() to unlocked
 drm_gem_vunmap
Date: Fri, 21 Oct 2022 00:33:35 +0300
Message-Id: <20221020213335.309092-1-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.37.3
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The drm_client_buffer_delete() wasn't switched to unlocked GEM vunmapping
by accident when rest of drm_client code transitioned to the unlocked
variants of the vmapping functions. Make drm_client_buffer_delete() use
the unlocked variant. This fixes lockdep warning splat about missing
reservation lock when framebuffer is released.

Reported-by: kernel test robot <yujie.liu@intel.com>
Link: https://lore.kernel.org/dri-devel/890f70db-68b0-8456-ca3c-c5496ef90517@collabora.com/T/
Fixes: 79e2cf2e7a19 ("drm/gem: Take reservation lock for vmap/vunmap operations")
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/drm_client.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
index fbcb1e995384..38e1be991caa 100644
--- a/drivers/gpu/drm/drm_client.c
+++ b/drivers/gpu/drm/drm_client.c
@@ -235,7 +235,7 @@ static void drm_client_buffer_delete(struct drm_client_buffer *buffer)
 {
 	struct drm_device *dev = buffer->client->dev;
 
-	drm_gem_vunmap(buffer->gem, &buffer->map);
+	drm_gem_vunmap_unlocked(buffer->gem, &buffer->map);
 
 	if (buffer->gem)
 		drm_gem_object_put(buffer->gem);
-- 
2.37.3

