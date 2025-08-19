Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68EF7B2C301
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 14:17:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C095610E5D1;
	Tue, 19 Aug 2025 12:17:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FT8ocXLG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6927510E5D4
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 12:17:11 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-afcb7a3b3a9so755867766b.2
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 05:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755605830; x=1756210630; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rwi6FW5tkDofq2KfQKNu3LIz9dY4yfYtr7joa3HTroQ=;
 b=FT8ocXLGLO9OI0mqYTVLjJmhlkglBPbL2ouU9UMwT11AfWk4fKGxrwzQvk5OuJa8+l
 ZbpLLyFkCbs4vclZihsUspZJ3Lu//LHh4MjQs6G4p3qktW5hYzCtAnh2RiwWT2ov9o37
 VbpS/RmIvFxHasLlnTi65HnETF5wNJmcVXI18cSVyC65Pegngt8xSGVGldh+5ORTJp0m
 sB0RmMOcQCqLYgismB4frnOQ/GficN2C9Uv+VXhNvaUQbYZ8diJjVAHXimy67f1X/2Dm
 oY9nynH1BkFMdDx8mc0VN2EJyOE+LQEype3NTPu9zA603WXkBo++4hkSWZu6MZMatL3M
 TISA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755605830; x=1756210630;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rwi6FW5tkDofq2KfQKNu3LIz9dY4yfYtr7joa3HTroQ=;
 b=gSU/KGBtnxRD7Gf0hp+JJ//VfaQbe8Thc8DqICnoU3JnVu1/Ma/NIAuif99qW6iAJZ
 CzIHPzh2mYFvhMX1KRZHafHiBTOelJ1vk666QOZ1M326RpRUq3wgAbzdtI+6IK4Q01kQ
 +Mxg61oAotyfIvjhMfnfrFn6XXqeLKDgtd9l4q3gwEsKLHMtAwZHJmrH1+7AFed9FHtr
 3r4M2Dd92XnCDjn2pY3cYPwvhxvjAF8vK5NkSlCbSWrMx3eZa7seGPmGEY4lquL8tLzy
 Prb2Lmk8eE3FsXjE3SoT/NeKIZ9hqViSUlmjolHVWfVDCnhdwUYA2FWgvscB90D49ApN
 P/Tw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkkGzPPgpxV0TD5ATIcnyeglQ4mP3ZynUxlUUV5WQDOeEwiHNxANfQ7Rbrg7Ub03kARf7hdL1l8RI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwuHMQY88CmurYKzK57nPqDhcefi0UACQYEGceqQWa2LSG6BBIF
 5Ga/IuYM5sHxGt3d4cllPT3QLeVEhenPMPG6aYnaovcuHC+R+fTrvvhP
X-Gm-Gg: ASbGncsKUZEG1SzU4G3gOUAKbw9MlOIldHBy9itlPd0MWntSNR58jywVkH+kKGBt6kf
 WppYN7F2jQJ/HWlvnh2yZWu743wR/yPVvr6UrGqUYksAEHvMfM9rexD10+RUNprGRY/2CeO9fWV
 qheBvYzPVy26cxgCzW8TlOjm5jfm2r9qUA3VBm2j4sSIhdSPUPOFiiBa+jSdDwy6U4+dxoRSiaz
 gzr8riUgXw7e6UqpHJ4R/iA/2pRtJCKHNRLe3v3sUBxI302CRfW9kVoh/dv0Rr4TB5udHi4j3zC
 WRdFp7jB/85dZV4WHaYw5d/LI/b3tjjaFezcnRYSaYlQje8VwQSUeI05wUb0Aw80gzesJufZUOe
 VWQJou2QX5+Frq3EwT38adJum
X-Google-Smtp-Source: AGHT+IGR21hvJiBGCH6Sbixi0M+53WC3OCr/Sk/5ODegpiy06wxb3jQkbalpqFcJAtPFjRUjEnbGKg==
X-Received: by 2002:a17:906:6a17:b0:ae6:d47a:105d with SMTP id
 a640c23a62f3a-afddd208983mr230691466b.55.1755605829730; 
 Tue, 19 Aug 2025 05:17:09 -0700 (PDT)
Received: from xeon.. ([188.163.112.76]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afcdce72cbbsm1012018666b.35.2025.08.19.05.17.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Aug 2025 05:17:09 -0700 (PDT)
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
Subject: [PATCH v1 16/19] staging: media: tegra-video: tegra20: adjust luma
 buffer stride
Date: Tue, 19 Aug 2025 15:16:28 +0300
Message-ID: <20250819121631.84280-17-clamor95@gmail.com>
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

Luma buffer stride is calculated by multiplying height in pixels of image
by bytes per line. Adjust that value accordingly.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index b466fe7f4504..a06afe91d2de 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -496,7 +496,7 @@ static void tegra20_camera_capture_setup(struct tegra_vi_channel *chan)
 	u32 data_type = chan->fmtinfo->img_dt;
 	int width  = chan->format.width;
 	int height = chan->format.height;
-	int stride_l = chan->format.bytesperline;
+	int stride_l = chan->format.bytesperline * height;
 	int stride_c = (output_fourcc == V4L2_PIX_FMT_YUV420 ||
 			output_fourcc == V4L2_PIX_FMT_YVU420) ? 1 : 0;
 	int output_channel = (data_type == TEGRA_IMAGE_DT_RAW8 ||
-- 
2.48.1

