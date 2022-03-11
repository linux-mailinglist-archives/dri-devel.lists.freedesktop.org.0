Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7255E4D56F9
	for <lists+dri-devel@lfdr.de>; Fri, 11 Mar 2022 01:51:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C02710E434;
	Fri, 11 Mar 2022 00:50:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E08610E432;
 Fri, 11 Mar 2022 00:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646959852; x=1678495852;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XAbDrIJodItZRpJMxgYW3cOsZVANQDZdrvdMOkrlXM0=;
 b=Bbu5v3/jF5/vuKFPEjjn8sZKVmyL+mIUzlmdiX6iS6ClMaWrOQEeRDgO
 wf1cWkgE7qEuv4yS3rp01LQgafm+a4e2CpL2QGQRwu4R8KiTsnEgAdrcB
 XN3w9VUsfr4rz1YZ4vajxby7tAYwzs90gbts1UWzb86FEyQYJURX6JBqE
 8Tk0wJSjDPGoeIy0imhx9sNZ0EdjZcR3WN0jlLH8z0ChFJvgFzRVKC/6E
 yY4N0Y/uVGAVBwab9K79Y5+zBwRrHW6DE3dRU2rSIWNHI4yg24SW6INVM
 405w5GXPzBwospL8U7jxpU/kswc4190sT0guXcXdK6hCEOfbv6xg0/dFX Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10282"; a="237626447"
X-IronPort-AV: E=Sophos;i="5.90,172,1643702400"; d="scan'208";a="237626447"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2022 16:40:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,172,1643702400"; d="scan'208";a="633213669"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by FMSMGA003.fm.intel.com with ESMTP; 10 Mar 2022 16:40:47 -0800
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v4 0/1] Fix i915 error_state_read ptr use
Date: Thu, 10 Mar 2022 16:43:10 -0800
Message-Id: <20220311004311.514198-1-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Stuart Summers <stuart.summers@intel.com>,
 John Harrison <john.c.harrison@intel.com>, dri-devel@lists.freedesktop.org,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix pointer offset usage in error_state_read
when there is no i915_gpu_coredump but buf offset
is non-zero.

This is the 2nd rev of this series.

Changes from prior revs:
  v4: - Mistake on v3, really added the missing fixme this time.
  v3: - Add a fixme comment about handling partial inconsistent
        sysfs reads as per review comment from John Harrison.
      - Add the "fixes" tag referencing the previous patch
        of the same function.
  v2: - Fix build issue: uninitialized var
        Reported-by: kernel test robot <lkp@intel.com>

Alan Previn (1):
  drm/i915/reset: Fix error_state_read ptr + offset use

 drivers/gpu/drm/i915/i915_sysfs.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

-- 
2.25.1

