Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C69439B7C67
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2024 15:07:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26E1510E8A3;
	Thu, 31 Oct 2024 14:07:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="amrSdQ4v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com
 [95.215.58.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6843810E8A3
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 14:07:48 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1730383666;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=BoHAg1qZYHX6lePa8/xhJEWiDV/Xqyk+i/wwaWiTk98=;
 b=amrSdQ4vTWalw+ipnhMrH/fVousg6iNhB05fsg39QegkSui6545BLh9vUwtK+k8sBCSTOT
 Z7sIxb+NHD8Fd6/qVZ9GL5ifUyKe4VabUXMdB2YR/8+GfeheTtN3poEoDSgYcf6T4AhrjL
 yJQQ5tgRpk0WpxDORQYC19ZmE3lgmbc=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: [PATCH] drm/prime: drm_prime_sg_to_dma_addr_array(): Return -EINVAL
 on error
Date: Thu, 31 Oct 2024 22:07:30 +0800
Message-Id: <20241031140730.2406181-1-sui.jingfeng@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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

'-EINVAL' stands for invalid argument, while '-1' will accidently be
interpreted as '-EPERM' by the potential upper caller. Which does not
describe the error case accurately, since such an error can happens when
the caller pass a smaller number than actually needed size to describe
the array passed-in. Such an error is invalid argument.

Take drm/vmwgfx driver as an example, the function call trace is:

|- ttm_bo_vmap()
|-- ttm_tt_populate()
|--- bdev->funcs->ttm_tt_populate()
|----- vmw_ttm_populate()
|------ drm_prime_sg_to_dma_addr_array()

While ttm_bo_vmap() requires its callees return '-EINVAL' on invalid range,
similier for other users or call path. Let's meet the requirement.

Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
---
 drivers/gpu/drm/drm_prime.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index 0e3f8adf162f..3f1d516a90b6 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -1055,7 +1055,7 @@ int drm_prime_sg_to_dma_addr_array(struct sg_table *sgt, dma_addr_t *addrs,
 
 	for_each_sgtable_dma_page(sgt, &dma_iter, 0) {
 		if (WARN_ON(a - addrs >= max_entries))
-			return -1;
+			return -EINVAL;
 		*a++ = sg_page_iter_dma_address(&dma_iter);
 	}
 	return 0;
-- 
2.34.1

