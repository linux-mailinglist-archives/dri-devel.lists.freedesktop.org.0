Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5826B4C1181
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 12:40:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA36010E965;
	Wed, 23 Feb 2022 11:40:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AFFF10E985
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Feb 2022 11:40:47 +0000 (UTC)
Received: from benjamin-XPS-13-9310.. (unknown
 [IPv6:2a01:e0a:120:3210:995c:f547:d294:e4ca])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: benjamin.gaignard)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 979691F44691;
 Wed, 23 Feb 2022 11:40:45 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1645616445;
 bh=Odo6dvcrTCaffyGv6tM4ZI49Z1HSi/r7+/fGLyy6ilA=;
 h=From:To:Cc:Subject:Date:From;
 b=RWeVp9Gavp0lThklna33hXdbWAxCRZXV1r+YOyxptw/+meIzZXsqtSHu7lhFDX1tH
 kq1k+RCEYJEbgChrnRqVY4c9FS6E846qnr4EHCGjYT+DPA3fbgjZUKYzH1UMx02Lx3
 7c1zYUDeERg7Neg+kLfm+ahP7yOm2LbfIEI6lIbnRKQozKSr5RsdkcczOSG83JNRiy
 34Y8XISpN09wCjxMaDtFenP4Ur6YgCtNQ/WzeEXf5Mb/OmZLfzcGF6e+Qf75dNYI7H
 WzD2RGr+mx34zGqKSPfdgHtSAnoMewOiuxqc297yZRNfjgPlOSyvpzZCxXf5Uc/weM
 HCKablplqE32A==
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
 daniel@ffwll.ch
Subject: [PATCH] drm/panel: boe-tv101wum-nl6: Fix errors cases handling in
 prepare function
Date: Wed, 23 Feb 2022 12:40:36 +0100
Message-Id: <20220223114036.445845-1-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.32.0
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
Cc: yangcong5@huaqin.corp-partner.google.com, kernel@collabora.com,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Make sure that pp3300 regulator and enable gpio are cleaned before
leave in error cases.

Fixes: 18c58153b8c62 ("drm/panel: boe-tv101wum-nl6: Support enabling a 3.3V rail")
Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
index 5fcbde789ddb..382a17bb96d8 100644
--- a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
+++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
@@ -1245,11 +1245,11 @@ static int boe_panel_prepare(struct drm_panel *panel)
 
 	ret = regulator_enable(boe->pp3300);
 	if (ret < 0)
-		return ret;
+		goto disablegpio;
 
 	ret = regulator_enable(boe->pp1800);
 	if (ret < 0)
-		return ret;
+		goto poweroff3v3;
 
 	usleep_range(3000, 5000);
 
@@ -1286,6 +1286,9 @@ static int boe_panel_prepare(struct drm_panel *panel)
 poweroff1v8:
 	usleep_range(5000, 7000);
 	regulator_disable(boe->pp1800);
+poweroff3v3:
+	regulator_disable(boe->pp3300);
+disablegpio:
 	gpiod_set_value(boe->enable_gpio, 0);
 
 	return ret;
-- 
2.32.0

