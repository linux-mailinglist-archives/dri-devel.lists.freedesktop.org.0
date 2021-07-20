Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F10333D0152
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 20:14:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A64B16E192;
	Tue, 20 Jul 2021 18:14:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 714E16E192
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jul 2021 18:14:04 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id v14so11814478plg.9
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jul 2021 11:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=of2whry+ved6HNeGLLY4AipytgO/6qqnDcIiw1/WDio=;
 b=xXQkf+965qBS1JN8p07OLCDjasIqyBIrOC3bjMPJFkjTSOmsU4j/J3/grmyw2f9f3g
 n2YAOWT47tJoTXI50GwSwJX75tpt/QSyXRLBuedIZ08Wq/6f+DTGR9waSllkUIe+u5Qt
 Vr3XreC9ajVjF+rZQBlYwDJDBSlsjlqySlVgMwoBVeSWZSLGZpWzuKLR1fbnq8+AFLe5
 K8o5Ykf/NmGQNHG5MQR4qOuErB0pgzWk3WjGqKzVoHde9Yk0ILBv2mumzqmMA/A7gf8d
 cQUXlcpQiNIQgddLV1mhq9E2AKYQRHEOK1uRK5FVLxi9YW06+OThuzoH/3Wp7WxvUt9V
 aI6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=of2whry+ved6HNeGLLY4AipytgO/6qqnDcIiw1/WDio=;
 b=t+tB9FVG5S8qd9AW+aYZS+Ezh20P3gYrB4qXgrFwI/wdn83CfOZjes0IGv+drsGIo7
 /eJf2gKY0phXpXDTiXGe1TKruvxxdfuhYN7pGkTZQwKBnL4W7RdbMurIhk8MIdfPGzBA
 i6EqxC4aK9LRDr2SvUyRLknOXBOioGgcxp1dRm9TGCPtp9Cn0IaChCI/rKGXRkIAhG5N
 CCZ5MIG6QDX4f/zV+hWsaBnP1X5tKryiU+pzEhPxBFT1yp/Fkrr3VZuH+4qZDpvUyhVo
 qS4ArHaVXiwcdXQ1M6uLcYcCzBZc2I+bgOGUxf4dh9bFp2rvXgVcLlUF2ajVb7XX8oP2
 EPxA==
X-Gm-Message-State: AOAM530qudWdD2ppCs1pYv1UIHQ9ScAOsCoZOfSxhFvLPIw80ZJux8El
 1vbLDi2YwjfFakXP2R/8yH11polx15IKuw==
X-Google-Smtp-Source: ABdhPJwYRdr5KbajCO4ESotYw9fAQYoVDdkOaoYQ5OLmSU5acRlyxauymh/0fUDFT4PM2/jwMnzbKA==
X-Received: by 2002:a17:90a:4f02:: with SMTP id
 p2mr35448736pjh.112.1626804843793; 
 Tue, 20 Jul 2021 11:14:03 -0700 (PDT)
Received: from omlet.lan ([134.134.137.86])
 by smtp.gmail.com with ESMTPSA id c2sm26436573pgh.82.2021.07.20.11.14.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 11:14:03 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 0/6] Fix the debugfs splat from mock selftests
Date: Tue, 20 Jul 2021 13:13:51 -0500
Message-Id: <20210720181357.2760720-1-jason@jlekstrand.net>
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
  drm/i915: Use a table for i915_init/exit
  drm/ttm: Force re-init if ttm_global_init() fails
  drm/ttm: Initialize debugfs from ttm_global_init()
  drm/i915: Make the kmem slab for i915_buddy_block a global

 drivers/gpu/drm/i915/i915_buddy.c             |  44 ++++++--
 drivers/gpu/drm/i915/i915_buddy.h             |   3 +-
 drivers/gpu/drm/i915/i915_globals.c           |   6 +-
 drivers/gpu/drm/i915/i915_pci.c               | 103 ++++++++++++------
 drivers/gpu/drm/i915/i915_perf.c              |   3 +-
 drivers/gpu/drm/i915/i915_perf.h              |   2 +-
 drivers/gpu/drm/i915/i915_pmu.c               |   4 +-
 drivers/gpu/drm/i915/i915_pmu.h               |   4 +-
 .../gpu/drm/i915/selftests/i915_selftest.c    |   2 +-
 drivers/gpu/drm/ttm/ttm_device.c              |  14 +++
 drivers/gpu/drm/ttm/ttm_module.c              |  16 ---
 11 files changed, 134 insertions(+), 67 deletions(-)

-- 
2.31.1

