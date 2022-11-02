Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA9E616A13
	for <lists+dri-devel@lfdr.de>; Wed,  2 Nov 2022 18:09:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF37310E529;
	Wed,  2 Nov 2022 17:08:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A03F10E519;
 Wed,  2 Nov 2022 17:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667408899; x=1698944899;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=g0PsH0A3E7xyhyupViSGOwUDYlY6JVQNphxzGiRfn0I=;
 b=laQissqfNQ/l3K/2VqhrAmr7kN6tFzJ8/G/3QimkxRiXqGnURneLP35m
 deNmBQKGfZWz6FNQF3ya0ir1aC+fp1Pkfrh1/+oRXuSdC9sHKpHk/b887
 cdPp3E4ff+4LUUXf1ySsnwHKieBZ4f8UupUy7SVSkZkOo0uRfQ3cv7HrW
 j10m56AJp8iEgoAe2V4TTpGkBZ/ni9glBoyR4uQ5/HB4FINcW+WoIHqL9
 yP8kihdiZhYFMAWpTzSUwuWuIdnN/s5K/0fH8c4Zh79hSnXWwfVHLVCDo
 A24hOGuayxLdLBonpJhLlCBuhWxSl8UD6B1JMcpibfOUzlRGoUBTPe+1A A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10519"; a="395777100"
X-IronPort-AV: E=Sophos;i="5.95,234,1661842800"; d="scan'208";a="395777100"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2022 10:07:58 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10519"; a="739835277"
X-IronPort-AV: E=Sophos;i="5.95,234,1661842800"; d="scan'208";a="739835277"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2022 10:07:57 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 0/5] drm/i915: Introduce the GSC CS
Date: Wed,  2 Nov 2022 10:10:42 -0700
Message-Id: <20221102171047.2787951-1-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.37.3
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
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Starting on MTL, the GSC microcontroller resides inside the media GT
and the driver can communicate with it via a new Command Streamer, the
GSC CS. As a first step in supporting the GSC integration within the
media GT, this series adds the required defines and basic support for
this CS. Note that, given that the only user of this CS is i915 itself,
we don't need to expose it to userspace.

The CS has been purposely not added to the engine mask for MTL yet,
because it is only used in conjunction with the GSC FW, so there is
nothing we can do with it until we add support for the FW, which will
come as a separate next step.

v2: clean up interrupt code and rename GSC engine

Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>

Daniele Ceraolo Spurio (5):
  drm/i915/mtl: add initial definitions for GSC CS
  drm/i915/mtl: pass the GSC CS info to the GuC
  drm/i915/mtl: add GSC CS interrupt support
  drm/i915/mtl: add GSC CS reset support
  drm/i915/mtl: don't expose GSC command streamer to the user

 drivers/gpu/drm/i915/gt/intel_engine_cs.c    |  9 +++
 drivers/gpu/drm/i915/gt/intel_engine_types.h |  1 +
 drivers/gpu/drm/i915/gt/intel_engine_user.c  | 28 ++++++--
 drivers/gpu/drm/i915/gt/intel_gt_irq.c       | 75 +++++++++++---------
 drivers/gpu/drm/i915/gt/intel_gt_regs.h      |  1 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c   | 11 ++-
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h  |  7 +-
 drivers/gpu/drm/i915/i915_reg.h              |  1 +
 8 files changed, 84 insertions(+), 49 deletions(-)

-- 
2.37.3

