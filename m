Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CCD1A9C371
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 11:28:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A50C10E314;
	Fri, 25 Apr 2025 09:28:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PseRv/+G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69EE510E314
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 09:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745573307; x=1777109307;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=t3+q53XNK07U0Ok6/ctrG/tNsyGHpKqHUWKXAIQrnh8=;
 b=PseRv/+GjEQGpqR8s427uM+1PCjCHZ8xirSHj43LgCyujM2pGfIvfUQH
 WKsNbR73cm7Lkoj33bM4wQqKX/nUxqJTc4ooMUan8bq/HhnidyFOM4w2J
 b309BPgEsNPy2F7vwOqdNUaWJ3WPSlTJ7nH6an/KM2N/qZ+BZe8BTcd+Y
 ECs5oQdc+o+5BVwsdcc4+//e87lKSEe8jTAZrqeLHw9PuWvb6avVPdHKi
 P2SV0y57CFjn4ccS3sQUV1mhWSgq43tPcaWh4ZiZ4FGz5tX9pQ4Gg9C55
 QY4kBfXsIAhjtgtYz7wvqAfRtn/hDCeGfIr02fXZCR8O6rvFNBRQvfzBp A==;
X-CSE-ConnectionGUID: 3+3iLKriSv2dWqsfTp7n0w==
X-CSE-MsgGUID: hXWuZNjfSRub0A0107xivA==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="46942530"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; d="scan'208";a="46942530"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2025 02:28:27 -0700
X-CSE-ConnectionGUID: 7kIYSI20SLKf0fMSErExxQ==
X-CSE-MsgGUID: vFdIMz0bR0qh9ibf1DuBgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; d="scan'208";a="133779050"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2025 02:28:25 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: quic_jhugo@quicinc.com, lizhi.hou@amd.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 stable@vger.kernel.org
Subject: [PATCH] accel/ivpu: Increase state dump msg timeout
Date: Fri, 25 Apr 2025 11:28:22 +0200
Message-ID: <20250425092822.2194465-1-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.45.1
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

Increase JMS message state dump command timeout to 100 ms. On some
platforms, the FW may take a bit longer than 50 ms to dump its state
to the log buffer and we don't want to miss any debug info during TDR.

Fixes: 5e162f872d7a ("accel/ivpu: Add FW state dump on TDR")
Cc: <stable@vger.kernel.org> # v6.13+
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_hw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/ivpu/ivpu_hw.c b/drivers/accel/ivpu/ivpu_hw.c
index ec9a3629da3a9..633160470c939 100644
--- a/drivers/accel/ivpu/ivpu_hw.c
+++ b/drivers/accel/ivpu/ivpu_hw.c
@@ -119,7 +119,7 @@ static void timeouts_init(struct ivpu_device *vdev)
 		else
 			vdev->timeout.autosuspend = 100;
 		vdev->timeout.d0i3_entry_msg = 5;
-		vdev->timeout.state_dump_msg = 10;
+		vdev->timeout.state_dump_msg = 100;
 	}
 }
 
-- 
2.45.1

