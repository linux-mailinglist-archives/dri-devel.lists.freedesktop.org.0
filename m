Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 234FC656D60
	for <lists+dri-devel@lfdr.de>; Tue, 27 Dec 2022 18:15:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5083410E166;
	Tue, 27 Dec 2022 17:14:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from msg-2.mailo.com (msg-2.mailo.com [213.182.54.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C259510E166
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Dec 2022 17:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
 t=1672161267; bh=t7PT2uktgkerHfBW8tbhYinlf/iWYlEafzcWDES++jM=;
 h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:MIME-Version:
 Content-Type;
 b=PFvbFEkOjToKt4pNFDu81BSQhHuNoyMGKRRB1qLS/ma35bUMEGFGb4WWuIzm+JJs9
 /KBGjbdAWvKBrsl3hbI1VMkzh1m1q+B3NyPN3EnwTckyAp7FEHxf/2DsKzWa0yKogr
 xUhVjDhHGShJfc1i/8vvL0xMSqkEAQYpGRcPYHvE=
Received: by b-6.in.mailobj.net [192.168.90.16] with ESMTP
 via ip-206.mailobj.net [213.182.55.206]
 Tue, 27 Dec 2022 18:14:27 +0100 (CET)
X-EA-Auth: kTiepSjWpyi9Ji8iWRK5eWeMrKdUoRK+JaiTVgN5jm3nna2m7biYtAmN9vNNkbmNg67H6j5YGy8WqhY1z1C7Uqq/5buDi/8h
Date: Tue, 27 Dec 2022 22:44:21 +0530
From: Deepak R Varma <drv@mailo.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/tegra: submit: No need for Null pointer check before kfree
Message-ID: <Y6sn7XptKyk5cbrA@qemulion>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: Praveen Kumar <kumarpraveen@linux.microsoft.com>,
 Deepak R Varma <drv@mailo.com>, Saurabh Singh Sengar <ssengar@microsoft.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

kfree() & vfree() internally perform NULL check on the pointer handed
to it and take no action if it indeed is NULL. Hence there is no need
for a pre-check of the memory pointer before handing it to
kfree()/vfree().

Issue reported by ifnullfree.cocci Coccinelle semantic patch script.

Signed-off-by: Deepak R Varma <drv@mailo.com>
---
 drivers/gpu/drm/tegra/submit.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tegra/submit.c b/drivers/gpu/drm/tegra/submit.c
index 066f88564169..06f836db99d0 100644
--- a/drivers/gpu/drm/tegra/submit.c
+++ b/drivers/gpu/drm/tegra/submit.c
@@ -680,8 +680,8 @@ int tegra_drm_ioctl_channel_submit(struct drm_device *drm, void *data,
 		kfree(job_data->used_mappings);
 	}

-	if (job_data)
-		kfree(job_data);
+	kfree(job_data);
+
 put_bo:
 	gather_bo_put(&bo->base);
 unlock:
--
2.34.1



