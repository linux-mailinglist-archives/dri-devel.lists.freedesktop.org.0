Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B19BCD07EA1
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 09:43:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D351710E833;
	Fri,  9 Jan 2026 08:43:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fGD9+j+R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB9AC10E840;
 Fri,  9 Jan 2026 08:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767948224; x=1799484224;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Qpzt9w3R8QXsnPxUSHzYivxJb0ESoAOu0hSpCn20puk=;
 b=fGD9+j+RsWO6QqmTFV5piPvBxSqF9ok/X2Ubkhh4f1Mqnj2wKWD2NAAz
 sqslvGMZhRSc90GXM4ZH4qaLmxZVrhuJVdxvEmg/MDKAn6iw95EECjvjp
 uIUTGUzq7ACUKyF8n6WGXMlByCU/v1xEQMlFYJLII1V2rVhIctqZX703H
 jyTqdW3NNAb8r834RnDqiRA/3bOnWubbeF/S+B/zNNw8A4GXY2C+RecsU
 ZJQSdH6zuHo05zW8UiqSTgg/wej7Ch63Scd0aILhSc8eMb3Q4rgUp/lru
 QXbYhEBgxOstK1vQyG7rMQENsxdMm5erSmMIO0dOgF7EzFkUrY6kmu4ZA g==;
X-CSE-ConnectionGUID: ZxNyxqMzSKW076VZ7zw3Sw==
X-CSE-MsgGUID: wIdz38uIQyu6sg3WNLf0Gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="69241462"
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; d="scan'208";a="69241462"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 00:43:43 -0800
X-CSE-ConnectionGUID: 9LoZI7GwSyeMk18qyQ6PRw==
X-CSE-MsgGUID: qEV0mj5NQCeXJyXb/bu5Hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; d="scan'208";a="240924606"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by orviesa001.jf.intel.com with ESMTP; 09 Jan 2026 00:43:40 -0800
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: harry.wentland@amd.com, jani.nikula@linux.intel.com,
 louis.chauvet@bootlin.com, mwen@igalia.com, contact@emersion.fr,
 alex.hung@amd.com, daniels@collabora.com, uma.shankar@intel.com,
 suraj.kandpal@intel.com, nfraprado@collabora.com,
 ville.syrjala@linux.intel.com, matthew.d.roper@intel.com
Subject: [PATCH v2 10/13] drm: Clean up colorop objects during mode_config
 cleanup
Date: Fri,  9 Jan 2026 13:47:25 +0530
Message-Id: <20260109081728.478844-11-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260109081728.478844-1-chaitanya.kumar.borah@intel.com>
References: <20260109081728.478844-1-chaitanya.kumar.borah@intel.com>
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

Tear down all registered drm_colorop objects during
drm_mode_config_cleanup() by invoking their destroy callbacks.

This ensures proper cleanup of color pipeline objects during DRM device
removal.

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
Reviewed-by: Alex Hung <alex.hung@amd.com>
---
 drivers/gpu/drm/drm_mode_config.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
index d12db9b0bab8..84ae8a23a367 100644
--- a/drivers/gpu/drm/drm_mode_config.c
+++ b/drivers/gpu/drm/drm_mode_config.c
@@ -524,6 +524,7 @@ void drm_mode_config_cleanup(struct drm_device *dev)
 	struct drm_property *property, *pt;
 	struct drm_property_blob *blob, *bt;
 	struct drm_plane *plane, *plt;
+	struct drm_colorop *colorop, *copt;
 
 	list_for_each_entry_safe(encoder, enct, &dev->mode_config.encoder_list,
 				 head) {
@@ -553,6 +554,11 @@ void drm_mode_config_cleanup(struct drm_device *dev)
 		drm_property_destroy(dev, property);
 	}
 
+	list_for_each_entry_safe(colorop, copt, &dev->mode_config.colorop_list,
+				 head) {
+		colorop->funcs->destroy(colorop);
+	}
+
 	list_for_each_entry_safe(plane, plt, &dev->mode_config.plane_list,
 				 head) {
 		plane->funcs->destroy(plane);
-- 
2.25.1

