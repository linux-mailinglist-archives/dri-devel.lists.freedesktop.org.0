Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C17592547B
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 09:16:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A81A110E73A;
	Wed,  3 Jul 2024 07:16:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="J3G/RfIi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C899110E740
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2024 07:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1719991003;
 bh=LlasGOACBCUkCfSTLymfC9SZFaLG3kaZjZMuAzVlcbE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=J3G/RfIi73rQ5r+jnIYPIsnsZMnPvSNIU8MMdlvLwx7IIMDM8CJ1+LtgGcPtHrmea
 qnkFeT0a6kBpohHnUVmvgaHcmnXmGwCv/8QjzQV5rhMxbqjNs/3rPdMeNCRSzZ/OgG
 9xBleiSEPL1Cmpz5DbPLPFJfxTPaUtCspEb5UpGrCds5zlg/9l4HdiS8+UGvJyIf6o
 fvXG64Jo4Z+OILXQrII9wNG62Esp0q5HVnXVY7xsOr/5pYM9QF2ht76RWGnHfqv9Fg
 UYuxeq08P89L6frHpmCKvJAsNv2Gy2TVryRCuIUpytGnUyqc4ta2QbNoQD6l6U3Xmj
 IzTZm/n/kDPWQ==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 1BDC53781188;
 Wed,  3 Jul 2024 07:16:43 +0000 (UTC)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org,
	kernel@collabora.com
Subject: [PATCH v2 1/2] drm/panthor: Don't check the array stride on empty
 uobj arrays
Date: Wed,  3 Jul 2024 09:16:39 +0200
Message-ID: <20240703071640.231278-2-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240703071640.231278-1-boris.brezillon@collabora.com>
References: <20240703071640.231278-1-boris.brezillon@collabora.com>
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

The user is likely to leave all the drm_panthor_obj_array fields
to zero when the array is empty, which will cause an EINVAL failure.

v2:
- Added R-bs

Fixes: 4bdca1150792 ("drm/panthor: Add the driver frontend block")
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
Reviewed-by: Steven Price <steven.price@arm.com>
---
 drivers/gpu/drm/panthor/panthor_drv.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index b8a84f26b3ef..b5e7b919f241 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -86,15 +86,15 @@ panthor_get_uobj_array(const struct drm_panthor_obj_array *in, u32 min_stride,
 	int ret = 0;
 	void *out_alloc;
 
+	if (!in->count)
+		return NULL;
+
 	/* User stride must be at least the minimum object size, otherwise it might
 	 * lack useful information.
 	 */
 	if (in->stride < min_stride)
 		return ERR_PTR(-EINVAL);
 
-	if (!in->count)
-		return NULL;
-
 	out_alloc = kvmalloc_array(in->count, obj_size, GFP_KERNEL);
 	if (!out_alloc)
 		return ERR_PTR(-ENOMEM);
-- 
2.45.0

