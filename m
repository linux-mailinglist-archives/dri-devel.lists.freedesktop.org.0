Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F1E98AD73
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 21:54:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ABF210E58D;
	Mon, 30 Sep 2024 19:53:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lOhfFwE8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BA5710E588
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 19:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727726033; x=1759262033;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+bc+1v5BLlx0zPDMGcaGpguJDuhMspXy22T7/qVhTwc=;
 b=lOhfFwE8XWrNXr4ftkbw5eF+k2CuCoCOU2mf8ganaObCZ7EXEI2DekPI
 D76thFB+CsqwYzk+NQBmdwNJhu5AgK9Jr2VeWx9yZQyMAG8J/5Fik+ma9
 3m2HOWjMKd6tBII5MkriZ2QicvMH605vypbxUtqFJB6XnmP3afUTGgkaa
 HoWwMbpvuylF3T46Sqj4yYR4VaP4tbkhth3PMTTTsL5iLBaXMsH+tTDV3
 gQaWA3MPj+Th1QOoE6A5ttd2Ghxot3ZUHAdI5/Ehqh/TLWEwNgZS2w3Tt
 /BSliAo9M6W43ipdvWjN1buwdoTXozNWAfIn9/Rgd2YV/gCjDT1NoW+/P Q==;
X-CSE-ConnectionGUID: Mw2TZeswTlCJSXrKva/bgg==
X-CSE-MsgGUID: EUq7CPsATG+nHI5ZTd1Yxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="26962342"
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; d="scan'208";a="26962342"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 12:53:52 -0700
X-CSE-ConnectionGUID: Ycud0yWjTEyBAuxypuBUIQ==
X-CSE-MsgGUID: YBoteuLKSzG+7pDyYgEOFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; d="scan'208";a="73370101"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 12:53:50 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Karol Wachowski <karol.wachowski@intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH v2 17/31] accel/ivpu: Print JSM message result in case of error
Date: Mon, 30 Sep 2024 21:53:08 +0200
Message-ID: <20240930195322.461209-18-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240930195322.461209-1-jacek.lawrynowicz@linux.intel.com>
References: <20240930195322.461209-1-jacek.lawrynowicz@linux.intel.com>
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

From: Karol Wachowski <karol.wachowski@intel.com>

Change debug message to error level in case of receiving
non-successful result of JSM message.

Signed-off-by: Karol Wachowski <karol.wachowski@intel.com>
Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_ipc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/ivpu/ivpu_ipc.c b/drivers/accel/ivpu/ivpu_ipc.c
index 83b4ba4f3e20a..e7bccc20e4e4e 100644
--- a/drivers/accel/ivpu/ivpu_ipc.c
+++ b/drivers/accel/ivpu/ivpu_ipc.c
@@ -278,7 +278,7 @@ int ivpu_ipc_receive(struct ivpu_device *vdev, struct ivpu_ipc_consumer *cons,
 		u32 size = min_t(int, rx_msg->ipc_hdr->data_size, sizeof(*jsm_msg));
 
 		if (rx_msg->jsm_msg->result != VPU_JSM_STATUS_SUCCESS) {
-			ivpu_dbg(vdev, IPC, "IPC resp result error: %d\n", rx_msg->jsm_msg->result);
+			ivpu_err(vdev, "IPC resp result error: %d\n", rx_msg->jsm_msg->result);
 			ret = -EBADMSG;
 		}
 
-- 
2.45.1

