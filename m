Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CCC6856234
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 12:54:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DD8910E36D;
	Thu, 15 Feb 2024 11:54:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OXf7svyh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31BD010E23C;
 Thu, 15 Feb 2024 11:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707998051; x=1739534051;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=BVFqaFOd9FBPVh8+Wv/UlyHZJ6YiKiastl7z2hh+lhY=;
 b=OXf7svyh9fZNxXYJ0mIFtihKvT2bsPWqorrSCSuaqBD2RCvTS1pDUuuv
 K00Q8HBMAr1iIPWcSF8+FOa3TzAmXZd+grSEcs0pESmjP5iaU9QDNJcS0
 qTuU4AhwYoHo9wJ4JLI4EDuKdS59TqB6/vJGwoA2Elxz7CPvIqM5HDC7U
 3IZHvb/FcvrHP1F+LdtOcXR+sDNlXNW28lCV+DlurDKqm8uEM48C2fu3V
 /WwoUc1thRcKSs9qq4/NWUyh4okBacoU32cYxGuEvFUsgANihP/UW24AD
 B/BRX30RpqTybvHmODYitVaSjrwf58nAn/5/TFmcIdmDuAFHwxefQkRj0 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="13470033"
X-IronPort-AV: E=Sophos;i="6.06,161,1705392000"; d="scan'208";a="13470033"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 03:54:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,161,1705392000"; 
   d="scan'208";a="3898776"
Received: from unknown (HELO localhost) ([10.245.244.16])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 03:54:06 -0800
Date: Thu, 15 Feb 2024 13:54:03 +0200
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dim-tools@lists.freedesktop.org
Subject: [PULL] drm-intel-fixes
Message-ID: <Zc37W27F5OvoeSkG@jlahtine-mobl.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
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

Hi Dave & Sima,

Here goes drm-intel-fixes towards v6.8-rc5. Two fixes.

Fix for #10172 (blank screen on JSL Chromebooks) and limiting SST link
rate within supported range.

Best Regards, Joonas

***

drm-intel-fixes-2024-02-15:

Fix for #10172: Blank screen on JSL Chromebooks. Stable fix to limit DP SST link rate to <=8.1Gbps.

The following changes since commit 841c35169323cd833294798e58b9bf63fa4fa1de:

  Linux 6.8-rc4 (2024-02-11 12:18:13 -0800)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2024-02-15

for you to fetch changes up to ad26d56d080780bbfcc1696ca0c0cce3e2124ef6:

  drm/i915/dp: Limit SST link rate to <=8.1Gbps (2024-02-12 11:39:19 +0200)

----------------------------------------------------------------
Fix for #10172: Blank screen on JSL Chromebooks. Stable fix to limit DP SST link rate to <=8.1Gbps.

----------------------------------------------------------------
Manasi Navare (1):
      drm/i915/dsc: Fix the macro that calculates DSCC_/DSCA_ PPS reg address

Ville Syrjälä (1):
      drm/i915/dp: Limit SST link rate to <=8.1Gbps

 drivers/gpu/drm/i915/display/intel_dp.c        | 3 +++
 drivers/gpu/drm/i915/display/intel_vdsc_regs.h | 4 ++--
 2 files changed, 5 insertions(+), 2 deletions(-)
