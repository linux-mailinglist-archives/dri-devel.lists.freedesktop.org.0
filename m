Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E19974E90F1
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 11:17:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 841E210EA90;
	Mon, 28 Mar 2022 09:17:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5008F10EAD7;
 Mon, 28 Mar 2022 09:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648459057; x=1679995057;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OhyCOb5q+FQ0oy5Q0AJhU53DG0titvOSY/O6WyihFoY=;
 b=gGlQnuII4EBMcjuiNYD3HgPnyfYx4vGQLi5tozabF8QeHjQ7ecDtYO+Y
 YGx/A7z3J7ZQFnaMPy54AQFZPI1GRAZHvfdWR67UEpN4wbCsNlnBka6Wi
 YJkAfaVHw0beL6tf2/x0OXkwK+m7buiFSxnHlNmFPZ3i5nt6ti5iZb8us
 UPqWxTbo/yiDzpb6caAwy8VhPXy1Qjh854m07CSTo9txsDV9A3fkY99lH
 wvisTKto/PQHcJ5CVKRCZ9oW5HSMW4S+TT4F65BIzD31GhAxdAmZ91NNF
 UVb5mQkZ77P17kA0g6yaQJhyMnybpAthtD6qV0dq6vTRCVdxukdffkD2H A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10299"; a="258924112"
X-IronPort-AV: E=Sophos;i="5.90,217,1643702400"; d="scan'208";a="258924112"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 02:17:36 -0700
X-IronPort-AV: E=Sophos;i="5.90,217,1643702400"; d="scan'208";a="719037634"
Received: from aysivtso-mobl.ccr.corp.intel.com (HELO localhost)
 ([10.252.62.56])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 02:17:35 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 00/11] drm/edid: constify EDID parsing, with some fixes
Date: Mon, 28 Mar 2022 12:17:14 +0300
Message-Id: <cover.1648458971.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
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

v2 of https://patchwork.freedesktop.org/series/101787/ addressing some
review comments from Ville.

Jani Nikula (11):
  drm/edid: don't modify EDID while parsing
  drm/edid: fix reduced blanking support check
  drm/edid: slightly restructure timing and non-timing descriptor
    structs
  drm/edid: pass a timing pointer to is_display_descriptor()
  drm/edid: use struct detailed_timing member access in is_rb()
  drm/edid: use struct detailed_data_monitor_range member access in gtf2
    functions
  drm/edid: constify struct detailed_timing in lower level parsing
  drm/edid: constify struct detailed_timing in parsing callbacks
  drm/edid: constify struct edid passed to detailed blocks
  drm/edid: constify struct edid passed around in callbacks and closure
  drm/edid: add more general struct edid constness in the interfaces

 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |   6 +-
 drivers/gpu/drm/drm_edid.c                    | 287 ++++++++++--------
 include/drm/drm_edid.h                        |  19 +-
 3 files changed, 174 insertions(+), 138 deletions(-)

-- 
2.30.2

