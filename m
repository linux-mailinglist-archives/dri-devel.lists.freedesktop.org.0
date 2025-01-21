Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81858A186D2
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2025 22:09:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24A8A10E231;
	Tue, 21 Jan 2025 21:09:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SyQCfiHZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B272D10E231
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2025 21:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737493790; x=1769029790;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=eFcjCHxe794oimCAh7OPOaCPVUz94pXHx78HayTXqbQ=;
 b=SyQCfiHZPxUt5+GFamMES9OC0mwLGZHrnhEN8U7WJHK89F6AZ1Lvk5oH
 7OOUy56hau7PHQwyHOEWouJKNKLPmjbRr9S+AjKKHzwv4/q1Y6TS1bKbm
 7gYahJINnAZqCMFqWVYQe51ADR//xSdVhJt/aENWBUsZ15xGPLXb5Mulm
 9DiC4V2JY5kOkanLxUpBwRo7E16puOI77CfDlp/LucVLB5wSQ2c9gZB+h
 WHiodTar8xhBlJyQFE4syT3/9oyB3Qs4eYG0Af/MySvz3RkK9xH/7zMng
 aKCqd7b/BLpNJHJkE6aHuTZIkqVYLd9QXdEbT9mqsh80ER0hB0mIMDDgF A==;
X-CSE-ConnectionGUID: 8GBdHPQiTcSQ+O9RsMxgdQ==
X-CSE-MsgGUID: zfD+wp7VTVu1lxOyHpvHyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="48920880"
X-IronPort-AV: E=Sophos;i="6.13,223,1732608000"; d="scan'208";a="48920880"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2025 13:09:49 -0800
X-CSE-ConnectionGUID: Cng+rgonSxWJLZ0Z17aBng==
X-CSE-MsgGUID: 7tButqZ6Rgyqg0DdyBh4Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="111914420"
Received: from ldmartin-desk2.corp.intel.com (HELO
 gjsousa-mobl2.corp.amr.intel.com) ([10.125.110.33])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2025 13:09:49 -0800
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/print: Include drm_device.h
Date: Tue, 21 Jan 2025 18:09:25 -0300
Message-ID: <20250121210935.84357-1-gustavo.sousa@intel.com>
X-Mailer: git-send-email 2.48.1
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

The header drm_print.h uses members of struct drm_device pointers, as
such, it should include drm_device.h to let the compiler know the full
type definition.

Without such include, users of drm_print.h that don't explicitly need
drm_device.h would bump into build errors and be forced to include the
latter.

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 include/drm/drm_print.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index f77fe1531cf8..9732f514566d 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -32,6 +32,7 @@
 #include <linux/dynamic_debug.h>
 
 #include <drm/drm.h>
+#include <drm/drm_device.h>
 
 struct debugfs_regset32;
 struct drm_device;
-- 
2.48.1

