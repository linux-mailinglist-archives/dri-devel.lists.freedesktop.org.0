Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 126ED903B6D
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2024 14:05:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14CF210E5F9;
	Tue, 11 Jun 2024 12:05:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BEVy463E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 527BE10E5DF
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2024 12:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718107499; x=1749643499;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=a9e0pbfbhnxf3G8wHhFbW7L4EWIgEZTPs0LgK0gNfM8=;
 b=BEVy463EsR78z+iGsT/QUEOc+j9AqC6OAV9I7f56JztzYxvRaC/YBCFj
 VlHt9ywThFecn9fTdFpRmydEuvLFySipW9hC1mhF/pm2ywl351v7lovpq
 hBlPZ/BpdNiMp/WQJTfESjScof5zdSFp7RQ+aqDRO+ZhzuqC4u6Q1sWyy
 D2+BT/iAJfjhtHQnZnaFejp0Iuda3WWz8TA7dghvfm0u6rO01tnSZT0u6
 rYUZ2+YCPs1OFt6bQjF/y8VVhC7+7WVY2Gqt0kQgXB0xbnU1e+lHYqlRB
 QPBciS0aGT67bg6Lpe5hpVBsiSuyXBzFLrL9eZ4g98twcri9yZo5iIJ56 A==;
X-CSE-ConnectionGUID: V+RfR1OMTN6ADt42qv7Rqg==
X-CSE-MsgGUID: RMAVjEJPSRal8CWGtDXduw==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="32296098"
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="32296098"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 05:04:59 -0700
X-CSE-ConnectionGUID: PMVcQ36cQ9SZkbv+N/4fZg==
X-CSE-MsgGUID: MuqrFWlORkq/F3YspVy3oA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="39877202"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 05:04:57 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH 13/15] accel/ivpu: Increase autosuspend delay to 100ms on 40xx
Date: Tue, 11 Jun 2024 14:04:30 +0200
Message-ID: <20240611120433.1012423-14-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240611120433.1012423-1-jacek.lawrynowicz@linux.intel.com>
References: <20240611120433.1012423-1-jacek.lawrynowicz@linux.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>

The new HW is more power efficient and there is no
need to enter the D0i3/D3 so quickly. Increasing
autosuspend delay reduces latency in certain usage
scenarios.

Signed-off-by: Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_hw.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/accel/ivpu/ivpu_hw.c b/drivers/accel/ivpu/ivpu_hw.c
index a4a13ac67047..27f0fe4d54e0 100644
--- a/drivers/accel/ivpu/ivpu_hw.c
+++ b/drivers/accel/ivpu/ivpu_hw.c
@@ -99,7 +99,10 @@ static void timeouts_init(struct ivpu_device *vdev)
 		vdev->timeout.boot = 1000;
 		vdev->timeout.jsm = 500;
 		vdev->timeout.tdr = 2000;
-		vdev->timeout.autosuspend = 10;
+		if (ivpu_hw_ip_gen(vdev) == IVPU_HW_IP_37XX)
+			vdev->timeout.autosuspend = 10;
+		else
+			vdev->timeout.autosuspend = 100;
 		vdev->timeout.d0i3_entry_msg = 5;
 	}
 }
-- 
2.45.1

