Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7566622A6
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 11:13:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC4C510E3B0;
	Mon,  9 Jan 2023 10:12:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1040D10E3AC;
 Mon,  9 Jan 2023 10:12:48 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id ED73776135;
 Mon,  9 Jan 2023 10:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1673259165; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YQI7uNH51mVgCoFO30VSUwPGDKzUPsk/sEGWkrua4mk=;
 b=WG2GJ/3hjr24e7J/s5k1uVPxvzJSuWWU3HyVuYX608hKId92xTD/UueSJvM+nCPOkqceUo
 RNe6/HD4IFzJfwpUcDb+37ybSCLlcvuosHah9jbqEHkvpHgQE4UC5G3167bvTl4craeZuJ
 Fy3xwBntDeQr/7Y+fZPxOgoaCzErTo8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1673259165;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YQI7uNH51mVgCoFO30VSUwPGDKzUPsk/sEGWkrua4mk=;
 b=EzAZXIjP6G24mixJQuQnCxVf6Qx0hZqxnuUZb2uU4xcZcNFGx8+tT8QfKPg749spvPwCM6
 WVI7YFfrPqQ19OBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A65F613583;
 Mon,  9 Jan 2023 10:12:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id cGOqJ53ou2O3EwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 09 Jan 2023 10:12:45 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 patrik.r.jakobsson@gmail.com, thierry.reding@gmail.com, sam@ravnborg.org,
 f.fainelli@gmail.com
Subject: [PATCH 3/5] drm/amdgpu: Do not include <linux/fb.h>
Date: Mon,  9 Jan 2023 11:12:41 +0100
Message-Id: <20230109101243.26995-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230109101243.26995-1-tzimmermann@suse.de>
References: <20230109101243.26995-1-tzimmermann@suse.de>
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove unnecessary include statements for <linux/fb.h>. No functional
changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c                         | 1 -
 drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c             | 1 -
 drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c           | 1 -
 drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_processpptables.c | 1 -
 drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega12_hwmgr.c           | 1 -
 drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega12_processpptables.c | 1 -
 drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_hwmgr.c           | 1 -
 drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_processpptables.c | 1 -
 drivers/gpu/drm/amd/pm/powerplay/smumgr/ci_smumgr.c             | 1 -
 9 files changed, 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 1353ffd08988..ebc6e6cbe2ab 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -39,7 +39,6 @@
 #include <linux/mmu_notifier.h>
 #include <linux/suspend.h>
 #include <linux/cc_platform.h>
-#include <linux/fb.h>
 #include <linux/dynamic_debug.h>
 
 #include "amdgpu.h"
diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c
index 7ef7e81525a3..d6edd83f67c6 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c
@@ -22,7 +22,6 @@
  */
 #include "pp_debug.h"
 #include <linux/delay.h>
-#include <linux/fb.h>
 #include <linux/module.h>
 #include <linux/pci.h>
 #include <linux/slab.h>
diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c
index c8c9fb827bda..733cac4600ff 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c
@@ -22,7 +22,6 @@
  */
 
 #include <linux/delay.h>
-#include <linux/fb.h>
 #include <linux/module.h>
 #include <linux/pci.h>
 #include <linux/slab.h>
diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_processpptables.c b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_processpptables.c
index 95b988823f50..bb90d8abf79b 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_processpptables.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_processpptables.c
@@ -23,7 +23,6 @@
 #include <linux/module.h>
 #include <linux/pci.h>
 #include <linux/slab.h>
-#include <linux/fb.h>
 
 #include "vega10_processpptables.h"
 #include "ppatomfwctrl.h"
diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega12_hwmgr.c b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega12_hwmgr.c
index a2f4d6773d45..c73693dc4c09 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega12_hwmgr.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega12_hwmgr.c
@@ -22,7 +22,6 @@
  */
 
 #include <linux/delay.h>
-#include <linux/fb.h>
 #include <linux/module.h>
 #include <linux/slab.h>
 
diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega12_processpptables.c b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega12_processpptables.c
index bd54fbd393b9..89148f73b514 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega12_processpptables.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega12_processpptables.c
@@ -22,7 +22,6 @@
  */
 #include <linux/module.h>
 #include <linux/slab.h>
-#include <linux/fb.h>
 
 #include "vega12/smu9_driver_if.h"
 #include "vega12_processpptables.h"
diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_hwmgr.c b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_hwmgr.c
index b30684c84e20..33f3d9792181 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_hwmgr.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_hwmgr.c
@@ -22,7 +22,6 @@
  */
 
 #include <linux/delay.h>
-#include <linux/fb.h>
 #include <linux/module.h>
 #include <linux/slab.h>
 
diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_processpptables.c b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_processpptables.c
index 1f9082539457..79c817752a33 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_processpptables.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_processpptables.c
@@ -22,7 +22,6 @@
  */
 #include <linux/module.h>
 #include <linux/slab.h>
-#include <linux/fb.h>
 
 #include "smu11_driver_if.h"
 #include "vega20_processpptables.h"
diff --git a/drivers/gpu/drm/amd/pm/powerplay/smumgr/ci_smumgr.c b/drivers/gpu/drm/amd/pm/powerplay/smumgr/ci_smumgr.c
index 5ca3c422f7d4..5c3f42d97f69 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/smumgr/ci_smumgr.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/smumgr/ci_smumgr.c
@@ -22,7 +22,6 @@
  */
 #include <linux/module.h>
 #include <linux/slab.h>
-#include <linux/fb.h>
 #include "linux/delay.h"
 #include <linux/types.h>
 #include <linux/pci.h>
-- 
2.39.0

