Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 815CC5ED4E9
	for <lists+dri-devel@lfdr.de>; Wed, 28 Sep 2022 08:31:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABBED10E283;
	Wed, 28 Sep 2022 06:31:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5188C10E037
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Sep 2022 01:41:24 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id y136so11244628pfb.3
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Sep 2022 18:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=eAwgA8BGMVVMxNp7JTXLjpsmeLFwCAL7NP0XLkLYUBE=;
 b=kNzBXFh17EpTe4Zm/ykApJYQG1VxxzwJhYHGO2Q7jLKFkEmSQNED69jo+lGj6MsB/i
 JWn9VNX8ZgzEfXwbHmxTs1PxHZ7SBp7w/WDc6DjmteAEORlcatEdAqoOK3HvQptCy/fT
 61ZrQxTzq0lHt5lMIPqgGTuecVT+r/BuBw/ifkRLgFDoTy3l4sQ7fpZgIodAS0c8KjNJ
 dCHSIkQFF82Wd/gKighQpP3aBKrC7hymDevYMe/n5HpkBPMYwlqL0QrPsDwsOhTex7TC
 W5E+sNcugFEEZB+50Txc6Y4MBQdhIGJcrVvqzG3rFMBYmMX1i44gzCYHoLByO0LSlr1C
 qosw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=eAwgA8BGMVVMxNp7JTXLjpsmeLFwCAL7NP0XLkLYUBE=;
 b=bQ8kB5vZtVSu6VPAbOStutwxd0bcuc63B9OENVX/VpXSzMfxCycozJGnW3/+/D83DK
 pfGHMXZEX5TTl3N0R7DICLOQRXPHtY6R4H0CiRv3HBlYyi6GJRbypq7TL/1eJj+rrwea
 a0chPeFW+3ZOZr7TpvSUAKEx/RO6b6He+fdKQfhJpKVMqHS3HlAhIMlqn/N3g6oeJyGF
 hvdariZOxMvQ15FXyVUkj/Pb4N8G0zCv4C8fgMBFpsHzJ6z4a+wQiV/ehht4890O0d+i
 h1XxTCKuoGAfwRfmq+u2d+JAeVorTPKr0/7zt4sGdg+vfz9mInR5qo7B8agDR2rJpAr4
 gmhw==
X-Gm-Message-State: ACrzQf0nVbGOPxgfBWgGy6y9dcKd60lT5bhBnnbFO4o90i7kaPmeyTGH
 HwOeZyHnj4FUj/6eYgU8yBw=
X-Google-Smtp-Source: AMsMyM6KFgNRR2OZXGm1nYTwzsxxG1ueDqktGrPUjgpkdhgBtOMApvbIh2x6bSImTsuWTbLiAZ/Qqg==
X-Received: by 2002:a05:6a00:acc:b0:530:e79e:fc27 with SMTP id
 c12-20020a056a000acc00b00530e79efc27mr32313608pfl.61.1664329283732; 
 Tue, 27 Sep 2022 18:41:23 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 k13-20020a170902c40d00b00176d218889esm2272516plk.228.2022.09.27.18.41.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 18:41:23 -0700 (PDT)
From: yexingchen116@gmail.com
X-Google-Original-From: ye.xingchen@zte.com.cn
To: jingoohan1@gmail.com
Subject: [PATCH linux-next v2] backlight: use sysfs_emit() to instead of
 scnprintf()
Date: Wed, 28 Sep 2022 01:41:15 +0000
Message-Id: <20220928014115.261470-1-ye.xingchen@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 28 Sep 2022 06:30:59 +0000
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
Cc: daniel.thompson@linaro.org, ye xingchen <ye.xingchen@zte.com.cn>,
 deller@gmx.de, lee@kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: ye xingchen <ye.xingchen@zte.com.cn>

Replace the open-code with sysfs_emit() to simplify the code.

Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>
---
v1 -> v2
Add the rest of this fixes for this pattern in the 'drivers/video/backlight' directory.
 drivers/video/backlight/lm3533_bl.c | 10 +++++-----
 drivers/video/backlight/lp855x_bl.c |  4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/video/backlight/lm3533_bl.c b/drivers/video/backlight/lm3533_bl.c
index 1df1b6643c0b..5e2ce9285245 100644
--- a/drivers/video/backlight/lm3533_bl.c
+++ b/drivers/video/backlight/lm3533_bl.c
@@ -66,7 +66,7 @@ static ssize_t show_id(struct device *dev,
 {
 	struct lm3533_bl *bl = dev_get_drvdata(dev);
 
-	return scnprintf(buf, PAGE_SIZE, "%d\n", bl->id);
+	return sysfs_emit(buf, "%d\n", bl->id);
 }
 
 static ssize_t show_als_channel(struct device *dev,
@@ -75,7 +75,7 @@ static ssize_t show_als_channel(struct device *dev,
 	struct lm3533_bl *bl = dev_get_drvdata(dev);
 	unsigned channel = lm3533_bl_get_ctrlbank_id(bl);
 
-	return scnprintf(buf, PAGE_SIZE, "%u\n", channel);
+	return sysfs_emit(buf, "%u\n", channel);
 }
 
 static ssize_t show_als_en(struct device *dev,
@@ -95,7 +95,7 @@ static ssize_t show_als_en(struct device *dev,
 	mask = 1 << (2 * ctrlbank);
 	enable = val & mask;
 
-	return scnprintf(buf, PAGE_SIZE, "%d\n", enable);
+	return sysfs_emit(buf, "%d\n", enable);
 }
 
 static ssize_t store_als_en(struct device *dev,
@@ -147,7 +147,7 @@ static ssize_t show_linear(struct device *dev,
 	else
 		linear = 0;
 
-	return scnprintf(buf, PAGE_SIZE, "%x\n", linear);
+	return sysfs_emit(buf, "%x\n", linear);
 }
 
 static ssize_t store_linear(struct device *dev,
@@ -190,7 +190,7 @@ static ssize_t show_pwm(struct device *dev,
 	if (ret)
 		return ret;
 
-	return scnprintf(buf, PAGE_SIZE, "%u\n", val);
+	return sysfs_emit(buf, "%u\n", val);
 }
 
 static ssize_t store_pwm(struct device *dev,
diff --git a/drivers/video/backlight/lp855x_bl.c b/drivers/video/backlight/lp855x_bl.c
index bd0bdeae23a4..fafc1a9e76ef 100644
--- a/drivers/video/backlight/lp855x_bl.c
+++ b/drivers/video/backlight/lp855x_bl.c
@@ -293,7 +293,7 @@ static ssize_t lp855x_get_chip_id(struct device *dev,
 {
 	struct lp855x *lp = dev_get_drvdata(dev);
 
-	return scnprintf(buf, PAGE_SIZE, "%s\n", lp->chipname);
+	return sysfs_emit(buf, "%s\n", lp->chipname);
 }
 
 static ssize_t lp855x_get_bl_ctl_mode(struct device *dev,
@@ -307,7 +307,7 @@ static ssize_t lp855x_get_bl_ctl_mode(struct device *dev,
 	else if (lp->mode == REGISTER_BASED)
 		strmode = "register based";
 
-	return scnprintf(buf, PAGE_SIZE, "%s\n", strmode);
+	return sysfs_emit(buf, "%s\n", strmode);
 }
 
 static DEVICE_ATTR(chip_id, S_IRUGO, lp855x_get_chip_id, NULL);
-- 
2.25.1


