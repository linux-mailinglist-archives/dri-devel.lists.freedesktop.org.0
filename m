Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B2D6AFE6A
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 06:33:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B32F910E589;
	Wed,  8 Mar 2023 05:33:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04C7210E23C;
 Wed,  8 Mar 2023 05:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678253607; x=1709789607;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qdp20iI9+jCGh0qJTiSsDzxo0KixdE4oblLJgB6NR0E=;
 b=XyUD4/fr2iC1I2aoIIyPB4u+BUI1rAXfQ6rBHb1XQm1Q97wRGmg7X4sO
 vDx7fmQHpOwNneTCxKJrvu9t34plAFn6mjxoT84n6gmVjoKoXlG8edzJQ
 +Bj17vfrbGeQ2tQK2fNPR2gCR+ciLOU4qfuYTZe/NxJL+99aKPjjd3PT8
 hB71M3OQ/acFsSZpZqFOlyXXTQQ60dZ+pOlBM/kFawGDU0KNNUgwCPh/7
 6w8VvHcufUmkdeE4lknsy13iez2004MUPK2VxV3fsRONVABCRCalgghv0
 x/YQb+zhthI4qY7yZyrumfKj5m5eFpxAZ+0W5Sl4l65BSBUo9F4VGs00E w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="334781363"
X-IronPort-AV: E=Sophos;i="5.98,242,1673942400"; d="scan'208";a="334781363"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 21:33:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="820071516"
X-IronPort-AV: E=Sophos;i="5.98,242,1673942400"; d="scan'208";a="820071516"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 21:33:26 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 0/3] drm/i915/pmu: Use common freq functions with sysfs
Date: Tue,  7 Mar 2023 21:33:18 -0800
Message-Id: <20230308053321.939906-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.38.0
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
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Using common freq functions with sysfs in PMU (but without taking
forcewake) solves the following issues (a) missing support for MTL (b)
missing support for older generations (prior to Gen6) (c) missing support
for slpc when freq sampling has to fall back to requested freq. It also
makes the PMU code future proof where sometimes code has been updated for
sysfs and PMU has been missed.

Ashutosh Dixit (3):
  drm/i915/rps: Expose read_actual_frequency_fw for PMU
  drm/i915/rps: Expose get_requested_frequency_fw for PMU
  drm/i915/pmu: Use common freq functions with sysfs

 drivers/gpu/drm/i915/gt/intel_rps.c | 68 +++++++++++++++++++++--------
 drivers/gpu/drm/i915/gt/intel_rps.h |  4 +-
 drivers/gpu/drm/i915/i915_pmu.c     | 10 ++---
 3 files changed, 56 insertions(+), 26 deletions(-)

-- 
2.38.0

