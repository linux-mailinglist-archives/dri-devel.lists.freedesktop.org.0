Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A53F5BCB46
	for <lists+dri-devel@lfdr.de>; Mon, 19 Sep 2022 13:56:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A0F410E605;
	Mon, 19 Sep 2022 11:56:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EADA10E61E;
 Mon, 19 Sep 2022 11:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663588595; x=1695124595;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xnSw3/VqiU78SJbHgtIWm03BL0tYywg5iDJ3wt16cLk=;
 b=KppVaYkhiuiB7s6pIC86o/hOGUWyv1Q+cG7I0uyXirvJ1ifFpNWuQ9WA
 fWXsypV2N/PEvCOVa46HCoc+YIGGznEqn8NXgQrP0sQOFrKW7Vl6z+81B
 SjxW6h9p5x5DfFmqf3oJLmvZZ+wVbsXdxLKxspHFiwySz6s/727ZA7mx0
 1NapaBBVX/pN2jae45PdGFUZ2uO9E76c9v+lqf6q6y4xHjsYkbp+9ctCw
 vgR9r+NMQiRQP4CuLZMzy0DXchlgsjNwN5ERpSgVU9IodVA+jY0INzTfX
 JUH6lg+YlZd83kI0LZ8nOpSp6IdoXoF3HaaQfy2/8iNivYqTtpxBsY3B/ w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10474"; a="299371189"
X-IronPort-AV: E=Sophos;i="5.93,327,1654585200"; d="scan'208";a="299371189"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 04:56:34 -0700
X-IronPort-AV: E=Sophos;i="5.93,327,1654585200"; d="scan'208";a="947189947"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.158])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 04:56:32 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 0/2] i915: CAGF and RC6 changes for MTL
Date: Mon, 19 Sep 2022 17:29:04 +0530
Message-Id: <20220919115906.1264041-1-badal.nilawar@intel.com>
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
Cc: andi.shyti@intel.com, anshuman.gupta@intel.com,
 dri-devel@lists.freedesktop.org, ashutosh.dixit@intel.com, jon.ewins@intel.com,
 rodrigo.vivi@intel.com, vinay.belgaumkar@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series includes the code changes to get CAGF, RC State and 
C6 Residency of MTL.

v2: Included "Use GEN12 RPSTAT register" patch 

v3: 
  - Rebased
  - Dropped "Use GEN12 RPSTAT register" patch from this series
    going to send separate series for it

Badal Nilawar (2):
  drm/i915/mtl: Modify CAGF functions for MTL
  drm/i915/mtl: Add C6 residency support for MTL SAMedia

 drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c | 60 +++++++++++++++++++
 drivers/gpu/drm/i915/gt/intel_gt_regs.h       | 18 ++++++
 drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c   |  9 ++-
 drivers/gpu/drm/i915/gt/intel_rc6.c           |  5 +-
 drivers/gpu/drm/i915/gt/intel_rps.c           |  6 +-
 drivers/gpu/drm/i915/gt/selftest_rc6.c        |  9 ++-
 drivers/gpu/drm/i915/i915_pmu.c               |  8 ++-
 7 files changed, 110 insertions(+), 5 deletions(-)

-- 
2.25.1

