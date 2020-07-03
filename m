Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F049213F6D
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jul 2020 20:46:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 194746EB94;
	Fri,  3 Jul 2020 18:46:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C48616EB95
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jul 2020 18:46:08 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id b25so34487001ljp.6
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jul 2020 11:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eK/aZ3+ghdIFopzJxrnMF+M6xcoKuP5T0HDHhE7PCRE=;
 b=Kh0cYIP7f7GRh0jsMz67pBF5ogXJKQ7HBpCm8kOupB7NNCNTYuS2nhr5cYKlAV+XZk
 +t40EIa7T2OjEBA2E+1hU9CV+xVscjQY0tBenF6ouGcNayV9g8TqXWkIkH2b5DIoDRR+
 XvE1O8abD1mm/wxeD2v/SUMBPRUzX6C3k2mDiil6gHNrfozZtmf71iXfvGav2UEZaLH4
 BusJhlRNqdQmxRObtWc2I6ed/YOAA3XU9yWcdfbiJG5PIwEKUJBXc8MeIoiJJxsNxMo4
 rXkO/YJ0N3+JDrdboHmgth5Pct86Gvn9qT7he86M5Xyt24uu0PtildaZKF224trgwTUU
 3ObQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=eK/aZ3+ghdIFopzJxrnMF+M6xcoKuP5T0HDHhE7PCRE=;
 b=UUax9Ga9O+aWfc5FQtJyJqj1YTUWXBq36mbj1BqM+GuQVMNwEZwv5NbJyOwPDMnefW
 Ws63fR6wM3zw0ITLKwYYam58QlbywkN5UXDWNs7FA6sdmk7y+FRdJLfdTZJYoKkTSTP0
 OWJpo7pgHCstvDw+7t1gVjGgXk98XcJ0vxhL/vVBzaTz14OVh38MiZ0XOdbapj6qX22H
 91szHtj60nuClAyp4WJ0ni8WNWcsBAfHGBETMTDwz0WbCdHwXmX1mIQurnekU+vOW/u4
 ghC9IrKVn9sEqC2Rdlauoz1TSGrAGvchiUowl2hT3sSbQJlL4hUfbyzqzbYWRRfPs/Fr
 YKMg==
X-Gm-Message-State: AOAM530hHyCeSvKtQb0Sd5ojohR7dt5+HGf97uQssTmeJTlWt5H3eEqN
 U8L2GKb7vCrtfTxB2xeprwN4MCutP/0=
X-Google-Smtp-Source: ABdhPJx6f8dy7nC47enwxaN0YU2FjLuW8bB0B5VwVDqrwe5zJLqWBOoRu8fveYQH8mG3ZLmypskStw==
X-Received: by 2002:a2e:99c6:: with SMTP id l6mr14274238ljj.220.1593801966954; 
 Fri, 03 Jul 2020 11:46:06 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:4025:a614:1d5c:b7bc])
 by smtp.gmail.com with ESMTPSA id h22sm4404224ljg.1.2020.07.03.11.46.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2020 11:46:06 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>
Subject: [PATCH v4 02/20] backlight: add backlight_is_blank()
Date: Fri,  3 Jul 2020 20:45:28 +0200
Message-Id: <20200703184546.144664-3-sam@ravnborg.org>
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

v4:
  - struct backlight_device * is now const

v3:
  - Clarified that the fb_blank support in
    backlight_is_blank() may result in functionality
    changes for the users (Emil)

v2:
  - Added fb_blank condition (Daniel)

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
Reviewed-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
Cc: Emil Velikov <emil.l.velikov@gmail.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Jingoo Han <jingoohan1@gmail.com>
---
 include/linux/backlight.h | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/include/linux/backlight.h b/include/linux/backlight.h
index 56e4580d4f55..56e51ebab740 100644
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
+static inline bool backlight_is_blank(const struct backlight_device *bd)
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
