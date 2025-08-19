Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0603B2C2FE
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 14:17:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F288110E5D2;
	Tue, 19 Aug 2025 12:17:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="F+jGMl9q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16DAB10E5D2
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 12:17:08 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-afcb731caaaso724781266b.0
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 05:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755605826; x=1756210626; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ruw0ucM84Yq0/DRMCy2d/jkgPYOwi3Fpd3K2L5RAUSk=;
 b=F+jGMl9qmk4bxlB+ZDVJxP29Jai7cv+vUu9qqXQj53mQGPSX8xbOTzyjDYDKKtxKBT
 Ydxb1aH34646yd7Qefvy0pCr1V7cLoOriO+1RbWvh1YlyHlAibWXm0x7qzIijua8UucR
 N9D8ah944G8UuLK6YN6CAfc1zFAoXgg6N68TrppXLTFmYwdraKJ9uRsPCN+fkeFlKY44
 JrS+ZFyNw+zdYC3NtmMoPlg4zfvTmNj+9/4NAxO0XOe0JrqkAQvBMsoKo2DtpbxXG0kQ
 jWfgx3JN2sNIrflZrJDJLyYMQtRbhenVEoT2GAtzw+IlmSbwT+fE2JS+MACZIkKdESfD
 uK7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755605826; x=1756210626;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ruw0ucM84Yq0/DRMCy2d/jkgPYOwi3Fpd3K2L5RAUSk=;
 b=UEpVCAmOfakwlaNWEZyJ1IoxawFIwjmqDgMn+o3eIJrQqhkk/7V4xgcm5yQ+buWFyt
 dEIGIMIzNojP2Tim2QDiMLp9BXUcO4SKTZcFzAJ8289RE8znc6EWwUhOsnia2MQXX+8b
 qTGAc85VfuOYCYP1N3f2tWwnr/aMcjKD87ASb6gdZ7sdPMvhGgIug926QmhA6JC9dFuF
 2984G1lhT3b/KD/Xb+F0YB0+Oz5H62bG0KFTmSXcJrQCS8KqT/NqGucHbQVKqMcbmJQs
 TpldboHiYhil+3U9i0nZOlSa1oUC8NFyxUw+cWQyzvpi64/VIQP3UGOQ9xorK6M4aEBu
 FDvw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAEp8YuR+ztbbCDes5HoGTvplw6M2/fFztKhDVmp7BGRj8JxNoJ+UlUqqdaGU9d0LJV9nGy/FLNm0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwYF5txgAbymkml29zjWqKxc9PsCR2YWRqZHHihi/14w3myORCb
 5S1P/yB3yTwZUcSTL1agsKI8c5MY38/Ci0TCnRpiq9kZ4tNw/7WU5eMK
X-Gm-Gg: ASbGncspAH+UzPChFQkTSpfTCwsWuPS57+8VV89jK+00nrghOzMWYimavcXhpCorUQL
 mAA41lNEmJgJ4pr+hfOZvCrw6tVuTf4Vt0l1R1leC2NnWx1EV5aAN93S6RCYvnez7Hf8CbbPnYg
 pqH5/ZhSGg8tE8Xjty6asLaGUoCPQIeujDKfM5lNWagc0vITXZwLSH/HsY0GjGfY3Ny3jOvR3ol
 isacUJrS5tNH6JNOK3sNiRF1iLXyuIOrWAwhVAayODNSMnUdCZbC0W6pc0NP1/4sh1QFx9fM59J
 dXmHzkumD2W+MlkC98BI0aAr9CImfeM3Rlgh55acUkFKazUJObbPSW2wooIcsXZbuvmHIu0zlUh
 YQft6qltxzt7AZQ==
X-Google-Smtp-Source: AGHT+IEaH+8GjnNNMFbsi7+SYVJyxwBXDv0Ziy+pvr7sQlX7uGXafFVlDGk7vl7NvUBiWatUvLDKKw==
X-Received: by 2002:a17:907:d2a:b0:add:fb01:c64a with SMTP id
 a640c23a62f3a-afddd1e72d9mr235789366b.43.1755605826436; 
 Tue, 19 Aug 2025 05:17:06 -0700 (PDT)
Received: from xeon.. ([188.163.112.76]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afcdce72cbbsm1012018666b.35.2025.08.19.05.17.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Aug 2025 05:17:06 -0700 (PDT)
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
Subject: [PATCH v1 14/19] staging: media: tegra-video: tegra20: increase
 maximum VI clock frequency
Date: Tue, 19 Aug 2025 15:16:26 +0300
Message-ID: <20250819121631.84280-15-clamor95@gmail.com>
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

Increase maximum VI clock frequency to 450MHz to allow correct work with
high resolution camera sensors.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index 71dcb982c97b..67631e0c9ffc 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -589,7 +589,7 @@ const struct tegra_vi_soc tegra20_vi_soc = {
 	.ops = &tegra20_vi_ops,
 	.hw_revision = 1,
 	.vi_max_channels = 1, /* parallel input (VIP) */
-	.vi_max_clk_hz = 150000000,
+	.vi_max_clk_hz = 450000000,
 	.has_h_v_flip = true,
 };
 
-- 
2.48.1

