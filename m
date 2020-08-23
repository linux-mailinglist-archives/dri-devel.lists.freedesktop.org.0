Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 561DE24ECC8
	for <lists+dri-devel@lfdr.de>; Sun, 23 Aug 2020 12:46:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63D8B6E49C;
	Sun, 23 Aug 2020 10:45:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DF1E6E497
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Aug 2020 10:45:58 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id w14so6447200ljj.4
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Aug 2020 03:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oazd1K/DiFoxSE0eXUpKTqDSP+znXZoQQbXi3awQMDA=;
 b=Rru0BjCKHKyWpAHFO2f/f2Pd8xnvFEa2pwInIvBs9THJk8ZX4NzC104gwiP0oHpv/R
 quBGebfbUApEevsHXGdCL1kcsLcIfTl2auvbDOoJktPxDOdVseUyvOPI67+EpDDZIGGS
 YgBgfcZCdVwNJ9kBOq4rLF2c+gg98kR9pNcdMUsU7DHD2DYhAchG2S2jAyq1ipnbZGZR
 5Qbpa9SHubjKdFa9Hqm1mn6NuSW4b7AGDiac5GMy1pL8IXAS0kYXeD7GGHL/wnJW/Kk+
 pisW8GDWgDGZXpVaDx1FY6YKE401bKX/UxmmF7xR00is6XfsuG8QmTtOVIenWKfR21rd
 eUdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=oazd1K/DiFoxSE0eXUpKTqDSP+znXZoQQbXi3awQMDA=;
 b=iq+Dh7sA1Av3JpTkplSvUak2RlffoP4N1h7SAEuvk19+Umrm3shwJYuPrhrhdGAtxZ
 nEHnNgGrPYS+U/QbBIFMhUKQGXlgYaj1n0Q4iszmpltIIUq6ux//8i7Lph6UTYrz1k6d
 PKtD6GdCGQSD97uVjR+6g82b7Z0mTgfJqSunnJiSzvSrbSkqfLAd9jZ9J3U9R3/aEYKf
 oD60yTVSppi179k2+EKVo/Z7QdB14tw2BxSZu4mFWJ4JdnwTyjQ1gTTFtr0pfoKtRFDA
 UQL+GHEDC5f5vPn9BIiR64ydPiuP8XC9goAUxgIhM3BGtINEUZGGGqRm/LlFJ4Y08rex
 yboA==
X-Gm-Message-State: AOAM531cdKjXiJt+0QMJJxhMYb8eKveMrDuYgGKda/aWuZAFkOmpSgPv
 xufYgw/vDrkTSJE4j7NU3/+DMYOm7+jS9A==
X-Google-Smtp-Source: ABdhPJy4J6Y/eBN3OPr+gS/QAr0i8CDOuTHuWFLiwFDo3T218w/+gtXEzS/5FVieK9P2PqM2jYpD5A==
X-Received: by 2002:a2e:9bc1:: with SMTP id w1mr396509ljj.79.1598179556272;
 Sun, 23 Aug 2020 03:45:56 -0700 (PDT)
Received: from saturn.localdomain ([2a00:fd00:805f:db00:2509:20d7:e461:9c16])
 by smtp.gmail.com with ESMTPSA id
 h13sm1516301lji.134.2020.08.23.03.45.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Aug 2020 03:45:55 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>
Subject: [PATCH v2 03/24] backlight: Add get/set operations for brightness
 properties
Date: Sun, 23 Aug 2020 12:45:11 +0200
Message-Id: <20200823104532.1024798-4-sam@ravnborg.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200823104532.1024798-1-sam@ravnborg.org>
References: <20200823104532.1024798-1-sam@ravnborg.org>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add get and set operations to incapsualte access to backlight brightness.

One easy win is that the get/set operations can be used when backlight
is not included in the configuration, resulting in simpler code with
less ifdef's and thus more readable code.

The backlight_enable_brightness() update the brightness and enable
the backlight.

The backlight_update_brightness() force the brightness update and
typical usage is to set brightness after registering a backlight device.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Jingoo Han <jingoohan1@gmail.com>
---
 include/linux/backlight.h | 74 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/include/linux/backlight.h b/include/linux/backlight.h
index 93a47a6cf681..e390444bed13 100644
--- a/include/linux/backlight.h
+++ b/include/linux/backlight.h
@@ -492,6 +492,80 @@ static inline int backlight_get_brightness(const struct backlight_device *bd)
 		return bd->props.brightness;
 }
 
+/**
+ * backlight_get_actual_brightness - Returns the actual brightness
+ *
+ * On failure a negative error code is returned.
+ */
+static inline int backlight_get_actual_brightness(struct backlight_device *bd)
+{
+	if (bd && bd->ops && bd->ops->get_brightness)
+		return bd->ops->get_brightness(bd);
+	else
+		return -EINVAL;
+}
+
+/**
+ * backlight_get_max_brightness - Returns maximum brightness
+ *
+ * This helper operation is preferred over direct access to
+ * &backlight_properties.max_brightness
+ *
+ * Returns 0 if backlight_device is NULL
+ */
+
+static inline int backlight_get_max_brightness(const struct backlight_device *bd)
+{
+	if (bd)
+		return bd->props.max_brightness;
+	else
+		return 0;
+}
+
+/**
+ * backlight_set_brightness - Set the brightness to the specified value
+ *
+ * This helper operation is preferred over direct assignment to
+ * &backlight_properties.brightness.
+ *
+ * If backlight_device is NULL then silently exit.
+ */
+static inline void backlight_set_brightness(struct backlight_device *bd, int brightness)
+{
+	if (bd)
+		bd->props.brightness = brightness;
+}
+
+/**
+ * backlight_update_brightness - Update the brightness to the specified value
+ *
+ * Update brightness and force an update.
+ *
+ * If backlight_device is NULL then silently exit.
+ */
+static inline void backlight_update_brightness(struct backlight_device *bd, int brightness)
+{
+	if (bd) {
+		bd->props.brightness = brightness;
+		backlight_update_status(bd);
+	}
+}
+
+/**
+ * backlight_enable_brightness - Enable backligt using specified brightness
+ *
+ * Enable brightness using the specified brightness.
+ *
+ * If backlight_device is NULL then silently exit.
+ */
+static inline void backlight_enable_brightness(struct backlight_device *bd, int brightness)
+{
+	if (bd) {
+		bd->props.brightness = brightness;
+		backlight_enable(bd);
+	}
+}
+
 struct backlight_device *
 backlight_device_register(const char *name, struct device *dev, void *devdata,
 			  const struct backlight_ops *ops,
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
