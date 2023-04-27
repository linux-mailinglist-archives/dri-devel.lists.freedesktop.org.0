Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F926F0619
	for <lists+dri-devel@lfdr.de>; Thu, 27 Apr 2023 14:45:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC89C10E24E;
	Thu, 27 Apr 2023 12:45:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FD6310E24E;
 Thu, 27 Apr 2023 12:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682599549; x=1714135549;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=m9hl442UVeTU2IpyTrg/u7VZDJtgH9uF3UoAhnpK2J8=;
 b=KhyndKs2sSpOzJRtvVXuckjKK342zGTY33bSPfvq+yTn/fxyFDUc05y8
 51p1OPrZifhB8ZCF9ji5PcaO6Rb68lZLDzWRPPjVZMnWRbPMM64SMkG1y
 nYeoMIGUDw5fmcAEEnrrVHh+FlMm6S7Li0NKYzbwSLi0JXZ9nOsTQv/+A
 mYUgkkXcXlVhcAxzUim6G0bdIHF8DsyhbVv2KGEOpU+rpvkrAEoBQWhE2
 5JHfTA9ROJDFEk0YQBFC1LljU8hLTdPHN9D1R1heaEwX+uuBr+WHr5wTb
 cKvmxwzO+tNMgur/SjKxHdcCHODvPmiA2wQsx/CXCgZJ1rlsKDnJhepJt Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="331680611"
X-IronPort-AV: E=Sophos;i="5.99,230,1677571200"; d="scan'208";a="331680611"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2023 05:45:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="688414507"
X-IronPort-AV: E=Sophos;i="5.99,230,1677571200"; d="scan'208";a="688414507"
Received: from ebaldwin-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.239.242])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2023 05:45:46 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC 0/4] Expose RPS thresholds in sysfs
Date: Thu, 27 Apr 2023 13:45:33 +0100
Message-Id: <20230427124537.820273-1-tvrtko.ursulin@linux.intel.com>
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

Tvrtko Ursulin (4):
  drm/i915: Move setting of rps thresholds to init
  drm/i915: Record default rps threshold values
  drm/i915: Add helpers for managing rps thresholds
  drm/i915: Expose RPS thresholds in sysfs

 drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c | 104 ++++++++++++++++++++
 drivers/gpu/drm/i915/gt/intel_gt_types.h    |   3 +
 drivers/gpu/drm/i915/gt/intel_rps.c         |  65 +++++++++---
 drivers/gpu/drm/i915/gt/intel_rps.h         |   4 +
 4 files changed, 165 insertions(+), 11 deletions(-)

-- 
2.37.2
