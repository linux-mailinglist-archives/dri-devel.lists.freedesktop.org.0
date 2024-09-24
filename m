Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC78984039
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 10:18:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD0B010E66F;
	Tue, 24 Sep 2024 08:18:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R41gknbo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF26C10E66E
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 08:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727165934; x=1758701934;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dVWIukj8aaIcEKl/ur5b7fYb4uBvTdVMda6QJu5eYVA=;
 b=R41gknbopSLxS16DzWdJ1D2uAS+OdzMms71f5wMJ6v+Kx4i2g60Ga9We
 dywxxXTVQw8J/GgvAm5qeob1b6GE96qdkTM0QVaCNp/VdjldojZ5isqLn
 v/X2N18XuoqJ9pnxZVlm0tuKWP1v0FGEzyJo2DxSGpifv9JxequU0FLnt
 YMJl3GpVtUye/YAdWryNkOyLGkS66OKNZgI0whlr16WLTgjhISyiOEk+g
 XBzXCgsSfS0rvsvI8Bw8rZzzwZTgM2y3QneU70etiJv3i1ZaFiTImRslq
 496nkzDPStIuSA9tNFCcD3dJLf5qbPCxrQ4TJDAaW2LVx6/FBkSeKhscr g==;
X-CSE-ConnectionGUID: QrHdHqqLSf2J7tHhXsimbQ==
X-CSE-MsgGUID: ehhhB4rbThW6kpqJzwz+xA==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="37507021"
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; d="scan'208";a="37507021"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 01:18:54 -0700
X-CSE-ConnectionGUID: je+PmFrSRRqJDtSgOcL/2w==
X-CSE-MsgGUID: B0UBt+/wSQ+I8jf6YwyIPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; d="scan'208";a="102170768"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 01:18:52 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Karol Wachowski <karol.wachowski@intel.com>
Subject: [PATCH 26/29] accel/ivpu: Fix ivpu_jsm_dyndbg_control()
Date: Tue, 24 Sep 2024 10:17:51 +0200
Message-ID: <20240924081754.209728-27-jacek.lawrynowicz@linux.intel.com>
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

Use correct channel for dyndbg JSM message.

Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Reviewed-by: Karol Wachowski <karol.wachowski@intel.com>
---
 drivers/accel/ivpu/ivpu_jsm_msg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/ivpu/ivpu_jsm_msg.c b/drivers/accel/ivpu/ivpu_jsm_msg.c
index ae91ad24d10d8..494ebc2475b19 100644
--- a/drivers/accel/ivpu/ivpu_jsm_msg.c
+++ b/drivers/accel/ivpu/ivpu_jsm_msg.c
@@ -197,7 +197,7 @@ int ivpu_jsm_dyndbg_control(struct ivpu_device *vdev, char *command, size_t size
 	strscpy(req.payload.dyndbg_control.dyndbg_cmd, command, VPU_DYNDBG_CMD_MAX_LEN);
 
 	ret = ivpu_ipc_send_receive(vdev, &req, VPU_JSM_MSG_DYNDBG_CONTROL_RSP, &resp,
-				    VPU_IPC_CHAN_ASYNC_CMD, vdev->timeout.jsm);
+				    VPU_IPC_CHAN_GEN_CMD, vdev->timeout.jsm);
 	if (ret)
 		ivpu_warn_ratelimited(vdev, "Failed to send command \"%s\": ret %d\n",
 				      command, ret);
-- 
2.45.1

