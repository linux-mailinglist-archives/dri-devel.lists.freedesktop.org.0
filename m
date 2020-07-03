Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E66B0213F66
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jul 2020 20:46:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13C3F6EB92;
	Fri,  3 Jul 2020 18:46:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95F326EB92
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jul 2020 18:46:06 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id k17so6251274lfg.3
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jul 2020 11:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=slEyhjL47i6I9Wxhc3waVaJdqdZuvpWrNlMHpCPdtlI=;
 b=hWudvJIMNNbUW3X9DzjPBCCvb5ZIR6oSWPu4iLaJwfPDbd00Hi7Rk3R0vWiNrR60Nz
 rfBpoPiWKAovJ5AsHV5Aqgndv5gBqK6RoDgSnXgHGD2qRdJVyj7zPsWzxaj7cbNmFfEq
 H5kumOr2XGwekyw6aLMHigST7LM22Lp0yI6e9eoi8HarqcgDrOfXPPJHx4mjRkOq7gz0
 Jh7E4jvR0dyqawG4vQQWT/sH8HW/wDSYcuxSzwpkA12OtxNuRY8bNbSzZMDom+dyIwN6
 Qfw2eHWwx7Ldc2PtO4PkIyCif+BE8Ln593yOTLX1fue8dyO5Kbnz7hrBCS2vuS2Wv9oJ
 dKvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=slEyhjL47i6I9Wxhc3waVaJdqdZuvpWrNlMHpCPdtlI=;
 b=aj7xcHgbBia7QOiK3EQql/k/SIR6uCQ77qtHsHaVwxcCa9JkKieic9AEeecBB0rpGI
 6yHFvDuCfL6xPDCvaQTbMFCpfXX8cxdElhxuqTDepl2jxYRVBfVFVNiPwuMirvNek/wT
 jZ70z09kB9P4uXq5r0CIBDG/Unml3S1tapHZJRl83qV7v7O3Up56pAnyl+01km3agkui
 U3sX2lA6oUzbVJ8pss3h5r+Br1XiU9GqzBA1+bTIHaItpWLXIoTSdnZnISP6TFAPHSBP
 dv4EabTUFANtjMlVllQsB9IeTMHt4ihRR+q08fWK4S27ZvfWWvahvREYnCKyQmvPB4Sd
 B7nQ==
X-Gm-Message-State: AOAM530cHdbV1iuXPdKOuEg5qOwoRYOEms5wFFSXlGn/9E93/ik3lfkX
 l27h3/lrCEt08QUg9SezzU2TPYsHudU=
X-Google-Smtp-Source: ABdhPJxZVEriVlg0DtABp602eurzMwv/ufWQs5sh/lb4hdctxwi/NmZJQsLASiwNE69v1pDGutzH7Q==
X-Received: by 2002:a19:4a4e:: with SMTP id x75mr22707227lfa.70.1593801964841; 
 Fri, 03 Jul 2020 11:46:04 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:4025:a614:1d5c:b7bc])
 by smtp.gmail.com with ESMTPSA id h22sm4404224ljg.1.2020.07.03.11.46.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2020 11:46:04 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>
Subject: [PATCH v4 01/20] backlight: refactor fb_notifier_callback()
Date: Fri,  3 Jul 2020 20:45:27 +0200
Message-Id: <20200703184546.144664-2-sam@ravnborg.org>
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

Increase readability of fb_notifier_callback() by removing
a few indent levels.
No functional change.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Jingoo Han <jingoohan1@gmail.com>
---
 drivers/video/backlight/backlight.c | 43 +++++++++++++++--------------
 1 file changed, 22 insertions(+), 21 deletions(-)

diff --git a/drivers/video/backlight/backlight.c b/drivers/video/backlight/backlight.c
index 92d80aa0c0ef..7e249aa90b0e 100644
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
