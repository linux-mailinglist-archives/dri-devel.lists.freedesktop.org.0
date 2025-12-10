Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0320FCB26AC
	for <lists+dri-devel@lfdr.de>; Wed, 10 Dec 2025 09:31:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1838710E250;
	Wed, 10 Dec 2025 08:31:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="bxFSiV9r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D65810E250
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Dec 2025 08:31:52 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-b7370698a8eso894094466b.0
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Dec 2025 00:31:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1765355510; x=1765960310;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TeuBdOwfmxtuicx7sy8IIOAwzU7LAeekCzDxpQuEvCA=;
 b=bxFSiV9r/kKaWbaBwA8K2U+vOkavFj4YfTJC9eeXMzhEk/CjcRp5He4RVMe0St+dDo
 CzfHGX29qsAllz6rs4cfchzCNyn47hlLcQZ+IIwZD1s+MZregvathsypk/aZdV7Sphxr
 k4l0Jxz9K8fNXkowQb+Dl3gfVBOuGDMfL+LhANvGKMPJ6M33qq1gY+/VsI9/LhEaOAO6
 YsMqemQV4Y9aX85kRUAZOTL93NQubeN5N3ZCR2mA7w+xRuUXwaVmXXGb4r6k/L1tfGVK
 ZkXK6ByNCTC4moYWqDh/DiNCsyDaup5HoLFNcRu16LiFX+cN+lSol1m3Vspi6TFe1N2S
 GQ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765355510; x=1765960310;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TeuBdOwfmxtuicx7sy8IIOAwzU7LAeekCzDxpQuEvCA=;
 b=g0VWrmyvQF9vZ8GmJaV4E2Hk+AFKOCqoqz8M5nsmQv7n5gWyBwTYArBhFEjkg/FHyx
 MW7uXV+FPMMrpjrbDsUOg+kL9YfuPbVT+xGhQ7bJ01kWocD9oTUxMhz2HixLMCKFjK6C
 QOU/NviLNqDiwpaz+vx1wZtWd0rt8AndFC9u+8I4FyvfcQr0xIda8nf+Pb4ZViEYvq9s
 ipeiJXOs1txF0wAKvhlsSXW84XtKjGKKNFsniFBbRyiNe8IsFDyYwTmYWHE1RbPJrfuo
 CQEt3zUL4pb02fbSLDKBSh4Tru/fr34Hjt8/UVSeb6vW1tLQnyWzEdTG1C7rufmxBscZ
 fWrw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUz8Rw4OOpRsIAnmrj1lX+l4OQnUZ739mOlO7EIQyUPv+AV9a76uAXumFHO9hpRK4wLBRcxn7VOmOQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz/sZzIKY7CpO3Q55h11b3nme/yOC7NxgOTjd8Hg/b66Kra2Lop
 qsu5HitV6giSe+jxeJkFpBk34BaY5/U9cmMebMai/d1c9+6EoF/pBN2OJydT547YSCY=
X-Gm-Gg: ASbGncu5IYXQmWEafilinJWcGCfETwcp4Y1LFwjdkV8tNtLw+m8w+0p0Eyt9ZfmhcKM
 mmZR2gxAoo4zzI2pttJFeivRGIj0j8ihP3Fivy3eooZ8pFnAgWW7U/nl+7T04MD+a91aHZsKGtY
 9BPz4xZtzLG5mN8H90+e5xsy8mb2t5W/cjvGnew0e4tw7gm+92HmaRxqVdX3b3lwepPr31P1bJH
 JpyBVqVtNrcwgX0YX7SrWZ3+kvqyvDDie83nhv2n6RpLT48UcW3spDzGYR1JHaPtiWpsoNqEfGF
 0j33hEzd8QPZpYkWosZzr2lfGGwdAnw1hQ3ut+YdD5ANqlRFDc+YpSTCT9BOI6fvUM3RrABDHoZ
 TKpHXLyHaJelaRA9SSkAFA8MfsB2v9Pp500IeyiPHhX8y+dqbWWz24aMiJPye8+qiUhOX0TwNUH
 4MV6Mi72k7IYCcdhDk
X-Google-Smtp-Source: AGHT+IFhEWLNvMehRpc1wUqvy7EgAfKj7fWQCi0AaayfiHw5TZ8PfJNykHUWSH+Jpsiw27YnP7qNSw==
X-Received: by 2002:a17:907:940e:b0:b71:29f7:47dd with SMTP id
 a640c23a62f3a-b7ce8476094mr174700566b.46.1765355509951; 
 Wed, 10 Dec 2025 00:31:49 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:1d24:d58d:2b65:c291])
 by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-b79f497674asm1598816366b.38.2025.12.10.00.31.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Dec 2025 00:31:49 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Akhil R <akhilrajeev@nvidia.com>, Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-crypto@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH 0/2] host1x: Convert to bus methods
Date: Wed, 10 Dec 2025 09:31:36 +0100
Message-ID: <cover.1765355236.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=703;
 i=u.kleine-koenig@baylibre.com; h=from:subject:message-id;
 bh=WFOYx3gHrxNUtjZ9bkur+Qccb3Ac+ntLs6kixYG0l+o=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpOS/pKRGMR+zmAK1B+hWBzeQycrZi9CsF/M95z
 WMChvvAaY2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaTkv6QAKCRCPgPtYfRL+
 TkEhB/9UH9ZkwIxvzlifG7NyhzIUvjXvPe+zdF4tvTXVerfpLth6KJe95KUS7zl/ZtyebZz0D0I
 6HC16qxNL0UPB59lEPqR9BMbMqC6DswMZrjSUU7EXrIaA1k0NQbKuO98s8Wpw3mEuNwUWcuAfd0
 ZjhzB6I6y00O/o6eWe0swn89yn88PDpEwpmVGRmKt4KMFVPQs/TyHFzT77Vs/GWe1sYP0H83yHB
 76QKduqnaltVkBvI2q3gugY4Rss5eOWhfULtoLbjwP6xrQuIL+zwucgvF3SIcpliagwQAP3UN4c
 OitUBA5tMJCTbIptvpfqe6QD7NEBWUdLLJCHf/+z81sRtnj1
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
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

Hello,

with the eventual goal to get rid of the callbacks .probe(), .remove()
and .shutdown() in struct device_driver, migrate host1x to use bus
callbacks instead.

Best regards
Uwe

Uwe Kleine-König (2):
  host1x: Make remove callback return void
  host1x: Convert to bus methods

 drivers/crypto/tegra/tegra-se-main.c      |  4 +-
 drivers/gpu/drm/tegra/drm.c               |  4 +-
 drivers/gpu/host1x/bus.c                  | 67 +++++++++++------------
 drivers/staging/media/tegra-video/video.c |  4 +-
 include/linux/host1x.h                    |  2 +-
 5 files changed, 37 insertions(+), 44 deletions(-)


base-commit: 7d0a66e4bb9081d75c82ec4957c50034cb0ea449
-- 
2.47.3

