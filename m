Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C077561CAD
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 16:03:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5289E11B1B4;
	Thu, 30 Jun 2022 14:03:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AAC811B1C2;
 Thu, 30 Jun 2022 14:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656597823; x=1688133823;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jXez//ZDoKLEd+3YWJ/JMMETrMUsCmxHnAEBqMeEpkk=;
 b=KeIpiYOnJlL2xnx8OacuJJpTCwBWAZz7evAV17ccD68fWA0N0fnrS/BX
 /Gucyw1TCzwK6Ed64BPOA39cada6B2EHIX29x5bV4zJ4ghhJR8xItYXrZ
 qwiCNW7DK+XicaqIJPlQ+zuBCXYqt2+B8m/1vCxmPqa3l4kwoyyhrSv29
 /TMcoZz5311Wz0lf4jGNFOkv3JnA2D0mLnjHjEL+5rX2X0nYf8oxrT+t4
 1qNSZToCRsh4Lgcu8bvZYZF22IT8zeFgPxZZIn6tOSmBu0uigsu2uBKRw
 uRplsOowHliJ7f3ccbs9h/o9GWpx8YLLYf3xBI9npKtbVa+BI1EPVMegv A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10393"; a="262153400"
X-IronPort-AV: E=Sophos;i="5.92,234,1650956400"; d="scan'208";a="262153400"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2022 07:03:26 -0700
X-IronPort-AV: E=Sophos;i="5.92,234,1650956400"; d="scan'208";a="647903028"
Received: from lab-ah.igk.intel.com ([10.91.215.196])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2022 07:03:24 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCH v2 0/2] drm/i915/display: stop HPD workers before display
 driver unregister
Date: Thu, 30 Jun 2022 16:03:06 +0200
Message-Id: <20220630140308.3485100-1-andrzej.hajda@intel.com>
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

[1]: https://patchwork.freedesktop.org/series/103811/

Regards
Andrzej


Andrzej Hajda (2):
  drm/i915/hpd: postpone HPD cancel work after last user suspension
  drm/i915/fbdev: suspend HPD before fbdev unregistration

 drivers/gpu/drm/i915/display/intel_display.c | 3 +++
 drivers/gpu/drm/i915/display/intel_fbdev.c   | 3 ++-
 drivers/gpu/drm/i915/i915_irq.c              | 1 -
 3 files changed, 5 insertions(+), 2 deletions(-)

-- 
2.25.1

