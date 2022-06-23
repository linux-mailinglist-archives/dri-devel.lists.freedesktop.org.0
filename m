Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F61558001
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jun 2022 18:38:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0115010E10C;
	Thu, 23 Jun 2022 16:38:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9304D10E10C;
 Thu, 23 Jun 2022 16:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656002307; x=1687538307;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8Bg23GD8dBBV+9o9e5IQ17SzOyPcblGS89R0LksbrNc=;
 b=isc5gUb4045YQUr01692V7XJ57T7vHBJifEoIy6fiR9dNFvRg62UVIJJ
 fRAAFOf71idlgbnu01D3bmjl0fZfziYqS2w0tbya0rFJOpQs2ISrNF0jV
 rrOffKCaSvfGlfP4S+FOsP9X+SDYwivQQdWOv6dvs6ML5kz+LIgJeVx51
 k861opIBRsHNgcfT9r1Np6TMC0DUeP00gvMHemVDf6BWE6isVlfoU++0X
 I6X/WUB/zNITM8wBYTiWedBUFVgjVQVyyrm/B5UWv99mUnKn9STAgJDaA
 gc4YZKW9zrOXpIt94Tf604tfwPjHxcxBTRxfNxOKpgSEzFO1Pks8li9w3 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10386"; a="279538922"
X-IronPort-AV: E=Sophos;i="5.92,216,1650956400"; d="scan'208";a="279538922"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2022 09:38:27 -0700
X-IronPort-AV: E=Sophos;i="5.92,216,1650956400"; d="scan'208";a="915266321"
Received: from lab-ah.igk.intel.com ([10.91.215.196])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2022 09:38:25 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH 0/2] drm/i915/display: stop HPD workers before display driver
 unregister
Date: Thu, 23 Jun 2022 18:38:11 +0200
Message-Id: <20220623163813.1990801-1-andrzej.hajda@intel.com>
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

Hi Jani, Ville,

This patchset is replacement of patch
"drm/i915/display: disable HPD workers before display driver unregister" [1].
Ive decided to split patch into two parts - fbdev and MST, there are different
issues.
Ive also dropped shutdown path, as it has slightly different requirements,
and more importantly I am not able to test properly.

[1]: https://patchwork.freedesktop.org/series/103811/

Regards
Andrzej


Andrzej Hajda (2):
  drm/i915/hpd: postpone HPD cancel work after last user suspension
  drm/i915/fbdev: suspend HPD before fbdev unregistration

 drivers/gpu/drm/i915/display/intel_display.c |  3 ++
 drivers/gpu/drm/i915/display/intel_fbdev.c   | 44 ++++++++++----------
 drivers/gpu/drm/i915/i915_irq.c              |  1 -
 3 files changed, 26 insertions(+), 22 deletions(-)

-- 
2.25.1

