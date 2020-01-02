Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03EFD12E6A8
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jan 2020 14:23:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0085389DA4;
	Thu,  2 Jan 2020 13:23:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02E30899B3
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jan 2020 13:23:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id 811C028A0B9
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/4] drm: zte: Provide ddc symlink in hdmi connector sysfs
 directory
Date: Thu,  2 Jan 2020 14:22:59 +0100
Message-Id: <20200102132300.24309-4-andrzej.p@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200102132300.24309-1-andrzej.p@collabora.com>
References: <20200102132300.24309-1-andrzej.p@collabora.com>
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
Cc: David Airlie <airlied@linux.ie>, Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org,
 kernel@collabora.com, Shawn Guo <shawnguo@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use the ddc pointer provided by the generic connector.

Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Emil Velikov <emil.velikov@collabora.com>
---
 drivers/gpu/drm/zte/zx_hdmi.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/zte/zx_hdmi.c b/drivers/gpu/drm/zte/zx_hdmi.c
index a50f5a1f09b8..b98a1420dcd3 100644
--- a/drivers/gpu/drm/zte/zx_hdmi.c
+++ b/drivers/gpu/drm/zte/zx_hdmi.c
@@ -319,8 +319,10 @@ static int zx_hdmi_register(struct drm_device *drm, struct zx_hdmi *hdmi)
 
 	hdmi->connector.polled = DRM_CONNECTOR_POLL_HPD;
 
-	drm_connector_init(drm, &hdmi->connector, &zx_hdmi_connector_funcs,
-			   DRM_MODE_CONNECTOR_HDMIA);
+	drm_connector_init_with_ddc(drm, &hdmi->connector,
+				    &zx_hdmi_connector_funcs,
+				    DRM_MODE_CONNECTOR_HDMIA,
+				    &hdmi->ddc->adap);
 	drm_connector_helper_add(&hdmi->connector,
 				 &zx_hdmi_connector_helper_funcs);
 
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
