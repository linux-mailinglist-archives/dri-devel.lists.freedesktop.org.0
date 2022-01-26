Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C950449D3FC
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 22:01:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 907A110E445;
	Wed, 26 Jan 2022 21:01:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B9F410E445
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 21:01:44 +0000 (UTC)
Received: by mail-qk1-x733.google.com with SMTP id 13so736526qkd.13
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 13:01:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oCWuC818kxptSSDVBuEBTaU6eMFMBR0V0DEYlw49JmI=;
 b=WBd1S9ReDJVLCy600I/GwQ4fkCVbs4o8jCYoLM5Ga8rFrYobPBN3cVRi5KPUyVHAvX
 PAbMzcDUWZ86T1lShRkuJd+mg/440U77DNFBvFtwVXMMKRYpMs8FC9OvkTBznQagWYFK
 2Ys+mv4AsBola0xY8ohxKl61FA/3rCnzhp/9WU3Ypf02mSf3cvMaDDpKidl5tMp0XqDF
 yRr3lum6LzSkfpnVKWZgskut+D+gSMO0aVEkg+IluapNtRWrbabSAPg89TPRnH9xv7DC
 bcj9sb2wMRYBtOmmNbY63A1R0wEYudJMKK1ZpzNHRbrJN3DTRVWOj1pDKk+wX+QMddu8
 fmvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oCWuC818kxptSSDVBuEBTaU6eMFMBR0V0DEYlw49JmI=;
 b=uDJWwkkWipLK5kLNvZleWYvFAl/XMNel3FMPRWvdtBjJo7+FNI5/35DAKEaSgkPQJW
 DCCuDHuZlqPVSt4Q5rzUbhRoaQY64AVlZocUN+02+Z/VgOwoocqfr8esN6mfMxblUsii
 5pW8Akg3Bi/d4JcirPytc631tPAP6TPfzIw34QdiqJCcBiL9mivWo38f6QsENOVGRnVZ
 wdjPMWxg0ViJKeGjYDn7Msl6HoZWmfO0HuI03mwME4vxAryiYsi4vdb/6vMHpSw5sGGB
 Dplyf+6S6CZVoqjlxhwlsMsG4TQ2yd0p4d+6bPNzO+b6ai7a61wQustmbn0KQg7kwmue
 2VKg==
X-Gm-Message-State: AOAM533M4hwZc5KdJK8gYIIhdr84u3dfqRGCVSgK6owPJqFd4SVNgg6l
 /pi0bxiN9/R7O9X+otvqNPk=
X-Google-Smtp-Source: ABdhPJzQwVBWVM0Of40I6QipLyaGCsyPdlGpui0r8AIQ5RKUGPZM8lcMOC7JoZi5KtQ7luELeGDmhA==
X-Received: by 2002:a37:9d42:: with SMTP id g63mr459670qke.83.1643230903092;
 Wed, 26 Jan 2022 13:01:43 -0800 (PST)
Received: from master-x64.sparksnet (c-98-233-193-225.hsd1.dc.comcast.net.
 [98.233.193.225])
 by smtp.gmail.com with ESMTPSA id m4sm237427qkp.117.2022.01.26.13.01.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jan 2022 13:01:42 -0800 (PST)
From: Peter Geis <pgwipeout@gmail.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Archit Taneja <architt@codeaurora.org>, Pierre-Hugues Husson <phh@phh.me>
Subject: [PATCH v2] drm/bridge: synopsys/dw-hdmi: set cec clock rate
Date: Wed, 26 Jan 2022 16:01:37 -0500
Message-Id: <20220126210137.3065508-1-pgwipeout@gmail.com>
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
Ensure before enabling the clock we set it in order for the hardware to
work as expected.
Fixes hdmi-cec support on Rockchip devices.

Fixes: ebe32c3e282a ("drm/bridge: synopsys/dw-hdmi: Enable cec clock")

Signed-off-by: Peter Geis <pgwipeout@gmail.com>
---
Changelog:
v2:
- Set the clock rate before enabling the clock
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 54d8fdad395f..65c16455b76a 100644
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
@@ -3341,6 +3344,10 @@ struct dw_hdmi *dw_hdmi_probe(struct platform_device *pdev,
 		hdmi->cec_clk = NULL;
 		goto err_iahb;
 	} else {
+		ret = clk_set_rate(hdmi->cec_clk, HDMI_CEC_CLK_RATE);
+		if (ret)
+			dev_warn(hdmi->dev, "Cannot set HDMI cec clock rate: %d\n", ret);
+
 		ret = clk_prepare_enable(hdmi->cec_clk);
 		if (ret) {
 			dev_err(hdmi->dev, "Cannot enable HDMI cec clock: %d\n",
-- 
2.25.1

