Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 453B7235667
	for <lists+dri-devel@lfdr.de>; Sun,  2 Aug 2020 13:07:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC4906E0D0;
	Sun,  2 Aug 2020 11:07:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF1336E0D0
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Aug 2020 11:07:16 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id s9so19043760lfs.4
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Aug 2020 04:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uZMZRu1n11N8YPz+FbCMBXq1Gp6ORykun85EU8oLu1w=;
 b=sNfefWMbczd7f+8yHrjeKgYPMeP+uFs7FWoPPpVxJBkK1r21yJtxh0I53yxm7YZpYO
 LxVbBrAe/cCAKmRMRVRLa6cgPmJtvkrY/qqIxfkNrg93RsF+cuNJ4WQyj1RJ3m38yn9D
 diLA7V9wYOQ3TKGkzsAqjb/DoraqeRTbDkfCCTCH9BE5VX+Vrtb7qxUaLSAXz3oWKYS1
 AYIcdV6NYQYSXg3VCGxMQovOrSj4H/AG/ITZa5ufNJ7di2oNkLgKWE9Q72VZ0v35vRuC
 pd4HqTO+F9id1xdvqrx+G+rwVg3snUdM5E6oUKr8HLK+qhpyUBcs1uObXnVCvwd8DYx7
 8Yxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=uZMZRu1n11N8YPz+FbCMBXq1Gp6ORykun85EU8oLu1w=;
 b=BkzrOhNB+X3hk0OM1h9gL34DBc3c17XFC/Xkjag5/eF/heq5Vg/BznEZLPZoBVsgeW
 SvGCD97gZ5E2CFVbt83C4bbheur0NY9zprfyS6UQ3JiUmVoSl8JJdve+vXJfKsjZDemH
 6Zh3g8wLl9plqmyWSt0sBhQGG6a10QMZfQjMqJFnIg3HbYFXZ4XEBDPnqe2hMFH6RY9x
 /4NiSNGyerRU4a8KjVI8AkQ9i6FzfM8vSjv1roUehj8IgrpLidbMgO+dQricVv1BajeB
 zN0fpO8Q4XVUNuNl/TK2p8Lmvk6F6kkoRO++6cDU3GdYWk1r0S7IHapKDGLvYRxC4uya
 0AJw==
X-Gm-Message-State: AOAM533JYa11qr+2coMDte7WAybsar94U1oAzpA7YeGqi2cHw82vyAcY
 97IgFUtx9qznLk8HIcvxVN53Ge8dR2Q=
X-Google-Smtp-Source: ABdhPJyXrLwKw95MOtkGYErRMETR7RvqcXEzSj7MtEJmgSiOEY5NZY8wUSaAg2lWEo7czPuoEGzygQ==
X-Received: by 2002:ac2:5e3a:: with SMTP id o26mr6097217lfg.78.1596366434991; 
 Sun, 02 Aug 2020 04:07:14 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:b9d6:7e3c:5453:a61c])
 by smtp.gmail.com with ESMTPSA id l3sm3045520lji.115.2020.08.02.04.07.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Aug 2020 04:07:14 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>
Subject: [PATCH v1 02/22] backlight: Add DECLARE_* macro for device
 registration
Date: Sun,  2 Aug 2020 13:06:16 +0200
Message-Id: <20200802110636.1018743-3-sam@ravnborg.org>
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

Device registration almost always uses a struct backlight_properties
variable to pass config info. Make it simpler and less error prone
by the introduction of a number of macros.

There is one macro for each type of backlight {firmware, platform, raw}.
All members in struct backlight_properties are initialized.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Jingoo Han <jingoohan1@gmail.com>
---
 include/linux/backlight.h | 45 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/include/linux/backlight.h b/include/linux/backlight.h
index 190963ffb7fc..d683c053ec09 100644
--- a/include/linux/backlight.h
+++ b/include/linux/backlight.h
@@ -272,6 +272,51 @@ struct backlight_properties {
 	enum backlight_scale scale;
 };
 
+#define BACKLIGHT_PROPS(_brightness, _max_brightness, _type)	\
+	.brightness = _brightness,				\
+	.max_brightness = _max_brightness,			\
+	.power = FB_BLANK_POWERDOWN,				\
+	.type = _type,						\
+	.fb_blank = 0,						\
+	.state = 0,						\
+	.scale = BACKLIGHT_SCALE_UNKNOWN,
+
+/**
+ * DECLARE_BACKLIGHT_INIT_RAW - backlight_properties to init a raw
+ *                              backlight device
+ *
+ * This macro is used to initialize backlight_properties that is used when
+ * registering a raw backlight device.
+ */
+#define DECLARE_BACKLIGHT_INIT_RAW(name, _brightness, _max_brightness)		\
+	const struct backlight_properties name = {				\
+		BACKLIGHT_PROPS(_brightness, _max_brightness, BACKLIGHT_RAW)	\
+	}
+
+/**
+ * DECLARE_BACKLIGHT_INIT_PLATFORM - backlight_properties to init a platform
+ *                                   backlight device
+ *
+ * This macro is used to initialize backlight_properties that is used when
+ * registering a platform backlight device.
+ */
+#define DECLARE_BACKLIGHT_INIT_PLATFORM(name, _brightness, _max_brightness)		\
+	const struct backlight_properties name = {					\
+		BACKLIGHT_PROPS(_brightness, _max_brightness, BACKLIGHT_PLATFORM)	\
+	}
+
+/**
+ * DECLARE_BACKLIGHT_INIT_FIRMWARE - backlight_properties to init a firmware
+ *                                   backlight device
+ *
+ * This macro is used to initialize backlight_properties that is used when
+ * registering a firmware backlight device.
+ */
+#define DECLARE_BACKLIGHT_INIT_FIRMWARE(name, _brightness, _max_brightness)		\
+	const struct backlight_properties name = {					\
+		BACKLIGHT_PROPS(_brightness, _max_brightness, BACKLIGHT_FIRMWARE)	\
+	}
+
 /**
  * struct backlight_device - backlight device data
  *
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
