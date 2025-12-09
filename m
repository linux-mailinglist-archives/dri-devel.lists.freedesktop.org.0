Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B26E8CB0FC3
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 21:00:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3486610E633;
	Tue,  9 Dec 2025 20:00:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mjqLOee+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E72610E5E9;
 Tue,  9 Dec 2025 20:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765310446; x=1796846446;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=N7pOaspZUPMrfNTiOtvTLJHvpVMVqsa964H8CHsCawA=;
 b=mjqLOee+Yrvt3Epy0VCSYm/v/22mouxt90KIIU4Tjzi8HatZucbIR+Ht
 Mvd5hjICREUABObF1C8pcla3lCFsS9EFO1KbDdXiO+4Om+yPcOFSBvUKE
 xH9Gn0guqOU6D3dyYPoYTFDLp7y1+aqk+XDxPV7SVED/Rx7w3NoclxrKg
 SjMewt5s5B/JBi/9J5avqUoMlztKiag0E24xhZ9y4JRJZ9BfvTYQlZBI0
 hiiOVezTghgnZC+QFOsgCd6LpiucRz7nAs0oiK7iR/24KdQPfzV1+Su1S
 QFsiXkXnH6zci7Dq/fKEynR4Lv6Ln/v/FJcc4+gYNtQ/xaZqfyv4QhvWz w==;
X-CSE-ConnectionGUID: khJ9DEQ8RFCwdCYPFSCS5Q==
X-CSE-MsgGUID: kuNm2L+mTzCp8ihOawK91Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="70897449"
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; d="scan'208";a="70897449"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 12:00:45 -0800
X-CSE-ConnectionGUID: 5hhlofBCR3S7m20iGCy4pQ==
X-CSE-MsgGUID: G7LP0/CHQti80jZPphw3Bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; d="scan'208";a="201243123"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 12:00:45 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: niranjana.vishwanathapura@intel.com, christian.koenig@amd.com,
 pstanner@redhat.com, dakr@kernel.org
Subject: [PATCH v9 0/2] Add DRM sched support functions to avoid driver side
 layering violations 
Date: Tue,  9 Dec 2025 12:00:37 -0800
Message-Id: <20251209200039.1366764-1-matthew.brost@intel.com>
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

Leaving todo.rst as is with respect to resubmit, as I believe we still
have long-term plans to change job tracking to scheduler fence tracking.
If we go in that direction, the iterator in this series can be converted
to a fence-based iterator. If needed, todo.rst can also be updated in a
follow-up patch, but for functionality and cleanups on the Xe driver
side, it would be good to get this code in.

Matt

[1] https://patchwork.freedesktop.org/series/155314/

Matthew Brost (2):
  drm/sched: Add several job helpers to avoid drivers touching scheduler
    state
  drm/sched: Add pending job list iterator

 drivers/gpu/drm/scheduler/sched_main.c | 40 ++++++++++++++++++--
 include/drm/gpu_scheduler.h            | 52 ++++++++++++++++++++++++++
 2 files changed, 89 insertions(+), 3 deletions(-)

-- 
2.34.1

