Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D083283DA27
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jan 2024 13:28:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0C5210FA01;
	Fri, 26 Jan 2024 12:28:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 771E510F9F1
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jan 2024 12:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706272095; x=1737808095;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MCwZ7gS9txLeAHF3l2eJt1A7frR2g/BTOZnpHfY/sGE=;
 b=G8TKYMQelGxoEY7EP4686it1LtjQDqRMHrN16iyEBgvoqqL4XJNBfS0W
 cJLFtzp1iWo76aC4kh4U/195onQiN90dA3tN1U2u+6mhiaYZ+1CjC0/6s
 /Lj5amqbHHTtbTDna6letGspSgct/nyqcY5ppbOQ2o0uOA4NvR7bvAJcH
 Fz6Y4zHAHfKRL4Lx9kfeqvcMXyFhNlFGlluskGa/uHnCLuIJftuGPa9pb
 2InEWPB1PSDchnQHcHNrvxoAUbR0dVkB6sZ+Xjf68PZy7qmK6FyDXV2Cb
 96SWxOfbi1w4NdplPasUU9b1pFJIehVstmvkDPGAe/k8bKbchBisFosIc g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="9207465"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="9207465"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2024 04:28:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="2731931"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2024 04:28:14 -0800
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 5/7] accel/ivpu/40xx: Enable D0i3 message
Date: Fri, 26 Jan 2024 13:28:02 +0100
Message-ID: <20240126122804.2169129-6-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240126122804.2169129-1-jacek.lawrynowicz@linux.intel.com>
References: <20240126122804.2169129-1-jacek.lawrynowicz@linux.intel.com>
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
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Krystian Pradzynski <krystian.pradzynski@intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Krystian Pradzynski <krystian.pradzynski@intel.com>

All recent 40xx firmware already supports D0i3 entry message and this
WA is no longer needed.

Signed-off-by: Krystian Pradzynski <krystian.pradzynski@intel.com>
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_fw.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/accel/ivpu/ivpu_fw.c b/drivers/accel/ivpu/ivpu_fw.c
index 6576232f3e67..5fa8bd4603d5 100644
--- a/drivers/accel/ivpu/ivpu_fw.c
+++ b/drivers/accel/ivpu/ivpu_fw.c
@@ -222,7 +222,6 @@ ivpu_fw_init_wa(struct ivpu_device *vdev)
 	const struct vpu_firmware_header *fw_hdr = (const void *)vdev->fw->file->data;
 
 	if (IVPU_FW_CHECK_API_VER_LT(vdev, fw_hdr, BOOT, 3, 17) ||
-	    (ivpu_hw_gen(vdev) > IVPU_HW_37XX) ||
 	    (ivpu_test_mode & IVPU_TEST_MODE_D0I3_MSG_DISABLE))
 		vdev->wa.disable_d0i3_msg = true;
 
-- 
2.43.0

