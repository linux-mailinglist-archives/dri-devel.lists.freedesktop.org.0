Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E83A94A7FA8
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 08:13:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D88E110EAF9;
	Thu,  3 Feb 2022 07:13:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E23E310EAF9
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Feb 2022 07:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643872409; x=1675408409;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=X7ghyglDa70r3RhXc5kH04RplSTIl9G4nspSQejw+hs=;
 b=WOybl1WMwJLgXzkte/YzCXHD3xKHRXb2jmT4sICXUNyq3YM+AcpulhGS
 hJ2gizqthygkFmIzrNCIxzBreMG/2ovkGc4ND3+Xnmc4qGWilyC3lzHNT
 9q79OpmIT0A5iEFtYbIWhVEbHNdLiTLmE6FCseGvAnW5TblP5RK/fxvTh
 tfCb1P1+Dij5Q/MlJEG1PkqKwjcuSJDGhulH56zAFJYJSxr77699g1//s
 xQhu6oMnpaGpjES3t6idms9aRae92paWLhPlSmbf0xnYLEBL4pcm5tACh
 IzbspnEbrYeBA1xOzc2fSU2Ji+Ug0qnzgyKoq/iEduxFMndByWuM1MFYN Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10246"; a="228056997"
X-IronPort-AV: E=Sophos;i="5.88,339,1635231600"; d="scan'208";a="228056997"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2022 23:13:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,339,1635231600"; d="scan'208";a="523792340"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.151])
 by orsmga007.jf.intel.com with SMTP; 02 Feb 2022 23:13:26 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 03 Feb 2022 09:13:26 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/modes: Fix drm_mode_validate_size() docs
Date: Thu,  3 Feb 2022 09:13:26 +0200
Message-Id: <20220203071326.23681-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

drm_mode_validate_size() does *not* modify the passed in mode's
status (in fact it is passed in as const). Also this operates
on a single mode, so the reference to some list is just confusing.
Remove the nonsense docs.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_modes.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
index 1c72208d8133..425a56a976a1 100644
--- a/drivers/gpu/drm/drm_modes.c
+++ b/drivers/gpu/drm/drm_modes.c
@@ -1136,16 +1136,14 @@ EXPORT_SYMBOL(drm_mode_validate_driver);
 /**
  * drm_mode_validate_size - make sure modes adhere to size constraints
  * @mode: mode to check
  * @maxX: maximum width
  * @maxY: maximum height
  *
- * This function is a helper which can be used to validate modes against size
- * limitations of the DRM device/connector. If a mode is too big its status
- * member is updated with the appropriate validation failure code. The list
- * itself is not changed.
+ * This function is a helper which can be used to validate
+ * modes against size limitations of the DRM device/connector.
  *
  * Returns:
  * The mode status
  */
 enum drm_mode_status
 drm_mode_validate_size(const struct drm_display_mode *mode,
-- 
2.34.1

