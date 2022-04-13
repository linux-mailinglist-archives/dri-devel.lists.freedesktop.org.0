Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F0974FF0B7
	for <lists+dri-devel@lfdr.de>; Wed, 13 Apr 2022 09:40:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0827310FBD2;
	Wed, 13 Apr 2022 07:40:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 300 seconds by postgrey-1.36 at gabe;
 Wed, 13 Apr 2022 06:48:10 UTC
Received: from m15111.mail.126.com (m15111.mail.126.com [220.181.15.111])
 by gabe.freedesktop.org (Postfix) with ESMTP id BC1D2112363
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 06:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=xq0DB
 RRLDqYeeo9ZuXiFrw91M+Bulw3iR7DHGNuPRto=; b=PETy5mHLPsEbDZN7fFmyW
 DADf7hZfegmsqcS1MRpwzwhhdwx+o1UQ47TvGN9cEMxp2g1AH9EJU4S9+TyuzPcm
 +PCvWMzQXoyQJfWMAEXWu+9SS+j7/apWbCUx3z+YZwSEGtnljEG2UGt4g8sOyJK+
 fop8xZqAkWCb4T61GOOAas=
Received: from ubuntu.localdomain (unknown [58.213.83.157])
 by smtp1 (Coremail) with SMTP id C8mowAA3Rze8cVZiR1HWAQ--.11201S4;
 Wed, 13 Apr 2022 14:46:20 +0800 (CST)
From: Bernard Zhao <zhaojunkui2008@126.com>
To: Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/tegra: remove useless if check before kfree
Date: Tue, 12 Apr 2022 23:46:18 -0700
Message-Id: <20220413064618.23974-1-zhaojunkui2008@126.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: C8mowAA3Rze8cVZiR1HWAQ--.11201S4
X-Coremail-Antispam: 1Uf129KBjvdXoW7JrWxKw4rtFW7Xr1UXFyDtrb_yoWxCFc_Cw
 40qr97Ww48u39rJF1jyr43ZFW0kFnI9FZ5ZF9Fgayftw1DZw1kA3429r1rZ3WUCFWUXF1D
 Ja4UXF45X3W3WjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRN7KsDUUUUU==
X-Originating-IP: [58.213.83.157]
X-CM-SenderInfo: p2kd0y5xqn3xasqqmqqrswhudrp/1tbiLR3hqlpD9ZpaGAAAsP
X-Mailman-Approved-At: Wed, 13 Apr 2022 07:39:54 +0000
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
Cc: bernard@vivo.com, Bernard Zhao <zhaojunkui2008@126.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch remove useless if check before kfree.

Signed-off-by: Bernard Zhao <zhaojunkui2008@126.com>
---
 drivers/gpu/drm/tegra/submit.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tegra/submit.c b/drivers/gpu/drm/tegra/submit.c
index 6d6dd8c35475..54ac31bc80f6 100644
--- a/drivers/gpu/drm/tegra/submit.c
+++ b/drivers/gpu/drm/tegra/submit.c
@@ -639,8 +639,7 @@ int tegra_drm_ioctl_channel_submit(struct drm_device *drm, void *data,
 		kfree(job_data->used_mappings);
 	}
 
-	if (job_data)
-		kfree(job_data);
+	kfree(job_data);
 put_bo:
 	gather_bo_put(&bo->base);
 unlock:
-- 
2.33.1

