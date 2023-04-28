Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 145226F1312
	for <lists+dri-devel@lfdr.de>; Fri, 28 Apr 2023 10:15:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B7CA10EC6B;
	Fri, 28 Apr 2023 08:15:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D15C610E65E;
 Fri, 28 Apr 2023 08:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682669705; x=1714205705;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1IuvXQBidCIhMhVFkMAv2ZYRCd3w9TqEaED6SaU7+4k=;
 b=IrfqKV0cKweWfh6+HddNCzAlZUg3auZ4t5vWPbOqS30MiYbp6rLFkijL
 vYe9iQUNWDm1MhlXY7hpyLGFbdIbXA0EGYVvk10KguHTC+GwCdJkfz0NY
 +f1HBRtnV1m+gPMFtavbYdye2zd1Uw0MS1MnrmZnY/IA94Ak9+zNmeVbR
 7rdJGM/IzsGNiHqLXOruQzsQofBghH4qHP+EHi2CbJnLsY9sRis53Nmyn
 XampD6X+TYsovOs33maM6BblnL0R6g9L1sMcIcM731SWzC3zI7C2dNQ95
 lzytF8tLj6Z+OOcPIRmcmsp0qV8TF/ORdlQ2WLrj1NKlNQv6EKxtRIi+W g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="328011787"
X-IronPort-AV: E=Sophos;i="5.99,234,1677571200"; d="scan'208";a="328011787"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2023 01:15:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="694726753"
X-IronPort-AV: E=Sophos;i="5.99,234,1677571200"; d="scan'208";a="694726753"
Received: from ksathish-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.194.196])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2023 01:15:03 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC v2 0/4] Expose RPS thresholds in sysfs
Date: Fri, 28 Apr 2023 09:14:53 +0100
Message-Id: <20230428081457.857009-1-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.37.2
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

From patch 4:

    User feedback indicates significant performance gains are possible in
    specific games with non default RPS up/down thresholds.

    Expose these tunables via sysfs which will allow users to achieve best
    performance when running games and best power efficiency elsewhere.

    Note this patch supports non GuC based platforms only.

    References: https://gitlab.freedesktop.org/drm/intel/-/issues/8389

Issue 8389 suggests 10-15% performance gains are possible with tweaked
thresholds.

One question is are we able to find a "one size fits all" values.

However regardless of that, given we already expose frequency controls in sysfs
with the same reasoning of allowing system owners explicit control if so wanted,
I think exposing the thresholds can be equally justified.

v2:
 * Hopefully fixed the debug build issue.
 * Re-program the hw registers on change too!

Tvrtko Ursulin (4):
  drm/i915: Move setting of rps thresholds to init
  drm/i915: Record default rps threshold values
  drm/i915: Add helpers for managing rps thresholds
  drm/i915: Expose RPS thresholds in sysfs

 drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c | 104 ++++++++++++++++++++
 drivers/gpu/drm/i915/gt/intel_gt_types.h    |   3 +
 drivers/gpu/drm/i915/gt/intel_rps.c         |  70 ++++++++++---
 drivers/gpu/drm/i915/gt/intel_rps.h         |   4 +
 4 files changed, 170 insertions(+), 11 deletions(-)

-- 
2.37.2

