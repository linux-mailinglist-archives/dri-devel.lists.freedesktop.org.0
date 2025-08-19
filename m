Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 146D0B2C2FD
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 14:17:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB2CF10E5CD;
	Tue, 19 Aug 2025 12:17:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nIK4QWsQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F6FB10E5CF
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 12:17:06 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-618adc251f0so6717913a12.3
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 05:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755605825; x=1756210625; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+5pmXNI7SBH6aSov89/sVK+QopJtVJ4TfTd5orkCdOs=;
 b=nIK4QWsQBJ/IL0auM4RYM0DjZ71CW4YYxM92MYFfwftjk51+OpyNAvzotWZQdUPDcT
 0XdB+Q/x0ysti1KurEk4wV57oUNHoKvvX4D7z2OUji3hjMmK1QI7YX6JDdunE2c+8jFU
 gvMYPXCL+DylfV3JunXnghB/tKzkOz2ooolFG+aeNCpNPG1Z83W9oH0XKw0gGAtBa9Kc
 L5saHZAC7kMeLIdhkHvwIjMblmvh0xyF8XYagM9qqUbd43pngsGscPNwKpDWfYKPead0
 euu/3r7z39sCiSvgcoia+Ylpk7nMXJU65fvS6zYxbxhDdrq5EmWgSRyaxqGQxygbFz4k
 +GLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755605825; x=1756210625;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+5pmXNI7SBH6aSov89/sVK+QopJtVJ4TfTd5orkCdOs=;
 b=VhzFBaThvJXPRfW09Hv2G5+FLF0maMDoL8/ERcBRtBg9Msu1UQElsuRlpoq7Du/oNN
 ySHmc2J2ZhA1TXYLs1jSUIlywp/sVIA1UnCKbuu1j59CwBUv1GWGn6ly2vyXoQTXqKis
 +tQtZJo4gIlWJB/2qX40wAiz/Rxp/JdngBanYnZXrVXiPNpStRVPlL911rLoWap1S3V/
 3RgZAc9SAhb6SuoIOnkFcPtWoqH99OSgOedjPC48wWaZ7SAHTKqQ9psZ8N5gbOq10Uld
 Ihe8FI+mxztQTV+/0TYyEW9aNHKaudGz1v+GkbjM2rPM6xKk5vQ+d+ByAAPaS4y9FDma
 CBKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUn8vSHh7Glsht1V0xMnaWUQ+0SsJO6ZKMsTCIAYvHoTG4ITkb3DO74oHSvUAgW1CgLIsvOKiUwGZY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxqW9EhZV8FTXTY3Q/6KJnsBJ3iVYoHx1CvKx2kYL2QN6voYIXb
 R9garLjFZhYWY6i3E/e/w00RuNKPpDMbRwrqC2uznNmAZlUB9OkdkBN6
X-Gm-Gg: ASbGncvPzZfEu8fKY66OTPoqHPFe5aeKe+C3iOVCUSg818D88xogopjYctkc9sXOvJv
 yXTt2/wr+wxYD2yZgcOaJSC5EhNeyl5E8tJYJXy2rgcI26WUADBLfok3nQGqgzO5OE22o5YO6f6
 k4ptHSf2/3pb2LHTEGa6cd262dwkvYXAs7m7Ul3hPaWSHbByIINDYmMC2b0VugweOfhjdQvFFRJ
 zXcVUnqXkMifgO1dGktH/0mHmJaNEkCr99/B454At+NXaJ6pK1IXkqaOfuKVntrwVosD/kmhsWU
 WpKu1Qtc4WPbjC3cz1dNpW+ETCBw8CMajvfiAEUjhsJEtqvvaEP7DQ/+7ZCbISk0nruex9Kbe+l
 G9sa9zx4mT3lHaQ==
X-Google-Smtp-Source: AGHT+IEVo/Sm60jtHnDPZrIJ1ilYsVW3g5Tb0BNqa7Jgnw9wyoMrN/mFE25imQZIxkI+sm+CModZVQ==
X-Received: by 2002:a17:907:97ca:b0:af9:5a60:3319 with SMTP id
 a640c23a62f3a-afddcb8f929mr222020966b.19.1755605824830; 
 Tue, 19 Aug 2025 05:17:04 -0700 (PDT)
Received: from xeon.. ([188.163.112.76]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afcdce72cbbsm1012018666b.35.2025.08.19.05.17.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Aug 2025 05:17:04 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Dmitry Osipenko <digetx@gmail.com>,
 Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-staging@lists.linux.dev
Subject: [PATCH v1 13/19] staging: media: tegra-video: tegra20: set VI HW
 revision
Date: Tue, 19 Aug 2025 15:16:25 +0300
Message-ID: <20250819121631.84280-14-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250819121631.84280-1-clamor95@gmail.com>
References: <20250819121631.84280-1-clamor95@gmail.com>
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

Tegra20, Tegra30 and Tegra114 have VI revision 1.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index 735611c3c47d..71dcb982c97b 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -587,6 +587,7 @@ const struct tegra_vi_soc tegra20_vi_soc = {
 	.nformats = ARRAY_SIZE(tegra20_video_formats),
 	.default_video_format = &tegra20_video_formats[0],
 	.ops = &tegra20_vi_ops,
+	.hw_revision = 1,
 	.vi_max_channels = 1, /* parallel input (VIP) */
 	.vi_max_clk_hz = 150000000,
 	.has_h_v_flip = true,
-- 
2.48.1

