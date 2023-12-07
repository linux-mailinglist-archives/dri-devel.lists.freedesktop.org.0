Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B71248082B1
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 09:18:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A164110E10D;
	Thu,  7 Dec 2023 08:18:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D33F10E10D
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 08:18:15 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-1d0b2752dc6so5416875ad.3
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Dec 2023 00:18:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1701937095; x=1702541895;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YSSwT5sKejGUVXo00knc6CvP0jgSpgasFg7ZUeKjVkg=;
 b=a3SQXuDws5t643JOKejxcSXnIFbb1Jc4fdqJE0P2pFBelil/6+ANsGAbxXenseMI5J
 mF+Sm5t0xvYxpukVectG6QAZiMFQ7Dv0tHJYH9i/e1F7KfdeLrd6y66R3acNIGSJA/Wl
 aecUG26LWPgLPydKqdd/dcfxCzkTDizXUqDEI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701937095; x=1702541895;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YSSwT5sKejGUVXo00knc6CvP0jgSpgasFg7ZUeKjVkg=;
 b=bBFrGJJS9TPaZVqviTKof80teMa6GZs7NY6r7eaRaT7as5JT6oyFKyfo/+n4lpYWfn
 l6Ro9cKyxllYoMsfVuod/vi69E4wZWppocPYxCscOsiatxZudpo9ti9jgAX+UNH4xzPm
 9Ib06hF2eT/rJ2OLlz6xsa2HtrLqa7MF0EG4eaNyNlhJBFvYCPT8q0FPGa5u2NkD7NnO
 avtb8B4rDbOdHYb7MOkaS+E/NSo1ebMCL5+FRc+JOfx0zqxnk0U7gZPP8UBEDl+fvanL
 QWRupUXzWHbrkxVlqUfDssqqnmqu50VCFZ4RaHAqCt0UVpzOsVZCegU4uOilf/ySSs0O
 A0Og==
X-Gm-Message-State: AOJu0Yxy8ooFQS7XwruXHRXC9naxKgVufSjEPcqC5MEaCzPT1/KbCWf3
 wqi+VVbyz8ugXSi1DcLOBE5oBg==
X-Google-Smtp-Source: AGHT+IHj1r8543vt0rFMcubmDBoD1tNpr2DC6i766CO4yTYMZmtyXBB7Gvelw0nc8zdm+davXwDS4Q==
X-Received: by 2002:a17:903:1247:b0:1d0:a53e:2662 with SMTP id
 u7-20020a170903124700b001d0a53e2662mr2466675plh.104.1701937094987; 
 Thu, 07 Dec 2023 00:18:14 -0800 (PST)
Received: from treapking.tpe.corp.google.com
 ([2401:fa00:1:10:663f:6f8e:5f2d:e06c])
 by smtp.gmail.com with ESMTPSA id
 t23-20020a1709028c9700b001d09c5424d4sm748128plo.297.2023.12.07.00.18.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Dec 2023 00:18:14 -0800 (PST)
From: Pin-yen Lin <treapking@chromium.org>
To: Douglas Anderson <dianders@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 1/4] drm/edp-panel: Move the KDC panel to a separate group
Date: Thu,  7 Dec 2023 16:17:35 +0800
Message-ID: <20231207081801.4049075-2-treapking@chromium.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20231207081801.4049075-1-treapking@chromium.org>
References: <20231207081801.4049075-1-treapking@chromium.org>
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
Cc: Guenter Roeck <groeck@chromium.org>, Pin-yen Lin <treapking@chromium.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move the KDC panel entry to make the list sorted by the vendor string.

Signed-off-by: Pin-yen Lin <treapking@chromium.org>
---

(no changes since v1)

 drivers/gpu/drm/panel/panel-edp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index c76f186c4baa..a0b6f69b916f 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1980,9 +1980,10 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('I', 'V', 'O', 0x8c4d, &delay_200_150_e200, "R140NWFM R1"),
 
 	EDP_PANEL_ENTRY('K', 'D', 'B', 0x0624, &kingdisplay_kd116n21_30nv_a010.delay, "116N21-30NV-A010"),
-	EDP_PANEL_ENTRY('K', 'D', 'C', 0x0809, &delay_200_500_e50, "KD116N2930A15"),
 	EDP_PANEL_ENTRY('K', 'D', 'B', 0x1120, &delay_200_500_e80_d50, "116N29-30NK-C007"),
 
+	EDP_PANEL_ENTRY('K', 'D', 'C', 0x0809, &delay_200_500_e50, "KD116N2930A15"),
+
 	EDP_PANEL_ENTRY('S', 'D', 'C', 0x416d, &delay_100_500_e200, "ATNA45AF01"),
 
 	EDP_PANEL_ENTRY('S', 'H', 'P', 0x1511, &delay_200_500_e50, "LQ140M1JW48"),
-- 
2.43.0.472.g3155946c3a-goog

