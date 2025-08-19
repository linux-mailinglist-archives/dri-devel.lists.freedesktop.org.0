Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 640A3B2C2EB
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 14:16:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A73D310E5BC;
	Tue, 19 Aug 2025 12:16:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="caanBP1T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C49C510E5BC
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 12:16:46 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-afcb78ead12so736325866b.1
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 05:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755605805; x=1756210605; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1wPpJDpKwCk8DlHPLkdpXMZ7CU88+N5YZ57h5JDdv0c=;
 b=caanBP1T5mdSTVwyKEAOF8FTqdJ7u4DNl4ogXorhBUcPlZ2979xM2K1HDvOZzFE4KV
 ebRqhDromHUfP42sesJH8L5IS6YP6fI8Ik5JlTM6oLcUcw6HEc8YOyqX7heRt1lDoVPm
 zSs/RHkTbnVLl7CXHp7njzdhVHkz/ol5oiXF4aCTDzVkRBayTQPnD/LGYugKEFxYhnub
 i2GHnnNZpx0KTw+HT0qZuM4odBvGTJU+T/WohjtuwBSOqLHKDkCvSWTuzEpaxFccEW3m
 P2FHrE6A4CO4MrLZNlFjYrZRSd3HaZZZehWLELYOOSMC67ea4m9h1p5npFuHHUIGquJE
 r38w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755605805; x=1756210605;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1wPpJDpKwCk8DlHPLkdpXMZ7CU88+N5YZ57h5JDdv0c=;
 b=tyIQeM0cjItp0zkcBXAbpETQB63mFdqbJA/F0Jcqy739F1wtSxZW8AqsBJJ4M98VZw
 61tk28ccIY8HU8bKXP2He54Vkn6uEXORrm6RXtWxoUBbLtIi88ktktKG1c/q9b1SAFFJ
 uTe5dWp63k9f9/ntE6B/FVu1EdcIbCUUWZ4FrgKntJgI8UmFu1w5D+ImQPOXWvbvVmze
 CPVKLuvwstY1qVJE8KMPsLNEI/qIt/Wzm4gebSnz4Ke7klo0OZYc/Q6e3KopDO+Vbya2
 UTAqss6UBlYwRCUIInWdgNswJyi6S/TctLO8+wdfIDoKPPMrh18B3RXORZlHpVlMS8bW
 XspA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0dnn3K+yHfBbh7IUU2JMrFbFTiPqocuZdd6MEiHnBfd9ErdXW+U5XkbwO6lvLInWxyNL9AvVDlOc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyFoANZjduvHCo+JHrMztzmD8UA/Uj+gRi/GpBmrydwTqsVT6ct
 jTYi1hOFNvIV5Z/8tEDEQFHz6A4oobr2LQJFsdy8MQJqjbJixZsRUNQ+
X-Gm-Gg: ASbGncsa1yMy0DgXspUZeWabr1IYHju5MQJCHeL+rxYCA96KHiV8gkYBn2CWUEak/wQ
 R18qkVET5/lVbFeHVWcHZLRG4E5IFiR5GQoi9nXDRTkUzxCiuYXuSEgFN5FL0FSnatTijNW/T1j
 O05wikAtFDrzeZQaylEzMSzaj0viGAps+j6Glnu/1nmr+bpwyAoVSCIAeJJU2mko3OORO1qSr9X
 qKe9ofLkP0LXZbUtNWTwjCdK/Y0L8qNJ1hT+z7lna7Vh48+DiYW6KObK8g6aRxWuCqDXGlam1QP
 pCwrgikHnXQZFlsoxPvU6TxO3EfqqvxhEgRMKT7FSaWuIAlrNOZlbBU2+r+m2PN2MoBguOgC3Ur
 IfOGZXlEzBHL6hA==
X-Google-Smtp-Source: AGHT+IFmaPaAq/FduUBB1m9MQ2NkpWZueEPAYDNEeu+6/eKSUzGZ0f4FXW8JsCOBd9mrL2w0lEtK2g==
X-Received: by 2002:a17:907:2d25:b0:afd:d994:cb2 with SMTP id
 a640c23a62f3a-afddd24961emr211057366b.64.1755605805046; 
 Tue, 19 Aug 2025 05:16:45 -0700 (PDT)
Received: from xeon.. ([188.163.112.76]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afcdce72cbbsm1012018666b.35.2025.08.19.05.16.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Aug 2025 05:16:44 -0700 (PDT)
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
Subject: [PATCH v1 02/19] dt-bindings: clock: tegra20: Add IDs for CSI PAD
 clocks
Date: Tue, 19 Aug 2025 15:16:14 +0300
Message-ID: <20250819121631.84280-3-clamor95@gmail.com>
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

Tegra30 has CSI PAD clock enable bits embedded into PLLD/PLLD2 registers.
Add ids for these clocks.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 include/dt-bindings/clock/tegra30-car.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/dt-bindings/clock/tegra30-car.h b/include/dt-bindings/clock/tegra30-car.h
index f193663e6f28..14b83e90a0fc 100644
--- a/include/dt-bindings/clock/tegra30-car.h
+++ b/include/dt-bindings/clock/tegra30-car.h
@@ -271,6 +271,8 @@
 #define TEGRA30_CLK_AUDIO3_MUX 306
 #define TEGRA30_CLK_AUDIO4_MUX 307
 #define TEGRA30_CLK_SPDIF_MUX 308
-#define TEGRA30_CLK_CLK_MAX 309
+#define TEGRA30_CLK_CSIA_PAD 309
+#define TEGRA30_CLK_CSIB_PAD 310
+#define TEGRA30_CLK_CLK_MAX 311
 
 #endif	/* _DT_BINDINGS_CLOCK_TEGRA30_CAR_H */
-- 
2.48.1

