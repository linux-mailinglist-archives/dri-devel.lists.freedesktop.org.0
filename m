Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B52710A38
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 12:38:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1263310E149;
	Thu, 25 May 2023 10:38:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7414C10E149
 for <dri-devel@lists.freedesktop.org>; Thu, 25 May 2023 10:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685011120; x=1716547120;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=c52Bcj/S4kI8qJmrBjjDMDbY5DHrVlaqUntYh4PC1ck=;
 b=GmzpokRBbsHI3NJsNNXVTVRMAamYMEi5DKF7ox2I9Tp4n6no7z11XCB1
 p0jlQ408647iqFpg0m2Rk/XHAfHRah2hSvZkTRa4CVfethrycnINbJw7F
 2Gs4lukjJRB7lNy6+rny+1t99CQBqssJLkyWH5a4zKBuVF/vFGWiDtsrs
 xnT2w+HNMZ1R1jRVi89WwX1Kd+rOmW3XFgfOmZ/mI97lppiXnwQ+9PRff
 Njf6TQoOkxwUMK6+H8SvKxw/W1vz/Jq4EwJsC+VP25z6CXxb4iTRpmYpo
 ft6n0p47Alw1Cmgg+ykOa48VSjFAlP/iq7GCTygUaIoG84lu8NOW4C79x A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="440208834"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; d="scan'208";a="440208834"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 03:38:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="879049269"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; d="scan'208";a="879049269"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 03:38:38 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] accel/ivpu: Do not use mutex_lock_interruptible
Date: Thu, 25 May 2023 12:38:18 +0200
Message-Id: <20230525103818.877590-2-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230525103818.877590-1-stanislaw.gruszka@linux.intel.com>
References: <20230525103818.877590-1-stanislaw.gruszka@linux.intel.com>
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
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Krystian Pradzynski <krystian.pradzynski@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If we get signal when waiting for the mmu->lock we do not invalidate
current MMU configuration what might result on undefined behavior.

Additionally there is little or no benefit on break waiting for
ipc->lock. In current code base, we keep this lock for short periods.

Fixes: 263b2ba5fc93 ("accel/ivpu: Add Intel VPU MMU support")
Reviewed-by: Krystian Pradzynski <krystian.pradzynski@linux.intel.com>
Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_ipc.c |  4 +---
 drivers/accel/ivpu/ivpu_mmu.c | 22 ++++++----------------
 2 files changed, 7 insertions(+), 19 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_ipc.c b/drivers/accel/ivpu/ivpu_ipc.c
index 3adcfa80fc0e..fa0af59e39ab 100644
--- a/drivers/accel/ivpu/ivpu_ipc.c
+++ b/drivers/accel/ivpu/ivpu_ipc.c
@@ -183,9 +183,7 @@ ivpu_ipc_send(struct ivpu_device *vdev, struct ivpu_ipc_consumer *cons, struct v
 	struct ivpu_ipc_info *ipc = vdev->ipc;
 	int ret;
 
-	ret = mutex_lock_interruptible(&ipc->lock);
-	if (ret)
-		return ret;
+	mutex_lock(&ipc->lock);
 
 	if (!ipc->on) {
 		ret = -EAGAIN;
diff --git a/drivers/accel/ivpu/ivpu_mmu.c b/drivers/accel/ivpu/ivpu_mmu.c
index fa9a9ad59643..53878e77aad3 100644
--- a/drivers/accel/ivpu/ivpu_mmu.c
+++ b/drivers/accel/ivpu/ivpu_mmu.c
@@ -597,16 +597,11 @@ static int ivpu_mmu_strtab_init(struct ivpu_device *vdev)
 int ivpu_mmu_invalidate_tlb(struct ivpu_device *vdev, u16 ssid)
 {
 	struct ivpu_mmu_info *mmu = vdev->mmu;
-	int ret;
-
-	ret = mutex_lock_interruptible(&mmu->lock);
-	if (ret)
-		return ret;
+	int ret = 0;
 
-	if (!mmu->on) {
-		ret = 0;
+	mutex_lock(&mmu->lock);
+	if (!mmu->on)
 		goto unlock;
-	}
 
 	ret = ivpu_mmu_cmdq_write_tlbi_nh_asid(vdev, ssid);
 	if (ret)
@@ -624,7 +619,7 @@ static int ivpu_mmu_cd_add(struct ivpu_device *vdev, u32 ssid, u64 cd_dma)
 	struct ivpu_mmu_cdtab *cdtab = &mmu->cdtab;
 	u64 *entry;
 	u64 cd[4];
-	int ret;
+	int ret = 0;
 
 	if (ssid > IVPU_MMU_CDTAB_ENT_COUNT)
 		return -EINVAL;
@@ -665,14 +660,9 @@ static int ivpu_mmu_cd_add(struct ivpu_device *vdev, u32 ssid, u64 cd_dma)
 	ivpu_dbg(vdev, MMU, "CDTAB %s entry (SSID=%u, dma=%pad): 0x%llx, 0x%llx, 0x%llx, 0x%llx\n",
 		 cd_dma ? "write" : "clear", ssid, &cd_dma, cd[0], cd[1], cd[2], cd[3]);
 
-	ret = mutex_lock_interruptible(&mmu->lock);
-	if (ret)
-		return ret;
-
-	if (!mmu->on) {
-		ret = 0;
+	mutex_lock(&mmu->lock);
+	if (!mmu->on)
 		goto unlock;
-	}
 
 	ret = ivpu_mmu_cmdq_write_cfgi_all(vdev);
 	if (ret)
-- 
2.25.1

