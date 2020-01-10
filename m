Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 179C013864F
	for <lists+dri-devel@lfdr.de>; Sun, 12 Jan 2020 13:36:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC7F789CBC;
	Sun, 12 Jan 2020 12:36:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5952F6E99A
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2020 09:19:45 +0000 (UTC)
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id D171E1CCB194AE3BA2B3;
 Fri, 10 Jan 2020 17:19:42 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.439.0; Fri, 10 Jan 2020
 17:19:33 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <airlied@linux.ie>, <daniel@ffwll.ch>, <yuehaibing@huawei.com>,
 <alexander.deucher@amd.com>
Subject: [PATCH -next] drm/ch7006: Use match_string() helper to simplify the
 code
Date: Fri, 10 Jan 2020 17:19:26 +0800
Message-ID: <20200110091926.48380-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Sun, 12 Jan 2020 12:36:09 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

match_string() returns the array index of a matching string.
Use it instead of the open-coded implementation.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/gpu/drm/i2c/ch7006_drv.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i2c/ch7006_drv.c b/drivers/gpu/drm/i2c/ch7006_drv.c
index b91e48d..f9a46b5 100644
--- a/drivers/gpu/drm/i2c/ch7006_drv.c
+++ b/drivers/gpu/drm/i2c/ch7006_drv.c
@@ -464,16 +464,13 @@ static int ch7006_encoder_init(struct i2c_client *client,
 	priv->chip_version = ch7006_read(client, CH7006_VERSION_ID);
 
 	if (ch7006_tv_norm) {
-		for (i = 0; i < NUM_TV_NORMS; i++) {
-			if (!strcmp(ch7006_tv_norm_names[i], ch7006_tv_norm)) {
-				priv->norm = i;
-				break;
-			}
-		}
-
-		if (i == NUM_TV_NORMS)
+		i = match_string(ch7006_tv_norm_names, NUM_TV_NORMS,
+				 ch7006_tv_norm);
+		if (i < 0)
 			ch7006_err(client, "Invalid TV norm setting \"%s\".\n",
 				   ch7006_tv_norm);
+		else
+			priv->norm = i;
 	}
 
 	if (ch7006_scale >= 0 && ch7006_scale <= 2)
-- 
2.7.4


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
