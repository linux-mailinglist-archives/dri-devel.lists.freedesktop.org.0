Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C25F5984041
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 10:19:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2426710E672;
	Tue, 24 Sep 2024 08:19:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T8ViJF02";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 657AB10E66E
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 08:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727165932; x=1758701932;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3/vGGJ3ZHf1grS9KGQYefSVQ2IdtXvFGGsWDj4XcKcY=;
 b=T8ViJF02QmjV11xDHxIOom7XT3/bI0s7HJzvyuPOyPm1QQ+XgJDu6k+3
 MdIXsFD7btGtDGgjbRGZlWk4ru6ixA3EhhkWUZBY01gd4A1/mqLS1OXYs
 QQMmYgdIi60Nq4nwjWfppDG/VCw9HDigXhAgIzMIYq7XwktKZSwJsNyjO
 WASWCGQYndvymUPgF+kaX4PxbV61kAx/9G/81sjzalC8jaZkL9Qpbtj4J
 eBqYb5H8ahT5J8JhNIcpwt9Rw5kkgSFrCk820/ZbJtrxQVYQfg4v5OoD7
 3CzvaBtxg+pbmCiw1A/9E0gPpCsM3L083hHMCVMOLCEz6km0TrRn+Qi51 g==;
X-CSE-ConnectionGUID: RTAMBsxSQP2NnLfhHFSh5Q==
X-CSE-MsgGUID: m5zoLk9pRfaniRZoAQAxVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="37507016"
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; d="scan'208";a="37507016"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 01:18:52 -0700
X-CSE-ConnectionGUID: C05CoPzDTqGKRpTBemBZVA==
X-CSE-MsgGUID: rFbiLs+HQS6YADuNtL5Wyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; d="scan'208";a="102170762"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 01:18:51 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Karol Wachowski <karol.wachowski@intel.com>
Subject: [PATCH 25/29] accel/ivpu: Increase MS info buffer size
Date: Tue, 24 Sep 2024 10:17:50 +0200
Message-ID: <20240924081754.209728-26-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240924081754.209728-1-jacek.lawrynowicz@linux.intel.com>
References: <20240924081754.209728-1-jacek.lawrynowicz@linux.intel.com>
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

Increase MS info BO to 64KB to allow collecting more metrics.

Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Reviewed-by: Karol Wachowski <karol.wachowski@intel.com>
---
 drivers/accel/ivpu/ivpu_ms.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/ivpu/ivpu_ms.c b/drivers/accel/ivpu/ivpu_ms.c
index 2f9d37f5c208a..ffe7b10f8a767 100644
--- a/drivers/accel/ivpu/ivpu_ms.c
+++ b/drivers/accel/ivpu/ivpu_ms.c
@@ -11,7 +11,7 @@
 #include "ivpu_ms.h"
 #include "ivpu_pm.h"
 
-#define MS_INFO_BUFFER_SIZE	  SZ_16K
+#define MS_INFO_BUFFER_SIZE	  SZ_64K
 #define MS_NUM_BUFFERS		  2
 #define MS_READ_PERIOD_MULTIPLIER 2
 #define MS_MIN_SAMPLE_PERIOD_NS   1000000
-- 
2.45.1

