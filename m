Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F89F995068
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2024 15:41:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20B9710E53F;
	Tue,  8 Oct 2024 13:41:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BEqqM7lM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E942310E275
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2024 20:14:03 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-37cd26c6dd1so4778151f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Oct 2024 13:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728332042; x=1728936842; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yp2+CwKDNz0bGqR2gk7cxk+8EAcTD9zgHXQlXp3C56s=;
 b=BEqqM7lMRqnvhztETiddRaALtfMedD7zSglTU8p+BwuiMWmS1tcp2nxzYS9UqpmW9V
 YVWZrWNZ4b4EsXx80VvPXxoXZtdcPt9n9OCVCbyR8EOPksYiU/XksWRSOJGb0Z3FO6OD
 0KBQtHMnbGgkBTTSo584ckHY+B3cKZHvDDuQXm2UNE45duQvRvo344yKhNJgA66iJOMD
 43Ul5H81Qvtx5uQYpwzrzYr9S7vOxAr47SZyt0GJkyr8bS+uK2nsuyiaiqRYpfao8vSj
 EuGHCGrrGEXkt88hD0Vs5I68siQ0ifaXLYwBA6hNOd9LqzJ6SZKgkWTG28TjdF13XADO
 Kd9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728332042; x=1728936842;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yp2+CwKDNz0bGqR2gk7cxk+8EAcTD9zgHXQlXp3C56s=;
 b=PXfuu+MMUwI2VXG/G4hYYDNixIn+kgIjXCC3dMeShpcSWv9QWUOf3sIaM9itV11Qe6
 9EmcVfPMuRPC+JFypRBKewOFgs+5ArtNWEKilG/Uo6HW7zOjskNYv71EPlfsjyRqD0ej
 ZG+WVH3Zjmgvqt3GKvm3xZM4NG7ZYh8Xhy03cNyfps1hhT24Z2QQCEUEDYkxKCzR3zdV
 7jzrruIMoUJjUQjH9Mus8QZ/8S4DCS7ymWzl4V+3PGGnwujykjj/VImzFfd9CC95x9Ys
 CB72my37VsaRCUTuEKaMqusL0f5mK7HojwNThhFoMuXPHCg7IUdH7My92FNHe4j9Tw/B
 nPhw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwWCh69hKvSNgHTm1b/f2GRMQchX44q5I3REF193XJ6y36R60oe+7s0wfGmIlvYSjhPdGiIYPv9WI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxb1mP9MSl3E0qpifz2a80cx5SnhCXE0MHtKi+pr59gZn2HK7Tw
 bCdEojzR48gpyzZeaX5ro7EofdSR/xc4FGOnCMMS6yV8nwK1Y5o=
X-Google-Smtp-Source: AGHT+IG0x4+zvg7mLQVkS7BFE01UEpbCC5w0E/+O9612eREReOU+v+c9Nrej6W3d7I3jOCM4IuOxAQ==
X-Received: by 2002:adf:a39d:0:b0:374:bde8:66af with SMTP id
 ffacd0b85a97d-37d0eaea911mr10615499f8f.57.1728332041866; 
 Mon, 07 Oct 2024 13:14:01 -0700 (PDT)
Received: from localhost.lan (adsl-178-39-53-103.adslplus.ch. [178.39.53.103])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a995ab0a99esm128665866b.89.2024.10.07.13.14.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Oct 2024 13:14:01 -0700 (PDT)
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
To: Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Bryan.Kemp@dell.com,
 tudor.laurentiu.oss@gmail.com,
 Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
 Peter de Kraker <peterdekraker@umito.nl>
Subject: [PATCH v1 1/1] drm/edp-panel: Add panels used by Dell XPS 13 9345
Date: Mon,  7 Oct 2024 22:13:56 +0200
Message-ID: <20241007201356.10430-1-alex.vinarskis@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 08 Oct 2024 13:41:08 +0000
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

Introduce low-res IPS and OLED panels for mentioned device.

SHP panel's timings were picked experimentally, without this patch or with
`delay_200_500_e50` panel sometimes fails to boot/stays black on startup.

LGD panel's timings were copied from other LGD panels and tested to be
working.

Particular laptop also comes in high-res IPS variant, which unfortunately
I do not have access to verify.

Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Tested-by: Peter de Kraker <peterdekraker@umito.nl>
---
 drivers/gpu/drm/panel/panel-edp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 767e47a2b0c1..8566e9cf2f82 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1977,11 +1977,13 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('L', 'G', 'D', 0x0567, &delay_200_500_e200_d200, "Unknown"),
 	EDP_PANEL_ENTRY('L', 'G', 'D', 0x05af, &delay_200_500_e200_d200, "Unknown"),
 	EDP_PANEL_ENTRY('L', 'G', 'D', 0x05f1, &delay_200_500_e200_d200, "Unknown"),
+	EDP_PANEL_ENTRY('L', 'G', 'D', 0x0778, &delay_200_500_e200_d200, "134WT1"),
 
 	EDP_PANEL_ENTRY('S', 'H', 'P', 0x1511, &delay_200_500_e50, "LQ140M1JW48"),
 	EDP_PANEL_ENTRY('S', 'H', 'P', 0x1523, &delay_80_500_e50, "LQ140M1JW46"),
 	EDP_PANEL_ENTRY('S', 'H', 'P', 0x153a, &delay_200_500_e50, "LQ140T1JH01"),
 	EDP_PANEL_ENTRY('S', 'H', 'P', 0x154c, &delay_200_500_p2e100, "LQ116M1JW10"),
+	EDP_PANEL_ENTRY('S', 'H', 'P', 0x1593, &delay_200_500_p2e100, "LQ134N1"),
 
 	EDP_PANEL_ENTRY('S', 'T', 'A', 0x0100, &delay_100_500_e200, "2081116HHD028001-51D"),
 
-- 
2.45.2

