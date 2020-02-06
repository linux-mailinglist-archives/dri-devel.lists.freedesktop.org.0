Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31BF2154BCF
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2020 20:18:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C78E6FB1C;
	Thu,  6 Feb 2020 19:18:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A13E6FB1C
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2020 19:18:40 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id w15so8571286wru.4
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Feb 2020 11:18:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6mFlT0Omv41nAtEpTgYWO4Xf2iU3uM7fX834ml+D12E=;
 b=rci9PqEx4hby5MvW1khg7iEKwuy1bfbD4iaH4uETQBur1Za15XCzVjeFY1VfdBhtw4
 Sgm+lIqBzDWUcXws81WyInQc4DgofK0ajNixco/KiwkevvAVCOdtY5ZeQ6xfN/Ef6rVb
 GayBIdYOso2YrWls5jJXiF/U+8TKQSpE/sJZNy5HxzOqmim+LVfpuTuYr/kwh/7kYfdW
 Y3awX+mVUGcHmrjyQdCGHxtp6dtxRCX/efFt9Twi9ODg1shreYkTyHnQOaQ/ER9EN8Ut
 ptxJLeh9r0Gvc7WMEkLdB6fdxT1wUa0xnxOwgm+0Q4KtNxTa3y6OHyult0N4gOrTG7WX
 OpKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6mFlT0Omv41nAtEpTgYWO4Xf2iU3uM7fX834ml+D12E=;
 b=Zz1x5HK25rRfZ0N6gSieCFFmjChUCGHNtMR7Hcc2/CA+Upz+REWLSyRsrfX7HcmeOb
 81jPcBLFOB4d7j48vu8qG+T5Jq9ds37nLf030Qv+WQM5V8zIC0WIi6E6QMgwiNkI0bNA
 tvJJ6qX6t+ewgjvxWN2gUZSddw+jOaVBk6h+0MSeFeLJcbHLC9p0cHEymh9ZBdfUOOgs
 o2665cSHpxSgZQQNOxjq7GpVrrocj4xWGRQxOgt70mon6JsySgC3+Y4l1xkn+RjCsyW8
 doVtTbFNjEjXwQ+CWgdfvYhdWp52jyhreixf49AR5MWIWs/WLNWdACmtUwUaQOZMUwRl
 h6bA==
X-Gm-Message-State: APjAAAU8+xZ+8SRIvBn4R0XXnW/ksiuv1nrnPCiY9Tj66mcA1AmV2jZS
 tAFfx7avS9qqvVD5Tx8oxahW4Q==
X-Google-Smtp-Source: APXvYqyowlhqCLlPiC8LwlQGO8ZeahyUMuyPS6kHuCVL6/61Z4rWlDzBpMhGfN5LPnPhHBF2WM35Pw==
X-Received: by 2002:adf:bc87:: with SMTP id g7mr5375779wrh.121.1581016718863; 
 Thu, 06 Feb 2020 11:18:38 -0800 (PST)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:7d33:17f7:8097:ecc7])
 by smtp.gmail.com with ESMTPSA id m3sm272662wrs.53.2020.02.06.11.18.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2020 11:18:38 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@siol.net, boris.brezillon@collabora.com
Subject: [PATCH v4 01/11] drm/bridge: dw-hdmi: set mtmdsclock for deep color
Date: Thu,  6 Feb 2020 20:18:24 +0100
Message-Id: <20200206191834.6125-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200206191834.6125-1-narmstrong@baylibre.com>
References: <20200206191834.6125-1-narmstrong@baylibre.com>
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jonas Karlman <jonas@kwiboo.se>

Configure the correct mtmdsclock for deep colors to prepare support
for 10, 12 & 16bit output.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 67fca439bbfb..9e0927d22db6 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -1818,9 +1818,26 @@ static void hdmi_av_composer(struct dw_hdmi *hdmi,
 
 	dev_dbg(hdmi->dev, "final pixclk = %d\n", vmode->mpixelclock);
 
+	if (!hdmi_bus_fmt_is_yuv422(hdmi->hdmi_data.enc_out_bus_format)) {
+		switch (hdmi_bus_fmt_color_depth(
+				hdmi->hdmi_data.enc_out_bus_format)) {
+		case 16:
+			vmode->mtmdsclock = (u64)vmode->mpixelclock * 2;
+			break;
+		case 12:
+			vmode->mtmdsclock = (u64)vmode->mpixelclock * 3 / 2;
+			break;
+		case 10:
+			vmode->mtmdsclock = (u64)vmode->mpixelclock * 5 / 4;
+			break;
+		}
+	}
+
 	if (hdmi_bus_fmt_is_yuv420(hdmi->hdmi_data.enc_out_bus_format))
 		vmode->mtmdsclock /= 2;
 
+	dev_dbg(hdmi->dev, "final tmdsclk = %d\n", vmode->mtmdsclock);
+
 	/* Set up HDMI_FC_INVIDCONF */
 	inv_val = (hdmi->hdmi_data.hdcp_enable ||
 		   (dw_hdmi_support_scdc(hdmi) &&
-- 
2.22.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
