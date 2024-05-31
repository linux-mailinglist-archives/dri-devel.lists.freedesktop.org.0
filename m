Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F77D8D611C
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2024 14:00:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F67910E6C0;
	Fri, 31 May 2024 12:00:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FsPHcO5N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00D6F10E67C;
 Fri, 31 May 2024 12:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717156846; x=1748692846;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kNDnXROgfcqZ7N9s79r6DNMSF3EGZX+UFuG15pvKq84=;
 b=FsPHcO5NX7UYbVGV7n9NCmx6Tm6jkg6JwAY9mFG7Zdtpvypy6yTcHFSu
 wpEJ87kjvE6PiKdJ5xTctTqM/MvYI9ddkZYEZnj/Wcq8Vb9E6rbdOH9VZ
 cvReAg4fnclOElKtIJmLyTxC03xoReRXIgElP1tp/w0j0jTaHEbgT8cby
 bMmZ3LrxleBGWqbketNXSeG4MT2XCSXovtvbs5SU5DZp8hdH+kBciBdTC
 zKE+9mlrdNhXCGtNbIp2eVms99y0ZRzRSQxsm9T0da4Zs6WEpJwnyYjBe
 bVeumjdnNiZQnZXPzSmBNh4SiUSVNSR6ABArgmmXJ8oayh8RaM5OCv1wW A==;
X-CSE-ConnectionGUID: 8dPEoCmQQNaAWlCCyBFSkg==
X-CSE-MsgGUID: 7m3EbjdJQ2mhfc2Y/Ed9ZQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="31223851"
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; d="scan'208";a="31223851"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2024 05:00:40 -0700
X-CSE-ConnectionGUID: 3j93L+t0RVWlGApSrRGu+Q==
X-CSE-MsgGUID: Hn0KHkKGSnSZVvsCJezA9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; d="scan'208";a="36076193"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.190])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2024 05:00:37 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Pan Xinhui <Xinhui.Pan@amd.com>, jani.nikula@intel.com
Subject: [PATCH 0/3] drm/mst & drm/amd/display: switch to using guid_t
Date: Fri, 31 May 2024 15:00:30 +0300
Message-Id: <cover.1717156601.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

We have a guid_t type for GUIDs, switch to using it instead of hand
rolling buffers. Convert to guid_gen() in separate patches to pinpoint
the functional changes.

BR,
Jani.

Jani Nikula (3):
  drm/mst: switch to guid_t type for GUID
  drm/mst: switch to guid_gen() to generate valid GUIDs
  drm/amd/display: switch to guid_gen() to generate valid GUIDs

 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 23 ++++---
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 67 ++++++++++---------
 include/drm/display/drm_dp_mst_helper.h       | 12 ++--
 3 files changed, 52 insertions(+), 50 deletions(-)

-- 
2.39.2

