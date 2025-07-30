Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F70B1686D
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jul 2025 23:46:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E27D10E6E8;
	Wed, 30 Jul 2025 21:46:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from unicom145.biz-email.net (unicom145.biz-email.net
 [210.51.26.145])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5654010E147
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 07:11:33 +0000 (UTC)
Received: from jtjnmail201603.home.langchao.com
 by unicom145.biz-email.net ((D)) with ASMTP (SSL) id 202507301511303437;
 Wed, 30 Jul 2025 15:11:30 +0800
Received: from localhost.localdomain.com (10.94.10.113) by
 jtjnmail201603.home.langchao.com (10.100.2.3) with Microsoft SMTP Server id
 15.1.2507.57; Wed, 30 Jul 2025 15:11:27 +0800
From: chuguangqing <chuguangqing@inspur.com>
To: <lkp@intel.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <simona@ffwll.ch>
CC: <llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 chuguangqing <chuguangqing@inspur.com>
Subject: [PATCH v2 1/1] gpu: drm: fix compilation errors in drm_vram_helper
Date: Wed, 30 Jul 2025 15:09:18 +0800
Message-ID: <20250730071002.2697-2-chuguangqing@inspur.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250730071002.2697-1-chuguangqing@inspur.com>
References: <202507300646.kTchyjvh-lkp@intel.com>
 <20250730071002.2697-1-chuguangqing@inspur.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.94.10.113]
tUid: 20257301511302ee24eee9004cca4580053c0ddbd2814
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com
X-Mailman-Approved-At: Wed, 30 Jul 2025 21:46:19 +0000
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

We encountered the following errors while compiling drm_vram_helper.ko

ERROR: modpost: "drm_gem_ttm_print_info" [drivers/gpu/drm/drm_vram_helper.ko] undefined!
ERROR: modpost: "drm_gem_ttm_mmap" [drivers/gpu/drm/drm_vram_helper.ko] undefined!

The functions drm_gem_ttm_mmap and drm_gem_ttm_print_info are defined in drm_gem_ttm_helper.c. This patch select CONFIG_DRM_TTM_HELPER on CONFIG_DRM_VRAM_HELPER to resolve the undefined symbol errors.

Signed-off-by: chuguangqing <chuguangqing@inspur.com>
---
 drivers/gpu/drm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index f7ea8e895c0c..01a314fdc9a8 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -226,6 +226,7 @@ config DRM_BUDDY
 config DRM_VRAM_HELPER
 	tristate
 	depends on DRM
+	select DRM_TTM_HELPER if DRM_VRAM_HELPER != n
 	help
 	  Helpers for VRAM memory management
 
-- 
2.43.5

