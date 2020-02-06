Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 780C2154BDD
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2020 20:19:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D2296FB25;
	Thu,  6 Feb 2020 19:18:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E1276FB22
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2020 19:18:49 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id z9so8542329wrs.10
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Feb 2020 11:18:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UkuWKP+kehiiAt4mXS862G4zA31oHWX/RYq3ofBu8tk=;
 b=ha2GwyAkKH+wQTq5xCi9nQNnmfGBBVIce9Y5Sg12TGCZrAzeP+RGf65fuetUKjjMUJ
 2Fg+RguaV/wmAUU1N6DHR5r+++SACqqlDMoLAE8U9fL5nWfYQWo25ZdJyBHqD2itLHi3
 ObuvjedL3QFRydd28qghCwSDyR5QN9Lx5ciWCUwqhht9quMK1VCGSdmoXikjZysE2PCL
 OTticgeSt5OfFjuEsgfGW3ZXyKZT4Zz/wH7Loq13OyICgYHKx7XB5ng1xghlx21xXb+g
 8zel5aicZvw0VfH2W7bbfrV5O1VVnPaJGu9BjqULuDEGqJShtxMfcbmp5M4DgmlR3n+M
 ExRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UkuWKP+kehiiAt4mXS862G4zA31oHWX/RYq3ofBu8tk=;
 b=hniyub9L4ZibBoCgFAtfoWHyL/mg9kCXLpty7mRSjAw7jAjzjmWffqdZunkGivp5DG
 lkrMJ9oOU9ZL8AEfOWDirdiIApFz5Q7NUC/eobckAVLaeAp9IoiCwdjodLHbjjrmobtf
 vcMapywpCFszT5ZZx+YNE4RtVK1Jq1AGTUDiWb2NSno7ryC8tSfvxiPaFUQZpMsAOxmc
 cLDlqatvwGUAaRCf4GE+YkqbNDBa3AOFUUOzudYek07Lv0NI6C1A+rrHzrZvmtrapOVh
 on3TN4i4cTy4VocThWOT9AaKLaETGVp36+R7cz6KMLFHlmNvh085qgCjTiGcwFr9gnWE
 xccQ==
X-Gm-Message-State: APjAAAWG9G4745GqLuJd5y+JqWjv9Rz1W5rGTwLjH1d680+FCOFjvonS
 RDT12FCH9NjmSP18H91eduFDqw==
X-Google-Smtp-Source: APXvYqzEj013w06qtPlR99peGGjw52cz7evogyeuvqZ4vvfjeTP98U7JJ7Cs6Dto9PL2/CzyoLFsww==
X-Received: by 2002:adf:a285:: with SMTP id s5mr5600926wra.118.1581016727891; 
 Thu, 06 Feb 2020 11:18:47 -0800 (PST)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:7d33:17f7:8097:ecc7])
 by smtp.gmail.com with ESMTPSA id m3sm272662wrs.53.2020.02.06.11.18.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2020 11:18:47 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@siol.net, boris.brezillon@collabora.com
Subject: [PATCH v4 08/11] drm/meson: dw-hdmi: stop enforcing input_bus_format
Date: Thu,  6 Feb 2020 20:18:31 +0100
Message-Id: <20200206191834.6125-9-narmstrong@baylibre.com>
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

To allow using formats from negotiation, stop enforcing input_bus_format
in the private dw-plat-data struct.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/meson/meson_dw_hdmi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
index 4b3809626f7e..686c47106a18 100644
--- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
@@ -1035,7 +1035,6 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
 	dw_plat_data->phy_ops = &meson_dw_hdmi_phy_ops;
 	dw_plat_data->phy_name = "meson_dw_hdmi_phy";
 	dw_plat_data->phy_data = meson_dw_hdmi;
-	dw_plat_data->input_bus_format = MEDIA_BUS_FMT_YUV8_1X24;
 	dw_plat_data->input_bus_encoding = V4L2_YCBCR_ENC_709;
 
 	if (dw_hdmi_is_compatible(meson_dw_hdmi, "amlogic,meson-gxl-dw-hdmi") ||
-- 
2.22.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
