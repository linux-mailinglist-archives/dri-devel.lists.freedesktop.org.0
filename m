Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA9712A245
	for <lists+dri-devel@lfdr.de>; Tue, 24 Dec 2019 15:31:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D2A16E7EF;
	Tue, 24 Dec 2019 14:30:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8F3F6E04E
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2019 08:14:30 +0000 (UTC)
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 2C90B50C47FAF58CEBF8;
 Tue, 24 Dec 2019 16:14:26 +0800 (CST)
Received: from linux-lmwb.huawei.com (10.175.103.112) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.439.0; Tue, 24 Dec 2019 16:14:23 +0800
From: Ma Feng <mafeng.ma@huawei.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 3/3] drm/i915: use true, false for bool variable in intel_crt.c
Date: Tue, 24 Dec 2019 16:15:15 +0800
Message-ID: <1577175315-93406-1-git-send-email-mafeng.ma@huawei.com>
X-Mailer: git-send-email 2.6.2
MIME-Version: 1.0
X-Originating-IP: [10.175.103.112]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 24 Dec 2019 14:29:55 +0000
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes coccicheck warning:

drivers/gpu/drm/i915/display/intel_crt.c:1066:1-28: WARNING: Assignment of 0/1 to bool variable
drivers/gpu/drm/i915/display/intel_crt.c:928:2-29: WARNING: Assignment of 0/1 to bool variable
drivers/gpu/drm/i915/display/intel_crt.c:443:2-29: WARNING: Assignment of 0/1 to bool variable

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Ma Feng <mafeng.ma@huawei.com>
---
 drivers/gpu/drm/i915/display/intel_crt.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_crt.c b/drivers/gpu/drm/i915/display/intel_crt.c
index b2b1336..8596eef 100644
--- a/drivers/gpu/drm/i915/display/intel_crt.c
+++ b/drivers/gpu/drm/i915/display/intel_crt.c
@@ -440,7 +440,7 @@ static bool intel_ironlake_crt_detect_hotplug(struct drm_connector *connector)
 		bool turn_off_dac = HAS_PCH_SPLIT(dev_priv);
 		u32 save_adpa;

-		crt->force_hotplug_required = 0;
+		crt->force_hotplug_required = false;

 		save_adpa = adpa = I915_READ(crt->adpa_reg);
 		DRM_DEBUG_KMS("trigger hotplug detect cycle: adpa=0x%x\n", adpa);
@@ -925,7 +925,7 @@ void intel_crt_reset(struct drm_encoder *encoder)
 		POSTING_READ(crt->adpa_reg);

 		DRM_DEBUG_KMS("crt adpa set to 0x%x\n", adpa);
-		crt->force_hotplug_required = 1;
+		crt->force_hotplug_required = true;
 	}

 }
@@ -1063,7 +1063,7 @@ void intel_crt_init(struct drm_i915_private *dev_priv)
 	/*
 	 * Configure the automatic hotplug detection stuff
 	 */
-	crt->force_hotplug_required = 0;
+	crt->force_hotplug_required = false;

 	/*
 	 * TODO: find a proper way to discover whether we need to set the the
--
2.6.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
