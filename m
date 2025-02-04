Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5809BA27E62
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 23:41:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B72D10E101;
	Tue,  4 Feb 2025 22:41:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y1grtiCW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7708D10E101
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2025 22:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738708899; x=1770244899;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=F7dxtK7+1wsXWVpEakheOhZf9YINx2tRRNCmDD8GGl0=;
 b=Y1grtiCWraM4JlXtFAg8SQB+QRSckMJPaUZnBpBymmRGmhe1xFS+ftdJ
 53jZdJJmxk3ARFj3ouARmUJEXk0MhwnJsKrEiBkNk/RsuQVBtuaYGWK2J
 txtQt6t/6gKhh1W66XPsuzdV0jovGU1r+vgpN+4xCOrCsmDmJoVAScLY8
 ZDDSUDfRDmACiArJTrHWVcIGmE03y9QHLVGIJkgxEXjdddMYCa/epOaq8
 JfzY9I/yK229nS8O4zMD0kh86EvePzNKO4ubYILNQC5l/EAljQY+ahVkS
 crsY3iQL7f5Hi9zqqM2Hxwhs77koLZO6L8od/OpEQVBgpln3bzoyJoEJg Q==;
X-CSE-ConnectionGUID: 4ulWk2tORdKSOla1UE0jcw==
X-CSE-MsgGUID: ahOVTUYuTGGmy+WLB7aQHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="56685998"
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; d="scan'208";a="56685998"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2025 14:41:39 -0800
X-CSE-ConnectionGUID: lJjDoCy8RFaKlKkEo6Qfww==
X-CSE-MsgGUID: Bvi1A7VfRTm7dTzLBHVLdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; d="scan'208";a="111272716"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by fmviesa010.fm.intel.com with ESMTP; 04 Feb 2025 14:41:37 -0800
From: Tomasz Lis <tomasz.lis@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [RFC 0/1] drm/mm: Introduce address space shifting
Date: Tue,  4 Feb 2025 23:41:35 +0100
Message-Id: <20250204224136.3183710-1-tomasz.lis@intel.com>
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

This RFC asks for introduction of an interface which allows to shift
a range managed by drm_mm instance without repeating the node list
creation.

The long explanation:

Single Root I/O Virtualization is becoming a standard GFX feature
in server environments. Virtual Machines provided with direct access
to virtualized GFX hardware, in form of VFs, need to support the
standard set of features expected by Virtual Machine Managers.
These standard features include ability to save the VM state, and
later restore the VM, possibly on another machine with different
setup. For the restore to succeed, the GFX hardware model must match;
but for its configuration, some differences are often allowed. Such
alterations may include a different range of non-virtualized
resources assigned to the VF, including global address spaces.

If any non-virtualized address space is saved, as part of VM state,
on one machine and restored on another, it may happen that the target
range differs from source range. To shift the address space,
currently creating a new drm_mm object is required, and moving all
nodes to the new object while adding the shift.

GFX hardware handled by Xe driver contains Global Graphics
Translation Table, which is an example of such non-virtualized
resource. Should this interface change be accepted, a series which
utilizes this interface in Xe driver will be prepared.

Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>

Tomasz Lis (1):
  drm_mm: Introduce address space shifting

 drivers/gpu/drm/drm_mm.c | 24 ++++++++++++++++++++++++
 include/drm/drm_mm.h     |  1 +
 2 files changed, 25 insertions(+)

-- 
2.25.1

