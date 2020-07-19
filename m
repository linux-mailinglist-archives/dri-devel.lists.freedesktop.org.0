Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B56872250BB
	for <lists+dri-devel@lfdr.de>; Sun, 19 Jul 2020 10:08:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB12A6E4FB;
	Sun, 19 Jul 2020 08:08:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23E926E4F1
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Jul 2020 08:08:31 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id h19so16992909ljg.13
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Jul 2020 01:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IDEH3J4Q+Jjiu+FxPrY8mOUxDmtf7lYrk8yEJzvKVUQ=;
 b=RZVey3SWCAEostOET4Prc4fJIq//QTGR6FobtObJ+eknE0vNlYugFxPfRGJbB+hpPQ
 pydeDarW6k7WvW8ctkt8YijlV4JvsVJdk0Rl5B4fyfm+rlCoSOR0XPzSGqnOHkpNefMK
 GMbLSKAGa4iM5XuIwf7DtNwiXhOxs7XF288qZ5hnBxrg6rDCjdyCORXYeJzIcJALtMNt
 lso8g+YNyfW6jVQlxFS7Ay90BSywb70ryp4U8qHpjXy3RxuBFJgYl9Kgo9OI6GeJlUrb
 esssmPdke8kFNT6+cbQRnF8KmS3FhjXsYevkLxaA/1kFdC7pnBHf6SnFwaap8HyL/pl6
 n4uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=IDEH3J4Q+Jjiu+FxPrY8mOUxDmtf7lYrk8yEJzvKVUQ=;
 b=InOQJJjUTISr71wAkbKBjSK54758lgEnr59Vg6VHGmbwfoa7UTyGk4ysF/AQwipfmH
 YY71MZGSjnXBhqWq+whPQ45E86lcl0m1IiIGlhYlTvrKxTSFWcXWyAtuzUfSZ/L7D3/A
 /U8WvWtICYfgpSQAOsGLMG69gpzjGttdQeYRAxRHJoLy10em558c7Sc6ON+8YbM7WNZm
 3K1Ab7E57OLqiOLkzDW8eo4WpPDgQzCH9aDfQKSzKf/nMBdEqziTlakVu9lswx+cUX0P
 RNusGiLamFD6CyNYityuJxZSX9Z58d1gfsJfGOjy88zLwwGo3fcSFENbHg9i0WQiFL9z
 1JIg==
X-Gm-Message-State: AOAM532+EcAtwIZjAXroBvOUbSU8oepyQ0X5hZanSbPgasgkQAKb1a0r
 wVE83Gxv/2uWCCo0MnRuBnRKt6A6u68=
X-Google-Smtp-Source: ABdhPJx31S8uL+DzfpbblGSuB6RPYkE/DcMSsq1zq8vUzlGE1rLjv9FeAN5ewmQ6Rux/w+ehFSGw1g==
X-Received: by 2002:a2e:99d0:: with SMTP id l16mr7417620ljj.209.1595146109333; 
 Sun, 19 Jul 2020 01:08:29 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:d5fe:fe9c:fc06:b74c])
 by smtp.gmail.com with ESMTPSA id 72sm732407lfh.97.2020.07.19.01.08.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Jul 2020 01:08:28 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>
Subject: [PATCH v5 18/19] backlight: drop backlight_put()
Date: Sun, 19 Jul 2020 10:07:42 +0200
Message-Id: <20200719080743.8560-19-sam@ravnborg.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200719080743.8560-1-sam@ravnborg.org>
References: <20200719080743.8560-1-sam@ravnborg.org>
MIME-Version: 1.0
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
Cc: linux-pwm@vger.kernel.org,
 Support Opensource <support.opensource@diasemi.com>,
 Michael Hennerich <michael.hennerich@analog.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Jonathan Corbet <corbet@lwn.net>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, Andy Gross <agross@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
 Uwe Kleine-Konig <u.kleine-koenig@pengutronix.de>,
 Sam Ravnborg <sam@ravnborg.org>, patches@opensource.cirrus.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are no external users of backlight_put().
Drop it and open code the two users in backlight.c.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Jingoo Han <jingoohan1@gmail.com>
---
 drivers/video/backlight/backlight.c |  7 +++++--
 include/linux/backlight.h           | 10 ----------
 2 files changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/video/backlight/backlight.c b/drivers/video/backlight/backlight.c
index 93ae8c63fe4c..d8387c8e7112 100644
--- a/drivers/video/backlight/backlight.c
+++ b/drivers/video/backlight/backlight.c
@@ -718,7 +718,10 @@ EXPORT_SYMBOL(of_find_backlight);
 
 static void devm_backlight_release(void *data)
 {
-	backlight_put(data);
+	struct backlight_device *bd = data;
+
+	if (bd)
+		put_device(&bd->dev);
 }
 
 /**
@@ -746,7 +749,7 @@ struct backlight_device *devm_of_find_backlight(struct device *dev)
 		return bd;
 	ret = devm_add_action(dev, devm_backlight_release, bd);
 	if (ret) {
-		backlight_put(bd);
+		put_device(&bd->dev);
 		return ERR_PTR(ret);
 	}
 	return bd;
diff --git a/include/linux/backlight.h b/include/linux/backlight.h
index 38db67588b16..f3b484c99789 100644
--- a/include/linux/backlight.h
+++ b/include/linux/backlight.h
@@ -388,16 +388,6 @@ static inline int backlight_disable(struct backlight_device *bd)
 	return backlight_update_status(bd);
 }
 
-/**
- * backlight_put - Drop backlight reference
- * @bd: the backlight device to put
- */
-static inline void backlight_put(struct backlight_device *bd)
-{
-	if (bd)
-		put_device(&bd->dev);
-}
-
 /**
  * backlight_is_blank - Return true if display is expected to be blank
  * @bd: the backlight device
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
