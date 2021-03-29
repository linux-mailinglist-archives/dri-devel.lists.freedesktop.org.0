Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DECA34D16C
	for <lists+dri-devel@lfdr.de>; Mon, 29 Mar 2021 15:38:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 986886E42F;
	Mon, 29 Mar 2021 13:38:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02D436E42F;
 Mon, 29 Mar 2021 13:38:14 +0000 (UTC)
IronPort-SDR: wqt1S17Vp9GAq5qq3afPUQ4QH9M/UoBMooRxKkpgzbeNdzbGAJWLCgTP5D/0xE5KyiKMn/txbd
 NRITKTKXB9qw==
X-IronPort-AV: E=McAfee;i="6000,8403,9938"; a="170950606"
X-IronPort-AV: E=Sophos;i="5.81,287,1610438400"; d="scan'208";a="170950606"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2021 06:38:14 -0700
IronPort-SDR: u7dgALWr2MsT+Onkue5apwYcOrLTd4ln2mYT0NQ8KkYVcd6d3WxxpBd39kbKwwTmMS32jOIoyV
 F92YW002hJ/Q==
X-IronPort-AV: E=Sophos;i="5.81,287,1610438400"; d="scan'208";a="444782447"
Received: from auchter-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.56.199])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2021 06:38:12 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 8/8] drm/displayid: rename displayid_hdr to displayid_header
Date: Mon, 29 Mar 2021 16:37:22 +0300
Message-Id: <ce083bd2789c7e22a91710726162287db88e3f6c.1617024940.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617024940.git.jani.nikula@intel.com>
References: <cover.1617024940.git.jani.nikula@intel.com>
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
Cc: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Avoid any confusion with High Dynamic Range. No functional changes.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_displayid.c | 10 +++++-----
 include/drm/drm_displayid.h     |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_displayid.c b/drivers/gpu/drm/drm_displayid.c
index e0b9e58a9dc8..32da557b960f 100644
--- a/drivers/gpu/drm/drm_displayid.c
+++ b/drivers/gpu/drm/drm_displayid.c
@@ -11,9 +11,9 @@ static int validate_displayid(const u8 *displayid, int length, int idx)
 {
 	int i, dispid_length;
 	u8 csum = 0;
-	const struct displayid_hdr *base;
+	const struct displayid_header *base;
 
-	base = (const struct displayid_hdr *)&displayid[idx];
+	base = (const struct displayid_header *)&displayid[idx];
 
 	DRM_DEBUG_KMS("base revision 0x%x, length %d, %d %d\n",
 		      base->rev, base->bytes, base->prod_id, base->ext_count);
@@ -38,7 +38,7 @@ static const u8 *drm_find_displayid_extension(const struct edid *edid,
 					      int *ext_index)
 {
 	const u8 *displayid = drm_find_edid_extension(edid, DISPLAYID_EXT, ext_index);
-	const struct displayid_hdr *base;
+	const struct displayid_header *base;
 	int ret;
 
 	if (!displayid)
@@ -52,7 +52,7 @@ static const u8 *drm_find_displayid_extension(const struct edid *edid,
 	if (ret)
 		return NULL;
 
-	base = (const struct displayid_hdr *)&displayid[*idx];
+	base = (const struct displayid_header *)&displayid[*idx];
 	*length = *idx + sizeof(*base) + base->bytes;
 
 	return displayid;
@@ -118,7 +118,7 @@ __displayid_iter_next(struct displayid_iter *iter)
 			return NULL;
 		}
 
-		iter->idx += sizeof(struct displayid_hdr);
+		iter->idx += sizeof(struct displayid_header);
 
 		block = displayid_iter_block(iter);
 		if (block)
diff --git a/include/drm/drm_displayid.h b/include/drm/drm_displayid.h
index 10ee863f1734..ec64d141f578 100644
--- a/include/drm/drm_displayid.h
+++ b/include/drm/drm_displayid.h
@@ -56,7 +56,7 @@ struct edid;
 #define PRODUCT_TYPE_REPEATER 5
 #define PRODUCT_TYPE_DIRECT_DRIVE 6
 
-struct displayid_hdr {
+struct displayid_header {
 	u8 rev;
 	u8 bytes;
 	u8 prod_id;
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
