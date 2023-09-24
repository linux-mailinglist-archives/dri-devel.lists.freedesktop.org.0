Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 824BC7ACBA4
	for <lists+dri-devel@lfdr.de>; Sun, 24 Sep 2023 21:26:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E30B8905A;
	Sun, 24 Sep 2023 19:26:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72EAF10E133
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Sep 2023 19:26:15 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-99c93638322so1194065766b.1
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Sep 2023 12:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695583574; x=1696188374; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d66F58Zyq56V9Vs4Hyo0TkmljKT89gyNoM7Khlph/EE=;
 b=GBq3f7Ghbc20gh+JduRz49lzYjQuS1i0aZN40Hj4Svrjp3Ozj+mckXfV9g3fd9elug
 uOo0Pb/tm9ulpDRIsbjPXNYsIzz5RsErYSY3lTXsvDB5SHpt0lfAFEcuf0Go0Z8hpmrd
 Ohdkg2ny5qdussv3F6Yhxy0/VhEVlnphTDPEx5XwK38y2G0PLGNGBvum3MrbaMO26Ll8
 +AaxA+3YttEDsLBDjjPo9bCcPXKeVWW9PC0c6ZTLdwRnu+wgbIsjgEttKSic+hsjNQNL
 GuLwQFCFuOfnbgLTRuxdCebsum9Ra0YHgo8Ljshz3ARrgNnMctenxLdRmN3EykVp2G38
 qFwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695583574; x=1696188374;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d66F58Zyq56V9Vs4Hyo0TkmljKT89gyNoM7Khlph/EE=;
 b=UusXxIIpoGnXDwFLV+1KAtfDcdcGuYYHEbSDgjJLjLuVBg3ztIxAiV0JjiHZrfUaCS
 Qs+CdB3CZY85RKPDoQs8anBWNgWrKkRBZotGv32/YksoE6hYLstbetc9J2w6MICZLtCe
 YoO+uJUeHNxpcwqQwhXlzqnZQZvxkyt9apzUVR+VI1o63jHYcUV90YaSSTws8AuNhN+j
 fU0WndOpVYf8+mlCLsxq9kjFbXcbojBljcPb7qQ1p0Gv3FockNettM3xG69kO5OMo3CN
 Ng/iXgALyqhyI7OU2Q8MBsNLTRSFDuT0nZpTU58YV8GoBSACQzr1brGmWnbIV0qkJw46
 kL4w==
X-Gm-Message-State: AOJu0Yx57noxZ5hetC69kxB1kGLMnAcnU7aW4/+67mA4wVaUX4m1bcbF
 erH1YkVWm7iPh++D5LRy+8E=
X-Google-Smtp-Source: AGHT+IGtAxBgqINvPVkn897Kub7Z+3KXI91OPf9r4wroQNRiKNPXXt+0g0rub6eEA+V8/peXL8DyGw==
X-Received: by 2002:a17:906:74d3:b0:9ae:614e:4560 with SMTP id
 z19-20020a17090674d300b009ae614e4560mr7802850ejl.29.1695583573619; 
 Sun, 24 Sep 2023 12:26:13 -0700 (PDT)
Received: from localhost.localdomain (82-149-12-148.dynamic.telemach.net.
 [82.149.12.148]) by smtp.gmail.com with ESMTPSA id
 z21-20020a1709063a1500b0099d0c0bb92bsm5317632eje.80.2023.09.24.12.26.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Sep 2023 12:26:13 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: mripard@kernel.org,
	wens@csie.org
Subject: [PATCH 1/7] drm/sun4i: dw-hdmi: Deinit PHY in fail path
Date: Sun, 24 Sep 2023 21:25:58 +0200
Message-ID: <20230924192604.3262187-2-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230924192604.3262187-1-jernej.skrabec@gmail.com>
References: <20230924192604.3262187-1-jernej.skrabec@gmail.com>
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
Cc: samuel@sholland.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit 9bf3797796f5 ("drm/sun4i: dw-hdmi: Make HDMI PHY into a platform
device") removed code for PHY deinitialization in fail path.

Add it back.

Fixes: 9bf3797796f5 ("drm/sun4i: dw-hdmi: Make HDMI PHY into a platform device")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
index 4727dfaa8fb9..0b647b030b15 100644
--- a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
+++ b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
@@ -203,6 +203,7 @@ static int sun8i_dw_hdmi_bind(struct device *dev, struct device *master,
 
 cleanup_encoder:
 	drm_encoder_cleanup(encoder);
+	sun8i_hdmi_phy_deinit(hdmi->phy);
 err_disable_clk_tmds:
 	clk_disable_unprepare(hdmi->clk_tmds);
 err_assert_ctrl_reset:
-- 
2.42.0

