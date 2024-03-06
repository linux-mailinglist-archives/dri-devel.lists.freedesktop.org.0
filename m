Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E13873892
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 15:11:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C2671131F7;
	Wed,  6 Mar 2024 14:10:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nEyY4gPq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 112C71131F7
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Mar 2024 14:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709734257; x=1741270257;
 h=resent-to:resent-from:resent-date:resent-message-id:from:
 to:cc:subject:date:message-id:content-transfer-encoding:
 mime-version; bh=DDThIoJSv/03JtPq4FddZ9PJr0qxWXkxxO/zRs1RsZk=;
 b=nEyY4gPqpvVaPlCBkHIuwzkFa3cgwsYBBgFdOProIO4njiekwEorON7u
 bP6Cu5OZhilweH5ptiJszah3syZ+F6wK9mn0PUylAOGtqGI5LRsQe1oVa
 S7d0r6wl+PEvSo0rJ7nRKMMhy5gxrL5e6wnGErptSX34twcjZSWFxxpre
 c9QpsM23BEE8VHmDXkrOqsCa6wGcdkBASpe+JF9DBogMZn7lXZl31sRMX
 Mg0fe8OaD7G/d0Lg6YV0+aAGK7rw7jGPGwwjbEhbIRB6DilTmAvEd3+a0
 EFNVaBuNrumbpDHeFAZQhZb5x8SbZXNYMWjlpCFx7t6Q89IZxeZCwnD7I A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="4465446"
X-IronPort-AV: E=Sophos;i="6.06,208,1705392000"; 
   d="scan'208";a="4465446"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 06:10:57 -0800
X-ExtLoopCount2: 2 from 10.252.33.211
X-IronPort-AV: E=Sophos;i="6.06,208,1705392000"; d="scan'208";a="14429267"
Received: from rjongalo-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.33.211])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 06:10:56 -0800
Resent-Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7,
 02160 Espoo
Resent-To: dri-devel@lists.freedesktop.org
Resent-From: Jani Nikula <jani.nikula@intel.com>
Resent-Date: Wed, 06 Mar 2024 16:10:53 +0200
Resent-Message-ID: <87y1avxxg2.fsf@intel.com>
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Mailbox Transport; Wed, 6 Mar 2024 06:07:22 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Mar 2024 06:07:21 -0800
Received: from fmviesa002.fm.intel.com (10.60.135.142) by
 fmsmsx602.amr.corp.intel.com (10.18.84.212) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 6 Mar 2024 06:07:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,208,1705392000"; d="scan'208";a="32915198"
Received: from rjongalo-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.33.211]) by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2024 06:07:20 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: <intel-gfx@lists.freedesktop.org>
CC: <ville.syrjala@linux.intel.com>, Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH v3 0/6] drm/i915/mst: enable MST mode for 128b/132b
 single-stream sideband
Date: Wed, 6 Mar 2024 16:07:11 +0200
Message-ID: <cover.1709733981.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
Content-Type: text/plain; charset="UTF-8"
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
X-MS-Exchange-Organization-Network-Message-Id: ddb46d7a-abb1-4ad1-00d0-08dc3de6bdda
X-MS-Exchange-Organization-AuthSource: fmsmsx602.amr.corp.intel.com
X-MS-Exchange-Organization-AuthAs: Internal
X-MS-Exchange-Organization-AuthMechanism: 10
X-MS-Exchange-Organization-AVStamp-Enterprise: 1.0
X-MS-Exchange-Organization-SCL: -1
X-MS-Exchange-Transport-EndToEndLatency: 00:00:00.3847559
X-MS-Exchange-Processed-By-BccFoldering: 15.01.2507.035
MIME-Version: 1.0
X-TUID: dDyOKtL/Scr/
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

v3 of https://patchwork.freedesktop.org/series/129468/

Jani Nikula (6):
  drm/mst: read sideband messaging cap
  drm/i915/mst: improve debug logging of DP MST mode detect
  drm/i915/mst: abstract choosing the MST mode to use
  drm/i915/mst: use the MST mode detected previously
  drm/i915/mst: add intel_dp_mst_disconnect()
  drm/i915/mst: enable MST mode for 128b/132b single-stream sideband

 drivers/gpu/drm/display/drm_dp_mst_topology.c | 20 ++--
 .../drm/i915/display/intel_display_types.h    |  1 +
 drivers/gpu/drm/i915/display/intel_dp.c       | 95 +++++++++++++------
 drivers/gpu/drm/nouveau/nouveau_dp.c          |  2 +-
 include/drm/display/drm_dp_mst_helper.h       | 23 ++++-
 5 files changed, 104 insertions(+), 37 deletions(-)

-- 
2.39.2

