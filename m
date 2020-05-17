Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB6D21D6BF0
	for <lists+dri-devel@lfdr.de>; Sun, 17 May 2020 21:02:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E4776E0F0;
	Sun, 17 May 2020 19:01:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E4116E0F0
 for <dri-devel@lists.freedesktop.org>; Sun, 17 May 2020 19:01:57 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id a4so6085036lfh.12
 for <dri-devel@lists.freedesktop.org>; Sun, 17 May 2020 12:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qdUWGmoPechd3oTgEgd4ji1RiSP4wLSttPnRYm7mOf8=;
 b=AQIZP9wNKtpqZPp7o5/1bx3Ejx43EMIA5uNG1cn8dcJJ0TuVkpZukGXTQEvZbQblmN
 weJ/ls2F+p+y8NzKtQz8TsHmQivN+m+c1ENLCa2O9Xp0tR2p16VJR8nHAEO1ZgP/fRhS
 /UNLEvYKhBbvLHGJFMG3XrQHQB8qGXlEBaDDj5UQkDDsp6bdejtJjWTUfjV3YG3xJFWU
 12qbZfuyHyRcOWTDYO025WVy+Pw1pyniZsxO1g/fSJs50ufsybpHysu8WMQ/f4NhxGTd
 exZN2AV7T7Gx2qmSfUeWmfUik/3It4XUoHoYhyA4jAwtD0tWxEIqlXBt1vf13Rimod+a
 tiOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=qdUWGmoPechd3oTgEgd4ji1RiSP4wLSttPnRYm7mOf8=;
 b=sxRFMH/uMK3VV03l+gOU/0oiOk3ySqptdZT6UCqmFHKjGTKsbeEUoYdPiOHOfM02/R
 Kw3urC2zK372xDHgfnpKWYgfQmLo9Rewxl9yyEKN55AmxZzvn5PQCPyovmf6rjX/DdLl
 3Sql1MHfamnIJ1Rgjdp5YbSUykRProRsfUyN2DCidQ9W01+JLfeBAmZZuey7W7OG36FF
 ++Pp2oIgIdvm6B5ujDDUSSyEsG6Xj+dxUgisRpKbZ7ku6Lyw6qQU6XpvBA7Hto7iYEEa
 J9H8J+Jk/edRxhj9rMYppidmmiIxwN8mkLA1n0K6VimVYnZbJ4VZM6TEimw2sqcKEAIw
 68RQ==
X-Gm-Message-State: AOAM531UAi8lZb8vHrIzoId6DWJ3wcUlvVEGshiFhFe2oXGNXNO4Jjwm
 K4mXn3VdAlKYblq8WutXm9hyfWHP/wk=
X-Google-Smtp-Source: ABdhPJwgFShcA04YlNT67vxlMevlvo9ORmiZZnKO32yhlGqrtbcAipVRWTl5RVfOmkpzs7i/B6hHsA==
X-Received: by 2002:ac2:5de6:: with SMTP id z6mr8903150lfq.18.1589742115122;
 Sun, 17 May 2020 12:01:55 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:5d55:b3eb:397b:9086])
 by smtp.gmail.com with ESMTPSA id t20sm3282535lfl.17.2020.05.17.12.01.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 May 2020 12:01:54 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH v2 03/16] backlight: add backlight_is_blank()
Date: Sun, 17 May 2020 21:01:26 +0200
Message-Id: <20200517190139.740249-4-sam@ravnborg.org>
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

The backlight support has two properties that express the state:
- power
- state

It is un-documented and easy to get wrong.
Add backlight_is_blank() helper to make it simpler for drivers
to get the check of the state correct.

A lot of drivers also includes checks for fb_blank.
This check is redundant when the state is checked
and thus not needed in this helper function.
But added anyway to avoid introducing subtle bug
due to the creative use in some drivers.

Rolling out this helper to all relevant backlight drivers
will eliminate almost all accesses to fb_blank.

v2:
  - Added fb_blank condition (Daniel)

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
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
