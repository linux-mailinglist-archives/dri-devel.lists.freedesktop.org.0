Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37AEC2F6FEF
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 02:23:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AD356E153;
	Fri, 15 Jan 2021 01:23:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40A9B6E153
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 01:23:21 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id be12so3858875plb.4
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jan 2021 17:23:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZAPHsHm+2XIrQA1OESxVnuIMSm0KrZ79SJ4XDucyPvM=;
 b=XUdrUW23+dnz/P8wVglvFy5MQnCedEURA9CI4MMRuUKdnhcoWPKTdiUkIabfVKNb0+
 +QLeH6rzURyT0mdSAohSkm5+Kt8j2kQYJjMMQyM2VhTYQVRiojOgol90egFLH0uGRhoA
 CLmyHN9qaqqRJV0ecTBp1n71z2wIh++hf5H5o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZAPHsHm+2XIrQA1OESxVnuIMSm0KrZ79SJ4XDucyPvM=;
 b=RZqvgxTiZyBNjkPUx/fqtxrYntx+OvxNdsQr2GT1BiDMwv6GPJzmXPKRjwPak8AOZu
 mi4KAwcXuChY3xfDPLAsAi4sYRYKxtFKUkM2/xdRHpsaxiROpYGS3SK8D/HE5Gvcm/fT
 VXlFT8URi3vFXOa8c3nGGDebNs1QbownTbGYj/n4avzWgQNEMYuizBf2BR/KHogxjeKd
 9FHGzrIAyofT6bFqpZlaU95y0PTgzA5mF6q0oXKcJ/TIkvi2Z8OgGdUSK8zzkPLGu8Mu
 YjvSq2C4RE66BIDbUx3kHPvOR8kx1C6rxR0mgVroRXLYGWzLFzzJBJ5TcnHreFgtWXOX
 75EQ==
X-Gm-Message-State: AOAM531EvyeKqxwFjIccSShH+0nOrn9Eft3OuuA7Gl8uQt58BClENe+X
 YQkzngfRUKtZC8P7Wqi8YbgLG7dwAoj8bIq4
X-Google-Smtp-Source: ABdhPJzaiZtuHHebdoNCQc0Ip8w+8uPtCbHJezMb+dhXNEAYWBnV188vW2zTFJDriySZf0NjMZkzQA==
X-Received: by 2002:a17:902:8306:b029:da:d7f0:9e16 with SMTP id
 bd6-20020a1709028306b02900dad7f09e16mr10351975plb.53.1610673800871; 
 Thu, 14 Jan 2021 17:23:20 -0800 (PST)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
 by smtp.gmail.com with ESMTPSA id b65sm2885816pga.54.2021.01.14.17.23.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 17:23:20 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH] drm/panel-simple: Undo enable if HPD never asserts
Date: Thu, 14 Jan 2021 17:22:59 -0800
Message-Id: <20210114172254.1.I33fcbd64ab409cfe4f9491bf449f51925a4d3281@changeid>
X-Mailer: git-send-email 2.30.0.284.gd98b1dd5eaa7-goog
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If the HPD signal never asserts in panel_simple_prepare() and we
return an error, we should unset the enable GPIO and disable the
regulator to make it consistent for the caller.

At the moment I have some hardware where HPD sometimes doesn't assert.
Obviously that needs to be debugged, but this patch makes it so that
if I add a retry that I can make things work.

Fixes: 48834e6084f1 ("drm/panel-simple: Support hpd-gpios for delaying prepare()")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/gpu/drm/panel/panel-simple.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 71ae200ac48a..b89394b44f43 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -406,7 +406,7 @@ static int panel_simple_prepare(struct drm_panel *panel)
 		if (IS_ERR(p->hpd_gpio)) {
 			err = panel_simple_get_hpd_gpio(panel->dev, p, false);
 			if (err)
-				return err;
+				goto error;
 		}
 
 		err = readx_poll_timeout(gpiod_get_value_cansleep, p->hpd_gpio,
@@ -418,13 +418,19 @@ static int panel_simple_prepare(struct drm_panel *panel)
 		if (err) {
 			dev_err(panel->dev,
 				"error waiting for hpd GPIO: %d\n", err);
-			return err;
+			goto error;
 		}
 	}
 
 	p->prepared_time = ktime_get();
 
 	return 0;
+
+error:
+	gpiod_set_value_cansleep(p->enable_gpio, 0);
+	regulator_disable(p->supply);
+
+	return err;
 }
 
 static int panel_simple_enable(struct drm_panel *panel)
-- 
2.30.0.284.gd98b1dd5eaa7-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
