Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF7B8CFD8E
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2024 11:56:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AFA110F9C6;
	Mon, 27 May 2024 09:56:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="TobcduRP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D53310F9C5
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 09:56:03 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id
 d2e1a72fcca58-6f8e9878514so2345902b3a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 02:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1716803762; x=1717408562;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hri39nzdsLHFaL5eQSVV2RnGvDJQcNHW5cuOIUxzRm8=;
 b=TobcduRPr56FydoeX/ySaupUbmrf9IyxXt/FA61aTlXng+4gMYYIesg/UIAC0pov7M
 RYDNdCR9QSKBk/bV/PsFyU46c4XC3OhPuVWQmTkd+wVNEUkrFxXMHaqHFi/nK9qBNlJS
 FDLBaGoBFFJVrePXllQBtEMQT9SiDA9A/LcFQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716803762; x=1717408562;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hri39nzdsLHFaL5eQSVV2RnGvDJQcNHW5cuOIUxzRm8=;
 b=TwgLF3ckgwC70UsZl4tH1KBrg7v9Y9wccSItdI7pb2rSw9InQkpQHPHyXAAubZyGAm
 ajtGLpvawn/hUEid9dRAwk61LkZhJVPF46e/H8ZdAwEDo2qqGvsKa9Yx6PfWK98MSIp0
 FA+Ke4nUg1hr0PKEdIGhTyBvzgT6N3ruL689zfUD6WUqx6xAixO2oMIjCf25HGmPV3za
 /468ZXdrZ4s6OczxruIAWAsiWpc+vE/mAczAl/2UWKi9Lw7jJY41ZVtFe8fsjkagxiRg
 CHE64T5c6PrWAq81IAtcnThNuGjpW5km3fWJCFKCw6+5hKc53mPgnRtIleZquYbSMNZ0
 g5Og==
X-Forwarded-Encrypted: i=1;
 AJvYcCUaLgQ/+rdOIqBLjCX/T36jQiXWTGd7HNoy4tFRLlmjxIJ4fcpnGxBGeYeWfuMNuSVKzb7qJ209dsQC7QsLsdbzH3tKa9dOoSD8xxUzAv5N
X-Gm-Message-State: AOJu0YzjopTNrbQOadFwy/0pjo03YJT0rf7/ZwY/rY9Y+DGqu3kChhcD
 zH1Jq3lYWJ4Jwh9utCW0yfZvN6Eejxqo4+HNa+kCozZN2Ty6kX0ab9/tI/8Aug==
X-Google-Smtp-Source: AGHT+IHUc2Oe5f9342JCi3pcCnVsTBNJ/kRwkv7ILoAyjRnszeU3ZyL9Go0bULUqzpA/VnM1VSbEhQ==
X-Received: by 2002:a05:6a00:8013:b0:6e7:3939:505e with SMTP id
 d2e1a72fcca58-6f8f2c6dd6cmr8236318b3a.2.1716803762447; 
 Mon, 27 May 2024 02:56:02 -0700 (PDT)
Received: from treapking.tpe.corp.google.com
 ([2401:fa00:1:10:a9ab:23f:9d2d:dc0e])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-6fd94372addsm2951616b3a.186.2024.05.27.02.56.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 May 2024 02:56:02 -0700 (PDT)
From: Pin-yen Lin <treapking@chromium.org>
To: Douglas Anderson <dianders@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Pin-yen Lin <treapking@chromium.org>
Subject: [PATCH 1/2] drm/panel-edp: Add support for several panels
Date: Mon, 27 May 2024 17:54:49 +0800
Message-ID: <20240527095511.719825-2-treapking@chromium.org>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
In-Reply-To: <20240527095511.719825-1-treapking@chromium.org>
References: <20240527095511.719825-1-treapking@chromium.org>
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

Add support for the following models:
AUO B140HTN02.0
BOE NT116WHM-N21 V4.1
BOE NT116WHM-N21

Signed-off-by: Pin-yen Lin <treapking@chromium.org>
---

 drivers/gpu/drm/panel/panel-edp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 01e26b5a2388..2688ff1eb14f 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1985,6 +1985,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x145c, &delay_200_500_e50, "B116XAB01.4"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x1e9b, &delay_200_500_e50, "B133UAN02.1"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x1ea5, &delay_200_500_e50, "B116XAK01.6"),
+	EDP_PANEL_ENTRY('A', 'U', 'O', 0x203d, &delay_200_500_e50, "B140HTN02.0"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x208d, &delay_200_500_e50, "B140HTN02.1"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x235c, &delay_200_500_e50, "B116XTN02.3"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x239b, &delay_200_500_e50, "B116XAN06.1"),
@@ -2005,6 +2006,7 @@ static const struct edp_panel_entry edp_panels[] = {
 
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0607, &delay_200_500_e200, "Unknown"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0608, &delay_200_500_e50, "NT116WHM-N11"),
+	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0609, &delay_200_500_e50_po2e200, "NT116WHM-N21 V4.1"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0668, &delay_200_500_e200, "Unknown"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x068f, &delay_200_500_e200, "Unknown"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x06e5, &delay_200_500_e200, "Unknown"),
@@ -2020,6 +2022,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0771, &delay_200_500_e200, "Unknown"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0786, &delay_200_500_p2e80, "NV116WHM-T01"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0797, &delay_200_500_e200, "Unknown"),
+	EDP_PANEL_ENTRY('B', 'O', 'E', 0x07a8, &delay_200_500_e50_po2e200, "NT116WHM-N21"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x07d1, &boe_nv133fhm_n61.delay, "NV133FHM-N61"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x07d3, &delay_200_500_e200, "Unknown"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x07f6, &delay_200_500_e200, "NT140FHM-N44"),
-- 
2.45.1.288.g0e0cd299f1-goog

