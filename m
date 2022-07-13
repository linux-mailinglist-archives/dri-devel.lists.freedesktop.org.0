Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2078573A06
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jul 2022 17:24:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FF3690728;
	Wed, 13 Jul 2022 15:24:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD0E296132;
 Wed, 13 Jul 2022 15:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657725853; x=1689261853;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FyYf84JZR8THqjeH1eOHySySmuAHGNsB8/kgurgp9sg=;
 b=cew6gd4374lqLkx/RMPCWGfUDZAHXl3ciacyrDxnGENdid1NJq/8H2Tb
 IcAerF8ygQAC3BG53kY06HXgE8rZagXXXH6aKD6FmumHcztn0UPX17olD
 XJL2I4McLca5frI8WXbZJy8g4wn5DA/BM3vl6JnmIIFEjlQWwjHFLhlSo
 /n6xDI80TOXcaSJMG0RfHTzyDjMHhG9eMX3TZd1Og1jqey4kZJJszvDKS
 6PI39DUMUD2Vp61kNxiRa6tezLiaF7hBoh/wxdiArfvon9TFElAynUDQk
 eAjTm8jmG3Cyz+TgBEp3qawz4p+fl9kIY9KfRka9syayi7ceYBeGfzGyw g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10407"; a="310880887"
X-IronPort-AV: E=Sophos;i="5.92,267,1650956400"; d="scan'208";a="310880887"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2022 08:20:30 -0700
X-IronPort-AV: E=Sophos;i="5.92,267,1650956400"; d="scan'208";a="922669023"
Received: from lab-ah.igk.intel.com ([10.91.215.196])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2022 08:20:28 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCH v3 0/3] drm/i915/display: stop HPD workers before display
 driver unregister
Date: Wed, 13 Jul 2022 17:20:16 +0200
Message-Id: <20220713152019.343432-1-andrzej.hajda@intel.com>
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

[1]: https://patchwork.freedesktop.org/series/103811/

Regards
Andrzej


Andrzej Hajda (3):
  drm/i915/hpd: postpone HPD cancel work after last user suspension
  drm/i915/fbdev: suspend HPD before fbdev unregistration
  drm/i915/display: add hotplug.suspended flag

 drivers/gpu/drm/i915/display/intel_display.c |  3 +++
 drivers/gpu/drm/i915/display/intel_fbdev.c   |  3 ++-
 drivers/gpu/drm/i915/display/intel_hotplug.c | 13 ++++++++++++-
 drivers/gpu/drm/i915/display/intel_hotplug.h |  2 +-
 drivers/gpu/drm/i915/i915_driver.c           |  4 ++--
 drivers/gpu/drm/i915/i915_drv.h              |  2 ++
 drivers/gpu/drm/i915/i915_irq.c              |  1 -
 7 files changed, 22 insertions(+), 6 deletions(-)

-- 
2.25.1

