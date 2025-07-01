Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4EE1AEF0B2
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 10:17:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF48610E51A;
	Tue,  1 Jul 2025 08:17:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="OPTCLJ1o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D32310E51A
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jul 2025 08:17:06 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-451e2f0d9c2so37075545e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Jul 2025 01:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1751357825; x=1751962625;
 darn=lists.freedesktop.org; 
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XfPRhGcB3Y4E2N3R/jd+CsAbatnKTO0iTJe0rlZi1wM=;
 b=OPTCLJ1oSDz8MMGCp4Y+DFLA7vrJ0kMVrey4NxCMy5Fh0EO2kSLdYcaJ6IN3Walpyt
 Np+Kj4Z0eGI+KXCZ0NG/gSZ3bNGFl4BAod8KmGbJjpyNAW2kxbvK0sOqf7kSmVRAVGYn
 WpDHc5SbsRIT2Kz0C4uE7YZC9mro5jH7SLbOe2NUlRsHiQqe7HIaQHwIK2V+YoKPW8yO
 akzga03zj1wX+dKtxYv87Gg+uiUhh1PlJUdAcuQva+dfIH7lOiZ01Fx/r9BzU8t53Noo
 Wpg6LhveMYHTrCrUFxYFfSq2wVWh5lM3LgBnQq0RPclBMIu998AMGag0Y7hyoED7qHD7
 C0gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751357825; x=1751962625;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XfPRhGcB3Y4E2N3R/jd+CsAbatnKTO0iTJe0rlZi1wM=;
 b=V51dNYHrJDG/2mHMgVB7WbBVgjj9IuxgHuMku4Fuoh9rL2tjf9eKpEW7JyB5mVgPyE
 lwVmefpeY724+m7ay6TSseGIMorXOPzjY1q4mnRKd5cs7AQr1/ndQJNY+id/gyrr6cDz
 0LefCrRAnVFxCiYay70CJsTy7SbASolOJkYbEAGF1kXFU+eWnRibjC30dU22N4RIKlBF
 hitdZ7epSdFpoWrJ4+N7NfYbtSa7k6Mk+xZ71yfh3c9q4CMGlqD8Q07VhNNW1mcJY6sd
 ciU9+iGyBKwmlbr/gp4JO4d+YeKsoLVn0haQDm++Q6aM3wNb+6IhQty9hAuzX4tbAhAs
 l8uA==
X-Gm-Message-State: AOJu0YyeYc9MvtJ+pud0QB0s1oBFsRUvh/pTzO4dHQqkeLMbbNKFElbH
 SIP/Nrw5EBjZjtXPoROWrV2I0UQgSfrXJB9samvqwqU9CSs9fg+2Rvt02KyQ/x6rLEU=
X-Gm-Gg: ASbGnctcBuiKSMdtWRiNGhvPs6WLpNbtgSEP/8FHUrbLdLTemomu0ei++yXEHzjSbOU
 poCbFnk/I2bLbV/Rs1n+zVYSUKc5RjoSiyDfpdA4A+d1yMw3Qi721ZKvvbMUfNq2oOnPno8P1gk
 2DNf6O7FYsqQ25ljxJVa3+eAqknBT4Afa4lelkOF/2+oWDNSgyVq3Ixt7PDL0JCIpl2Zy8o84mR
 ETAYvJVmn1zkq07HPbg+3sRkOK0lGgcmnPCowcEHfrZGw0YiJGJXoh0e20W1G2OhSuNx0tMCewS
 KA94n3P0NbhAZBnRjGUWZHkogQ5Tjgg9aIPLFF5vzW/mI/GgmxqqRUVle9c5S3r24v+6G8dxUnO
 DKviRuKh4VmKffG+d45ehPHjtaxBjd3rZyHmMQDWt6N4=
X-Google-Smtp-Source: AGHT+IFNW0Gd1HhmH87xCE6By8JuGO3PB2k4h6ksmT3X58JMjtLORuZd9++ccAGzs4slWB1G0Jx0/w==
X-Received: by 2002:a05:600c:c0c8:b0:43c:ed33:a500 with SMTP id
 5b1f17b1804b1-453a79673d4mr17688195e9.10.1751357824351; 
 Tue, 01 Jul 2025 01:17:04 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a88c7fab6esm12766675f8f.31.2025.07.01.01.17.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jul 2025 01:17:03 -0700 (PDT)
From: daniel@riscstar.com
X-Google-Original-From: danielt@kernel.org
Date: Tue, 01 Jul 2025 09:16:30 +0100
Subject: [PATCH] drm/edp-panel: Add touchscreen panel used by Lenovo X13s
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-x13x-touchscreen-lookup-v1-1-a1277f119f92@riscstar.com>
X-B4-Tracking: v=1; b=H4sIAF2ZY2gC/x3MSwqAMAwA0atI1gZa6w+vIi4kRg1KK61KQby7x
 eVbzDwQ2AsH6LIHPN8SxNkEnWdA62gXRpmSoVBFpRqlMWoT8XQXrYE8s8Xdue06UJlxajWZmco
 aUn14niX+53543w+q+pwIaQAAAA==
X-Change-ID: 20250701-x13x-touchscreen-lookup-03ad81c3fc46
To: Douglas Anderson <dianders@chromium.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Daniel Thompson <daniel@riscstar.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2020; i=daniel@riscstar.com;
 h=from:subject:message-id; bh=rsCSDF4oa1mXKkIMQDvD8kEAVJWdqOYxGDG8Q97DkO8=;
 b=owEBbQKS/ZANAwAKAXzjJV0594ihAcsmYgBoY5lr4c6SE8UwkHRKilPNXpBDUkdYB0HUtZ1Z+
 Ibel7vdVxSJAjMEAAEKAB0WIQQvNUFTUPeVarpwrPB84yVdOfeIoQUCaGOZawAKCRB84yVdOfeI
 oTSBEACYPrcSUl8ZMnpPrIHbBehm4w1OmEz+4S7ROwOR6GAZmIgvOTlpvv90AuioK12iAMIIG70
 0dMnlSmINF2XuuWWqHJvoJ/xHAOqAJGuj6MTnQCg1pbMBsYpAPUHzJOAQbPfYGoQb9bQskXiUGB
 JXyqo/PUzhk9qSn2N0g18Qmdcv8Y8SUeq4gl68s48xk6HOZYjCPiusl5oIEzpUv2SCz7lultbAa
 PV4n+zQHfXnwLgpieAtqET5qdYbe2eFj2eXDq8ngvrfqUp9pToUfNpA31BAxVxGPohOx8Q+FB5M
 BX/9ZjvS+5jbS85t1l8ysLDC8ZWQN27Ir+2COPdTAb+SrClhDYu06oiV0CeGgKD+GdF8ErQLdgl
 niKwdNZr8hAQQXFZSOeNaMLsFNAywcKrBUV/PDl9uuooaXXUNhMwVFCnUncrIgJBm/48LjHSW1n
 dHSKoWfuu+U/2cbi/nJiJ8CObR41bZRUr1z7YSubYw6V7uuWwGqq9Lbz/i6yzh2q7ALpyjQSFgL
 fKCZzM8SjZiURhzPHo49d08X58F2dph39P76Kg37zsY2jqSgCfrNyuDp8omlwzAxZT6nJ3/lbm1
 WCNYH5pP4+tdq1pzyYDp6/vR8ZYrZ1rZqtiIR2M1ROjIzh/BOWDpy0XVzb30vW2V3hxlRPm6/8k
 Y8Cj6o3OKOysb9w==
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

From: Daniel Thompson <daniel@riscstar.com>

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
 drivers/gpu/drm/panel/panel-edp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 90e8c154a9788ad40e2101fdf39cbd92f2e0773a..9144de974f1e4abdd1af12613238f6f28d98fc41 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1935,6 +1935,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0a3e, &delay_200_500_e80, "NV116WHM-N49"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0a5d, &delay_200_500_e50, "NV116WHM-N45"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0ac5, &delay_200_500_e50, "NV116WHM-N4C"),
+	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0a84, &delay_200_500_e50, "NV133WUM-T01"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0ae8, &delay_200_500_e50_p2e80, "NV140WUM-N41"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b09, &delay_200_500_e50_po2e200, "NV140FHM-NZ"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b34, &delay_200_500_e80, "NV122WUM-N41"),

---
base-commit: d0b3b7b22dfa1f4b515fd3a295b3fd958f9e81af
change-id: 20250701-x13x-touchscreen-lookup-03ad81c3fc46

Best regards,
-- 
Daniel Thompson <daniel@riscstar.com>

