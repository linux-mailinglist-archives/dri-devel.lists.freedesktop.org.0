Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 753954BF9F0
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 14:56:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ED7C10E604;
	Tue, 22 Feb 2022 13:56:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6F9310E604;
 Tue, 22 Feb 2022 13:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645538175; x=1677074175;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=VybE+oNBUrebDvAnuKGlju8joFmPkWh/Jx3aEP/HR7Q=;
 b=IgBFj9zeFZ8QAb7sNPeQcd1oCOoScR9ajPHiM28S3g2kpUmX2dgdNuqx
 N2ijF4HNKRBxFvgPDTiqg0MziR9fZMIB8sUoKdYj0V4Jvsgkb3v9MApdM
 lRQdORlo3Nz8dSJ2uM6YyW7CvMAYHbhN67d2VB0j7n6Uz5y5TYpAV+AQu
 zH2TdrOwpi2cWtmKe6F/INDBoPY8VxRaodlJ/J1lGzoSuZlyMTVa3kupN
 xd04S/Q0WDZ5ezfvBl2J0foggZPkdPR0TA6inc+GIciaa9rd55B9fF8P6
 T9G5MkBLGQKMbP5Wdg0QrYsvSwzBmfRU++bTKbro7dDXWpZBKcl1eChmO g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10265"; a="232326439"
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; d="scan'208";a="232326439"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 05:56:14 -0800
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; d="scan'208";a="505534041"
Received: from sjgillin-mobl.ger.corp.intel.com (HELO tursulin-mobl2.home)
 ([10.213.218.63])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 05:56:13 -0800
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 00/11] Per client GPU utilisation
Date: Tue, 22 Feb 2022 13:55:54 +0000
Message-Id: <20220222135605.1120767-1-tvrtko.ursulin@linux.intel.com>
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
Cc: Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

This series contains four main components:

 1. Per client support for intel_gpu_top.
 2. IGT test for per client data exposed via fdinfo from i915.
 3. Extracting intel_gpu_top code into shared IGT libraries - which makes
    possible to write:
 4. Vendor agnostic rudimentary gputop tool.

Since I had the intel_gpu_top code for years, this flow of the series is what
I ended up with. But it also makes sense since we can have a cut point after
intel_gpu_top, in case the common drm fdinfo specification does not end up
getting enough traction.

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

Tvrtko Ursulin (11):
  lib: Helper library for parsing i915 fdinfo output
  tests/i915/drm_fdinfo: Basic and functional tests for GPU busyness
    exported via fdinfo
  intel-gpu-top: Add support for per client stats
  lib: Extract igt_drm_clients from intel_gpu_top
  libdrmfdinfo: Allow specifying custom engine map
  libdrmclients: Record client drm minor
  libdrmclient: Support multiple DRM cards
  libdrmfdinfo: Track largest engine index
  libdrmclient/intel_gpu_top: Decouple hardcoded engine assumptions
  libdrmclient: Enforce client status sort order in the library
  gputop: Basic vendor agnostic GPU top tool

 lib/igt_drm_clients.c   | 443 +++++++++++++++++++++++++++++++
 lib/igt_drm_clients.h   | 104 ++++++++
 lib/igt_drm_fdinfo.c    | 200 ++++++++++++++
 lib/igt_drm_fdinfo.h    |  52 ++++
 lib/meson.build         |  15 ++
 man/intel_gpu_top.rst   |   4 +
 tests/i915/drm_fdinfo.c | 565 ++++++++++++++++++++++++++++++++++++++++
 tests/meson.build       |   8 +
 tools/gputop.c          | 276 ++++++++++++++++++++
 tools/intel_gpu_top.c   | 497 ++++++++++++++++++++++++++++++++++-
 tools/meson.build       |   7 +-
 11 files changed, 2159 insertions(+), 12 deletions(-)
 create mode 100644 lib/igt_drm_clients.c
 create mode 100644 lib/igt_drm_clients.h
 create mode 100644 lib/igt_drm_fdinfo.c
 create mode 100644 lib/igt_drm_fdinfo.h
 create mode 100644 tests/i915/drm_fdinfo.c
 create mode 100644 tools/gputop.c

-- 
2.32.0

