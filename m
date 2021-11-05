Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5737F446077
	for <lists+dri-devel@lfdr.de>; Fri,  5 Nov 2021 09:13:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 014D56E4D7;
	Fri,  5 Nov 2021 08:13:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [IPv6:2607:f8b0:4864:20::82d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FBD96E4D7
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Nov 2021 08:13:42 +0000 (UTC)
Received: by mail-qt1-x82d.google.com with SMTP id w9so1404640qtk.13
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Nov 2021 01:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fVlZRJCKXUiqoF7G7hyUyfyk+5I40Id7HCqnbB08HMQ=;
 b=kTtDhSSUVBAaLquaHLkNCUmCFlhIfFNbkpBVUYWy/kf4GCXD82Rp+uFqFFnjosL91f
 GJet10XZfMoRgklh86ym1VJPDkjGjsl8HX25SW41/0tMoF7tQ/u+7mZIAiDz2JBPomRE
 SH5JPoqYH3/rpRIRstCz9budfZujQhFpdJ3Dij51Y0avydA/BEkM7KqUs5i2QSbIRQ6o
 qcyx0MW1AgCk+xqEvuHIcmQyVxr/sxeSVL6BV47RG+r4fB3skeUvIMu/A+Q3kjvbvwIT
 QXDGbl0dMbun5EYa1X+6PILPjL0ZZIiN6tJ5/mycAbBaQjBZYoqkcAeYin6eYSJP0Agk
 Ci2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fVlZRJCKXUiqoF7G7hyUyfyk+5I40Id7HCqnbB08HMQ=;
 b=Fh/xK6eTRLkkP/lwr9awuk95VmpO1AjYZTBbkCm8etqcyLkS9X4hy70JHNEKbUyy9z
 4WW35nqflB7BrDUydnUTBUm/Un8ZUc5nEWD6dgwMS+RvfD0xAqcVpbob1+37r5TRxKq5
 wpBqtyaOCeOP+XzISjSVcltiD6nL0SI88pIs1o9SFXm/hQ6thp5lSvKLj7zp5+aXgHOJ
 qT2GuSK5inXKE3V3KGogAsygLYL66j8Hw8pzu3g8snXNfEz9wvJk3ObuvS9UyvX8g0dJ
 /+ANXdPLI2j6NvvdZWu+5s+/9p9awpJ4OcsVne0C2ccrBMxn89AcbM625t7OBLMPEUTb
 BeUg==
X-Gm-Message-State: AOAM530aNFsNf4xbfaiOAYhDlKAY4DdgRe7miMYNCeabIPobWx1hi1RY
 E1ED3wsDKt5ATHTd52l1gFk=
X-Google-Smtp-Source: ABdhPJxUNp4kKqoDFXNGw/s5Alxe9f3i4Axux6ohHFVYJVgy0gVbIefnUP4h24e3WH9Tvqnk9m80Yg==
X-Received: by 2002:a05:622a:1705:: with SMTP id
 h5mr36744355qtk.228.1636100021385; 
 Fri, 05 Nov 2021 01:13:41 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id e10sm5428630qte.57.2021.11.05.01.13.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Nov 2021 01:13:40 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: yao.jing2@zte.com.cn
To: linux-omap@vger.kernel.org
Subject: [PATCH] omapfb: panel-dsi-cm: Replace snprintf in show functions with
 sysfs_emit
Date: Fri,  5 Nov 2021 08:13:33 +0000
Message-Id: <20211105081333.76861-1-yao.jing2@zte.com.cn>
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
Cc: linux-fbdev@vger.kernel.org, Zeal Robot <zealci@zte.com.cn>,
 dri-devel@lists.freedesktop.org, yao.jing2@zte.com.cn,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jing Yao <yao.jing2@zte.com.cn>

coccicheck complains about the use of snprintf() in sysfs show
functions:
WARNING use scnprintf or sprintf

Use sysfs_emit instead of scnprintf, snprintf or sprintf makes more
sense.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Jing Yao <yao.jing2@zte.com.cn>
---
 drivers/video/fbdev/omap2/omapfb/displays/panel-dsi-cm.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/displays/panel-dsi-cm.c b/drivers/video/fbdev/omap2/omapfb/displays/panel-dsi-cm.c
index 4b0793abdd84..a2c7c5cb1523 100644
--- a/drivers/video/fbdev/omap2/omapfb/displays/panel-dsi-cm.c
+++ b/drivers/video/fbdev/omap2/omapfb/displays/panel-dsi-cm.c
@@ -409,7 +409,7 @@ static ssize_t dsicm_num_errors_show(struct device *dev,
 	if (r)
 		return r;
 
-	return snprintf(buf, PAGE_SIZE, "%d\n", errors);
+	return sysfs_emit(buf, "%d\n", errors);
 }
 
 static ssize_t dsicm_hw_revision_show(struct device *dev,
@@ -439,7 +439,7 @@ static ssize_t dsicm_hw_revision_show(struct device *dev,
 	if (r)
 		return r;
 
-	return snprintf(buf, PAGE_SIZE, "%02x.%02x.%02x\n", id1, id2, id3);
+	return sysfs_emit(buf, "%02x.%02x.%02x\n", id1, id2, id3);
 }
 
 static ssize_t dsicm_store_ulps(struct device *dev,
@@ -487,7 +487,7 @@ static ssize_t dsicm_show_ulps(struct device *dev,
 	t = ddata->ulps_enabled;
 	mutex_unlock(&ddata->lock);
 
-	return snprintf(buf, PAGE_SIZE, "%u\n", t);
+	return sysfs_emit(buf, "%u\n", t);
 }
 
 static ssize_t dsicm_store_ulps_timeout(struct device *dev,
@@ -532,7 +532,7 @@ static ssize_t dsicm_show_ulps_timeout(struct device *dev,
 	t = ddata->ulps_timeout;
 	mutex_unlock(&ddata->lock);
 
-	return snprintf(buf, PAGE_SIZE, "%u\n", t);
+	return sysfs_emit(buf, "%u\n", t);
 }
 
 static DEVICE_ATTR(num_dsi_errors, S_IRUGO, dsicm_num_errors_show, NULL);
-- 
2.25.1

