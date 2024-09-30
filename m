Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9756B98AD6C
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 21:53:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E238F10E583;
	Mon, 30 Sep 2024 19:53:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eTMzPiCD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70C0D10E2FB
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 19:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727726022; x=1759262022;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+c3IOdKzPpILZADDj4+JVdb3P/8ByAxGDPJhXSvKZjM=;
 b=eTMzPiCD98srVJM0GGXoKOZ7YWPO2FLaW14KE3iSxDjf3YhMeld0Sc4T
 NYhehiwBkhc2Z+5R9a9Wq8B3Q+pnwEpx1ONKegj53dQEnJNDnCFrvy9AD
 iiRkJmQwBUdRusj1rA2v1yhECLZQ+85sip7SToXFmXe7B5ZsM9MGD1bPD
 eALw80sIKsSxJWm4mMWSevjCV1+EXlH1MgvUQ8u1a2FKeeGCcioRpyAWP
 ie23VhIvIW6nll8ILEHp28mFQb32GFHVMb5Urk+xx06dhrqKyBCWM6lcI
 d+VZCfughbk8n/pBTS1+MteubqIAlbPfriuZniWmKDywDp8oLOVWpE7cH A==;
X-CSE-ConnectionGUID: oYaaE6cNTamshTpVjykbNQ==
X-CSE-MsgGUID: a8zsNFOgSiyM1XARJ9HB+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="26962315"
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; d="scan'208";a="26962315"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 12:53:41 -0700
X-CSE-ConnectionGUID: K+h/RtzLT4qln2N7G2CnTA==
X-CSE-MsgGUID: X+SQE7Q2T4an3WQ3aMSHQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; d="scan'208";a="73370023"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 12:53:40 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Karol Wachowski <karol.wachowski@intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH v2 10/31] accel/ivpu: Turn on autosuspend on Simics
Date: Mon, 30 Sep 2024 21:53:01 +0200
Message-ID: <20240930195322.461209-11-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240930195322.461209-1-jacek.lawrynowicz@linux.intel.com>
References: <20240930195322.461209-1-jacek.lawrynowicz@linux.intel.com>
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
Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
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

