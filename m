Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3CD1E9E9D
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jun 2020 08:52:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5744A6E147;
	Mon,  1 Jun 2020 06:52:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6212F6E14A
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jun 2020 06:52:44 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id c17so994298lji.11
 for <dri-devel@lists.freedesktop.org>; Sun, 31 May 2020 23:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NjiBPif2aC324+vDH5W7L3OnbFVYWltMaLDt/zt0WxE=;
 b=mtY7E35P7NMSOhp9i+6bfaqRO2BlrKF2/SCdxL4Wo+C/dxcNueZ/8rL6drsV5Qk4ms
 OBZHTwJMwRh3vvlu1nl9mBpequPzPsTggrEfpwP84EHz2HBpIB9avd6RWb23Qqp2sjkZ
 Pb04vSzZr1FEM/sZ8OBTs38Gh1DDOLFSM1Ujn+0t7oUMdCNm9bVm2M0EIeSGSnwt45KB
 6Y/glw6EfVkRqqZhnjpU+wNvUkQRAf/gun9TNPiJ1plRGvTPhUJ5Gd9V7gakd43XkzX4
 tNhtDSKq6ZvNVi01I14PkmXvUCoLKioBy7SAaHwC79131X0KVxC3qKFBFsgkuxrePiiE
 nX1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=NjiBPif2aC324+vDH5W7L3OnbFVYWltMaLDt/zt0WxE=;
 b=CdB0mYuitFE37eaTM+HNPdN7YLtaqKWurhM1e5mF2Trvl37ngmeUxy4NVYH5JyPbNx
 IeV/jmMP5lmNvPTsOQzvwn0fl3tpOwW7WZMG2ZdJb8+FZa5QF+DXwG+M8WwYcfMRdxAb
 DvM6vLDpPaXcDp1m77asfIf2gL8pwKMiNSPkufJ6hpQ0q4hBgsbZgfPp6qgFZJohPX68
 4rk++uVlc7jd8tgywqu2QCISkUXwkEXSzyn0y7yhlivxltpE+8RUIOSUXSs/nalOLStS
 vI1JHPzVMKZra449IcQSAScMjK0wFq6GGwPVuaN9cICdpLfc0kFOCq6hTzzX0Eh7efkQ
 Y+ZA==
X-Gm-Message-State: AOAM533PSc/aCnaXuwU/4QYoYC6On8aX85coh7GdNqNrEz553jbyGqjJ
 yic+xylkiNEiQTA58cK7VZd9O6wnpPk=
X-Google-Smtp-Source: ABdhPJy7GQRKVdKefzETWFNpD9tAcpKEGeCIQ2ORhC0pwxa34K7ayOx8SXEcMeR6aBbHrE77mAFjFQ==
X-Received: by 2002:a2e:8044:: with SMTP id p4mr10445457ljg.151.1590994362678; 
 Sun, 31 May 2020 23:52:42 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:281d:a604:434c:a58d])
 by smtp.gmail.com with ESMTPSA id e13sm2540462ljl.117.2020.05.31.23.52.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 May 2020 23:52:42 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>
Subject: [PATCH v3 12/13] backlight: as3711_bl: introduce backlight_is_blank()
Date: Mon,  1 Jun 2020 08:52:06 +0200
Message-Id: <20200601065207.492614-13-sam@ravnborg.org>
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

Replaces the open-coded checks of the state, with the
backlight_is_blank() helper. This increases readability
of the code and aling the functionality across the drivers.

Futhermore drop the debug prints in update_status().
If we need debug printing then we can add it to the backlight core.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Jingoo Han <jingoohan1@gmail.com>
Cc: Emil Velikov <emil.l.velikov@gmail.com>
---
 drivers/video/backlight/as3711_bl.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/video/backlight/as3711_bl.c b/drivers/video/backlight/as3711_bl.c
index 33f0f0f2e8b3..cc5628beaffd 100644
--- a/drivers/video/backlight/as3711_bl.c
+++ b/drivers/video/backlight/as3711_bl.c
@@ -107,13 +107,7 @@ static int as3711_bl_update_status(struct backlight_device *bl)
 	int brightness = bl->props.brightness;
 	int ret = 0;
 
-	dev_dbg(&bl->dev, "%s(): brightness %u, pwr %x, blank %x, state %x\n",
-		__func__, bl->props.brightness, bl->props.power,
-		bl->props.fb_blank, bl->props.state);
-
-	if (bl->props.power != FB_BLANK_UNBLANK ||
-	    bl->props.fb_blank != FB_BLANK_UNBLANK ||
-	    bl->props.state & (BL_CORE_SUSPENDED | BL_CORE_FBBLANK))
+	if (backlight_is_blank(bl))
 		brightness = 0;
 
 	if (data->type == AS3711_BL_SU1) {
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
