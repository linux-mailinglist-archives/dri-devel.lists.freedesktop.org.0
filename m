Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A0650FD08
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 14:31:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2A6E10E04D;
	Tue, 26 Apr 2022 12:31:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 739FD10E1FC
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 12:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650976262; x=1682512262;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xKbpcG5tnyafiafvWBc4SO0nH3fiWG8EGarNq2n2K+M=;
 b=Kxi/VW3JnceToNfxmP+VygyeB2ZPmNOmrNw4USaC2D+ekhRjB3tcIXbt
 UnTtET8Y50ThEKOCfg55XZulXqZgOtIhlclicddPbYvkrWhxZKaXeVKbs
 q//fTUMB182j3BpoiKzdKcAImckr0mYBqF2bNW39WCUBfayNDzbd93Lrs
 eDrm+MCuX01Ev2bccUKOPg/5YqiRV8jw0oT6OtsITHA00x636FpjheoB/
 epADE93pabd7ItluAOvhKGGDP7J/aQ3C3E8lfeul5I7SGdxzZ6wlHYW1l
 ZXVmN90rQewVsRux0QeTW5BBRbMKPxzUGx4butNraXzWGSSmkfEtxdGlj w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10328"; a="245483456"
X-IronPort-AV: E=Sophos;i="5.90,290,1643702400"; d="scan'208";a="245483456"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 05:31:01 -0700
X-IronPort-AV: E=Sophos;i="5.90,290,1643702400"; d="scan'208";a="558287461"
Received: from pbasx-mobl2.ger.corp.intel.com (HELO
 jhogande-mobl1.ger.corp.intel.com) ([10.252.32.62])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 05:30:58 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/3] HDR aux backlight range calculation
Date: Tue, 26 Apr 2022 15:30:41 +0300
Message-Id: <20220426123044.320415-1-jouni.hogander@intel.com>
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
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Mika Kahola <mika.kahola@intel.com>,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch set splits out static hdr metadata backlight range parsing
from gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c into gpu/drm/drm-edid.c as
a new function. This new function is then used in admgpu_dm.c and
intel_dp_aux_backlight.c

Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Mika Kahola <mika.kahola@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>

Jouni Högander (3):
  drm: New function to get luminance range based on static hdr metadata
  drm/amdgpu_dm: Use split out luminance calculation function
  drm/i915: Use luminance range from static hdr metadata

 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 35 ++----------
 drivers/gpu/drm/drm_edid.c                    | 55 +++++++++++++++++++
 .../drm/i915/display/intel_dp_aux_backlight.c |  9 ++-
 include/drm/drm_edid.h                        |  4 ++
 4 files changed, 70 insertions(+), 33 deletions(-)

-- 
2.25.1

