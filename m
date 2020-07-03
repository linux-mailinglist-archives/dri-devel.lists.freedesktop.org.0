Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6B3213F9B
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jul 2020 20:46:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 315596EBA9;
	Fri,  3 Jul 2020 18:46:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7ABF6EBA9
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jul 2020 18:46:41 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id z24so13181678ljn.8
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jul 2020 11:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0lVGBtlKGV7mdea3qCpDAmIlkL+A1oTLOm9ndlSKSYE=;
 b=ZIwE1w1Ghx/3tjTG+wWLdg1TLz4DCo7E7vGxFhkIbmVtSA4a3WjTgV2QLaq4v6iYPs
 rJH2NSWw4cwTu6I109t15wwb+yZDIG2EE2PGAZB32JlOO2Z6y5DM6qQDP4tecxbnFmWw
 1u8su0FG/qdwH/YNq8J+hQNaQkKjlxkQ0uuwySNCYmXbXsZtsbzDBfPBRI+7cG5ZLEsQ
 0B0Gxz9/XyRl2XSFGkC194VTypSXzD+TJbgUrJHvHddFMEY6naI7207I4hsezHVN5phY
 CsYcfAD9A1rBYyCIgJ24hn7Ge0Ngc8uilgeIvtZ5v3JpDtZDCT6ch4vQaLc5yYtJJyRt
 5f7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=0lVGBtlKGV7mdea3qCpDAmIlkL+A1oTLOm9ndlSKSYE=;
 b=rDx6O33IpgTXOGcfJVnf/s6NkMQkgSpna0C8ELfh2mOadQzy81Xrb6icmqvXRw0yQd
 gvEMMECkSd+rOPQqmDYyGZhC7zoyw63JaLPX34uGzAV1sY8pwkZRbXlQoBwUk0iNFeFG
 JwCtkQqQgXuxv9EhWpcwkufceNCHvdkLL9jreBtjfTWt6KHQ8wOIGnXq7qsKUXG+r3du
 /uQlAoBnC34Z8pAgfYY6VKiCU4Xa78cxsCayEbiYJbrkeXVg1Qu5jqMMxBRupu6v/I4Y
 clCYuUxDXS4JS0sk0EMiwgy0EeOrYMivRYBFB9m6YMz2aNYxe4Aeq8I9KlwMsQiPA4Zr
 0Alg==
X-Gm-Message-State: AOAM530O5Bh8NL+vD+dSkGPDFuiypRg7xYGwufW9yukZWeR2w6ezsfRL
 TcxWG1iB8xYYKr1RgpznAaS2/NElzPc=
X-Google-Smtp-Source: ABdhPJyj54hLQtM3LIea5xG6yd7fVGh0vAlECmdYKX5F8gkkwLsjofvTh3sUVDiGYYetSfgISEkpmA==
X-Received: by 2002:a2e:161a:: with SMTP id w26mr20539700ljd.216.1593802000116; 
 Fri, 03 Jul 2020 11:46:40 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:4025:a614:1d5c:b7bc])
 by smtp.gmail.com with ESMTPSA id h22sm4404224ljg.1.2020.07.03.11.46.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2020 11:46:39 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>
Subject: [PATCH v4 18/20] backlight: drop backlight_put()
Date: Fri,  3 Jul 2020 20:45:44 +0200
Message-Id: <20200703184546.144664-19-sam@ravnborg.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200703184546.144664-1-sam@ravnborg.org>
References: <20200703184546.144664-1-sam@ravnborg.org>
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
index db8717581ec5..099023771ab1 100644
--- a/drivers/video/backlight/backlight.c
+++ b/drivers/video/backlight/backlight.c
@@ -717,7 +717,10 @@ EXPORT_SYMBOL(of_find_backlight);
 
 static void devm_backlight_release(void *data)
 {
-	backlight_put(data);
+	struct backlight_device *bd = data;
+
+	if (bd)
+		put_device(&bd->dev);
 }
 
 /**
@@ -745,7 +748,7 @@ struct backlight_device *devm_of_find_backlight(struct device *dev)
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
