Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD362C9B17
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 10:13:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D44986E4CA;
	Tue,  1 Dec 2020 09:13:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C5C86E4B5;
 Tue,  1 Dec 2020 09:13:13 +0000 (UTC)
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 90377206C1;
 Tue,  1 Dec 2020 09:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1606813993;
 bh=a111Ub7wJNe9C9uVfTfFjTXMxlnuhYLlxNKkpR259Is=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FrCN5FuJEJyhiD1h6U0k4ABEtOgWuqSyVN76nM8+Zo4NqiynmAdFJ2bo1bk53LgXW
 266yYmWB1hxHzSizLlbsyF1ndhJ24BTCPn+Ek5s23PsWCK9Z7kcNHdmk8SrcD/0ed8
 A+UvhCMu0fQOp9h0DSwiDAzlPUf8FzYdcs4a2N2E=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 5.9 129/152] drm/nouveau: fix relocations applying logic and a
 double-free
Date: Tue,  1 Dec 2020 09:54:04 +0100
Message-Id: <20201201084728.710890565@linuxfoundation.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201201084711.707195422@linuxfoundation.org>
References: <20201201084711.707195422@linuxfoundation.org>
User-Agent: quilt/0.66
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
Cc: Sasha Levin <sashal@kernel.org>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Matti Hamalainen <ccr@tnsp.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Ben Skeggs <bskeggs@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Matti Hamalainen <ccr@tnsp.org>

[ Upstream commit 2be65641642ef423f82162c3a5f28c754d1637d2 ]

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
Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Link: https://patchwork.freedesktop.org/patch/msgid/20201120152338.1203257-1-ccr@tnsp.org
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/nouveau/nouveau_gem.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index 124d3dcc5c590..98e99aa8a547e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -570,8 +570,10 @@ nouveau_gem_pushbuf_validate(struct nouveau_channel *chan,
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
 
@@ -674,7 +676,6 @@ nouveau_gem_pushbuf_reloc_apply(struct nouveau_cli *cli,
 		nouveau_bo_wr32(nvbo, r->reloc_bo_offset >> 2, data);
 	}
 
-	u_free(reloc);
 	return ret;
 }
 
@@ -884,9 +885,10 @@ out:
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
 
-- 
2.27.0



_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
