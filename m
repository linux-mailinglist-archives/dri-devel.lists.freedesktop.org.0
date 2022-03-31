Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E04E4EDB5D
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 16:09:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A011410E24B;
	Thu, 31 Mar 2022 14:09:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 166A110E24B;
 Thu, 31 Mar 2022 14:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648735768; x=1680271768;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3y1t0uS93fUnI9dDde71NLHWhxoCHp/Vnmk79acWmoo=;
 b=YleLVREdYaOQB/8t9cmVDYQ0FTVBKaJu4e9E/psfKvaNyqbr66JYrPD9
 w3xwb5IGwS7MqFcZdqjH4HOxS7Et710r53xbKhFJ6AbmE3VpF6SPcWLSp
 oaQWyb1hJcu/r0ZlLQINJECLuCEAn6KrK9GoPJKdpLSF4CiFG4/2o4mEM
 eZ3csaNQPTqsDv1Khj55V39d9WQmAMDQEMIZBGi1uyKZ8mIM/yXHAqq9P
 UZBY1riLvhAIAHm8DfReUBgCHYRnyTGUHFXRfp1Xy8BAas5XpJr+dHDYC
 KIralLUzqkz2IujJq6VcaRT9HRaTfd3a4S2IBOy6SGHCFhQye0NLaIsP0 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="259825408"
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400"; d="scan'208";a="259825408"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 07:09:27 -0700
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400"; d="scan'208";a="606114156"
Received: from juanniex-mobl.ger.corp.intel.com (HELO tursulin-mobl2.home)
 ([10.213.215.247])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 07:09:26 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Subject: [PATCH 0/8] Per client GPU utilisation
Date: Thu, 31 Mar 2022 15:09:12 +0100
Message-Id: <20220331140920.2986689-1-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Just a rebase - fully reviewed now.

Example of the intel_gpu_top output:
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
intel-gpu-top: Intel Tigerlake (Gen12) @ /dev/dri/card0 -  220/ 221 MHz
    70% RC6;  0.62/ 7.08 W;      760 irqs/s

         ENGINES     BUSY                                 MI_SEMA MI_WAIT
       Render/3D   23.06% |██████▊                      |      0%      0%
         Blitter    0.00% |                             |      0%      0%
           Video    5.40% |█▋                           |      0%      0%
    VideoEnhance   20.67% |██████                       |      0%      0%

   PID              NAME  Render/3D    Blitter      Video    VideoEnhance
  3082               mpv |          ||          ||▌         ||██        |
  3117         neverball |█▉        ||          ||          ||          |
     1           systemd |▍         ||          ||          ||          |
  2338       gnome-shell |          ||          ||          ||          |
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Example of the gputop output:
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
DRM minor 0
    PID               NAME    render       copy       video
    3816          kwin_x11 |███▎      ||          ||          ||          |
    3523              Xorg |▊         ||          ||          ||          |
 1120449               mpv |          ||          ||▋         ||          |
 1120529          glxgears |▋         ||          ||          ||          |
 1120449               mpv |▍         ||          ||          ||          |
    3860       plasmashell |▏         ||          ||          ||          |
    4764           krunner |          ||          ||          ||          |
  575206            chrome |          ||          ||          ||          |
  833481           firefox |          ||          ||          ||          |
  892924       thunderbird |          ||          ||          ||          |
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

v2:
 * Added prototype of possible amdgpu changes and spec updates to align with the
   common spec.

v3:
 * Documented that 'drm-driver' tag shall correspond with
   struct drm_driver.name.

v4:
 * Dropped amdgpu conversion from the series for now until AMD folks can find
   some time to finish that patch.

v5:
 * Added drm-engine-capacity-* tag.
 * Couple small tweaks.

v6:
 * Just a rebase and r-b tags updated.

Test-with: 20220331140348.2985832-1-tvrtko.ursulin@linux.intel.com

Tvrtko Ursulin (8):
  drm/i915: Explicitly track DRM clients
  drm/i915: Make GEM contexts track DRM clients
  drm/i915: Track runtime spent in closed and unreachable GEM contexts
  drm/i915: Track all user contexts per client
  drm/i915: Track context current active time
  drm: Document fdinfo format specification
  drm/i915: Count engine instances per uabi class
  drm/i915: Expose client engine utilisation via fdinfo

 Documentation/gpu/drm-usage-stats.rst         | 112 +++++++++++++
 Documentation/gpu/i915.rst                    |  28 ++++
 Documentation/gpu/index.rst                   |   1 +
 drivers/gpu/drm/i915/Makefile                 |   1 +
 drivers/gpu/drm/i915/gem/i915_gem_context.c   |  43 ++++-
 .../gpu/drm/i915/gem/i915_gem_context_types.h |   6 +
 drivers/gpu/drm/i915/gt/intel_context.c       |  27 +++-
 drivers/gpu/drm/i915/gt/intel_context.h       |  15 +-
 drivers/gpu/drm/i915/gt/intel_context_types.h |  24 ++-
 drivers/gpu/drm/i915/gt/intel_engine_user.c   |  11 +-
 .../drm/i915/gt/intel_execlists_submission.c  |  23 ++-
 .../gpu/drm/i915/gt/intel_gt_clock_utils.c    |   4 +
 drivers/gpu/drm/i915/gt/intel_lrc.c           |  27 ++--
 drivers/gpu/drm/i915/gt/intel_lrc.h           |  27 +++-
 drivers/gpu/drm/i915/gt/selftest_lrc.c        |  10 +-
 drivers/gpu/drm/i915/i915_driver.c            |   9 ++
 drivers/gpu/drm/i915/i915_drm_client.c        | 151 ++++++++++++++++++
 drivers/gpu/drm/i915/i915_drm_client.h        |  68 ++++++++
 drivers/gpu/drm/i915/i915_drv.h               |   4 +
 drivers/gpu/drm/i915/i915_file_private.h      |   3 +
 drivers/gpu/drm/i915/i915_gem.c               |  21 ++-
 drivers/gpu/drm/i915/i915_gpu_error.c         |   9 +-
 drivers/gpu/drm/i915/i915_gpu_error.h         |   2 +-
 23 files changed, 566 insertions(+), 60 deletions(-)
 create mode 100644 Documentation/gpu/drm-usage-stats.rst
 create mode 100644 drivers/gpu/drm/i915/i915_drm_client.c
 create mode 100644 drivers/gpu/drm/i915/i915_drm_client.h

-- 
2.32.0

