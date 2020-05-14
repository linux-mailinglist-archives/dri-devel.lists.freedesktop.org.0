Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B69E1D3C19
	for <lists+dri-devel@lfdr.de>; Thu, 14 May 2020 21:10:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C6396EBB0;
	Thu, 14 May 2020 19:10:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26E216EBB0
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 19:10:34 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id h26so3591877lfg.6
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 12:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0CehtWkd1Er3yC2BMyIEGrFFapubFNN7PqykdJUfMHI=;
 b=eidvGM9t96XHHWfRflJPjBBF5HTlVuyDtHlLIgkQ17RztqdmJdDb5ththyU0zKGQ4m
 q54IGp7jpOWWEm13OdvzXnDuiL6IhITR4HNGgHvejHkL9tIkrhN7Z0X54Wz4mvoxxdsx
 aeAJqpmbvbvLKIKomqcMvNFzkir+eMGDIzeXf1dzcz7uCCsvmxXFsEbp2WZiy8aQ+b9K
 kofg6lfZvlrXKi16NHuuu5BviIcNsMgd5p+Jwkp8S05qoOGvqLpUUI8HJQk+WA8rDLfq
 ISHDb0p5qYN3IbCBh96bEobzdD9XWy3YRIqbt+jbVfa7Zhb0YeRGGa2Iki9z4oCC6wJe
 o6YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=0CehtWkd1Er3yC2BMyIEGrFFapubFNN7PqykdJUfMHI=;
 b=eP/de2spGDz35o2reG38ki3RRpWNOVkgLxES0xrW1TU55Lx3/Ee7dUDNG7seJr6Dlh
 Y7rnuh2xwGAAauFZxv+9qN1jth1jeDPqHS1rjK70vvaurjM/ramNF0mLUsdrHpn4K5Op
 y96sgH8TZYmKAkTyEkimpIylr4kzYjO7jz8N0cqa665pBDODOGflyPyWm6QACQpYoSCY
 FRGVgtWEYTlNmyKNcPQ8LAMySdHUjNdkC6xbRyR/qS3xettBMW6Hkp+kKmeKJ9MpgrKX
 xTwzj4a02dYNnsV6ypxBCvG/TBwTUojvPelTwjhZ0Rg+HRaZURr5pmhRsPsv+KA2v40A
 ONgw==
X-Gm-Message-State: AOAM532xx5WvBa0+wI4hdrsThB/VbrSf0zmcO9tDgTD95fI9AojCx/bU
 NJ0itXn5lvazmdG9az0jvVbNZevIQpYjBQ==
X-Google-Smtp-Source: ABdhPJzlhguokXHBb6OrRTCkI/stO8K6/VCjE7cIr/pNl4vTApu2RhD3AXVSV3P255PVDcwAxt3qMA==
X-Received: by 2002:ac2:599e:: with SMTP id w30mr3544961lfn.188.1589483432002; 
 Thu, 14 May 2020 12:10:32 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:8d23:71d:e677:1c7c])
 by smtp.gmail.com with ESMTPSA id q30sm2362958lfd.32.2020.05.14.12.10.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 May 2020 12:10:30 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>
Subject: [PATCH v1 08/18] backlight: add backlight_is_blank()
Date: Thu, 14 May 2020 21:09:51 +0200
Message-Id: <20200514191001.457441-9-sam@ravnborg.org>
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

The backlight support has two properties that express the state:
- power
- state

It is un-documented and easy to get wrong.
Add backlight_is_blank() helper to make it simpler for drivers
to get the check of the state correct.

A lot of drivers also includes checks for fb_blank.
This check is redundant when the state is checked
as thus not needed in this helper function.
Rolling out this helper to all relevant backlight drivers
will eliminate almost all accesses to fb_blank.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Jingoo Han <jingoohan1@gmail.com>
---
 include/linux/backlight.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/include/linux/backlight.h b/include/linux/backlight.h
index b7839ea9d00a..e67e926de1e2 100644
--- a/include/linux/backlight.h
+++ b/include/linux/backlight.h
@@ -165,6 +165,23 @@ static inline int backlight_disable(struct backlight_device *bd)
 	return backlight_update_status(bd);
 }
 
+/**
+ * backlight_is_blank - Return true if display is expected to be blank
+ * @bd: the backlight device
+ *
+ * Display is expected to be blank if any of these is true::
+ *
+ *   1) if power in not UNBLANK
+ *   2) if state indicate BLANK or SUSPENDED
+ *
+ * Returns true if display is expected to be blank, false otherwise.
+ */
+static inline bool backlight_is_blank(struct backlight_device *bd)
+{
+	return bd->props.power != FB_BLANK_UNBLANK ||
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
