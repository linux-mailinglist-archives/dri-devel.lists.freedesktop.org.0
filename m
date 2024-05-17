Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B668C8DBF
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2024 23:37:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D31B10E036;
	Fri, 17 May 2024 21:37:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="cntTaHwd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D27E10E036
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2024 21:37:37 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-1edf506b216so22080395ad.2
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2024 14:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1715981857; x=1716586657;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2eNLlQcUGr08ustxm7tjWdAeIcGj6aFrRwLzzw2mxSA=;
 b=cntTaHwdobCqeUdpe5WGlbbPlOEoyCAfUGZoyRl1nPhzdZm/egKe/oAvu/7eiAvDaM
 RORqcNcHg2qTWL1mzvKD9jOADVYXenNFCJEo5N60cpGpfZq6UGLj5rSD0P/CYUgBZ6t5
 CavxQkkn257qL+E+lvlYhyosoOu0HAd6/L9IA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715981857; x=1716586657;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2eNLlQcUGr08ustxm7tjWdAeIcGj6aFrRwLzzw2mxSA=;
 b=fbxZovsi/qAKn3ecy4ycgi/FxUI5kIRtXBB3Q1tmphyacyXbzStzUeBNshaufF64we
 yhfL3xST/1RoODnlaMdNvh/cr3tfaAEWCk78O5LtM19zokoAERNbML7MeJzv1u35bBcG
 EbuLhnV2auYE8K9WTcxEKQOr47dMPyhSXK36tXdUKw5HDLhrTYLXBacmtyiYztCoVx51
 3uit/yC8dHxOF2tI/+Q8+wWapG4nGCqElbG25iehuFr+wRFfJYvLjn9aInCIhEC6i2bt
 y32Wk2zXoH8SupRqpmRh5C9ESEctk44yjWVJTy5upmfb1wto0OjLK+1aU3pn7biWc6s3
 a6Ug==
X-Forwarded-Encrypted: i=1;
 AJvYcCVv/5sxAR/E7EFx22nVf1J0sXDKvvKt0MD7IId8q5tY53iJW3/32ZcDYkgz7sP4Uv3cK1UMdmrT/IJKL62+cxGigEgEMfSV2WLew2l/7OGS
X-Gm-Message-State: AOJu0Yxl99wSGAPmBz6KatP7dRRxw4Uo1bS36/DW1jYZE3wc5OH0ctaS
 EVVVHf11Fddv7DgAgYKHkZA8qna1luWzbLNZt/m/C2arEvr2C/UZE8HUktPleg==
X-Google-Smtp-Source: AGHT+IGbq1YgMmj1OEV+ca51a5Lig67cuHTnRuhRUs861294NoqU+mz1Ch3XQAPqjZMe6AS7fFAHkQ==
X-Received: by 2002:a05:6a20:3d81:b0:1af:e649:6f4 with SMTP id
 adf61e73a8af0-1afe649086amr21555290637.57.1715981856849; 
 Fri, 17 May 2024 14:37:36 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2620:15c:9d:2:26de:b1dd:5:771c])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-6f4d2b2f8b3sm15168736b3a.211.2024.05.17.14.37.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 May 2024 14:37:36 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Douglas Anderson <dianders@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 =?UTF-8?q?Kamil=20Trzci=C5=84ski?= <ayufan@ayufan.eu>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Ondrej Jirman <megi@xff.cz>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 1/8] drm/panel: himax-hx8394: Handle errors from
 mipi_dsi_dcs_set_display_on() better
Date: Fri, 17 May 2024 14:36:36 -0700
Message-ID: <20240517143643.1.I0a6836fffd8d7620f353becb3df2370d2898f803@changeid>
X-Mailer: git-send-email 2.45.0.rc1.225.g2a3ae87e7f-goog
In-Reply-To: <20240517213712.3135166-1-dianders@chromium.org>
References: <20240517213712.3135166-1-dianders@chromium.org>
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

If mipi_dsi_dcs_set_display_on() returned an error then we'd store
that in the "ret" variable and jump to error handling. We'd then
attempt an orderly poweroff. Unfortunately we then blew away the value
stored in "ret". That means that if the orderly poweroff actually
worked then we're return 0 (no error) from hx8394_enable() even though
the panel wasn't enabled.

Fix this by not blowing away "ret".

Found by code inspection.

Fixes: 65dc9360f741 ("drm: panel: Add Himax HX8394 panel controller driver")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/gpu/drm/panel/panel-himax-hx8394.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-himax-hx8394.c b/drivers/gpu/drm/panel/panel-himax-hx8394.c
index ff0dc08b9829..cb9f46e853de 100644
--- a/drivers/gpu/drm/panel/panel-himax-hx8394.c
+++ b/drivers/gpu/drm/panel/panel-himax-hx8394.c
@@ -370,8 +370,7 @@ static int hx8394_enable(struct drm_panel *panel)
 
 sleep_in:
 	/* This will probably fail, but let's try orderly power off anyway. */
-	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
-	if (!ret)
+	if (!mipi_dsi_dcs_enter_sleep_mode(dsi))
 		msleep(50);
 
 	return ret;
-- 
2.45.0.rc1.225.g2a3ae87e7f-goog

