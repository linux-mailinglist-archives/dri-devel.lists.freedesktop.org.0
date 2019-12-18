Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2496124C04
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 16:46:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0CA26E7DC;
	Wed, 18 Dec 2019 15:46:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFC486E7D7
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 15:46:48 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id f4so4923512wmj.1
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 07:46:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=spj22Kg+dWdyjSNSykFKUU/hDbOBLgtGt0g5yBFUVac=;
 b=b1AS6CxX5nI9P5gV5fLOMWoiZOTh5Yc72/xDMj78dPgssSaHOIuMro9cBLupbrf38J
 rcIq5bCgjTB1DQ9VgunE61IWYLlghOS/mVI6myWrU7FS+g7eVlm4STFVP1Y17B/4qsx/
 gAaROAjMzchyX2CPaGs+Z8blB0Qeo7Pb6zpRvaw9mOkO2G8A14CaKwNPu3c9aI40aLd5
 LIrFCGYIf6/l9IIsrbY2ZfuXGJvbT6GHi3LhLPu0ez9wk4uA7bV9u6FCTbtaM0SsePAh
 /iSafvh6DlYtB3B+L+EO9IG/BuHtoEAoYgd2Syc+DGLOPxOfde8OhBXHZhDABSf5Lwv6
 fZcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=spj22Kg+dWdyjSNSykFKUU/hDbOBLgtGt0g5yBFUVac=;
 b=msFVzr6LfNOleCYROeKNHank8eUSh7jTSQU+nflRDJwSLlh/sQjSxRy0/nRybyQZ+O
 afFaBwC0YP7psByw83eH7agw7YOfWQPECqV+jAKMwJUb1s8J0eDIWKKKwU1lXbJF0PRU
 mot9xj1f7szQCP0HEosmmdbohwHGn+nkLKVy4gl6Xt9SdXX4ufC7yFW6ywPQ/H/rzQWN
 7F2R2yYO8aEFfSJd/cuZ+WizZqQc7Nzdawtd1SjsCRsiqA1191MjQMMXUCYXhPLCreLs
 PPoCgIilr5XI+37sgr9Xw9My7dq22OTKwK2UybFScF+b42Fb8RRUpcGDIu0xoyqL5iSm
 LobA==
X-Gm-Message-State: APjAAAU4ORdZRNWU3YJUH//ydmIuGCsDi6B1v/AjSvi5A7XBTBauy+j3
 FjGPvXcOOWUlztZjOhIK/qjgNg==
X-Google-Smtp-Source: APXvYqw+pDIQ46qs/l7D3sSMhzpMvSIoK6+jQ8CQGtK8rR4qHoA0VQKD5aEh0qODdimQC3lB1EeJZw==
X-Received: by 2002:a1c:ded6:: with SMTP id v205mr4006272wmg.86.1576684007437; 
 Wed, 18 Dec 2019 07:46:47 -0800 (PST)
Received: from bender.baylibre.local
 (lfbn-nic-1-505-157.w90-116.abo.wanadoo.fr. [90.116.92.157])
 by smtp.gmail.com with ESMTPSA id x1sm2891492wru.50.2019.12.18.07.46.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2019 07:46:46 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@siol.net, boris.brezillon@collabora.com
Subject: [PATCH v3 07/10] drm/meson: dw-hdmi: stop enforcing input_bus_format
Date: Wed, 18 Dec 2019 16:46:34 +0100
Message-Id: <20191218154637.17509-8-narmstrong@baylibre.com>
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

To allow using formats from negotiation, stop enforcing input_bus_format
in the private dw-plat-data struct.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/meson/meson_dw_hdmi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
index 8729575777d5..69926d5d8756 100644
--- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
@@ -1032,7 +1032,6 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
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
