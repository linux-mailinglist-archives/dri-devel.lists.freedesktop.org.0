Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB7A57BBCB
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 18:49:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6180E91069;
	Wed, 20 Jul 2022 16:49:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0F9E9106E;
 Wed, 20 Jul 2022 16:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658335741; x=1689871741;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=At6yr/JXSgD5yDoMjIyRbiXmyOOgESB6Qrujo1ji3Lk=;
 b=hmBw9TVnQRgwCB0V47poLskpXU1bsWPlIME3u7WpZhSxNVAH7FBpT8QP
 ANqZqHJWlnt7mVbm/6mRtp9uWeeR/OAKZsFVZoiod97wIEO8FctoYD/nJ
 WmO9TUw1paLhnTkr5Ws4IWZBrNZiaKo4XvE6ecXJF0d2Jtk6pJ58pKGxx
 7Dg+Z514m6U0wrY+FlG9ccsgEH9u8mKLmVjGbaOqUO49vkKCnmwStYnmR
 NhTr7DsezR9Jn/kwOsh2mZ76buA4hNZGHQuEEDMev+iMmwC9Sqx+ExTab
 Ilw2namVCySDuBr4T1f8NfwvBeyl4aca98rDKeavDhGv/QyOMUIvIPAca A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10414"; a="266604482"
X-IronPort-AV: E=Sophos;i="5.92,286,1650956400"; d="scan'208";a="266604482"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2022 09:49:00 -0700
X-IronPort-AV: E=Sophos;i="5.92,286,1650956400"; d="scan'208";a="656349835"
Received: from lab-ah.igk.intel.com ([10.91.215.196])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2022 09:48:58 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCH v5 0/4] drm/i915/display: stop HPD workers before display
 driver unregister
Date: Wed, 20 Jul 2022 18:48:44 +0200
Message-Id: <20220720164848.1246701-1-andrzej.hajda@intel.com>
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

[1]: https://patchwork.freedesktop.org/series/103811/

Regards
Andrzej


Andrzej Hajda (4):
  drm/i915/hpd: postpone HPD cancel work after last user suspension
  drm/i915/fbdev: suspend HPD before fbdev unregistration
  drm/i915/display: add hotplug.suspended flag
  drm/i915/fbdev: do not create fbdev if HPD is suspended

 drivers/gpu/drm/i915/display/intel_display.c |  3 +++
 drivers/gpu/drm/i915/display/intel_fbdev.c   |  9 ++++++++-
 drivers/gpu/drm/i915/display/intel_hotplug.c | 11 ++++++++++-
 drivers/gpu/drm/i915/display/intel_hotplug.h |  2 +-
 drivers/gpu/drm/i915/i915_driver.c           |  4 ++--
 drivers/gpu/drm/i915/i915_drv.h              |  2 ++
 drivers/gpu/drm/i915/i915_irq.c              |  1 -
 7 files changed, 26 insertions(+), 6 deletions(-)

-- 
2.25.1

