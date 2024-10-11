Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB8399ACE4
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2024 21:42:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54E4210EBA7;
	Fri, 11 Oct 2024 19:42:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="fZr2z830";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9687410EBA7
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 19:42:35 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-43111cff9d3so17720455e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 12:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728675754; x=1729280554; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9H6rXUaUQHjyd2VSgKGDs+alotbQnC2p5Cn69HNYv04=;
 b=fZr2z830onO/zL1dmfRu2lEEP7oDzZm7xdT0e4Uu/hZsdFGaDFds2H/UGGQ+z3ab6S
 MTAffGlbCWJUIv0lmrHnGgMIEHPGZ/4oL0G29Pp/eGmCPs6/vKyPigHVEZ9axO97P0Qo
 KhEsqZn4j7pqEXMXYtzJy0EMM17dMh6B/WdqDJfhnGmNiIEj2dQvnQdOpvoDaUwdQBan
 tpU7rzmsIqIIKt0FhV8VKcLm0zZ1fwW5hwFv4mOgknHC9n5cfLYejdYlu/LRktdom+u/
 uaCcbN9EtpymcXXvIsBrWgGRLtSar+Z+Ku6qpOgWTNusohjctuTHM2iFdU8lpo4eWjjP
 6UJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728675754; x=1729280554;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9H6rXUaUQHjyd2VSgKGDs+alotbQnC2p5Cn69HNYv04=;
 b=LmPZcEVOzpDLL1eox15TdzviRLcFpqWilVlE2y9hmgM/8exHtnPiYQoW82UYa+fXoJ
 8vtGAhkVI8319dqFaUKton63wyfoxggqWg8g7UKQazmDLfaMrn5Ukx3KdwWeMvSXf3Po
 qvEXUms3VSq8e+jd9r87vXH31s7VYKPwsPoqfPw14oLczgdVIAu/h7unsGg1Z7G9k8IP
 sI83mg60lewmdtzs0fybU/oiwoHCQlZA307Y9WX7L5slWqZqpWIpJWBMVjrUi561jovb
 7/z5MCV0WmK1+R1e/COddMIWjnJP8hszQOs+kaQZ9DVINXRhH5xlB19A86WfqxXqWP/f
 yYGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWe/mjxImO7isR2BTPzye+sliFBRP9mekJM+Xv2oZtUa9QbLZQwSWzxjL0I6KgSMxRzIp4tRh1DU88=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyifIvr/uUJtCucyanpgy+XmaoPdBq0YeBo+yCpYNQfoqMPS7bT
 lcnKwDOhY/lmlFs/dcN0Gy0Unza7iTYegWRnjNxD52gbhrhY/zoIZ7Mz+z+4fLw=
X-Google-Smtp-Source: AGHT+IFPVVvRgJhwZiV6j4xkCfdUzrR6DGnGMYo8fZws+use+5kUvfYFQjYHJ8OsNnHP8FEbLNe+OA==
X-Received: by 2002:a5d:4d4a:0:b0:37d:4527:ba1c with SMTP id
 ffacd0b85a97d-37d5531a0a2mr2327244f8f.49.1728675753903; 
 Fri, 11 Oct 2024 12:42:33 -0700 (PDT)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37d4b79fa79sm4686059f8f.72.2024.10.11.12.42.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Oct 2024 12:42:33 -0700 (PDT)
Date: Fri, 11 Oct 2024 22:42:28 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Helge Deller <deller@gmx.de>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sekhar Nori <nsekhar@ti.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] fbdev/da8xx-fb: unlock on error paths in suspend/resume
Message-ID: <37842441-e372-40e9-b0f5-cf69defc2db5@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a missing console_unlock() in the suspend and resume functions on
the error paths.

Fixes: 611097d5daea ("fbdev: da8xx: add support for a regulator")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/video/fbdev/da8xx-fb.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/da8xx-fb.c b/drivers/video/fbdev/da8xx-fb.c
index fad1e13c6332..66ff8456b231 100644
--- a/drivers/video/fbdev/da8xx-fb.c
+++ b/drivers/video/fbdev/da8xx-fb.c
@@ -1610,8 +1610,10 @@ static int fb_suspend(struct device *dev)
 	console_lock();
 	if (par->lcd_supply) {
 		ret = regulator_disable(par->lcd_supply);
-		if (ret)
+		if (ret) {
+			console_unlock();
 			return ret;
+		}
 	}
 
 	fb_set_suspend(info, 1);
@@ -1636,8 +1638,10 @@ static int fb_resume(struct device *dev)
 
 		if (par->lcd_supply) {
 			ret = regulator_enable(par->lcd_supply);
-			if (ret)
+			if (ret) {
+				console_unlock();
 				return ret;
+			}
 		}
 	}
 
-- 
2.45.2

