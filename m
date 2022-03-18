Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B6EF4DE1F3
	for <lists+dri-devel@lfdr.de>; Fri, 18 Mar 2022 20:50:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 050F810E28B;
	Fri, 18 Mar 2022 19:50:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5419110E297
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Mar 2022 19:50:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: bbeckett) with ESMTPSA id 9A2AE1F45B08
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647633030;
 bh=9bigV/sYB4FUqshAYJdxs+cHARVqE00dOiOAg3Egs9Y=;
 h=From:To:Cc:Subject:Date:From;
 b=gDqPOrSjJ86k3/PKnd8PPM1RMLwNcZ91aYkmOXXsSFBIn8gTvQ/FZXK08Katx/ZiZ
 I8O3uG04Kq3RwGkO2127RrkM5BKVP+aiLSBRF1dneFE5QTaZi7yoOEkkviTJ9vLrSz
 7qHjX7+sDOKZz7JLeqodv+QtFd/kTxMQ3s9aHnOv4xJoH7/FdA0qzwmlf0CipF3zcB
 uv64JtT1fhiJUGvraQaRCDlgfhio7TD2iX6Zg1jrd3TqVQZKxJQuMwibHnvQC3CWlC
 DE0qHvObvxA1dcS4sL96zUgi6JgoKE1EUEwjhDFT6+TomJpFjbd0L0kdTXNO3L46df
 edaJbSf6GkoHg==
From: Robert Beckett <bob.beckett@collabora.com>
To: dri-devel@lists.freedesktop.org,
 Christian Koenig <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH] drm/ttm: fix potential null ptr deref in when mem space alloc
 fails
Date: Fri, 18 Mar 2022 19:50:04 +0000
Message-Id: <20220318195004.416539-1-bob.beckett@collabora.com>
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
Cc: Robert Beckett <bob.beckett@collabora.com>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

when allocating a resource in place it is common to free the buffer's
resource, then allocate a new resource in a different placement.

e.g. amdgpu_bo_create_kernel_at calls ttm_resource_free, then calls
ttm_bo_mem_space.

In this situation, bo->resource will be null as it is cleared during
the initial freeing of the previous resource.
This leads to a null deref.

Fixes: d3116756a710 (drm/ttm: rename bo->mem and make it a pointer)

Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index db3dc7ef5382..62b29ee7d040 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -875,7 +875,7 @@ int ttm_bo_mem_space(struct ttm_buffer_object *bo,
 	}
 
 error:
-	if (bo->resource->mem_type == TTM_PL_SYSTEM && !bo->pin_count)
+	if (bo->resource && bo->resource->mem_type == TTM_PL_SYSTEM && !bo->pin_count)
 		ttm_bo_move_to_lru_tail_unlocked(bo);
 
 	return ret;
-- 
2.25.1

