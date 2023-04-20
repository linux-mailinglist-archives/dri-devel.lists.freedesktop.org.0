Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC6C6E8CFF
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 10:42:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82B3F10EBDF;
	Thu, 20 Apr 2023 08:41:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B0F510EBDE
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 08:41:56 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a02:2f08:4a06:df00:9eb6:d0ff:fe91:8037])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: mvlad)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 970846603252;
 Thu, 20 Apr 2023 09:41:51 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1681980112;
 bh=0vmGTRoa0V7aOW8+JeLAmjUNo9x0y//BKIakRk+cc3Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DztH7EbQEVWADsW9wEoxQSXIWCeNJyRj1tlyhnQm1h+trQ2HosqyQ6+4LoDVH+QFx
 RmblvaihXjGIpDKPUDvR4rp+WZQBgQ24OQfAzuS414t8Hk1jwspD6UIPhSKjhJ+QEn
 veUhdxYkECzDIgrXjHBFNxG8ZTjgYIgKbe8+3rhDRfjh5VqBXLq+tkq49t/0j5Xy1y
 GNI2toeSeY1iAdB9N0000EkfcxUm8QzXXqL0e5OHCZvK5n/Avt2Bhjw2FXfHEjNkEp
 7YfxOxhcv36dTdi1di+ifIboRC8yG+KUR3OCFl/Uev/V2cvXXL+hrSMTRhOBj5d+eT
 wfgd0gQmWuhLw==
From: Marius Vlad <marius.vlad@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/3] vkms: Pass the correct bitmask for possible crtcs
Date: Thu, 20 Apr 2023 11:41:45 +0300
Message-Id: <20230420084147.19042-2-marius.vlad@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230420084147.19042-1-marius.vlad@collabora.com>
References: <20230420084147.19042-1-marius.vlad@collabora.com>
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
Cc: mwen@igalia.com, tzimmermann@suse.de, rodrigosiqueiramelo@gmail.com,
 mcanal@igalia.com, melissa.srw@gmail.com, marius.vlad@collabora.com,
 igormtorrente@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In preparation of having multiple pipelines we need to able to choose the
correct encoder/connectors/crtc combination so pass also the index as a
bitmask as possible CRTCs for the encoder.

Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
---
 drivers/gpu/drm/vkms/vkms_output.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
index 991857125bb4..ebb75ede65ab 100644
--- a/drivers/gpu/drm/vkms/vkms_output.c
+++ b/drivers/gpu/drm/vkms/vkms_output.c
@@ -96,7 +96,7 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
 		DRM_ERROR("Failed to init encoder\n");
 		goto err_encoder;
 	}
-	encoder->possible_crtcs = 1;
+	encoder->possible_crtcs = (1 << index);
 
 	ret = drm_connector_attach_encoder(connector, encoder);
 	if (ret) {
-- 
2.39.2

