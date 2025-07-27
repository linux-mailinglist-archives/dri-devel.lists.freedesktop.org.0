Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7512AB130CE
	for <lists+dri-devel@lfdr.de>; Sun, 27 Jul 2025 18:59:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5CE510E308;
	Sun, 27 Jul 2025 16:59:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="j9y2KxMP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2FDC10E301
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Jul 2025 16:58:55 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4563bc166a5so21538165e9.1
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Jul 2025 09:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753635534; x=1754240334; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EF78n2GJo9Ljh6+9I+QrDrhKqgr6XnFmnArJPBP8sdQ=;
 b=j9y2KxMPuyTws/VD3MUtuD7dEQd4TcnYsjY2e3tbztnOuyFlwvQxqDx8e5TINkkVHd
 MNudAahryiJ1OBt6uu0HwockmIFNcVpZvo3W7yRXZ4xnL7sMUjirZmJgOgw+NdQEWcqi
 VcZGOKF3nSxiMhmvBXv0GsOJKf/SA813zRuDP8iQzJW5c7EXdo6E4pSFqPX1I6qyzeQy
 0miIomYW/hbjQVtmF87py5OiNe0qUhOFKVVV9NcpmJYjBuWqSfwxp7FgfF7CQVOA8Ulw
 7CPd1pQ8Xn4gb56IAdnBZx2iEVWiwtqCaGL3eC9QhCM3O0t7FEdGjU48oHvR2fSvfp2H
 XD4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753635534; x=1754240334;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EF78n2GJo9Ljh6+9I+QrDrhKqgr6XnFmnArJPBP8sdQ=;
 b=T+GMIykByIt/C/OT9EV4hYrd4YGUWXUSpSVNV9taSbEAME50vpCdoHNS28VVRA7mdF
 QaZKhjDSL3m27/99snvh9ww6RKv8RWHx0BRlC86Oji1C8hWBelqY2j/uglsX12Of23ja
 U4pz4RLehXPjVCYyrsuhjj27TQrndWfaK93T1ZSppw77RW65B0r5MkmBPQF3LkpPXfut
 OwaPvV9+a1piyC9+eIS9TW9ZDbrJygQIih4FMJEFuAXGxdSZidTge+9MzLx59yEQtTHw
 QteI1Ctev6FvygiEDwsaxfgpn2WN2lB8JHGZ/qV46a0Ow9dd0egdPJuqsoE80DJZCqb8
 8+5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYk758/O9J4HMYi/5gMR3rKauTG3G/BfWiioZcAThnLyatyL28hEvPoit7SmHOq2PchYPhhwMAC+o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzCfX6mLrh2JmzL8mQDpGdJOcaL7jC03WXLU2SutFnsTKF2EHEC
 ZxrvjTC9aR5d3EfBW2zVlv3LVr6CTqCwLR/RicVj/qDDgDhdBh0EqMgA64Jssgw=
X-Gm-Gg: ASbGncso70WUzgIr0JIbXjwn99PkfgDJfWn1x2B4DQtyMQ7AmJTmBqv/Db1JUZcb3jG
 ImGmYfWaZSmU9zwyPSxFliPjwr42wOUVNafqYKftCkrhEADfREKtgaJ8fk58zJ2gBtziplAWzNF
 GGc/RFcsOj5Eim/MNZSXaCHtl06gml32izg5GqV9YYCvfZiycQBivdBpapskrcVnqHRJAlnvNyf
 CRS3y54iRBwffGUwvZhIIXwCGwv9++zwawOas3l2oyKS4PJ8D7t0UePQNUZrQHhnpsGkXRGgdee
 +QbtrWt0BvjaYrSVzG5sqhkpzVTgTvYNE3s0l9ehCGuLO0SThPb0IzjjRvxDB3hQ/ZCULyc6IDx
 V5/UL07YpONXLxdfyotmuSj/AVoYLiVo9EYnZW+LPu1pJHzsfpS8=
X-Google-Smtp-Source: AGHT+IGsriUGTQtFk3WMLf3zlohLZapyUEGO2OTMkwMcic2kFu7BspA2oGNvKvQ6RBaXAmNsq62AXg==
X-Received: by 2002:a05:600c:a405:b0:455:efd7:17dc with SMTP id
 5b1f17b1804b1-4587c8283c1mr36053445e9.11.1753635534149; 
 Sun, 27 Jul 2025 09:58:54 -0700 (PDT)
Received: from alex-x1e.localdomain ([84.226.118.249])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458704aaf20sm128545745e9.0.2025.07.27.09.58.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Jul 2025 09:58:53 -0700 (PDT)
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
Subject: [PATCH v1 3/3] drm/panel-edp: Add BOE NV140WUM-N64
Date: Sun, 27 Jul 2025 18:50:26 +0200
Message-ID: <20250727165846.38186-4-alex.vinarskis@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250727165846.38186-1-alex.vinarskis@gmail.com>
References: <20250727165846.38186-1-alex.vinarskis@gmail.com>
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
index 9a56e208cbdd..b334926e96ed 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1947,6 +1947,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0c20, &delay_200_500_e80, "NT140FHM-N47"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0c93, &delay_200_500_e200, "Unknown"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0cb6, &delay_200_500_e200, "NT116WHM-N44"),
+	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0cf6, &delay_200_500_e50_p2e80, "NV140WUM-N64"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0cfa, &delay_200_500_e50, "NV116WHM-A4D"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0d73, &delay_200_500_e80, "NE140WUM-N6S"),
 
-- 
2.48.1

