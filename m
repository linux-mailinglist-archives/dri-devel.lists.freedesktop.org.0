Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4966EDC99
	for <lists+dri-devel@lfdr.de>; Tue, 25 Apr 2023 09:30:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF0D110E6AB;
	Tue, 25 Apr 2023 07:30:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F8EF10E6AB
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Apr 2023 07:30:22 +0000 (UTC)
Received: from localhost.localdomain (unknown [109.100.38.211])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: mvlad)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id AA94C66031CD;
 Tue, 25 Apr 2023 08:30:17 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1682407818;
 bh=huhcWtt1gb2DzP82kA9cyR5kjiCXe3xm8As34p5mgwc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JUjJHXHh3J2hkKAHFg2wJadeMYKrLq7dj98AfGHcW1sDQHhoJang2LzkkrclaGmso
 N5Il3sZy3RmMhumhUTWjQSakTbVGJnHzbGt31IX/Mnn6QLqdwTAXonVRX1jTONVWJi
 eDbMrUWQ06q5uN/KDpjdg/v0i/BJKLJR7LNxKESU+o8qysZNk9pEPDf+5Qw8tfD5R7
 1yCYK7ahnQzHOAYs9YEEZ/ojPhgcH8rA0VUuOFSNbxvYh/9IRHMMokeF8aNpIlLTyL
 oatzQymNU3fOTdxUNc+T9NWOO3GkWu0mfxmDYYtOxH/RKHV8UP9C+tE5xxZ2VuASoh
 /XsC10Txb8YkQ==
From: Marius Vlad <marius.vlad@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 1/3] vkms: Pass the correct bitmask for possible crtcs
Date: Tue, 25 Apr 2023 10:30:10 +0300
Message-Id: <20230425073012.11036-2-marius.vlad@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230425073012.11036-1-marius.vlad@collabora.com>
References: <20230425073012.11036-1-marius.vlad@collabora.com>
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

