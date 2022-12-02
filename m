Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A16A640847
	for <lists+dri-devel@lfdr.de>; Fri,  2 Dec 2022 15:21:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDBF210E0E9;
	Fri,  2 Dec 2022 14:21:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E84E10E0E9
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Dec 2022 14:20:57 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a02:2f08:4503:c400:e6b9:7aff:febb:e612])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: mvlad)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 726436602BC4;
 Fri,  2 Dec 2022 14:20:55 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1669990855;
 bh=jyuSouAhdhqH80mcutvxp+GSP4nvItxuaGLyqC6N5iY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jAPS6ryWgFJ+HK/N1GdqRiLI21MSKX/txSTouzIwZfnZhMdGgyMr+wU8UaXaIoPSV
 3Y+3L5XThSH5T7dGpUOT1o2GPncgQxfY1EiYJ5y//ok/79eiA11WgSLwemwFirvdMT
 8kHea9gnRjvAjaKYb27k53WVpYSGeWUqUTJiCI29TgJ5kKLpUd0HVOuJ7j6IXgB7VC
 +q4W0QCpUEQ76iSREurGDd87OfbczSQL3hqpmm3CshO9R/qOcywXSQRIZprSsIyGX+
 KYMDUfMSeYrB/Sr3igHjEztek3NJmeLAIpC0Ii9eukBG2KtSOBNmHMZ9sOiop33M2X
 E8kYBndTc6z5Q==
From: Marius Vlad <marius.vlad@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] vkms: Pass the correct bitmask for possible crtcs
Date: Fri,  2 Dec 2022 16:20:50 +0200
Message-Id: <20221202142051.136651-2-marius.vlad@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221202142051.136651-1-marius.vlad@collabora.com>
References: <20221202142051.136651-1-marius.vlad@collabora.com>
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
Cc: mwen@igalia.com, rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com,
 marius.vlad@collabora.com, igormtorrente@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In preparation of having multiple outputs/virtual connectors we need to
able to chose the correct encoder/connectors/crtc combination so pass also
the index as a bitmask as possible crtcs for the encoder.

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
2.35.1

