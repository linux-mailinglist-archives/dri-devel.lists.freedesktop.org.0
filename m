Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E2750091B
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 11:00:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE90810FD5C;
	Thu, 14 Apr 2022 09:00:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D6BF10FD4F
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Apr 2022 09:00:17 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id p10so4119557plf.9
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Apr 2022 02:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Bm6j4Sj81g1kNoBEMCttfjxLkn0RWePq1WSEM7XPmtI=;
 b=fxHH32p5j0e+cdXaMKgpfUspQX84794ZwP+Pf19RC5R0BLWEj+NyAaWz8nz7IPUrOW
 1NOs4YA249O7wbPC0KZzR/8lHcPHtMGBkjJ456cIFSglWwHyTuq4jY81Y6MBvG2fiyY+
 nt8oLvp/huyt+32y5hg6RHMqA9v2+w3OteeRA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Bm6j4Sj81g1kNoBEMCttfjxLkn0RWePq1WSEM7XPmtI=;
 b=jf7UEsyjgEj3n+iXokx5vUbTZsBM4JKu0kM/jRdB3Nj37XEHLiierbDKq/J368D0t5
 O6l2dFHQkP8KOG31rno50tRmCCqe7+tZdeoBfWgJc6H094LUY5UkgoACiY1I3LzU5uCM
 uxWyZahjs9Eh2BP/lmgk910woC3wp0FQy7tV7QCW3Jfw3BbJXCkWwuFaOncEcPuzI7fW
 5up/3PXUAl0Sn+hAFCTlLwS//S9PD+7VkHbFtYQxI9B6lSlZuViswTi5cqUKGR9DxM15
 vI9wwjUnMP8EOL0x6xPB6hRGzjqEaRit0L9zOM64RlBlVg1iBJ155cZPldWJrj+DBzWX
 TjAw==
X-Gm-Message-State: AOAM532sZVA2GPUH7kRJlg42otC7LEWp+lM26FFIfLDDd+h4IOxpEAKr
 tEjIOl+aMwcobliXblzUF7VaEA==
X-Google-Smtp-Source: ABdhPJx7X+z3T7obGlkfwniBmq4ySimshUk0QxfezcyPmQw82MV8mGhksCsy7itbjwsr0JNQdzeAVg==
X-Received: by 2002:a17:90b:4b11:b0:1cb:2a65:f275 with SMTP id
 lx17-20020a17090b4b1100b001cb2a65f275mr3229394pjb.33.1649926816349; 
 Thu, 14 Apr 2022 02:00:16 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:b53a:7315:ec5:64b0])
 by smtp.gmail.com with ESMTPSA id
 q9-20020a638c49000000b00398677b6f25sm1340942pgn.70.2022.04.14.02.00.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Apr 2022 02:00:15 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Robert Foss <robert.foss@linaro.org>,
	Xin Ji <xji@analogixsemi.com>
Subject: [PATCH] drm/bridge: anx7625: Fill in empty ELD when no connector
Date: Thu, 14 Apr 2022 17:00:04 +0800
Message-Id: <20220414090003.1806535-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.35.1.1178.g4f1659d476-goog
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
Cc: Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Speaker may share I2S with DP and .get_eld callback will be called when
speaker is playing. When HDMI wans't connected, the connector will be
null. Instead of return an error, fill in empty ELD.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 6516f9570b86..f2bc30c98c77 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -1932,14 +1932,14 @@ static int anx7625_audio_get_eld(struct device *dev, void *data,
 	struct anx7625_data *ctx = dev_get_drvdata(dev);
 
 	if (!ctx->connector) {
-		dev_err(dev, "connector not initial\n");
-		return -EINVAL;
+		/* Pass en empty ELD if connector not available */
+		memset(buf, 0, len);
+	} else {
+		dev_dbg(dev, "audio copy eld\n");
+		memcpy(buf, ctx->connector->eld,
+		       min(sizeof(ctx->connector->eld), len));
 	}
 
-	dev_dbg(dev, "audio copy eld\n");
-	memcpy(buf, ctx->connector->eld,
-	       min(sizeof(ctx->connector->eld), len));
-
 	return 0;
 }
 
-- 
2.35.1.1178.g4f1659d476-goog

