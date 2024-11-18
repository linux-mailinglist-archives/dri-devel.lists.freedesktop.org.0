Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91FCD9D0A75
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2024 08:58:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E85010E330;
	Mon, 18 Nov 2024 07:58:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UYgJJSBr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 611FF10E267;
 Mon, 18 Nov 2024 07:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731916730; x=1763452730;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5hnSTyPYWVrgsxao/GbbG/Go9lDyUZKTi/B3I3vabW4=;
 b=UYgJJSBruWQNbsEXny/lgtqiuZ5+ioSGAGS8P7dwx9wxdTLXbxUhuV9e
 S26uTI3gDAKKVoxeGqY5xc9m9wN/4RFxRoAE7pqnyfzlX9wyBjtsaRdvc
 C0USsfIA5OG/qZEzzVfB/XeawvLf67wL7u4kY+4OZmSDKi/QZZUPnqpJU
 ypB5sswdoNJtc5VEo4Db1wJAK18aRz7/8dfYZCIphB85BFeCw8HiGe3OV
 3Acy+onSglnJ24CLvSEv7g4PwH5VJRchAJXrG9iNQ7uEXJ4R4mhFPFA0v
 /6bLpnlZV3y7g/+dyZPEn+dkQ/GFHSUb+P1rTWaFZZN+CjG/GnleBYfF2 g==;
X-CSE-ConnectionGUID: VMiRaiStTxukkahZ7MrYjQ==
X-CSE-MsgGUID: hvmyZT21TuW+/xXgJojP7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="32096124"
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; d="scan'208";a="32096124"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2024 23:58:50 -0800
X-CSE-ConnectionGUID: svLS/IyWRCOaH8xPeQDy8A==
X-CSE-MsgGUID: BXTwX12mQWigVO0LaN/HgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; d="scan'208";a="89558030"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa010.fm.intel.com with ESMTP; 17 Nov 2024 23:58:38 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCHv2/3] Expose modifiers/formats supported by async flips
Date: Mon, 18 Nov 2024 13:18:57 +0530
Message-Id: <20241118074900.465910-1-arun.r.murthy@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241105102608.3912133-1-arun.r.murthy@intel.com>
References: <20241105102608.3912133-1-arun.r.murthy@intel.com>
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

