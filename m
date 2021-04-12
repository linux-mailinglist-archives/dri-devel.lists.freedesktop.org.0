Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A582035C1B0
	for <lists+dri-devel@lfdr.de>; Mon, 12 Apr 2021 11:39:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34F606E424;
	Mon, 12 Apr 2021 09:39:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC6B86E3FE
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Apr 2021 09:39:39 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id a4so12198481wrr.2
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Apr 2021 02:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Q4YDvpAD1UGIZmGY7ATXAVL5J0kUewQGcgvVMVoEerk=;
 b=eUPqdTia5iFGBnU+yibNZFt8DEHCfvTTXCKdGvWosxt5hgzyijv+ZMjBvmmVh+K3nc
 cGluFdswEu4BADOWi0qosoBXasU4r3Hh9F3dM9yr/hgCKNx0zicuRBFeaG8TG6n4ZXA5
 6XPp/YIIWQ3GlSSDFT2A7Uq1RIUT/3D1hHcxKj07dlfX3YuAZ5SaIz4ng87sRS0HSEu4
 54/HVMBdy6xi93Dxe3nnTwg+8AMcfE8/BhJEFuX44v4QL5YQk8ILOEfKJKl0hSfAaO5d
 +x48W2GH7x97MA8qr7wFbIohjIu+MzmMMH8xwiT+ag8EVdw0KLW7SfZDKQiNjj2U7NV9
 ucog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q4YDvpAD1UGIZmGY7ATXAVL5J0kUewQGcgvVMVoEerk=;
 b=L9WuJZAXjp0wb8qtTH+wkduPS35Hi1qPRHivwp+ec7MA8vGLHZndfw6IHAOQNTCr3r
 cxO3lRydmMAfZR5Z/A+ZisfXD719OrTVM3lNVVWNo3plF6fZqkKFFaEC88Rx+IGOf2WX
 4bUVMPSLoWSvbnRk1nXmTeeVGO/j9M2uQX0xK+LejhiLDErYPNPG4egfgZQUzUu8lEDj
 4BkEy4zRoa2Vf7zTOvazCk++YK0pFO4pvyXvr+qjSwvqj0zyJC1Xl9uMnMBBd4nJ11uj
 y5Xog0FVpdCgT3ept6bB0w+zv1IiDWQI0KBP2YzDjvk/dtzh/ouMZzZSyT6WmD1/RCdz
 L/yA==
X-Gm-Message-State: AOAM531G7SM/QBuj7IbnN/x1RIuzZMYFakZ9lG73tMEf5vSBzgE/Ofqb
 G1sMkBpiY/7Nl8Gjz3dgPTy5OQ==
X-Google-Smtp-Source: ABdhPJxigmfZSCdDY1wqLPhfhhfh2s9j7fmTwvG4DM80AXXv5sUawdrPx6YzpUHMmhfQo3YB3ijV/Q==
X-Received: by 2002:adf:fbc8:: with SMTP id d8mr30640128wrs.94.1618220378404; 
 Mon, 12 Apr 2021 02:39:38 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:90c:e290:4c21:b00e:ff79:bf20])
 by smtp.gmail.com with ESMTPSA id
 r22sm14405902wmh.11.2021.04.12.02.39.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Apr 2021 02:39:38 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de,
	matthias.bgg@gmail.com
Subject: [PATCH v2 4/5] gpu/drm: mediatek: hdmi: add optional limit on maximal
 HDMI mode clock
Date: Mon, 12 Apr 2021 11:39:27 +0200
Message-Id: <20210412093928.3321194-5-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210412093928.3321194-1-narmstrong@baylibre.com>
References: <20210412093928.3321194-1-narmstrong@baylibre.com>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Fabien Parent <fparent@baylibre.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some SoCs like the MT8167 have a hard limit on the maximal supported HDMI TMDS
clock, so add a configuration value to filter out those modes.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 0539262e69d3..bc50d97f2553 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -149,6 +149,7 @@ struct hdmi_audio_param {
 struct mtk_hdmi_conf {
 	bool tz_disabled;
 	bool cea_modes_only;
+	unsigned long max_mode_clock;
 };
 
 struct mtk_hdmi {
@@ -1226,6 +1227,10 @@ static int mtk_hdmi_bridge_mode_valid(struct drm_bridge *bridge,
 	if (hdmi->conf->cea_modes_only && !drm_match_cea_mode(mode))
 		return MODE_BAD;
 
+	if (hdmi->conf->max_mode_clock &&
+	    mode->clock > hdmi->conf->max_mode_clock)
+		return MODE_CLOCK_HIGH;
+
 	if (mode->clock < 27000)
 		return MODE_CLOCK_LOW;
 	if (mode->clock > 297000)
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
