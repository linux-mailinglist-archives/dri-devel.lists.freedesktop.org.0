Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA91957E1A5
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jul 2022 14:52:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 751F88BE03;
	Fri, 22 Jul 2022 12:52:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BC5210F21D;
 Fri, 22 Jul 2022 12:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658494322; x=1690030322;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vKrl0Fsvd04rG5nmRB30PTFx42faZGSkamjPLOr0csU=;
 b=YN9HJ6e5OKOj3tDJGFr67GT2zHn6fqX7bpbo7LaH3M5f+nUR5VjUUuKh
 /7E1sfDmiTC3BUYJdyEsZmoUlNo9hpbZ8kD6R3piLUDve8RC5AQF44AM1
 S0AE7vrLzITSQ/2OjA1mD72u+fLp1tyx9FRTMbzDY98eSeZlx/QiZoaGH
 AwTeEueWTtUni8b7ystMR4pPGsPeyZo2ifHDQWKAOYbttPPaInDc2RVFi
 qnM9uLl0IeygA7uf05TIQktmE8MLxa6emuVb6hs4FuGiGRKus0lrUk5Kf
 xgRgNTCtaOog6zK50MrWeud/k5r34kINFDrYLlsvi7GB20ega2PENtzXf g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10415"; a="288061157"
X-IronPort-AV: E=Sophos;i="5.93,185,1654585200"; d="scan'208";a="288061157"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2022 05:52:01 -0700
X-IronPort-AV: E=Sophos;i="5.93,185,1654585200"; d="scan'208";a="626550915"
Received: from lab-ah.igk.intel.com ([10.91.215.196])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2022 05:51:59 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCH v6 0/4] drm/i915/display: stop HPD workers before display
 driver unregister
Date: Fri, 22 Jul 2022 14:51:39 +0200
Message-Id: <20220722125143.1604709-1-andrzej.hajda@intel.com>
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
v5:
  - added patch blocking FB creation in case HPD is supended,
  - added R-B from Arun to patch 3, thx
v6:
  - finally, after getting direct access to bat-rpls-2, I have found the source of last WARN,
    intel_fbdev_hpd_set_suspend was not called in case of deferred setup, fixed in patch 2.

[1]: https://patchwork.freedesktop.org/series/103811/

Regards
Andrzej


Andrzej Hajda (4):
  drm/i915/hpd: postpone HPD cancel work after last user suspension
  drm/i915/fbdev: suspend HPD before fbdev unregistration
  drm/i915/display: add hotplug.suspended flag
  drm/i915/fbdev: do not create fbdev if HPD is suspended

 drivers/gpu/drm/i915/display/intel_display.c |  3 +++
 drivers/gpu/drm/i915/display/intel_fbdev.c   | 12 ++++++++++--
 drivers/gpu/drm/i915/display/intel_hotplug.c | 11 ++++++++++-
 drivers/gpu/drm/i915/display/intel_hotplug.h |  2 +-
 drivers/gpu/drm/i915/i915_driver.c           |  4 ++--
 drivers/gpu/drm/i915/i915_drv.h              |  2 ++
 drivers/gpu/drm/i915/i915_irq.c              |  1 -
 7 files changed, 28 insertions(+), 7 deletions(-)

-- 
2.25.1

