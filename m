Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B00149361
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jan 2020 06:03:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AF9C6E08E;
	Sat, 25 Jan 2020 05:03:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1F5A6E08E
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jan 2020 05:03:01 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id i23so2125194pfo.2
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2020 21:03:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=05BwadZAGfXvZZEsxjYXT6rUqTTFlTQilEFLvptCJPo=;
 b=YqVP5RP5xWZB4sBJe1HZmHil9OccC9kl0tb3x7bCu9FXcd3tLyp/E4T+9HCW29SFiH
 /R9M1zD7d+9dK50ijCitMnpwNHvthrOgqaPSCINcxLd3uWupPEqxFwzNeK4rSmJfFwNq
 sUT/Lp79stAriASB+JUvBFs9zWbljhPJ/M7HI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=05BwadZAGfXvZZEsxjYXT6rUqTTFlTQilEFLvptCJPo=;
 b=DbKHdU0VxH4UZhnb15GKbMqY0tbtSTury5BV5pKkCaRu8D3Mb5LhJ3Uh1n1wzmIZV/
 fhxoiF9hol8BpoUCrimMpH1M9gPT/hrHw/WXkyMpTXvWgJw8/h/MswT1YyV01kSKfFuV
 i610euN8KiikBhvHrd64DO2ufRmBDFkPrNIScMC43Y1j1YMHy0QTpr1+AOdEdELyzgvB
 z0awBumEXLW+KdNYurSJvU/DyaT3BtsAtt/NHT4O4EK3HDOC94pQ3LEuYRtMTsortDn4
 0iYkHJ0mi/LaC63lVUIBXfMNkqkuU9DoxcqGY9P7JEIuwG6Qwwg615Mgf6xa9kKxv6WK
 fKpA==
X-Gm-Message-State: APjAAAX6D4iL7vPz+E+OZaqCJKqRgcvRV9mk+PIGVUPc3HpoyiWPdYyG
 1Jt2r9+u42bJZ9B+rx2vE3ZETA==
X-Google-Smtp-Source: APXvYqxK+vtPL+z8xvYRLD8IJT1FQr68iAfYTPHNHxqoHdUX5xJ5q8BUhQoyEnM+MfyCkMYQBqJrIg==
X-Received: by 2002:a62:7681:: with SMTP id r123mr6479112pfc.169.1579928581217; 
 Fri, 24 Jan 2020 21:03:01 -0800 (PST)
Received: from drinkcat2.tpe.corp.google.com
 ([2401:fa00:1:b:d8b7:33af:adcb:b648])
 by smtp.gmail.com with ESMTPSA id u12sm7896585pfm.165.2020.01.24.21.02.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2020 21:03:00 -0800 (PST)
From: Nicolas Boichat <drinkcat@chromium.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH] drm/panel: Fix boe,tv101wum-n53 htotal timing
Date: Sat, 25 Jan 2020 13:02:56 +0800
Message-Id: <20200125050256.107404-1-drinkcat@chromium.org>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
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
Cc: Jitao Shi <jitao.shi@mediatek.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The datasheet suggests 60 for tHFP, so let's adjust the number
accordingly.

This also makes the framerate be 60Hz as intended:
159916.0 * 1000 / ((1200 + 80 + 24 + 60)*(1920 + 20 + 4 + 10))
=> 60.00 Hz

Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>

---

This also matches the values that we use in our chromeos-4.19
vendor kernel.

Applies on top or drm-misc/drm-misc-next.

 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
index 01faf8597700005..48a164257d18c35 100644
--- a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
+++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
@@ -645,7 +645,7 @@ static const struct drm_display_mode boe_tv101wum_n53_default_mode = {
 	.hdisplay = 1200,
 	.hsync_start = 1200 + 80,
 	.hsync_end = 1200 + 80 + 24,
-	.htotal = 1200 + 80 + 24 + 40,
+	.htotal = 1200 + 80 + 24 + 60,
 	.vdisplay = 1920,
 	.vsync_start = 1920 + 20,
 	.vsync_end = 1920 + 20 + 4,
-- 
2.25.0.341.g760bfbb309-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
