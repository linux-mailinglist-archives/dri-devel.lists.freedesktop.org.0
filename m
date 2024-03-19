Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2CF587FA78
	for <lists+dri-devel@lfdr.de>; Tue, 19 Mar 2024 10:13:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E52210EA04;
	Tue, 19 Mar 2024 09:13:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lRwdThYc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65D8010E6B1;
 Tue, 19 Mar 2024 09:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710839581; x=1742375581;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mmPzjV25oxM4MgOedY2Kf0VlpdZggvmhEo709NmzGwc=;
 b=lRwdThYcqyf5Ua92vZK/SFbXHusbj1dwwVXymvHQZ0bsVSf7zsbq95Ou
 10Y1l8pXIrgX9XtVuzdzfZoHKaJiD/z0bSuqUkyJPHLaECfp2U/6i46Sl
 ClsK1jfbzBk/7XZKfk1KaODxdFtCHewO3S++YsQXkYQlbh5KSXXwD7Ktx
 WXS2X+viiTYL3w2dBON/lz+YKYPn+Ml6pWSroZzS4kZykFX0Gx3z2eKRR
 XMxZWV948vN3DvVomkL+zS8w0unLgsZoP54iQ/ThJYqNdUgNLG6Fc01Z+
 vOi3KfONW2LemR7t8kwfT9RVnsjpk5m+q9LhXKJ+aqU08aOmbaapH/9jg w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="16238019"
X-IronPort-AV: E=Sophos;i="6.07,136,1708416000"; d="scan'208";a="16238019"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 02:13:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,136,1708416000"; d="scan'208";a="36883652"
Received: from rcritchl-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.36.139])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 02:12:58 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	ville.syrjala@linux.intel.com
Subject: [RESEND v3 0/6] drm/i915/mst: enable MST mode for 128b/132b
 single-stream sideband
Date: Tue, 19 Mar 2024 11:12:47 +0200
Message-Id: <cover.1710839496.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Resend because I forgot to Cc: dri-devel on the original submission.

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

