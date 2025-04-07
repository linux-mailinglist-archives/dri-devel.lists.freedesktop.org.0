Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F351BA7D3B6
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 07:58:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C75C210E1C8;
	Mon,  7 Apr 2025 05:58:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q705m/ui";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B805010E1C7;
 Mon,  7 Apr 2025 05:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744005497; x=1775541497;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=zmm4cvkElqUwjaREmcopbVxbG8aIFtQqQ7+UtPoMjWs=;
 b=Q705m/uiYE9WE03DTavLxE4wkM+XWnEG69PXg9f3NCLBUc84ivQD6+6/
 8aLClVPICjMqrnRerYpqjUqDsA/J2HbwARRbGed59ylas4ee/MQv1xCi3
 7Pa6SrT2skHGi5BFVJUHqUrv1TIldbgLTj2tovz2PGPonJ+7RiXz5krAT
 T2j1xzvP3fVnPKU7R0VdkAY2cat9qUOg2pGAEPaWcpIX0YrKmWQZGQZUX
 XPVA/r/cZNC4nPdf2Ga4aFg0ceZlLxnvhKkBMHkHvJwC8hQ6jVLLh3qhB
 a7Kmtu5uXsk2CvNVvtnS1ZJlkwovqhGItn++LnzTDWtHA86lJZ9XPPhDH w==;
X-CSE-ConnectionGUID: I/NiGrf+R7OlJ9JzFTjNZg==
X-CSE-MsgGUID: EtaNfIOOQ+2QgU4BfzL1YQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="45391823"
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; d="scan'208";a="45391823"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2025 22:58:17 -0700
X-CSE-ConnectionGUID: Uvb+MPMQR5e9BY7X74aYDQ==
X-CSE-MsgGUID: 7NI+LTOyS/2W/tfUv+FY1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; d="scan'208";a="128373965"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by orviesa007.jf.intel.com with ESMTP; 06 Apr 2025 22:58:15 -0700
From: Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCH RESEND v13 0/5] Expose modifiers/formats supported by async
 flips
Date: Mon, 07 Apr 2025 11:13:44 +0530
Message-Id: <20250407-asyn-v13-0-b93ef83076c5@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABBm82cC/23OzU6EMBQF4FeZdG3Jvf2juHLhbF3o0ri4lCJNB
 ExhiGTCu9tByRDHZU/6nXvObPAx+IHdH84s+ikMoe/SA+XdgbmGunfPQ5UCJkBoQBCchrnjZZ2
 bXEJKnGPp62f0dfhae17Z8/Hl+PTI3lJex77lYxM9bSUKES3kWqLOlDEABUdO8dRlMWtPcWzmh
 9CN/iNzfXtpbsIw9nFeB0567V+nCLQ/UybNgefkNDlFZaVo5y8TJntFEn/3TzYhcMqVXhMYU/1
 FCDsltlOYELelpQqFq12R3zD8l2FipKFCWdae4PaauDIFamMiscILWRhdGJBmz5Zl+QbzjH8Gv
 QEAAA==
X-Change-ID: 20250102-asyn-bf76730501cc
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 chaitanya.kumar.borah@intel.com, ville.syrjala@intel.com, 
 Arun R Murthy <arun.r.murthy@intel.com>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, 
 Naveen Kumar <naveen1.kumar@intel.com>
X-Mailer: b4 0.15-dev
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

All of the formats/modifiers supported by the plane during synchronous
flips are nor supported by asynchronous flips. The formats/modifiers
exposed to user by IN_FORMATS exposes all formats/modifiers supported by
plane and this list varies for async flips. If the async flip supported
formats/modifiers are exposed to the user, user based on this list can
take decision to proceed or not and avoid flip failures during async
flips.
Discussion around this can be located @
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/29618#note_2487123
Mutter implementation for IN_FORMARTS_ASYNC under review @
https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/4063
Xorg/modesetting patch
https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/1816

TODO: Upon merge of the patch related to async flip
https://patchwork.freedesktop.org/patch/626849/?series=139807&rev=6
the patch 5 in this series will have to make use of the new function
pointer can_async_flip().

v3: Add new plane->funcs format_mod_supported_async (Ville)
v13: Updated the link to IGT patches.

Arun R Murthy (3):
  drm/plane: Add new plane property IN_FORMATS_ASYNC
  drm/plane: Expose function to create format/modifier blob
  drm/i915/display: Populate list of async supported formats/modifiers

 drivers/gpu/drm/drm_mode_config.c             |  7 +++
 drivers/gpu/drm/drm_plane.c                   | 50 ++++++++++++------
 .../drm/i915/display/skl_universal_plane.c    | 51 +++++++++++++++++++
 include/drm/drm_mode_config.h                 |  6 +++
 include/drm/drm_plane.h                       |  4 ++
 5 files changed, 103 insertions(+), 15 deletions(-)

--
2.25.1

---
Arun R Murthy (5):
      drm/plane: Add new plane property IN_FORMATS_ASYNC
      drm/plane: Expose function to create format/modifier blob
      drm/plane: Function to check async supported modifier/format
      drm/i915/display: Populate list of async supported formats/modifiers
      drm/i915/display: Add function for format_mod_supported_async

 drivers/gpu/drm/drm_mode_config.c                  |   7 ++
 drivers/gpu/drm/drm_plane.c                        |  72 +++++++++----
 drivers/gpu/drm/i915/display/skl_universal_plane.c | 113 ++++++++++++++++++---
 include/drm/drm_mode_config.h                      |   6 ++
 include/drm/drm_plane.h                            |  24 +++++
 5 files changed, 188 insertions(+), 34 deletions(-)
---
base-commit: 08bd590935a5258ffd79355c59adffd72fb2c642
change-id: 20250102-asyn-bf76730501cc

Best regards,
--
Arun R Murthy <arun.r.murthy@intel.com>

---
Changes in v13:
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v12: https://lore.kernel.org/r/20250404-asyn-v12-0-9e2396596036@intel.com

Changes in v12:
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v11: https://lore.kernel.org/r/20250328-asyn-v11-0-a50d13bfea0d@intel.com

Changes in v11:
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v10: https://lore.kernel.org/r/20250328-asyn-v10-0-8b8ad12cfc97@intel.com

Changes in v9:
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v8: https://lore.kernel.org/r/20250312-asyn-v8-0-0c4cbe5a066d@intel.com

Changes in v6:
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v5: https://lore.kernel.org/r/20250218-asyn-v5-0-7ac5ac4abd4a@intel.com

---
Arun R Murthy (3):
      drm/plane: Add new plane property IN_FORMATS_ASYNC
      drm/plane: modify create_in_formats to accommodate async
      drm/i915/display: Add i915 hook for format_mod_supported_async

 drivers/gpu/drm/drm_mode_config.c                  |  7 +++
 drivers/gpu/drm/drm_plane.c                        | 53 +++++++++++++++-----
 drivers/gpu/drm/i915/display/skl_universal_plane.c | 56 ++++++++++++++++------
 include/drm/drm_mode_config.h                      |  6 +++
 include/drm/drm_plane.h                            | 17 +++++++
 5 files changed, 112 insertions(+), 27 deletions(-)
---
base-commit: bc7a84cbc968ce97e581e9e3c2d26fb0ac106482
change-id: 20250102-asyn-bf76730501cc

Best regards,
--
Arun R Murthy <arun.r.murthy@intel.com>

---
Arun R Murthy (3):
      drm/plane: Add new plane property IN_FORMATS_ASYNC
      drm/plane: modify create_in_formats to accommodate async
      drm/i915/display: Add i915 hook for format_mod_supported_async

 drivers/gpu/drm/drm_mode_config.c                  |  7 ++++
 drivers/gpu/drm/drm_plane.c                        | 49 ++++++++++++++++------
 drivers/gpu/drm/i915/display/i9xx_plane.c          |  6 ++-
 drivers/gpu/drm/i915/display/intel_atomic_plane.c  | 30 ++++++++++++-
 drivers/gpu/drm/i915/display/intel_atomic_plane.h  |  6 ++-
 drivers/gpu/drm/i915/display/intel_display.c       | 11 +----
 drivers/gpu/drm/i915/display/skl_universal_plane.c |  5 ++-
 include/drm/drm_mode_config.h                      |  6 +++
 include/drm/drm_plane.h                            | 17 ++++++++
 9 files changed, 111 insertions(+), 26 deletions(-)
---
base-commit: be5a404c3344b7d794766f045b8f94aa93c42069
change-id: 20250102-asyn-bf76730501cc

Best regards,
--
Arun R Murthy <arun.r.murthy@intel.com>

---
Arun R Murthy (3):
      drm/plane: Add new plane property IN_FORMATS_ASYNC
      drm/plane: modify create_in_formats to accommodate async
      drm/i915/display: Add i915 hook for format_mod_supported_async

 drivers/gpu/drm/drm_mode_config.c                  |  7 +++
 drivers/gpu/drm/drm_plane.c                        | 52 ++++++++++++++++------
 drivers/gpu/drm/i915/display/i9xx_plane.c          |  6 ++-
 drivers/gpu/drm/i915/display/intel_atomic_plane.c  | 32 ++++++++++++-
 drivers/gpu/drm/i915/display/intel_atomic_plane.h  |  6 ++-
 drivers/gpu/drm/i915/display/intel_display.c       | 14 ++----
 drivers/gpu/drm/i915/display/skl_universal_plane.c |  5 ++-
 include/drm/drm_mode_config.h                      |  6 +++
 include/drm/drm_plane.h                            | 17 +++++++
 9 files changed, 117 insertions(+), 28 deletions(-)
---
base-commit: aba848f9b752cf51474c0c3b1abcf0f572f774dc
change-id: 20250102-asyn-bf76730501cc

Best regards,
--
Arun R Murthy <arun.r.murthy@intel.com>

---
Arun R Murthy (5):
      drm/plane: Add new plane property IN_FORMATS_ASYNC
      drm/plane: modify create_in_formats to acommodate async
      drm/i915/display: Acomodate format check in can_async_flip()
      drm/i915/display: Add i915 hook for format_mod_supported_async
      drm/i915/display: Indexed 8bit format does not support async flip

 drivers/gpu/drm/drm_mode_config.c                  |  7 +++
 drivers/gpu/drm/drm_plane.c                        | 52 ++++++++++++++++------
 drivers/gpu/drm/i915/display/i9xx_plane.c          |  6 ++-
 drivers/gpu/drm/i915/display/intel_atomic_plane.c  | 22 ++++++++-
 drivers/gpu/drm/i915/display/intel_atomic_plane.h  |  6 ++-
 drivers/gpu/drm/i915/display/intel_display.c       | 14 ++----
 drivers/gpu/drm/i915/display/skl_universal_plane.c |  5 ++-
 include/drm/drm_mode_config.h                      |  6 +++
 include/drm/drm_plane.h                            | 17 +++++++
 9 files changed, 107 insertions(+), 28 deletions(-)
---
base-commit: c1893793c7d3868fe083bdab33999178337b5561
change-id: 20250102-asyn-bf76730501cc

Best regards,
--
Arun R Murthy <arun.r.murthy@intel.com>

---
Arun R Murthy (5):
      drm/plane: Add new plane property IN_FORMATS_ASYNC
      drm/plane: modify create_in_formats to acommodate async
      drm/i915/display: Acomodate format check in intel_plane_can_async_flip()
      drm/i915/display: Add i915 hook for format_mod_supported_async
      drm/i915/display: Indexed 8bit format does not support async flip

 drivers/gpu/drm/drm_mode_config.c                  |  7 +++
 drivers/gpu/drm/drm_plane.c                        | 52 ++++++++++++++++------
 drivers/gpu/drm/i915/display/i9xx_plane.c          |  6 ++-
 drivers/gpu/drm/i915/display/intel_atomic_plane.c  | 18 +++++++-
 drivers/gpu/drm/i915/display/intel_atomic_plane.h  |  6 ++-
 drivers/gpu/drm/i915/display/intel_display.c       | 14 ++----
 drivers/gpu/drm/i915/display/skl_universal_plane.c |  5 ++-
 include/drm/drm_mode_config.h                      |  6 +++
 include/drm/drm_plane.h                            | 17 +++++++
 9 files changed, 103 insertions(+), 28 deletions(-)
---
base-commit: 8a0f86f7106709c73acb1477af9ad5f267d7a340
change-id: 20250102-asyn-bf76730501cc

Best regards,
-- 
Arun R Murthy <arun.r.murthy@intel.com>

