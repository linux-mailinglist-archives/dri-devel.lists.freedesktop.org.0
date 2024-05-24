Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 850C48CE636
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2024 15:36:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB43D10EA05;
	Fri, 24 May 2024 13:36:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O/zGTG5N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7508710EA05;
 Fri, 24 May 2024 13:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716557765; x=1748093765;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SX98/Wn+9GoAy23Ca6rZy8+WDSxaYXSm+ew7FHW1mQo=;
 b=O/zGTG5NWY+AV6L8mBrjlXhw0M2YzDk8K9f1T9eCxnSTXuJ6g+s5PwwV
 yKQKMPiosNCfdQAW7bP7JgcvmOWWvYL/I1iuaBfUErB6QiJpr9hRFAJHl
 KxPxv7oZZRVohTQlf5jlKLr4rp4NEDGgP9MJ41kh6FApdWotVBjS1wXhC
 SLKB65DZVmKJoD56JMl1EjxEV+ieDRiGez6tgfpbTcXxlYXlA4oCA+KtB
 Z4DfxxCz5Rhm31GWYwf9iEa4pQHxwk7J6Vb1akTIHARBUG3PdbD3rqy8n
 GS3knUmoFWiwmX4jzf8hPozaBovBfJ9jztU/LH73TAubFiQsXtIdHLn0H A==;
X-CSE-ConnectionGUID: f6KOlADXTBq/JGjmoJJBcA==
X-CSE-MsgGUID: BPS5plxARl6JA+oxJa9O+Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="13110039"
X-IronPort-AV: E=Sophos;i="6.08,185,1712646000"; d="scan'208";a="13110039"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 06:36:05 -0700
X-CSE-ConnectionGUID: dzgS1wDtSJOAVvojfU/USg==
X-CSE-MsgGUID: 1NQpfQMPTXmkB2XZdZCDRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,185,1712646000"; d="scan'208";a="64834718"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.49.231])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 06:36:04 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 0/2] Add DRM-managed drm_mm_init()
Date: Fri, 24 May 2024 15:35:16 +0200
Message-Id: <20240524133518.976-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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

Add drmm_mm_init(), a helper that provides managed allocator cleanup,
and start using it in the Xe driver.

Michal Wajdeczko (2):
  drm: Add DRM-managed drm_mm_init()
  drm/xe: Use drm_device managed mutex/mm init helpers in GGTT

 drivers/gpu/drm/drm_managed.c | 27 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ggtt.c  | 23 +++++++++++------------
 include/drm/drm_managed.h     |  3 +++
 3 files changed, 41 insertions(+), 12 deletions(-)

-- 
2.43.0

