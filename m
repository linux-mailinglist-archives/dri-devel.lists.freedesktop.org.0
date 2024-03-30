Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3BC7892D00
	for <lists+dri-devel@lfdr.de>; Sat, 30 Mar 2024 21:33:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E00E10E14E;
	Sat, 30 Mar 2024 20:33:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Y3AsaoM8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7773A10E14E
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Mar 2024 20:33:21 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-33ed4dd8659so2482573f8f.0
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Mar 2024 13:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711830800; x=1712435600; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GFAjJDDVv2Mq/JzFmcsO7YxhKCuR+cnUm88ySh3fdCY=;
 b=Y3AsaoM8DenWE6Vso0ckf+HQdnt0AEufFqbof2NxAXLUeoPC5VLDw49FCPQwrANhZa
 bSA2WeSBON+O8hEz0ur1wKjKe5TVyVZyIfT8vDNfcs2uVmn+TUqFHHQHGfxtGw1XBod5
 dhs4YIVOcBUzaK5rguhx29KoKya4aBfbeZJpDtRJkOMsbcjxJVQRVcsEi5iB1gzNs3KY
 o8xG1Zg6CcvVAhsDeS+HvHPkNam4jS+p9WtBxO/Y4sv6aCBYZ0lYrDZaRZbRN9ueLtd3
 NryXeKIpWNotYaxTF1NrpRfyWmHbcrvhAby8fcPM97OKYKoMZ4Vdrv0FD0xvmmtKPU3M
 9A0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711830800; x=1712435600;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GFAjJDDVv2Mq/JzFmcsO7YxhKCuR+cnUm88ySh3fdCY=;
 b=ToYqqDY60kz0FUh8A+dxeEzIZx/PczZlJMCzxvAIINWrkMUAUy/56UBrTN5TG0GOYF
 dyIIJOZFxoOqqLy5K7FjU0prfB2GEeTB+F81eeZCTXlzwF8iw2YSYGYPXZ7JAep/zmH4
 k8DtC/MDS1NtA68A/FG3M6SQ8EGZBGiFBMj70WlxHsE25Ligtk3/+xlMyJka0Rk2Tp/y
 iW+/p9fkIKAd54f11gyp+DYzTZd+BtUubaQuYIroHQTF+r64f0Bvc+AcDBrLjdeZrqg9
 2xhsfQH4jVWT0Ct04+8AUlWcXGWrl4ZOw+6TaC/HD8fuZ2Wh97GLPxiLADq/NX+Dbbv/
 Hwqg==
X-Gm-Message-State: AOJu0Yw9ORwPCK6vMUZZxtGmtyeDooUBxgJ3o78JOIxhPAJZeIk+Dl46
 d7oFwMe7mnJYpdXS/Jn1F0R7sCBeT2w7ilf0ZIPVji2yJD2NnsRw7aPtJMJt08E=
X-Google-Smtp-Source: AGHT+IGOX9rzHnZKqEi/0u/JwllhPjDL5WI+9xrT75BifyUqTbwy5wixNEYn4orV6XKjH7yINyhNTQ==
X-Received: by 2002:a05:6000:402a:b0:341:c9bc:6340 with SMTP id
 cp42-20020a056000402a00b00341c9bc6340mr5662696wrb.12.1711830799729; 
 Sat, 30 Mar 2024 13:33:19 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16]) by smtp.gmail.com with ESMTPSA id
 f14-20020adfc98e000000b0033b48190e5esm7209315wrh.67.2024.03.30.13.33.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Mar 2024 13:33:19 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 00/11] drm/exynos: drop driver owner initialization
Date: Sat, 30 Mar 2024 21:33:04 +0100
Message-Id: <20240330-b4-module-owner-drm-exynos-v1-0-3fa30e2c7e5a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAB3CGYC/x3MQQqEMAwAwK9IzgZq24P4FdmDblINaCsp6yri3
 y0e5zIXZFbhDF11gfIuWVIsaOoKvvMQJ0ahYrDGeuOcwdHjmui3MKZ/ZEXSFfk4Y8pINjSjJd8
 OwUEJNuUgx5v3n/t+AL01KntsAAAA
To: Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1590;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=ikAn+U2VxbkfcXOAocqiqsMAFIUnrQGNULyY7tvmZjM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmCHcD5nGngLbev9+ND1Nt7ZqZYQsRksp1eacLP
 WkIvzjxXZuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgh3AwAKCRDBN2bmhouD
 1xbxEACSQfAZBiA6d/aLNg7qF26Uj0wPR1fgjNyfRIfnunql1d/6F6f4IStx4vjq0toKC17p3bR
 PdE6D2sQxPj6wsScga2SpIYE53Q0dXFIBtvqB0F5GqY2+MLAExBETmkgeKTrnv+dikQaqO5Kw3P
 pkPLep6s4eUpf4QSCaKQggBRFNs0MgUCW7mvQu35OOsw7t+rBrmvxUkBWQgwzH+elQw0sA5VgcK
 ljBU/gecnRyddZ/EbhGIuU5qJbFN+UZejzLHwrewFRmWetZQNsG+NDDlSOQuZ4qle8fRP+sIBZC
 Pw7FKA2PIQdtOuNCXipkThniRxQqJSBUflAzKaUZdNHtxHIOmvcokX3S1k4Sx87HIG+ERLN4QwO
 /62OnW4TW2LIewfHg+3H0fsYNghHw/uW7ifEEVqOfgeibGGsgQoOcp6eKUNDG9MIeO5lTt9IQRx
 EeN1Mpis0Fh6cM4l8xTC1D1NcqQS0IoNsudpnX4hbPGgH3R212SOHT8wk1BwatrZdJ6R2Q8x5g0
 EyI24A4UewQQMbyWJL+o7SJnVTaQzlaJzZclJoJV76UpgyHVF8IzgpqWxTWNiHfu3Y2Lh3vdPAW
 u9FjNjO3ZxUf63LnC0ATHBPdyDAHBTgB/xspsVfe8bwnMUNJBTIMSY8Sq2rjLPjEd8nNb6hXDtX
 Cb+Pm6aXb5PFKFA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
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

Simplify the code by dropping unnecessary .owner initialization in the
driver.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (11):
      drm/exynos: fimc: drop driver owner initialization
      drm/exynos: fimd: drop driver owner initialization
      drm/exynos: dsi: drop driver owner initialization
      drm/exynos: g2d: drop driver owner initialization
      drm/exynos: gsc: drop driver owner initialization
      drm/exynos: mic: drop driver owner initialization
      drm/exynos: rotator: drop driver owner initialization
      drm/exynos: scaler: drop driver owner initialization
      drm/exynos: vidi: drop driver owner initialization
      drm/exynos: hdmi: drop driver owner initialization
      drm/exynos: mixer: drop driver owner initialization

 drivers/gpu/drm/exynos/exynos_drm_dsi.c     | 1 -
 drivers/gpu/drm/exynos/exynos_drm_fimc.c    | 1 -
 drivers/gpu/drm/exynos/exynos_drm_fimd.c    | 1 -
 drivers/gpu/drm/exynos/exynos_drm_g2d.c     | 1 -
 drivers/gpu/drm/exynos/exynos_drm_gsc.c     | 1 -
 drivers/gpu/drm/exynos/exynos_drm_mic.c     | 1 -
 drivers/gpu/drm/exynos/exynos_drm_rotator.c | 1 -
 drivers/gpu/drm/exynos/exynos_drm_scaler.c  | 1 -
 drivers/gpu/drm/exynos/exynos_drm_vidi.c    | 1 -
 drivers/gpu/drm/exynos/exynos_hdmi.c        | 1 -
 drivers/gpu/drm/exynos/exynos_mixer.c       | 1 -
 11 files changed, 11 deletions(-)
---
base-commit: 7fdcff3312e16ba8d1419f8a18f465c5cc235ecf
change-id: 20240330-b4-module-owner-drm-exynos-d2f1b2d48af3

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

