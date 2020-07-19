Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD322250B6
	for <lists+dri-devel@lfdr.de>; Sun, 19 Jul 2020 10:08:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FD706E4EA;
	Sun, 19 Jul 2020 08:08:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A77E6E4D7
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Jul 2020 08:08:22 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id x9so17029008ljc.5
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Jul 2020 01:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OJDKBzM5WCM/wOabtI6YcckSIiYQMrhs/j9cUZtSyfE=;
 b=ke0IBpPTuBlyL2cszAZT9C9ayT7fVfvVzC6OVH3QBVUidZxNtMEqCBCq0s6HPGBv11
 gXWEqvswIX9DA5Xter6f8TUidX6LiV6GRtUhdh2SY0CWmxVl8cYs9CWI08MAB4nJYF4v
 J/UCP/A6eLnvH3XyzxH9hR8I0ZJbrB/LatKBwvGdnTK5AI06N63kiVytCbqnzJtvNL67
 roPN+b6GObh6hOHmeMW/FixrnYeylnz5e1P5jPNTaDKnhPBKLkBLXfFp2TOCPvVu1Z6R
 X60dHm+H+0bghNBCCYLWQXetFC1paWcfrV/Pn+lw9QH28Ygvk/O9Dite+bT3jJbfT75K
 hp1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=OJDKBzM5WCM/wOabtI6YcckSIiYQMrhs/j9cUZtSyfE=;
 b=hJhCpyaMA6iZA2x34Z1qxRMuYYAbgtsm2X6fwouC+sCmEwHSj3qIEh5BSWHdLX3Tw1
 8flL7kiIWBQzWLXPCNEol7zLt53kinNDlOiMas/5zwXD4kARdStQz5SgQKFyInAgr6g7
 5IBisOotYPNlGtUa3Wnz8aaY+Wj0+Sj9KFsYxqDNMrAZGmi/kuJK2F28nyNQZ3GPZHH3
 FqABqRz6ghomph/IjJzULLIrWDHxyNkPYCIIvAfbErQthay2L3yArbXuSvngoPemArpt
 KYIMv/V1wjFwvRJ4aS5wAkqaVB8qMhGqZH1Y2IwIRRmYuz0sZDX/5ruEwaFeBnYmfvpG
 7Ulw==
X-Gm-Message-State: AOAM533lUVDUm5ZCPDJ/6XpBiQ7Fvk7OUWqsKj5uoscETKHv5UhQWhRs
 gDpB2IZOVtD7YD14Ka2Nx0GKjR7cDRU=
X-Google-Smtp-Source: ABdhPJw6MoGAA6/OzdTbDIA16nVyRjHatL9PcGdLBKA3q4XDBNcAWImwR5+k5f9pz7bIALWGu643sg==
X-Received: by 2002:a2e:9908:: with SMTP id v8mr7603333lji.186.1595146100487; 
 Sun, 19 Jul 2020 01:08:20 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:d5fe:fe9c:fc06:b74c])
 by smtp.gmail.com with ESMTPSA id 72sm732407lfh.97.2020.07.19.01.08.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Jul 2020 01:08:20 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>
Subject: [PATCH v5 12/19] backlight: introduce backlight_get_brightness()
Date: Sun, 19 Jul 2020 10:07:36 +0200
Message-Id: <20200719080743.8560-13-sam@ravnborg.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200719080743.8560-1-sam@ravnborg.org>
References: <20200719080743.8560-1-sam@ravnborg.org>
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
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
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
