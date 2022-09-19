Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A64C5BC19B
	for <lists+dri-devel@lfdr.de>; Mon, 19 Sep 2022 05:04:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 149F210E170;
	Mon, 19 Sep 2022 03:04:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D951710E170
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Sep 2022 03:04:06 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id a29so3164074pfk.5
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Sep 2022 20:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=1Z7zLLagXME9kaIkwwz+RZoWIKsBtX6ruY4efxOuNA0=;
 b=fAuikC+SbpMF2sZ/NgiATXG2kQiWQvNOVV0IxiSG8cLCO2Hqrtxt7oRn9wYoE+WzyH
 aZvZypqQHz5xr57iUs52oSyECqaC2CGtlH2iJ3ejedCDIj7kmz7+aDo9ywV6XtbaBCoi
 LB6fLWi6Bj6LDQ2QSC2pi2ZyvpfGQlpES6NCXZTHu6dU3Dt+srv5/Outu+l83nrPNmzn
 h3JoZtzlKOH0EgUtgv3WJ4BbDX6pELCwwaYWXqGnHVna3FlXD9kPdWdT3/U4ZJJUdk6b
 C75dbBNWzsxV0lj013tpvUiCiL5Fu+3c5qTUOhVGj9fJrgAqX9gNgoXZAaykKlj/fBmG
 unWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=1Z7zLLagXME9kaIkwwz+RZoWIKsBtX6ruY4efxOuNA0=;
 b=ItM/efxADVP8ZZBKYeM4ExQkVrPwc5EuEo1tu4VeEAdymNVRtp/M5lO/ftw2LDnD9s
 mMj6+3C1EBbRioAXqbqpS7WzRBq805an4O6J+IoQ2oyBPHdgvgPSGp5cEobcOSrbqoBf
 p5skkO+3WAVbLtBjn22t0iqlvu4GGBUsFQM/tZnOAGz4R6pUQP6ZRvYuwo61r/RcxlNf
 bpYbA4pWQcfkOGSpRdwG6ptPWYQ+ScFTlGBNkOry2tVf3yXO+v37hReJxbbhkdVmKkKF
 w/+RjlTeWB9Ihw9NrKzEufwB2tgy/2RSqxq3igwEJFDDroMWe8Lubu/6tO7JFPdjB7Sp
 nwqQ==
X-Gm-Message-State: ACrzQf3bFt5wIyZbYYqtnDyKgu/9mlWsQUH31RgX9UWsU/4KWn++znRN
 wwJ8/sDS81UBXVX9OlkuPvE=
X-Google-Smtp-Source: AMsMyM6Yjm4ugY5K6oMa3IYSw2JddiCz7Pq1BHaiEU7A6XTyq0MULpLn+QLfMfiZFhhhgZ4ZDLbdoA==
X-Received: by 2002:a05:6a00:8cc:b0:52c:7ab5:2ce7 with SMTP id
 s12-20020a056a0008cc00b0052c7ab52ce7mr15998116pfu.28.1663556646421; 
 Sun, 18 Sep 2022 20:04:06 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 y6-20020aa793c6000000b00540d75197e5sm19052339pff.47.2022.09.18.20.04.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Sep 2022 20:04:05 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: chi.minghao@zte.com.cn
To: andrzej.hajda@intel.com
Subject: [PATCH] drm: bridge/dw-hdmi-ahb-audio: use strscpy() is more robust
 and safer
Date: Mon, 19 Sep 2022 03:04:01 +0000
Message-Id: <20220919030401.211331-1-chi.minghao@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: neil.armstrong@linaro.org, robert.foss@linaro.org,
 Zeal Robot <zealci@zte.com.cn>, linux-kernel@vger.kernel.org,
 Minghao Chi <chi.minghao@zte.com.cn>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Minghao Chi <chi.minghao@zte.com.cn>

The implementation of strscpy() is more robust and safer.

That's now the recommended way to copy NUL terminated strings.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c
index 7d2ed0ed2fe2..4efb62bcdb63 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c
@@ -542,8 +542,8 @@ static int snd_dw_hdmi_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
-	strlcpy(card->driver, DRIVER_NAME, sizeof(card->driver));
-	strlcpy(card->shortname, "DW-HDMI", sizeof(card->shortname));
+	strscpy(card->driver, DRIVER_NAME, sizeof(card->driver));
+	strscpy(card->shortname, "DW-HDMI", sizeof(card->shortname));
 	snprintf(card->longname, sizeof(card->longname),
 		 "%s rev 0x%02x, irq %d", card->shortname, revision,
 		 data->irq);
@@ -561,7 +561,7 @@ static int snd_dw_hdmi_probe(struct platform_device *pdev)
 
 	dw->pcm = pcm;
 	pcm->private_data = dw;
-	strlcpy(pcm->name, DRIVER_NAME, sizeof(pcm->name));
+	strscpy(pcm->name, DRIVER_NAME, sizeof(pcm->name));
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_PLAYBACK, &snd_dw_hdmi_ops);
 
 	/*
-- 
2.25.1
