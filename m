Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A36223D1242
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 17:24:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C35E56E4EC;
	Wed, 21 Jul 2021 15:24:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 086146E4EC
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 15:24:57 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id b2so1130972plx.1
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 08:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IUFS9JScH7K5vVor56zPcPsX6I51skx868VgLMYWUto=;
 b=ho2qtJA8u9IgSBDcg0VpRR5I5gzJdykkQRC0dJ7TYNiWPogkWsAOtHC96pUT2dTi4k
 nsypt5QZqomAsiAKccq+gMVlJOyk2e8j1POstJ5dzPrDFI/Xw2j0ROxBLCt/6M37r+jn
 sSR7mP/heMqVE5644py74ls79IikH6nHKzlzzsRnewqgPfCZCYAAbjGq15PPuozRP+Z0
 rdE81Dxb+KPd9pA37mIDZ4UL4EKF0Xi047i99bVccIVM9XonvrGAusHWzlU6D+YfA60F
 qtV88IZBpcGQURaFqmAC+Ixa7KcmktuHTVcJTwaYMEjyfFioO6JU10lv1I8D9tYTuWrS
 PReQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IUFS9JScH7K5vVor56zPcPsX6I51skx868VgLMYWUto=;
 b=Gdke0DRHC6yT2j/5I//re1hjRsRXUYLbGuju99mvXr3o7MlTCwTAhYQF5uEyV2qilB
 thjCNPg0D2WVzrQetRSdiYMlpkb8WeSY8IpsVALdB1yCnwwQ5OT7P2mv77p8OWP9pqAT
 Voaht3uEWeVjhhiiv3h0o0/ObBr4kV92b0fSVkXfHz1qdCubWZ6H1VKjnoZ7vQB34xct
 InzD7JQ6AXRUL8kZm1KlKWk1ET4kVKbsyMiDage67morsyQhMZl4wJXQ67UhRNuzXI8x
 Pz3zcl8l3fwFnQ6gVTPn6xDplM6A8btDrxO5swGKB3rLv4HnpK/THfcdeBiKCR7kwDqH
 L6UA==
X-Gm-Message-State: AOAM532Yeeu/DzX2EDcvby2dSe0wVJ+ZzEqPYQ7HjmDumn2sOQMUH8xF
 gKXkbwd3AE03LGm36Lm4OLnbgQ==
X-Google-Smtp-Source: ABdhPJyF559yMeUil6M9Tqu3IZeVcTNqNWv57mvgOXT7kghIjMUCXz0mWLfotP9bM3BSrpBAvHhN3Q==
X-Received: by 2002:a17:902:eccc:b029:12b:a750:cc3a with SMTP id
 a12-20020a170902ecccb029012ba750cc3amr3198591plh.57.1626881096470; 
 Wed, 21 Jul 2021 08:24:56 -0700 (PDT)
Received: from omlet.com ([134.134.137.82])
 by smtp.gmail.com with ESMTPSA id e4sm32451034pgi.94.2021.07.21.08.24.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 08:24:56 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 0/6] Fix the debugfs splat from mock selftests (v3)
Date: Wed, 21 Jul 2021 10:23:52 -0500
Message-Id: <20210721152358.2893314-1-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Jason Ekstrand <jason@jlekstrand.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch series fixes a miscellaneous collection of bugs that all add up
to all our mock selftests throwing dmesg warnings in CI.  As can be seen
from "drm/i915: Use a table for i915_init/exit", it's especially fun since
those warnings don't always show up in the selftests but can show up in
other random IGTs depending on test execution order.

Jason Ekstrand (6):
  drm/i915: Call i915_globals_exit() after i915_pmu_exit()
  drm/i915: Call i915_globals_exit() if pci_register_device() fails
  drm/i915: Use a table for i915_init/exit (v2)
  drm/ttm: Force re-init if ttm_global_init() fails
  drm/ttm: Initialize debugfs from ttm_global_init()
  drm/i915: Make the kmem slab for i915_buddy_block a global

 drivers/gpu/drm/i915/i915_buddy.c             |  44 ++++++--
 drivers/gpu/drm/i915/i915_buddy.h             |   3 +-
 drivers/gpu/drm/i915/i915_globals.c           |   6 +-
 drivers/gpu/drm/i915/i915_pci.c               | 104 ++++++++++++------
 drivers/gpu/drm/i915/i915_perf.c              |   3 +-
 drivers/gpu/drm/i915/i915_perf.h              |   2 +-
 drivers/gpu/drm/i915/i915_pmu.c               |   4 +-
 drivers/gpu/drm/i915/i915_pmu.h               |   4 +-
 .../gpu/drm/i915/selftests/i915_selftest.c    |   4 +-
 drivers/gpu/drm/ttm/ttm_device.c              |  14 +++
 drivers/gpu/drm/ttm/ttm_module.c              |  16 ---
 11 files changed, 136 insertions(+), 68 deletions(-)

-- 
2.31.1

