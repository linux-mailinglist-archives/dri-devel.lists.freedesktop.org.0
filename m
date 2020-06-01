Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB371E9E82
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jun 2020 08:52:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B515B6E072;
	Mon,  1 Jun 2020 06:52:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23A886E072
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jun 2020 06:52:22 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id s1so6785483ljo.0
 for <dri-devel@lists.freedesktop.org>; Sun, 31 May 2020 23:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=18JbutLa3sEGZU8ji80y4T0HOoe/GimoCUZDbVyKY0E=;
 b=e2Fj5MogkKmmlicpZQIOcwOKcfsndqV5JSgZlnOJPZKp5N41Qkoah2I5L+kq+0n5xH
 3wTRhIuHGWcFmhJecE6nLFQQEAgNEn0P5D72ORGOutadmzwdvFMXCoQlxfbmN+Myklzl
 rguVPFRYjbKEkUFrlPWeF5147m7T/7ELoYom48Fdu1C/F1qH4wKFR76529LX2cTBtgDz
 J5NlM9AJ/0Z7WJGmQPmbZ/x5QYxm5SBp2RdyIl0DAAuuUC7YBSK/2J2uKFoL0ntMGdnK
 dHZ/3Wy/+sVKJtZtQe2kQ67mTFb5aOlSC8FdrBm5kiY5ybts/i67pwFqK7AJm3E0cJYN
 1jfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=18JbutLa3sEGZU8ji80y4T0HOoe/GimoCUZDbVyKY0E=;
 b=oapwzuK9LK913tBGOr6iXJPHz4yxcC8SEUHyX+nIylkLDnUkPCFJgefsA2C77xEmKH
 tgV51TwVDtjbCROX6vYawxdMcofObrB2ErT95JNbJRBIdAuH7ho8gmpfiGoz2vP1qQKt
 xRRGD/y1rv4b9CPUmCG1ftvild/+OCM7ClUiXCz6KyG6HCgK3IxKtVXXMfMEiy0F/Xtr
 cv4HJyGyW5n88ykhoKNhM69iKVeRRQ3lxFZ//i3IyKAsnf2ArUl2vkGSy5IApLqGvDXX
 BZCNY5TrK1kGIFvkHhZViFIBSStlUAzvseoiiEMVqnhgt1mm2jJ/Pn0ocSQI0hf9ntIW
 F2ww==
X-Gm-Message-State: AOAM530HjPFN6XS2Bpr/rQHk9BZWGuiHoS1S+5bSjttIEqu7R1cqTnsB
 uzvQu1QzSzkE2YK65DOHEczkijDMPuE=
X-Google-Smtp-Source: ABdhPJzTmzfyLe20++Ve5cRFiyoAQagMqwFVvs32L/FlmdwyctEw1qWH+8aNS3DXRsegMEk3+htxXg==
X-Received: by 2002:a2e:4612:: with SMTP id t18mr4691823lja.212.1590994340242; 
 Sun, 31 May 2020 23:52:20 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:281d:a604:434c:a58d])
 by smtp.gmail.com with ESMTPSA id e13sm2540462ljl.117.2020.05.31.23.52.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 May 2020 23:52:19 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>
Subject: [PATCH v3 02/13] backlight: add backlight_is_blank()
Date: Mon,  1 Jun 2020 08:51:56 +0200
Message-Id: <20200601065207.492614-3-sam@ravnborg.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200601065207.492614-1-sam@ravnborg.org>
References: <20200601065207.492614-1-sam@ravnborg.org>
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

The backlight support has two properties that express the state:
- power
- state

It is un-documented and easy to get wrong.
Add backlight_is_blank() helper to make it simpler
for drivers to get the check of the state correct.

A lot of drivers also includes checks for fb_blank.
This check is redundant when the state is checked
and thus not needed in this helper function.
But added anyway to avoid introducing subtle bugs
due to the creative use of fb_blank in some drivers.
Introducing this helper will for some drivers results in
added support for fb_blank. This will be a change in
functionality, which will improve the backlight driver.

Rolling out this helper to all relevant backlight drivers
will eliminate almost all accesses to fb_blank.

v3:
  - Clarified that the fb_blank support in
    backlight_is_blank() may result in functionality
    changes for the users (Emil)

v2:
  - Added fb_blank condition (Daniel)

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Emil Velikov <emil.l.velikov@gmail.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Jingoo Han <jingoohan1@gmail.com>
---
 include/linux/backlight.h | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/include/linux/backlight.h b/include/linux/backlight.h
index c7d6b2e8c3b5..a0a083b35c47 100644
--- a/include/linux/backlight.h
+++ b/include/linux/backlight.h
@@ -175,6 +175,25 @@ static inline void backlight_put(struct backlight_device *bd)
 		put_device(&bd->dev);
 }
 
+/**
+ * backlight_is_blank - Return true if display is expected to be blank
+ * @bd: the backlight device
+ *
+ * Display is expected to be blank if any of these is true::
+ *
+ *   1) if power in not UNBLANK
+ *   2) if fb_blank is not UNBLANK
+ *   3) if state indicate BLANK or SUSPENDED
+ *
+ * Returns true if display is expected to be blank, false otherwise.
+ */
+static inline bool backlight_is_blank(struct backlight_device *bd)
+{
+	return bd->props.power != FB_BLANK_UNBLANK ||
+	       bd->props.fb_blank != FB_BLANK_UNBLANK ||
+	       bd->props.state & (BL_CORE_SUSPENDED | BL_CORE_FBBLANK);
+}
+
 extern struct backlight_device *backlight_device_register(const char *name,
 	struct device *dev, void *devdata, const struct backlight_ops *ops,
 	const struct backlight_properties *props);
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
