Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DDA21D3C16
	for <lists+dri-devel@lfdr.de>; Thu, 14 May 2020 21:10:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C15B6EBAD;
	Thu, 14 May 2020 19:10:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC2E46EBAC
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 19:10:26 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id u15so4786616ljd.3
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 12:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JXcb5fvumjPwkXBdjr17g9fCe8HBhpUDprGnSWssRKA=;
 b=IDmHNpwe6d3mPVdhTHpjxh9kKdZR9F1sadb+SsnmpGwzd0wlt8H44GHCqgfXMvpDGx
 4fuyt72GdGn2OX5tNFsT5tkuNdTfT+7qSnfT08Udhz0dG52v0Gu7ixWZ2hqMj48BJbNA
 Zo0HY0D/+VFd2Wl1LKiVLUUKLaQpXoVPbzvq0q9OXNu7osS99tmo6Q7LwamfmruYgYhv
 YE+ugRnJJL/cC9iu86uwASoZS9tbauk0UqFGW9pCH5xgufkbi9Blb/r8s4Xt1z2TyPqZ
 C2NbdYCdTQ5ded9Yqx0AVyeB024sJTrxK3n97kF4UV8ZJVx6kjq1DShfT4W3lYQQFeke
 iDFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=JXcb5fvumjPwkXBdjr17g9fCe8HBhpUDprGnSWssRKA=;
 b=ekiyPRFoZ8jqNCV+gki2E2ftYiwXu1LtJOuQcnF713Xemyfj0Ds3yF2lOs61qfiumK
 YYdbEzFt4JyoyXVZ9uNhJhYTL7LVyRUDdPQBEBPdozXuJbISeO0gNgNTTyLdNbDYmrpa
 1hibmGORcSQ7WJTfz3ZvADr342qoHCOYA7a49nysQAHcF2aeV+kNiYsggvioj0CQrMpk
 nIhtWX0ZjrOYPPz8wQJqXpqWWclRk3qkheB8Bsa75LRo0nLKgUQOYD5GdGruxD3+47i3
 pSl+HINhL2iRmlRq2GDqisXQvH5t8oCv1tiU7+/YLmZqJmnLcb42l53uTY4JDPRY10Mb
 XFpw==
X-Gm-Message-State: AOAM531ezDMbTL6ulP4NrCiVyle+trEbeyH1cgoC4k5w5Dt/hy4VMAtc
 Shg2o+aDUVk/ntCgMp2uvdAHeDsSf1azyg==
X-Google-Smtp-Source: ABdhPJwEfhzXKzDLCNWiv662wAHi0cNv35xPMR0eOeZHcYH2WYInKTWYkLQ0Ng5w3INxzAOG1XaPiQ==
X-Received: by 2002:a05:651c:97:: with SMTP id 23mr3892365ljq.17.1589483424521; 
 Thu, 14 May 2020 12:10:24 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:8d23:71d:e677:1c7c])
 by smtp.gmail.com with ESMTPSA id q30sm2362958lfd.32.2020.05.14.12.10.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 May 2020 12:10:23 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>
Subject: [PATCH v1 05/18] backlight: drop backlight_put()
Date: Thu, 14 May 2020 21:09:48 +0200
Message-Id: <20200514191001.457441-6-sam@ravnborg.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200514191001.457441-1-sam@ravnborg.org>
References: <20200514191001.457441-1-sam@ravnborg.org>
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Kefeng Wang <wangkefeng.wang@huawei.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Jonathan Corbet <corbet@lwn.net>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Russell King <linux@armlinux.org.uk>,
 Andy Gross <agross@kernel.org>,
 Uwe Kleine Konig <u.kleine-koenig@pengutronix.de>, linux-pwm@vger.kernel.org,
 Michael Hennerich <michael.hennerich@analog.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jani Nikula <jani.nikula@intel.com>, linux-arm-msm@vger.kernel.org,
 Jyri Sarha <jsarha@ti.com>, Thomas Gleixner <tglx@linutronix.de>,
 Allison Randal <allison@lohutok.net>,
 Support Opensource <support.opensource@diasemi.com>,
 patches@opensource.cirrus.com, Douglas Anderson <dianders@chromium.org>,
 Zheng Bin <zhengbin13@huawei.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Enrico Weigelt <info@metux.net>
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
index 511bb382c584..547aa3e1a03a 100644
--- a/drivers/video/backlight/backlight.c
+++ b/drivers/video/backlight/backlight.c
@@ -629,7 +629,10 @@ static struct backlight_device *of_find_backlight(struct device *dev)
 
 static void devm_backlight_release(void *data)
 {
-	backlight_put(data);
+	struct backlight_device *bd = data;
+
+	if (bd)
+		put_device(&bd->dev);
 }
 
 /**
@@ -657,7 +660,7 @@ struct backlight_device *devm_of_find_backlight(struct device *dev)
 		return bd;
 	ret = devm_add_action(dev, devm_backlight_release, bd);
 	if (ret) {
-		backlight_put(bd);
+		put_device(&bd->dev);
 		return ERR_PTR(ret);
 	}
 	return bd;
diff --git a/include/linux/backlight.h b/include/linux/backlight.h
index a0f03bb322d7..3d757a850b88 100644
--- a/include/linux/backlight.h
+++ b/include/linux/backlight.h
@@ -165,16 +165,6 @@ static inline int backlight_disable(struct backlight_device *bd)
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
 extern struct backlight_device *backlight_device_register(const char *name,
 	struct device *dev, void *devdata, const struct backlight_ops *ops,
 	const struct backlight_properties *props);
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
