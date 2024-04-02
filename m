Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D46968950CA
	for <lists+dri-devel@lfdr.de>; Tue,  2 Apr 2024 12:50:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2523D10FC4B;
	Tue,  2 Apr 2024 10:50:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dWx0PUGF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52CFC10FC4B
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Apr 2024 10:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712055017; x=1743591017;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=N4lHp2cjomRXNyujfvAOtZKQ3bwJzpi+ieRx3tSMPP0=;
 b=dWx0PUGFuLlyMRMd51NP0qL9tzJNFNF5n9y3SbNkCxLz8oY6mjT/RW1j
 jdp5vJbi2eOPKOBNqhm+KVCy2WQBbWw8gl0wrk2c6qR7/FpPsShJ4VZvt
 biAvqcFap79MCc8VQdAXaRv+Og1Uog3HEV3TrBz+KR3HzYgY1MzLVn5Q3
 S+WJi5Rna/MbAYM4Gv8JOUdVlqLXvQ48DnpckqYVWqJYOdFHIMr78b51K
 cBsOHzveymFo7iaiPZl8oO5+ZgEhFJQWBYn1hVAPgAZky9PSmZAZ8MrZs
 DM4QH8EeXuW+hGmiqW+hvNAWo95L/77JKpO8ZcNCA5QqBXq5cL0Btlb91 Q==;
X-CSE-ConnectionGUID: LKZH9BvGQSuID+a1+Ov9Kw==
X-CSE-MsgGUID: BvoPl9gVRPeeR7OoXmfnWg==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="17944458"
X-IronPort-AV: E=Sophos;i="6.07,174,1708416000"; d="scan'208";a="17944458"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 03:50:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,174,1708416000"; d="scan'208";a="18002539"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 03:50:16 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH 7/8] accel/ivpu: Fix missed error message after VPU rename
Date: Tue,  2 Apr 2024 12:49:28 +0200
Message-ID: <20240402104929.941186-8-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240402104929.941186-1-jacek.lawrynowicz@linux.intel.com>
References: <20240402104929.941186-1-jacek.lawrynowicz@linux.intel.com>
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

Change "VPU" to "NPU" in ivpu_suspend() so it matches all other error
messages.

Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_pm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/ivpu/ivpu_pm.c b/drivers/accel/ivpu/ivpu_pm.c
index ba51781b5896..4f5ea466731f 100644
--- a/drivers/accel/ivpu/ivpu_pm.c
+++ b/drivers/accel/ivpu/ivpu_pm.c
@@ -62,7 +62,7 @@ static int ivpu_suspend(struct ivpu_device *vdev)
 
 	ret = ivpu_shutdown(vdev);
 	if (ret)
-		ivpu_err(vdev, "Failed to shutdown VPU: %d\n", ret);
+		ivpu_err(vdev, "Failed to shutdown NPU: %d\n", ret);
 
 	return ret;
 }
-- 
2.43.2

