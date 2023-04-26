Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50EAB6EF246
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 12:41:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ED9610E8C7;
	Wed, 26 Apr 2023 10:41:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B063910E914
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Apr 2023 10:41:09 +0000 (UTC)
Received: from localhost.localdomain (unknown [109.100.38.211])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: mvlad)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id DE66D66032A7;
 Wed, 26 Apr 2023 11:41:06 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1682505668;
 bh=huhcWtt1gb2DzP82kA9cyR5kjiCXe3xm8As34p5mgwc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jx4yv/O9ae7xDl8+8xhyKWdj54dKHRfAMToRyeJ863jEUMrE5WOV9GokuvjjtdmxQ
 kyXH+pGUcMLYS83aQDVBsynykjsiW+sQEfh7dFBJQW579kSQuFQu5x4imWs84gSvIE
 VnFFpDTumFpZGuiwPi3dj6+8F2nu/4e7XvNxmo1OGJVD6jN9o3wUUphQZTr9AxP4DQ
 42YfcHQcp2XJjkGaAb76TvDGff46M87XUqJBdCQ7LFa2utWVGpSH9unnM8xz7fPh0d
 PPh/TU57q0nuSDqcU9yzENSp4SHHl88yx+D1hLMQ9c3g1A8eSy43zRd9tvI8h39WGQ
 2tQGgALAVmzFA==
From: Marius Vlad <marius.vlad@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 1/3] vkms: Pass the correct bitmask for possible crtcs
Date: Wed, 26 Apr 2023 13:40:57 +0300
Message-Id: <20230426104059.28732-2-marius.vlad@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230426104059.28732-1-marius.vlad@collabora.com>
References: <20230426104059.28732-1-marius.vlad@collabora.com>
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
 yixie@chromium.org, mcanal@igalia.com, melissa.srw@gmail.com,
 brpol@chromium.org, marius.vlad@collabora.com, igormtorrente@gmail.com
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
index 5ce70dd946aa..1b8aa3a34e46 100644
--- a/drivers/gpu/drm/vkms/vkms_output.c
+++ b/drivers/gpu/drm/vkms/vkms_output.c
@@ -95,7 +95,7 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
 		DRM_ERROR("Failed to init encoder\n");
 		goto err_encoder;
 	}
-	encoder->possible_crtcs = 1;
+	encoder->possible_crtcs = (1 << index);
 
 	ret = drm_connector_attach_encoder(connector, encoder);
 	if (ret) {
-- 
2.39.2

