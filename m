Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F86235668
	for <lists+dri-devel@lfdr.de>; Sun,  2 Aug 2020 13:07:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76CA86E0D9;
	Sun,  2 Aug 2020 11:07:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15F086E0D9
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Aug 2020 11:07:18 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id v12so6418988ljc.10
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Aug 2020 04:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KTJ8uxV3WquOUcHPbCnxyHcQi2FFRz5Sb+rp++5jhyg=;
 b=mpxm2jqfCGKeJIE1ljG8cnxrGe61FYQWjSQopFRGgAb+Zi0nUaKL6P0Jpu+rQMAoa3
 2T6LSHnj2632PvXX1dg4Em9clcrmCFcJh8AES0NaD1f4ATiUBUASjFWH26zZc74ctnr/
 PXwy+3jDyHGY9YbMbuRWEW4Ufz8H5tmvCr0V0zT9PhzRjiryNtWdM4UEOv6eNRDyIi7I
 udUMA9S4YQjTz8cQMFmxbYNSucpxRaDxqz+YKvfkFToukYD7wIdvkdVLw9ozQRooDYd7
 C0Hfi8IFoUYnvyVYFN3faozhnrf46RSWbgNPXB024KrBsgGqNiOM59m4fDE74eV+DgoJ
 Jnww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=KTJ8uxV3WquOUcHPbCnxyHcQi2FFRz5Sb+rp++5jhyg=;
 b=CLcZCZdPGAn7lTo0gHO0ByfWZvIcnUmclYfegj+JmPi2RRmxY+iDS7SSv9jQ1yxPOC
 X5vOcIbh6VfxOrxJEtGGVpt4YcFYYIH8Z34UOWqiABSgwZ1trMpUNIA0tI4FllFC37eW
 adnD+r7AAa8WZzJBtXsGxlrQtBP7w8FwGm3VF1xm39QcLm99UI9FDeFAI/YqIqZcoY2v
 piOmkpCyg5dMs8L+5AsZHLRngkVz9J05B69F0WaQZOTyeHbjBhvIPIUs+KVJJ+CcTPUe
 48mzob/c+Sk4aw0blI5zaY0QJ6wq6cU0Q1QgVEMNGy7os/6z729yC72yFuQTpf2UjJA0
 GtbQ==
X-Gm-Message-State: AOAM533gX5ArX4a9vsPI1dNrYuw1L9jL601B2V1uyFC78dBHbjHLCM9n
 ybh7QROMOj8FqTvR2UKtTPhPtLtO5Og=
X-Google-Smtp-Source: ABdhPJwJVjNIBFW+hgEvWFE0zZEE4LFh/EvbBVAfC0U9dPjeiawGquhvpHO+7c2D0MLWsjBJ+3Q64A==
X-Received: by 2002:a05:651c:231:: with SMTP id
 z17mr517906ljn.109.1596366436206; 
 Sun, 02 Aug 2020 04:07:16 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:b9d6:7e3c:5453:a61c])
 by smtp.gmail.com with ESMTPSA id l3sm3045520lji.115.2020.08.02.04.07.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Aug 2020 04:07:15 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>
Subject: [PATCH v1 03/22] backlight: Add get/set operations for
 brightness/power properties
Date: Sun,  2 Aug 2020 13:06:17 +0200
Message-Id: <20200802110636.1018743-4-sam@ravnborg.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200802110636.1018743-1-sam@ravnborg.org>
References: <20200802110636.1018743-1-sam@ravnborg.org>
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

Add get and set operations to incapsualte access to backlight properties.

One easy win is that the get/set operatiosn can be used when backlight
is not included in the configuration, resulting in simpler code with
less ifdef's and thus more readable code.

The set/get methods hides some of the confusing power states, limiting
the power state to either ON or OFF for the drivers.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Jingoo Han <jingoohan1@gmail.com>
---
 include/linux/backlight.h | 72 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/include/linux/backlight.h b/include/linux/backlight.h
index d683c053ec09..882ceea45ace 100644
--- a/include/linux/backlight.h
+++ b/include/linux/backlight.h
@@ -474,6 +474,78 @@ static inline int backlight_get_brightness(const struct backlight_device *bd)
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
+ * backlight_set_power_on - Set power state to ON.
+ *
+ * This helper operation is preferred over direct assignment to
+ * backlight_properties.power.
+ *
+ * If backlight_device is NULL then silently exit.
+ */
+static inline void backlight_set_power_on(struct backlight_device *bd)
+{
+	if (bd)
+		bd->props.power = FB_BLANK_UNBLANK;
+}
+
+/**
+ * backlight_set_power_off - Set power state to OFF.
+ *
+ * This helper operation is preferred over direct assignment to
+ * backlight_properties.power.
+ *
+ * If backlight_device is NULL then silently exit.
+ */
+static inline void backlight_set_power_off(struct backlight_device *bd)
+{
+	if (bd)
+		bd->props.power = FB_BLANK_POWERDOWN;
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
