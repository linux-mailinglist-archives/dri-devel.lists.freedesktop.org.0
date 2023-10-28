Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F08C97DA7EB
	for <lists+dri-devel@lfdr.de>; Sat, 28 Oct 2023 18:00:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9460810E161;
	Sat, 28 Oct 2023 16:00:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01F1410E0DA
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Oct 2023 16:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698508804; x=1730044804;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AutTNWubAVfYwbiS+L29jCFEnTvAgtXYiN19rs/eQDY=;
 b=FVQuu1bATVMH0VMH6wn2JdRhhvR0LcuBz0vqe209ngiu+NFTNY+gh0e9
 Qj64id9a651JIBHY2Vw09hDRnN3b9eTuuhU0NpMhMu5tfhMNWdJEeKt5Q
 FfdgN0/u+ubE4g1APEBfwwNtrAN018DpvJSU9uq7NOE2QdNTZ0ezNeZSk
 RQiwgTctCQZdjmUC9kD0lCycB5XPP7L0o9sUhafzVReaQJxbxLen0iWoe
 +bpsuEFKI87B1j+ULXrXoLju2rw5npt3b4YWpVvd0rcCmYY9WV63RzUNu
 9q2kQvFQAgfbXZSAtbF6cRIXT1TcXG1WmhRKq3p2xmkJWORL3cuEHZDWQ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10877"; a="452152685"
X-IronPort-AV: E=Sophos;i="6.03,259,1694761200"; d="scan'208";a="452152685"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2023 09:00:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10877"; a="763516429"
X-IronPort-AV: E=Sophos;i="6.03,259,1694761200"; d="scan'208";a="763516429"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2023 09:00:03 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 7/8] accel/ivpu: Simplify MMU SYNC command
Date: Sat, 28 Oct 2023 17:59:35 +0200
Message-Id: <20231028155936.1183342-8-stanislaw.gruszka@linux.intel.com>
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
Cc: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>

CMD_SYNC does not need any args as we poll for completion anyway.

Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_mmu.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_mmu.c b/drivers/accel/ivpu/ivpu_mmu.c
index b15cf9cc9c43..b46f3743c0e7 100644
--- a/drivers/accel/ivpu/ivpu_mmu.c
+++ b/drivers/accel/ivpu/ivpu_mmu.c
@@ -500,10 +500,7 @@ static int ivpu_mmu_cmdq_sync(struct ivpu_device *vdev)
 	u64 val;
 	int ret;
 
-	val = FIELD_PREP(IVPU_MMU_CMD_OPCODE, CMD_SYNC) |
-	      FIELD_PREP(IVPU_MMU_CMD_SYNC_0_CS, 0x2) |
-	      FIELD_PREP(IVPU_MMU_CMD_SYNC_0_MSH, 0x3) |
-	      FIELD_PREP(IVPU_MMU_CMD_SYNC_0_MSI_ATTR, 0xf);
+	val = FIELD_PREP(IVPU_MMU_CMD_OPCODE, CMD_SYNC);
 
 	ret = ivpu_mmu_cmdq_cmd_write(vdev, "SYNC", val, 0);
 	if (ret)
-- 
2.25.1

