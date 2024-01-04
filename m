Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D149182411B
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jan 2024 12:57:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9083B10E43D;
	Thu,  4 Jan 2024 11:57:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E67F10E43D
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jan 2024 11:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704369451; x=1735905451;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SK6gBGK1nHTOfehpUaxb9Oz6w0n2mfpzP/6ahJxKjNc=;
 b=YCxrAyZrrIQeP//teFHQmiOLPly5ldIakjhe8rWZ59wZ0XENdA6qjrHj
 iWnMoDgBMmtsbe+LIoqoJCs3rra8O5guPsYLecM0IB73E3j4LMSltF+MK
 MiXCLVbjy5A7gIibLEbJxHQxGoW2TW++WeKG3F2UnZZQZRpjcDBeisKPX
 AxoLYuuIhPILSMKMPngj67IJhumLFD4mwxv4SqkKC8AsnI0VBt2n1fxxs
 51DkYQYL5Ww2UUSwGkiMV4Hj0/YyXySuYdBn0x90j0KjyB3z70Ju0gqCk
 Ve/r7H0oTYiFInkm22x20IHkSFCmb3Cwa3mxuEha2ZF5GnJMXjKYDUcBh g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="4584149"
X-IronPort-AV: E=Sophos;i="6.04,330,1695711600"; 
   d="scan'208";a="4584149"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2024 03:57:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="899275727"
X-IronPort-AV: E=Sophos;i="6.04,330,1695711600"; d="scan'208";a="899275727"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2024 03:57:28 -0800
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 05/16] accel/ivpu/40xx: Enable D0i3 message feature
Date: Thu,  4 Jan 2024 12:57:02 +0100
Message-ID: <20240104115713.8657-6-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240104115713.8657-1-jacek.lawrynowicz@linux.intel.com>
References: <20240104115713.8657-1-jacek.lawrynowicz@linux.intel.com>
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
Cc: quic_jhugo@quicinc.com, Krystian Pradzynski <krystian.pradzynski@intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Krystian Pradzynski <krystian.pradzynski@intel.com>

All recent 40xx firmware already supports D0i3 entry message.

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

