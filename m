Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8CBD154BDF
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2020 20:19:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3D6A6FB27;
	Thu,  6 Feb 2020 19:18:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84E1F6FB1E
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2020 19:18:45 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id t2so8599595wrr.1
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Feb 2020 11:18:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=e3qTczoW82L1nczYwcOGhiZ1KM1HmNc7LgyXt8NRxHA=;
 b=ewZ0X+0oLLxN96enhnKX1bzkTGICZq+WMiKedc8D88EQ5Cg8fGH+rFRiPsbyciYrSi
 4L5lbf9D/AnFkiCqqms7LGApV0le6xaa5D9nc/FWyV4Nrscl+iIUNJLY6tvD/DRLlN5H
 /mhXhtuMBGpJVJQsALFqJKMvNqvOZwUP2C3OwUPtheMnLsM0ggfKz+t44ilu7Xv+DbbB
 IEnLyg5bT36ZqcJ04Nnd3L7wLM90k3rqndg3wIP9psa57RcVJaj9WzLXOPq/sCtK3FGc
 2agblq0bI8LHvcfnz0aHOGpjEqg8FleqC8scoDhHsKNbuOzo/VV4bH9syqSfSsaju+y+
 uvQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=e3qTczoW82L1nczYwcOGhiZ1KM1HmNc7LgyXt8NRxHA=;
 b=TJ/NDIFUuvuoNZEoDYB3dnBwcdhKdS//Qwq8HGxzrdhE3uVr2UrPoLwku+lB9cvDBl
 TGlmCN1OcwLn6R3xhY118cFq4j4WQLNNLmb5p43BdpONsTx3cR8G9vofsYvzVvOKjToy
 XmQEvWqyiZwtb9x6yw6noqVzWr6oYwt2wzA6K9lEBZuHc2rXEywxH7Dv8qF8V5M//etN
 mjz6RsVXcp13iMKTe9lpKQMl4nXI0/xd4hqdHMqm+qH7ct0pZLxce5TLBJ+x0GdjxnyV
 JK3MLUPZ8wsLrCRJK7JhOuEFjLKFcL9B/kK9kgal/fsIjnsie87736p6hQ69tjXKDkgt
 hd1w==
X-Gm-Message-State: APjAAAXFX/RViaRpVXXfKRBecgoufkL5sG+jECKZ5aamAfdw/Dqqk5Go
 ErO+Vib6hlxn8LcB+PIE+ZyW0w==
X-Google-Smtp-Source: APXvYqwIOTKJnzwY5IhgDVKhEwIYcVqUnwAuTSERF3IoD/aDj3BwVe9eZ9tmY2zQ2QKNOq15gkDtZQ==
X-Received: by 2002:adf:a453:: with SMTP id e19mr5132981wra.305.1581016724045; 
 Thu, 06 Feb 2020 11:18:44 -0800 (PST)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:7d33:17f7:8097:ecc7])
 by smtp.gmail.com with ESMTPSA id m3sm272662wrs.53.2020.02.06.11.18.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2020 11:18:43 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@siol.net, boris.brezillon@collabora.com
Subject: [PATCH v4 05/11] drm/bridge: synopsys: dw-hdmi: allow ycbcr420 modes
 for >= 0x200a
Date: Thu,  6 Feb 2020 20:18:28 +0100
Message-Id: <20200206191834.6125-6-narmstrong@baylibre.com>
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
index 15048ad694bc..4b35ea1427df 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -3231,6 +3231,12 @@ __dw_hdmi_probe(struct platform_device *pdev,
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
index 9d4d5cc47969..0b34a12c4a1c 100644
--- a/include/drm/bridge/dw_hdmi.h
+++ b/include/drm/bridge/dw_hdmi.h
@@ -129,6 +129,7 @@ struct dw_hdmi_plat_data {
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
