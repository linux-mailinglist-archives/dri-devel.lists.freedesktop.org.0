Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E5C446085
	for <lists+dri-devel@lfdr.de>; Fri,  5 Nov 2021 09:20:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E250A6E466;
	Fri,  5 Nov 2021 08:20:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [IPv6:2607:f8b0:4864:20::829])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CEA26E466
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Nov 2021 08:20:51 +0000 (UTC)
Received: by mail-qt1-x829.google.com with SMTP id h16so6559779qtk.0
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Nov 2021 01:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JV2GI1ElyWKj5nJkvVr78bo555smaUwaPP1WNumT+bI=;
 b=hAtVwydAdMBI3HF1HcU50DSqHSm5F9VkFO3sk3cJZMZlOfHL8GE5RitgoSYteU7GJZ
 C1kdW2JclKD1V4s0SDiKp94F4KsZnBOtk6AluW1VR1YbGYngepXDaJKyJWNwVm6HnPeh
 bfjB8M9KFrSJGegaIqkEd3wLHHyJDe7+xoNMWrgZKCypcH2nDikjGZZ3Pw92/8P4t3ZK
 tiiuwyEZpru7nAAiS4pSITyI4LPw8jEBV5xnvBlh1YvFQIJExJcOUZ9nwBN13bZ/TSzL
 qTmw+FSx5zcaGxk/jv+JYZiQZ9vD2+63N2exK3N2Kum6hGLc/jPLikxm1BVkcN9AGbz2
 CLpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JV2GI1ElyWKj5nJkvVr78bo555smaUwaPP1WNumT+bI=;
 b=issGZbhqUV+LRsuFozkWYSSIIsMCk+neBYCyCkBCu9gafH+0G9nF53nCGtCowP8iia
 2oZ3/oDk8PnySLooXAg4mhjKYfiRtAsEmsPNnLZl1pr+kwGwnp6QFCv6zU3sLtr37YCE
 j62zSHQz19UCi3k+G+W5z5BfL7YUTbYcx4HYL5SMKeoSn8k+KGHgGhR95Z4oIIB6ekAS
 0ZMhqfNdgZBm47phq8VaFO2Sf0F3GP3DAh9s4hRV6JBwK7wFH8HAlvSMnJW7G8TNAbM5
 XzBdA4CFs2ZzyiFu3BmkRz8+ycbaBAao6vEofOL0nsPXHFlu5SFiWbP7SwXrSpuFrXet
 puwA==
X-Gm-Message-State: AOAM530b443NauZUeojfepfteFSRBGOzT9dr0ecBcnc745FZDkuc8BuA
 bjAR1+PIlzN9L5GUqKBOAcVzYIwQ35I=
X-Google-Smtp-Source: ABdhPJy8sNu+X2LbVDfgoGjzfow4qraNvBUGA5R/CR484AyQ83qpzjMZ61VRonVoiLf+ZJAqgSn10Q==
X-Received: by 2002:a05:622a:c5:: with SMTP id
 p5mr43146417qtw.96.1636100450840; 
 Fri, 05 Nov 2021 01:20:50 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id j192sm1791743qke.13.2021.11.05.01.20.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Nov 2021 01:20:50 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: yao.jing2@zte.com.cn
To: linux-omap@vger.kernel.org
Subject: [PATCH] omapfb: panel-tpo-td043mtea1: Replace snprintf in show
 functions with sysfs_emit
Date: Fri,  5 Nov 2021 08:20:44 +0000
Message-Id: <20211105082044.77035-1-yao.jing2@zte.com.cn>
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
 .../video/fbdev/omap2/omapfb/displays/panel-tpo-td043mtea1.c  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/displays/panel-tpo-td043mtea1.c b/drivers/video/fbdev/omap2/omapfb/displays/panel-tpo-td043mtea1.c
index afac1d9445aa..57b7d1f49096 100644
--- a/drivers/video/fbdev/omap2/omapfb/displays/panel-tpo-td043mtea1.c
+++ b/drivers/video/fbdev/omap2/omapfb/displays/panel-tpo-td043mtea1.c
@@ -169,7 +169,7 @@ static ssize_t tpo_td043_vmirror_show(struct device *dev,
 {
 	struct panel_drv_data *ddata = dev_get_drvdata(dev);
 
-	return snprintf(buf, PAGE_SIZE, "%d\n", ddata->vmirror);
+	return sysfs_emit(buf, "%d\n", ddata->vmirror);
 }
 
 static ssize_t tpo_td043_vmirror_store(struct device *dev,
@@ -199,7 +199,7 @@ static ssize_t tpo_td043_mode_show(struct device *dev,
 {
 	struct panel_drv_data *ddata = dev_get_drvdata(dev);
 
-	return snprintf(buf, PAGE_SIZE, "%d\n", ddata->mode);
+	return sysfs_emit(buf, "%d\n", ddata->mode);
 }
 
 static ssize_t tpo_td043_mode_store(struct device *dev,
-- 
2.25.1

