Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C19FA052DA
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 06:53:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B13C10E346;
	Wed,  8 Jan 2025 05:53:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="deZPa1iD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47DB510E271;
 Wed,  8 Jan 2025 05:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736315619; x=1767851619;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=EtUZnS/GTi3/FsQN9SotmFS4+2GEkV8npGNmirHAtyw=;
 b=deZPa1iD40SKfy7EoF3eYVx4CMq836nbCvjqBy6Y+kodoehccvGbSkRz
 5BhovmxIBRjE3eC6uLrGwPJJ7q0L7r7Z3n2NZyJFSFn1maIiv2EYdruvS
 fgtHWWN9KO/Bm7EhX7xtgpx7MfgULO1nhloh55S5epNR0nxEIkRmyLURZ
 AtpNg20S5xnuBunkVToswN8j62dTO23jEJYYLaRAm5AFMmp0olt+qEeDq
 ihZeUKbWMcxhlQUNGV3lY0K3tDb/0dx4VfR0YO9Jix5wSdhwQqqCXQqcH
 zJkA3ls7OByNrqo6N3niqWkcfQGXEJ8z3UJbyfCtntd9Us1t6kLhzfRKd Q==;
X-CSE-ConnectionGUID: s977saqOSTiE5AY9zyek4w==
X-CSE-MsgGUID: xYMmFmJuQSWw447nlAvbtw==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="61903896"
X-IronPort-AV: E=Sophos;i="6.12,297,1728975600"; d="scan'208";a="61903896"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 21:53:39 -0800
X-CSE-ConnectionGUID: JvsHydFyQWqAfa6B1AmUnA==
X-CSE-MsgGUID: X288V6jLSYKEoC8OlceDkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="107024101"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa003.fm.intel.com with ESMTP; 07 Jan 2025 21:53:37 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCH v3 0/5] Expose modifiers/formats supported by async flips
Date: Wed, 08 Jan 2025 11:08:58 +0530
Message-Id: <20250108-asyn-v3-0-f4399635eec9@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHIPfmcC/zXMzQ7CIBAE4Fdp9ixkoT+oJ9/DeEDcComFZqHGp
 um7S0w8fpOZ2SATB8pwbjZgeoccUqxoDw04b+OTRHhUg0bdo0ItbF6juI9mMC3WxDmo1ZlpDJ/
 fzfVWPXKaRPFM9j/ulFJHNH2retkNA+JJKGF5iZLltHDx6yXEQi/p0gT7/gUWa0kmmAAAAA==
X-Change-ID: 20250102-asyn-bf76730501cc
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
Cc: Arun R Murthy <arun.r.murthy@intel.com>
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
Userspace implementation for IN_FORMARTS_ASYNC under review @
https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/4063

TODO: Upon merge of the patch related to async flip
https://patchwork.freedesktop.org/patch/626849/?series=139807&rev=6
the patch 5 in this series will have to make use of the new function
pointer can_async_flip().

v3: Add new plane->funcs format_mod_supported_async (Ville)

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

