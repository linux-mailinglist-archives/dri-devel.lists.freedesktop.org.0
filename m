Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF270C0ED48
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 16:11:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A28310E174;
	Mon, 27 Oct 2025 15:11:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TM7+SofF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F91F10E174
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 15:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761577901; x=1793113901;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QJz8FJkL0iuiAmMKaq0WyF2CSp64IIzUc7ZrUImHRVo=;
 b=TM7+SofF9PsMem2C2HxRlBgn0EmvJlv9CN3vSOykpAoF/UoTNAA5T5nV
 ADHNfJrKSajEgCT62pLWQbXDsLMGCcaDPJraBc3zIm/dXTCLo81TKv02H
 5O9tweP1bvzQ3+lDgGwSsTRqTaH7wLWzP/E6FrLHhBVjV37Snx10jUeoc
 fvkfaYub0uz9lRUWy6prSaseX74QU/eorTUGtzzPr+Etpu616EYw5GqUw
 HbTCDnMgHXf/PTRIMBUezi9bAkkI0gykjMNryd6nNCFqAHm4KHvM2w2Au
 5jL2ttPHHlsDQGfXZ/TO8DtX995WsVUFvNMna+RoeYmx/VgG/IQNdLZan w==;
X-CSE-ConnectionGUID: wZcr3Z2URpavlE43Untcvw==
X-CSE-MsgGUID: /qrEUFOMTBerCXhaFXtpUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="81084944"
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="81084944"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 08:11:41 -0700
X-CSE-ConnectionGUID: 9LufM24HS5+QZmnNGsnIxg==
X-CSE-MsgGUID: 0iicB+fHRhC+hx9vWdSecw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="215958792"
Received: from try2-8594.igk.intel.com ([10.91.220.58])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 08:11:39 -0700
From: Maciej Falkowski <maciej.falkowski@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, jeff.hugo@oss.qualcomm.com,
 karol.wachowski@linux.intel.com, lizhi.hou@amd.com,
 Maciej Falkowski <maciej.falkowski@linux.intel.com>
Subject: [PATCH] accel/ivpu: Remove skip of dma unmap for imported buffers
Date: Mon, 27 Oct 2025 16:09:32 +0100
Message-ID: <20251027150933.2384538-1-maciej.falkowski@linux.intel.com>
X-Mailer: git-send-email 2.43.0
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

Rework of imported buffers introduced in the commit
e0c0891cd63b ("accel/ivpu: Rework bind/unbind of imported buffers")
switched the logic of imported buffers by dma mapping/unmaping
them just as the regular buffers.

The commit didn't include removal of skipping dma unmap of imported
buffers which results in them being mapped without unmapping.

Fixes: e0c0891cd63b ("accel/ivpu: Rework bind/unbind of imported buffers")
Signed-off-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_gem.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_gem.c b/drivers/accel/ivpu/ivpu_gem.c
index e7277e02840a..2a159535421a 100644
--- a/drivers/accel/ivpu/ivpu_gem.c
+++ b/drivers/accel/ivpu/ivpu_gem.c
@@ -158,9 +158,6 @@ static void ivpu_bo_unbind_locked(struct ivpu_bo *bo)
 		bo->ctx = NULL;
 	}
 
-	if (drm_gem_is_imported(&bo->base.base))
-		return;
-
 	if (bo->base.sgt) {
 		if (bo->base.base.import_attach) {
 			dma_buf_unmap_attachment(bo->base.base.import_attach,
-- 
2.43.0

