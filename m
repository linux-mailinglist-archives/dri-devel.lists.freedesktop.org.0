Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F0C96EFD5
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 11:43:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8149F10E17A;
	Fri,  6 Sep 2024 09:43:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dHGxM4Xz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9114010E132;
 Fri,  6 Sep 2024 09:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725615778; x=1757151778;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=upkDHeAF6QAO3X+zfPD9BoxMhLKq0ZKjpL0xoL57B1k=;
 b=dHGxM4XztgJJqdF6Hpk/tyf9I1pDbVZtK+TJK27qse9Dq4TV8tkWuttc
 9pQeOFvYhnFnxlY6FEIo1mNZoAGKU92LyGhBqeEgcgTzVTTcwKMNrZqHd
 hgd1uXWkJgbFm6XnBKH77lgxwt1QUhTMZEMk3QhwHCr4bCU02/WsfGzdz
 8XnV5Ts0neNL8wA8BJ1lWvGbhhJaGM7uzRQ+t2Zsjvq0vkwKWidWp8QYI
 mg9rwFZ2kV3jJbVSJimxY8a4AugErEtgpgt4T7SMyPYkpa5tBo+EtzEc7
 w1peVhMpVoNUL2IP/3mmSHFy/8EaX9CtT30SFsNFfRUZPhCJtnwSgpF89 w==;
X-CSE-ConnectionGUID: eSOLopULQNWxmVL2YBYFUg==
X-CSE-MsgGUID: +bVS6bqaRNCYldQmc+gNfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="34965476"
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; d="scan'208";a="34965476"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 02:42:57 -0700
X-CSE-ConnectionGUID: A9sIq1EqSomSy5XKUh+PWA==
X-CSE-MsgGUID: fKEIPHNTSRCrUH6CiGRRSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; d="scan'208";a="103377541"
Received: from jraag-nuc8i7beh.iind.intel.com ([10.145.169.79])
 by orviesa001.jf.intel.com with ESMTP; 06 Sep 2024 02:42:52 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: airlied@gmail.com, daniel@ffwll.ch, lucas.demarchi@intel.com,
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 tursulin@ursulin.net
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
 francois.dugast@intel.com, aravind.iddamsetty@linux.intel.com,
 anshuman.gupta@intel.com, Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v4 0/3] Introduce DRM device wedged event
Date: Fri,  6 Sep 2024 15:12:22 +0530
Message-Id: <20240906094225.3082162-1-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
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

This series introduces device wedged event in DRM subsystem and uses
it in xe and i915 drivers. Detailed description in commit message.

This was earlier attempted as xe specific uevent in v1 and v2.
https://patchwork.freedesktop.org/series/136909/

v2: Change authorship to Himal (Aravind)
    Add uevent for all device wedged cases (Aravind)
v3: Generic re-implementation in DRM subsystem (Lucas)
v4: s/drm_dev_wedged/drm_dev_wedged_event
    Use drm_info() (Jani)
    Kernel doc adjustment (Aravind)
    Change authorship to Raag (Aravind)

Raag Jadav (3):
  drm: Introduce device wedged event
  drm/xe: Use device wedged event
  drm/i915: Use device wedged event

 drivers/gpu/drm/drm_drv.c             | 20 ++++++++++++++++++++
 drivers/gpu/drm/i915/gt/intel_reset.c |  2 ++
 drivers/gpu/drm/xe/xe_device.c        |  8 ++++++--
 include/drm/drm_drv.h                 |  1 +
 4 files changed, 29 insertions(+), 2 deletions(-)

-- 
2.34.1

