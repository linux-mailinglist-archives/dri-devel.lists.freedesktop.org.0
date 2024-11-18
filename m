Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1739D1432
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2024 16:15:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E5AB10E503;
	Mon, 18 Nov 2024 15:15:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hjImw/BJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6FA610E4FA;
 Mon, 18 Nov 2024 15:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731942902; x=1763478902;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=arw2WB8lOviXgeapjQLLPhdkhi6XL2WJ2g6bpk/z55k=;
 b=hjImw/BJu0NTNGeCCYxh++V+SCELG/WJX6I3B3woUWxxaTzoNO8uzwMd
 AeI3P+oS1QaTccbBTb9v/uijTocA2pHWBgG8OvnRJu1dGW4hVYURK5l1w
 /AOfh51NY6yNtlrrMsDWnibHEiXVb1jggafraS3FrEV0cyWrI/nuZOIKy
 rwFsYJjZaE4O4fVY3+IC9D6ScQDFjBTW1MB4xgoY5pgzIMMCs36LkAazR
 hzW5PxGulXnfKNt2w5KrBuhnXnlHr5RftxhZJauGi0OQud4lYgqPrcNxH
 f0pXxZebsec0YgATBsXQjV6v2rj050MXnheU2aGyEJrhAp4PTOPaZ+o3u A==;
X-CSE-ConnectionGUID: Hk2bgzlYREGQXsjHvTha3g==
X-CSE-MsgGUID: 4uWhd5uTSRiPQLTlEv2Krw==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="32044069"
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; d="scan'208";a="32044069"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 07:15:02 -0800
X-CSE-ConnectionGUID: hKn2n72WRQGabUJkwjxk9Q==
X-CSE-MsgGUID: GGcnu02/RHSOndjYkygV0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; d="scan'208";a="126792817"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.148])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 07:15:00 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@intel.com, imre.deak@intel.com
Subject: [PATCH 0/3] drm/dp: extract payload helpers
Date: Mon, 18 Nov 2024 17:14:51 +0200
Message-Id: <cover.1731942780.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.5
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add some mst topology manager independent payload helpers.

Jani Nikula (3):
  drm/dp: extract drm_dp_dpcd_poll_act_handled()
  drm/dp: extract drm_dp_dpcd_write_payload()
  drm/dp: extract drm_dp_dpcd_clear_payload()

 drivers/gpu/drm/display/drm_dp_helper.c       | 124 +++++++++++++++++-
 drivers/gpu/drm/display/drm_dp_mst_topology.c |  88 +------------
 include/drm/display/drm_dp_helper.h           |   5 +
 3 files changed, 133 insertions(+), 84 deletions(-)

-- 
2.39.5

