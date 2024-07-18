Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2DFE93469D
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2024 05:09:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A743610E343;
	Thu, 18 Jul 2024 03:09:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 302 seconds by postgrey-1.36 at gabe;
 Thu, 18 Jul 2024 03:08:58 UTC
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBD4A10E343
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2024 03:08:58 +0000 (UTC)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Thu, 18 Jul
 2024 11:03:52 +0800
Received: from twmbx02.aspeed.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Thu, 18 Jul 2024 11:03:52 +0800
From: Jammy Huang <jammy_huang@aspeedtech.com>
To: <tzimmermann@suse.de>, <jfalempe@redhat.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <airlied@redhat.com>, <airlied@gmail.com>, <daniel@ffwll.ch>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/ast: Fix black screen after resume
Date: Thu, 18 Jul 2024 11:03:52 +0800
Message-ID: <20240718030352.654155-1-jammy_huang@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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

Suspend will disable pcie device. Thus, resume should do full hw
initialization again.
Add some APIs to ast_drm_thaw() before ast_post_gpu() to fix the issue.

Fixes: 5b71707dd13 ("drm/ast: Enable and unlock device access early during init")
Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
---
 drivers/gpu/drm/ast/ast_drv.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/ast/ast_drv.c b/drivers/gpu/drm/ast/ast_drv.c
index f8c49ba68e78..45a9c7bf49c8 100644
--- a/drivers/gpu/drm/ast/ast_drv.c
+++ b/drivers/gpu/drm/ast/ast_drv.c
@@ -391,6 +391,11 @@ static int ast_drm_freeze(struct drm_device *dev)
 
 static int ast_drm_thaw(struct drm_device *dev)
 {
+	struct ast_device *ast = to_ast_device(dev);
+
+	ast_enable_vga(ioregs);
+	ast_open_key(ioregs);
+	ast_enable_mmio(dev, ioregs);
 	ast_post_gpu(dev);
 
 	return drm_mode_config_helper_resume(dev);

base-commit: e9d22f7a6655941fc8b2b942ed354ec780936b3e
prerequisite-patch-id: a03a33902f33bcc38091e2cdce9d79f630464c30
prerequisite-patch-id: 505779a1e2094f2ee2f2a55ad44aac5cd1d5342f
-- 
2.25.1

