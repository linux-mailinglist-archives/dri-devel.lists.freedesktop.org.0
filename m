Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD72F462EC8
	for <lists+dri-devel@lfdr.de>; Tue, 30 Nov 2021 09:46:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8C1C6EE14;
	Tue, 30 Nov 2021 08:46:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61B816E303
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 00:05:21 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 j6-20020a17090a588600b001a78a5ce46aso16917066pji.0
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Nov 2021 16:05:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wkjZyN1c2Y9GQc80h4xdKR14ovJk4gf09rJILRmjtTU=;
 b=Ub/o3b66eoqONKeNJPi0CUuJknTbGXftG779TZbCg9Nki8v/P9X5jP9FvdbrtAKqXs
 Ih+9NneVY5oZST2rk3xDbqkeUlc4IyqQLDaslvJlOMkYtvuxXHuA4GKrKoXCxu1MD3xc
 fTB1VpxvkMet8h8Yq28v4+jSeFaBpqUkc9kdSLbMLS78wBauj4exbIXMv/1yv7g9WKWX
 YMi0ZagFfBRVQOwFvxKvkPTBUkqS9YubHBPU8zoJLf5asQM3C1qX0XgWCSBVNWs5BRky
 3I54oyTnUVM0hQBmVjedzAFFjsE76KVSQX7FNRSLsGU9iBeOIAOw4u2hyO9c3avloh4v
 av1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wkjZyN1c2Y9GQc80h4xdKR14ovJk4gf09rJILRmjtTU=;
 b=x/m//0ZV0DyoF1+XnGR94B3Q4mKXvKGU/z0un56ZBchJ4PwGW6EQP0RY1lwxewtLvX
 d2G2x/qH78jz0Ers8I13eTetXBy6BYI6MJoydsKTk0yb3k789n+Pd3ZEduFflYN9GKki
 /5zEI0xSXdoGxB4xZILtK5O8yKWIyzCoBrIDvlGU3/TiWIamaxYKZAgoh6gy9g0OfJsl
 sE+EMqlZgPphPhDDe7wSL2qFyzMe8uZwjkNAAUzi80sWv9lzeHK0V5pEOUaLupyF7RuH
 aSIO94XNUbwySrRzR9acZ5G0UbwP6mcFSHo0bHI9AaCBd6Ba9EXoMl7zR/JTtv0qCN1p
 MbcQ==
X-Gm-Message-State: AOAM530SAQx/i66uoeoa7hHGdVMeQJcP7qODL+RgywFSmcLhUOmkfPV8
 vnm/8gmZoO9h3WN6JyUB7Nc=
X-Google-Smtp-Source: ABdhPJwbgQDyoddUomQxlAnMDmC3A6cZb4Y//MC0zyw0PYbnZNXnkemRJbearZQHIbRmSYRk+IoUrA==
X-Received: by 2002:a17:90a:ba13:: with SMTP id
 s19mr1687317pjr.62.1638230720938; 
 Mon, 29 Nov 2021 16:05:20 -0800 (PST)
Received: from debian11-dev-61.localdomain (192.243.120.180.16clouds.com.
 [192.243.120.180])
 by smtp.gmail.com with ESMTPSA id k1sm19543223pfu.31.2021.11.29.16.05.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 16:05:20 -0800 (PST)
From: davidcomponentone@gmail.com
X-Google-Original-From: yang.guang5@zte.com.cn
To: ducheng2@gmail.com
Subject: [PATCH] fbdev: replace snprintf in show functions with sysfs_emit
Date: Tue, 30 Nov 2021 08:05:08 +0800
Message-Id: <0cb7ca73d9cd7162988a22a24cd18bbcd3d8bb27.1638156341.git.yang.guang5@zte.com.cn>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 30 Nov 2021 08:46:17 +0000
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
Cc: linux-fbdev@vger.kernel.org, penguin-kernel@I-love.SAKURA.ne.jp,
 gregkh@linuxfoundation.org, Zeal Robot <zealci@zte.com.cn>,
 davidcomponentone@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, yang.guang5@zte.com.cn, cssk@net-c.es,
 tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Yang Guang <yang.guang5@zte.com.cn>

coccinelle report:
./drivers/video/fbdev/core/fbcon.c:2680:8-16:
WARNING: use scnprintf or sprintf
./drivers/video/fbdev/core/fbcon.c:2655:8-16:
WARNING: use scnprintf or sprintf

Use sysfs_emit instead of scnprintf or sprintf makes more sense.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Yang Guang <yang.guang5@zte.com.cn>
---
 drivers/video/fbdev/core/fbcon.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index 99ecd9a6d844..b4234ec2f047 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -2652,7 +2652,7 @@ static ssize_t show_rotate(struct device *device,
 	rotate = fbcon_get_rotate(info);
 err:
 	console_unlock();
-	return snprintf(buf, PAGE_SIZE, "%d\n", rotate);
+	return sysfs_emit(buf, "%d\n", rotate);
 }
 
 static ssize_t show_cursor_blink(struct device *device,
@@ -2677,7 +2677,7 @@ static ssize_t show_cursor_blink(struct device *device,
 	blink = (ops->flags & FBCON_FLAGS_CURSOR_TIMER) ? 1 : 0;
 err:
 	console_unlock();
-	return snprintf(buf, PAGE_SIZE, "%d\n", blink);
+	return sysfs_emit(buf, "%d\n", blink);
 }
 
 static ssize_t store_cursor_blink(struct device *device,
-- 
2.30.2

