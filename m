Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 648FBAFC862
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 12:27:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6757310E5F2;
	Tue,  8 Jul 2025 10:27:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kJGqBoRX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EB2C10E1AA
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jul 2025 10:06:50 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-74b52bf417cso2664988b3a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Jul 2025 03:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751969210; x=1752574010; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xtGT7Kvk1kcayZ2sMv2QOI6IWederxGXIfdOJOm/QhM=;
 b=kJGqBoRXGETgrHZFQGofv8IGlvMd0wFCeQjRvkPwdLpLbNb3QcJ18r/hB6g5wUkJLy
 wDj4BdPJ0T4pmrStVONEdanSEbqxil3S8XQR6IkST0UJ2zj1N8SiVvfFK3rr7O+ccsNE
 cGWDpIaS3FZgs6qdWoi1yiYzs3kIwnIh7mQYFjoV4I5qY/SC1kvMKgRcKCY8N0uj5HKU
 zKNxXfMRepe0g5Y4EAE2O2n0WwZeP2KpyYcsS+RTlyfRsPG+6kdZr704S0mLhB2ESioM
 I+Ypg/k43D5J15HZTLHArO06/SXioTGroPepLo6capL+cfmrZ75vJrsJsGunntEuUpmZ
 V71g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751969210; x=1752574010;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xtGT7Kvk1kcayZ2sMv2QOI6IWederxGXIfdOJOm/QhM=;
 b=Ri1TaQwTfR1vATlDLmqag7IK7o84hZML9t+oD45wYD1KqE1zIoPjy/TbDjvgwWmBAd
 x8H55zaaXwh33b6J9z0yI4DJrk3imF1BEvJElezN1qnMpBIXJycYMxVDDeVW5Svau03q
 KMZDgVp8eI8rOb8pO1HBzVgJVW8HnMmd9KhKfkt461OOk/uajGqAmqOpwpcUkdnMmkVQ
 JOnNztNQV9vTM/9WiNBy7olN20GIhuNXgM/jiP5E8ewuyQu9BPLztCFNVpF+/+YCxv+j
 BKCE8Wm8hVd4Bst7Dmo5hNvyR100suIDl3Cp7VkLyBKg4+xCtfa8lPeTEOo/mQW4HsZ7
 J/8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXHJans+tXfS3XuF6JuHJtBjZb3aHboN5OwT+oH5H/LLYKdJ01O8hF2R/4hmQecEoj6nhTC5IzYU8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzokAVpjjtCWDeChRj7XT7mc4NeDQ2GkhCowr82kmvyjHqT34iQ
 RusI9wzS2DmstOlGcNOLl5qAxT4oAa4U+Fc1LOR/SBxlqFEOAVm/rLiF
X-Gm-Gg: ASbGncsAm2lJvP10FGWop8juO66+/CEpSSXBw8x34o4ThDeTvQGx1ZVDmmdNFgacLz8
 iXb9U9pXrWcyD8PToR5uQ1fZPGhQz5ctdnT2WLlucK8wpGdeaa9Rcu7t7fbLEX/umKIfjz2AQo8
 6t+awANiOTi5yxx/Vr+cNtOCSz+Weqznxbn3tOjtf83qYbW1+cszOvd/0oLnKR34V6kvKp1hUu5
 r6kSjNdTC3ncBd0TBKwUG/LmZbYk5E90zY7t+AA5FTIo9SbYf0HZtwc3JmF1IpEYjhl3eCYg1vS
 zkGwLxrwXinhtvaSplblJzfbKgm2VXWynT6jH+KUba2/U/J3MQSFtqX22zp+1KRJ+ApIVuJ5Hsn
 vCA1XXQuE6ZWNb6eG4uA7t6davg==
X-Google-Smtp-Source: AGHT+IFRU9SPSrsf/41KjrBcwlW/zEtRYuveA0rctF6AoroRJA4BdYDJj+EpRvTzswKq41+iFOjpHw==
X-Received: by 2002:a05:6a00:2794:b0:748:68dd:ecc8 with SMTP id
 d2e1a72fcca58-74ce65fdd7cmr20633885b3a.22.1751969209291; 
 Tue, 08 Jul 2025 03:06:49 -0700 (PDT)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74ce359ecd6sm11971174b3a.24.2025.07.08.03.06.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jul 2025 03:06:48 -0700 (PDT)
From: LiangCheng Wang <zaq14760@gmail.com>
Subject: [PATCH 0/3] Add support for Mayqueen Pixpaper e-ink panel
Date: Tue, 08 Jul 2025 18:06:43 +0800
Message-Id: <20250708-drm-v1-0-45055fdadc8a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALPtbGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDcwML3ZSiXF0zAyPDlDQDc0PTFHMloMqCotS0zAqwKdGxtbUAx0P6GFU
 AAAA=
X-Change-ID: 20250708-drm-6021df0715d7
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Wig Cheng <onlywig@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, LiangCheng Wang <zaq14760@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751969205; l=1527;
 i=zaq14760@gmail.com; h=from:subject:message-id;
 bh=DJs59o4WehjmGxNS4SUdfWEn70hAjnKKeH5GnQIdDbU=;
 b=Cddh6f7PYm3rLh7hGUFh8fC8fYCmyZAGFkavUUPQkPthhX6pajTOcq9wShhDXhev1VSDI76LZ
 tLwkgNYMeAFA6tUsfB8XUgLmxsQn3B2llKzwxsA7f5xXXlqR0ySokmD
X-Developer-Key: i=zaq14760@gmail.com; a=ed25519;
 pk=5IaLhzvMqasgGPT47dsa8HEpfb0/Dv2BZC0TzSLj6E0=
X-Mailman-Approved-At: Tue, 08 Jul 2025 10:27:44 +0000
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

This patch series adds support for the Mayqueen Pixpaper e-ink display panel,
controlled via SPI.

The series includes:
- A new vendor-prefix entry for "mayqueen"
- Device tree binding documentation for the Pixpaper panel
- A DRM tiny driver implementation for the Pixpaper panel
- A MAINTAINERS entry for the Pixpaper DRM driver and binding

The panel supports 122x250 resolution with XRGB8888 format and uses SPI,
along with GPIO lines for reset, busy, and data/command control.

The driver has been tested on:
- Raspberry Pi 2 Model B
with Linux kernel 6.16.

Feedback is welcome.

Best regards,  
LiangCheng Wang  
<zaq14760@gmail.com>

Signed-off-by: LiangCheng Wang <zaq14760@gmail.com>
---
LiangCheng Wang (2):
      drm: tiny: Add support for Mayqueen Pixpaper e-ink panel
      dt-bindings: display: Add Mayqueen Pixpaper e-ink panel

Wig Cheng (1):
      dt-bindings: vendor-prefixes: Add Mayqueen name

 .../bindings/display/mayqueen,pixpaper.yaml        |  63 ++
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 MAINTAINERS                                        |   6 +
 drivers/gpu/drm/tiny/Kconfig                       |  15 +
 drivers/gpu/drm/tiny/Makefile                      |   1 +
 drivers/gpu/drm/tiny/pixpaper.c                    | 784 +++++++++++++++++++++
 6 files changed, 871 insertions(+)
---
base-commit: d7b8f8e20813f0179d8ef519541a3527e7661d3a
change-id: 20250708-drm-6021df0715d7

Best regards,
-- 
LiangCheng Wang <zaq14760@gmail.com>

