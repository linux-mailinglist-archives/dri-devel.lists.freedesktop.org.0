Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59CB19D0A81
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2024 09:02:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C48610E26E;
	Mon, 18 Nov 2024 08:02:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ikPkmtKQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6550C10E26E;
 Mon, 18 Nov 2024 08:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731916973; x=1763452973;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5hnSTyPYWVrgsxao/GbbG/Go9lDyUZKTi/B3I3vabW4=;
 b=ikPkmtKQ9ymXCQoMTxcjr2hyIbD9Dnz0nwFjdt+DRUdZtfQPEUFiCMk+
 sbIf3G5D0OibKa+rb6q1zv8FRPmPXpGaofs/vrAvykG10AIGhWln9AXDC
 tVl0iaGRzpu6yKGJZz1ioQjOmEMwDavIKUabtcmKF1zCbv+xODiUUur8H
 VsfEP1SmnfFJCaxL8KYqECNDsZYxL8MuSTgAAl66x+xDltMwWRdqh2blP
 TO1q9W2c9M5T3uDuS3n9jETVI1RIDVHArqGvXiET/OSGSmCCuwLoPU41S
 GJ4HwQOX0JNlW9atgABZNeuqOkcMDUm2KVpfRkXXQnpwTt12PMCdUs2lh g==;
X-CSE-ConnectionGUID: JYERzCyTTg+8NAXBJZB35w==
X-CSE-MsgGUID: dYG0daboR+6eYHt+4grrDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="31915473"
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; d="scan'208";a="31915473"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 00:02:53 -0800
X-CSE-ConnectionGUID: w2eSZnkISMK7VMynCfZmdQ==
X-CSE-MsgGUID: ++cgqKIyR7CYGaXiRgrrOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; d="scan'208";a="89061816"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by orviesa010.jf.intel.com with ESMTP; 18 Nov 2024 00:02:50 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCHv2/3] Expose modifiers/formats supported by async flips
Date: Mon, 18 Nov 2024 13:23:12 +0530
Message-Id: <20241118075315.466009-1-arun.r.murthy@intel.com>
X-Mailer: git-send-email 2.25.1
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

