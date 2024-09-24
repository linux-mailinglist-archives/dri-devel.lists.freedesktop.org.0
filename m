Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC7C7984035
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 10:18:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DCE610E66C;
	Tue, 24 Sep 2024 08:18:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HHD7pN9K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 050F210E663
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 08:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727165917; x=1758701917;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qexXKmPBV32FmtjZ2u3eecepAIPV67a1An86kODtnXo=;
 b=HHD7pN9KSl0Wthjdfuy5Fk4eqUo5ZX20Gl6eZ872Q+neIKnFX7UdyWqZ
 AN1fpA881jcPSSxzfR7Km5Jj/tsMEkT7e2hOi6vyZ40Wq6f5n0TuGag3e
 pKsgbU7yo5NlRwH6Y0LPb8lYtY3qpuqdmbjm/MXEOzwzwMJAQqDULFy5u
 9OkWa3YxjvqUUfmxNni6/0SJtMFB0WFOytOZoxK4jbDNO0drqZpIk4LHE
 3ePl5Wnr/aLYinb8MkwypYbBSXlAYCvsHi2p9BimkDqZTdA9BlXRWpB+o
 pC3FXFYlT1xWKP+KWNMVxKUXERvJ6d6CK20ry4NKPTyJhPNAOUA1XXx5P g==;
X-CSE-ConnectionGUID: fSEM5ef0SJihBU3o0IODAw==
X-CSE-MsgGUID: fpZs3v9kQLu7wntN4I3fUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="37506965"
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; d="scan'208";a="37506965"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 01:18:36 -0700
X-CSE-ConnectionGUID: 6/NL6NbWRhaJj8P9cD7Ocg==
X-CSE-MsgGUID: 7bKOBKBSQVuYyTthQ8xNUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; d="scan'208";a="102170716"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 01:18:35 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Karol Wachowski <karol.wachowski@intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH 15/29] accel/ivpu: Print JSM message result in case of error
Date: Tue, 24 Sep 2024 10:17:40 +0200
Message-ID: <20240924081754.209728-16-jacek.lawrynowicz@linux.intel.com>
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

From: Karol Wachowski <karol.wachowski@intel.com>

Change debug message to error level in case of receiving
non-successful result of JSM message.

Signed-off-by: Karol Wachowski <karol.wachowski@intel.com>
Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
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

