Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1ABB9B3B28
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 21:14:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA97C10E383;
	Mon, 28 Oct 2024 20:14:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="D8d5fJF9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13C8710E383
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 20:14:20 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id
 98e67ed59e1d1-2e2e6a1042dso3658021a91.2
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 13:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1730146460; x=1730751260;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/wMdSkztU7T8mABeBV/Ugq2DWDFLQWJ8jdwvrOSXq3Q=;
 b=D8d5fJF9TxiyX6u3ZDAYQ6DWu5VItiRAfGNFLYHtF/qzB55KoAcQxtoWDtOHYhdLK6
 /WSRjXr3WYS2T4yfa0Xlxk/pQ+ZFk+rRf9IIHd1CAHqdZ3QxSpsWsED23AXyV79mxOQK
 DunvajiZfhR3Yof0zVl0uLXa4uHpipeOay0Hk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730146460; x=1730751260;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/wMdSkztU7T8mABeBV/Ugq2DWDFLQWJ8jdwvrOSXq3Q=;
 b=eF0aPbWarYUTM5+5OKhqDBe+JbWWlx5yMTiEDXOmKnG7HSugAzynNbP2R1LzL2gNtw
 FQ32g7bRgQHcIxp+ltBKorRhnmLzxIYTRUuAr/ulmgMg4FdRtdq8TD10XWp7t9m/WYHN
 CkresaEZI4ZtTn7E5ms9shFFQLX6QUFwfx1/cKyrneTIjllAICf0rLtkAVPyJFcKdy1X
 OBODxbq21d6610LuEu46ea8f+nN7/rEJHS1hcOn9IGhht3zJxB+sVwqyflorxYfVyiSS
 4BrU6mk2sJEPQBb5Cago/PIrJY75roxfSLLL+ci7b287vRkYMMmmBbwNERKR25fVaYeo
 VAFg==
X-Gm-Message-State: AOJu0YxixU1mbRHcQHGe42bzHcjs/QchXv7EIuT7KeIGRky+dfCIODm3
 CigTE3L39orgEW4TnvmGoqGgg5PouDh4f394dsi+huLLeMCBSkdLuYQp3JER1GFccQVluHQWadr
 Ai5lqSb8tpxVqL6EP7UEcXyJ1if4GHMVLfJwvcQPKEslRuj7YgbDrx4ksaUaIKCYN2ka0vsX/YY
 ytMRKYBsUeDEOVnR9955cuTtoGy9M0czSsB4X6mxisPCgRobKdmg==
X-Google-Smtp-Source: AGHT+IGMKRkh1mfkyIAomTjiVrDwn/ikKJvhf1fL4ocakF+mISLornbXgrVop4rTyTuPg0lormM4Pw==
X-Received: by 2002:a17:90b:1d91:b0:2e5:e269:1b5a with SMTP id
 98e67ed59e1d1-2e8f11e9145mr9557699a91.41.1730146459578; 
 Mon, 28 Oct 2024 13:14:19 -0700 (PDT)
Received: from mtt-opossum.dhcp.broadcom.net ([192.19.144.250])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2e8e374998fsm7784248a91.45.2024.10.28.13.14.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2024 13:14:19 -0700 (PDT)
From: Ian Forbes <ian.forbes@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: bcm-kernel-feedback-list@broadcom.com, ian.forbes@broadcom.com,
 zack.rusin@broadcom.com, martin.krastev@broadcom.com,
 maaz.mombasawala@broadcom.com
Subject: [PATCH] drm/vmwgfx: Add common resolutions to the connector mode list
Date: Mon, 28 Oct 2024 15:14:12 -0500
Message-Id: <20241028201412.576163-1-ian.forbes@broadcom.com>
X-Mailer: git-send-email 2.34.1
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

We replaced our custom list of resolutions with the noedid list, which is
based on the VESA DMT standard, in the referenced fixes commit. The reason
for this was that the user can technically set any resolution they want by
using Autofit or the vmwgfxctl utility.

Unfortunately the Autofit feature is a global setting that is applied to
all VMs running in Workstation and some users preferred to set the mode
manually on certain VMs. Additionally the DMT standard does not include a
number of modern resolutions as it was last updated in 2013 and has since
been superseded.

This commit adds back some of the removed modes and adds some additional
common ones.

Fixes: 935f795045a6 ("drm/vmwgfx: Refactor drm connector probing for display modes")
Closes: https://bugs.launchpad.net/ubuntu/+source/linux/+bug/2081803
Signed-off-by: Ian Forbes <ian.forbes@broadcom.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c | 31 ++++++++++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
index f39bf992364d..879b78543dee 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
@@ -2681,6 +2681,16 @@ enum drm_mode_status vmw_connector_mode_valid(struct drm_connector *connector,
 	return MODE_OK;
 }
 
+/*
+ * Common modes not present in the VESA DMT standard or assigned a VIC.
+ */
+static struct {
+	int width;
+	int height;
+} common_modes[] = {	{2560, 1440}, // QHD
+			{3440, 1440}, // UWQHD
+			{3840, 2400}}; // WQUXGA
+
 /**
  * vmw_connector_get_modes - implements drm_connector_helper_funcs.get_modes callback
  *
@@ -2725,7 +2735,26 @@ int vmw_connector_get_modes(struct drm_connector *connector)
 		max_height = min(dev_priv->stdu_max_height, max_height);
 	}
 
-	num_modes = 1 + drm_add_modes_noedid(connector, max_width, max_height);
+	num_modes = 1;
+
+	mode = drm_display_mode_from_cea_vic(dev, 97); // 4K UHD 16:9
+	if (mode) {
+		drm_mode_probed_add(connector, mode);
+		num_modes++;
+	}
+
+	for (int i = 0; i < ARRAY_SIZE(common_modes); i++) {
+		mode = drm_cvt_mode(dev, common_modes[i].width,
+				    common_modes[i].height,
+				    60, true, false, false);
+		if (mode) {
+			mode->type |= DRM_MODE_TYPE_DRIVER;
+			drm_mode_probed_add(connector, mode);
+			num_modes++;
+		}
+	}
+
+	num_modes += drm_add_modes_noedid(connector, max_width, max_height);
 
 	return num_modes;
 }
-- 
2.34.1

