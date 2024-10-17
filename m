Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAFDD9A25C5
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2024 16:58:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39E5110E856;
	Thu, 17 Oct 2024 14:58:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UuE+rrKY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF4C610E853
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2024 14:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729177109; x=1760713109;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XW3vxP1e/TXsOeUZVHwT94XXLN5nyK0OxcFO+oDcMZE=;
 b=UuE+rrKYU9g5p/e1q62FGWYEZ1SaihpzKoGIIknYLf7ioQThbHEdyMgm
 q+LkJE/UY3jBW5o1N17zZrt6dhc+5y3Jn8IKQWp9BRYrUpmlORUmWgn4C
 N/LmyCAit9WGP13ANuSle5mibm+CoEnv4/aoYGbWbBDROrKXovZcLW3nb
 1JxGNmKIiNiSV9TBpl80bIeyNews8cXU8D/gDL4yJoD34KTCiw+aa2PcW
 WqGOeG/86abxnL0hTrP9KGhvudchSXLRJk4uosAKi4+MXicSyuRe8j57s
 0LfORdM3aewhXStOY8qUc4wMO6gBKyPBvoruWBPErLhkodTeoqPDEB7qj g==;
X-CSE-ConnectionGUID: 54ahBAmRTda7HqtF7GI/vQ==
X-CSE-MsgGUID: 1Rxk8AnhTIy4KwBjVl1v+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="39790332"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="39790332"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 07:58:28 -0700
X-CSE-ConnectionGUID: mJ2mxUHUT+SCMZFUbdEglQ==
X-CSE-MsgGUID: A1ku2PU6R9+C0RMRa/OosA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,211,1725346800"; d="scan'208";a="109374511"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 07:58:27 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Karol Wachowski <karol.wachowski@intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH 04/11] accel/ivpu: Clear CDTAB entry in case of failure
Date: Thu, 17 Oct 2024 16:58:10 +0200
Message-ID: <20241017145817.121590-5-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20241017145817.121590-1-jacek.lawrynowicz@linux.intel.com>
References: <20241017145817.121590-1-jacek.lawrynowicz@linux.intel.com>
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

Don't leave a context descriptor in case CFGI_ALL flush fails.
Mark it as invalid (by clearing valid bit) so nothing is left in
partially-initialized state.

Signed-off-by: Karol Wachowski <karol.wachowski@intel.com>
Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_mmu.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/accel/ivpu/ivpu_mmu.c b/drivers/accel/ivpu/ivpu_mmu.c
index 4ff0d7a519859..26ef52fbb93e5 100644
--- a/drivers/accel/ivpu/ivpu_mmu.c
+++ b/drivers/accel/ivpu/ivpu_mmu.c
@@ -749,10 +749,17 @@ static int ivpu_mmu_cdtab_entry_set(struct ivpu_device *vdev, u32 ssid, u64 cd_d
 
 	ret = ivpu_mmu_cmdq_write_cfgi_all(vdev);
 	if (ret)
-		goto unlock;
+		goto err_invalidate;
 
 	ret = ivpu_mmu_cmdq_sync(vdev);
+	if (ret)
+		goto err_invalidate;
 unlock:
+	mutex_unlock(&mmu->lock);
+	return 0;
+
+err_invalidate:
+	WRITE_ONCE(entry[0], 0);
 	mutex_unlock(&mmu->lock);
 	return ret;
 }
-- 
2.45.1

