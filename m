Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B4BB612B4E
	for <lists+dri-devel@lfdr.de>; Sun, 30 Oct 2022 16:45:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E0D710E104;
	Sun, 30 Oct 2022 15:45:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D84A310E0FC
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Oct 2022 15:44:52 +0000 (UTC)
Received: from dimapc.. (unknown [109.252.112.196])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id E00E066022A2;
 Sun, 30 Oct 2022 15:44:50 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1667144691;
 bh=Jr+CDx/FOmbAS4EXsPeToboJf/vzEdDZoQONhOc44DE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=D77hkyxoateNQYLF7wJaHR+9csvedoBuzF1VEUTMenUkMjtdSeyXUAhgE0j4RXuLL
 Linbwa8HPzpUigLIVoxs7LY25ZnDHWu77L1e1Q7YGyXwmOKgD3BcSzOhrRNW06qo8h
 vIMEKpXsMe8QU+z9CDPFk7/fR+FFtgzo3b4+FJjHQYU9K1kXH8ISUBV8sOjaF86c1g
 oPB4Zkj4zO4tGmixIgmZ0m4jNShlzyv6vRfkWt4KlbW+uX+eJypQ916ceOZdx6DhKc
 dbOzHIpE1tWqNwSK2G/EjpcU6QwFq2DrhD7r7oTmaWUaCYVeTLqy3SkZoLn2Oi//WB
 i4qutZJMPkWVA==
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 noralf@tronnes.org, Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH v2 2/2] drm/client: Prevent NULL dereference in
 drm_client_buffer_delete()
Date: Sun, 30 Oct 2022 18:44:12 +0300
Message-Id: <20221030154412.8320-3-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221030154412.8320-1-dmitry.osipenko@collabora.com>
References: <20221030154412.8320-1-dmitry.osipenko@collabora.com>
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

The drm_gem_vunmap() will crash with a NULL dereference if the passed
object pointer is NULL. It wasn't a problem before we added the locking
support to drm_gem_vunmap function because the mapping argument was always
NULL together with the object. Make drm_client_buffer_delete() to check
whether GEM is NULL before trying to unmap the GEM, it will happen on
framebuffer creation error.

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Link: https://lore.kernel.org/dri-devel/Y1kFEGxT8MVlf32V@kili/
Fixes: 79e2cf2e7a19 ("drm/gem: Take reservation lock for vmap/vunmap operations")
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/drm_client.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
index 38e1be991caa..fd67efe37c63 100644
--- a/drivers/gpu/drm/drm_client.c
+++ b/drivers/gpu/drm/drm_client.c
@@ -235,10 +235,10 @@ static void drm_client_buffer_delete(struct drm_client_buffer *buffer)
 {
 	struct drm_device *dev = buffer->client->dev;
 
-	drm_gem_vunmap_unlocked(buffer->gem, &buffer->map);
-
-	if (buffer->gem)
+	if (buffer->gem) {
+		drm_gem_vunmap_unlocked(buffer->gem, &buffer->map);
 		drm_gem_object_put(buffer->gem);
+	}
 
 	if (buffer->handle)
 		drm_mode_destroy_dumb(dev, buffer->handle, buffer->client->file);
-- 
2.37.3

