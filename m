Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD9D5796DD
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jul 2022 11:57:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2C8314B24F;
	Tue, 19 Jul 2022 09:57:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED7CD14B248;
 Tue, 19 Jul 2022 09:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658224642; x=1689760642;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=haEhQVc5xp0PnhHW61L6L96s4XE497aPMoljPuiPq7U=;
 b=aHeBuy8bCtRCAXTGwRb586OLM1flHqoSNrPedHJA5w+un810FPBWY1cr
 GYBpLaUwgnwOt2RwfrPTd2gHD5TiFXGH2A8sqVnIVNsalTet9DSqUAMFe
 TliEgiucEGwNR2/YR1gOkR6saadSa8hbTqS9NrdoR5vx0Ikfw3uSplp4j
 gFNtA7ZutzCOyoacLIT6qLiPB6zMF5thLOuFbQPXS5Eh2dLyrPRN/wJFd
 XSsyHn04FgFRlSgSWambpt7DxJBDdThp9kjUnG4F4xxvW3XIf7hS76WE9
 R4JZUgHBNXYoYx0juM7wiUFKpO0gSlMCe6cCshkQH5wxwOJFDYtf19S50 Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10412"; a="287194292"
X-IronPort-AV: E=Sophos;i="5.92,283,1650956400"; d="scan'208";a="287194292"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2022 02:57:21 -0700
X-IronPort-AV: E=Sophos;i="5.92,283,1650956400"; d="scan'208";a="594776422"
Received: from slinke-mobl1.ger.corp.intel.com (HELO
 jhogande-mobl1.ger.corp.intel.com) ([10.251.210.1])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2022 02:57:16 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Subject: [PATCH v3 0/3] HDR aux backlight range calculation
Date: Tue, 19 Jul 2022 12:56:57 +0300
Message-Id: <20220719095700.14923-1-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Jani Nikula <jani.nikula@intel.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Roman Li <roman.li@amd.com>,
 Manasi Navare <manasi.d.navare@intel.com>, Mika Kahola <mika.kahola@intel.com>,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch set splits out static hdr metadata backlight range parsing
from gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c into gpu/drm/drm-edid.c
as a new function. This new function is then used during edid parsing
when HDR static metadata block parsing.

Calculated values are stored in a new struct drm_luminance_range
introduced into display_info. Amdgpu_dm.c and intel_dp_aux_backlight.c
are using this new data.

v3: Some clean-ups suggested by Jani Nikula
v2: Calculate the range during edid parsing and store into display_info

Cc: Roman Li <roman.li@amd.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Mika Kahola <mika.kahola@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Manasi Navare <manasi.d.navare@intel.com>

Jouni Högander (3):
  drm: New function to get luminance range based on static hdr metadata
  drm/amdgpu_dm: Rely on split out luminance calculation function
  drm/i915: Use luminance range calculated during edid parsing

 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 35 ++-----------
 drivers/gpu/drm/drm_edid.c                    | 52 ++++++++++++++++++-
 .../drm/i915/display/intel_dp_aux_backlight.c | 15 +++++-
 include/drm/drm_connector.h                   | 21 ++++++++
 4 files changed, 89 insertions(+), 34 deletions(-)

-- 
2.25.1

