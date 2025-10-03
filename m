Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26366BB8088
	for <lists+dri-devel@lfdr.de>; Fri, 03 Oct 2025 22:12:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E76E010E96B;
	Fri,  3 Oct 2025 20:12:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LYhbLFkY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51FA410E968;
 Fri,  3 Oct 2025 20:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759522321; x=1791058321;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=B+5wcccbQZ7JZ2nHKFZtXUo5e4zDJ9BQc/3PVHqEZ8I=;
 b=LYhbLFkY+tUbvJbsDxAH9hv0XbE0dR6iT46zc9KutCsvG79xAYSvSja3
 tlRGn+ExkTpmGi03c1WDgbkp2NXfRbwgnmDcCqzOxw6YUr464UQCHTXbi
 V4VAUbAvR5HT0IZ8vh8LzuMKKOYJabA+oBfeM1PttfV+aTyJs+06Nf6QM
 +OTrjdTtDKBwxIvHpiYROHYUR4gZpiV0FoB2VouH66Eji3YeE67AB1THo
 EbeUtemZXDEnViD7Tbd18Jc3FMpIfRzi5WgY+QekiO6nAdLXnuthi//xH
 9cdqU1ojAREsNbslq3x0xPaA8xPRQXZymkbr4fJT2KMjlcHGMzDYmCAnM Q==;
X-CSE-ConnectionGUID: NtlCF/quRfO0EcS5iGlpPg==
X-CSE-MsgGUID: igvJOr87SUiMfy4LLL7e8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11571"; a="87265205"
X-IronPort-AV: E=Sophos;i="6.18,313,1751266800"; d="scan'208";a="87265205"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 13:12:01 -0700
X-CSE-ConnectionGUID: m75rl7eqQtmjHjmi/kg8aA==
X-CSE-MsgGUID: ygnNnp2gSE6qYCpfy8yZyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,313,1751266800"; d="scan'208";a="178656982"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 13:12:01 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: christian.koenig@amd.com,
	pstanner@redhat.com,
	dakr@kernel.org
Subject: [RFC PATCH v2 0/4] Fix DRM scheduler layering violations in Xe
Date: Fri,  3 Oct 2025 13:11:52 -0700
Message-Id: <20251003201156.1995113-1-matthew.brost@intel.com>
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

v2:
 - Fix checkpatch / naming issues

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
 6 files changed, 142 insertions(+), 45 deletions(-)

-- 
2.34.1

