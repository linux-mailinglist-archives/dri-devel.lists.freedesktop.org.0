Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 389D995C465
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2024 06:53:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1135410EC1B;
	Fri, 23 Aug 2024 04:53:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IdeB2WvP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4B6A10EC1A;
 Fri, 23 Aug 2024 04:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724388827; x=1755924827;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=d9L7/lV4Kt9lym5oQQscqo5CWq7fOrsysd5To5snw/s=;
 b=IdeB2WvPldhntKek2E+7faAUAaKA8MGl0QPm0KXO6wBfn8xwRIqFWvih
 G2I7O+vFPVQI9neAYllQYaMHXZ3ndveAd13ItS4s3Q/Yv8VLBT4z0KOUJ
 KHQDUusWfsXu4BdTfTXsxbtaBpLhnEPOl/vpAydqpPB9pviFfhKX3EjZI
 3fNhydLZCQvGqJ4nKUquN3bi+Q1Ljzp8DXcFsH23HukoF4z+AsK2bppgO
 QQDWEbDO/Awul8F7uasYlzIhtqgPk4szwFhUebUx9/wG9xQMDMPyJ3bRv
 UI5x81J15f8dZX9XclJpxIxrHJkR9Po9XWsYb2vXpZORQbEqZmJRzr9u8 Q==;
X-CSE-ConnectionGUID: ZEwj4PacToiS2ye0wY0i/A==
X-CSE-MsgGUID: +Mbm6tqNRHG7JQTEz/6Nbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="26709248"
X-IronPort-AV: E=Sophos;i="6.10,169,1719903600"; d="scan'208";a="26709248"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 21:53:47 -0700
X-CSE-ConnectionGUID: uLUonQBMSiC3S6bOu4HglA==
X-CSE-MsgGUID: DzIOh/MORva5BbhCtHg5fQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,169,1719903600"; d="scan'208";a="66608947"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 21:53:47 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com, sumit.semwal@linaro.org,
 christian.koenig@amd.com, daniel@ffwll.ch
Subject: [PATCH v3 0/2] Replace dma-fence chain with dma-fence array for media
 GT TLB invalidation 
Date: Thu, 22 Aug 2024 21:54:41 -0700
Message-Id: <20240823045443.2132118-1-matthew.brost@intel.com>
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

Third try, requires spliting out dma fence array alloc and arm into new
functions to avoid memory allocations under notifier lock.

Matt 

Matthew Brost (2):
  dma-buf: Split out dma fence array create into alloc and arm functions
  drm/xe: Use dma-fence array for media GT TLB invalidations in PT code

 drivers/dma-buf/dma-fence-array.c | 81 ++++++++++++++++++++++---------
 drivers/gpu/drm/xe/xe_pt.c        | 34 +++++++++----
 include/linux/dma-fence-array.h   |  7 +++
 3 files changed, 90 insertions(+), 32 deletions(-)

-- 
2.34.1

