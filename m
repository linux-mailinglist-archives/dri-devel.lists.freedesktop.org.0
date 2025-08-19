Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A84B2C2FC
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 14:17:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1504410E5D0;
	Tue, 19 Aug 2025 12:17:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="d3YxBl9s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26B9010E5C9
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 12:17:01 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-afcb61f6044so871358266b.0
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 05:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755605820; x=1756210620; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1Tsn7/PVaqosvLaCs7iLw7AqoWFV1xRnJguVR9ccfWw=;
 b=d3YxBl9svNR7RxvEJgeYqEJPLPhvewyMDG4HqOULRMLqSoMf4C1ff7Hwgn/XH4knmL
 /qdWGkq6qyr1vL/Cl9gSKvf6r8zlRAYIyXtD4efNCcL0G5mPJjXdBJSpYp94abPsSt5K
 8OkdbAveuVtAF9RaJbQAPrkYQqXZFLWIMx6Sc9WGD2TgmmoTokaPYC6LAOXs87ONoIiI
 wdGe7ifSiq0HoWXXLjthTt+PBE8NhzXaPil8ymtddXJNdN5zU82BXJY9DUF3HClcoBwZ
 CyTs6Mq7mYFag8nFmXEabT+Yf2c1XR1UQ1XHXVt9GmpYQ9m+X53jsYVEfq/YPNXPda0I
 WPsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755605820; x=1756210620;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1Tsn7/PVaqosvLaCs7iLw7AqoWFV1xRnJguVR9ccfWw=;
 b=JoLmxzZxs3mdOVdnLblE9kpefsiJTRkfP7prWjQqp/dfARUvfbxdi+GCQdUAJQr9xB
 sv7Uk70PNtvIa16kaAuNmWgMZu/ghyd45gTDddtQmw1qoNUue+SSbxsLDgCMlznOUz7Q
 nT4MqUWerex4f5s+ULvWMaMdjWYOOP9M/8FF54+ni+ycIWHJid2JHHvY2T1EJTLHJ8nF
 p2IqDZ4Btcp3EUIW8KDZxenyCmkVi70xvSLTVbkBsMMwizZYFsqgJTduJJZMbnls5Upu
 DgrDSV5jp3vvsKZW5X6+AeMCInWAFt7usCvg+8VaMG2lWyz+iK/rPIrqBV1IQesow1Po
 dg4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMltFaLdKYmb+3KHwvP9Bc7N3F+m7MucSaIdBvD1tYacJbv+8fP953ZsHWj0w02Sl2t3QeA9AQrcM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz4jEkOxYK5jsHJJWmgzWPnK2Uugvduan4WZW+49rVzWD1pB8Pc
 CEY5Lf7f2DVyIDJq8uA83L8RG5wqCbsqRkSAcJZpas1oTs1C/D2AAxoq
X-Gm-Gg: ASbGnctN2mvX5ttwgslpr1+FKXdgU99USjR+DiVCoRSm9RBIy+zC82A4aPoe31fg7g8
 BvjOwricmH0SeYtUgxJ/KL9hFv6T77oSz/wD3hxTn6FSfArRQLU8LX/Tiq2Eh9TibPu8KoOwdV3
 Cxsx3nBHgL6ueDT9gUuI4cZtl2/3/0otdk8f+ue72JDKNqay/VX3wXN1XwAbaMn20xrDlieOSCJ
 /Ib2ZAEqs0jdUPyelmJSTJdP6Z9nq8Wr+LMBA02y3ThI8FhfDWK1WYsd4XA0VJvIRutAyoCHawp
 Y++J/j7JtURDKysWUzmyANEUW8v+iE8BnX4DgmE4pgZQ2e1W61L7aTrut51ZVClxNkxFr0gLhVN
 gGvqA6tljC1zuyw==
X-Google-Smtp-Source: AGHT+IFR03wUf/s5dpcY5Njkk1gUJvemYOHmy3eI5N7Qv20olVtXIdCUE2WYMpm0yBZGx4Vnde7sxQ==
X-Received: by 2002:a17:907:268b:b0:ae3:5185:5416 with SMTP id
 a640c23a62f3a-afddf091d30mr244037666b.13.1755605819462; 
 Tue, 19 Aug 2025 05:16:59 -0700 (PDT)
Received: from xeon.. ([188.163.112.76]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afcdce72cbbsm1012018666b.35.2025.08.19.05.16.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Aug 2025 05:16:58 -0700 (PDT)
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
Subject: [PATCH v1 10/19] staging: media: tegra-video: tegra20: set correct
 maximum width and height
Date: Tue, 19 Aug 2025 15:16:22 +0300
Message-ID: <20250819121631.84280-11-clamor95@gmail.com>
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

Maximum width and height for Tegra20 and Tegra30 is determined by
respective register field, rounded down to factor of 2, which is 8191U
rounded down to 8190U.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index 7b8f8f810b35..3e2d746638b6 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -23,11 +23,10 @@
 
 #define TEGRA_VI_SYNCPT_WAIT_TIMEOUT			msecs_to_jiffies(200)
 
-/* This are just good-sense numbers. The actual min/max is not documented. */
 #define TEGRA20_MIN_WIDTH	32U
+#define TEGRA20_MAX_WIDTH	8190U
 #define TEGRA20_MIN_HEIGHT	32U
-#define TEGRA20_MAX_WIDTH	2048U
-#define TEGRA20_MAX_HEIGHT	2048U
+#define TEGRA20_MAX_HEIGHT	8190U
 
 /* --------------------------------------------------------------------------
  * Registers
-- 
2.48.1

