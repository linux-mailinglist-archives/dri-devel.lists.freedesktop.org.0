Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1687B8CFD8F
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2024 11:56:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B78B10F9D1;
	Mon, 27 May 2024 09:56:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="jA3A4CAH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F49410F9C9
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 09:56:10 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-6f6bddf57f6so6289045b3a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 02:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1716803769; x=1717408569;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cYq43fmtb+4UHKmDuikNl6P8Zva6K1Fw4vNwaOjA/dQ=;
 b=jA3A4CAHSmpn5bAMCpmwIN+bsPk7zWKq2L0vNIuIm6uamuheIgY1P0VGWnoUCz3iPF
 eMXmmuz+Nb+13pGpNcgcH2VvGuAr/62KnZ/HOjVf2GuYXDACSErTAQ0pmKPGUDEiacl2
 7O3Z4QStpKkNhRkuG6QDcw20jstJD31IGk5w4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716803769; x=1717408569;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cYq43fmtb+4UHKmDuikNl6P8Zva6K1Fw4vNwaOjA/dQ=;
 b=gUk67aI71tFLEzHE4TxsFRnawJsbN7q+LzXucMzuv8IrwKx4MRzb3sGIFpOQiR6iQ7
 WCphzi0Xd1giI5rP1THn7cD2GYazd3ElR0y3dwzoh/pqIOSV0xGtR2dcSx51NeLXUOI+
 4GmZiyDtVDCTh9KXGKjajnCOszAytHOSX6M7zUMgdQJmiXXOVftwTvNckzTuHnqFbwul
 p7uuN0vYfP0jH+TdhtDoNyYswKzHv48pVGTzMIfDuXf4gh5TszyangjYWE3qfnRPqHlx
 pMQeMeHt8yTpUA8udeUueBMjxs/YCuoe308KaZ6ocMChE9Chd9kQNhcxXryesShnJgWL
 VUxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXi7X1a6sU90c0jcFTTCCqHM9FrFDKwuUq9GFB1vmiCXkP7qcD7XAZ/AalVpzmGEewIg/fgx9uL/PItoZBd1Baj/HuF7NyL9jjnYQTtBeAp
X-Gm-Message-State: AOJu0YyIlDkTGhfK3JJSWLV8UOnHmBZEUbmVFfu9BmbRVqItNfbTASqO
 fBw6+TCahoPyfHN67XRxSqXkDwJOePfoCw1CID9OjO+X73XPG/H2DAwbw7/9kQ==
X-Google-Smtp-Source: AGHT+IEranJRFgpDe21yNvkr6wFRzulLhbElQ14owwih6Yncq7oSN7VEwSz/jPzabvR4W4a/5GdlXQ==
X-Received: by 2002:a05:6a00:2a03:b0:6f4:490e:6 with SMTP id
 d2e1a72fcca58-6f8f41b1a5dmr8279151b3a.30.1716803769572; 
 Mon, 27 May 2024 02:56:09 -0700 (PDT)
Received: from treapking.tpe.corp.google.com
 ([2401:fa00:1:10:a9ab:23f:9d2d:dc0e])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-6fd94372addsm2951616b3a.186.2024.05.27.02.56.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 May 2024 02:56:09 -0700 (PDT)
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
Subject: [PATCH 2/2] drm/panel-edp: Add more panels with conservative timings
Date: Mon, 27 May 2024 17:54:50 +0800
Message-ID: <20240527095511.719825-3-treapking@chromium.org>
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

Same as commit 7c8690d8fc80 ("drm/panel-edp: Add some panels with
conservative timings"), the 3 panels added in this patch are used by
Mediatek MT8173 Chromebooks and they used to work with the downstream
v4.19 kernel without any specified delay.

These panel IDs were found from in-field reports, but their datahseets
are not available. For BOE 0x0623 and SHP 0x153a, their product names
are retrieved from the EDIDs. The EDID of AUO 0x1999 does not contain
such information, so list as "Unknown" in this patch.

Update these entries with less-conservative timings from other panels of
the same vendor.

Signed-off-by: Pin-yen Lin <treapking@chromium.org>

---

 drivers/gpu/drm/panel/panel-edp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 2688ff1eb14f..f5060c9f821d 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1983,6 +1983,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x1062, &delay_200_500_e50, "B120XAN01.0"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x125c, &delay_200_500_e50, "Unknown"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x145c, &delay_200_500_e50, "B116XAB01.4"),
+	EDP_PANEL_ENTRY('A', 'U', 'O', 0x1999, &delay_200_500_e50, "Unknown"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x1e9b, &delay_200_500_e50, "B133UAN02.1"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x1ea5, &delay_200_500_e50, "B116XAK01.6"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x203d, &delay_200_500_e50, "B140HTN02.0"),
@@ -2007,6 +2008,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0607, &delay_200_500_e200, "Unknown"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0608, &delay_200_500_e50, "NT116WHM-N11"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0609, &delay_200_500_e50_po2e200, "NT116WHM-N21 V4.1"),
+	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0623, &delay_200_500_e200, "NT116WHM-N21 V4.0"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0668, &delay_200_500_e200, "Unknown"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x068f, &delay_200_500_e200, "Unknown"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x06e5, &delay_200_500_e200, "Unknown"),
@@ -2118,6 +2120,7 @@ static const struct edp_panel_entry edp_panels[] = {
 
 	EDP_PANEL_ENTRY('S', 'H', 'P', 0x1511, &delay_200_500_e50, "LQ140M1JW48"),
 	EDP_PANEL_ENTRY('S', 'H', 'P', 0x1523, &sharp_lq140m1jw46.delay, "LQ140M1JW46"),
+	EDP_PANEL_ENTRY('S', 'H', 'P', 0x153a, &delay_200_500_e50, "LQ140T1JH01"),
 	EDP_PANEL_ENTRY('S', 'H', 'P', 0x154c, &delay_200_500_p2e100, "LQ116M1JW10"),
 
 	EDP_PANEL_ENTRY('S', 'T', 'A', 0x0100, &delay_100_500_e200, "2081116HHD028001-51D"),
-- 
2.45.1.288.g0e0cd299f1-goog

