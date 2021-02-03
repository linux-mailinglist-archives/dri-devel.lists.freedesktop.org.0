Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59AA130D9FB
	for <lists+dri-devel@lfdr.de>; Wed,  3 Feb 2021 13:42:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EE846EAA0;
	Wed,  3 Feb 2021 12:42:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 050AE6EA88;
 Wed,  3 Feb 2021 12:42:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 90AB4AD78;
 Wed,  3 Feb 2021 12:42:43 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH 2/2] drm/amd/display: Add aux_backlight module option
Date: Wed,  3 Feb 2021 13:42:41 +0100
Message-Id: <20210203124241.8512-3-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210203124241.8512-1-tiwai@suse.de>
References: <20210203124241.8512-1-tiwai@suse.de>
MIME-Version: 1.0
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
Cc: Leo Li <sunpeng.li@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There seem devices that don't work with the aux channel backlight
control.  For allowing such users to test with the other backlight
control method, provide a new module option, aux_backlight, to specify
enabling or disabling the aux backport support explicitly.  As
default, the aux support is detected by the hardware capability.

BugLink: https://bugzilla.opensuse.org/show_bug.cgi?id=1180749
BugLink: https://gitlab.freedesktop.org/drm/amd/-/issues/1438
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h               | 1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c           | 4 ++++
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 3 +++
 3 files changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index 5993dd0fdd8e..4793cd5e69f9 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -179,6 +179,7 @@ extern uint amdgpu_smu_memory_pool_size;
 extern uint amdgpu_dc_feature_mask;
 extern uint amdgpu_dc_debug_mask;
 extern uint amdgpu_dm_abm_level;
+extern int amdgpu_aux_backlight;
 extern struct amdgpu_mgpu_info mgpu_info;
 extern int amdgpu_ras_enable;
 extern uint amdgpu_ras_mask;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 7169fb5e3d9c..5b66822da954 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -777,6 +777,10 @@ uint amdgpu_dm_abm_level;
 MODULE_PARM_DESC(abmlevel, "ABM level (0 = off (default), 1-4 = backlight reduction level) ");
 module_param_named(abmlevel, amdgpu_dm_abm_level, uint, 0444);
 
+int amdgpu_aux_backlight = -1;
+MODULE_PARM_DESC(aux_backlight, "Aux backlight control (0 = off, 1 = on, default auto)");
+module_param_named(aux_backlight, amdgpu_aux_backlight, bint, 0444);
+
 /**
  * DOC: tmz (int)
  * Trusted Memory Zone (TMZ) is a method to protect data being written
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index fb62886ae013..6ad384ef61b8 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -2209,6 +2209,9 @@ static void update_connector_ext_caps(struct amdgpu_dm_connector *aconnector)
 	    caps->ext_caps->bits.hdr_aux_backlight_control == 1)
 		caps->aux_support = true;
 
+	if (amdgpu_aux_backlight >= 0)
+		caps->aux_support = amdgpu_aux_backlight;
+
 	/* From the specification (CTA-861-G), for calculating the maximum
 	 * luminance we need to use:
 	 *	Luminance = 50*2**(CV/32)
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
