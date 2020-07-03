Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3BF9213F8A
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jul 2020 20:46:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5071A6EBA3;
	Fri,  3 Jul 2020 18:46:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AD866EBA3
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jul 2020 18:46:29 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id z24so13181062ljn.8
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jul 2020 11:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=41qjmVVsRfujBfZE1W4YGhZi8CncNw8be02IRMyut3M=;
 b=VfpVPRzwwuFqCZ7fUPqVLOJvQKni550zzdLt2nGP8ambnSmBuqZNmOwpBEqZSOYgiD
 Q8wotiZqUwhzppC46a/R6RJQVIy7x8V/SdEntazBT6CNGvhWmpE2akVXz/zMHxEbC9yA
 a9gkAs2F+BBPUJGjxNT5WQUtL3nBRueVyIms0y1cIvPnm33wMSk7Vhv+HBLL5NmNQ+u5
 HZ/F7cbQJxWn3UWnV1oGF5R3idD8JquldlJz/TRhX89eih5/9rBJi7pvMpQ6m5hOG3/x
 NYiGpf8TElwWyQiw22MQIo2/FfKkB9TGrqeqLiOUUVwBT8z5aeRJEKNHK8SH/acHRmBX
 P2bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=41qjmVVsRfujBfZE1W4YGhZi8CncNw8be02IRMyut3M=;
 b=Fw0M2aa8x/V0/lda4dOFBAhVmJvkpCMPnFYxCN0Mlv9rCmFbio3yeLihGljSP0uVLX
 YGWCPfbg9F+16rqS0wxmMoSuALwlbtC2AsQhENoCtzLAJSVJCSDCSDJ4KJK9N6EcFLYn
 T4d6YYGRGj8sR1jjEzJf64T/adtf80WSnSB4mvf7ed+5M66+XnCsk1NT44WIofAA6Dzw
 W4b59UIhHfkq2vRhRB8goA6VCHCPut4zxCDXmBfE/Lax/j9gD8p0yAy3PCuzfSiNmVL8
 2FfXM9UpLy5tSy9oT1+jwQq7aYA/xW9j24wOE6SS0Q85GIXN+DmFJzXWmS1qHgQoJ4Zy
 Uu5g==
X-Gm-Message-State: AOAM532JXJBAsIMWgZ55otURZ04pMTSZjiI52jdV0hW3tN/tv+qQHm7a
 aFLfWIdKPct4B/5fGh4JqmfEGp7B2/s=
X-Google-Smtp-Source: ABdhPJzQM5YseU4FLRbGqPO9auj0rWYRuQJ6L3t2SBa1OIW6Mb98AjbEZouXoOeElwNDHjdcB1Td5w==
X-Received: by 2002:a2e:9b04:: with SMTP id u4mr21861645lji.364.1593801987598; 
 Fri, 03 Jul 2020 11:46:27 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:4025:a614:1d5c:b7bc])
 by smtp.gmail.com with ESMTPSA id h22sm4404224ljg.1.2020.07.03.11.46.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2020 11:46:27 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>
Subject: [PATCH v4 12/20] backlight: introduce backlight_get_brightness()
Date: Fri,  3 Jul 2020 20:45:38 +0200
Message-Id: <20200703184546.144664-13-sam@ravnborg.org>
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

Based on an idea from Emil Velikov <emil.l.velikov@gmail.com>
add a helper that checks backlight_is_blank() and return 0 as brightness
if display is blank or the property value if not.

This allows us to simplify the update_status() implementation
in most of the backlight drivers.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Emil Velikov <emil.l.velikov@gmail.com>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Jingoo Han <jingoohan1@gmail.com>
---
 include/linux/backlight.h | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/include/linux/backlight.h b/include/linux/backlight.h
index c6ac4cbb9ddb..38db67588b16 100644
--- a/include/linux/backlight.h
+++ b/include/linux/backlight.h
@@ -417,6 +417,25 @@ static inline bool backlight_is_blank(const struct backlight_device *bd)
 	       bd->props.state & (BL_CORE_SUSPENDED | BL_CORE_FBBLANK);
 }
 
+/**
+ * backlight_get_brightness - Returns the current brightness value
+ * @bd: the backlight device
+ *
+ * Returns the current brightness value, taking in consideration the current
+ * state. If backlight_is_blank() returns true then return 0 as brightness
+ * otherwise return the current brightness property value.
+ *
+ * Backlight drivers are expected to use this function in their update_status()
+ * operation to get the brightness value.
+ */
+static inline int backlight_get_brightness(const struct backlight_device *bd)
+{
+	if (backlight_is_blank(bd))
+		return 0;
+	else
+		return bd->props.brightness;
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
