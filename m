Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E4A8BA433
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 01:48:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D6D610E2B8;
	Thu,  2 May 2024 23:48:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="clk65BER";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com
 [209.85.160.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7012310E892
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2024 23:48:51 +0000 (UTC)
Received: by mail-oa1-f52.google.com with SMTP id
 586e51a60fabf-23cd15209fdso2397334fac.3
 for <dri-devel@lists.freedesktop.org>; Thu, 02 May 2024 16:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1714693730; x=1715298530;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RXJmwjLLfXijbHQ77pXOxLke34rf/p881w66RrP7meg=;
 b=clk65BERqbNOLmNLf/1GuPgeAEdnayBYnyi5TY+tOZ4rCXbVvUhRJs9sDIWUy7Mip6
 HwWpEzm3CB9MCGkShZ1mU8pX7ec6c8UA4Mp5jFopumGfMRMXUz1VIKoM+HUfcz2+ZKvb
 eoSjGy4H7zU6lxqUSpkZmF2LUqzudZkELQxjY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714693730; x=1715298530;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RXJmwjLLfXijbHQ77pXOxLke34rf/p881w66RrP7meg=;
 b=aZ8dEgdCdhedTYCLRvxjeuTgNWdqfaOJ+NoR88Pj6PxkQvFQz2/IQp2xzzuepqBvkI
 uhYTM5YeBlI/Cub9J4wPjeKINzLCYNS/yYwnI34lw6uPorRH+UBMZh5/7bCjefFTM0o5
 wRAQcPbHrIQ1Qu4kEFWauQJBif+71SovvwN7vYNav3JP/fnHGpg/wWDpbNNh0Td1qaDE
 ol6+u+8yPoYkKh0tpF5buTRBfa8htxH3kp7Hdnfm5bBFHf10NffG3pmLm7YeKoZPk4pb
 n9R+Ww8X7TS4eF5mlAVg4DcYn54+GJ3ggAxIx0t9eu+mEH+KjSLDq73AYMjuOIdrVzdK
 2gjQ==
X-Gm-Message-State: AOJu0YzaiC/y4pZ/kkWPPER7u9cNWHeuLvKm5tkdtRj3plWCmk+ibdQR
 /LU5Y4dfdxIdDarEq6cOHM/J+ngPHQBoaJ22rLskFSAXs55TPbF546f5Q3Tj4c+yKoWnZGen0Wc
 5ZA==
X-Google-Smtp-Source: AGHT+IFOZOl17eOR3MtgDxnITFsr+fNeEqGSZ1NUEfGyThSYh+x1eXFaCgEw/AFQ2TIdvCrRkI9+QQ==
X-Received: by 2002:a05:6871:33a9:b0:23d:4124:457b with SMTP id
 ng41-20020a05687133a900b0023d4124457bmr1507565oac.36.1714693729999; 
 Thu, 02 May 2024 16:48:49 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:d58d:52de:fc6:7f45])
 by smtp.gmail.com with ESMTPSA id
 o18-20020a639a12000000b0061ce6606203sm181355pge.58.2024.05.02.16.48.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 May 2024 16:48:49 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org
Cc: Hsin-Yi Wang <hsinyi@chromium.org>,
 Douglas Anderson <dianders@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/panel-edp: Add ID for KD KD116N09-30NH-A016
Date: Thu,  2 May 2024 16:47:47 -0700
Message-ID: <20240502164746.1.Ia32fc630e5ba41b3fdd3666d9e343568e03c4f3a@changeid>
X-Mailer: git-send-email 2.45.0.rc1.225.g2a3ae87e7f-goog
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As evidenced by in-field reports, this panel shipped on pompom but we
never added the ID and thus we're stuck w/ conservative timings. The
panel was part of early patches but somehow got left off in the
end. :( Add it in now.

For future reference, EDID from this panel is:
	00ffffffffffff002c82121200000000
	321e0104951a0e780ae511965e55932c
	19505400000001010101010101010101
	010101010101a41f5686500084302820
	55000090100000180000000000000000
	00000000000000000000000000000000
	000000000000000000000000000000fe
	004b443131364e3039333041313600f6

We use the ASCII string from decoding the EDID ("KD116N0930A16") as
the panel name.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/gpu/drm/panel/panel-edp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 6db277efcbb7..9cfa05c7d193 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -2094,6 +2094,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('K', 'D', 'B', 0x0624, &kingdisplay_kd116n21_30nv_a010.delay, "116N21-30NV-A010"),
 	EDP_PANEL_ENTRY('K', 'D', 'B', 0x1118, &delay_200_500_e50, "KD116N29-30NK-A005"),
 	EDP_PANEL_ENTRY('K', 'D', 'B', 0x1120, &delay_200_500_e80_d50, "116N29-30NK-C007"),
+	EDP_PANEL_ENTRY('K', 'D', 'B', 0x1212, &delay_200_500_e50, "KD116N0930A16"),
 
 	EDP_PANEL_ENTRY('K', 'D', 'C', 0x044f, &delay_200_500_e50, "KD116N9-30NH-F3"),
 	EDP_PANEL_ENTRY('K', 'D', 'C', 0x05f1, &delay_200_500_e80_d50, "KD116N5-30NV-G7"),
-- 
2.45.0.rc1.225.g2a3ae87e7f-goog

