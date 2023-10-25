Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F3B7D671F
	for <lists+dri-devel@lfdr.de>; Wed, 25 Oct 2023 11:43:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8400310E61E;
	Wed, 25 Oct 2023 09:43:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 419A010E61F
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Oct 2023 09:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698227025; x=1729763025;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QnzYmCSmVw8pTayTFDWMQD0X/3raSICp9d1dACG5Li0=;
 b=QyByOdd8A7eXpRT4MeLK5Dp0wnWCtxzrBx2QFY4O7KnTfxSiwxNBOD+o
 mDa8oW/oBw4QanysyrwPv/2Y/2QRGR3w7Ro4mYvzw44cSOiUhdgldYpvz
 IHJMhLTjSMU9XjLdUy6/ZsHtLwWu9EBEjsZcDzr68oMgFCkWodOM4bhao
 bYR8UWZWTrMNhtJqjvf1ASSSyFIuQGmbwWNlx5C+wR8Cjnq/wjFfOwXJq
 n7K+kfuAldsDAob3y+Q7Rv91sTCcE9c04h6bSctQVJtx6ijgS2eHqNo+/
 ubvjMfPN03h/waX79JStcaSfj1cf3CZ+rLtC8KLZ1LXjH49GJDV4M0+MA Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="451498802"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; d="scan'208";a="451498802"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 02:43:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="882401129"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; d="scan'208";a="882401129"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 02:43:42 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 04/11] accel/ivpu: Remove reset from power up sequence
Date: Wed, 25 Oct 2023 11:43:16 +0200
Message-Id: <20231025094323.989987-5-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231025094323.989987-1-stanislaw.gruszka@linux.intel.com>
References: <20231025094323.989987-1-stanislaw.gruszka@linux.intel.com>
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

Setting a non-zero work point resets the IP hence IP_RESET
trigger is redundant.

Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>
Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_hw_37xx.c | 4 ----
 drivers/accel/ivpu/ivpu_hw_40xx.c | 6 ------
 2 files changed, 10 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_hw_37xx.c b/drivers/accel/ivpu/ivpu_hw_37xx.c
index 56b53833ede2..0da4e6117d6b 100644
--- a/drivers/accel/ivpu/ivpu_hw_37xx.c
+++ b/drivers/accel/ivpu/ivpu_hw_37xx.c
@@ -668,10 +668,6 @@ static int ivpu_hw_37xx_power_up(struct ivpu_device *vdev)
 {
 	int ret;
 
-	ret = ivpu_hw_37xx_ip_reset(vdev);
-	if (ret)
-		ivpu_warn(vdev, "Failed to reset HW: %d\n", ret);
-
 	ret = ivpu_hw_37xx_d0i3_disable(vdev);
 	if (ret)
 		ivpu_warn(vdev, "Failed to disable D0I3: %d\n", ret);
diff --git a/drivers/accel/ivpu/ivpu_hw_40xx.c b/drivers/accel/ivpu/ivpu_hw_40xx.c
index b25d02dc541b..5876cfd9dd40 100644
--- a/drivers/accel/ivpu/ivpu_hw_40xx.c
+++ b/drivers/accel/ivpu/ivpu_hw_40xx.c
@@ -841,12 +841,6 @@ static int ivpu_hw_40xx_power_up(struct ivpu_device *vdev)
 {
 	int ret;
 
-	ret = ivpu_hw_40xx_ip_reset(vdev);
-	if (ret) {
-		ivpu_err(vdev, "Failed to reset HW: %d\n", ret);
-		return ret;
-	}
-
 	ret = ivpu_hw_40xx_d0i3_disable(vdev);
 	if (ret)
 		ivpu_warn(vdev, "Failed to disable D0I3: %d\n", ret);
-- 
2.25.1

