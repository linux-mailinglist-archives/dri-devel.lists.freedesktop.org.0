Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7415BA6F76B
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 12:47:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 692CA10E54D;
	Tue, 25 Mar 2025 11:47:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XDggD5Zd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8430910E54D
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 11:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742903226; x=1774439226;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pMoi+O4a1SL0cyUrTBYszfKLOyXWP7g+9pYEEyl2+IU=;
 b=XDggD5ZdID6I9KFeqHKpx4GR4VLmtpg3bLBzp5ELCzDkfqpIHqLszEku
 EdI3R+Mf+x+vJRj6f1UO9+go3pa3r4W3u2nTP7heV7NkREKbYWDLUA6sH
 KTgpBYhFyh0fLUCgC8yIjngZrKNMMpnKVQkqJHfL0Vp6HQ8minC7L+gG8
 ADkOccfVPDJ8LzgdMe2oPcIDdC8t9CcEXP9e+AOfagd5ccjMAF4erMS81
 qBOWAr8PnJAFojrafjP+qsA1oYSXxqNWVmWbF/ovoqbM3x5dG+gN9Cnqe
 kIUfhkRePUjSU7Cqy7njVVBPNBc7aIvdep37f6FIDrTS0U6ipb73t2uxc Q==;
X-CSE-ConnectionGUID: /Zd0RPlMS96js4IwhLHZzw==
X-CSE-MsgGUID: Eo9weCn3T16cHmCQpRv0/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="47927672"
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; d="scan'208";a="47927672"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 04:47:05 -0700
X-CSE-ConnectionGUID: 1QVnnAavQiSunQOJ96Y1Dw==
X-CSE-MsgGUID: hVbnsyRYT7+UyHtS9N2SIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; d="scan'208";a="124162134"
Received: from try2-8594.igk.intel.com ([10.91.220.58])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 04:47:03 -0700
From: Maciej Falkowski <maciej.falkowski@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 jacek.lawrynowicz@linux.intel.com, lizhi.hou@amd.com,
 Maciej Falkowski <maciej.falkowski@linux.intel.com>
Subject: [PATCH 0/2] PM fixes in Metric Steamer code
Date: Tue, 25 Mar 2025 12:43:04 +0100
Message-ID: <20250325114306.3740022-1-maciej.falkowski@linux.intel.com>
X-Mailer: git-send-email 2.43.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patches contains two fixes for Metric Stream:
  - Fix deadlock that may occur when
    executing runtime resume during cold boot where
    ms_lock will be already held there,
  - Fix warning to warn for suspend status only if
    the runtime PM is enabled.

Jacek Lawrynowicz (2):
  accel/ivpu: Fix deadlock in ivpu_ms_cleanup()
  accel/ivpu: Fix PM related deadlocks in MS IOCTLs

 drivers/accel/ivpu/ivpu_debugfs.c |  4 ++--
 drivers/accel/ivpu/ivpu_ms.c      | 24 ++++++++++++++++++++++++
 2 files changed, 26 insertions(+), 2 deletions(-)

-- 
2.43.0

