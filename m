Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 662D12A3E99
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 09:16:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3670E6EC0C;
	Tue,  3 Nov 2020 08:14:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6B606E12E
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 01:48:18 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id y14so12794078pfp.13
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Nov 2020 17:48:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=5EIMo7DxVzETY+pG6N2VOmD4ZlvliKSM4a22Hu2QQ48=;
 b=fXj6yVnrjATl4yzOmF8SeuWcDHokvLyDOA9gNus+5EJPaBM8nh9k6ICwimPjI3qgXf
 cKCVLcRL7aDjj6AV6zbqKGfxOUX33Uo7b9zGDhwuUwqmAppIqJG4HWKkB2At85rDQwHQ
 5hp77OXQlG2fOT5aVL+jVh865J8qiS5qIntdhjf+M9XNZWa4xwHIjtgBfLCfv6g+OHd0
 kN0EGusmYo7atm7zJLSRyW/kmVv4lk1d8ng3Cml92uRjipBzrEVhys30xFjScWrOcJod
 Ry2446Mdrpb+hb0eslvlWIwMrimH+vcfzyel7kE9XVrM7tT2qPFvu14Kj4a+l9I9a7U6
 SUrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=5EIMo7DxVzETY+pG6N2VOmD4ZlvliKSM4a22Hu2QQ48=;
 b=leVMOAPuVl8oh3p3LPgS1UJwhev/VvoGziQ5HtaikYJCMxm9uYAmzCiHCxJDuBf+98
 OOBVlaAHzNCFqTYiE5bwiMk4f5yWnAJOMeunbeoVaOWztiDIKxeygji4Yyaue/dOFT+y
 ALGmw9MnN/SMfyvHErYxndZfyYcmkIsapx2tBviaMfM8iI4ErQdii3vqBWvG9icKyl0d
 aOEHW6bvwVn9txcW1ij2LV7Alg3MUdPSTfVkXMtTP2Urk/OuxrG2X3pcpAmlxWyumIa0
 EprsP/cviNwT+cZ8Pje3vXOTuCj7JjXKJQwWqbL3Zhb9gpkvFmUa9e7UmSmtkJlMu9G6
 ybEg==
X-Gm-Message-State: AOAM533uInU69xanoeUsYkMj97BfUj6DJtLZwFihzMrECytrBW69KD2Q
 GQdc4BOQhdXBZXDX8xw03aU=
X-Google-Smtp-Source: ABdhPJymKxSyrKlw1UwO8ZciKzlDDzf+/NC9/Q0LwxMITtm/wiRcdZ591EWsFW/nphuY8npCUMQLkg==
X-Received: by 2002:a62:ce08:0:b029:156:4427:4b29 with SMTP id
 y8-20020a62ce080000b029015644274b29mr24039920pfg.70.1604368098289; 
 Mon, 02 Nov 2020 17:48:18 -0800 (PST)
Received: from localhost.localdomain ([8.210.202.142])
 by smtp.gmail.com with ESMTPSA id 22sm780144pjw.34.2020.11.02.17.48.15
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 02 Nov 2020 17:48:17 -0800 (PST)
From: Yejune Deng <yejune.deng@gmail.com>
To: robh@kernel.org, tomeu.vizoso@collabora.com, steven.price@arm.com,
 alyssa.rosenzweig@collabora.com, airlied@linux.ie, daniel@ffwll.ch,
 p.zabel@pengutronix.de
Subject: [PATCH] drm/panfrost: Replace devm_reset_control_array_get()
Date: Tue,  3 Nov 2020 09:48:02 +0800
Message-Id: <1604368082-6032-1-git-send-email-yejune.deng@gmail.com>
X-Mailer: git-send-email 1.9.1
X-Mailman-Approved-At: Tue, 03 Nov 2020 08:14:24 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 yejune.deng@gmail.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

devm_reset_control_array_get_optional_exclusive() looks more readable

Signed-off-by: Yejune Deng <yejune.deng@gmail.com>
---
 drivers/gpu/drm/panfrost/panfrost_device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
index ea8d318..1daf932 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.c
+++ b/drivers/gpu/drm/panfrost/panfrost_device.c
@@ -18,7 +18,7 @@
 
 static int panfrost_reset_init(struct panfrost_device *pfdev)
 {
-	pfdev->rstc = devm_reset_control_array_get(pfdev->dev, false, true);
+	pfdev->rstc = devm_reset_control_array_get_optional_exclusive(pfdev->dev);
 	if (IS_ERR(pfdev->rstc)) {
 		dev_err(pfdev->dev, "get reset failed %ld\n", PTR_ERR(pfdev->rstc));
 		return PTR_ERR(pfdev->rstc);
-- 
1.9.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
