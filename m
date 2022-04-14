Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB5D1501229
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 17:07:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E442410FE88;
	Thu, 14 Apr 2022 15:07:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6189510FE88;
 Thu, 14 Apr 2022 15:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649948832; x=1681484832;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8vmTx1OizhaguRcHGHNxImegq4Mt6oI17yLOPReDH2s=;
 b=ISVm7+3y7RFtrb9ub5duInaX9lE2flMMuIvJNjOclXo6LfBvK+/BBcLZ
 8179Ix9W2bNqlVxoM8Tb/WysQHPIGDvY8c0PlmfREL8yPZD/Jr18w88C0
 fMhYxHFNeGCr0cHQcxx+bi03MZvROeI/CRwpRY/pdKLTQpz1S8dM4tlQN
 lwYufI2KFA/n8EZtuF9BNV8R6vDunrjyjGTRZgsEm3Ky5vjn4vbmYrLdJ
 /4d3PS0tdYZvzaptieXHyCY8jSNQOSjYwXxwla7bq808LIVnzv694blBo
 DqVV+rBtMQzIZKbN3K51OnUq5MQGvLwUhU63KwQGafssOywGbnsi2Exxh A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10317"; a="323394491"
X-IronPort-AV: E=Sophos;i="5.90,260,1643702400"; d="scan'208";a="323394491"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 08:07:11 -0700
X-IronPort-AV: E=Sophos;i="5.90,260,1643702400"; d="scan'208";a="527427132"
Received: from nplaweck-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.149.236])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 08:07:09 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 01/19] drm/edid: reset display info in drm_add_edid_modes()
 for NULL edid
Date: Thu, 14 Apr 2022 18:06:44 +0300
Message-Id: <595358f27ca2abb29ce6eaf855e106ff19df87fa.1649948562.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1649948562.git.jani.nikula@intel.com>
References: <cover.1649948562.git.jani.nikula@intel.com>
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

If a NULL edid gets passed to drm_add_edid_modes(), we should probably
also reset the display info.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 324ce8467915..4758e78fad82 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -5721,6 +5721,7 @@ static int drm_edid_connector_update(struct drm_connector *connector,
 	u32 quirks;
 
 	if (edid == NULL) {
+		drm_reset_display_info(connector);
 		clear_eld(connector);
 		return 0;
 	}
-- 
2.30.2

