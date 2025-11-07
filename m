Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF92C3FA41
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 12:05:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F43710EA8D;
	Fri,  7 Nov 2025 11:05:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TxsiMR7y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06C6B10EA8E;
 Fri,  7 Nov 2025 11:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762513535; x=1794049535;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5PH28YcRXD5wNvg4+FVG6PhkbAiZiswS9TsmRz3IUY0=;
 b=TxsiMR7ybP+30+mBA8LeFZ75cQ6Yklulu89o1DIkCK357zETDAe2XXX5
 2zi/tWTXyqq4QWikQ99pRCPVSpPU2s5w2qYWnXsRbEl8tuwknzb7Itu9g
 jFbhOl7Lmp3XN//NkV1OCJPJcLAOBNjse6L2oUDbqGpJ1jeRFFR6vny8q
 HWgvRAnvZ1CXu3EWqerjTxiSZmsKbTo3AdVi1MOlUi0U6kd9Yj6E4ykQu
 5ouWGm6ytJ5BtxzM8NJIL7AGsg2CSQDRg/xFr7mDD9c9T6J2fTkHkp/23
 gXSQA2tGSldWNnUOkP/OC+7qpRHPUOxZK+8k0lq8G/uuQEXig+zBRQFEs Q==;
X-CSE-ConnectionGUID: e07lCwIGTBWIzOgyZ3oeMw==
X-CSE-MsgGUID: iwGDNn7qSrqnAZLRWYiQyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11605"; a="68500554"
X-IronPort-AV: E=Sophos;i="6.19,286,1754982000"; d="scan'208";a="68500554"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 03:05:35 -0800
X-CSE-ConnectionGUID: FonYHwMSS5+cUiOWKVwJMg==
X-CSE-MsgGUID: yDotElRsRRO70fxVfMubFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,286,1754982000"; d="scan'208";a="187317672"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.124])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 03:05:32 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 Zack Rusin <zack.rusin@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Subject: [PATCH 5/6] drm/vmwgfx: use drm_crtc_vblank_crtc()
Date: Fri,  7 Nov 2025 13:04:59 +0200
Message-ID: <5157c2e927676aad75348855cf7b6745cba90003.1762513240.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1762513240.git.jani.nikula@intel.com>
References: <cover.1762513240.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

We have drm_crtc_vblank_crtc() to get the struct drm_vblank_crtc pointer
for a crtc. Use it instead of poking at dev->vblank[] directly.

Cc: Zack Rusin <zack.rusin@broadcom.com>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_vkms.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_vkms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_vkms.c
index aec774fa4d7b..5abd7f5ad2db 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_vkms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_vkms.c
@@ -247,9 +247,8 @@ vmw_vkms_get_vblank_timestamp(struct drm_crtc *crtc,
 {
 	struct drm_device *dev = crtc->dev;
 	struct vmw_private *vmw = vmw_priv(dev);
-	unsigned int pipe = crtc->index;
 	struct vmw_display_unit *du = vmw_crtc_to_du(crtc);
-	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
+	struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
 
 	if (!vmw->vkms_enabled)
 		return false;
@@ -281,8 +280,7 @@ vmw_vkms_enable_vblank(struct drm_crtc *crtc)
 {
 	struct drm_device *dev = crtc->dev;
 	struct vmw_private *vmw = vmw_priv(dev);
-	unsigned int pipe = drm_crtc_index(crtc);
-	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
+	struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
 	struct vmw_display_unit *du = vmw_crtc_to_du(crtc);
 
 	if (!vmw->vkms_enabled)
-- 
2.47.3

