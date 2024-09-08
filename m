Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9457970737
	for <lists+dri-devel@lfdr.de>; Sun,  8 Sep 2024 14:11:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46F0110E216;
	Sun,  8 Sep 2024 12:11:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="pNKQaUaz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com
 [95.215.58.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A1FA10E216
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Sep 2024 12:11:22 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1725797480;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=rwOczaLe6uqVz6NheSsaNQI0Fd3X29dHQQcS+05QMqQ=;
 b=pNKQaUazGNurQItNPSWv4e9eEwRRPv4VB2HsJ3KsVxnp3CDNgcdTE33dD2igl+NH70kTM6
 VbD3oplLpnhltl4TuCMmy0uCMcm6N3fOR0wafZOk4dSIktyEqpsgoJVUyAHC1IJRvKLSrO
 jYFb90Bgjnv4UVPpOy5GC3a2tPKjn24=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Lucas Stach <l.stach@pengutronix.de>
Cc: Christian Gmeiner <christian.gmeiner@gmail.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Sui Jingfeng <sui.jingfeng@linux.dev>,
 Christian Gmeiner <cgmeiner@igalia.com>
Subject: [PATCH v2 1/5] drm/etnaviv: Use unsigned type to count the number of
 pages
Date: Sun,  8 Sep 2024 20:11:03 +0800
Message-ID: <20240908121107.328740-1-sui.jingfeng@linux.dev>
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

The drm_prime_pages_to_sg() function takes an 'unsigned int' argument to
store the length of the page vector. The size of the object in number of
CPU pages can not be negative, hence, use 'unsigned' variable to store
the number of pages, instead of the 'signed' one.

Reviewed-by: Christian Gmeiner <cgmeiner@igalia.com>
Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
---

v2: Pick up tags and improve commit message

 drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
index 3524b5811682..6b98200068e4 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
@@ -17,7 +17,7 @@ static struct lock_class_key etnaviv_prime_lock_class;
 struct sg_table *etnaviv_gem_prime_get_sg_table(struct drm_gem_object *obj)
 {
 	struct etnaviv_gem_object *etnaviv_obj = to_etnaviv_bo(obj);
-	int npages = obj->size >> PAGE_SHIFT;
+	unsigned int npages = obj->size >> PAGE_SHIFT;
 
 	if (WARN_ON(!etnaviv_obj->pages))  /* should have already pinned! */
 		return ERR_PTR(-EINVAL);
-- 
2.43.0

