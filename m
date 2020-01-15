Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2DF413BEE5
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2020 12:54:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4C456E935;
	Wed, 15 Jan 2020 11:53:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa2.bahnhof.se (ste-pvt-msa2.bahnhof.se
 [213.80.101.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DCDF6E92B
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2020 11:53:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 96FE63F67D;
 Wed, 15 Jan 2020 12:53:50 +0100 (CET)
Authentication-Results: ste-pvt-msa2.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=qbJnIih1; 
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Authentication-Results: ste-ftg-msa2.bahnhof.se (amavisd-new);
 dkim=pass (1024-bit key) header.d=shipmail.org
Received: from ste-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (ste-ftg-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P146xDotj2SF; Wed, 15 Jan 2020 12:53:46 +0100 (CET)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 554E73F61C;
 Wed, 15 Jan 2020 12:53:45 +0100 (CET)
Received: from localhost.localdomain.localdomain
 (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id B8870360384;
 Wed, 15 Jan 2020 12:53:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1579089225; bh=orCr7nX/YNEAf+v9ai/+2eKsC2ro5pkPAwokX/4NtRo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qbJnIih1TFozftXY8vOM+xVCF0JiPpwac7dUwUbyWxGUhScFej9hlSHJ3nu+lQam/
 bUXErv1j5CDbmz2nnLiesf6Va9kTwxs/ALOFBIGRuxwmwiCskjqBcnUz5aFBH8sba3
 VACVDGYhhx5fij7t4LBUcgnqBkJ1UFsfGVQNWumE=
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m=20=28VMware=29?=
 <thomas_os@shipmail.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 5/9] drm/vmwgfx: check master authentication in surface_ref
 ioctls
Date: Wed, 15 Jan 2020 12:53:25 +0100
Message-Id: <20200115115329.2836-5-thomas_os@shipmail.org>
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

With later commit we'll rework DRM authentication handling. Namely
DRM_AUTH will not be a requirement for DRM_RENDER_ALLOW ioctls.

Since vmwgfx does isolation for primary clients in different master
realms, the DRM_AUTH can be dropped.

The only place where authentication matters, is surface_reference ioctls
whenever a legacy (non-prime) handle is used. For those ioctls we call
vmw_surface_handle_reference(), where we explicitly check if the client
is both a) master and b) unauthenticated - bailing out as result.

Otherwise the usual isolation path kicks in and we're all good.

v2: Reword commit message, since the isolation work has landed.

Cc: VMware Graphics <linux-graphics-maintainer@vmware.com>
Cc: Thomas Hellstrom <thellstrom@vmware.com>
Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
Reviewed-by: Thomas Hellstrom <thellstrom@vmware.com>
Signed-off-by: Thomas Hellstrom <thellstrom@vmware.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
index 590bde993946..3ce630aa4fde 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
@@ -961,6 +961,13 @@ vmw_surface_handle_reference(struct vmw_private *dev_priv,
 		user_srf = container_of(base, struct vmw_user_surface,
 					prime.base);
 
+		/* Error out if we are unauthenticated primary */
+		if (drm_is_primary_client(file_priv) &&
+		    !file_priv->authenticated) {
+			ret = -EACCES;
+			goto out_bad_resource;
+		}
+
 		/*
 		 * Make sure the surface creator has the same
 		 * authenticating master, or is already registered with us.
-- 
2.21.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
