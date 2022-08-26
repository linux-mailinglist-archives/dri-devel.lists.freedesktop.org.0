Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E37695A293A
	for <lists+dri-devel@lfdr.de>; Fri, 26 Aug 2022 16:20:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 868AB10E92D;
	Fri, 26 Aug 2022 14:19:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7947E10E927;
 Fri, 26 Aug 2022 14:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661523588; x=1693059588;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mbh4k2SLeUq09AFN+Q59FjeX7XIyUlZAnKy3aITqZ0Y=;
 b=PA2XcecLU4g9MGu5eiKR/mePBPpk3wI2Ts0XDshpbPQzW9f6GM4VJaU8
 /D/W28ZJ7TYsHGaCDnra8iz2qKPag1vviYRx27gpySYRzPm4kKQt7Us4N
 Pp+DMGjKN/au7EFuHEjnBjO510GZTYxKLvl5iEunPhc4hjuipZntRC74v
 KHAOvuRk62lHEwtnXX5DoAhmMtOaPM+QcalFLVvTCGhFpXnyWWeB7A8eY
 CMqGdtO8/2LTqyoRBGSFWzgCE8xbii7iuucxyYGgxo41glf8Vq5ACoAyK
 DY+hneS8h/5tnUpyhQU437za88U9GOOWcfx8T/kcwwMF79EopJ8A0Jsll g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10451"; a="281485701"
X-IronPort-AV: E=Sophos;i="5.93,265,1654585200"; d="scan'208";a="281485701"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2022 07:19:47 -0700
X-IronPort-AV: E=Sophos;i="5.93,265,1654585200"; d="scan'208";a="587313638"
Received: from lab-ah.igk.intel.com ([10.91.215.196])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2022 07:19:45 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Arun R Murthy <arun.r.murthy@intel.com>, Imre Deak <imre.deak@intel.com>
Subject: [PATCH v7 0/3] drm/i915/display: stop HPD workers before display
 driver unregister
Date: Fri, 26 Aug 2022 16:19:26 +0200
Message-Id: <20220826141929.189681-1-andrzej.hajda@intel.com>
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

Hi Imre, Jani, Ville, Arun,

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
v7:
  - addresed comments from Imre and Jani,
  - removed patch adding suspended flag

[1]: https://patchwork.freedesktop.org/series/103811/

Regards
Andrzej


Andrzej Hajda (3):
  drm/i915/hpd: suspend MST at the end of intel_modeset_driver_remove
  drm/i915/fbdev: suspend HPD before fbdev unregistration
  drm/i915/fbdev: do not create fbdev if HPD is suspended

 drivers/gpu/drm/i915/display/intel_display.c | 14 +++++++-------
 drivers/gpu/drm/i915/display/intel_fbdev.c   | 12 ++++++++++--
 2 files changed, 17 insertions(+), 9 deletions(-)

-- 
2.25.1

