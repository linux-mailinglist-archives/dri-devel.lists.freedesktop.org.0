Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 978E3722516
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jun 2023 14:00:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 645B110E296;
	Mon,  5 Jun 2023 12:00:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 391EE10E292
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jun 2023 12:00:50 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 96F9262305;
 Mon,  5 Jun 2023 12:00:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 796E7C433D2;
 Mon,  5 Jun 2023 12:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685966449;
 bh=XPB0BbK3vhUlsT1QahX5H2dgsnI0TVn8UcxJ28yK8I0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sP0DdDfHi1HRVVjEKZgxYPsYymQBaH5AIJSIAzHxkK0x7LOYzT9Ks45Q+HatDzAlI
 GK3QxNoCVE2RrWseXFe1+yAvua1cJ9Ad9v6hARlwdkwWlbVyLQ6LfLRdviC7zevwvk
 +wiedI7I+HxWILXZWvwz1WSndqbFg1HC1l8AVIk4rz8ox7vQ8aojD69WiqEnL8rZPJ
 GGT0SvUtLVyp5WHCOXkWpvrYceZ6oVQQgPsweMw6orS06G4Kt5W7B4zvOg0SkV64bD
 cRAzjIQiqqIqyZBj4Hov9GEpIVQl7IMNWoeUrBDpiqHF9A+Xbr5wGfbi4eefXmsF4v
 vIG3Z5ZhtpuXw==
From: Masahiro Yamada <masahiroy@kernel.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v3 2/2] drm/bridge: imx: turn imx8{qm,
 qxp}-ldb into single-object modules
Date: Mon,  5 Jun 2023 21:00:21 +0900
Message-Id: <20230605120021.1774711-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230605120021.1774711-1-masahiroy@kernel.org>
References: <20230605120021.1774711-1-masahiroy@kernel.org>
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
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 Liu Ying <victor.liu@nxp.com>, Masahiro Yamada <masahiroy@kernel.org>,
 linux-kernel@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With the previous fix, these modules are built from a single C file.

Rename the source files so they match the module names.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Liu Ying <victor.liu@nxp.com>
---

(no changes since v1)

 drivers/gpu/drm/bridge/imx/Makefile                           | 4 ----
 drivers/gpu/drm/bridge/imx/{imx8qm-ldb-drv.c => imx8qm-ldb.c} | 0
 .../gpu/drm/bridge/imx/{imx8qxp-ldb-drv.c => imx8qxp-ldb.c}   | 0
 3 files changed, 4 deletions(-)
 rename drivers/gpu/drm/bridge/imx/{imx8qm-ldb-drv.c => imx8qm-ldb.c} (100%)
 rename drivers/gpu/drm/bridge/imx/{imx8qxp-ldb-drv.c => imx8qxp-ldb.c} (100%)

diff --git a/drivers/gpu/drm/bridge/imx/Makefile b/drivers/gpu/drm/bridge/imx/Makefile
index 5fc821278693..8e2ebf3399a1 100644
--- a/drivers/gpu/drm/bridge/imx/Makefile
+++ b/drivers/gpu/drm/bridge/imx/Makefile
@@ -1,10 +1,6 @@
 obj-$(CONFIG_DRM_IMX_LDB_HELPER) += imx-ldb-helper.o
-imx8qm-ldb-objs := imx8qm-ldb-drv.o
 obj-$(CONFIG_DRM_IMX8QM_LDB) += imx8qm-ldb.o
-
-imx8qxp-ldb-objs := imx8qxp-ldb-drv.o
 obj-$(CONFIG_DRM_IMX8QXP_LDB) += imx8qxp-ldb.o
-
 obj-$(CONFIG_DRM_IMX8QXP_PIXEL_COMBINER) += imx8qxp-pixel-combiner.o
 obj-$(CONFIG_DRM_IMX8QXP_PIXEL_LINK) += imx8qxp-pixel-link.o
 obj-$(CONFIG_DRM_IMX8QXP_PIXEL_LINK_TO_DPI) += imx8qxp-pxl2dpi.o
diff --git a/drivers/gpu/drm/bridge/imx/imx8qm-ldb-drv.c b/drivers/gpu/drm/bridge/imx/imx8qm-ldb.c
similarity index 100%
rename from drivers/gpu/drm/bridge/imx/imx8qm-ldb-drv.c
rename to drivers/gpu/drm/bridge/imx/imx8qm-ldb.c
diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-ldb-drv.c b/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
similarity index 100%
rename from drivers/gpu/drm/bridge/imx/imx8qxp-ldb-drv.c
rename to drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
-- 
2.39.2

