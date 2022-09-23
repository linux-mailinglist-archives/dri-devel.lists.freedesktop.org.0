Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E556B5E7433
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 08:35:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5524E10E3E7;
	Fri, 23 Sep 2022 06:34:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D75810E3E7
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 06:34:53 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id u132so11508382pfc.6
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 23:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=UQbRlYeEkx+EvW1ECcexWqZC4hvj1k3E06Q4ssIUniM=;
 b=pZeBayZgzRqqeHKGwVP/zLhV7GY99/+Bnnkit9QZ3Jbm0a0nI96twXdh04slYuwkVI
 RLoFBJwWqkiR0fWmY2YHe1enxA7+/3KfdCjTljhuVy9CK5SKbUhW5pQX3EPGrE/PBYQe
 89Mb1dFLfpwSuuruq0xmgROKVRuR+HOo6hDP8LCeJYiYO9qn9xDSbpbJFTNoq/LfYTAO
 6ndDIEfrkh1VRAKhdj3zd5vd+UqyIO2N4PDOJTwSmfhwSp+YF6iDgSQezluXxJBkn9O2
 7TzhMM6gRekC93WZGUku7gRJV/oWIkMUrMySfEUUmYSQcp07n09+NBW9wqzrQBw4ZkZq
 ai6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=UQbRlYeEkx+EvW1ECcexWqZC4hvj1k3E06Q4ssIUniM=;
 b=ce6ew7W69Jvy0trOHMOYKpLYT9lCKhyqkwvKS9I0l28m580UdZK4PWNEM+WPWQLacW
 Ay/QhzRM04dzmjGh69LYX3FCCcAYXgwQ9Tq9AyK6co4d2fOC9O4s0cHOEqPvuTbsjMHR
 gB/Bh9ni07Yl2yPGj6a1aY9WMBxfj2pHqZF13XEdpBJOPwDi4ZHuD+qs6qpFaaTVBL5g
 3z8xxvv81B0McclW1kHPTWgBSYt8q0I+l0/PPq6J9pkAKsg/M2msZhJj3Knp3pi4Y+7X
 F0NbEVchAVuItXiAjn0C13lfbx9Np/1NZKV3h2GIW96Ur1Qzr7UXslzU0lfmA/JQi5Z4
 WdCQ==
X-Gm-Message-State: ACrzQf1TXZ+YMwGVaS/9TnaOKXzgxoKFe9TzZ/be0A0kbfj6v0zX8xji
 DyIkpMukfWj/8Idc3wK2WEw=
X-Google-Smtp-Source: AMsMyM5CRzhdtH3+V8kaArIX/klkE2Xbi0GRLlAgaXtkbzJ3451pCUiuDh0WtSsJV4jOxr5RczR+TQ==
X-Received: by 2002:a63:581e:0:b0:43c:29a0:6390 with SMTP id
 m30-20020a63581e000000b0043c29a06390mr3818463pgb.552.1663914893025; 
 Thu, 22 Sep 2022 23:34:53 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 y13-20020a17090a1f4d00b001fd7e56da4csm846784pjy.39.2022.09.22.23.34.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 23:34:52 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: ye.xingchen@zte.com.cn
To: lee@kernel.org
Subject: [PATCH linux-next] backlight: use sysfs_emit() to instead of
 scnprintf()
Date: Fri, 23 Sep 2022 06:34:48 +0000
Message-Id: <20220923063448.239259-1-ye.xingchen@zte.com.cn>
X-Mailer: git-send-email 2.25.1
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
Cc: daniel.thompson@linaro.org, jingoohan1@gmail.com, deller@gmx.de,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, ye xingchen <ye.xingchen@zte.com.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: ye xingchen <ye.xingchen@zte.com.cn>

Replace the open-code with sysfs_emit() to simplify the code.

Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>
---
 drivers/video/backlight/lm3533_bl.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

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
-- 
2.25.1
