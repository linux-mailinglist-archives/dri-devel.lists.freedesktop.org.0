Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3B551D54F
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 12:11:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE4B410FA14;
	Fri,  6 May 2022 10:11:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8F9A10FA3A;
 Fri,  6 May 2022 10:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651831898; x=1683367898;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/+KMHxl4L3fDlq6m7JxdAbmAwzPUPOJjHzGu6KmIaJw=;
 b=COM9mRcp2pTI3GNJc40glgO3V4R9snrpTuEGThk1yw5Ps7JiftcN9rKO
 HkNQ0e9/fHMlqyBQ/8FZzojDvGImVYaaJOGZl++kC1FohAYt2WXfaS2Ql
 /zNi03e7q2+YY/D0s1NepkaSX/K/0/tRgwACCLvJPIrFeteym126xqAas
 L0BD6Maf2uIEfbRr1N6mfUhRW3LPkQViIKRGNK0p91X0+iRaKTRCI6SKN
 J7QS/L/VZn+aF22RpEFZqAJJiBdJtiUDd79B5CEU3mRz4hacJ5PqXgMen
 /kO9oOfhywwqjfw6pLtr3GgLEctNZSSnaVteOt+iSP+aELIAfe76ZzDuk w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10338"; a="248331639"
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="248331639"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2022 03:11:38 -0700
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="654646910"
Received: from psikora-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.157.88])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2022 03:11:36 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 11/25] drm/edid: convert drm_gtf_modes_for_range() to drm_edid
Date: Fri,  6 May 2022 13:10:18 +0300
Message-Id: <e2b80d52b972fb5fb9d7e5ab0dc63ed7faeaa02e.1651830938.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1651830938.git.jani.nikula@intel.com>
References: <cover.1651830938.git.jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We'll need to propagate drm_edid everywhere.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 88bb6c7ac97c..3931c3318cf7 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -3138,9 +3138,9 @@ void drm_mode_fixup_1366x768(struct drm_display_mode *mode)
 	}
 }
 
-static int
-drm_gtf_modes_for_range(struct drm_connector *connector, const struct edid *edid,
-			const struct detailed_timing *timing)
+static int drm_gtf_modes_for_range(struct drm_connector *connector,
+				   const struct drm_edid *drm_edid,
+				   const struct detailed_timing *timing)
 {
 	int i, modes = 0;
 	struct drm_display_mode *newmode;
@@ -3154,7 +3154,7 @@ drm_gtf_modes_for_range(struct drm_connector *connector, const struct edid *edid
 			return modes;
 
 		drm_mode_fixup_1366x768(newmode);
-		if (!mode_in_range(newmode, edid, timing) ||
+		if (!mode_in_range(newmode, drm_edid->edid, timing) ||
 		    !valid_inferred_mode(connector, newmode)) {
 			drm_mode_destroy(dev, newmode);
 			continue;
@@ -3218,7 +3218,7 @@ do_inferred_modes(const struct detailed_timing *timing, void *c)
 	case 0x02: /* secondary gtf, XXX could do more */
 	case 0x00: /* default gtf */
 		closure->modes += drm_gtf_modes_for_range(closure->connector,
-							  closure->drm_edid->edid,
+							  closure->drm_edid,
 							  timing);
 		break;
 	case 0x04: /* cvt, only in 1.4+ */
-- 
2.30.2

