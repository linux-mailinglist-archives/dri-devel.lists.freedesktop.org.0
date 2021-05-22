Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C99B38D314
	for <lists+dri-devel@lfdr.de>; Sat, 22 May 2021 04:42:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B2766E8B6;
	Sat, 22 May 2021 02:42:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1001 seconds by postgrey-1.36 at gabe;
 Sat, 22 May 2021 02:42:02 UTC
Received: from m12-13.163.com (m12-13.163.com [220.181.12.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DE1D6E8B6
 for <dri-devel@lists.freedesktop.org>; Sat, 22 May 2021 02:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=nJfcI
 ngGMlUeh4q6+oHuKptoGEAVFgUthaduyrLhVCI=; b=jqfEMpPl8UeSs901kJ4mG
 c10XVjzm2lVZgdw1EGTqMeXA/BngHrsc8jr++mdP/LX6Na7YSwGKn5JMD/ZQU18U
 OHBrfotVBnvUR/bATVY4qPZ/vMqFgQonVUVm2agld7orMbZhJAdgzL4UjWp6FUom
 diGgrGc64KtFSmh4T3rjRE=
Received: from carlis.localdomain (unknown [120.229.64.135])
 by smtp9 (Coremail) with SMTP id DcCowADnZUYBa6hgC+XyBw--.13087S2;
 Sat, 22 May 2021 10:22:58 +0800 (CST)
From: Xuezhi Zhang <llyz108@163.com>
To: thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
 daniel@ffwll.ch
Subject: [PATCH] drm/panel: panel-dsi-cm: convert sysfs snprintf to sysfs_emit
Date: Sat, 22 May 2021 02:22:45 +0000
Message-Id: <20210522022245.37151-1-llyz108@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DcCowADnZUYBa6hgC+XyBw--.13087S2
X-Coremail-Antispam: 1Uf129KBjvJXoWrZrW3ZrWfKF4xJr4UGr1kAFb_yoW8Jr47pF
 47G347ZrW8JFyqyFWrCFZ2va4rZ3Z2qFWxKa4kGanxuF4UAF48AF9rAFW7Kr15Jr1xG34a
 gF4DKrW5uay8Ar7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jVMKZUUUUU=
X-Originating-IP: [120.229.64.135]
X-CM-SenderInfo: xoo16iiqy6il2tof0z/1tbi6weahVXlwKGOvwABsS
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
Cc: Xuezhi Zhang <zhangxuezhi1@yulong.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Xuezhi Zhang <zhangxuezhi1@yulong.com>

Fix the following coccicheck warnings:
drivers/gpu/drm//panel/panel-dsi-cm.c:271:8-16:
WARNING: use scnprintf or sprintf
drivers/gpu/drm//panel/panel-dsi-cm.c:251:8-16:
WARNING: use scnprintf or sprintf

Signed-off-by: Xuezhi Zhang <zhangxuezhi1@yulong.com>
---
 drivers/gpu/drm/panel/panel-dsi-cm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-dsi-cm.c b/drivers/gpu/drm/panel/panel-dsi-cm.c
index 5fbfb71ca3d9..a8efb06cca64 100644
--- a/drivers/gpu/drm/panel/panel-dsi-cm.c
+++ b/drivers/gpu/drm/panel/panel-dsi-cm.c
@@ -248,7 +248,7 @@ static ssize_t num_dsi_errors_show(struct device *dev,
 	if (r)
 		return r;
 
-	return snprintf(buf, PAGE_SIZE, "%d\n", errors);
+	return sysfs_emit(buf, "%d\n", errors);
 }
 
 static ssize_t hw_revision_show(struct device *dev,
@@ -268,7 +268,7 @@ static ssize_t hw_revision_show(struct device *dev,
 	if (r)
 		return r;
 
-	return snprintf(buf, PAGE_SIZE, "%02x.%02x.%02x\n", id1, id2, id3);
+	return sysfs_emit(buf, "%02x.%02x.%02x\n", id1, id2, id3);
 }
 
 static DEVICE_ATTR_RO(num_dsi_errors);
-- 
2.25.1


