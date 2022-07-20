Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C5757B62F
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 14:16:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F2B012A27B;
	Wed, 20 Jul 2022 12:15:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 594948B50C;
 Wed, 20 Jul 2022 12:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658319340; x=1689855340;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3mBDDFUa6zRqbZgd3LwG/oe2hj8bj1YECv+Ob5PmfLI=;
 b=eb2/gxFg2nwQnqXO+uoTDVaqOz4r9Z/C9B2ct06P3XHhsFPVMl5O32pi
 bfjMdWpyrYLtk6bpoaG2Po1h3g4vqc9a5xIsATtchiNlWHOnV3aL1ZEES
 Hrq+LaoXUuk3OpHSPQpFZ6pJSs5Os5sM/C/+in0OP/rdJ8dhKFX/y9SxY
 eYRipKYsXjSz7sQzDo9lw/rMJk+EiyoJiza6UceQ4VZ7hxO549skL5MTx
 ha/tROi017G9jkE8p+ghk5ebLqLPsGdSMVRNMr6f8hSU7tvDxDX1IJD6D
 EKIAeDQpLnr41oo5ziOgiNXq9ksfiAvLDPCoYbq/5fW/RpZbHSYgJeqsf A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10413"; a="273598858"
X-IronPort-AV: E=Sophos;i="5.92,286,1650956400"; d="scan'208";a="273598858"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2022 05:15:39 -0700
X-IronPort-AV: E=Sophos;i="5.92,286,1650956400"; d="scan'208";a="573280072"
Received: from lab-ah.igk.intel.com ([10.91.215.196])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2022 05:15:37 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCH v4 0/3] drm/i915/display: stop HPD workers before display
 driver unregister
Date: Wed, 20 Jul 2022 14:15:05 +0200
Message-Id: <20220720121508.1202750-1-andrzej.hajda@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jani, Ville, Arun,

This patchset is replacement of patch
"drm/i915/display: disable HPD workers before display driver unregister" [1].
Ive decided to split patch into two parts - fbdev and MST, there are different
issues.
Ive also dropped shutdown path, as it has slightly different requirements,
and more importantly I am not able to test properly.

v2 (thx Arun for review):
  - reword of commit message (Arun)
  - intel_fbdev_hpd_set_suspend replaced with intel_fbdev_set_suspend (Arun)
v3:
  - new patch adding suspended flag, to handle
    https://gitlab.freedesktop.org/drm/intel/-/issues/5950
v4:
 - check suspend flag also in i915_digport_work_func

[1]: https://patchwork.freedesktop.org/series/103811/

Regards
Andrzej


Andrzej Hajda (3):
  drm/i915/hpd: postpone HPD cancel work after last user suspension
  drm/i915/fbdev: suspend HPD before fbdev unregistration
  drm/i915/display: add hotplug.suspended flag

 drivers/gpu/drm/i915/display/intel_display.c |  3 +++
 drivers/gpu/drm/i915/display/intel_fbdev.c   |  3 ++-
 drivers/gpu/drm/i915/display/intel_hotplug.c | 11 ++++++++++-
 drivers/gpu/drm/i915/display/intel_hotplug.h |  2 +-
 drivers/gpu/drm/i915/i915_driver.c           |  4 ++--
 drivers/gpu/drm/i915/i915_drv.h              |  2 ++
 drivers/gpu/drm/i915/i915_irq.c              |  1 -
 7 files changed, 20 insertions(+), 6 deletions(-)

-- 
2.25.1

