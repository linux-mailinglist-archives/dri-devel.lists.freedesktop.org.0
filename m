Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2468398402D
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 10:18:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 849D110E661;
	Tue, 24 Sep 2024 08:18:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b+/pg46j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EA4A10E653
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 08:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727165907; x=1758701907;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KwV79boFIukRvTOyIJrRdFfaQbtDXWhbktACuzSWr1k=;
 b=b+/pg46jrRTQ4ixka0NkjNW9R64iTfQDbL1tzqShWxJwtmAGCJVxsSeW
 GDTbakGUpxck2yV/a+yWwUksJyVsx3CoWau41zHLbQOG+t2/3z7nRsDro
 mmnfTpOS1MGPjw0Hj9UWr3DhfAwMonbZrCicnlIb9DAVTwqc8Fon5hlbH
 MJzYcpiBL1IJPxMTh9lb5jmQepkV6Q9e/Su2ejJ7XwH9MSFzmzxsJhDnV
 INCOmw574Rls08nZKxIuAC+krJvBx94D6bYM7SOuWDu9oLmNm4Nucjce1
 BCSQTNR6pAFcr10cVXEvVF/iKOLNRr1vHnPh+xQvOcaq+DGSH4W+W/V12 w==;
X-CSE-ConnectionGUID: 4jGAjOqNSveTb/fKStq0Ew==
X-CSE-MsgGUID: wn+/V8qiQlKxEQtf14+Jiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="37506913"
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; d="scan'208";a="37506913"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 01:18:26 -0700
X-CSE-ConnectionGUID: gCj7R6zKT8uaFnHpxj7pxA==
X-CSE-MsgGUID: YOvDNPOATUev5rI2xCHnGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; d="scan'208";a="102170664"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 01:18:20 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Karol Wachowski <karol.wachowski@intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH 08/29] accel/ivpu: Turn on autosuspend on Simics
Date: Tue, 24 Sep 2024 10:17:33 +0200
Message-ID: <20240924081754.209728-9-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240924081754.209728-1-jacek.lawrynowicz@linux.intel.com>
References: <20240924081754.209728-1-jacek.lawrynowicz@linux.intel.com>
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

From: Karol Wachowski <karol.wachowski@intel.com>

With recent Simics update DVFS flows using cdyn were fixed
and it is possible to enable D0i3/D3 entry flows on autosuspend.
Set autosuspend timeout to 100 ms by default on Simics.

Signed-off-by: Karol Wachowski <karol.wachowski@intel.com>
Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_hw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/ivpu/ivpu_hw.c b/drivers/accel/ivpu/ivpu_hw.c
index 85219e9596215..1c259d7178151 100644
--- a/drivers/accel/ivpu/ivpu_hw.c
+++ b/drivers/accel/ivpu/ivpu_hw.c
@@ -94,7 +94,7 @@ static void timeouts_init(struct ivpu_device *vdev)
 		vdev->timeout.boot = 50;
 		vdev->timeout.jsm = 500;
 		vdev->timeout.tdr = 10000;
-		vdev->timeout.autosuspend = -1;
+		vdev->timeout.autosuspend = 100;
 		vdev->timeout.d0i3_entry_msg = 100;
 		vdev->timeout.state_dump_msg = 10;
 	} else {
-- 
2.45.1

