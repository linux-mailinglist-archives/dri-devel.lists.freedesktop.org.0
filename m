Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 000949B369A
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 17:35:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6067510E373;
	Mon, 28 Oct 2024 16:35:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="h5H9CyHY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C1CF10E373
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 16:35:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 45E5AA429D8;
 Mon, 28 Oct 2024 16:33:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4354AC4CEC3;
 Mon, 28 Oct 2024 16:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730133333;
 bh=B+pJhWPiLhnporLquPyi2au3DHThLhnQTOKU50phhKA=;
 h=From:To:Cc:Subject:Date:From;
 b=h5H9CyHY+7U9M417dT5UQgoE0GhbLmXiFBB0fYmDKClDxIWeb1sYo0spRU3mLXYPF
 QqrkVeBxEV7DE0/CiFRJBHzeObzzzIJ3KpGZJaw3QKOa1WJkDVa8Q7VzaWbBDNrFcw
 RQorsCq5K6NhdWFIbwdgGgmmZ6GSqyaUfACbMjfH9vglAkKUrHeRw1uTsoNirn7LF1
 sJk9KoWtA2H2n5/60Z/zVxNtuwh+KJE0Z78kRxZyXHc8MkFk7aTBp6VYBUB86kYJAL
 QCLJlx+8qySvwYe2PjVB4NBv32H3y4wCNADIEzrbORnqWGciwBZ5OxO1THfQpb85go
 784NbkD7g4y9A==
From: Arnd Bergmann <arnd@kernel.org>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Lucas Stach <l.stach@pengutronix.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/imx/dcss: include drm/drm_bridge.h header
Date: Mon, 28 Oct 2024 16:35:07 +0000
Message-Id: <20241028163527.2425783-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

Compile-testing random configurations leads to failures in
dcss-kms.c from a missing declaration:

drivers/gpu/drm/imx/dcss/dcss-kms.c:95:8: error: use of undeclared identifier 'drm_bridge_attach'
   95 |         ret = drm_bridge_attach(encoder, bridge, NULL,
      |               ^
drivers/gpu/drm/imx/dcss/dcss-kms.c:96:5: error: use of undeclared identifier 'DRM_BRIDGE_ATTACH_NO_CONNECTOR'
   96 |                                 DRM_BRIDGE_ATTACH_NO_CONNECTOR);
      |                                 ^

Include the header directly.

Fixes: 004555a18d57 ("drm/imx/dcss: Allow build with COMPILE_TEST=y")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/imx/dcss/dcss-kms.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/imx/dcss/dcss-kms.c b/drivers/gpu/drm/imx/dcss/dcss-kms.c
index 3ec721afc30c..63a335c62296 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-kms.c
+++ b/drivers/gpu/drm/imx/dcss/dcss-kms.c
@@ -5,6 +5,7 @@
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_bridge.h>
 #include <drm/drm_bridge_connector.h>
 #include <drm/drm_client_setup.h>
 #include <drm/drm_drv.h>
-- 
2.39.5

