Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 146F9AAFD2E
	for <lists+dri-devel@lfdr.de>; Thu,  8 May 2025 16:35:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 754EC10E3A7;
	Thu,  8 May 2025 14:35:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="yk3iel9v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E02410E3AF
 for <dri-devel@lists.freedesktop.org>; Thu,  8 May 2025 14:34:58 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-3a0b28d9251so161500f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 08 May 2025 07:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746714896; x=1747319696; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1dn6QKLYPM5/ncrpI5DcFlLN8TipCwy7tClQS2gE2ZU=;
 b=yk3iel9vq8mg7sunVZNZ/CJJuesQq8Iual2+S6kI8SUQ4jcpeJYF6wFqo9g5T+GTfH
 ee5AA/zK9QHSjL9wAEGxeaNjxSIM6SUUCkM+A5qKgIHHyWz/PZ036JMHhJaWU+85Db+5
 WeSI2L6CdkTcJZMZQiyL6BlWHBqcJya1fkLm/X0o8zeNWLd+44aE17TSZ6mP0Kv6J7+M
 eizZu4+BgQk0rSh7fY3J2LWJ/kPQdhEGCqr8bMx5B+E7+qI58+97asYk79+g4KPNJVk8
 36jM21MmeU4cpM8AdjxyGm/cy062c5LvC+coH2wTDM0DQgTIPB6tCEgX8Ec+Ei18Hj5X
 8XlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746714896; x=1747319696;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1dn6QKLYPM5/ncrpI5DcFlLN8TipCwy7tClQS2gE2ZU=;
 b=tmykxvRufw/zT6BSKBuePU4MhC3QgKJ/Z9I3EwOfz2HBsb4nNxyfvKQlOzcAd0jgpg
 AJceMfkx7rzjdPzJpuabrzls9BsUyedvJz22rs0OcxKUEV/NbPydf1xTiWHMv8wOCbNv
 KJ7pVvuuOY/EDIOk/XUdovlKSkzmxuPG5ewBLT88Rhm2wRn6Frw+qkAVvxQWXpfDkIQZ
 ICS/kely7uVjvVc/lWej44/lNLVJsdAUvvtK3QkERonyDNX65pxeb5lTyF9OEsyPbfNA
 h4Db6W+kP4m3txlDZlN+oeEaLpGYJUIlMh1078K1vt0lgQtAslJHjkPmdmFUjhU3j3bu
 QJzQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPYaTl5C3s0Lu8QgZb1enabPMJBJ3SvDWDRlJ2X0/IOFwQx6gNj2xvU0eMCLtG9bByBeNt77gs+/Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx1ks5GmiIVcJ7K1w+shtjLTdaoXGy6Qx/juoFMRaA4NZL6ov9p
 HxLa3xrLyhZAyEMY5xreEIIKSXZwEa3SlOzaw0oRwJHGItLP0UAsQnzau80rQRo=
X-Gm-Gg: ASbGncvxGt9506GLTwpRp9MVq/7SXU6AprVmuBNfWAzusejTjgD4YXCnyHXTsFvZ92x
 8Zv73Y88i6mGHOxcDgi95Ga/vf2q3COg32zOuvPGErxkS7B04BVzAOfvM8QZ3mEhwDZXHiMH7X7
 yts1Fqd2X32Oj+H1iUpfFuDUvrLsY+LRZxw55yIBPtgSaWp8TWTHoDFejtRv7tahwcVkPD3nYjr
 +ANdpUi1QjNS+JiwKoRg83chuRnhxvFChkXk1KkPgFk7mMPY5K5C0zFWdaLVdxjwojniGm0au4u
 MveN5TnS8+YqalQu0b8BUAT5RQGOTEcD+zomjHzXySO8TcwVaKH/H6rsX1Y=
X-Google-Smtp-Source: AGHT+IHA+hPr3mhv/F1H4c6+v/AsLKidYl9hpKYtAPH7hY0Gqe3OHwNwzvvzE6kBPm+xaVLCRn5HEQ==
X-Received: by 2002:a5d:64c3:0:b0:39c:1ef4:b0d1 with SMTP id
 ffacd0b85a97d-3a0b4a37433mr2404238f8f.10.1746714896517; 
 Thu, 08 May 2025 07:34:56 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.207.88])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a1f58ec98dsm149861f8f.25.2025.05.08.07.34.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 May 2025 07:34:55 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 0/2] drm/panel: Add Novatek NT37801 panel driver
Date: Thu, 08 May 2025 16:34:46 +0200
Message-Id: <20250508-sm8750-display-panel-v2-0-3ca072e3d1fa@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAbBHGgC/22OwQ6CMAyGX4X0bM2YDJGT72E4jFG1CWy4IYEQ3
 t0J8WZ6+tp8f/8FAnmmAGWygKeRAzsbQR4SME9tH4TcRAYppBKZzDB0xVkJbDj0rZ6x15ZazOs
 8N9rUSogUotp7uvO0xd6qnT293jF92JdQ60BoXNfxUCaWpgF/H+ArPDkMzs9brTHdjO0e53+DM
 UWBpGp1uhRZIY25tmy1d0fnH1Ct6/oBGZ/a6OoAAAA=
X-Change-ID: 20250424-sm8750-display-panel-6b66cacb5001
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1045;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=S6xk8gQHC3YLD1Jam8QnKSHYbugR68dS8H5Eedxi4bY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoHMEJa33Z+nUqmz4wKoOvuYq/TylQ4sRlbGrx2
 Yu96KngTi+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBzBCQAKCRDBN2bmhouD
 19M5D/4z9hi2LhjQbhcJnqmm/BjjE1e7i4YDrLnFxvhgvQ+vnchI6lAdp9Hsd00g8jxMCslhUy3
 z+xlvqRqqWFdJy777zYRIud0ZGmy2ZqK8Y7D7Djkw5jDTCspSMjVv9D0mjEVrlZ2SwZL+tGTowt
 tmKZJEyQ/8VABaZZ2RpK6i09helfVuAcISfJz5rIg8nkzoV1RtAm1B6UlsJG8S31dxKdO6z2KP7
 d04muqAxlecKOpmDlUNeQtaBU5w58uDXWkB319alc5yhKsIzA6qu84HxlhuVJ7+8qKjZKDCktG1
 4IPTI0TEMBC1wykTNqvJjH2CUKJOe1EXDFDi2SiMRgmANT8l/4x5ozY9j4KhH+iw2vGdZhlqYHV
 UD+JExShPiGOf862itpFLacXwrLjO5p/7pOJfEQUeNxP+9KvMpehLhG5Xn1xx5YjESvS/8tPkyI
 pTiqdiCsWwfUy8ys3+snBkq6R+iX6vAs9FGHzhleLUQ/yq3gUzuwU2S+1h17JuVuuKlGpp6ngep
 qiWm3XVatIeGilN0Hgf0X2ZxAu0p/j1XI/pOlIML8it82+y6dz9fCoImxMTdwUhGL7ZdGqCOWWy
 ZuR3/JYRL7k4r703ObYgOoHNsLG4S1T2Hun6jFNq/MGb+0UfR7nVgURIrdngnE88sZhTE0e2yKg
 NE06Q0c4Cr9S2Kw==
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

Changes in v2:
- Use devm_drm_panel_alloc (Neil)
- Add novatek_nt37801_switch_page (Linus)
- Add Rb tags
- Link to v1: https://lore.kernel.org/r/20250505-sm8750-display-panel-v1-0-e5b5398482cc@linaro.org

Add driver for the Novatek NT37801 or NT37810 AMOLED DSI panel, used on
Qualcomm MTP8750 board (SM8750).

Best regards,
Krzysztof

---
Krzysztof Kozlowski (2):
      dt-bindings: display: panel: Add Novatek NT37801
      drm/panel: Add Novatek NT37801 panel driver

 .../bindings/display/panel/novatek,nt37801.yaml    |  69 +++++
 MAINTAINERS                                        |   6 +
 drivers/gpu/drm/panel/Kconfig                      |  10 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-novatek-nt37801.c      | 340 +++++++++++++++++++++
 5 files changed, 426 insertions(+)
---
base-commit: 0273d02b2f84f645e8b8ab317722931eb96f6130
change-id: 20250424-sm8750-display-panel-6b66cacb5001

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

