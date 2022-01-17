Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC15491194
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jan 2022 23:07:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1101010FF97;
	Mon, 17 Jan 2022 22:07:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E4F710E3B5
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 15:42:32 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id b3so12560144plc.7
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 07:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BtOfUVwTLdIOXT8a0g5ckSpi7c+ofEftPzF8DVvjq7w=;
 b=DSj3EgDScSimidVnItWhtOJzPUaZYBJzmUix6/8XulxD9eh7oQ92ArhOGtIA+dm+Ii
 W1jMtwbG1VSSajJDNgj0TX7eeprVE6JObDSFVX+T2cFloG0XgLYVOVbbi0iNrWsJcWpg
 FDj83SQW5k1fff003y6ytsL6Zlqfv0aj/yq4g1aS5iSfx5R4RYxNInCcqfO/3vJuzhsX
 eVMHbV97c2I/CQmrbKnE5FnALpzl/VxqKR+2Kacp2IYF3WxIv0uikbYRoMqeHR6XHjyD
 1K/VrhxKdBY0QjB/kacXlJwBsgX+v4zVz21wU+hQV74M63c/d+TjlBxdWrP08+4DNELS
 uB6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BtOfUVwTLdIOXT8a0g5ckSpi7c+ofEftPzF8DVvjq7w=;
 b=ETjacpHiGskfn+5y2SE8f/zg1adcWB0PBvlDoyx521OpUp27bdvQSMOuH2nBJNf4Hb
 4cNQmT+F4qbuAKi2nYz+RCw6Fc8l/dj6RY+I0ROoDgX83w1pb20843V3ffQQCLF3j1T4
 fUoFL0Az9U7EO1YqiiBargzEs9IseCByG967MieHs3YX4k/i3uKeEhs5msRAOQY5ehID
 jK0N0jTnKLfh0kHyzrmS19SW/idoMkaPJmWVBro5z9llOKIBM4UYaLi52nQxRKU6xgBm
 K88C7EvkjJ9R+6vM4C4u4iYW9zesF4jseCtJBTYBAvnemueTPg3AE/hEnQLRnMO2+AxE
 vebQ==
X-Gm-Message-State: AOAM5309QVsLQOfAdrQ98mRjRqdJaiA39OJPvhkAauJXSmQAXoVhXHY1
 c7YBxLQabbgbuDYp8fWxlh0=
X-Google-Smtp-Source: ABdhPJz5G1+u67lsrh8eLZfD2KUC2fJ5ASHhWSnK4O/r6glXQvoCoXYTisCmW19QxJfNIyNqGIK3+w==
X-Received: by 2002:a17:902:9a42:b0:14a:baa1:c7ee with SMTP id
 x2-20020a1709029a4200b0014abaa1c7eemr5657642plv.58.1642434151549; 
 Mon, 17 Jan 2022 07:42:31 -0800 (PST)
Received: from localhost.localdomain (211-75-30-246.hinet-ip.hinet.net.
 [211.75.30.246])
 by smtp.gmail.com with ESMTPSA id q22sm15582949pfu.153.2022.01.17.07.42.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jan 2022 07:42:30 -0800 (PST)
From: Zhiming Liu <lzmlzmhh@gmail.com>
To: narmstrong@baylibre.com,
	robert.foss@linaro.org
Subject: [PATCH v3] drm/bridge: Remove extra device acquisition method of i2c
 client in lt9611 driver
Date: Mon, 17 Jan 2022 23:41:50 +0800
Message-Id: <20220117154150.5145-1-lzmlzmhh@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 17 Jan 2022 22:07:45 +0000
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
Cc: jernej.skrabec@gmail.com, jonas@kwiboo.se, Zhiming Liu <lzmlzmhh@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm/bridge: Remove extra device acquisition method of i2c client in lt9611 driver.

We have got the device of i2c client in probe function.So we should remove extra
device acquisition method of i2c client.

Signed-off-by: Zhiming Liu <lzmlzmhh@gmail.com>
---
 drivers/gpu/drm/bridge/lontium-lt9611.c    | 4 ++--
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index dafb1b47c15f..feb128a4557d 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -1090,7 +1090,7 @@ static int lt9611_probe(struct i2c_client *client,
 	if (!lt9611)
 		return -ENOMEM;
 
-	lt9611->dev = &client->dev;
+	lt9611->dev = dev;
 	lt9611->client = client;
 	lt9611->sleep = false;
 
@@ -1100,7 +1100,7 @@ static int lt9611_probe(struct i2c_client *client,
 		return PTR_ERR(lt9611->regmap);
 	}
 
-	ret = lt9611_parse_dt(&client->dev, lt9611);
+	ret = lt9611_parse_dt(dev, lt9611);
 	if (ret) {
 		dev_err(dev, "failed to parse device tree\n");
 		return ret;
diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
index 33f9716da0ee..3d62e6bf6892 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
@@ -860,7 +860,7 @@ static int lt9611uxc_probe(struct i2c_client *client,
 	if (!lt9611uxc)
 		return -ENOMEM;
 
-	lt9611uxc->dev = &client->dev;
+	lt9611uxc->dev = dev;
 	lt9611uxc->client = client;
 	mutex_init(&lt9611uxc->ocm_lock);
 
@@ -870,7 +870,7 @@ static int lt9611uxc_probe(struct i2c_client *client,
 		return PTR_ERR(lt9611uxc->regmap);
 	}
 
-	ret = lt9611uxc_parse_dt(&client->dev, lt9611uxc);
+	ret = lt9611uxc_parse_dt(dev, lt9611uxc);
 	if (ret) {
 		dev_err(dev, "failed to parse device tree\n");
 		return ret;
-- 
2.25.1

