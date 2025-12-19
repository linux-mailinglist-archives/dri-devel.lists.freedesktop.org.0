Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3F2CCEC1F
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 08:13:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE17110EEBA;
	Fri, 19 Dec 2025 07:13:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bXa0uOWu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B23910EE97;
 Fri, 19 Dec 2025 07:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766128423; x=1797664423;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aDUaxzyaaZyBBZ2Dt8T/CryhjJrs36yqer1siDErQk0=;
 b=bXa0uOWuwCTKixZUgy1NOocsjZPM5wtl0Kh0X5Lx3/TvoyM9GPfCvfeq
 am0o6FcmnK5UUB2aBImMiuNYneY7NlENULJTun5VO4ZmuwTCA12JMl/X9
 f7FzLvMnZcrNNMSI+kZi+/fXCSf1S4hT6CK5Q7j0se8zBSqpMnf56otxu
 HbwDjcFe93GgQtXEbGy6g4nGU4rnBW5xOP+uCXM+rtS31kwpHasnvCYQ8
 Vw/J5y4JLCgTlYKrJO/O0IuEnzRWBL5LRYoKNlwCz0FPH5JncaILd2IUQ
 0ES9TP/5Ceu3QjjoWTeLMfbnJfWzuNYYijdyjC/ooUN+k4Rm5CnAqMseR g==;
X-CSE-ConnectionGUID: HDpmJvxNSK+ctcrRlJBNEw==
X-CSE-MsgGUID: 8pdKfRmiRO6rR+3EY1hlbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="93562385"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="93562385"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 23:13:43 -0800
X-CSE-ConnectionGUID: 8SaxuJtERmuEj7xacv5quw==
X-CSE-MsgGUID: 8x3zQrljRFClRzwpbDfvdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="222209562"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by fmviesa002.fm.intel.com with ESMTP; 18 Dec 2025 23:13:39 -0800
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: harry.wentland@amd.com, jani.nikula@linux.intel.com,
 louis.chauvet@bootlin.com, mwen@igalia.com, contact@emersion.fr,
 alex.hung@amd.com, daniels@collabora.com, uma.shankar@intel.com,
 suraj.kandpal@intel.com, nfraprado@collabora.com,
 ville.syrjala@linux.intel.com, matthew.d.roper@intel.com
Subject: [PATCH 10/13] drm: Clean up colorop objects during mode_config cleanup
Date: Fri, 19 Dec 2025 12:26:11 +0530
Message-Id: <20251219065614.190834-11-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251219065614.190834-1-chaitanya.kumar.borah@intel.com>
References: <20251219065614.190834-1-chaitanya.kumar.borah@intel.com>
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

