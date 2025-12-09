Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 740DECB0F54
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 20:45:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3418C10E61C;
	Tue,  9 Dec 2025 19:45:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bTRGgWv5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B02AA10E5A8;
 Tue,  9 Dec 2025 19:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765309536; x=1796845536;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WEeBHlKpjvvYZqrkHXq8/e6dFzmUizzdtlknyOkcuAU=;
 b=bTRGgWv5rZumKXD/mAp7lE7qbcLuxojwuRQphx6xA6QR6vb883R33Xro
 VFDloiE4WUXwbAULogmJ4++zIYK3LMif5+N05r0QpYfe87SmlEblIp56X
 6ZkvrTmmiTirogBpskcd23yOVoB3NhRytWHu6YJfZcvZKgPo1qT3z0Fvb
 ivSHUeKOV5DFjH7Vk0EcKpUc0EteHGNQWJNrqQLo2gjoy2eNe9iOIj0Kh
 gx7jRXoiM/3phMUru9n47OfbiKc70fLOFkp7yTgjfQ5UQ72uRkj64qUfo
 Ui61T2sqfSbuwd7BdCaBASjM8qsPGLSX8RuqeDJdQxYeqJfYkF1Y3CngU Q==;
X-CSE-ConnectionGUID: +Dq5j9S1Rp2Rd0UBoEKeBQ==
X-CSE-MsgGUID: EuYUjMoRQ2+Nmx3J05zD3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="67350721"
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; d="scan'208";a="67350721"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 11:45:35 -0800
X-CSE-ConnectionGUID: SMyeaR55Rs2mgmSqhFdCtA==
X-CSE-MsgGUID: rqP8DdJySCyyao0vI9jgTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; d="scan'208";a="196317415"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 11:45:35 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: niranjana.vishwanathapura@intel.com, christian.koenig@amd.com,
 pstanner@redhat.com, dakr@kernel.org
Subject: [PATCH v8 0/2] Add DRM sched support functions to avoid driver side
 layering violations 
Date: Tue,  9 Dec 2025 11:45:29 -0800
Message-Id: <20251209194531.1366098-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Subset of [1], believe we are in agreement these can go into the DRM
scheduler. Will post the Xe in a follow once patches make it from
drm-misc-next to drm-xe-next.

Matt

[1] https://patchwork.freedesktop.org/series/155314/

Matthew Brost (2):
  drm/sched: Add several job helpers to avoid drivers touching scheduler
    state
  drm/sched: Add pending job list iterator

 drivers/gpu/drm/scheduler/sched_main.c | 36 +++++++++++++++++-
 include/drm/gpu_scheduler.h            | 52 ++++++++++++++++++++++++++
 2 files changed, 86 insertions(+), 2 deletions(-)

-- 
2.34.1

