Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4981D74ED
	for <lists+dri-devel@lfdr.de>; Mon, 18 May 2020 12:14:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA4696E1F7;
	Mon, 18 May 2020 10:14:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp11.smtpout.orange.fr
 [80.12.242.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82E706E3EB
 for <dri-devel@lists.freedesktop.org>; Sun, 17 May 2020 08:51:03 +0000 (UTC)
Received: from localhost.localdomain ([92.140.207.208]) by mwinf5d34 with ME
 id fkqq2200R4WJoZY03kqrdM; Sun, 17 May 2020 10:51:01 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 17 May 2020 10:51:01 +0200
X-ME-IP: 92.140.207.208
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: airlied@linux.ie, daniel@ffwll.ch, gregkh@linuxfoundation.org,
 tglx@linutronix.de, chris@chris-wilson.co.uk, tvrtko.ursulin@intel.com,
 joonas.lahtinen@linux.intel.com
Subject: [PATCH] drm/mm: Fix an error handling path in '__igt_once()'
Date: Sun, 17 May 2020 10:50:49 +0200
Message-Id: <20200517085049.278103-1-christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 18 May 2020 10:14:39 +0000
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
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The label of the last gotos must be switched for the error handling code to
work as expected.

Fixes: 83bc4ec37210 ("drm/mm: Add a search-by-address variant to only inspect a single hole")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/gpu/drm/selftests/test-drm_mm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/selftests/test-drm_mm.c b/drivers/gpu/drm/selftests/test-drm_mm.c
index 9aabe82dcd3a..af38c4fa4db5 100644
--- a/drivers/gpu/drm/selftests/test-drm_mm.c
+++ b/drivers/gpu/drm/selftests/test-drm_mm.c
@@ -1864,14 +1864,14 @@ static int __igt_once(unsigned int mode)
 		pr_err("Unexpectedly inserted the node into the wrong hole: node.start=%llx\n",
 		       node.start);
 		err = -EINVAL;
-		goto err_node;
+		goto err_hi;
 	}
 
 	err = drm_mm_insert_node_generic(&mm, &node, 2, 0, 0, mode);
 	if (err) {
 		pr_err("Could not insert the node into the available hole!\n");
 		err = -EINVAL;
-		goto err_hi;
+		goto err_node;
 	}
 
 err_node:
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
