Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E30D77EEB65
	for <lists+dri-devel@lfdr.de>; Fri, 17 Nov 2023 04:25:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DC2B10E719;
	Fri, 17 Nov 2023 03:25:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACBE310E719
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Nov 2023 03:25:07 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-27ddc1b1652so1250147a91.2
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 19:25:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1700191507; x=1700796307; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lWUBbXEC+MgyXJRRkGeNSIspYkMNL5y7cUNz4Wj7NSQ=;
 b=PYDvA2rme+PsppjCAiZzU38XJJ3wQTcbTG1s7Be+rhn+MD4GRihzn892s2AQMFMSQc
 fEzUJrNVdrHgXRrVEIlkTQG2WffIpTniXtEoMJy7PWJlpWSjxfX13aHE2qXNA8a2jVgJ
 J2meGtwMksBp+7i2Wiij5v9qy+6Z5Cm05xqNA3WPHpfPnKQIcpmPqWfmpssoPIqr8eZu
 vHesrpww+/1JIWqsx8x6SJT8JjEM1FPjJ6O0JWSCBKTvZsgXSvX6b6tpeVUv6NNN/rw8
 F0tEASDVXGUyRIxzXQy17WkHpspr5pYDU90xPOAtc+p+aDy+A7TFIBHfpAgWCL+8SqAk
 fv6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700191507; x=1700796307;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lWUBbXEC+MgyXJRRkGeNSIspYkMNL5y7cUNz4Wj7NSQ=;
 b=GrNi1JParnFAkgmlbTZfCczWzyPxmTOLAAHD7Fe843AFku/yJRfkV/0Nzr0rAipXTz
 4d7rcVXcgwWexRVdgl8i7k9BaZgOVVsuCFg2UHttsIP9H7mDWOSku4sRI9b1otKJgR5I
 V0Qff/Tk+os7HMM2so1xPTeDdFWFXTSCq9zj1K8oxYXFqmeMaG1iPlm+kGx9izqgCdak
 BzSkiUamBx0wOvJx309URd0WZGeqpao+CSRcZsDcKP1Xz5JTQd6kxP52bQRxSbQ+9dBC
 lBPMhDuJrbG6/muaWMOzKig92lZh7836YS4kzJBSUHap9cZ9ybrOS6qv7PJEmgLCPQba
 jv7A==
X-Gm-Message-State: AOJu0YwvJTdpZ94Qy9UMdL9xacfr19JV+6F/v5zZu3GzEQznGDjEkrj6
 RM2k5l8KvT1uHeDOsoZylwdIbg==
X-Google-Smtp-Source: AGHT+IE6OWI/jwL5fAJpf23gN7aUq72uxewInPxjPSZWqBYQZCwX8g6+5NggP1C/lPistUSPEAB/pw==
X-Received: by 2002:a17:90b:1d88:b0:27d:3f0c:f087 with SMTP id
 pf8-20020a17090b1d8800b0027d3f0cf087mr18291129pjb.25.1700191507128; 
 Thu, 16 Nov 2023 19:25:07 -0800 (PST)
Received: from yc.huaqin.com ([101.78.151.210])
 by smtp.gmail.com with ESMTPSA id
 20-20020a170902ee5400b001c724732058sm383950plo.235.2023.11.16.19.25.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Nov 2023 19:25:06 -0800 (PST)
From: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
To: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch,
 dianders@google.com, hsinyi@google.com, airlied@gmail.com,
 zhouruihai@huaqin.com
Subject: [PATCH V2] drm/panel: boe-tv101wum-nl6: Fine tune Himax83102-j02
 panel HFP and HBP
Date: Fri, 17 Nov 2023 11:25:00 +0800
Message-Id: <20231117032500.2923624-1-yangcong5@huaqin.corp-partner.google.com>
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
Cc: devicetree@vger.kernel.org,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The refresh reported by modetest is 60.46Hz, and the actual measurement
is 60.01Hz, which is outside the expected tolerance. Adjust hporch and
pixel clock to fix it. After repair, modetest and actual measurement were
all 60.01Hz.

Modetest refresh = Pixel CLK/ htotal* vtotal, but measurement frame rate
is HS->LP cycle time(Vblanking). Measured frame rate is not only affected
by Htotal/Vtotal/pixel clock, also affecte by Lane-num/PixelBit/LineTime
/DSI CLK. If you use a different SOC platform mipi controller, you may
need to readjust these parameters. Now this panel looks like it's only used
by me on the MTK platform, so let's change this set of parameters.

Fixes: 1bc2ef065f13 ("drm/panel: Support for Starry-himax83102-j02 TDDI MIPI-DSI panel")
Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
---
Chage since V1:

- Update commit message.

V1: https://lore.kernel.org/all/20231110094553.2361842-1-yangcong5@huaqin.corp-partner.google.com
---
 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
index 4f370bc6dca8..5f7e7dee8a82 100644
--- a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
+++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
@@ -1768,11 +1768,11 @@ static const struct panel_desc starry_qfh032011_53g_desc = {
 };
 
 static const struct drm_display_mode starry_himax83102_j02_default_mode = {
-	.clock = 161600,
+	.clock = 162850,
 	.hdisplay = 1200,
-	.hsync_start = 1200 + 40,
-	.hsync_end = 1200 + 40 + 20,
-	.htotal = 1200 + 40 + 20 + 40,
+	.hsync_start = 1200 + 50,
+	.hsync_end = 1200 + 50 + 20,
+	.htotal = 1200 + 50 + 20 + 50,
 	.vdisplay = 1920,
 	.vsync_start = 1920 + 116,
 	.vsync_end = 1920 + 116 + 8,
-- 
2.25.1

