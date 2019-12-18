Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C85124C06
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 16:47:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 300AC6E7DD;
	Wed, 18 Dec 2019 15:46:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 054806E7D7
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 15:46:45 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id q9so2335020wmj.5
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 07:46:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HS90VjGTEgPLwoS07O26nuJB7gxxS9CD1cnSI1IU66I=;
 b=fDwnwLMtw3uOHsVJkA+Sxz35a/DRK14VjnfBHoxmw+sub14JCsrV3biDAx5fbrQ30n
 bzbtOHe5126TPWkHhYQKOWlwX38XHenTKd7WCgPbXfmj2geKxFlou39QgO5VHTLUbA9e
 70Si2uXmHxGHZEC9XAZZT04cy2SjuOAJrJfQb+gR3/LeMRF8RLdd7lJUNeiiPwqIYaS0
 GQ3e3jiqyoH3xcO12avGq3Yt5/6OemFDqKKrxovlc2roINAJetJ0o6urhqLfpX/oBSup
 4TF6u8afr1873ygcxCRYuey9XoBBSa25fpoijdK8HNqoXDcBjYGX8S2wgzYNT5Rikw4n
 RYyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HS90VjGTEgPLwoS07O26nuJB7gxxS9CD1cnSI1IU66I=;
 b=dLq54kcAh8u3iJFbBa+7PzbmXaBE91BTriA3P9DctXb2dhsR1wVslG2jougjTQkRFU
 deu7huoEV3KXRUNbGQuj3Cf+svqA/LOzkLqKQAFLHEUXsKvM0Tpl532qww8cuuwdzylt
 /Xd2IixLeXfWc/RGQ/ITb7NlgmtlX9QFWQ1m800YG1G9yb7UD154C7OXFgkkMLqB/i+t
 yXxEXdvBGHv+esmDrdB2Cos5HwLKX6FMjRnwzOUdJZOpsB6gJUWSBpP09dLfYnyJ2rzw
 fKiVF45e5QtTz7p2zLOSP9ZXDKQcHvX4coRmn2zmbtZMz5Tar65cb5+sgjjVq+Lm2qr3
 YcPg==
X-Gm-Message-State: APjAAAUmZHE7fhx9MXcPCpfWBHsKx2vOPWVrOxhW8M8zMNO4uTEUg70z
 h7G+tutjb6phrIiakDvxQm++pA==
X-Google-Smtp-Source: APXvYqzMxHZU54rjVdvdQilWUCjDI7zSWqhv9fM1JYbrPdMsusPqlZYyBJj6ngYbYwqGl/RqMDtDfw==
X-Received: by 2002:a1c:5419:: with SMTP id i25mr4119475wmb.150.1576684004437; 
 Wed, 18 Dec 2019 07:46:44 -0800 (PST)
Received: from bender.baylibre.local
 (lfbn-nic-1-505-157.w90-116.abo.wanadoo.fr. [90.116.92.157])
 by smtp.gmail.com with ESMTPSA id x1sm2891492wru.50.2019.12.18.07.46.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2019 07:46:43 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@siol.net, boris.brezillon@collabora.com
Subject: [PATCH v3 04/10] drm/bridge: synopsys: dw-hdmi: allow ycbcr420 modes
 for >= 0x200a
Date: Wed, 18 Dec 2019 16:46:31 +0100
Message-Id: <20191218154637.17509-5-narmstrong@baylibre.com>
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

Now the DW-HDMI Controller supports the HDMI2.0 modes, enable support
for these modes in the connector if the platform supports them.
We limit these modes to DW-HDMI IP version >= 0x200a which
are designed to support HDMI2.0 display modes.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 6 ++++++
 include/drm/bridge/dw_hdmi.h              | 1 +
 2 files changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 8c1f7e5e6698..bb87b87c752e 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -3189,6 +3189,12 @@ __dw_hdmi_probe(struct platform_device *pdev,
 	hdmi->bridge.of_node = pdev->dev.of_node;
 #endif
 
+	if (hdmi->version >= 0x200a)
+		hdmi->connector.ycbcr_420_allowed =
+			hdmi->plat_data->ycbcr_420_allowed;
+	else
+		hdmi->connector.ycbcr_420_allowed = false;
+
 	memset(&pdevinfo, 0, sizeof(pdevinfo));
 	pdevinfo.parent = dev;
 	pdevinfo.id = PLATFORM_DEVID_AUTO;
diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.h
index fbf3812c4326..19e30cdd35bf 100644
--- a/include/drm/bridge/dw_hdmi.h
+++ b/include/drm/bridge/dw_hdmi.h
@@ -127,6 +127,7 @@ struct dw_hdmi_plat_data {
 	unsigned long input_bus_format;
 	unsigned long input_bus_encoding;
 	bool use_drm_infoframe;
+	bool ycbcr_420_allowed;
 
 	/* Vendor PHY support */
 	const struct dw_hdmi_phy_ops *phy_ops;
-- 
2.22.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
