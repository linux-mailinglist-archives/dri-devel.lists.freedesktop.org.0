Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 370E57DA7EA
	for <lists+dri-devel@lfdr.de>; Sat, 28 Oct 2023 18:00:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E18910E159;
	Sat, 28 Oct 2023 16:00:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 159A010E0DA
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Oct 2023 15:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698508798; x=1730044798;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Z2ZPO09qMPQzCjDsSkE220P2m0R7K59pGpldCatfZ/E=;
 b=G3T80XqYFAY096X6FmAz7SXztXwhoZTmo/T/fsUYcPAHPvdtLWwBKRf5
 1KZxTrhBYJWSMOu9LhVeEXnIv0+qCg6dlYrbKRD9c7QmOleMA/+2wGL/E
 Fiziie+myilRHnXyPXgQ/jyvm+XAGrbXH8GE+/oD7QPdVsYbwRXHJ+qFt
 xbPlpbQyPxc3Ce2aKGzYIevMXVWx338jGYJlD+kAjYoyxvfqZcfWLF1/S
 AEWYbxJeVtVvdHOCOLqn2DbIPQVDUbEE0IBEtIAHuRKZBh2nZgC1/1hUh
 PSC5RCgrF8KOvB3DTb8P+DEGZXonOpu3yC1361n7+IaBbyiAwnzzrOHFe A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10877"; a="452152667"
X-IronPort-AV: E=Sophos;i="6.03,259,1694761200"; d="scan'208";a="452152667"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2023 08:59:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10877"; a="763516403"
X-IronPort-AV: E=Sophos;i="6.03,259,1694761200"; d="scan'208";a="763516403"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2023 08:59:56 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 5/8] accel/ivpu: Print CMDQ errors after consumer timeout
Date: Sat, 28 Oct 2023 17:59:33 +0200
Message-Id: <20231028155936.1183342-6-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231028155936.1183342-1-stanislaw.gruszka@linux.intel.com>
References: <20231028155936.1183342-1-stanislaw.gruszka@linux.intel.com>
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
Cc: Karol Wachowski <karol.wachowski@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Karol Wachowski <karol.wachowski@linux.intel.com>

Add checking of error reason bits in IVPU_MMU_CMDQ_CONS
register when waiting for consumer timeout occurred.

Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>
Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_mmu.c | 34 +++++++++++++++++++++++++++++++---
 1 file changed, 31 insertions(+), 3 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_mmu.c b/drivers/accel/ivpu/ivpu_mmu.c
index 2538c78fbebe..b15cf9cc9c43 100644
--- a/drivers/accel/ivpu/ivpu_mmu.c
+++ b/drivers/accel/ivpu/ivpu_mmu.c
@@ -230,7 +230,12 @@
 				  (REG_FLD(IVPU_MMU_REG_GERROR, MSI_PRIQ_ABT)) | \
 				  (REG_FLD(IVPU_MMU_REG_GERROR, MSI_ABT)))
 
-static char *ivpu_mmu_event_to_str(u32 cmd)
+#define IVPU_MMU_CERROR_NONE         0x0
+#define IVPU_MMU_CERROR_ILL          0x1
+#define IVPU_MMU_CERROR_ABT          0x2
+#define IVPU_MMU_CERROR_ATC_INV_SYNC 0x3
+
+static const char *ivpu_mmu_event_to_str(u32 cmd)
 {
 	switch (cmd) {
 	case IVPU_MMU_EVT_F_UUT:
@@ -276,6 +281,22 @@ static char *ivpu_mmu_event_to_str(u32 cmd)
 	}
 }
 
+static const char *ivpu_mmu_cmdq_err_to_str(u32 err)
+{
+	switch (err) {
+	case IVPU_MMU_CERROR_NONE:
+		return "No CMDQ Error";
+	case IVPU_MMU_CERROR_ILL:
+		return "Illegal command";
+	case IVPU_MMU_CERROR_ABT:
+		return "External abort on CMDQ read";
+	case IVPU_MMU_CERROR_ATC_INV_SYNC:
+		return "Sync failed to complete ATS invalidation";
+	default:
+		return "Unknown CMDQ Error";
+	}
+}
+
 static void ivpu_mmu_config_check(struct ivpu_device *vdev)
 {
 	u32 val_ref;
@@ -492,8 +513,15 @@ static int ivpu_mmu_cmdq_sync(struct ivpu_device *vdev)
 	REGV_WR32(IVPU_MMU_REG_CMDQ_PROD, q->prod);
 
 	ret = ivpu_mmu_cmdq_wait_for_cons(vdev);
-	if (ret)
-		ivpu_err(vdev, "Timed out waiting for consumer: %d\n", ret);
+	if (ret) {
+		u32 err;
+
+		val = REGV_RD32(IVPU_MMU_REG_CMDQ_CONS);
+		err = REG_GET_FLD(IVPU_MMU_REG_CMDQ_CONS, ERR, val);
+
+		ivpu_err(vdev, "Timed out waiting for MMU consumer: %d, error: %s\n", ret,
+			 ivpu_mmu_cmdq_err_to_str(err));
+	}
 
 	return ret;
 }
-- 
2.25.1

