Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B012AB3B9A
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 17:06:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41BEB10E432;
	Mon, 12 May 2025 15:06:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZPoic1od";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 558B710E42D;
 Mon, 12 May 2025 15:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747062414; x=1778598414;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TnMoD6MzPqDEedYl6F8rDOvuN5UaP1hTYopuvhZFgiw=;
 b=ZPoic1od5a1oE2j3J3qC6eCoSplv4gBxd8ehnYb97droCKXvVpUFx95W
 3CQ8golQp4t0KkpqmS0ISPWpibMzAfq4ULTp7ojqcIJemA2SDJlyZLF3K
 /foKtMVizb3dACFy/1gHADZdhckQNs1s63nV8wxihme5fbgHFUC4IzM8b
 G+Uem9VdrhT/PbgB/e8BmPKrjj/mhWx5QhVh5JuxRMjtmqp1nsKobVSMk
 5yduwNpaAt5LxtS+sumXdykav1w0LdEvttYcNqC1ZVCmx0502kNvw6cLl
 /qxyGectW8/QgFFn77QLZXW5udmcXC/WPXbcP2xEHkf8C2frX+UyIAPov A==;
X-CSE-ConnectionGUID: frOV9FCuTzefZ9EU9A1/PQ==
X-CSE-MsgGUID: KdQxvGBVTamb1nsu6OpsXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="71377044"
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; d="scan'208";a="71377044"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 08:06:54 -0700
X-CSE-ConnectionGUID: DLCSXEIZSIGqrwIXaX1NeQ==
X-CSE-MsgGUID: Okq0Fp3JQKiASygsXB83/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; d="scan'208";a="137916540"
Received: from ettammin-desk.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.222])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 08:06:54 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 0/8] Replace xe_hmm with gpusvm
Date: Mon, 12 May 2025 16:06:38 +0100
Message-ID: <20250512150637.61462-10-matthew.auld@intel.com>
X-Mailer: git-send-email 2.49.0
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

As a first step to moving userptr handling over to drm, replace the hmm
usage in xe over to gpusvm, which already offers similar functionality. As
some prep steps we also align on some of the missing pieces that were
already handled in xe_hmm.

v2:
  - Rework the gpusvm API based on feedback.
  - Unify SVM and userptr vm struct so we use the same notifier lock.
  - Drop the mark pages as dirty patch.
  - Various other improvements.
v3:
  - Further unify common handling of userptr and svm in xe.
v4:
  - Allow building xe without userptr, like when building on UML.

-- 
2.49.0

