Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E96A9A48BE
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 23:10:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A5E910E9B2;
	Fri, 18 Oct 2024 21:10:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mk/5v/NV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB95210E9AA;
 Fri, 18 Oct 2024 21:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729285840; x=1760821840;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PcgK83C84Xg01UbkLabSvCZLZIY56p7PKbvHyq6Todo=;
 b=Mk/5v/NVaxajEPBFvkBfhwdLZW1M5b85IMRrx5vdTN7259p65VW5B0Jo
 wvnDAg5rjD6thZzWzteCTc7jurFGW50m7KxLtUWrFDgdOyujv5SNbzf70
 nk900GH9dMDatwo6mOjSKukgk5GTITfWHypNDsa76T7kY4ZFxeA0FJPoI
 S6LQCFph4ZNVNY8KmbWwtSm/69Ed7FJkgGz9U0qsj58VjIMUMcyEaQ8Br
 M+AG9zJnLXIJ2y6RcYP5mxC5h+9KCseS2+4LXVHNVrj3eQHKk75v1YOeI
 t6tsHpzzsUKmhHNlkFxMSfG6LOeOZsNSuN7Q8bVK5PPYqFQqFQGQzpi8j g==;
X-CSE-ConnectionGUID: 5dC8TUdeRxe4xQ3ox7/mKw==
X-CSE-MsgGUID: qWo4FO7BR/eeMRy6gA/7nA==
X-IronPort-AV: E=McAfee;i="6700,10204,11229"; a="54241732"
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; d="scan'208";a="54241732"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2024 14:10:39 -0700
X-CSE-ConnectionGUID: j/VMRAWTSyWllGYDmmxGIg==
X-CSE-MsgGUID: Uy8uiXDgTVaswldcego7Mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; d="scan'208";a="79311937"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2024 14:10:39 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: matthew.auld@intel.com,
	thomas.hellstrom@linux.intel.com
Subject: [PATCH 0/3] Fix non-contiguous VRAM BO access in Xe 
Date: Fri, 18 Oct 2024 14:11:00 -0700
Message-Id: <20241018211103.1367643-1-matthew.brost@intel.com>
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

Mapping a non-contiguous VRAM BO doesn't work, start to fix this.

A follow up series should cleanup any remaining mapping of
non-contiguous VRAM BOs, add non-visible access support to
xe_ttm_access_memory, and warn / error on mapping a BO which cannot be
mapped.

Matthew Brost (3):
  drm/ttm: Add ttm_bo_access
  drm/xe: Add xe_ttm_access_memory
  drm/xe: Use ttm_bo_access in xe_vm_snapshot_capture_delayed

 drivers/gpu/drm/ttm/ttm_bo_util.c | 85 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/ttm/ttm_bo_vm.c   | 65 +----------------------
 drivers/gpu/drm/xe/xe_bo.c        | 57 +++++++++++++++++++--
 drivers/gpu/drm/xe/xe_vm.c        | 17 +++----
 include/drm/ttm/ttm_bo.h          |  2 +
 5 files changed, 148 insertions(+), 78 deletions(-)

-- 
2.34.1

