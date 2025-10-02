Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D24A7BB2839
	for <lists+dri-devel@lfdr.de>; Thu, 02 Oct 2025 07:16:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F24A10E76E;
	Thu,  2 Oct 2025 05:16:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZgUpWiIj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E8C310E76C;
 Thu,  2 Oct 2025 05:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759382170; x=1790918170;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xcCqc4K9HKuvmslM5Ja+VKwc7X12715p8cHPfXNjVWI=;
 b=ZgUpWiIjbysIdQrZDe6bcSXII0F8tJYtS/vmctO4i22+PsFgrI+22GsP
 dh/L6PYZANiGkXzXfN8zye2U+j1VG1LdCqWSZBwci8CBOwK+oNuKBDM7S
 j8DmcMotqiFDQd/nj5CkBd7lhrFOO3yu08BPRiTjmMjh21WxCjz+MNTDR
 7eFqYLJl02Hy8RIhaV6C8qBDK2BJ7QF2dxyWMiKSxl/erSXABQnSZehs0
 rwaVyxTM6cSqlpl5s40PpFqRSdJYx6m1u0E8+xB4+2IXyVgWWDt25ZCFW
 9IeqZzq4f4IdjSpaYPIDM0ChWNbhOaZdmueLYASfz6X4p18olSxseFUrR w==;
X-CSE-ConnectionGUID: OT9HcwGYTLivRaQ3zdfeig==
X-CSE-MsgGUID: jofBsL0zRg2mGqFesHo2SQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="65303140"
X-IronPort-AV: E=Sophos;i="6.18,308,1751266800"; d="scan'208";a="65303140"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 22:16:09 -0700
X-CSE-ConnectionGUID: iv/cBIFfTPS2xROxOGvNHg==
X-CSE-MsgGUID: 6q/53Id2Te+iJ/eOz+kzZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,308,1751266800"; d="scan'208";a="183264638"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 22:16:09 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: alexdeucher@gmail.com, dakr@kernel.org, christian.koenig@amd.com,
 pstanner@redhat.com
Subject: [RFC PATCH 0/4] Fix DRM scheduler layering violations in Xe
Date: Wed,  1 Oct 2025 22:16:00 -0700
Message-Id: <20251002051604.1865322-1-matthew.brost@intel.com>
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

At XDC, we discussed that drivers should avoid accessing DRM scheduler
internals, misusing DRM scheduler locks, and adopt a well-defined
pending job list iterator. This series proposes the necessary changes to
the DRM scheduler to bring Xe in line with that agreement and updates Xe
to use the new DRM scheduler API.

This is being sent as an RFC since only Xe is updated in this series. If
consensus is reached, a follow-up series can address other drivers in
the subsystem.

Matt

Matthew Brost (4):
  drm/sched: Add pending job list iterator
  drm/sched: Add several job helpers to avoid drivers touching scheduler
    state
  drm/xe: Add dedicated message lock
  drm/xe: Stop abusing DRM scheduler internals

 drivers/gpu/drm/xe/xe_gpu_scheduler.c       |   3 +-
 drivers/gpu/drm/xe/xe_gpu_scheduler.h       |  31 ++----
 drivers/gpu/drm/xe/xe_gpu_scheduler_types.h |   2 +
 drivers/gpu/drm/xe/xe_guc_submit.c          |  34 +++---
 drivers/gpu/drm/xe/xe_guc_submit_types.h    |   1 -
 include/drm/gpu_scheduler.h                 | 116 ++++++++++++++++++++
 6 files changed, 143 insertions(+), 44 deletions(-)

-- 
2.34.1

