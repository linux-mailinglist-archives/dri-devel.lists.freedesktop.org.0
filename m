Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC185904FA9
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 11:54:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4C7010E806;
	Wed, 12 Jun 2024 09:54:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dv4Ker3I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D60010E806;
 Wed, 12 Jun 2024 09:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718186068; x=1749722068;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gl4jzPmPSJyy0AEG0RNugaL3+9KDXrafHuHGjKc4JQU=;
 b=dv4Ker3IbDqV+9WsjAO8XiRozL8MMiiuil+0uQS97+EuLIzbZXYOGTEu
 ZfnZIQb9LJpNKmgqLDaRdK6oorrKOiIbZvwUMM7Od5L4q3ZnQjrQMWpCA
 7xUZYj+l4JKy3B8UC/+JRbciLWn9IH/pWy305MekBMu5scwsnvRAG5BoN
 C0XmoZbZb+mgeCFjghZKF79cnZ06yaVX4FwF+Pv8dkYdR/lcaeUqSLYes
 6NQEtC8eSw70pXPQUtfLc2CYqgtzZ8FW45D0NzqTrG26CXz5Dpv7rOREK
 T4NOaPBTM8/DWSUGNh1RzZ2IjQZOBzMxAWjiYrgen8bRqnPLXjbezC8VJ g==;
X-CSE-ConnectionGUID: HtB0ifhdTXmQoUN84A7o9A==
X-CSE-MsgGUID: /VzfgCG7TYKCeYF/Z+Rw8Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="15068913"
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000"; d="scan'208";a="15068913"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 02:54:28 -0700
X-CSE-ConnectionGUID: nzg2vxkAROiYtC91SyiMTw==
X-CSE-MsgGUID: MwLYwwX5Sy+urYj10J9c8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000"; d="scan'208";a="40441623"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by orviesa007.jf.intel.com with ESMTP; 12 Jun 2024 02:54:26 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: mitulkumar.ajitkumar.golani@intel.com, ankit.k.nautiyal@intel.com,
 suraj.kandpal@intel.com, jani.nikula@linux.intel.com,
 rodrigo.vivi@intel.com, sfr@canb.auug.org.au
Subject: [PATCH 1/3] drm/dp: Describe target_rr_divider in struct drm_dp_as_sdp
Date: Wed, 12 Jun 2024 15:24:31 +0530
Message-ID: <20240612095433.323342-2-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240612095433.323342-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20240612095433.323342-1-mitulkumar.ajitkumar.golani@intel.com>
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

Describe newly added parameter target_rr_divider in struct
drm_dp_as_sdp.

Fixes: a20c6d954d75 ("drm/dp: Add refresh rate divider to struct representing AS SDP")
Cc: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Cc: Arun R Murthy <arun.r.murthy@intel.com>
Cc: Suraj Kandpal <suraj.kandpal@intel.com>
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>

Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
---
 include/drm/display/drm_dp_helper.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index ea03e1dd26ba..7f2567fa230d 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -112,6 +112,7 @@ struct drm_dp_vsc_sdp {
  * @target_rr: Target Refresh
  * @duration_incr_ms: Successive frame duration increase
  * @duration_decr_ms: Successive frame duration decrease
+ * @target_rr_divider: Target refresh rate divider
  * @mode: Adaptive Sync Operation Mode
  */
 struct drm_dp_as_sdp {
-- 
2.45.2

