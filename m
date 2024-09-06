Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A69A296EACF
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 08:39:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9888010E185;
	Fri,  6 Sep 2024 06:39:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.b="SKC29Hq5";
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="CiC6itrb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C423510E185
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2024 06:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1725604750; x=1757140750;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Dg5SF6JXmaXxF0NLRP6GCKnQQLT8CWaXwLRzR4UmnOs=;
 b=SKC29Hq5SLNOUuTdPJNVTZVo7sNQPfgOa8dg1SgPeXzcnt9f5G1js0n+
 0Dmeru3Y0jrdbXT4mHGRJhTBcVQf3p3CyB4lQRtOjm5JJ2gnpn4E23qoi
 WshystuQ2dWXZWU1ulEwcPD7lyNJ51gwF9Cc3pqtE11stlaLEUKSqjarp
 VCDwT29EOoeKgKRH3d2Kc+wztz7hCmMmeFd6vm4EM+MfAYVrbmcXNofsT
 cnXF2MAcbj0IyVMCW26WVyI/qe0fJbVJs1drqKfhhyYxTnni5WsxDJHLQ
 KoGS1kjIoGW3WtoyM3e37sES57A76072zyFzsNy9ne2ZxLBlLuDP6rms0 w==;
X-CSE-ConnectionGUID: DjVR2wjrShqRlWD7KLf6wg==
X-CSE-MsgGUID: 0LO+PlrWTIiSpA4VuyZAyA==
X-IronPort-AV: E=Sophos;i="6.10,207,1719871200"; d="scan'208";a="38800714"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
 by mx1.tq-group.com with ESMTP; 06 Sep 2024 08:39:07 +0200
X-CheckPoint: {66DAA38B-1F-22BB8E18-F5F6D0B4}
X-MAIL-CPID: 492BF267EFA1B926E3FE21B06D48DD7E_5
X-Control-Analysis: str=0001.0A782F18.66DAA38B.011E, ss=1, re=0.000, recu=0.000,
 reip=0.000, cl=1, cld=1, fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4DA84162421; Fri,  6 Sep 2024 08:38:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
 s=dkim; t=1725604743; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=Dg5SF6JXmaXxF0NLRP6GCKnQQLT8CWaXwLRzR4UmnOs=;
 b=CiC6itrbelTRi6ewhMP9FNHhuWFQHP6QFd2pZykZYifC5qDOEtEzZ0uZbARHpGUk/O8zX+
 /Wx/DcrShWriDkaJXsGSmW8GcSHt/XWBV+aJ6V5T21hg/ldTo/gbqqyLnFamC+XEKVQbRZ
 NYVarCfDsY6S2cOkuAXsE3PgnGsdNCr17GE82ZIaaL5bj9K5FYcJO/7/o4sI9AhlWlsrz7
 x70qZRwg2TU/9SVbAiW++JIrm/Q++r4s4XxSIsyKVg5k/hsew+9WVcmhNcxcwJ24xkypn3
 gSW+gO3gNjL9dZyhYkfCvmDepk3EK4PFF0CZpq6cNkxkkktJeoXh5okMnmjGzA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] drm/imx: Add missing DRM_BRIDGE_CONNECTOR dependency
Date: Fri,  6 Sep 2024 08:38:56 +0200
Message-Id: <20240906063857.2223442-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
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

When drm/bridge-connector was moved to DRM_DISPLAY_HELPER not all
users were updated. Add missing Kconfig selections.

Fixes: 9da7ec9b19d8 ("drm/bridge-connector: move to DRM_DISPLAY_HELPER module")
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/gpu/drm/imx/ipuv3/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/imx/ipuv3/Kconfig b/drivers/gpu/drm/imx/ipuv3/Kconfig
index 5a40c878ebb05..990e216c51cc8 100644
--- a/drivers/gpu/drm/imx/ipuv3/Kconfig
+++ b/drivers/gpu/drm/imx/ipuv3/Kconfig
@@ -13,6 +13,7 @@ config DRM_IMX_PARALLEL_DISPLAY
 	tristate "Support for parallel displays"
 	depends on DRM_IMX
 	select DRM_BRIDGE
+	select DRM_BRIDGE_CONNECTOR
 	select DRM_PANEL_BRIDGE
 	select VIDEOMODE_HELPERS
 
@@ -31,6 +32,7 @@ config DRM_IMX_LDB
 	depends on COMMON_CLK
 	select MFD_SYSCON
 	select DRM_BRIDGE
+	select DRM_BRIDGE_CONNECTOR
 	select DRM_PANEL_BRIDGE
 	select DRM_IMX_LEGACY_BRIDGE
 	help
-- 
2.34.1

