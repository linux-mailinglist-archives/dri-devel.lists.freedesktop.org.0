Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A025796DEB
	for <lists+dri-devel@lfdr.de>; Thu,  7 Sep 2023 02:16:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B46C610E73E;
	Thu,  7 Sep 2023 00:15:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD59110E73C;
 Thu,  7 Sep 2023 00:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694045751; x=1725581751;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SeQmSwT6avmJfppnXPWQyIms9MtWfxKS8eQHGPFjc4c=;
 b=Ga2vdjrTT1UI8o8JQxN6JtNI0521/gOLKb7W8Xn8JD+ndfgPlkuj/qqJ
 J117zRSuia7MyLrHcv8tkAAll/CWk352C0sfO6FtNJaLkAg/ueRNbkpZz
 10yKhSr6fIY9aITVIPX26AaJIwwMYzTLZcC4CHH42oqfXiHJv36xM95fo
 0xHxzu+s0MWbOipgE3ksNyj1lDkjIk3WD2DdMVGOaKOPxdKgX14lSRath
 Q2r3hri9TqnW+Q7xR22dX1bn2y44ufdauoar9odLn4PTyd9bV/y0tqjBB
 k1t/6imQvDkq8jofuIaiHGqCpu5UbG9NNxwIp2xFg+H31FItOoG6diWGm Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="408226728"
X-IronPort-AV: E=Sophos;i="6.02,233,1688454000"; d="scan'208";a="408226728"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2023 17:15:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="811895782"
X-IronPort-AV: E=Sophos;i="6.02,233,1688454000"; d="scan'208";a="811895782"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by fmsmga004.fm.intel.com with ESMTP; 06 Sep 2023 17:15:50 -0700
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v4 0/3] drm/i915/pxp/mtl: Update gsc-heci cmd submission to
 align with fw/hw spec
Date: Wed,  6 Sep 2023 17:15:46 -0700
Message-Id: <20230907001549.81262-1-alan.previn.teres.alexis@intel.com>
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
   v3: - Patch #1. Only start counting the request completion
         timeout from after the request has started (Daniele).
   v2: - Patch #3: fix sparse warning reported by kernel test robot.
   v1: - N/A (Re-test)

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>

Alan Previn (3):
  drm/i915/pxp/mtl: Update pxp-firmware response timeout
  drm/i915/pxp/mtl: Update pxp-firmware packet size
  drm/i915/lrc: User PXP contexts requires runalone bit in lrc

 drivers/gpu/drm/i915/gt/intel_lrc.c           | 23 +++++++++++++++++++
 .../i915/gt/uc/intel_gsc_uc_heci_cmd_submit.c | 20 ++++++++++++++--
 .../i915/gt/uc/intel_gsc_uc_heci_cmd_submit.h |  6 +++++
 .../drm/i915/pxp/intel_pxp_cmd_interface_43.h |  4 ++--
 drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h    | 11 +++++----
 5 files changed, 56 insertions(+), 8 deletions(-)


base-commit: 5008076127a9599704e98fb4de3761743d943dd0
-- 
2.39.0

