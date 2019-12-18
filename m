Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD878124BFC
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 16:46:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D85F86E7D5;
	Wed, 18 Dec 2019 15:46:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1738A6E7D4
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 15:46:42 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id y17so2823988wrh.5
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 07:46:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=O9tdpVSfl48TElavVgqhWWyanYwTXJeuWxrfu0hiAW4=;
 b=FHCAjQd4y3iLKbv9a4+0jgFrCRVKlJcXXyEE8djCrmS1HqnAQOSIzjRPhU58PIOqSP
 qLQGfl8t/kpeSD0jjGyEVg1gzI7FEKVnZAyyu39Tk6J/jW7uzg1fwpsQc2fyyl23X2yQ
 vx2zPKIvq/gYsfcl93bHNdkA2/unThznbtJ2q2ZKLbNEnXIQ5oxLximvIxutQNUADsdL
 BwiZ4sdCrvm5dC0Eebf8yxE+oGqYOpmKb8L9WZ0aEGYZfHzh65OS5C6JY2duUiV03LH1
 CJRX/8PaypTs/svctTJXJCDjVfDFrXgCpW7vljEnXhEOYVbMN/BioNDaVzE/VFhKtnzp
 M6Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=O9tdpVSfl48TElavVgqhWWyanYwTXJeuWxrfu0hiAW4=;
 b=cfOrK0MU4Hfd/22NvaEBkLcvBtE6ZvbXzmdbgDnz2pY/dGJR6xQ6dc/E5JJTU0wNP9
 +KyHEEy0uTIjUilj/95Kh2APyxl6w7Bdq+XaEtGvDXsOrL4vDNnz4ZWmfc+9HOyOBQ2m
 0klVWNR6ssCABxJTIw50hXKzajAE7PCGxdWnPkUwm/FfkFz0JEx/c0EVfjhPRswQU6c/
 qRQyE5uX5xku5Qk/GTFcKT63LDquWKEjFtpoe1h354+ZIGyozPokgSkgJVS6uzU+ppTO
 PYDqFxT2JW8JUFrPYf4Q0G31Ewx7LhM79u3BUUUZw3ahvNhKl3RktwC7v2nCZa7zqvje
 ykrQ==
X-Gm-Message-State: APjAAAV1Bvq5xpjxY/27pata4GNxhqrkMWvS01mQzBskURAEWD8fIH5K
 SKCiZJLbLhp0iy/jqtS9Up9elw==
X-Google-Smtp-Source: APXvYqzuM/qSpRgPBzy3PCHjbAbAOHl0IflSqZ5d6XsQf2QHxW6iMGwcohpjIcXJFGEUXP4EJk3xAA==
X-Received: by 2002:a5d:46c7:: with SMTP id g7mr3545462wrs.11.1576684001310;
 Wed, 18 Dec 2019 07:46:41 -0800 (PST)
Received: from bender.baylibre.local
 (lfbn-nic-1-505-157.w90-116.abo.wanadoo.fr. [90.116.92.157])
 by smtp.gmail.com with ESMTPSA id x1sm2891492wru.50.2019.12.18.07.46.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2019 07:46:40 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@siol.net, boris.brezillon@collabora.com
Subject: [PATCH v3 01/10] drm/bridge: dw-hdmi: set mtmdsclock for deep color
Date: Wed, 18 Dec 2019 16:46:28 +0100
Message-Id: <20191218154637.17509-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191218154637.17509-1-narmstrong@baylibre.com>
References: <20191218154637.17509-1-narmstrong@baylibre.com>
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
index dbe38a54870b..6a0b4b3a6739 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -1792,9 +1792,26 @@ static void hdmi_av_composer(struct dw_hdmi *hdmi,
 
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
