Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD8A235378D
	for <lists+dri-devel@lfdr.de>; Sun,  4 Apr 2021 10:56:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E16C46E489;
	Sun,  4 Apr 2021 08:56:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m12-11.163.com (m12-11.163.com [220.181.12.11])
 by gabe.freedesktop.org (Postfix) with SMTP id A0BCE6E40A
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Apr 2021 06:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=AHwtR
 8305fQpcuQ/FtJPgoUprNZ88/9HAjWuMMB8cG4=; b=SER48+H2GExFyKt4dM82Z
 xuKb1AJ/PyWJkXq+G5DAnNsVEi0sM9T3HWh7P6RUEWp2KgP0ZaIWpi8QiQHoBys7
 PR8btPdpB0j9T3T+xqCLAv3oLQHRBa8RM51jKI6ZUkasIZK927F0kNaZU85TTm7h
 F104aMiuAWehbRATC46JR0=
Received: from localhost.localdomain (unknown [120.229.91.194])
 by smtp7 (Coremail) with SMTP id C8CowAAXA4sqYmlg8jdKVg--.27965S2;
 Sun, 04 Apr 2021 14:52:28 +0800 (CST)
From: Carlis <llyz108@163.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, tzimmermann@suse.de
Subject: [PATCH] drm: sysfs: convert sysfs snprintf to sysfs_emit
Date: Sun,  4 Apr 2021 06:52:19 +0000
Message-Id: <20210404065219.188967-1-llyz108@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CM-TRANSID: C8CowAAXA4sqYmlg8jdKVg--.27965S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tr4DKrWkKr1fXrykAr47Arb_yoW8XrW3pF
 W3JrW8ZrWkKan0y3W3AF1UuFyfZasFqayxJrWkG3sxua1rArWDGF95AayjqFyUJrWkCr1S
 gF92krW5ua18Cr7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j2YLkUUUUU=
X-Originating-IP: [120.229.91.194]
X-CM-SenderInfo: xoo16iiqy6il2tof0z/1tbi2QpqhVr7uVZafAAAsU
X-Mailman-Approved-At: Sun, 04 Apr 2021 08:56:04 +0000
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
Cc: zhangxuezhi1@yulong.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Xuezhi Zhang <zhangxuezhi1@yulong.com>

Fix the following coccicheck warning:
drivers/gpu/drm/drm_sysfs.c:172:8-16: 
WARNING: use scnprintf or sprintf
drivers/gpu/drm/drm_sysfs.c:185:8-16: 
WARNING: use scnprintf or sprintf
drivers/gpu/drm/drm_sysfs.c:159:8-16: 
WARNING: use scnprintf or sprintf

Signed-off-by: Xuezhi Zhang <zhangxuezhi1@yulong.com>
---
 drivers/gpu/drm/drm_sysfs.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
index f0336c804..13142fd9d 100644
--- a/drivers/gpu/drm/drm_sysfs.c
+++ b/drivers/gpu/drm/drm_sysfs.c
@@ -156,7 +156,7 @@ static ssize_t status_show(struct device *device,
 
 	status = READ_ONCE(connector->status);
 
-	return snprintf(buf, PAGE_SIZE, "%s\n",
+	return sysfs_emit(buf, "%s\n",
 			drm_get_connector_status_name(status));
 }
 
@@ -169,7 +169,7 @@ static ssize_t dpms_show(struct device *device,
 
 	dpms = READ_ONCE(connector->dpms);
 
-	return snprintf(buf, PAGE_SIZE, "%s\n",
+	return sysfs_emit(buf, "%s\n",
 			drm_get_dpms_name(dpms));
 }
 
@@ -182,7 +182,7 @@ static ssize_t enabled_show(struct device *device,
 
 	enabled = READ_ONCE(connector->encoder);
 
-	return snprintf(buf, PAGE_SIZE, enabled ? "enabled\n" : "disabled\n");
+	return sysfs_emit(buf, enabled ? "enabled\n" : "disabled\n");
 }
 
 static ssize_t edid_show(struct file *filp, struct kobject *kobj,
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
