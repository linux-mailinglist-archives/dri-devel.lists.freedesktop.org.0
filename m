Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7548CA8BB
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 09:18:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9636896EC;
	Tue, 21 May 2024 07:17:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jneGhiYt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA92B89664;
 Tue, 21 May 2024 07:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716275858; x=1747811858;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=j9zgurAplBD1uVfXbOgyajlrNiNlrRH5yjRE3Se1bpo=;
 b=jneGhiYtEm679bSKUTiSD7i3pKnmzJDSLmSaxJZ3HgnxI0/RA9nXkkXg
 FY21T0pmAA/aFF2XSfwag337t7f4ZHGwchuVuzB2wkFpajG+BOPB5OS85
 +rEIuMOPFFIzgKTdDifStDpaz6jYwMtwggC1RFngAq0lDfLyUGJrB3iFr
 91y/pBiK32ErlTELJws9lBqx8hk0gbYLEq94BW8DWsgLfZ74PyQR8uo/x
 Ku3MvehvndKN1bbV/2ekw5Uz3LS0oXxUv+4SwAHE2iXu0Qi72u4KmSbBX
 nreWQ4XPOKQe7N3cIhKbXoW5HkLe1CZ7qYqP/Tg0d4PGOwL3tbPepigBm g==;
X-CSE-ConnectionGUID: V1GkYznlT9ygXrhBT9/7KA==
X-CSE-MsgGUID: oQ7Gn+71TUWavk2ZUOpK/Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="15393513"
X-IronPort-AV: E=Sophos;i="6.08,177,1712646000"; d="scan'208";a="15393513"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 00:17:37 -0700
X-CSE-ConnectionGUID: wvH0pGMmTv6jejI7tGOHEA==
X-CSE-MsgGUID: cIC/Vve2TEmZEY3nG5d8Hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,177,1712646000"; d="scan'208";a="37336833"
Received: from unknown (HELO fedora..) ([10.245.246.159])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 00:17:36 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org
Subject: [RFC PATCH v3 20/21] drm/ttm: Use drm_exec_trylock for bo
 initialization
Date: Tue, 21 May 2024 09:16:38 +0200
Message-ID: <20240521071639.77614-21-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240521071639.77614-1-thomas.hellstrom@linux.intel.com>
References: <20240521071639.77614-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Buffer object initialization may be part of a drm_exec transaction.
Rather than using dma_resv_trylock, use drm_exec_trylock_obj().

RFC: This patch indicates to me that we should avoid the -ENOMEM failure
for drm_exec_trylock, Could probably use a sleeping lock here without
problems.

Cc: Christian König <christian.koenig@amd.com>
Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: <dri-devel@lists.freedesktop.org>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 8706502edcb1..70af66b5b86e 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -942,10 +942,17 @@ int ttm_bo_init_reserved(struct ttm_device *bdev, struct ttm_buffer_object *bo,
 	/* passed reservation objects should already be locked,
 	 * since otherwise lockdep will be angered in radeon.
 	 */
-	if (!resv)
-		WARN_ON(!dma_resv_trylock(bo->base.resv));
-	else
+	if (!resv) {
+		if (ctx->exec) {
+			ret = drm_exec_trylock_obj(ctx->exec, &bo->base);
+			if (ret)
+				goto err_put;
+		} else {
+			WARN_ON(!dma_resv_trylock(bo->base.resv));
+		}
+	} else {
 		dma_resv_assert_held(resv);
+	}
 
 	ret = ttm_bo_validate(bo, placement, ctx);
 	if (unlikely(ret))
@@ -954,8 +961,12 @@ int ttm_bo_init_reserved(struct ttm_device *bdev, struct ttm_buffer_object *bo,
 	return 0;
 
 err_unlock:
-	if (!resv)
-		dma_resv_unlock(bo->base.resv);
+	if (!resv) {
+		if (ctx->exec)
+			drm_exec_unlock_obj(ctx->exec, &bo->base);
+		else
+			dma_resv_unlock(bo->base.resv);
+	}
 
 err_put:
 	ttm_bo_put(bo);
-- 
2.44.0

