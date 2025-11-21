Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 203C2C7B0B3
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 18:20:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85BE010E06C;
	Fri, 21 Nov 2025 17:20:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="wIfXWq7n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FCA310E06C
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 17:20:39 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-42b387483bbso1579427f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 09:20:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1763745638; x=1764350438;
 darn=lists.freedesktop.org; 
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4L5lLINpBwoGYM4jAuahtExqQ4jfmSIRseGMfVqwqPY=;
 b=wIfXWq7nuWxNydYa4O8V7vTJqpDt7loeECw074I9p6tAHhUb2LnFgyFazeOe0VMyOH
 +I4CjaaOtTlZIblzjrrmYuPFwLFz6QpcNHhrzUlmYUWhxPVrFH6mYG1O7yI3ijH1v/ts
 +J7Lw7SgarFF7Za0HJzmYEbNwkJvcIzZhWt5nYkl/KlT+ch5AwOSYtD1Zx7Rr2QVMdlX
 7KfM2IamB4oIrT4yiPT65TzHuoLTeUTWEpvtgaUArcdxheD6zZGi6GaPbxqV018TtMkm
 gqJaqwubUzB0wnJ6eNJp1LRtVA27WCl+P6TfaB7zN1AgKxRNQDs2er/DJdMCYqQkHefT
 DLuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763745638; x=1764350438;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4L5lLINpBwoGYM4jAuahtExqQ4jfmSIRseGMfVqwqPY=;
 b=iUwcIDOsp6sMdrx0zmhi5z8Ykyo19zIqPaqLJzfWjPYlAXD9bSi7BIFfuid2xqYq6n
 XgTEUdVZ+6Wn+qYJ8FdvAmtbm8KD5CzMm3ST6Uu+EmuO3b0nz0ANxMKibJB/EUuJoOgk
 KkoEqt4Og6+Zvxmu575dRdok+vMQNpk3wD5mhw3RMxqq2nz1oUP0oPXxixAKoBW4ixd4
 lZj1oEweQYqDqio2V6OAgPRcz8gJ2UQvf0JgXHO9aHSvTVfF4IZbq1P8CA11h8Ta6cu2
 YIUeYE/vYMeomNzRbcRld4I10a0XbK86Prhalo4+x8mz5rhArPOiG0hdlecJ8iwWnkGn
 vkPA==
X-Gm-Message-State: AOJu0Yz9FM7muX2SIrp/CBUP4Ltlur+1SjmfxLkuoZqXodVV7i351++y
 1cU2p2X3aj9G2L4EmeYUhWW1iXNuiCJKAsiwDG81bLitJZTVj6CEunZYuvljXlKlJxw=
X-Gm-Gg: ASbGncugwv4pZJpINnwZKEj8oNf2fR2R9JnYSo77fu6x9Bmvi5doxKNP247aeGNPNz9
 cvj2rB/APuXhQ0x7V5zx5oJcB9vGZNw9xRzDnBvQCzG+cgwZPxT8TBuJ2ZMVo2t4qXLVZIIkiMv
 YRVGUGouuRPDQP5uCFlgzuWqdUoMJrjAdjKTfblEF1YK17GIW5k+aUkhp/S0Xo1tNHl5XWGzQAZ
 MMvwxk/B0odIzdLHiTo1MQ130DAzPcK6j3aGetRh4fQinME2nmqrZxPssI1ilowdaUMdTp2pZsu
 Dxr0MVXiqzh/nXzyheuWL+IC6FoSaTVzehGjaeQ57fnOM/ZXfdq5TT0IM26iUHudK+CVdDWuS7e
 Co3C10WO/hrSRKZ8YE5zTvAr+/L/Vqv2E1BtsIs4V6vOVhTxoQ01E7WZA9zlHW/NJTBb/4MoLIf
 BA4tgaAqUYaGWKuZGDtcNgrc24oApEWEdRhiC13pB8SCuSNub/P9T+hYhJczTNI9Xp/hE3HQ==
X-Google-Smtp-Source: AGHT+IHkh8hFJ7NzjIss9biO8SB0aAPGS2s6f3ZJBK1SthfTTpB6JNmERBMHFk1DBGeEt0TFLqoPOg==
X-Received: by 2002:a05:6000:2281:b0:42b:3680:3567 with SMTP id
 ffacd0b85a97d-42cc1ced9c9mr3018477f8f.18.1763745637751; 
 Fri, 21 Nov 2025 09:20:37 -0800 (PST)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42cb7f363b0sm12221091f8f.13.2025.11.21.09.20.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Nov 2025 09:20:37 -0800 (PST)
From: Daniel Thompson <daniel@riscstar.com>
Date: Fri, 21 Nov 2025 17:23:54 +0000
Subject: [PATCH v2] drm/edp-panel: Add touchscreen panel used by Lenovo
 X13s
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251121-x13s-touchscreen-loopup-v2-1-75b03838e28f@riscstar.com>
X-B4-Tracking: v=1; b=H4sIACmgIGkC/x3MMQqAMAxA0atIZgNNSwe9ijhIjRqQtjQqgnh3i
 +Mb/n9AuQgr9M0DhS9RSbHCtg2EbYoro8zVYI31RJbwJqd4pDNsGgpzxD2lfGY0i3O+I8N+mqH
 WufAi938exvf9AA3RKBlpAAAA
X-Change-ID: 20251121-x13s-touchscreen-loopup-0f335910e5ad
To: Douglas Anderson <dianders@chromium.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Daniel Thompson <daniel@riscstar.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2154; i=daniel@riscstar.com;
 h=from:subject:message-id; bh=mVjUozg1LDPMZKQbzrqJ5pKyal1xh3JNfJHGC2UoHBU=;
 b=owEBbQKS/ZANAwAKAXzjJV0594ihAcsmYgBpIKArPPCse+s3GuHASgDG4snfvrqsJ57YZ6Qoh
 1YriGAdyQGJAjMEAAEKAB0WIQQvNUFTUPeVarpwrPB84yVdOfeIoQUCaSCgKwAKCRB84yVdOfeI
 oT0jD/95tf0BCV1+2++aHt7sRzzH7uxcQLlwfR9IRgwkgCePLrhLsWpnbjHXnepwiaWeXVEvRg8
 enS+2hVXr48O7lZcu/xFx9i0HEePPcXIitp8ISQKwj0zVr/JjJSoBHI4DrVJSU6O5UMD7Wk+Hdk
 rG9pnRur2mxkS4UdlJNjtCrqnv9UEGXMqBGz/5DXYRnv7bbV6RgQ/d+a2juNidNF1vNDUGcw74T
 a4fVEBvRVOgYbaMuJzdfTpFuKORCN5JBxbgMP9CDv+9Oq9YmzlqiQgPFOvkBsbs77jJ4B90jPxa
 oUpXvLl9MXS10RzxRcUqhzGz9oWxkg7KcJyc0P4HaV8/l6X089bHBjayjqRyPOepYvrwROtgzgJ
 oIgteD8H/RgFKsZop8JMzsNs5FNVudALBkX33k5t0fnWvp2VuXnI9aZVT7gNc1OBqqPnRanSOoh
 rxUm3GEXt+HWNtxQd3eYroRsMhswg1Gd7bwF1CiuylOt+Lx7uK3geVm/xQBAjGq7WbR6I44n7gl
 ooyuzl4lauOWPkwlUr6B0Z7FbfZ022VUFngs3FXSO+suN6zfX60QzWT7bRx7AzXnnEmLU/gabr7
 TwjDAhKhxmgwvbDohaOPFTZyWXdFdzPpHmrZN0ysu1rEVUry5kAe7cOsBUo8jejM2jINzN/4ndA
 Bh0o1Lkv3QieuLw==
X-Developer-Key: i=daniel@riscstar.com; a=openpgp;
 fpr=E38BE19861669213F6E2661AA8A4E3BC5B7B28BE
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

After (checks watch) a little over two years I finally investigated the
boot warning on my Thinkpad X13s and it was caused by the conservative
timings warning in panel-edp.c . The X13s was sold with a variety of
different panel versions; I have the 300 nit multi-touch variant.

I have been unable to secure panel documentation so the I copied the
timings from NV133WUM-N63.

The raw EDID is:

00 ff ff ff ff ff ff 00 09 e5 84 0a 00 00 00 00
1e 1f 01 04 a5 1d 12 78 03 5c 70 a6 51 4c 9c 26
0e 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 74 3c 80 a0 70 b0 28 40 30 20
36 00 1e b3 10 00 00 1a 00 00 00 fd 00 28 3c 4b
4b 10 01 0a 20 20 20 20 20 20 00 00 00 fe 00 42
4f 45 20 48 46 0a 20 20 20 20 20 20 00 00 00 fe
00 4e 56 31 33 33 57 55 4d 2d 54 30 31 0a 00 51

Signed-off-by: Daniel Thompson <daniel@riscstar.com>
---
Changes in v2:

- 0 1 2 3 4 5 6 7 8 9 a b c d e f ... yes, it's coming back to me now!
  Fixed sort order (thanks Doug).
---
 drivers/gpu/drm/panel/panel-edp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 62435e3cd9f4db00be7f1ded7c75e749e4cc14c8..140dc06f7102d3a39201cb7a1000a8e3e46d3e41 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1963,6 +1963,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0a3e, &delay_200_500_e80_d50, "NV116WHM-N49"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0a5d, &delay_200_500_e50, "NV116WHM-N45"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0a6a, &delay_200_500_e80, "NV140WUM-N44"),
+	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0a84, &delay_200_500_e50, "NV133WUM-T01"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0ac5, &delay_200_500_e50, "NV116WHM-N4C"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0ae8, &delay_200_500_e50_p2e80, "NV140WUM-N41"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b09, &delay_200_500_e50_po2e200, "NV140FHM-NZ"),

---
base-commit: 6a23ae0a96a600d1d12557add110e0bb6e32730c
change-id: 20251121-x13s-touchscreen-loopup-0f335910e5ad

Best regards,
-- 
Daniel Thompson <daniel@riscstar.com>

