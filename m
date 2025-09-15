Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB0A7B5715D
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 09:25:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F51210E330;
	Mon, 15 Sep 2025 07:25:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EUO8t0WK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED5AA10E2DD;
 Mon, 15 Sep 2025 07:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757921146; x=1789457146;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UBi7c9dYY9BO0ijTtlBFW5yLK0GWUvaK+54xFjgqXmc=;
 b=EUO8t0WKVNBfjWl1l6iPzeMNBavtxqRlmQbmy68mqw1sinWXf9lmzQJO
 zjn/j23Cfqw71CSkH9jolqUR2VasJA17Gw82AeS4F284fjwLrq3OFQDJ/
 1pF9PYFVz6hHMQ0o4gkKR5ngEqRjxCuqy/Th6JdaHe9kj14wPNQkEU2jb
 8W0PRgppDWU77PdrQRZffHhLKfnRVtuj/zrUpczPOUGMl3cOk9u6ou/1J
 t9HmpXqSvfhTcpD/sNL1fiYJ/84DmoJHXA54oRqsb9lmO9a0dyrvvrdNh
 P3YsR2RFKW+gxPw+hvfdP0Zjvu4Uvatnw5gSSInORQLZSUPnDckIzI+++ Q==;
X-CSE-ConnectionGUID: N1q33YwRT++nIhN3T/5Hsg==
X-CSE-MsgGUID: /Gsw4DQrTXueYLsPkTXT2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11553"; a="77619123"
X-IronPort-AV: E=Sophos;i="6.18,265,1751266800"; d="scan'208";a="77619123"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 00:25:46 -0700
X-CSE-ConnectionGUID: q9MNMXCBSg6MgNfUUyJxoA==
X-CSE-MsgGUID: 0MlcyDzoRAOW97IP2dtLQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,265,1751266800"; d="scan'208";a="211693869"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.132])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 00:25:46 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: [PATCH v4 2/5] drm/xe/dmabuf: Don't migrate BO to System RAM if P2P
 check succeeds
Date: Mon, 15 Sep 2025 00:21:06 -0700
Message-ID: <20250915072428.1712837-3-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250915072428.1712837-1-vivek.kasireddy@intel.com>
References: <20250915072428.1712837-1-vivek.kasireddy@intel.com>
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

If the P2P test (i.e, pci_p2pdma_distance()) is successful, then it
means that the importer can directly access the BO located in VRAM.
Therefore, in this specific case, do not migrate the BO to System
RAM before exporting it.

Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 drivers/gpu/drm/xe/xe_dma_buf.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
index a7d67725c3ee..04082e3e4295 100644
--- a/drivers/gpu/drm/xe/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/xe_dma_buf.c
@@ -52,7 +52,7 @@ static int xe_dma_buf_pin(struct dma_buf_attachment *attach)
 	struct xe_bo *bo = gem_to_xe_bo(obj);
 	struct xe_device *xe = xe_bo_device(bo);
 	struct drm_exec *exec = XE_VALIDATION_UNSUPPORTED;
-	int ret;
+	int ret = 0;
 
 	/*
 	 * For now only support pinning in TT memory, for two reasons:
@@ -64,7 +64,8 @@ static int xe_dma_buf_pin(struct dma_buf_attachment *attach)
 		return -EINVAL;
 	}
 
-	ret = xe_bo_migrate(bo, XE_PL_TT, NULL, exec);
+	if (!attach->peer2peer)
+		ret = xe_bo_migrate(bo, XE_PL_TT, NULL, exec);
 	if (ret) {
 		if (ret != -EINTR && ret != -ERESTARTSYS)
 			drm_dbg(&xe->drm,
-- 
2.50.1

