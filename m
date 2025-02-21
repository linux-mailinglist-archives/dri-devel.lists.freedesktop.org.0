Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA4AA3F97C
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2025 16:54:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1622910EAC9;
	Fri, 21 Feb 2025 15:54:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CsOizmju";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D301910EAC1;
 Fri, 21 Feb 2025 15:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740153256; x=1771689256;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LBtdMRcxU4bFQ4gPxATEgcoF/sVHYT6rbc9mEHrjMgQ=;
 b=CsOizmjuln2vFgvATBfMzX0q9Jo7xNLOUaf1QwQc/NYHeqDjtKk3gFlu
 2hcLqfBIhuI0ec9cQZ+hPN4ChN2Ua9uIpQvshQuHxM0VlGt99LEFD1IXt
 O4Xsg1scffBRwg29gmjWnsBKUmwKVtzBcYtOeJyS95zLQoPuSbg4xoONM
 ZVfJnYnvdS1KPRKdRiCSr1v9ALFWKgPVQPjRE3SclF/y5aH8HtAGnOYhL
 czdeLWGOReplypLzZsf6hnMkoWVxpX5J7yJ9fDXNNfLo9KtojjZEBcp39
 rDeyCepRmFNJ+f/CmgSLgiP+xCDIgYBGssb3CZzGWw2jiy9Px7ZXmVGgA w==;
X-CSE-ConnectionGUID: u2VeIEyTT+qJJ7YpleoUVw==
X-CSE-MsgGUID: jpvysx79QryB4MBYJvQbog==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="51190860"
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; d="scan'208";a="51190860"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 07:54:16 -0800
X-CSE-ConnectionGUID: dEZIGfzTQaGD5EYEY/xPKA==
X-CSE-MsgGUID: rmOkzHEoQ9aSrfN68uzFBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="152595558"
Received: from dut4432lnl.fm.intel.com ([10.105.10.105])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 07:54:15 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 joonas.lahtinen@linux.intel.com, tvrtko.ursulin@igalia.com,
 lucas.demarchi@intel.com, matthew.brost@intel.com,
 dri-devel@lists.freedesktop.org, simona.vetter@ffwll.ch,
 kamil.konieczny@linux.intel.com
Subject: [PATCH 0/4] tests/intel/xe_query: Add per drm client reset stats tests
Date: Fri, 21 Feb 2025 15:54:10 +0000
Message-ID: <20250221155414.13961-1-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
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

Add tests that exercise the xe reset stats query.  The current tests
simply output the result of the tests and assert that the reset and ban
counters properly increment.

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>

Jonathan Cavitt (4):
  drm-uapi/xe: Declare reset stats query
  tests/intel/xe_query: Implement reset stats query test
  tests/intel/xe_query: Exercise reset count in reset stats
  tests/intel/xe_query: Exercise ban count in reset stats

 include/drm-uapi/xe_drm.h |  50 ++++++
 tests/intel/xe_query.c    | 339 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 389 insertions(+)

-- 
2.43.0

