Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4157AD7BB
	for <lists+dri-devel@lfdr.de>; Mon, 25 Sep 2023 14:11:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1B1D10E240;
	Mon, 25 Sep 2023 12:11:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C134210E23C
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Sep 2023 12:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695643908; x=1727179908;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=b101LTR+mLaDs8aXrJOYVgWte7pC1sladQwPdO4J5L4=;
 b=Tj8jPru9o5Exaumc1Nll9SNpK5gIQ5y1/ivLmvTV1uxJ301ZjKTVBT5x
 X1ZCGUqxRDk22AocXUCO9xoVVI0h3ZixhYpV6Mqd0x6e+M6qBUjUrFeVX
 h04T/ppVko2eXV2v8P488jjCgnjN7FREHA3Je9UJUtJFWcAWpHLsj7vcH
 U14Y0gRN4e3s8N3BEZ2Au0ErWapUbHforDBHP9qUup9CWq70C41vq/v1v
 af23VBI4RWho2GvdoOrEglE+Uf3z6Wxz8KePTykrmxbgwPoOHGqiIkzrV
 g+vWqmTGzrQMCqGuMFK/7/I0cB07qotMpCP0bGYx6YrKEAi77wGKp4twJ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="378503402"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; d="scan'208";a="378503402"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 05:11:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="921949464"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; d="scan'208";a="921949464"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 05:11:45 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/6] accel/ivpu: Don't flood dmesg with VPU ready message
Date: Mon, 25 Sep 2023 14:11:33 +0200
Message-Id: <20230925121137.872158-3-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230925121137.872158-1-stanislaw.gruszka@linux.intel.com>
References: <20230925121137.872158-1-stanislaw.gruszka@linux.intel.com>
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
Cc: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>

Use ivpu_dbg() to print the VPU ready message so it doesn't pollute
the dmesg.

Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
index aa7314fdbc0f..467a60235370 100644
--- a/drivers/accel/ivpu/ivpu_drv.c
+++ b/drivers/accel/ivpu/ivpu_drv.c
@@ -327,7 +327,7 @@ static int ivpu_wait_for_ready(struct ivpu_device *vdev)
 	}
 
 	if (!ret)
-		ivpu_info(vdev, "VPU ready message received successfully\n");
+		ivpu_dbg(vdev, PM, "VPU ready message received successfully\n");
 	else
 		ivpu_hw_diagnose_failure(vdev);
 
-- 
2.25.1

