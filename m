Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 225D1357E60
	for <lists+dri-devel@lfdr.de>; Thu,  8 Apr 2021 10:46:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DF1F6EA2D;
	Thu,  8 Apr 2021 08:46:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m12-17.163.com (m12-17.163.com [220.181.12.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E589A6EA2D
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Apr 2021 08:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=hAJCn
 0+oHfyjAm5HefGdXbPdmgpU4l0aRalPUPuht8E=; b=hr/S8pJ0mAmvkY/74DCEi
 +nCy2/Lx9qeRlIu7PataY0bkEY+Zkr/KI6Lw4aY8FNfmNOh51FBG4+qbbx68PQUa
 Ky9MdTMu1NpIZT9MBBClKaZSn3soPLVcKCkWb7AN/2M8yAO1H2laSQTuj7LWXy+D
 xqKBHIhNkx+UCPI2kpcIBs=
Received: from localhost.localdomain (unknown [119.137.53.45])
 by smtp13 (Coremail) with SMTP id EcCowABXWpLMwm5gR4EIuQ--.56324S2;
 Thu, 08 Apr 2021 16:46:05 +0800 (CST)
From: Carlis <llyz108@163.com>
To: thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
 daniel@ffwll.ch
Subject: [PATCH] drm/panel: panel-dsi-cm: convert sysfs snprint to sysfs_emit
Date: Thu,  8 Apr 2021 08:46:03 +0000
Message-Id: <20210408084603.2112-1-llyz108@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CM-TRANSID: EcCowABXWpLMwm5gR4EIuQ--.56324S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7GrW3Xry3Gw1xCF47Zry3CFg_yoW8Jr4rpF
 47G347ZrW8JFyqyFWrCFZ2vFyrZ3WIqFWxKa4kGanxuF4UAF48AF9rAFW7Kr15Jr1xG34a
 gF4DKrW5uay8Ar7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j6SoJUUUUU=
X-Originating-IP: [119.137.53.45]
X-CM-SenderInfo: xoo16iiqy6il2tof0z/1tbiPg1uhVxBmQhfnQAAsW
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
