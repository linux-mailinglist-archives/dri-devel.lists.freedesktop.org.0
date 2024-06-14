Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9CF9082EF
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 06:26:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B7FD10EC24;
	Fri, 14 Jun 2024 04:26:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XOric4Ey";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD6D910EC20;
 Fri, 14 Jun 2024 04:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718339156; x=1749875156;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/mARJ/PA1cJ2osPuLnWluKW1i6Ht0hnII8eJ6E6Qeqk=;
 b=XOric4EyPhTI4aedx4lysSS2Xyc5XpMM4NqJ0O0rShJgT/vDxXPvuHUl
 EJpmqm/HEaoifU1uj21GRco6V2Z6odpg6NSKr9fqLYS01ep8ITdheGR5T
 JAFJHXNxQlTQ66gDmDNYO1SZWQxtl4K6GhlGc/ooPU2sBF2If54jGE1Tq
 xtbiCzd/uq2zzlpoD2hDZ94AK9uPPuseveYL5hhld3sXMdIKk9B8V4wDl
 IbTybcWRIaaPhE0BBhavt/hU3H08JQcGwpq0/0h/plCl7fftaDnbApR/n
 nonmNgzFY0En9yOoRsrlFt3xhNjBGDDHxbHutPE/6Q86u/5G3jJAVQBPL w==;
X-CSE-ConnectionGUID: Sn8LAtocRjWSwj+7INUS0Q==
X-CSE-MsgGUID: sajEFAnRRc+fQegILCuk4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="37731521"
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; d="scan'208";a="37731521"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 21:25:51 -0700
X-CSE-ConnectionGUID: FBGfw/sBQY6FHbo8ei2qCQ==
X-CSE-MsgGUID: vV4qXGLsTBOEsSkdMFRgrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; d="scan'208";a="40343360"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by fmviesa008.fm.intel.com with ESMTP; 13 Jun 2024 21:25:48 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: mitulkumar.ajitkumar.golani@intel.com, ankit.k.nautiyal@intel.com,
 suraj.kandpal@intel.com, jani.nikula@linux.intel.com, sfr@canb.auug.org.au,
 lucas.demarchi@intel.com
Subject: [PATCH v2 1/2] drm/dp: Describe target_rr_divider in struct
 drm_dp_as_sdp
Date: Fri, 14 Jun 2024 09:55:57 +0530
Message-ID: <20240614042558.376983-2-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240614042558.376983-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20240614042558.376983-1-mitulkumar.ajitkumar.golani@intel.com>
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

-v2:
Remove extra line from commit message.(Lucas)

Fixes: a20c6d954d75 ("drm/dp: Add refresh rate divider to struct representing AS SDP")
Cc: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Cc: Arun R Murthy <arun.r.murthy@intel.com>
Cc: Suraj Kandpal <suraj.kandpal@intel.com>
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
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

