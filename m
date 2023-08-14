Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5071E77C401
	for <lists+dri-devel@lfdr.de>; Tue, 15 Aug 2023 01:40:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 764A010E021;
	Mon, 14 Aug 2023 23:40:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF56D10E021;
 Mon, 14 Aug 2023 23:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692056437; x=1723592437;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=elToGikdUAbmzzTio9pAKIr+8vOqiubRGX4QXka362Q=;
 b=XUkAIQWlQhcBsLPCBi4SxgKPOpLBNZuIPz0sH4K9OKBme9+A3OU/FqvD
 EDY7muO57pOiiIU0ni7uUrGIyX1xmq4N3xL79S2J/hVdUQxPsBwOFHzok
 jMglALOBvPJhjTqoAnSzPoXgFgURGMsM/Cg0dEVuS4LWKUQiM+q1QVPPx
 3ZJ8Vvg0J88s1+mg1g4chQKks219Ov9zsf3AtbW4GOpvQvZovgzxhTjiP
 iHcUjhFqt4lDpMy7hs20r4m+Rl8LgeRcIg0lEyjOTzwwysHsi56hLy0zo
 lj/i4B8ggpkcZpY+8ICNS6Frxzeo0v0CKCMwGjEO4+2V9p7Nc3oVxy7zo g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="403140235"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; d="scan'208";a="403140235"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2023 16:40:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="733641639"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; d="scan'208";a="733641639"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by orsmga002.jf.intel.com with ESMTP; 14 Aug 2023 16:40:28 -0700
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 0/3] drm/i915/pxp/mtl: Update gsc-heci cmd submission
Date: Mon, 14 Aug 2023 16:40:25 -0700
Message-Id: <20230814234028.1115111-1-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.39.0
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
 dri-devel@lists.freedesktop.org,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For MTL, update the GSC-HECI packet size and the max firmware
response timeout to match internal fw specs. Enforce setting
run-alone bit in LRC for protected contexts.

Changes from prio revs:
   v2: - Patch #3: fix sparse warning reported by kernel test robot.
   v1: - N/A (Re-test)

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>

Alan Previn (3):
  drm/i915/pxp/mtl: Update pxp-firmware response timeout
  drm/i915/pxp/mtl: Update pxp-firmware packet size
  drm/i915/gt/pxp: User PXP contexts requires runalone bit in lrc

 drivers/gpu/drm/i915/gt/intel_lrc.c           | 25 +++++++++++++++++++
 .../i915/gt/uc/intel_gsc_uc_heci_cmd_submit.c |  3 +++
 .../drm/i915/pxp/intel_pxp_cmd_interface_43.h |  2 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h    |  6 ++---
 4 files changed, 32 insertions(+), 4 deletions(-)


base-commit: 85f20fb339f05ec4221bb295c13e46061c5c566f
-- 
2.39.0

