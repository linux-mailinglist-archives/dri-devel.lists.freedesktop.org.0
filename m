Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 417FB98AD7E
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 21:54:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 193D210E592;
	Mon, 30 Sep 2024 19:54:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ipSVwCqX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7E0D10E582
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 19:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727726049; x=1759262049;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tnb2D98ovuhVv/GHeaabCD/iwVfrbKEpwh7w5B8Nejk=;
 b=ipSVwCqXeCmWxkiRx9WUpS3GzUmazDrYxBAYGKlFFI4xq7LYci1ItT8Y
 bzaJ1hqdu9b2JOIROmzCS7TluXncAsO0JroLW7KiBWRp2Da2+WwXgW5fC
 RIz094IUVmOPrCjv5lOz9SxJVCPUH3SClu7QQUPkyte7d7/xeVqCxYik0
 BmDDcBBxq+r8448/ojQ64Kjxv5YG1SqJONjvdQRoNLdBnQL4OG73vcwLv
 +1h3MkETrCnXlTWh/WPq0CMO2adbEXd7RafOPMo3J95NolIdf5hJfDzca
 YQC2LV7fPMarwjzofVh++sPQ+8C7WNguP83fytlPjloqZ4JzeYO1HstET w==;
X-CSE-ConnectionGUID: /kJCD/ZxTASHCduNw38wtw==
X-CSE-MsgGUID: aELJfQxMR7CJmOWyPIxLqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="26962385"
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; d="scan'208";a="26962385"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 12:54:09 -0700
X-CSE-ConnectionGUID: m6DciyL+RzaL27RV6RNtNw==
X-CSE-MsgGUID: /Qy/Jjy6S7GaGoGd3fyqXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; d="scan'208";a="73370249"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 12:54:07 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Karol Wachowski <karol.wachowski@intel.com>
Subject: [PATCH v2 28/31] accel/ivpu: Fix ivpu_jsm_dyndbg_control()
Date: Mon, 30 Sep 2024 21:53:19 +0200
Message-ID: <20240930195322.461209-29-jacek.lawrynowicz@linux.intel.com>
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

Use correct channel for dyndbg JSM message.

Reviewed-by: Karol Wachowski <karol.wachowski@intel.com>
Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
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

