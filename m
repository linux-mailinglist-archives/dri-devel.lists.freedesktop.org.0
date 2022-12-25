Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B20F6655CB5
	for <lists+dri-devel@lfdr.de>; Sun, 25 Dec 2022 10:02:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88DAD10E08A;
	Sun, 25 Dec 2022 09:02:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from msg-2.mailo.com (msg-2.mailo.com [213.182.54.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3327510E08A
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Dec 2022 09:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
 t=1671958933; bh=Ikp0bAciUuHR4CMbH20GjbpUaRxlCiAZvcXlyc9waLo=;
 h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:MIME-Version:
 Content-Type;
 b=GWMRd/sU0xw0RjY/sfGybZ415xUmj9CIVv+p28PHWmtDPlOrqOxqBGj1PkikxEUkq
 R+Trdr7wUiEwD8sCNDULm1P4vj4Qar/txZTOvNi3Z2xnHRcDD+784fOPKm4LyCz125
 XM4/Rwg9IfkbUAF5WeMCLJYg4i9VMxZ8kKyNyIGc=
Received: by b-6.in.mailobj.net [192.168.90.16] with ESMTP
 via ip-206.mailobj.net [213.182.55.206]
 Sun, 25 Dec 2022 10:02:13 +0100 (CET)
X-EA-Auth: Z6P0qwhHoWnu0O6GC4KeXSFonqwCrW85IJg5SHY+V8thx9eg+ci2uMF9OuzEX4B+nQ56UEBNnAqMBeIPZ5eNEs+/JG8CxndQ
Date: Sun, 25 Dec 2022 14:32:08 +0530
From: Deepak R Varma <drv@mailo.com>
To: Ben Skeggs <bskeggs@redhat.com>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/nouveau/hwmon: Use sysfs_emit in show function callsbacks
Message-ID: <Y6gRkFnEgPO4avrs@qemulion>
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

According to Documentation/filesystems/sysfs.rst, the show() callback
function of kobject attributes should strictly use sysfs_emit() instead
of sprintf() family functions. So, make this change.
Issue identified using the coccinelle device_attr_show.cocci script.

Signed-off-by: Deepak R Varma <drv@mailo.com>
---
 drivers/gpu/drm/nouveau/nouveau_hwmon.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_hwmon.c b/drivers/gpu/drm/nouveau/nouveau_hwmon.c
index a7db7c31064b..e844be49e11e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_hwmon.c
+++ b/drivers/gpu/drm/nouveau/nouveau_hwmon.c
@@ -41,7 +41,7 @@ static ssize_t
 nouveau_hwmon_show_temp1_auto_point1_pwm(struct device *d,
 					 struct device_attribute *a, char *buf)
 {
-	return snprintf(buf, PAGE_SIZE, "%d\n", 100);
+	return sysfs_emit(buf, "%d\n", 100);
 }
 static SENSOR_DEVICE_ATTR(temp1_auto_point1_pwm, 0444,
 			  nouveau_hwmon_show_temp1_auto_point1_pwm, NULL, 0);
@@ -54,8 +54,8 @@ nouveau_hwmon_temp1_auto_point1_temp(struct device *d,
 	struct nouveau_drm *drm = nouveau_drm(dev);
 	struct nvkm_therm *therm = nvxx_therm(&drm->client.device);

-	return snprintf(buf, PAGE_SIZE, "%d\n",
-	      therm->attr_get(therm, NVKM_THERM_ATTR_THRS_FAN_BOOST) * 1000);
+	return sysfs_emit(buf, "%d\n",
+			  therm->attr_get(therm, NVKM_THERM_ATTR_THRS_FAN_BOOST) * 1000);
 }
 static ssize_t
 nouveau_hwmon_set_temp1_auto_point1_temp(struct device *d,
@@ -87,8 +87,8 @@ nouveau_hwmon_temp1_auto_point1_temp_hyst(struct device *d,
 	struct nouveau_drm *drm = nouveau_drm(dev);
 	struct nvkm_therm *therm = nvxx_therm(&drm->client.device);

-	return snprintf(buf, PAGE_SIZE, "%d\n",
-	 therm->attr_get(therm, NVKM_THERM_ATTR_THRS_FAN_BOOST_HYST) * 1000);
+	return sysfs_emit(buf, "%d\n",
+			  therm->attr_get(therm, NVKM_THERM_ATTR_THRS_FAN_BOOST_HYST) * 1000);
 }
 static ssize_t
 nouveau_hwmon_set_temp1_auto_point1_temp_hyst(struct device *d,
--
2.34.1



