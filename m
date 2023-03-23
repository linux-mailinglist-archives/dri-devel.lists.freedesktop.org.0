Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE7D6C68F4
	for <lists+dri-devel@lfdr.de>; Thu, 23 Mar 2023 13:55:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64A4A10E8C9;
	Thu, 23 Mar 2023 12:55:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73E2D10E7E4
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Mar 2023 12:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679576143; x=1711112143;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ExnIqkdutiWdNLhyP6R7kzRdRcwy/uqp5ZatNDeXQRE=;
 b=f7Fli4wIf8gSSzoE+5PeAxyNKtYhdhlRX/yF9Uh1qUCJExtFlXTrLJOE
 9pQNHyWg/p3Xy/otyz5T2W5GBFmUDsgiU5xT5r4sXQhJg17wgiVuLvxdq
 ki3vNSjz5RrkAUpIAhcLA/Cn96KVs9pMTAJkCJwWZJLYIWjpOA59/CwFc
 bA8/7dtucbjI9fj6C6C7vrKCRLLwwyukFx1XokRRqvAHnqJ63ll9iJpjQ
 VNL/aq8CoK/nJXBBbdY6S+KMx10l9b7I+ksYnTi15LBtI5LylbGq8FIB+
 gFaytXLD3CNA4qivcwIbLtq5nKCwS/9MGDVJN9Mr/14+m3I/by3mxBexv w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="336982595"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; d="scan'208";a="336982595"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 05:55:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="793010890"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; d="scan'208";a="793010890"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 05:55:39 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 8/8] accel/ivpu: Fix IPC buffer header status field value
Date: Thu, 23 Mar 2023 13:55:04 +0100
Message-Id: <20230323125504.2586442-9-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230323125504.2586442-1-stanislaw.gruszka@linux.intel.com>
References: <20230323125504.2586442-1-stanislaw.gruszka@linux.intel.com>
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
Cc: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>

IPC messages transmitted to the device must be marked as
allocated - status field must be set to 1. The VPU driver
has IVPU_IPC_HDR_ALLOCATED incorrectly defined. Future VPU
firmware versions will reject all IPC messages with invalid
status and will not work with a VPU driver that is missing
this fix.

Fixes: 5d7422cfb498 ("accel/ivpu: Add IPC driver and JSM messages")
Signed-off-by: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>
Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_ipc.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/ivpu/ivpu_ipc.h b/drivers/accel/ivpu/ivpu_ipc.h
index 9838202ecfad..68f5b6668e00 100644
--- a/drivers/accel/ivpu/ivpu_ipc.h
+++ b/drivers/accel/ivpu/ivpu_ipc.h
@@ -21,7 +21,7 @@ struct ivpu_bo;
 #define IVPU_IPC_ALIGNMENT	   64
 
 #define IVPU_IPC_HDR_FREE	   0
-#define IVPU_IPC_HDR_ALLOCATED	   0
+#define IVPU_IPC_HDR_ALLOCATED	   1
 
 /**
  * struct ivpu_ipc_hdr - The IPC message header structure, exchanged
-- 
2.25.1

