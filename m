Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 962783E1BA0
	for <lists+dri-devel@lfdr.de>; Thu,  5 Aug 2021 20:44:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06DF26EB22;
	Thu,  5 Aug 2021 18:44:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp06.smtpout.orange.fr
 [80.12.242.128])
 by gabe.freedesktop.org (Postfix) with ESMTP id DF41C6EB22
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Aug 2021 18:44:51 +0000 (UTC)
Received: from localhost.localdomain ([217.128.214.245]) by mwinf5d63 with ME
 id dudJ250055JEng903udJWQ; Thu, 05 Aug 2021 20:37:20 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Thu, 05 Aug 2021 20:37:20 +0200
X-ME-IP: 217.128.214.245
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@linux.ie, daniel@ffwll.ch, ray.huang@amd.com, evan.quan@amd.com,
 Xiaojian.Du@amd.com, kevin1.wang@amd.com, Jinzhou.Su@amd.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] drm/amd/pm: Fix a memory leak in an error handling path in
 'vangogh_tables_init()'
Date: Thu,  5 Aug 2021 20:37:14 +0200
Message-Id: <fd28a9cec24a8d32ebb26dd857c399d0a15acdd5.1628188477.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
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

'watermarks_table' must be freed instead 'clocks_table', because
'clocks_table' is known to be NULL at this point and 'watermarks_table' is
never freed if the last kzalloc fails.

Fixes: c98ee89736b8 ("drm/amd/pm: add the fine grain tuning function for vangogh")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
index 335b3c70e1a7..06eea917284e 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
@@ -256,7 +256,7 @@ static int vangogh_tables_init(struct smu_context *smu)
 	return 0;
 
 err3_out:
-	kfree(smu_table->clocks_table);
+	kfree(smu_table->watermarks_table);
 err2_out:
 	kfree(smu_table->gpu_metrics_table);
 err1_out:
-- 
2.30.2

