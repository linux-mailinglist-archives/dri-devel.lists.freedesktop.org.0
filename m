Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4AC549D361
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 21:24:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 772F010E337;
	Wed, 26 Jan 2022 20:24:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com
 [IPv6:2607:f8b0:4864:20::835])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FE2510E91D
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 20:24:51 +0000 (UTC)
Received: by mail-qt1-x835.google.com with SMTP id c15so740578qtv.1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 12:24:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jx0fEdivrdIheYkmyUPfrhwIwpeLJHBEwq8uDdSjGFg=;
 b=nmmplP3DBvZ0FwYQd0TzFsbhI5oKxxSkpNdZtEXTpy6RAUjjL1zKnr075WtAw3Mf7j
 /R2PePkGFB+qf0lOPWUFU5ZRK/DOlsQmvZKJRa2YjM2tjoL6ZUmUN7e0Xk0Cl4jub/1K
 5dpsUF0FaBmHxtkNEaCMO6c2BcaQ/bhWTMKDRr/aXwzS1y7o6ctNg7n6y0VyGIimhqaS
 336VUgUXwWjxDWvVlT1vCHurjqIAjzbRdio4W8HrRA72txkvsZCjnFOSD5HIdwHWdfyK
 VhdlJJufslYZGSXlyU22yI/tDnE6FP/ueYbrGB0wAsiLhTCkT3XUNQWMDR0fme37CW0Z
 +m5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jx0fEdivrdIheYkmyUPfrhwIwpeLJHBEwq8uDdSjGFg=;
 b=M4b1vM5qx59XJejYavZ151OWTUWvyLrZ9FT3WarfLRnPG2Prlxrlyb3MvK6q79bMPl
 4Jl2b1UckA2EZJ9kCjtWX3kYfecTr74KpiTbEuMFpNUeABul8xt9LxOcgDCwNvjuGe3f
 LM0RZFN94Kht4L/o2YBW6JGQ0aN85ynmvk/UeNwgz2QVRcG8DixMZ/msTd4koLmSh15a
 /8J6Qts8EBVWzh5KCizb5TsdV35xgSZwH+ybSIru7o9JviRLYx3dedwjWo3JYI79p0xv
 KAwn+mdeAUIoCDon2Bc51Hhgf4HzAwrxkJ8XpqTvFrXc3SfSKdNKdHvWGHs+VtH/q0bO
 6eWQ==
X-Gm-Message-State: AOAM533nLm21rLOeApfHLFJpkJB9mxs17UBuRemZ7atT1r9T/wAW7pZi
 /w9fg85VisO9u/3qbfu/O9o=
X-Google-Smtp-Source: ABdhPJzIvG8w863V8BukY+aumjHs5OcXH1DEGp8Dr6rScyQRiIvp25H6dbt8r+PUW3hnebEVDZor7Q==
X-Received: by 2002:ac8:74cc:: with SMTP id j12mr355803qtr.374.1643228689310; 
 Wed, 26 Jan 2022 12:24:49 -0800 (PST)
Received: from master-x64.sparksnet (c-98-233-193-225.hsd1.md.comcast.net.
 [98.233.193.225])
 by smtp.gmail.com with ESMTPSA id a21sm155311qta.65.2022.01.26.12.24.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jan 2022 12:24:49 -0800 (PST)
From: Peter Geis <pgwipeout@gmail.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Pierre-Hugues Husson <phh@phh.me>, Archit Taneja <architt@codeaurora.org>
Subject: [PATCH] drm/bridge: synopsys/dw-hdmi: set cec clock rate
Date: Wed, 26 Jan 2022 15:24:26 -0500
Message-Id: <20220126202427.3047814-1-pgwipeout@gmail.com>
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
Cc: Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 Peter Geis <pgwipeout@gmail.com>, Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The hdmi-cec clock must be 32khz in order for cec to work correctly.
Ensure after enabling the clock we set it in order for the hardware to
work as expected.
Warn on failure, in case this is a static clock that is slighty off.
Fixes hdmi-cec support on Rockchip devices.

Fixes: ebe32c3e282a ("drm/bridge: synopsys/dw-hdmi: Enable cec clock")

Signed-off-by: Peter Geis <pgwipeout@gmail.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 54d8fdad395f..1a96da60e357 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -48,6 +48,9 @@
 
 #define HDMI14_MAX_TMDSCLK	340000000
 
+/* HDMI CEC needs a clock rate of 32khz */
+#define HDMI_CEC_CLK_RATE	32768
+
 enum hdmi_datamap {
 	RGB444_8B = 0x01,
 	RGB444_10B = 0x03,
@@ -3347,6 +3350,10 @@ struct dw_hdmi *dw_hdmi_probe(struct platform_device *pdev,
 				ret);
 			goto err_iahb;
 		}
+
+		ret = clk_set_rate(hdmi->cec_clk, HDMI_CEC_CLK_RATE);
+		if (ret)
+			dev_warn(hdmi->dev, "Cannot set HDMI cec clock rate: %d\n", ret);
 	}
 
 	/* Product and revision IDs */
-- 
2.25.1

