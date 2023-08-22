Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E25C6784702
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 18:22:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BA1B10E3A5;
	Tue, 22 Aug 2023 16:22:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 370A610E377;
 Tue, 22 Aug 2023 16:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692721319; x=1724257319;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tVVcP5u927vaTVd4NhjN0Y1TJHNfHm2x0YpRpOg4N0M=;
 b=bkWkabhDZop8rll6XZZycC08ZNSqTEyGpRyzvmWSCu5xTYfjf2zZwf47
 4vtphsH7y5mHY+26b7gvQLSF3AJ+XYBrJ5yRxjT/Nuplt9454sdk1z3cF
 JTwzDOpfiWKJbvLRY4h5OlwR/UABnnnyFtZHd+0blJwjSUB+ZI1da4B2S
 vDYnJI8h1K4cprucELBpgDvaCOlOM9B0xqugVl57Pl6JjhQtC4o6Rwf8r
 dN6xVABqJHAH72I465cbVNPLWwThIDn1Jh+F/vi2Ti3MshX5DK7Umb/RC
 8OMWDGGa4HZOHIvU1zd/5tM564uSA2QU8dt/sBSe3JgDNNnvHSVWMGQ0h A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="354260378"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; d="scan'208";a="354260378"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2023 09:21:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="826373900"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; d="scan'208";a="826373900"
Received: from kahchuno-mobl.gar.corp.intel.com (HELO fedora..)
 ([10.249.254.65])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2023 09:21:55 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 0/4] drm/xe: Support optional pinning of userptr pages
Date: Tue, 22 Aug 2023 18:21:32 +0200
Message-ID: <20230822162136.25895-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.41.0
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series adds a flag at VM_BIND time to pin the memory backing a VMA.
Initially this is needed for long-running workloads on hardware that
neither support mid-thread preemption nor pagefaults, since without it
the userptr MMU notifier will wait for preemption until preemption times
out.

Moving forward this could be supported also for bo-backed VMAs given
a proper accounting takes place. A sysadmin could then optionally configure
a system to be optimized for dealing with a single GPU application
at a time.

The series will be followed up with an igt series to exercise the uAPI.

v2:
- Address review comments by Matthew Brost.

Thomas Hellström (4):
  drm/xe/vm: Use onion unwind for xe_vma_userptr_pin_pages()
  drm/xe/vm: Implement userptr page pinning
  drm/xe/vm: Perform accounting of userptr pinned pages
  drm/xe/uapi: Support pinning of userptr vmas

 drivers/gpu/drm/xe/xe_vm.c       | 194 ++++++++++++++++++++++++-------
 drivers/gpu/drm/xe/xe_vm.h       |   9 ++
 drivers/gpu/drm/xe/xe_vm_types.h |  14 +++
 include/uapi/drm/xe_drm.h        |  18 +++
 4 files changed, 190 insertions(+), 45 deletions(-)

-- 
2.41.0

