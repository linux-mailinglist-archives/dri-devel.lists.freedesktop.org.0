Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 570A273F3D1
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jun 2023 07:02:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B11ED10E271;
	Tue, 27 Jun 2023 05:02:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9945F10E271
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jun 2023 05:01:58 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-262d505f336so1210363a91.2
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jun 2023 22:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20221208.gappssmtp.com; s=20221208;
 t=1687842117; x=1690434117; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SzyQSNcjOHsaHAZ3PAkRaxQgaQX5KwIR0vuCWz7Tsjs=;
 b=gzHwLn4wOaOazUZEEeYo+L9zcazP7Smm9v049SKuVhFXtoqg+EYTGClSovaP/9Vb2o
 0fSQHnHaOtvH12CQzhDdIkirHfMb+U+KaGRsX+6pzxyvthMOGUgNU6vW/DPiew5phLdi
 KNTDqMI6sauhG5sSAiOrGw4ylH06JxYl+MalXebD4YfXBDyFnett2QpWutcUt/dlyEfK
 tlhHU4iPQsApSq5Soag8J8AmRQ7KC596qOcYwzWEwSHyp9oVL6d8asl8SRxbtv5ure5m
 rRheczWQwipu7X90Uh/Xnb0BUJ8LKseZMpxB6FUT7nigWiY2fGT7SzeopI+4NWLr446s
 fABw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687842117; x=1690434117;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SzyQSNcjOHsaHAZ3PAkRaxQgaQX5KwIR0vuCWz7Tsjs=;
 b=OAAuojrQ4H174fz43IlHrfHi0LbqKl6FPcS60Rk/wqJPUqVxF+WFawblm553qxZ9bA
 kzpVf8Y5PsDyGYqe6mfiq+BK3OG18pBCosMEYS6QE06X77/SqHy5w2TJeDjB2HN6dy8w
 Z+ETfxOWKvIZRz5vvSaTbYB+P+99eDbPSpfThEw2Q8AdjmU1RhUWdJuY3MIHfTmDG2Uo
 mSUrTjjRoHVzl0dgFDjia51/FYU1Z9ClQf7vqDHo4+ISSxWk3Ge0p6j6+oYk2qFloAdN
 LzbY+MHiP/8Yr75mx0OXcXU4op0PpvLBS/dXiPgpPzN0G5GgWSZ2zQgEBfMdzldoZ0CI
 EuCw==
X-Gm-Message-State: AC+VfDwEgKupNKsX80c+bO4ab6LPt2W+FCOKLlhToouZ4Luq0Iend3A8
 6+OdTtXXONLFKhUVau35eFzlAA==
X-Google-Smtp-Source: ACHHUZ5Qfmqrmo0A86/0Em+JJ9L1w+W9Cm3PVuzsMFP6GWuMHwTWkdxS8Bb73PfQCgCZL9X75rojtQ==
X-Received: by 2002:a17:90b:3909:b0:262:ec71:9371 with SMTP id
 ob9-20020a17090b390900b00262ec719371mr4118131pjb.43.1687842116741; 
 Mon, 26 Jun 2023 22:01:56 -0700 (PDT)
Received: from yc.huaqin.com ([101.78.151.205])
 by smtp.gmail.com with ESMTPSA id
 8-20020a17090a004800b00262d6ac0140sm4686104pjb.9.2023.06.26.22.01.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jun 2023 22:01:56 -0700 (PDT)
From: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
To: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch,
 airlied@gmail.com, dianders@google.com, hsinyi@google.com
Subject: [v2] drm/panel: Fine tune Starry-ili9882t panel HFP and HBP
Date: Tue, 27 Jun 2023 13:01:48 +0800
Message-Id: <20230627050148.2045691-1-yangcong5@huaqin.corp-partner.google.com>
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

Because the setting of hproch is too small, there will be warning in
kernel log[1]. After fine tune the HFP and HBP, this warning can be
solved. The actual measurement frame rate is 60.1Hz.

[1]: WARNING kernel:[drm] HFP + HBP less than d-phy, FPS will under 60Hz

Fixes: 8716a6473e6c ("drm/panel: Support for Starry-ili9882t TDDI
MIPI-DSI panel")
Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
---
v2:
  - Update commit add Fixes tag
---
 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
index 3cc9fb0d4f5d..dc276c346fd1 100644
--- a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
+++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
@@ -2139,9 +2139,9 @@ static const struct panel_desc starry_himax83102_j02_desc = {
 static const struct drm_display_mode starry_ili9882t_default_mode = {
 	.clock = 165280,
 	.hdisplay = 1200,
-	.hsync_start = 1200 + 32,
-	.hsync_end = 1200 + 32 + 30,
-	.htotal = 1200 + 32 + 30 + 32,
+	.hsync_start = 1200 + 72,
+	.hsync_end = 1200 + 72 + 30,
+	.htotal = 1200 + 72 + 30 + 72,
 	.vdisplay = 1920,
 	.vsync_start = 1920 + 68,
 	.vsync_end = 1920 + 68 + 2,
-- 
2.25.1

