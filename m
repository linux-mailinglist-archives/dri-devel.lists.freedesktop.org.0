Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC291D6C0D
	for <lists+dri-devel@lfdr.de>; Sun, 17 May 2020 21:02:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D78A86E118;
	Sun, 17 May 2020 19:02:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A529A6E118
 for <dri-devel@lists.freedesktop.org>; Sun, 17 May 2020 19:02:26 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id e125so5330790lfd.1
 for <dri-devel@lists.freedesktop.org>; Sun, 17 May 2020 12:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v8t7YeGruxta805OuVbRHUY0bPcsh9G6lLY/6w/o8Gc=;
 b=C8VbvOdph2/j2pwoQ7DsiImXfPNKAT0eHHEvwLzuP+9MN1VKrkgEuil2zrpn2ugsTO
 9DpnlwmDppjg+shy1eIsgV/K3OfqI490AVv9bRXedvAyLVRkjxBJQvemDOuno4ZKkrmP
 nRx3NJtXmuxFv6zNZcgjvUSCFuEf9pRGOrZNQwf2qkpPTWMFd7o9saUq7pkeD4ewzzSV
 ZW53n2BTfBGY0Fs4l1y1a4vKRGh+lYs3QhD4R5wlYjJpeSEQZSeMYKeykNIFUAIX/VNH
 LpPMFgvd4wF3DrKJopwG8dZotminQkZaZBJGLOInx3Ml/GBkUycLPPvJ9C0M+5faE4gY
 lnyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=v8t7YeGruxta805OuVbRHUY0bPcsh9G6lLY/6w/o8Gc=;
 b=dJsVAHASjU+xQv3hBeHTEfl9q++3zBuDdWZr6L6OJR19nHOSKOCV+KPKEK0UP9qqLJ
 HoNVQWaNwHPPTYUmvProEOyEFfxh/1Y/ajDmWzG73cyRXxwyUtYu/lfW6/uHSLPOrWuI
 u9t0woNsqXusIEqO2PZ6b2EsBTGbTATFlDKtB+Pb0oRp4owSapaD/O45houI3usHh2QJ
 g0MrZCy9dUxeajU0EbxhQjjwwyWLu40qbpo4Ogw4FsxdrzkjPiYRzgAa5E+3ueEHeEpF
 mawTCFQ0TUEh++WhZy/At/OaSJMcxGFWlEU0lD3haIzoSL7l+Fw4Ful2YpOYjZlzb2/7
 IyjQ==
X-Gm-Message-State: AOAM531H2s4Nq1FiaNnhWaHV/2qpg+c4d67v9piISaG33Gg+75UDg/ti
 S4AnN00J4XzsRMwP5ixs9EFT23ENMmQ=
X-Google-Smtp-Source: ABdhPJyo7uKvJpS51OtRduL77hMqwfbmMZUhY+3vQN+6QeXWWoevpMa889Y4H9Ca9cw+C8DjnD+zqg==
X-Received: by 2002:a19:ee19:: with SMTP id g25mr9231869lfb.124.1589742144801; 
 Sun, 17 May 2020 12:02:24 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:5d55:b3eb:397b:9086])
 by smtp.gmail.com with ESMTPSA id t20sm3282535lfl.17.2020.05.17.12.02.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 May 2020 12:02:24 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH v2 14/16] backlight: drop backlight_put()
Date: Sun, 17 May 2020 21:01:37 +0200
Message-Id: <20200517190139.740249-15-sam@ravnborg.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200517190139.740249-1-sam@ravnborg.org>
References: <20200517190139.740249-1-sam@ravnborg.org>
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
 Jonathan Corbet <corbet@lwn.net>, Douglas Anderson <dianders@chromium.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Jani Nikula <jani.nikula@intel.com>, Andy Gross <agross@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>, Sam Ravnborg <sam@ravnborg.org>,
 patches@opensource.cirrus.com,
 Uwe Kleine-Konig <u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are no external users of backlight_put().
Drop it and open code the two users in backlight.c.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Jingoo Han <jingoohan1@gmail.com>
---
 drivers/video/backlight/backlight.c |  7 +++++--
 include/linux/backlight.h           | 10 ----------
 2 files changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/video/backlight/backlight.c b/drivers/video/backlight/backlight.c
index e23b09d03a65..7f3eecaf8317 100644
--- a/drivers/video/backlight/backlight.c
+++ b/drivers/video/backlight/backlight.c
@@ -679,7 +679,10 @@ static struct backlight_device *of_find_backlight(struct device *dev)
 
 static void devm_backlight_release(void *data)
 {
-	backlight_put(data);
+	struct backlight_device *bd = data;
+
+	if (bd)
+		put_device(&bd->dev);
 }
 
 /**
@@ -707,7 +710,7 @@ struct backlight_device *devm_of_find_backlight(struct device *dev)
 		return bd;
 	ret = devm_add_action(dev, devm_backlight_release, bd);
 	if (ret) {
-		backlight_put(bd);
+		put_device(&bd->dev);
 		return ERR_PTR(ret);
 	}
 	return bd;
diff --git a/include/linux/backlight.h b/include/linux/backlight.h
index 99e7cdace2be..d92e523650ec 100644
--- a/include/linux/backlight.h
+++ b/include/linux/backlight.h
@@ -415,16 +415,6 @@ static inline int backlight_disable(struct backlight_device *bd)
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
