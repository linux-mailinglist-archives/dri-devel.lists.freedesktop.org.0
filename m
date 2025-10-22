Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3677BFC74C
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 16:22:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B35210E7C2;
	Wed, 22 Oct 2025 14:22:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UoqGkYJI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8708810E7C1
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 14:22:00 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-427084a641aso3416513f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 07:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761142919; x=1761747719; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UNRJG9b/INfi23des3nzlgfKaLYdiUShg0Bsn9STYF0=;
 b=UoqGkYJIPcwj5NKrVNVJwBdylRDlIhw0ju8MVP6iKE/xE0oYMo0xo9G8gLteFhOIYw
 tMKNuo6sxgGpqDnBUU3bNWAjV5DCYtjsUUhjisjFR2tqWFUffLFP5M8cqi4HjuCnPAhL
 JJR1tB09LhCZEwo+SLLSKB+KWqyR+803kIGQTh65ZLJBNXB0tsFafXkEE52O3fuUmA4F
 a6bocFV7UxCcUzvcIlZ6W+81+psV3bvj5ZYU64diIroZRn3zp93Ky4NAHycKOdvszVfD
 ZGyyfzN+jagmH6UiUQ9KqcBSfUZjWQeJVbsHN7l1sxDQiXfDq4SmoHxBX6sEvaueQvf6
 FaeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761142919; x=1761747719;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UNRJG9b/INfi23des3nzlgfKaLYdiUShg0Bsn9STYF0=;
 b=msWTQaA2ZQvOy/c3IEXGZbq+CuDpq+3Lbi60uYAVdYgSZ9ejVg+r8NKE4TW6n/tLG9
 oDVpVJHfw8sVIaRWcY6BiMdk3KYpvBiPw6wthPA0rSdxAQ3HmKsKU4E3/TzDQv+vlM3+
 w+TLeIG1HxKMltFQZtRo+qNzxqrrw5DUPSkwLH/qSlXLeCHaindiGNmICmNbkcljhHKT
 0/gBdeSC2KtiZ+gxXacM9GNYe8EFP/EQoQAJ33UGqJOSLXke3/OC0FzV46mQyGhEYzib
 zT5EsKsVyij7LqE6hesEPG8T+u8E5i+FAxwx3GqECZPc3O9II63IPrdEEM08jQeMHEVw
 UcJQ==
X-Gm-Message-State: AOJu0YyvdopeoipEPhBa1z7CSUwjJlkd1GSC3pN5QmNIKR0LkVAvKuEQ
 zNewluwsmRRwtK5A5flP8sU7agLm3uVu6Tn4Uv7a4xGqO1oWnmTSHeNT
X-Gm-Gg: ASbGncvjtYS2o+R8PJjeDax7GRyb6NO5lQBuRl6jKP3aVrM9kQH+yX4Pll9M381fpni
 1WxPYSZr/w8gvF2sZHC0kDmMXyhC/aWYd0VK+17qF1NpZRy/qEzxAtalMQ6dWLacVDPXus4opLF
 XhJKYm6UDssicFmfuFd2wifVZIC9HB8PB9Sk4DmxGYzfh/Y+Hz4h+ekZUTYkndqFOS6a65qxBj6
 EgGByUcyFXqfh6NkuzaruhqTAVrqWNNCClnn5Lvesq+D4rCuYOV9Pcwh4RB/p5NEFkJOyhdYhnp
 YBXEzp4Tt0GgiIk3AFD+vRDFb60H+cstz3qatCmA1XU+INDGxWVyJVRr6RJI+qFZSzDLIF0owVI
 vT4dq/YIcqFQ4512vV+WeUitWR/iM8CX/HIEqCcxtuA7Wg2YgEWYXZppKNDtR2mQM7p8f2OwTR4
 uOSA==
X-Google-Smtp-Source: AGHT+IHXd0IcgPPuddYC43FouBDl7JZ23qUq6zvhrCcNdJja7V9zzVEVqdzVMGBz5q8/P63zDQWKhg==
X-Received: by 2002:a05:6000:2913:b0:428:3fbb:8409 with SMTP id
 ffacd0b85a97d-4283fbb8df6mr11330113f8f.46.1761142918838; 
 Wed, 22 Oct 2025 07:21:58 -0700 (PDT)
Received: from xeon.. ([188.163.112.61]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-427ea5b3d4csm24803518f8f.19.2025.10.22.07.21.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Oct 2025 07:21:58 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>,
 =?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
 Dmitry Osipenko <digetx@gmail.com>,
 Charan Pedumuru <charan.pedumuru@gmail.com>,
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
 Aaron Kling <webgeek1234@gmail.com>, Arnd Bergmann <arnd@arndb.de>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-staging@lists.linux.dev
Subject: [PATCH v5 20/23] staging: media: tegra-video: tegra20: adjust luma
 buffer stride
Date: Wed, 22 Oct 2025 17:20:48 +0300
Message-ID: <20251022142051.70400-21-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251022142051.70400-1-clamor95@gmail.com>
References: <20251022142051.70400-1-clamor95@gmail.com>
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

Luma buffer stride is calculated by multiplying height in pixels of image
by bytes per line. Adjust that value accordingly.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index 0457209b789a..626f34543853 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -504,7 +504,7 @@ static void tegra20_camera_capture_setup(struct tegra_vi_channel *chan)
 	u32 data_type = chan->fmtinfo->img_dt;
 	int width  = chan->format.width;
 	int height = chan->format.height;
-	int stride_l = chan->format.bytesperline;
+	int stride_l = chan->format.bytesperline * height;
 	int stride_c = (output_fourcc == V4L2_PIX_FMT_YUV420 ||
 			output_fourcc == V4L2_PIX_FMT_YVU420) ? 1 : 0;
 	enum tegra_vi_out output_channel = (data_type == TEGRA_IMAGE_DT_RAW8 ||
-- 
2.48.1

