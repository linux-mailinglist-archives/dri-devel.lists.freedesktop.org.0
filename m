Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C83096808E
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2024 09:28:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1612110E208;
	Mon,  2 Sep 2024 07:28:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="giJK+90O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FBEE10E204;
 Mon,  2 Sep 2024 07:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725262097; x=1756798097;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=D6YB1vgX6tILqCi00/XFh47N8LdLs6NM0V4wHfaRCx0=;
 b=giJK+90OaqNEZ5MmWk5oRxQN/An0tRggWjQiUs7b49z2N1Un0NdedBL/
 MLwXJYI+n/w90RBGpGYiyiNqrogLLO0x0Ep/DHFH4bmyjNSgEubDGDc/Y
 TqXeJfS99JlG9biu/sUxS5+C95dEP6tx1edcrGg3o5jr5YZpTCg1tzlTl
 HcMo9lmzmmCIhiWCOHYrp9CHvZ++q0GI/BUF3EIrrDWTSnmh5u7312GLN
 7ppeISR2SJI+cWsOxu0FWR7UekotE2AxC07wmtkBOCwLBc3YAIWoWC8Me
 KQBW8BW6RpQQWgkxuHtM5ROLU4drPUJBqttyt/s+pU8zO45ZySTZWvvdl w==;
X-CSE-ConnectionGUID: drcUVVUSSW2Jsc1fS71F7Q==
X-CSE-MsgGUID: K0/8euowRtiMeh6OHxbKkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11182"; a="23990619"
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="23990619"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2024 00:28:17 -0700
X-CSE-ConnectionGUID: bAvLgwHJTXqU2MJnR6hGOQ==
X-CSE-MsgGUID: WU8zJlrsRGKwT7ZGUE23rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="68922585"
Received: from jraag-nuc8i7beh.iind.intel.com ([10.145.169.79])
 by fmviesa005.fm.intel.com with ESMTP; 02 Sep 2024 00:28:12 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: airlied@gmail.com, daniel@ffwll.ch, lucas.demarchi@intel.com,
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 tursulin@ursulin.net
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
 francois.dugast@intel.com, aravind.iddamsetty@linux.intel.com,
 anshuman.gupta@intel.com, bellekallu.rajkiran@intel.com,
 saikishore.konda@intel.com, Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v3 0/3] Introduce DRM device wedged event
Date: Mon,  2 Sep 2024 13:18:56 +0530
Message-Id: <20240902074859.2992849-1-raag.jadav@intel.com>
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

Himal Prasad Ghimiray (1):
  drm/xe: Use device wedged event

Raag Jadav (2):
  drm: Introduce device wedged event
  drm/i915: Use device wedged event

 drivers/gpu/drm/drm_drv.c             | 21 +++++++++++++++++++++
 drivers/gpu/drm/i915/gt/intel_reset.c |  2 ++
 drivers/gpu/drm/xe/xe_device.c        |  8 ++++++--
 include/drm/drm_drv.h                 |  1 +
 4 files changed, 30 insertions(+), 2 deletions(-)

-- 
2.34.1

