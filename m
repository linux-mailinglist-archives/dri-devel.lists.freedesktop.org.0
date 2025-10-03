Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7C6BB7289
	for <lists+dri-devel@lfdr.de>; Fri, 03 Oct 2025 16:16:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C39E310E936;
	Fri,  3 Oct 2025 14:16:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lEbu7RED";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EA5E10E0D2
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Oct 2025 09:19:26 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id
 98e67ed59e1d1-3304dd2f119so1724342a91.2
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Oct 2025 02:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759483166; x=1760087966; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=miqL2nfl182qCuGEXVN6/ipsxsc3oYfM7+xZ2WASv98=;
 b=lEbu7REDp5NNqjiF9RB+D+PkMsALL8u7Jn6SrHahP3RQ+6/cC0im1CA5azuKjBugud
 fYLqyPTuxAGOAvsgs4XF9StFgjqp+785crjLiZMdm7qRmILkj+/L+i5aWMXB7RG2DJj3
 IXfrKQwoVr/bVlp+V0h/y9x0YWfQC2eRI9wgep+g91sssNsPJ1r4AL7qhNdaYGup1WSF
 eLmdPa1rrcu18NcpkEiWCVZ9/fSmGSXC9/sBzl+NDyQ0LhU8bbqv6Du4DoN8OaKKGPFF
 pj7iSRemA8KlvYC97TE1LSwfqn1a8VLM8IOjMNOVU5BkKMksLt6BFhNrc/yTLe8Q2Ssm
 12QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759483166; x=1760087966;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=miqL2nfl182qCuGEXVN6/ipsxsc3oYfM7+xZ2WASv98=;
 b=h2D6Wc3S/jd6WZv4qYFQwOgdQvEX97FpC4o2jLg9a9cTzhUARsGtLbXSFFwZbt1Gbm
 77DP42irJxv0O4nQJAgXdhXoMWGDIq+p293I/OX5TSW19VfssXkqP9qHxuUh9xvG7Mij
 CGRl520sQAjB2bIRZ323893cRX24PiAEwL7Wf7x0TxLGSnhSplwoir12+1wnrLy15SpK
 YHw2ZjOoyF1nKfEXQeojcB7cgJrjPvEug+XTONSlUJb3tuCAm2AgS2VwxMMzx3UXw+v7
 +J4JE+AMXFDN6Vk8BlLcH0DnjwyMumEf12SdQrOp3OpKTLUlwQk6AvWKIYSKpBuqtF/n
 qq4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNqs/O1l9OW3R7akLsD9dDlpFvHuif9NPt2BVpd8VZ1VRi+5Tlw95gyqwXByeQsd3u5Hy0eSrwzS0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwWHPIja0bXXFhyRG6dEvFVVCixXqtRTIOiiLoUVKkm+fHIfJ0L
 jhwdhT8zDtpHJY+JWXRe8u+rkFELHtx1uae7G3CPTwx05EnoXSFKzBmt
X-Gm-Gg: ASbGncvrY1KfVqEhsL7UmNdhXbD+QJTJPK8CQNxnzUcdZY1p1eHTasZJNbqxGvc7omk
 bkV8w6fQ+3xrNz0XKJkRBeEbGEvaTOJ6uQVqU7OV75N+TJRxQgnpbBF4LoOwLjZGaH/Iea2Y1nH
 wU2il4IPXQ/iBrm5e34ArCfMxuwsu2jx1KDrKx/VDLrhgDx/wUj6xQboDmuclp9VTvclZBsOr/A
 TqEaPUmFYJr4nSBX1bOd3TnAnsIXZgS43khNtQwzVl7Qkfd/O8Q43SxPzmzzG76ggmmLUzHo2I4
 1N3zBP9lx6/XCLbX+hBH9Sg4/6sqQqPEK6xe438gI6Gh5BAIgycKW7cGNQnZ2JE06qgKPvdgd82
 gc6dr4vbn8OGCbKC5mH/Txk9vkmRGRH6N9I7arH6NOi/Z6FIqJikd/kpFW6SiUIbt++3Iq/OeMu
 tVGpWpVS0p5rZJHf9iZg==
X-Google-Smtp-Source: AGHT+IHP7V42K1exHHhwAiEhcgdXPEeqQhKkdSrZzwIjkiTs7OXyRTUQVua0JfktO63AZYNNUNjXIg==
X-Received: by 2002:a17:90b:314e:b0:32e:d282:3672 with SMTP id
 98e67ed59e1d1-339c279740amr3104240a91.23.1759483165790; 
 Fri, 03 Oct 2025 02:19:25 -0700 (PDT)
Received: from test-HP-Desktop-Pro-G3.. ([103.218.174.23])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3399bc02e5bsm4164019a91.0.2025.10.03.02.19.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Oct 2025 02:19:25 -0700 (PDT)
From: Sudarshan Shetty <tessolveupstream@gmail.com>
To: andrzej.hajda@intel.com,
	neil.armstrong@linaro.org
Cc: rfoss@kernel.org, Laurent.pinchart@ideasonboard.com,
 tessolveupstream@gmail.com, jonas@kwiboo.se, jernej.skrabec@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm: bridge: ti-sn65dsi83: Fix LVDS output configuration
Date: Fri,  3 Oct 2025 14:49:11 +0530
Message-Id: <20251003091911.3269073-2-tessolveupstream@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251003091911.3269073-1-tessolveupstream@gmail.com>
References: <20251003091911.3269073-1-tessolveupstream@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 03 Oct 2025 14:16:42 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Update the SN65DSI83 bridge driver to improve LVDS output
stability and correctness:

- Program additional device registers during initialization to ensure
   proper LVDS configuration.
- Adjust the DSI mode_flags to match the recommended settings.

Both changes are based on guidance from TI SN65DSI83 experts, addressing
cases where the existing driver configuration was insufficient.

Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
---
 drivers/gpu/drm/bridge/ti-sn65dsi83.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
index 033c44326552..d6a2b20be1fe 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
@@ -613,6 +613,20 @@ static void sn65dsi83_atomic_pre_enable(struct drm_bridge *bridge,
 		     mode->hsync_start - mode->hdisplay);
 	regmap_write(ctx->regmap, REG_VID_CHA_VERTICAL_FRONT_PORCH,
 		     mode->vsync_start - mode->vdisplay);
+
+	regmap_write(ctx->regmap, 0x0A, 0x05);
+	regmap_write(ctx->regmap, 0x0D, 0x00);
+	regmap_write(ctx->regmap, 0x12, 0x53);
+	regmap_write(ctx->regmap, 0x18, 0x6f);
+	regmap_write(ctx->regmap, 0x19, 0x00);
+	regmap_write(ctx->regmap, 0x24, 0x00);
+	regmap_write(ctx->regmap, 0x25, 0x00);
+	regmap_write(ctx->regmap, 0x2c, 0x10);
+	regmap_write(ctx->regmap, 0x34, 0x28);
+	regmap_write(ctx->regmap, 0x36, 0x00);
+	regmap_write(ctx->regmap, 0x38, 0x00);
+	regmap_write(ctx->regmap, 0x3A, 0x00);
+
 	regmap_write(ctx->regmap, REG_VID_CHA_TEST_PATTERN, 0x00);
 
 	/* Enable PLL */
@@ -912,9 +926,7 @@ static int sn65dsi83_host_attach(struct sn65dsi83 *ctx)
 
 	dsi->lanes = dsi_lanes;
 	dsi->format = MIPI_DSI_FMT_RGB888;
-	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
-			  MIPI_DSI_MODE_VIDEO_NO_HFP | MIPI_DSI_MODE_VIDEO_NO_HBP |
-			  MIPI_DSI_MODE_VIDEO_NO_HSA | MIPI_DSI_MODE_NO_EOT_PACKET;
+	dsi->mode_flags = MIPI_DSI_MODE_VIDEO;
 
 	ret = devm_mipi_dsi_attach(dev, dsi);
 	if (ret < 0) {
-- 
2.34.1

