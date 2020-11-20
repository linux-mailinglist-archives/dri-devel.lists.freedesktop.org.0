Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D7D2BBEB1
	for <lists+dri-devel@lfdr.de>; Sat, 21 Nov 2020 12:35:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF4746E9AB;
	Sat, 21 Nov 2020 11:34:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 392 seconds by postgrey-1.36 at gabe;
 Fri, 20 Nov 2020 15:30:29 UTC
Received: from pet8032.tnsp.org (tnsp.org
 [IPv6:2a04:3540:1000:310:f095:b5ff:fe23:3d0e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00FA46E8C9;
 Fri, 20 Nov 2020 15:30:29 +0000 (UTC)
Received: from nmos6502.tnsp.org (91-158-253-65.elisa-laajakaista.fi
 [91.158.253.65])
 by pet8032.tnsp.org (Postfix) with ESMTPSA id 21D0C196A72;
 Fri, 20 Nov 2020 17:23:51 +0200 (EET)
From: Matti Hamalainen <ccr@tnsp.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drm/nouveau: fix relocations applying logic and a double-free
Date: Fri, 20 Nov 2020 17:23:38 +0200
Message-Id: <20201120152338.1203257-1-ccr@tnsp.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 21 Nov 2020 11:34:30 +0000
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Ben Skeggs <bskeggs@redhat.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit 03e0d26fcf79 ("drm/nouveau: slowpath for pushbuf ioctl") included
a logic-bug which results in the relocations not actually getting
applied at all as the call to nouveau_gem_pushbuf_reloc_apply() is
never reached. This causes a regression with graphical corruption,
triggered when relocations need to be done (for example after a
suspend/resume cycle.)

Fix by setting *apply_relocs value only if there were more than 0
relocations.

Additionally, the never reached code had a leftover u_free() call,
which, after fixing the logic, now got called and resulted in a
double-free. Fix by removing one u_free(), moving the other
and adding check for errors.

Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: nouveau@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Matti Hamalainen <ccr@tnsp.org>
Fixes: 03e0d26fcf79 ("drm/nouveau: slowpath for pushbuf ioctl")
Link: https://gitlab.freedesktop.org/drm/nouveau/-/issues/11
---
 drivers/gpu/drm/nouveau/nouveau_gem.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index 549bc67feabb..c2051380d18c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -558,8 +558,10 @@ nouveau_gem_pushbuf_validate(struct nouveau_channel *chan,
 			NV_PRINTK(err, cli, "validating bo list\n");
 		validate_fini(op, chan, NULL, NULL);
 		return ret;
+	} else if (ret > 0) {
+		*apply_relocs = true;
 	}
-	*apply_relocs = ret;
+
 	return 0;
 }
 
@@ -662,7 +664,6 @@ nouveau_gem_pushbuf_reloc_apply(struct nouveau_cli *cli,
 		nouveau_bo_wr32(nvbo, r->reloc_bo_offset >> 2, data);
 	}
 
-	u_free(reloc);
 	return ret;
 }
 
@@ -872,9 +873,10 @@ nouveau_gem_ioctl_pushbuf(struct drm_device *dev, void *data,
 				break;
 			}
 		}
-		u_free(reloc);
 	}
 out_prevalid:
+	if (!IS_ERR(reloc))
+		u_free(reloc);
 	u_free(bo);
 	u_free(push);
 

base-commit: 3494d58865ad4a47611dbb427b214cc5227fa5eb
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
