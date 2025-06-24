Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA23AE67DF
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 16:10:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51D7110E5C8;
	Tue, 24 Jun 2025 14:10:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="FYW1iZgn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25CCF10E5D6
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jun 2025 14:10:22 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-453643020bdso4796855e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jun 2025 07:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750774221; x=1751379021;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gSOei/bzMdbbI2Pm7lA3f9YENYRJXjnioWA5X0R4sEo=;
 b=FYW1iZgnVUbSDyIu+cIf/e9PLa4MUfiy2KOw7E0IK5uuAQdICL+sGuiNqDRhNY8YGG
 N5J6mlA7Y2e9gE2PHZkBoHTSaDXARh9Jc6LRLYSvQgPTHNSAepiEgCw/J1gIw73/rDaW
 hfRypa4dHDjSrLy4TiLqG/FTYpmqpHzlyY6cfdeZek/AwhCIkrx+K8L4QGDUk/tQ/ONL
 v8bAoBElzop0ZnxcGQbemXapHsIX30ofbWIAqZBcySrHGQu4nZNOTerABdU7Xka1BXXw
 5SdQ+Tyrj5tC6Jxu4tjov6b5bxC98+BqzRYesHB4MXi7aRgY67cmXbodYnSF5+5taYPa
 k9UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750774221; x=1751379021;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gSOei/bzMdbbI2Pm7lA3f9YENYRJXjnioWA5X0R4sEo=;
 b=kbM01Z+q1Bl35xLfKicsX9xCrT5xFm2qXfxVXLbqzXHCulZQdccuZMcR68AJ6IaAAv
 CKJN53bMOzzXoWwIbX9wQyuw1SLzYpgSIwEiiYWOwro/BsTzDyz4v2oxjKxap4tp+WYb
 sHMxvHGOLReav3mdEH7ofUA7gR6yoNpE3ELnLCI1yaxX6htXg+Qo0KZpbg5istiXuJJ/
 W29Xa5hPcjPiro5WVSFABAwtsjosN8WSGrOcwOeqvgs/3wOeAHa68169XaD0THeLowgT
 8+dv4mTR9pZszmlMkzFLNHQY03dCDRw8nywBgfEIRUBHnuAHdeC2hh9MTdHYx0bZoTH3
 k1jQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRb/sA6g8fTGYBRVfaL0tAP/tp0thvNPzIRIZEOutPI6EjkBBsKsM+wZP/hYxkdyHV808xASB2qPs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw1HlWQgSwI0OvL7KknUb9lUTtEmDj46Tmwk5a9o5yx51zWs+co
 WdkR2fTLi1PAvDaTe6EDB0Smzi94fOBgVqR/FjiP9Eivx0FGzxdnT6WkUa19flaiAlg=
X-Gm-Gg: ASbGncsI5rj6DtrWtO9aOqTx7GMgaompk3W96Q16zCX95ZZTQZB5O1DFMEt6Jyy4MYw
 W/cg5RTul9IkJizj8JedI5UgalcLSX3WqWFhscPZVGgj7kOKJKG5MwaCOS5qDhv5CLZtoY0lN8V
 Le/LingUNM1z/pnMKq31TZcRJSnPaqu6GT6b9aWr2egYDgIvtnRq92eSSYUolEk+Vu7FO5zwCDM
 YJqUIwozg+aI4fU8c+eJKxPcUzfXdZFEAeF4N8fuEiN87IGmGQMFd+/5KCpUsGgWsBYV9yPDJtG
 53u2GAY6nNyQiMIdIACfzRPYRJOBTic9A6gLh5gSWbjnI403clZd8CsJ2cYQuqc=
X-Google-Smtp-Source: AGHT+IHAFIyNFoPHfcJpS9uG7ODV4IPOWAcQwwmdmU2AsHKw3IL8dxcp/xxloNOH3Z3z2+I3czNdHw==
X-Received: by 2002:a05:600c:4452:b0:43c:f0ae:da7 with SMTP id
 5b1f17b1804b1-453716b567bmr78480325e9.7.1750774221073; 
 Tue, 24 Jun 2025 07:10:21 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:34d2:109c:3293:19e9])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a6e805175asm2004223f8f.20.2025.06.24.07.10.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jun 2025 07:10:20 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Michal Wilczynski <m.wilczynski@samsung.com>, Drew Fustini <drew@pdp7.com>,
 Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Ulf Hansson <ulf.hansson@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [GIT PULL] Immutable tag between the pwrseq,
 drm and pmdomain trees for v6.17-rc1
Date: Tue, 24 Jun 2025 16:10:13 +0200
Message-ID: <20250624141013.81358-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.48.1
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Here's an immutable tag containing the thead 1520 power sequencing driver
for the drm and pmdomain trees to pull from.

Best Regards,
Bartosz Golaszewski

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/pwrseq-th1520-driver-for-v6.17

for you to fetch changes up to d4c2d9b5b7ceed14a3a835fd969bb0699b9608d3:

  power: sequencing: Add T-HEAD TH1520 GPU power sequencer driver (2025-06-24 15:55:05 +0200)

----------------------------------------------------------------
Immutable tag between the pwrseq, drm and pmdomain trees

Add the T-HEAD TH1520 GPU power sequencer driver

----------------------------------------------------------------
Michal Wilczynski (1):
      power: sequencing: Add T-HEAD TH1520 GPU power sequencer driver

 MAINTAINERS                                 |   1 +
 drivers/power/sequencing/Kconfig            |   8 +
 drivers/power/sequencing/Makefile           |   1 +
 drivers/power/sequencing/pwrseq-thead-gpu.c | 247 ++++++++++++++++++++++++++++
 4 files changed, 257 insertions(+)
 create mode 100644 drivers/power/sequencing/pwrseq-thead-gpu.c
