Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C704EB388
	for <lists+dri-devel@lfdr.de>; Tue, 29 Mar 2022 20:42:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD08D10E627;
	Tue, 29 Mar 2022 18:42:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F1CB10E8A6;
 Tue, 29 Mar 2022 18:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648579374; x=1680115374;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VqXJmAw+gWYqx8dPtvcyNNk4CkGCYM1KBOisovvYHug=;
 b=MC+AA2l5bmoaublaTBTD41ySlLj1i/K/R9NsPykz28s1wwxM4TsmoMx1
 YxfAjWKmCRt33lq1UfKS2Qg8IsHUp70nX0eJ7+np+5zlyDURG2CYOS2uw
 i5p0NtiBPRvshWrc05i7PeQaWagJTnQ+YGTGnWi1zD7Gr5GMyqFrWujLu
 X6eeCRCN1yK9wKg6RhiDhxTa2bJRyO2/MgGll0KRQfsEODaYHO0PMfwJu
 d2NG6gbNtV//idsYaNTNPIBZh5krHRmJ+fXry0fTc94GI8mtEpGGLj16c
 jO/wi2B60UZn0BZQtJ/lIgOVf/z8aXdO3o7p77t6uNQlGliCMATY3kVkZ A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10301"; a="259521600"
X-IronPort-AV: E=Sophos;i="5.90,220,1643702400"; d="scan'208";a="259521600"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2022 11:42:54 -0700
X-IronPort-AV: E=Sophos;i="5.90,220,1643702400"; d="scan'208";a="653180691"
Received: from dmendyk-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.63.121])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2022 11:42:52 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 06/12] drm/edid: split out edid_header_fix()
Date: Tue, 29 Mar 2022 21:42:13 +0300
Message-Id: <10c82b8582d8a706e0aaa9f24793b4c0861ac5c2.1648578814.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1648578814.git.jani.nikula@intel.com>
References: <cover.1648578814.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Give a name to the EDID header fixup instead of having an inline memcpy.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 422db8ae0ac1..481643751d10 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -1572,6 +1572,11 @@ static const u8 edid_header[] = {
 	0x00, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x00
 };
 
+static void edid_header_fix(void *edid)
+{
+	memcpy(edid, edid_header, sizeof(edid_header));
+}
+
 /**
  * drm_edid_header_is_valid - sanity check the header of the base EDID block
  * @raw_edid: pointer to raw base EDID block
@@ -1702,7 +1707,7 @@ bool drm_edid_block_valid(u8 *raw_edid, int block, bool print_bad_edid,
 			if (edid_corrupt)
 				*edid_corrupt = true;
 			DRM_DEBUG("Fixing EDID header, your hardware may be failing\n");
-			memcpy(raw_edid, edid_header, sizeof(edid_header));
+			edid_header_fix(raw_edid);
 		} else {
 			if (edid_corrupt)
 				*edid_corrupt = true;
-- 
2.30.2

