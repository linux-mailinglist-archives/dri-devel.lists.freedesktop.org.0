Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B97971D3C18
	for <lists+dri-devel@lfdr.de>; Thu, 14 May 2020 21:10:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A7BB6EBB1;
	Thu, 14 May 2020 19:10:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 533606EBB0
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 19:10:31 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id r17so3583716lff.9
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 12:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BQs36UgnZaPqNCAzoKYxz5KT6Lkm6yBS/09B/P3wXNw=;
 b=KV/zGbtsbcJBxUhUrfp45Uhh9notrMrdzzIKpcIeNRZ/UIuQ/tcjKahpPEWXfvxjQb
 fWQduc+4oFVyt7yP8uiuMgRZYrIvtzZIsyxgQIUbPgznA9JEDfpPvg6cIzkEXUjvLDZo
 he3er8hWZZU0Y4FfDT/EexB/aBkbi9afI923EWgCYS5/odE77G00lIdQ9AeypaW6gdU6
 llakEYcUjg33wxYGfyHigCcxeRFC/qukFHM3HxAM9cbekovP2VNIiu2OiHn5Hz9azwIG
 IkzaQwXo3GYPH6OXim2AktQ+wWIk6d5QgDhExmYL8tbK7KhBCvtPQZ1w4CvKnxZEPGlV
 90Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=BQs36UgnZaPqNCAzoKYxz5KT6Lkm6yBS/09B/P3wXNw=;
 b=cSujn+CdBqjTx9UA2aTvYkQSfkfLhAlBOaNhPbhG4d9zuDMJVCrM4UGHAVRSvp2k2E
 +mOHY8JFJD3/bVz5aQjtRr0bwdFst5hOFCjwgX567Gaw5cFWUe8PWTlelhKhCRkVAbov
 tQNjOwW4Kj3gdkW9MaukWyjIJwLzYG67Misz3zx0HtnCbYJfalPytQja5d4C1GdmHXt8
 2TCnu7wmXqQ9Ii73yK2ZAWbnmPensT9Lzwv5eu7qskXvLe+dOZIdDnb0/fh9FhpsBTH0
 hpc9GBptYFHpdKMj3y15KNUJBZFagLImP2hSoObNQorYVHhh3tf8UW8Sz4L3dSh+h3lh
 21NQ==
X-Gm-Message-State: AOAM5306MoJodqhlIyqCKJ/Vqy3PtS7agolX27mh3oC05CwrKgRgFuxD
 wYJkCuLaezS12y5W233P2j5fhexbbuGAqQ==
X-Google-Smtp-Source: ABdhPJyaih7Y5ge2hEfQtSUZ8mgLT+i9VMogVKUGX/RzFXXlVNpwUIo3AxeVCYK+anlI7bCTNwaz4Q==
X-Received: by 2002:ac2:44cd:: with SMTP id d13mr2565957lfm.2.1589483429230;
 Thu, 14 May 2020 12:10:29 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:8d23:71d:e677:1c7c])
 by smtp.gmail.com with ESMTPSA id q30sm2362958lfd.32.2020.05.14.12.10.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 May 2020 12:10:28 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>
Subject: [PATCH v1 07/18] backlight: refactor fb_notifier_callback()
Date: Thu, 14 May 2020 21:09:50 +0200
Message-Id: <20200514191001.457441-8-sam@ravnborg.org>
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

Increase readability of fb_notifier_callback() by removing
a few indent levels.
No functional change.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Jingoo Han <jingoohan1@gmail.com>
---
 drivers/video/backlight/backlight.c | 43 +++++++++++++++--------------
 1 file changed, 22 insertions(+), 21 deletions(-)

diff --git a/drivers/video/backlight/backlight.c b/drivers/video/backlight/backlight.c
index 91dfcf4a2087..5e08f4f1c99a 100644
--- a/drivers/video/backlight/backlight.c
+++ b/drivers/video/backlight/backlight.c
@@ -58,28 +58,29 @@ static int fb_notifier_callback(struct notifier_block *self,
 
 	bd = container_of(self, struct backlight_device, fb_notif);
 	mutex_lock(&bd->ops_lock);
-	if (bd->ops)
-		if (!bd->ops->check_fb ||
-		    bd->ops->check_fb(bd, evdata->info)) {
-			fb_blank = *(int *)evdata->data;
-			if (fb_blank == FB_BLANK_UNBLANK &&
-			    !bd->fb_bl_on[node]) {
-				bd->fb_bl_on[node] = true;
-				if (!bd->use_count++) {
-					bd->props.state &= ~BL_CORE_FBBLANK;
-					bd->props.fb_blank = FB_BLANK_UNBLANK;
-					backlight_update_status(bd);
-				}
-			} else if (fb_blank != FB_BLANK_UNBLANK &&
-				   bd->fb_bl_on[node]) {
-				bd->fb_bl_on[node] = false;
-				if (!(--bd->use_count)) {
-					bd->props.state |= BL_CORE_FBBLANK;
-					bd->props.fb_blank = fb_blank;
-					backlight_update_status(bd);
-				}
-			}
+
+	if (!bd->ops)
+		goto out;
+	if (bd->ops->check_fb && !bd->ops->check_fb(bd, evdata->info))
+		goto out;
+
+	fb_blank = *(int *)evdata->data;
+	if (fb_blank == FB_BLANK_UNBLANK && !bd->fb_bl_on[node]) {
+		bd->fb_bl_on[node] = true;
+		if (!bd->use_count++) {
+			bd->props.state &= ~BL_CORE_FBBLANK;
+			bd->props.fb_blank = FB_BLANK_UNBLANK;
+			backlight_update_status(bd);
+		}
+	} else if (fb_blank != FB_BLANK_UNBLANK && bd->fb_bl_on[node]) {
+		bd->fb_bl_on[node] = false;
+		if (!(--bd->use_count)) {
+			bd->props.state |= BL_CORE_FBBLANK;
+			bd->props.fb_blank = fb_blank;
+			backlight_update_status(bd);
 		}
+	}
+out:
 	mutex_unlock(&bd->ops_lock);
 	return 0;
 }
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
