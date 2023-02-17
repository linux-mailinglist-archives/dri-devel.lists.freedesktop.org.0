Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 150EE69A940
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 11:46:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0664310EF56;
	Fri, 17 Feb 2023 10:46:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF90910EF53;
 Fri, 17 Feb 2023 10:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676630799; x=1708166799;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6gedM47B1VpdMC6HjcDfKK/3wme0b2lLN15fkB8wl7g=;
 b=TD7Jx1mtB9nacyk8n3bwcE/iiYDb/j4ULNUSSPNDMNHTD3PMNom3tRKj
 CZ49pBUVoLnfirPYT7DuTao2cLKlSp9IcLw7Io7QEUWQb9XuUv1a/qvvE
 wQGTm3F7ssWMzk3rKKK9sGW0FDNazGo3Rl9oD42JKjuQQR1UuafeVb3zt
 Q0/PxVkh4jMvx/3ilYTpztFHhf69Kdlo0yLRSbNWjGlDhHgndFMXrTnBg
 Uwy1JU+2ZTfEbCZ85C5VSn00tqFA7OKA1G5Q60ggNlhgnf7HQ/mEMtQ99
 koZXcs2sXfDwy9MzJ+ypCqd2n2q/H16mLC+K3H6WY3mnw9FxEH9g628YI A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="394437659"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; d="scan'208";a="394437659"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2023 02:46:38 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="759314650"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; d="scan'208";a="759314650"
Received: from akocherg-mobl1.ccr.corp.intel.com (HELO localhost)
 ([10.252.53.1])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2023 02:46:36 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Jani Nikula <jani.nikula@intel.com>,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 5/4] drm/edid: parse Tiled Display Topology Data Block for
 DisplayID 2.0
Date: Fri, 17 Feb 2023 12:46:27 +0200
Message-Id: <20230217104627.1360015-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1676580180.git.jani.nikula@intel.com>
References: <cover.1676580180.git.jani.nikula@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, Iaroslav Boliukin <iam@lach.pw>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently we only parse the Tiled Display Topology Data Block for
DisplayID structure version 1.2, but not 2.0. The contents seem to be
the same for both, so expand the parsing to structure version 2.0.

Note that DisplayID spec version is not the same as DisplayID structure
version; DisplayID 1.3 uses structure version 1.2, and DisplayID 2.0-2.1
use structure version 2.0. Lovely.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 03ad53a1ba82..ebab862b8b1a 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -7267,6 +7267,15 @@ static void drm_parse_tiled_block(struct drm_connector *connector,
 	}
 }
 
+static bool displayid_is_tiled_block(const struct displayid_iter *iter,
+				     const struct displayid_block *block)
+{
+	return (displayid_version(iter) == DISPLAY_ID_STRUCTURE_VER_12 &&
+		block->tag == DATA_BLOCK_TILED_DISPLAY) ||
+		(displayid_version(iter) == DISPLAY_ID_STRUCTURE_VER_20 &&
+		 block->tag == DATA_BLOCK_2_TILED_DISPLAY_TOPOLOGY);
+}
+
 static void _drm_update_tile_info(struct drm_connector *connector,
 				  const struct drm_edid *drm_edid)
 {
@@ -7277,7 +7286,7 @@ static void _drm_update_tile_info(struct drm_connector *connector,
 
 	displayid_iter_edid_begin(drm_edid, &iter);
 	displayid_iter_for_each(block, &iter) {
-		if (block->tag == DATA_BLOCK_TILED_DISPLAY)
+		if (displayid_is_tiled_block(&iter, block))
 			drm_parse_tiled_block(connector, block);
 	}
 	displayid_iter_end(&iter);
-- 
2.34.1

