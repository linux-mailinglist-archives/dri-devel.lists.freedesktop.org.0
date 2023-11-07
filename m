Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EFDC7E3E36
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 13:35:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30E7710E5E9;
	Tue,  7 Nov 2023 12:35:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62FC310E5E8
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Nov 2023 12:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699360521; x=1730896521;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IEc2ODk/4eKfsWixkRSwyEMAlRdXNx/cwCIYAX7khbg=;
 b=MaJmJarF+BcNSTHNqQxUfX+xe2bo624G7lM0+hNJ6eXlp7EbWlu5UZtQ
 6Bu3cFt455BXA4QtQhuH2wc1bK+xIbotIL9sQw1M1E708beBwv1vZoKnM
 f3HgCP3ds/fnjekiKr9Fr447Q0GWw08L9vYZnNP2gzMRqoxNa93bZxm2+
 lRKQ2zIql4Vw4PgFH72EZg7rhYLKrLO4UTn1fbyEgHjPEKfiqB/Nh+82G
 O+VVn83As4l+LZ20eUWkEfBnqDjk8JFBdEwtcgVZ0WoFFbGnUEfk8yOFT
 dz7qrh+4pJ6/S7WAbEw1SyJ01KXATHuHtYHDUwdn2YL+I5/pHz8c7DGTC A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="393396723"
X-IronPort-AV: E=Sophos;i="6.03,283,1694761200"; d="scan'208";a="393396723"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2023 04:35:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,283,1694761200"; 
   d="scan'208";a="3979138"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2023 04:35:19 -0800
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/5] accel/ivpu: Do not use irqsave in ivpu_ipc_dispatch
Date: Tue,  7 Nov 2023 13:35:11 +0100
Message-ID: <20231107123514.2218850-3-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231107123514.2218850-1-jacek.lawrynowicz@linux.intel.com>
References: <20231107123514.2218850-1-jacek.lawrynowicz@linux.intel.com>
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
 quic_jhugo@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>

ivpu_ipc_dispatch is always called with irqs disabled. Add lockdep
assertion and remove unneeded _irqsave/_irqrestore.

Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_ipc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_ipc.c b/drivers/accel/ivpu/ivpu_ipc.c
index 31ae0e71a8a3..781c7e40505a 100644
--- a/drivers/accel/ivpu/ivpu_ipc.c
+++ b/drivers/accel/ivpu/ivpu_ipc.c
@@ -367,9 +367,9 @@ ivpu_ipc_dispatch(struct ivpu_device *vdev, struct ivpu_ipc_consumer *cons,
 {
 	struct ivpu_ipc_info *ipc = vdev->ipc;
 	struct ivpu_ipc_rx_msg *rx_msg;
-	unsigned long flags;
 
 	lockdep_assert_held(&ipc->cons_list_lock);
+	lockdep_assert_irqs_disabled();
 
 	rx_msg = kzalloc(sizeof(*rx_msg), GFP_ATOMIC);
 	if (!rx_msg) {
@@ -382,9 +382,9 @@ ivpu_ipc_dispatch(struct ivpu_device *vdev, struct ivpu_ipc_consumer *cons,
 	rx_msg->ipc_hdr = ipc_hdr;
 	rx_msg->jsm_msg = jsm_msg;
 
-	spin_lock_irqsave(&cons->rx_lock, flags);
+	spin_lock(&cons->rx_lock);
 	list_add_tail(&rx_msg->link, &cons->rx_msg_list);
-	spin_unlock_irqrestore(&cons->rx_lock, flags);
+	spin_unlock(&cons->rx_lock);
 
 	wake_up(&cons->rx_msg_wq);
 }
-- 
2.42.0

