Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9928055116D
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jun 2022 09:24:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72BA710E188;
	Mon, 20 Jun 2022 07:24:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDE6C10E188
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jun 2022 07:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655709894; x=1687245894;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xkdeQhfUcqOb+IEinqTArbn2UKsMpRu0oDIkLOH+q0k=;
 b=hXrrtxtZdrxAoenCk3EPogn3yHxD4FNZOld7/0K8sne/lR05nznmZJqF
 qVS4TYks3BMoH+N+6xzkG5AElsPhxdlKU6bImJU3jdCJliY2K6v0dyw3u
 /qRfHxwnp4EtOhCYcQCUHZ0kf49hS8j4wIpfdUzqHcRUh/nd1NsNcmQXa
 OusRghdfSLKkZXY1hr12Y9V8u05aaiXPPZOoY7obhciIrSLl6iZCLzBtR
 Zgv4pJsFXXf1wzw6GURqdkj6sQVdU0M3WZkZ5UrK3RGYvBH1YJqqEdcMJ
 s82LapMDZx6kUvSRnLUrwnVxMrKxv+7vUKM+n56X7DRExL7T/jYXUpOLZ A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="268545304"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="268545304"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2022 00:24:53 -0700
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="642986605"
Received: from gpetrea-mobl1.ger.corp.intel.com (HELO
 jhogande-mobl1.ger.corp.intel.com) ([10.249.41.172])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2022 00:24:49 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/4] HDR aux backlight range calculation
Date: Mon, 20 Jun 2022 10:20:15 +0300
Message-Id: <20220620072019.2710652-1-jouni.hogander@intel.com>
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

v2: Calculate the range during edid parsing and store into display_info

Cc: Roman Li <roman.li@amd.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Mika Kahola <mika.kahola@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Manasi Navare <manasi.d.navare@intel.com>

Jouni Högander (4):
  drm/display: Add drm_luminance_range_info
  drm: New function to get luminance range based on static hdr metadata
  drm/amdgpu_dm: Rely on split out luminance calculation function
  drm/i915: Use luminance range calculated during edid parsing

 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 35 ++-----------
 drivers/gpu/drm/drm_edid.c                    | 50 ++++++++++++++++++-
 .../drm/i915/display/intel_dp_aux_backlight.c | 17 +++++--
 include/drm/drm_connector.h                   | 21 ++++++++
 4 files changed, 88 insertions(+), 35 deletions(-)

-- 
2.25.1

