Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D40F71598D
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 11:09:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE46B10E37F;
	Tue, 30 May 2023 09:09:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8348910E387;
 Tue, 30 May 2023 09:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685437767; x=1716973767;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gp5i1XUPWwbu/ObsAVq3Y0DeWLJx/RgdaIYVPC3uyu4=;
 b=EZN7W19ZzFa20rc9dA06PBe6Cc+YOuMK+pi1nENlLMC7H4dBx8gLa0be
 bsKo3ePzDvPjZgazo+454J1VwWtVmfFJU5HQYg6PNmU9TuItDfxLGXfrR
 5p8tPvKZ9oKyiUj7f99qD/78yGFeHNFj+DF9d4U+nquMLxDoXl8y7xfda
 npx+9c1ITW8wLIoI3atCS5r32c9GE92IoWlFGIjpyCy6T2oiLF4XDX02W
 qecXdhC4wDJ2TpFcDr30n0jyf0HMC9LqORLVfXNByFj5eNo2Fplmi4ECP
 hWnbQpvz3hj+8l3Fq7x7ktn85BmHowhT82DjMfl5X0/X5fAnzHoKOQZlf g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="354872638"
X-IronPort-AV: E=Sophos;i="6.00,203,1681196400"; d="scan'208";a="354872638"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 02:09:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="683875232"
X-IronPort-AV: E=Sophos;i="6.00,203,1681196400"; d="scan'208";a="683875232"
Received: from kleve-mobl1.ger.corp.intel.com (HELO localhost) ([10.252.47.8])
 by orsmga006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2023 02:09:25 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 11/13] drm/edid: make drm_edid_duplicate() safe to call
 with NULL parameter
Date: Tue, 30 May 2023 12:08:23 +0300
Message-Id: <1ae8923d39a5abd0260fdf7f9cc54c5e046e70d3.1685437501.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1685437500.git.jani.nikula@intel.com>
References: <cover.1685437500.git.jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com, Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It's a bit tedious to check for NULL before calling
drm_edid_duplicate(). Make it handle NULL parameter graciously.

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 941f3d53a701..e0dbd9140726 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -2881,6 +2881,9 @@ EXPORT_SYMBOL(drm_edid_read_switcheroo);
  */
 struct edid *drm_edid_duplicate(const struct edid *edid)
 {
+	if (!edid)
+		return NULL;
+
 	return kmemdup(edid, edid_size(edid), GFP_KERNEL);
 }
 EXPORT_SYMBOL(drm_edid_duplicate);
-- 
2.39.2

