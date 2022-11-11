Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F24625EE1
	for <lists+dri-devel@lfdr.de>; Fri, 11 Nov 2022 16:59:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDF9010E190;
	Fri, 11 Nov 2022 15:59:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB04B10E190;
 Fri, 11 Nov 2022 15:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668182344; x=1699718344;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PIcvOrz0ioq6ieqb7NRSL7t56YcBTUyjx61f23kTG44=;
 b=NDWQT9OpuvKNWiLWl/fz5qshCOvQ9uFG1zAxLFlKGj/zbpsdMQxltPXd
 XCdpMkbcc4wLLsCRSY9HLvZyxMknsDR0i1VXH2rChU4pbTxchm8RNWbZJ
 qVIT57k8LKbYlHlP3RIRjzM+Ypk5h8bfzRz4l+Suzj6dAd6yHlofoScHS
 5NpVG2VqcuVkko7ZVcLTFTBDclq6ygJ5ykv8tV7ClRRuXmkeUzAPVSsp3
 75TzZZHqH2UVXXovNUp82TPtKr/yuLJ5rYpSclYtDXBbLaeHJxPhkHKVh
 BvBAwAakzFi6hFpaMgDqDNcw5nYD4Q893vHwA/EIZ4StwN4Y0vlJNgaCq w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10528"; a="375883642"
X-IronPort-AV: E=Sophos;i="5.96,156,1665471600"; d="scan'208";a="375883642"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2022 07:59:03 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10528"; a="706577544"
X-IronPort-AV: E=Sophos;i="5.96,156,1665471600"; d="scan'208";a="706577544"
Received: from eharkin-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.208.27])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2022 07:59:01 -0800
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: igt-dev@lists.freedesktop.org, Intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH i-g-t 0/8] Vendor agnostic gputop
Date: Fri, 11 Nov 2022 15:58:36 +0000
Message-Id: <20221111155844.3290531-1-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

This is a pile of patches which implements a rudimentary vendor agnostic gputop
tool based of the new DRM spec as documented in
Documentation/gpu/drm-usage-stats.rst.

First part of the series is code refactoring which should be reasonably stable.
I've tested it all while working on it both against intel_gpu_top and gputop.

Last patch is the actual tool itself. It works but it is rather rudimentary
which is hopefully good enough for a start.

Fundamental difference between intel_gpu_top and gputop is that the former is
centered around a single card and only shows processes belonging to it. Gputop
on the other hand has an idea to show all processes with DRM file descriptors
open and sort them into groups per card. It also makes no effort to provide
sorting modes, well any interactivity, or any pretty names for GPUs or engines.

It looks like this:
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

I did test it as well with two cards and confirmed that too works.

Rob Clark also tested it with a patch which exports the respective data from the
msm driver and confirmed it works fine. Christian König tested it with in
progress patches for amdgpu and that worked as well.

v2:
 * Fixed SPDX headers and added a bunch of code comments/docs throughout.

Tvrtko Ursulin (8):
  lib: Extract igt_drm_clients from intel_gpu_top
  libdrmfdinfo: Allow specifying custom engine map
  libdrmclients: Record client drm minor
  libdrmclient: Support multiple DRM cards
  libdrmfdinfo: Track largest engine index
  libdrmclient/intel_gpu_top: Decouple hardcoded engine assumptions
  libdrmclient: Enforce client status sort order in the library
  gputop: Basic vendor agnostic GPU top tool

 lib/igt_drm_clients.c   | 503 +++++++++++++++++++++++++++++
 lib/igt_drm_clients.h   |  87 ++++++
 lib/igt_drm_fdinfo.c    |  50 ++-
 lib/igt_drm_fdinfo.h    |  16 +-
 lib/meson.build         |   8 +
 tests/i915/drm_fdinfo.c |  19 +-
 tools/gputop.c          | 260 +++++++++++++++
 tools/intel_gpu_top.c   | 677 +++++++++++-----------------------------
 tools/meson.build       |   7 +-
 9 files changed, 1113 insertions(+), 514 deletions(-)
 create mode 100644 lib/igt_drm_clients.c
 create mode 100644 lib/igt_drm_clients.h
 create mode 100644 tools/gputop.c

-- 
2.34.1

