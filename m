Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C73357E78
	for <lists+dri-devel@lfdr.de>; Thu,  8 Apr 2021 10:53:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77B0D6EA2E;
	Thu,  8 Apr 2021 08:53:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m12-11.163.com (m12-11.163.com [220.181.12.11])
 by gabe.freedesktop.org (Postfix) with SMTP id 0A3526EA2E
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Apr 2021 08:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=1mKvG
 +tRl+t/mX5hfyIaRT0s5yn0eepwWjouyHlWMEY=; b=ZYMIUoPVtPj5zvFM6NGdK
 9zDAXmtUynYfz3wD7nP6QcmLa1D9/czosj+4anU2KZMH541sDv6tVoV69shxg/1y
 Dlh9B8mBEX8iPhy8KfPURKRwPxsuo/BfzCVca24auIB5k810lC0NO2v3VOEfsPd1
 +Yzt2dtKGmDzTnsMfhbbRE=
Received: from localhost.localdomain (unknown [113.98.63.214])
 by smtp7 (Coremail) with SMTP id C8CowADn0oprxG5gHVXFWA--.2954S2;
 Thu, 08 Apr 2021 16:53:00 +0800 (CST)
From: Carlis <llyz108@163.com>
To: thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
 daniel@ffwll.ch
Subject: [PATCH v2] drm/panel: panel-dsi-cm: convert sysfs snprintf to
 sysfs_emit
Date: Thu,  8 Apr 2021 08:52:57 +0000
Message-Id: <20210408085257.2396-1-llyz108@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CM-TRANSID: C8CowADn0oprxG5gHVXFWA--.2954S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7GrW3Xry3Gw1xCF47Zry3CFg_yoW8JF45pF
 47G347ZrW8JFyqyFW5CFZ2vFyrZ3WIqFWxKa4kGanxuF4DAF48AF9rAFW7Kr15Jr1xC34a
 gF4DKrW5uay8Ar7anT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jHrWrUUUUU=
X-Originating-IP: [113.98.63.214]
X-CM-SenderInfo: xoo16iiqy6il2tof0z/1tbi6xZuhVXlvmLpagABs4
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Xuezhi Zhang <zhangxuezhi1@yulong.com>

Fix the following coccicheck warning:
drivers/gpu/drm//panel/panel-dsi-cm.c:271:8-16: 
WARNING: use scnprintf or sprintf
drivers/gpu/drm//panel/panel-dsi-cm.c:251:8-16: 
WARNING: use scnprintf or sprintf

Signed-off-by: Xuezhi Zhang <zhangxuezhi1@yulong.com>
---
v2: change snprint to snprintf in subject.
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

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
