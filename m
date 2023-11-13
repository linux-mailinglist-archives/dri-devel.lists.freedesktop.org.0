Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3751C7EA1A1
	for <lists+dri-devel@lfdr.de>; Mon, 13 Nov 2023 18:03:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F36CE10E171;
	Mon, 13 Nov 2023 17:03:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 680D810E171
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 17:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699895017; x=1731431017;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gZeQFGwJX9XWoyRbr+MsnGDVv1EaGzpAwihgDX6W32A=;
 b=f3gh48TlvnDGG2B6toQYsu7CyUfljmV5cNnJLi7MBTVFEYATjauHh0H4
 MKt1nKFb/RGHs7H6g+L5pBCyoIbREYOSkvWBBxzfCFYDzZ0JgTDpFWK3c
 S/djHUeZTPD3WAerNlMWrm3dpwuYMN6haT4WwPYvwSzTcrgB1aerPWSFW
 zCPnLx80Vu5gvRwg7WXf8p2D31fxaJDTsMx33bZWW1zu6hGMLfmp/f9ZG
 49MlNSwhkkO8O7HJ3KeZxY3TC7uMDUh5pkjvOHlE1aFdqWYLDz/TdXuRw
 gAW8rqiWri8Od6Zxq2FcKbvVXNi2TwPi+9tHjsB0LsbbTmWQGEsOxHVsk w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="3520667"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="3520667"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2023 09:03:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="937788065"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; d="scan'208";a="937788065"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2023 09:02:58 -0800
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/5] accel/ivpu: Do not use irqsave in ivpu_ipc_dispatch
Date: Mon, 13 Nov 2023 18:02:49 +0100
Message-ID: <20231113170252.758137-3-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231113170252.758137-1-jacek.lawrynowicz@linux.intel.com>
References: <20231113170252.758137-1-jacek.lawrynowicz@linux.intel.com>
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
 quic_jhugo@quicinc.com, Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>

ivpu_ipc_dispatch is always called with irqs disabled. Add lockdep
assertion and remove unneeded _irqsave/_irqrestore.

Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
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

