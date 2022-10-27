Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7FD61056C
	for <lists+dri-devel@lfdr.de>; Fri, 28 Oct 2022 00:13:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41F1010E04C;
	Thu, 27 Oct 2022 22:13:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3384110E00E;
 Thu, 27 Oct 2022 22:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666908799; x=1698444799;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mXYZQzTb/+NIeLXtTVwcvHKZrlB6wsQFsVwAh4YeNrs=;
 b=GOd5X4CzSycc4ig77Rf+R7Pj4Xa3nt9D+q/qAXFDpW0fyVy/TrwE+xJ5
 VASFXaNC7utW/n506b9mtOCpc034f48e+CDXVI9U2cUqwLHtY9khb5bHX
 KLnJiHrRElRqz1uwNCtR8bMhKQNP7YEV20oX/zNB+ANImJ97ydy8dU3hc
 cV2fa3/yFwM+2DZE6nx4AAWU0nW/Si3AM8C2MUITKRoCVDyA9ypKSXuMI
 Qz8VyvPDK4vQ6R5Q5r/orUDyDNcPeHQ1L5/OmQHMnnNsb/ipwYgInPNd5
 /BdxsCGx8kH0HBYzzJC5JkbmHzSUCRaDwyn1snhdz2HCcpVYXvsJy+dOs Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10513"; a="295763427"
X-IronPort-AV: E=Sophos;i="5.95,219,1661842800"; d="scan'208";a="295763427"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2022 15:13:18 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10513"; a="610528939"
X-IronPort-AV: E=Sophos;i="5.95,219,1661842800"; d="scan'208";a="610528939"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2022 15:13:18 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 0/5] Introduce the GSC CS
Date: Thu, 27 Oct 2022 15:15:49 -0700
Message-Id: <20221027221554.2638087-1-daniele.ceraolospurio@intel.com>
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
 drivers/gpu/drm/i915/gt/intel_engine_user.c  |  5 ++
 drivers/gpu/drm/i915/gt/intel_gt_irq.c       | 78 +++++++++++---------
 drivers/gpu/drm/i915/gt/intel_gt_regs.h      |  1 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c   | 11 ++-
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h  |  7 +-
 drivers/gpu/drm/i915/i915_reg.h              |  1 +
 8 files changed, 70 insertions(+), 43 deletions(-)

-- 
2.37.3

