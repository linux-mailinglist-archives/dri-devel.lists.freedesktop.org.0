Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D4A75E024
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jul 2023 08:41:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2E4310E058;
	Sun, 23 Jul 2023 06:41:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp-29.smtpout.orange.fr
 [80.12.242.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77BFD10E058
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jul 2023 06:41:40 +0000 (UTC)
Received: from pop-os.home ([86.243.2.178]) by smtp.orange.fr with ESMTPA
 id NSmdq59F14DtINSmdqfFoy; Sun, 23 Jul 2023 08:41:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1690094498;
 bh=Q7o0UQvRfkS/4+Mc6nSPTzH0IapT9/fEsaA6pwimGA0=;
 h=From:To:Cc:Subject:Date;
 b=N/o86135ANjyjKGmokuS7xBDhOlV15gvy89zRuss8Qpd7KKHc/I4AvMRy0vHpTNPP
 CdHlSFsd+qtazyI5QGlhGEa7t2s+ezl1Wb0N6mE9oRHSoYuvUBlBdxTuuwctbFxR2A
 9Zk5/e8z356kbKZSdmRnh2veOy8ewV5V48lDUyg0xuZHjeRIA/sxilDnSt8F7xqOnf
 4DmDV+b4GJow+4SNILdEJP+Bla9fs59NxWl1NOK80l4LU2T6INRhrrsH+zD1gGPb4e
 3J3PTblIWoQEMzg6a8hURf62+DuwkL5YE/vJoHpuj+ZKimoSeJBJVwoZCInRtvdcx7
 t0prBJ/xef2wQ==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 23 Jul 2023 08:41:38 +0200
X-ME-IP: 86.243.2.178
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/msm: Slightly simplify memory allocation in
 submit_lookup_cmds()
Date: Sun, 23 Jul 2023 08:41:33 +0200
Message-Id: <9861e8b1ce385a556e0c9c4533beee9c4a92809c.1690094459.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
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
Cc: linux-arm-msm@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If 'sz' is SIZE_MAX, kmalloc() will fail. So there is no need to explicitly
check for an hypothetical overflow.

Remove the check to save a few lines of code.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 3f1aa4de3b87..6ca8f8cbb6e2 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -211,11 +211,7 @@ static int submit_lookup_cmds(struct msm_gem_submit *submit,
 
 		sz = array_size(submit_cmd.nr_relocs,
 				sizeof(struct drm_msm_gem_submit_reloc));
-		/* check for overflow: */
-		if (sz == SIZE_MAX) {
-			ret = -ENOMEM;
-			goto out;
-		}
+
 		submit->cmd[i].relocs = kmalloc(sz, GFP_KERNEL);
 		if (!submit->cmd[i].relocs) {
 			ret = -ENOMEM;
-- 
2.34.1

