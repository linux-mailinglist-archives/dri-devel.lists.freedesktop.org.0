Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CBA613BEE6
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2020 12:54:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79DD56E937;
	Wed, 15 Jan 2020 11:54:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa1.bahnhof.se (pio-pvt-msa1.bahnhof.se [79.136.2.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E6D96E92F
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2020 11:53:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 3B1373F69E;
 Wed, 15 Jan 2020 12:53:49 +0100 (CET)
Authentication-Results: pio-pvt-msa1.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b="Rrir3SEz";
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Received: from pio-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0_i6LRVn0aRx; Wed, 15 Jan 2020 12:53:46 +0100 (CET)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 29F203F419;
 Wed, 15 Jan 2020 12:53:45 +0100 (CET)
Received: from localhost.localdomain.localdomain
 (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id A3ADB360366;
 Wed, 15 Jan 2020 12:53:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1579089225; bh=jPZdUruSGhPn5rIxHPutw8MLjOL9ecLV06ysBXvb8oo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Rrir3SEzrLBKsl9pb/fDqrCI7uwD0Bru6vPDUr+JCPo/pEykMfs2Z8GH71wt5IR/q
 sRx9mYT3UY73lEEwtFZfphO5chjvrY7+kIo/g9BEpR/6O7r7s4FZospsYHOPTkKMTu
 jnNZQK899b/i8DbH/zQ+uM8ZaDmrez6DAe0zuxTM=
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m=20=28VMware=29?=
 <thomas_os@shipmail.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/9] drm/vmwgfx: move the require_exist handling together
Date: Wed, 15 Jan 2020 12:53:24 +0100
Message-Id: <20200115115329.2836-4-thomas_os@shipmail.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200115115329.2836-1-thomas_os@shipmail.org>
References: <20200115115329.2836-1-thomas_os@shipmail.org>
MIME-Version: 1.0
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>,
 linux-graphics-maintainer@vmware.com,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Emil Velikov <emil.velikov@collabora.com>

Move the render_client hunk for require_exist alongside the rest.
Keeping all the reasons why an existing object is needed, in a single
place makes it easier to follow.

Cc: VMware Graphics <linux-graphics-maintainer@vmware.com>
Cc: Thomas Hellstrom <thellstrom@vmware.com>
Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
Reviewed-by: Thomas Hellstrom <thellstrom@vmware.com>
Signed-off-by: Thomas Hellstrom <thellstrom@vmware.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
index 32b9131b2bae..590bde993946 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
@@ -934,16 +934,12 @@ vmw_surface_handle_reference(struct vmw_private *dev_priv,
 	uint32_t handle;
 	struct ttm_base_object *base;
 	int ret;
-	bool require_exist = false;
 
 	if (handle_type == DRM_VMW_HANDLE_PRIME) {
 		ret = ttm_prime_fd_to_handle(tfile, u_handle, &handle);
 		if (unlikely(ret != 0))
 			return ret;
 	} else {
-		if (unlikely(drm_is_render_client(file_priv)))
-			require_exist = true;
-
 		handle = u_handle;
 	}
 
@@ -960,6 +956,8 @@ vmw_surface_handle_reference(struct vmw_private *dev_priv,
 	}
 
 	if (handle_type != DRM_VMW_HANDLE_PRIME) {
+		bool require_exist = false;
+
 		user_srf = container_of(base, struct vmw_user_surface,
 					prime.base);
 
@@ -971,6 +969,9 @@ vmw_surface_handle_reference(struct vmw_private *dev_priv,
 		    user_srf->master != file_priv->master)
 			require_exist = true;
 
+		if (unlikely(drm_is_render_client(file_priv)))
+			require_exist = true;
+
 		ret = ttm_ref_object_add(tfile, base, TTM_REF_USAGE, NULL,
 					 require_exist);
 		if (unlikely(ret != 0)) {
-- 
2.21.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
