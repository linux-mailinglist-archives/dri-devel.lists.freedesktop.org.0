Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3232F4BB63E
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 11:05:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 450DB10EED6;
	Fri, 18 Feb 2022 10:05:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 595A110EED6;
 Fri, 18 Feb 2022 10:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645178690; x=1676714690;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RfgRKOzLfZ7MsRVYuRN9BwzJJrL2PPqZYwrlDV3285w=;
 b=OTHYvoGj59aPi5uh1CXhE2wpHE/Fm89ZRUf32wPrM7cUV7Du68NUSe7u
 Zw6Pmzh1HgQhDF/IRf0j5+FeenVFNwMmarbU1wKwFjHVPbdDaKAoTgvFc
 TFWpBVW2sOYwVafQRjGB+vo8pj7FQuVlhqkkxjDtOxfaS2o3Wx9jfPUoA
 MSPXzYv/pc40mx5muTcaNZZ/S1jy3qdgqc7ttZgWdmT5NWY1+IrEHkHP2
 2P9eSyhM2nBVS1/B+F7vDqCiCST/FtL/TdHNsxi4OptAdxBFlb8hJAfOe
 Ac64VtnAFykZhxzsW/cpBUM1pf2VsqlV0WLOc/mR2WL4csT1G5klGw9N7 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10261"; a="250853461"
X-IronPort-AV: E=Sophos;i="5.88,378,1635231600"; d="scan'208";a="250853461"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2022 02:04:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,378,1635231600"; d="scan'208";a="541854992"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.151])
 by fmsmga007.fm.intel.com with SMTP; 18 Feb 2022 02:04:47 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 18 Feb 2022 12:04:46 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 09/22] drm/imx: Use drm_mode_duplicate()
Date: Fri, 18 Feb 2022 12:03:50 +0200
Message-Id: <20220218100403.7028-10-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220218100403.7028-1-ville.syrjala@linux.intel.com>
References: <20220218100403.7028-1-ville.syrjala@linux.intel.com>
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
Cc: intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Replace the hand rolled drm_mode_duplicate() with the
real thing.

@is_dup@
@@
drm_mode_duplicate(...)
{ ... }

@depends on !is_dup@
expression dev, oldmode;
identifier newmode;
@@
- newmode = drm_mode_create(dev);
+ newmode = drm_mode_duplicate(dev, oldmode);
  ...
- drm_mode_copy(newmode, oldmode);

Cc: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/imx/imx-ldb.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/imx/imx-ldb.c b/drivers/gpu/drm/imx/imx-ldb.c
index e5078d03020d..c8cf819f39ce 100644
--- a/drivers/gpu/drm/imx/imx-ldb.c
+++ b/drivers/gpu/drm/imx/imx-ldb.c
@@ -150,10 +150,9 @@ static int imx_ldb_connector_get_modes(struct drm_connector *connector)
 	if (imx_ldb_ch->mode_valid) {
 		struct drm_display_mode *mode;
 
-		mode = drm_mode_create(connector->dev);
+		mode = drm_mode_duplicate(connector->dev, &imx_ldb_ch->mode);
 		if (!mode)
 			return -EINVAL;
-		drm_mode_copy(mode, &imx_ldb_ch->mode);
 		mode->type |= DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
 		drm_mode_probed_add(connector, mode);
 		num_modes++;
-- 
2.34.1

