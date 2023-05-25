Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B82710A37
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 12:38:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C6FC10E144;
	Thu, 25 May 2023 10:38:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E32A10E144
 for <dri-devel@lists.freedesktop.org>; Thu, 25 May 2023 10:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685011117; x=1716547117;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6+SpnZPNzVFUKFM3VSj7TJ/tvXpCU2DXfW9GCHtEN7A=;
 b=AY9HJ1ztcVkhHS4+rwSg9Xw2h52EDkkjcb3CZ4+gNawuddEwWiPDOOph
 BfP1k0WSyTtSFFQLKA5EMeE1AkB7IuzE1Lblbv4uC9mwtG2B/zRJn749F
 XiYIAobzRbCXQyrqvFfbxiorl5dgXMUElWbVRYJwXdKWfqjKFK4NC56sU
 x/9Xoktfvq/zqZcXdxB2neFpIYb4ziT+yP6RgpQyv/dpvs44lEfVnoB3Z
 2ruu8K7vZKD/V4frNJxS18dHp1jZNC9IgHbDUn4xAXriy8zd6S+Ccqt43
 2bsX4GEjhcN/QwSU2bJc91C7S0KNEAlj/pJOlGiRj1+ZrZGIxRQEquL7h Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="440208808"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; d="scan'208";a="440208808"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 03:38:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="879049265"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; d="scan'208";a="879049265"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 03:38:33 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] accel/ivpu: Do not trigger extra VPU reset if the VPU is
 idle
Date: Thu, 25 May 2023 12:38:17 +0200
Message-Id: <20230525103818.877590-1-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>

Turning off the PLL and entering D0i3 will reset the VPU so
an explicit IP reset is redundant.
But if the VPU is active, it may interfere with PLL disabling
and to avoid that, we have to issue an additional IP reset
to silence the VPU before turning off the PLL.

Fixes: a8fed6d1e0b9 ("accel/ivpu: Fix power down sequence")
Signed-off-by: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>
Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_hw_mtl.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_hw_mtl.c b/drivers/accel/ivpu/ivpu_hw_mtl.c
index 3210f1b4a7dd..012a25fae16d 100644
--- a/drivers/accel/ivpu/ivpu_hw_mtl.c
+++ b/drivers/accel/ivpu/ivpu_hw_mtl.c
@@ -743,9 +743,8 @@ static int ivpu_hw_mtl_power_down(struct ivpu_device *vdev)
 {
 	int ret = 0;
 
-	if (ivpu_hw_mtl_reset(vdev)) {
+	if (!ivpu_hw_mtl_is_idle(vdev) && ivpu_hw_mtl_reset(vdev)) {
 		ivpu_err(vdev, "Failed to reset the VPU\n");
-		ret = -EIO;
 	}
 
 	if (ivpu_pll_disable(vdev)) {
@@ -753,8 +752,10 @@ static int ivpu_hw_mtl_power_down(struct ivpu_device *vdev)
 		ret = -EIO;
 	}
 
-	if (ivpu_hw_mtl_d0i3_enable(vdev))
-		ivpu_warn(vdev, "Failed to enable D0I3\n");
+	if (ivpu_hw_mtl_d0i3_enable(vdev)) {
+		ivpu_err(vdev, "Failed to enter D0I3\n");
+		ret = -EIO;
+	}
 
 	return ret;
 }
-- 
2.25.1

