Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0645B737F35
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 11:55:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C196C10E432;
	Wed, 21 Jun 2023 09:55:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 450AE10E430;
 Wed, 21 Jun 2023 09:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687341302; x=1718877302;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=F2mry1d8GnAtz4qu01BktESobnqbuu7wjoYN0vWB4VE=;
 b=WmcuqzISchPjdkOODjpx7CJcPjm1qiIp08CWr/wPMAQit+0sEzf2WD/N
 N5sWgFjSe0rSYhugXHlT7rxfRgWvyrh7LjprVghcLKMYmHLJeBF6plP2g
 IF3lHNwKOgovsqs/AX2SXLnhwiDZunar+kwU+/UeepM7yYUVgOmS05ayD
 Y2OVpzlqXuoK3C3HlV8cpNqf+Dzld191iCLTXCNZbv0k/DOUiujRw1zHm
 b2H8WSCT4DGlYU4CKhMbQfbvCloCq5kpMmEbD0mpmUKApYHMKd33Qnl5Q
 xVwhUVRU9p1/WOU3PMM3i8Hp6LdZUXVKGoT8PrSi38RxHVhn6wMEG0xfQ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="423788626"
X-IronPort-AV: E=Sophos;i="6.00,260,1681196400"; d="scan'208";a="423788626"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2023 02:55:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="838555811"
X-IronPort-AV: E=Sophos;i="6.00,260,1681196400"; d="scan'208";a="838555811"
Received: from psscully-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.213.228.117])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2023 02:54:58 -0700
Date: Wed, 21 Jun 2023 10:54:56 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-next-fixes
Message-ID: <ZJLI8ON96ApPTl8H@tursulin-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
 dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave, Daniel,

A weekly collection of fixes for the drm-next/6.5 merge window:

One fix for incorrect error handling in the frame buffer mmap callback,
HuC init error handling fix, missing wakeref during GSC init and a build
fix when !CONFIG_PROC_FS.

Regards,

Tvrtko

drm-intel-next-fixes-2023-06-21:
One fix for incorrect error handling in the frame buffer mmap callback,
HuC init error handling fix, missing wakeref during GSC init and a build
fix when !CONFIG_PROC_FS.
The following changes since commit 2222dcb0775d36de28992f56455ab3967b30d380:

  Merge tag 'drm-msm-next-2023-06-18' of https://gitlab.freedesktop.org/drm/msm into drm-next (2023-06-19 16:01:46 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-next-fixes-2023-06-21

for you to fetch changes up to 274d4b96b12f78cef4f72a97a4967032233f6cae:

  drm/i915: Fix a NULL vs IS_ERR() bug (2023-06-20 08:54:47 +0100)

----------------------------------------------------------------
One fix for incorrect error handling in the frame buffer mmap callback,
HuC init error handling fix, missing wakeref during GSC init and a build
fix when !CONFIG_PROC_FS.

----------------------------------------------------------------
Alan Previn (1):
      drm/i915/gsc: take a wakeref for the proxy-init-completion check

Arnd Bergmann (1):
      drm/i915: make i915_drm_client_fdinfo() reference conditional again

Dan Carpenter (1):
      drm/i915: Fix a NULL vs IS_ERR() bug

Harshit Mogalapalli (1):
      drm/i915/huc: Fix missing error code in intel_huc_init()

 drivers/gpu/drm/i915/gem/i915_gem_mman.c  |  4 ++--
 drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c | 22 ++++++++++++++--------
 drivers/gpu/drm/i915/gt/uc/intel_huc.c    |  1 +
 drivers/gpu/drm/i915/i915_driver.c        |  2 +-
 drivers/gpu/drm/i915/i915_drm_client.h    |  2 --
 5 files changed, 18 insertions(+), 13 deletions(-)
