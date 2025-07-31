Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 568BEB17891
	for <lists+dri-devel@lfdr.de>; Thu, 31 Jul 2025 23:56:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB01D10E7F7;
	Thu, 31 Jul 2025 21:56:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="arC1qodc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22B4310E7F4
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 21:56:42 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-456108bf94bso1502855e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 14:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753999001; x=1754603801; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Oikj3gJvT+h9/I8C9wpIBKyLSojiwJyw/hlHslq3TD8=;
 b=arC1qodcr2quF8rUiCsMo/NEjRRJ4wjA1HXw6+3fqO9dmNmTYqMgksctKAyL7NeO8e
 lsd+4s4uAHYflyD3o98XT9bAJIhjffLDJbyw9nt4a8XjUDjBJJfZfqLSb5SduQkGeX4y
 Lp91VmR4pAnbHmzmZZFrpRq+HnACUaPPyZrgE1Yfvr1XKrkpvE3YpsfKWcaJmyUQ/+4p
 uWW0tgxpiEvWFA7ct7QfHgEUyw6Ddf5dtCbtTkahUsKrksxlgvW1C34MzV0Oge0Fj5Jy
 IccSdqseHDZlXBGnY/0XmsK0UgR2tCG3xzuHK1S0W3UAVLbYIYBdWVOZtld+YpiRJjLe
 QxAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753999001; x=1754603801;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Oikj3gJvT+h9/I8C9wpIBKyLSojiwJyw/hlHslq3TD8=;
 b=BMogtwgpgPhFcmB9NY4G/YRcq+zwhWx9fpaSi6KUz/dJymVvydOr5OcJNDNlHL2X59
 cZXA8oDAxVIgofoQvpj6IsFre4bfrfSJBvBAfcnMP8+6fkamJfZbtpMUQCcN/e2+B0CU
 iCh+Yq/ePFmsSJCYAjptw/SzGUrNblIjEic8vfKC4ae0hSqp66GSvg0tfeN/0umIXXYR
 pa4w4OIdz9Z6rHd653HjrOsSN0ecUKNZm3h2aNMh5EGWnrl0KH8Icm9s4oNfPNNs/VF2
 cEqsm1x3BbdrtDjqzL4xkOC/Nwb4uLVQMGR4PZHeCYcHE7Poyy2xsuZP8MDOxlOv6T5D
 lf9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXPyCzfU6ITq83ZHkXZx2Jg4iKj6taTlRkvbnI1vd1Xcx3Rw7M2PjTvusxS2NRwmIjOyr3PK6qZtMI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YybO80s2MH19y/pz3/cBqxtV0FR0JwYK34SIBhJrRWALr2sT11w
 k4lbS6cIXZ7sAOaXp0qB2OgFhrHM8YUz4SQBFoThDdyC7xUyazAITfc=
X-Gm-Gg: ASbGncvln1pSuI7UdGIv/oR4hSoqAe8q1bdYbDB2zXLdWoktHwyRQvFpZw5IwshD4jA
 ue9ey9hMoyLzK/PrTzHYWu5zpR2Ft0prO46qlj6+dAynbkvlAkINpegjlMe27+RZ98gSVH/yzkA
 CtEzXU9/PMn7y6oCoBWuy0oV8oTm1/AKpXYbh4wx+BsCDCFwV86Id+3JLKwoRu2Cc+XJe8WvW1E
 THgSte/yKif8kKGDldhkcTSl48TRbnknivVUeD03d6igu7eI5xZtmWYOr1lIpRUtmR+RaGIw9Lw
 rZRx6oBTbe7TPWd7XqtoG84JJXhrXyVYvqk7O0JBk2DIFQAGcJ8kGS+rLH/gKbzetOhQQ/hEXmQ
 WCyYutNy0zdcXGh3156RL4+hgGt46qL3YUt+8+rzF
X-Google-Smtp-Source: AGHT+IHOO1VhkE3sRaEGlsvQYc6q2XkaRNjDngyVISyPjIL3SY/LTSFSUCwqTeduXcndmXlSlX/sFw==
X-Received: by 2002:a5d:5d12:0:b0:3b7:9ae0:2e5e with SMTP id
 ffacd0b85a97d-3b79ae02eb2mr4222065f8f.9.1753999000548; 
 Thu, 31 Jul 2025 14:56:40 -0700 (PDT)
Received: from alex-x1e.localdomain ([84.226.118.249])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4589536abb1sm86622565e9.4.2025.07.31.14.56.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Jul 2025 14:56:40 -0700 (PDT)
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
To: Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Subject: [PATCH v2 3/3] drm/panel-edp: Add BOE NV140WUM-N64
Date: Thu, 31 Jul 2025 23:55:10 +0200
Message-ID: <20250731215635.206702-4-alex.vinarskis@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250731215635.206702-1-alex.vinarskis@gmail.com>
References: <20250731215635.206702-1-alex.vinarskis@gmail.com>
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

Timings taken from NV140WUM-N41. It is found in some arm64 laptops,
eg. Asus Zenbook A14 UX3407QA.

The raw edid of the panel is:
00 ff ff ff ff ff ff 00 09 e5 f6 0c 00 00 00 00
10 22 01 04 a5 1e 13 78 07 8e 95 a6 52 4c 9d 26
0f 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 5d 30 80 a0 70 b0 28 40 30 20
36 00 2e bc 10 00 00 1a 00 00 00 fd 00 28 3c 4a
4a 0f 01 0a 20 20 20 20 20 20 00 00 00 fe 00 3d
4c 33 30 20 20 20 20 20 20 20 20 ff 00 00 00 fc
00 4e 56 31 34 30 57 55 4d 2d 4e 36 34 0a 01 f8

70 20 79 02 00 21 00 1d c8 0b 5d 07 80 07 b0 04
88 66 ea 51 cc 74 9d 66 52 0f 02 35 54 40 5e 40
5e 00 44 12 78 22 00 14 7f 5c 02 85 7f 07 9f 00
2f 00 1f 00 af 04 27 00 02 00 05 00 2b 00 0c 27
00 28 3b 00 00 27 00 28 2f 00 00 2e 00 06 00 44
40 5e 40 5e 81 00 1e 72 1a 00 00 03 71 28 3c 00
00 60 ff 60 ff 3c 00 00 00 00 e3 05 04 00 e6 06
01 01 60 60 ff 00 00 00 00 00 00 00 00 00 de 90

Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
---
 drivers/gpu/drm/panel/panel-edp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 9a56e208cbdd..b241d1807002 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1947,6 +1947,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0c20, &delay_200_500_e80, "NT140FHM-N47"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0c93, &delay_200_500_e200, "Unknown"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0cb6, &delay_200_500_e200, "NT116WHM-N44"),
+	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0cf6, &delay_200_500_e200, "NV140WUM-N64"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0cfa, &delay_200_500_e50, "NV116WHM-A4D"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0d73, &delay_200_500_e80, "NE140WUM-N6S"),
 
-- 
2.48.1

