Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C33665A19
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 12:30:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20EC010E70A;
	Wed, 11 Jan 2023 11:30:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11BEE10E70F
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 11:30:46 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7FB7D61C04;
 Wed, 11 Jan 2023 11:30:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E858C433EF;
 Wed, 11 Jan 2023 11:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1673436644;
 bh=PbvUrZFDDqA/zKZJizBhQHcpk8Qr9JjCk+UTHtD7YcU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ewFGxEZrPXSDdTzsC5QBHU8HraX6MjPyINJ9nAyCGq07kCKSZDR4oDlB60E/anZW+
 EtvVN5R1EYDR6J1RW17ibZspQ37lj+BKZW1maB3ZRKq5DYu5pllTiPiSGNydbC17nl
 tGGHay/GZ8qsK7cVUkI7wRAfHGDxUJklyN2l7bfk=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 12/16] drm/mipi-dsi: move to_mipi_dsi_device() to use
 container_of_const()
Date: Wed, 11 Jan 2023 12:30:14 +0100
Message-Id: <20230111113018.459199-13-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230111113018.459199-1-gregkh@linuxfoundation.org>
References: <20230111113018.459199-1-gregkh@linuxfoundation.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1332;
 i=gregkh@linuxfoundation.org; h=from:subject;
 bh=PbvUrZFDDqA/zKZJizBhQHcpk8Qr9JjCk+UTHtD7YcU=;
 b=owGbwMvMwCRo6H6F97bub03G02pJDMn75p60iLoutu7+VnGDkPXPlaIP+P5NOnohIMfi3atDNTop
 1bNyOmJZGASZGGTFFFm+bOM5ur/ikKKXoe1pmDmsTCBDGLg4BWAiLfsZFux54/mgYbZmq1N1yp2Sgz
 ySv+Y2T2SYZ33tTenjYpd/z//sd7QTbj8kFDY/CgA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp;
 fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The driver core is changing to pass some pointers as const, so move
to_mipi_dsi_device() to use container_of_const() to handle this change.

to_mipi_dsi_device() now properly keeps the const-ness of the pointer passed
into it, while as before it could be lost.

Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 include/drm/drm_mipi_dsi.h | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
index 20b21b577dea..56a6557b2f4c 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -197,10 +197,7 @@ struct mipi_dsi_device {
 
 #define MIPI_DSI_MODULE_PREFIX "mipi-dsi:"
 
-static inline struct mipi_dsi_device *to_mipi_dsi_device(struct device *dev)
-{
-	return container_of(dev, struct mipi_dsi_device, dev);
-}
+#define to_mipi_dsi_device(__dev)	container_of_const(__dev, struct mipi_dsi_device, dev)
 
 /**
  * mipi_dsi_pixel_format_to_bpp - obtain the number of bits per pixel for any
-- 
2.39.0

