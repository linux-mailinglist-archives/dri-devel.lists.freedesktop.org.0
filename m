Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF94357E13
	for <lists+dri-devel@lfdr.de>; Thu,  8 Apr 2021 10:32:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC08C6EA22;
	Thu,  8 Apr 2021 08:32:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m12-11.163.com (m12-11.163.com [220.181.12.11])
 by gabe.freedesktop.org (Postfix) with SMTP id D5ECC6EA22
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Apr 2021 08:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=U+IWT
 dIROHmOJoPT3L0orSHFKktYzbY2trOkSRmL0Gk=; b=IgJrraD1paFmm73Xtc4jI
 7Ms7HFDBaoSjHgT7+qbrENvHOXDKJHSbLceDScIlYthaSw54fmT2LOWdDhy4XVP5
 Mx9/4GU4Zs7bJPlArXMWIB558OJ7k2A60Evgz91bdY3V/CNq+/eaqALsiA4gtU+v
 1zIsFlvqSUKS6B3W1FGQ2s=
Received: from localhost.localdomain (unknown [119.137.53.45])
 by smtp7 (Coremail) with SMTP id C8CowAAH_5ZYv25gvwTDWA--.27213S2;
 Thu, 08 Apr 2021 16:31:21 +0800 (CST)
From: Carlis <llyz108@163.com>
To: thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
 daniel@ffwll.ch
Subject: [PATCH] drm/panel: tpo-td043mtea1: convert sysfs snprintf to
 sysfs_emit
Date: Thu,  8 Apr 2021 08:31:18 +0000
Message-Id: <20210408083118.557966-1-llyz108@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CM-TRANSID: C8CowAAH_5ZYv25gvwTDWA--.27213S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7WF1DWFWUKF15AFy8tF4ktFb_yoW8Xry7pF
 srGa45ArWrJw1DKF4UCan7ZFyS9a4xtFySqFykGwn5uw4UJrWDtFZ8Jay7tFy5Jr1xCrW3
 tF1ktry3Za40yr7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j6RRiUUUUU=
X-Originating-IP: [119.137.53.45]
X-CM-SenderInfo: xoo16iiqy6il2tof0z/xtbBGhJuhV3l-MgAqQAAsG
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
drivers/gpu/drm//panel/panel-tpo-td043mtea1.c:217:8-16: 
WARNING: use scnprintf or sprintf
drivers/gpu/drm//panel/panel-tpo-td043mtea1.c:189:8-16: 
WARNING: use scnprintf or sprintf

Signed-off-by: Xuezhi Zhang <zhangxuezhi1@yulong.com>
---
 drivers/gpu/drm/panel/panel-tpo-td043mtea1.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-tpo-td043mtea1.c b/drivers/gpu/drm/panel/panel-tpo-td043mtea1.c
index 49e6c9386258..bacaf1b7fb70 100644
--- a/drivers/gpu/drm/panel/panel-tpo-td043mtea1.c
+++ b/drivers/gpu/drm/panel/panel-tpo-td043mtea1.c
@@ -186,7 +186,7 @@ static ssize_t vmirror_show(struct device *dev, struct device_attribute *attr,
 {
 	struct td043mtea1_panel *lcd = dev_get_drvdata(dev);
 
-	return snprintf(buf, PAGE_SIZE, "%d\n", lcd->vmirror);
+	return sysfs_emit(buf, "%d\n", lcd->vmirror);
 }
 
 static ssize_t vmirror_store(struct device *dev, struct device_attribute *attr,
@@ -214,7 +214,7 @@ static ssize_t mode_show(struct device *dev, struct device_attribute *attr,
 {
 	struct td043mtea1_panel *lcd = dev_get_drvdata(dev);
 
-	return snprintf(buf, PAGE_SIZE, "%d\n", lcd->mode);
+	return sysfs_emit(buf, "%d\n", lcd->mode);
 }
 
 static ssize_t mode_store(struct device *dev, struct device_attribute *attr,
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
