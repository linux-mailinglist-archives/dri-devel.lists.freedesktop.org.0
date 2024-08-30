Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACEEA9657F1
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 09:04:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C4CC10E815;
	Fri, 30 Aug 2024 07:04:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="EqpFzhG3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5391810E815
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 07:04:37 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-a86abbd68ffso257856866b.0
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 00:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725001476; x=1725606276; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NAqkPKV8FIclg2RIfEME8aNTCMBfxloXKZQVTM0jEG4=;
 b=EqpFzhG3HetpeWMThFEijsbb9qjgJ7wGebXI2mRaNYG/6iKklTA4xyNx175MJMj/JL
 bFq8Kb/elJoJloCIYfpP88GMZAdZ9wNcy82/69DSWmxEQtrUsal/XI9kFGAF0TAayotp
 cY1GK1iTdh5/lTrFeR19VRMUa5raPp+Njp6qK5uGQTa9gBxVwMPyre5sR74pqoyVN9GW
 tniP6U+8QwBI9SW1HOZ2e0UU26/yaRDKu7N/KHEW5n1xLMpyLU1dXrKI0peoJMKxcg57
 ogv2Pf0vGvckCSvDYoYjcSa+EyKMSWJ1Kiy11H/c9n8JOcwe253gMB0Vjs1zrmpl9mVt
 hh5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725001476; x=1725606276;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NAqkPKV8FIclg2RIfEME8aNTCMBfxloXKZQVTM0jEG4=;
 b=Gltuq/x0rUR/7SWJ6EDtn6EYn7kQANiwxbAzVrpMFt3K5dxbqyh2+33pCJamCQ0B8X
 xrCf6FyScJsvWHK74ZaChF6cIVOU+Kdp3QufT5ON8hcWq55dCZY7NbMdnCMeSZS3al0o
 RoObLsCSoqUsWRh/9YSydRp7CJEX4HQXFnaIMnS2nQyoBjf5vm7sVV/h5Zlb6i3vh5io
 oWdOS0r7BNEQ0P9oRqUS4vVd/NaRJuxa8oY6DSPBMYtxgFY7yozQUUY7jkOk3sPRTIN2
 gx9TWTufYj5lBw7fahyUoLM2mcqfsJtDNhIqAjK1Mc1r44LNoDdsfVpLU4Vq43nO8pv3
 xJLg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2m7pocml3CWirB2cKc8A0CXqqW3M2P2TlIQQWX+0tq+rxHWp8ag+YKDZ3U208IjzZk7LY4j3aoF4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwEe4QnXb1ZLolfqjeWNsVDiMv4CaTAe3jomDE0tdPDO8FtRz0x
 lrcEKxv6BTGFZe9/CBefNXe/kVupDK1rHSWMaL6VOg95KKZ0ZUF0ndsWg11DV68=
X-Google-Smtp-Source: AGHT+IFDgPRujvPs0pY58RBt0z0M4T/+m/fwfgJO35cZdR0pWvXLPvq+fQ5KKo/0SLFh8TiIvn9dYw==
X-Received: by 2002:a17:907:6d25:b0:a86:94cd:97f0 with SMTP id
 a640c23a62f3a-a89a26bfcb7mr138897066b.19.1725001475410; 
 Fri, 30 Aug 2024 00:04:35 -0700 (PDT)
Received: from rayden.urgonet (h-217-31-164-171.A175.priv.bahnhof.se.
 [217.31.164.171]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a89892232c7sm178026866b.222.2024.08.30.00.04.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Aug 2024 00:04:34 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, op-tee@lists.trustedfirmware.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: Olivier Masse <olivier.masse@nxp.com>,
 Thierry Reding <thierry.reding@gmail.com>, Yong Wu <yong.wu@mediatek.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T . J . Mercier" <tjmercier@google.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Sumit Garg <sumit.garg@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Jens Wiklander <jens.wiklander@linaro.org>
Subject: [RFC PATCH 0/4] Linaro restricted heap
Date: Fri, 30 Aug 2024 09:03:47 +0200
Message-Id: <20240830070351.2855919-1-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
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

Hi,

This patch set is based on top of Yong Wu's restricted heap patch set [1].
It's also a continuation on Olivier's Add dma-buf secure-heap patch set [2].

The Linaro restricted heap uses genalloc in the kernel to manage the heap
carvout. This is a difference from the Mediatek restricted heap which
relies on the secure world to manage the carveout.

I've tried to adress the comments on [2], but [1] introduces changes so I'm
afraid I've had to skip some comments.

This can be tested on QEMU with the following steps:
repo init -u https://github.com/jenswi-linaro/manifest.git -m qemu_v8.xml \
        -b prototype/sdp-v1
repo sync -j8
cd build
make toolchains -j4
make all -j$(nproc)
make run-only
# login and at the prompt:
xtest --sdp-basic

https://optee.readthedocs.io/en/latest/building/prerequisites.html
list dependencies needed to build the above.

The tests are pretty basic, mostly checking that a Trusted Application in
the secure world can access and manipulate the memory.

Cheers,
Jens

[1] https://lore.kernel.org/dri-devel/20240515112308.10171-1-yong.wu@mediatek.com/
[2] https://lore.kernel.org/lkml/20220805135330.970-1-olivier.masse@nxp.com/

Changes since Olivier's post [2]:
* Based on Yong Wu's post [1] where much of dma-buf handling is done in
  the generic restricted heap
* Simplifications and cleanup
* New commit message for "dma-buf: heaps: add Linaro restricted dmabuf heap
  support"
* Replaced the word "secure" with "restricted" where applicable

Etienne Carriere (1):
  tee: new ioctl to a register tee_shm from a dmabuf file descriptor

Jens Wiklander (2):
  dma-buf: heaps: restricted_heap: add no_map attribute
  dma-buf: heaps: add Linaro restricted dmabuf heap support

Olivier Masse (1):
  dt-bindings: reserved-memory: add linaro,restricted-heap

 .../linaro,restricted-heap.yaml               |  56 ++++++
 drivers/dma-buf/heaps/Kconfig                 |  10 ++
 drivers/dma-buf/heaps/Makefile                |   1 +
 drivers/dma-buf/heaps/restricted_heap.c       |  17 +-
 drivers/dma-buf/heaps/restricted_heap.h       |   2 +
 .../dma-buf/heaps/restricted_heap_linaro.c    | 165 ++++++++++++++++++
 drivers/tee/tee_core.c                        |  38 ++++
 drivers/tee/tee_shm.c                         | 104 ++++++++++-
 include/linux/tee_drv.h                       |  11 ++
 include/uapi/linux/tee.h                      |  29 +++
 10 files changed, 426 insertions(+), 7 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/reserved-memory/linaro,restricted-heap.yaml
 create mode 100644 drivers/dma-buf/heaps/restricted_heap_linaro.c

-- 
2.34.1

