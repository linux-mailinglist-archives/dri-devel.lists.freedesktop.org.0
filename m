Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD68477614
	for <lists+dri-devel@lfdr.de>; Thu, 16 Dec 2021 16:39:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C44C910E2F8;
	Thu, 16 Dec 2021 15:39:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89D3110E2F8;
 Thu, 16 Dec 2021 15:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639669152; x=1671205152;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RBGb5Ov0mF6xYYPJWI/E++a2VbxgjzK9PAEfJ8Ltvwg=;
 b=LpoRiYOkzkTzRMtFsBwqF+86OtCV6IdQPVHryO8QUiQJWAWTI8p41F9D
 qEI3tKiPPhk0yfEVVpxrMcXFT/trecIjAQvA3ldZ+htqZZRnS/NK++4Ge
 Xq0MOrzXUVvDVhJL1tGz+hLK7OdRfKvk5U1yTHspMrz6Ry1VpC3+nuQX5
 +3cPiI5sQmTNG3/ki9y+nn51pCVVITAcQ9s4I8q7CJUXpueOq+iNKMTAd
 xhEN+orykI/sP1hloFycGM3uxEXVPyRlR0fCsD3s534prvA1r+2I4Cs8Q
 8GbnmDOUKSdNO9XCA6JxfiU2aSk7wAvYU6V+kTd1tn4QPIxNKXrAmM2Dm Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10199"; a="238261402"
X-IronPort-AV: E=Sophos;i="5.88,211,1635231600"; d="scan'208";a="238261402"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2021 07:39:12 -0800
X-IronPort-AV: E=Sophos;i="5.88,211,1635231600"; d="scan'208";a="611507312"
Received: from yshchyok-mobl1.ccr.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.21.121])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2021 07:39:11 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v4 0/3] DG2 accelerated migration/clearing support
Date: Thu, 16 Dec 2021 15:38:44 +0000
Message-Id: <20211216153847.185820-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.31.1
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Enable accelerated moves and clearing on DG2. On such HW we have minimum page
size restrictions when accessing LMEM from the GTT, where we now have to use 64K
GTT pages or larger. With the ppGTT the page-table also has a slightly different
layout from past generations when using the 64K GTT mode(which is still enabled
on via some PDE bit), where it is now compacted down to 32 qword entries. Note
that on discrete the paging structures must also be placed in LMEM, and we need
to able to modify them via the GTT itself(see patch 3), which is one of the
complications here.

v2: Add missing cover letter
v3:
  - Add some r-b tags
  - Drop the GTT_MAPPABLE approach. We can instead simply pass along the
    required size/alignment using alloc_pt().
v4:
  - Drop already merged patches, and add some r-b tags
  - Add some better docs to patch 3

Matthew Auld (3):
  drm/i915/gtt: allow overriding the pt alignment
  drm/i915/gtt: add xehpsdv_ppgtt_insert_entry
  drm/i915/migrate: add acceleration support for DG2

 drivers/gpu/drm/i915/gt/gen8_ppgtt.c    |  50 +++++-
 drivers/gpu/drm/i915/gt/intel_gtt.h     |  10 +-
 drivers/gpu/drm/i915/gt/intel_migrate.c | 209 +++++++++++++++++++-----
 drivers/gpu/drm/i915/gt/intel_ppgtt.c   |  16 +-
 4 files changed, 239 insertions(+), 46 deletions(-)

-- 
2.31.1

