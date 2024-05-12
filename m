Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 807B68C3719
	for <lists+dri-devel@lfdr.de>; Sun, 12 May 2024 17:36:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 843BD10E27F;
	Sun, 12 May 2024 15:36:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kZR50bxn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E61F10E251;
 Sun, 12 May 2024 15:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715528188; x=1747064188;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=evDTg3GHvgeEAmXtLJweCY8WZi1mCFFe5o2IEX6ubQE=;
 b=kZR50bxnvbZpydUwt7gIqIvJzsl1baqmESucI2MYA628PwhNswKgYYji
 Cnqu84wZbFoUOqS5tHvL6D3y9pBXNfWkLmBvUKnk3kZzkS54B0muvqIB7
 SFU87poqThR58bCdHzJBnfu1WGTuEKX7UKYEJ8fFXMIjtvB4WBFktPXWQ
 ddBEJyoFNtQfonDrBfIfzhrAYtTLqd/4/0DJoMVkK2teL/W9rX4zb6xba
 +ZDCKMo1JZfcXN4HXmW2mcQ8Lklchh3630J/TnfGYaJEDcKnaVfKlEu1O
 cGfuf+HjMGNQZT/0rddQApAk6o3q4olmtvC4GgUM8SYtmh9WDLNdVR1bZ g==;
X-CSE-ConnectionGUID: 7KKLYW7qSgCZoPKkGkR24A==
X-CSE-MsgGUID: HJkzZ7LJTL2KoET9tk0LJA==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="11403299"
X-IronPort-AV: E=Sophos;i="6.08,156,1712646000"; d="scan'208";a="11403299"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2024 08:36:27 -0700
X-CSE-ConnectionGUID: I5YStJUgQYekaUQSkMo9Ow==
X-CSE-MsgGUID: dV5CvDsdS2mAW9WTf295hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,156,1712646000"; d="scan'208";a="34976553"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.25.139])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2024 08:36:25 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 linux-fsdevel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH 0/4] Expose raw access to GuC log over debugfs
Date: Sun, 12 May 2024 17:36:02 +0200
Message-Id: <20240512153606.1996-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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

We already provide the content of the GuC log in debugsfs, but it
is in a text format where each log dword is printed as hexadecimal
number, which does not scale well with large GuC log buffers.

Cc: linux-fsdevel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org

Michal Wajdeczko (4):
  libfs: add simple_read_from_iomem()
  iosys-map: add iosys_map_read_from() helper
  drm/xe: Add wrapper for iosys_map_read_from
  drm/xe/guc: Expose raw access to GuC log over debugfs

 drivers/gpu/drm/xe/xe_guc_debugfs.c | 26 +++++++++++++++
 drivers/gpu/drm/xe/xe_map.h         |  9 ++++++
 fs/libfs.c                          | 50 +++++++++++++++++++++++++++++
 include/linux/fs.h                  |  3 ++
 include/linux/iosys-map.h           | 24 ++++++++++++++
 5 files changed, 112 insertions(+)

-- 
2.43.0

