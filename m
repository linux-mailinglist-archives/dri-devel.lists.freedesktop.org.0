Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E58BA24303A
	for <lists+dri-devel@lfdr.de>; Wed, 12 Aug 2020 22:50:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1798F6E949;
	Wed, 12 Aug 2020 20:50:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9D1E6E947
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Aug 2020 20:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597265417;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=aCTPdh49E5sDGn5ZzKjWvZXNyAaCov7XSPlzHVRd6H8=;
 b=RAsNp9fgPVDZc9CPkUsWvaUoEXyOgJ3cEhIFUFWkEvqkd1uLAYs09wwQPsyyuWZWR40Os3
 D0ggZolcFUJg8l2K7YEEgxB5DX1ij6bd0huHpXDwApQlgAJczDU03Sl3zTR/qg9DS9RK7q
 5iEoqKbwajIDs2xDzEKB+5/ThBmuB7w=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-375-vvQbKZVqPoOgEXwqZqLdTw-1; Wed, 12 Aug 2020 16:50:16 -0400
X-MC-Unique: vvQbKZVqPoOgEXwqZqLdTw-1
Received: by mail-qk1-f199.google.com with SMTP id x20so2354492qki.20
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Aug 2020 13:50:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aCTPdh49E5sDGn5ZzKjWvZXNyAaCov7XSPlzHVRd6H8=;
 b=rUA6wNxzjsknKjqsdgL7MPKN1luVKWoOFIHonp/bJ1orfn+7zqmtvg5Gc5wNWa0skD
 yD0/7VGNTEyI9pufTOfTzZPTQQ6braDLIuE3X+6ImL6mcMfm8wc0c46ywpj9vKiTcRge
 M4eehJk0Sv37IEKZqLVSfY32vwPr9Qvg5kQnRn/LLyzhSPS0TJVUyQyCiX+clXEsV7ae
 XJ2arRwmr8w3CV9VIPM9pTlSPyxbg8bCPBxavb/XioogPLmQo6Lk6pN8zkaPgr2sKpll
 ZZsA7ySa7aT2LJ+wfv3j7u+hNwjkXQXhJcTOtl++KxEkOn7G+U1RF9CY3qJcxW7WWTvx
 HQLQ==
X-Gm-Message-State: AOAM530u8iHHZLQHtjVjGYCanxLjkl+5omSnV3LOS1kit8+4yhM+ybHn
 n3zc9Zld9z0vYKm874dBwdT9A9pJA/voEbOnJokWpaL96pGjCfwwqoKyl2vUGK+mevXI+3kzUS4
 BmfpHmpP9j5AClkLRlR3N7BaBrufF
X-Received: by 2002:ac8:776b:: with SMTP id h11mr1626442qtu.59.1597265415501; 
 Wed, 12 Aug 2020 13:50:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwDKBegQFFmZIxmsrmwndXdaMUq1PsUfcrePGLpzHuDwoACHNZ2R/9aaSb7HxZTiv4ujX+EDg==
X-Received: by 2002:ac8:776b:: with SMTP id h11mr1626422qtu.59.1597265415272; 
 Wed, 12 Aug 2020 13:50:15 -0700 (PDT)
Received: from dev.jcline.org.com ([136.56.87.133])
 by smtp.gmail.com with ESMTPSA id o13sm3692400qko.48.2020.08.12.13.50.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Aug 2020 13:50:14 -0700 (PDT)
From: Jeremy Cline <jcline@redhat.com>
To: Ben Skeggs <bskeggs@redhat.com>
Subject: [PATCH] drm/nouveau: Add fine-grain temperature reporting
Date: Wed, 12 Aug 2020 16:49:52 -0400
Message-Id: <20200812204952.1921587-1-jcline@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jcline@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jeremy Cline <jcline@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit d32656373857 ("drm/nouveau/therm/gp100: initial implementation of
new gp1xx temperature sensor") added support for reading finer-grain
temperatures, but continued to report temperatures in 1 degree Celsius
increments via nvkm_therm_temp_get().

Rather than altering nvkm_therm_temp_get() to report finer-grain
temperatures, which would be inconvenient for other users of the
function, a second interface has been added to line up with hwmon's
native unit of temperature.

Signed-off-by: Jeremy Cline <jcline@redhat.com>
---
 .../drm/nouveau/include/nvkm/subdev/therm.h   | 18 +++++++++++++
 drivers/gpu/drm/nouveau/nouveau_hwmon.c       |  4 +--
 .../gpu/drm/nouveau/nvkm/subdev/therm/base.c  | 16 ++++++++++++
 .../gpu/drm/nouveau/nvkm/subdev/therm/gp100.c | 25 +++++++++++++++++--
 .../gpu/drm/nouveau/nvkm/subdev/therm/priv.h  |  1 +
 5 files changed, 60 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/therm.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/therm.h
index 62c34f98c930..7b9928dd001c 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/therm.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/therm.h
@@ -100,6 +100,24 @@ struct nvkm_therm {
 };
 
 int nvkm_therm_temp_get(struct nvkm_therm *);
+
+/**
+ * nvkm_therm_temp_millidegree_get() - get the temperature in millidegrees
+ * @therm: The thermal device to read from.
+ *
+ * This interface reports temperatures in units of millidegree Celsius to
+ * align with the hwmon API. Some cards may only be capable of reporting in
+ * units of Celsius, and those that report finer grain temperatures may not be
+ * capable of millidegree Celsius accuracy,
+ *
+ * For cases where millidegree temperature is too fine-grain, the
+ * nvkm_therm_temp_get() interface reports temperatures in one degree Celsius
+ * increments.
+ *
+ * Return: The temperature in millidegrees Celsius, or -ENODEV if temperature
+ *         reporting is not supported.
+ */
+int nvkm_therm_temp_millidegree_get(struct nvkm_therm *therm);
 int nvkm_therm_fan_sense(struct nvkm_therm *);
 int nvkm_therm_cstate(struct nvkm_therm *, int, int);
 void nvkm_therm_clkgate_init(struct nvkm_therm *,
diff --git a/drivers/gpu/drm/nouveau/nouveau_hwmon.c b/drivers/gpu/drm/nouveau/nouveau_hwmon.c
index 1c3104d20571..e96355f93ce5 100644
--- a/drivers/gpu/drm/nouveau/nouveau_hwmon.c
+++ b/drivers/gpu/drm/nouveau/nouveau_hwmon.c
@@ -428,8 +428,8 @@ nouveau_temp_read(struct device *dev, u32 attr, int channel, long *val)
 	case hwmon_temp_input:
 		if (drm_dev->switch_power_state != DRM_SWITCH_POWER_ON)
 			return -EINVAL;
-		ret = nvkm_therm_temp_get(therm);
-		*val = ret < 0 ? ret : (ret * 1000);
+		ret = nvkm_therm_temp_millidegree_get(therm);
+		*val = ret;
 		break;
 	case hwmon_temp_max:
 		*val = therm->attr_get(therm, NVKM_THERM_ATTR_THRS_DOWN_CLK)
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/therm/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/therm/base.c
index 4a4d1e224126..e655b32c78b8 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/therm/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/therm/base.c
@@ -34,6 +34,22 @@ nvkm_therm_temp_get(struct nvkm_therm *therm)
 	return -ENODEV;
 }
 
+int
+nvkm_therm_temp_millidegree_get(struct nvkm_therm *therm)
+{
+	int ret = -ENODEV;
+
+	if (therm->func->temp_millidegree_get)
+		return therm->func->temp_millidegree_get(therm);
+
+	if (therm->func->temp_get) {
+		ret = therm->func->temp_get(therm);
+		if (ret > 0)
+			ret *= 1000;
+	}
+	return ret;
+}
+
 static int
 nvkm_therm_update_trip(struct nvkm_therm *therm)
 {
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/therm/gp100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/therm/gp100.c
index 9f0dea3f61dc..4c3c2895a3cb 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/therm/gp100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/therm/gp100.c
@@ -24,7 +24,7 @@
 #include "priv.h"
 
 static int
-gp100_temp_get(struct nvkm_therm *therm)
+gp100_temp_get_raw(struct nvkm_therm *therm)
 {
 	struct nvkm_device *device = therm->subdev.device;
 	struct nvkm_subdev *subdev = &therm->subdev;
@@ -37,14 +37,35 @@ gp100_temp_get(struct nvkm_therm *therm)
 
 	/* device valid */
 	if (tsensor & 0x20000000)
-		return (inttemp >> 8);
+		return inttemp;
 	else
 		return -ENODEV;
 }
 
+static int
+gp100_temp_millidegree_get(struct nvkm_therm *therm)
+{
+	int raw_temp = gp100_temp_get_raw(therm);
+
+	if (raw_temp < 0)
+		return raw_temp;
+	return raw_temp * 1000 >> 8;
+}
+
+static int
+gp100_temp_get(struct nvkm_therm *therm)
+{
+	int raw_temp = gp100_temp_get_raw(therm);
+
+	if (raw_temp < 0)
+		return raw_temp;
+	return raw_temp >> 8;
+}
+
 static const struct nvkm_therm_func
 gp100_therm = {
 	.temp_get = gp100_temp_get,
+	.temp_millidegree_get = gp100_temp_millidegree_get,
 	.program_alarms = nvkm_therm_program_alarms_polling,
 };
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/therm/priv.h b/drivers/gpu/drm/nouveau/nvkm/subdev/therm/priv.h
index 21659daf1864..a53068b4f0b9 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/therm/priv.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/therm/priv.h
@@ -92,6 +92,7 @@ struct nvkm_therm_func {
 	int (*pwm_clock)(struct nvkm_therm *, int line);
 
 	int (*temp_get)(struct nvkm_therm *);
+	int (*temp_millidegree_get)(struct nvkm_therm *therm);
 
 	int (*fan_sense)(struct nvkm_therm *);
 
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
