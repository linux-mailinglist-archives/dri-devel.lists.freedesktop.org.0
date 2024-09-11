Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7487B974867
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2024 05:02:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7001010E074;
	Wed, 11 Sep 2024 03:02:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kCxGB9cl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 730EE10E074;
 Wed, 11 Sep 2024 03:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726023759; x=1757559759;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Vel7AbFBzj78i/iHwdB+beI0cNjDQNzO/uiGE/5W2ig=;
 b=kCxGB9clVTBEH56Pma+Dx2Xfhn+BvktWNbmk8/QQh8N0j201fIjGyPDk
 jKx8IWoQ78CgznKBWtpaSY8ZtRmfEAiYmPuELIKsqJZSgwLkZh5oZhrEY
 TKPI4NpzqT72DZjBzVccuCIM6tf2AtQDSYuMyKdrtdK213gKgcH69oP/9
 eGK1AhoyIx6KgcoyELBVj/c5n0NVBfaBqSxGrIZP1Z8XQmy3F5Cw3WVKk
 0AuyszFjSV0qisFxtdRCVX+HXwVKI/M98NwgFNW39A+TzrpVOtRMrPtsx
 HN/fW13wbMQv+5lc9lwgnWed78ICxK2KJ3x2w8rhgWKtjV0kdDLwvO1CQ g==;
X-CSE-ConnectionGUID: F6oKDFV2TqO2vS/rJRlCHg==
X-CSE-MsgGUID: Nmen0dKnSMStnqp+xmoisA==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="24907782"
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="24907782"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 20:02:37 -0700
X-CSE-ConnectionGUID: yvGIAWXRRW2SWjxt5lpXWQ==
X-CSE-MsgGUID: hN78Q4b9The/fWp3x5d+jA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="67732254"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 20:02:37 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, simona.vetter@ffwll.ch, Philip.Yang@amd.com,
 akpm@linux-foundation.org, felix.kuehling@amd.com, christian.koenig@amd.com
Subject: [PATCH 0/1] Fix device private page livelock on CPU fault
Date: Tue, 10 Sep 2024 20:03:36 -0700
Message-Id: <20240911030337.870160-1-matthew.brost@intel.com>
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

The patch should explain the issue thoroughly.

It would be helpful if AMD could test this patch with their SVM
implementation and see if any issues arise.

Matt

Matthew Brost (1):
  mm/migrate: Trylock device page in do_swap_page

 mm/memory.c         | 13 +++++++---
 mm/migrate_device.c | 60 +++++++++++++++++++++++++++++++--------------
 2 files changed, 50 insertions(+), 23 deletions(-)

-- 
2.34.1

