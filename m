Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E59DC3CEAFB
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jul 2021 20:30:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5838899B3;
	Mon, 19 Jul 2021 18:30:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46200899B3
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jul 2021 18:30:52 +0000 (UTC)
Received: by mail-pg1-x529.google.com with SMTP id a6so12580299pgw.3
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jul 2021 11:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JSsNAUC6TiFNGPt9xPuG3DB4bHI3IWdAc/24RkOt6HQ=;
 b=i3catkL5M2NRMQoORFlVDgavzWU9gJZ4uMLoMkwk+3OBCwBdE/h4prGHOfZI8I0h0W
 OngS/0xL5V0w5t9lIlUp06Y38QCNKIehxdJZ9g8VYzIENd9neeYN6kPkyaS0G/nXJPuZ
 lK/I08XDb9HH5GHaeUStsa4mnyIYZ3U9P+W6WbNDOU0+iS5qSiGT+03EMJ8T0QFcT4pM
 e3NRUo5dqPjrrToxfko+ENeL7GAN1RbJb2aPRP4caGKSxof0NP8VrRcwBjQEtc/p4Bmi
 4isP/3iDRB06sI3VobDu1Bgda80xvNSBXmudC/EtMy8ucCazx1tAaOc/iCVw99eJ7fk3
 FuAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JSsNAUC6TiFNGPt9xPuG3DB4bHI3IWdAc/24RkOt6HQ=;
 b=Bswq7g/1z7WQ5FHoEBcSV+ejmmJDYVbEWIoWr6vsUseNFLtiwNUADe8k+trsRohVGa
 IQw6dGQZl1/0bMcQoN5X0Yg3YTb0HajweJyXdQcb0Slmz3yJCVLWVZkskUg+3MSY+YZP
 B2ASq0zLvxsQzzt7N5nUB6C2rAsWMldJy58cpQiFxqchV5iGa0bqmPE0q7+3X9n7nRX1
 0GuoBsNIw42Ceza0LXUllYDRW/xYYx3nwc/byX1Wa4CzXxfzz63a9MTDGe15RtNF1/dv
 TGW0ofEXkKSah2gGSPN36hYGOHOxpmq6uLNmT3rg62x9+HaxEGSCcKzYQwvB5sjL7CI3
 wAEQ==
X-Gm-Message-State: AOAM532EO/u76iqOgYm2WCXcimsVYY+cbNAzHAhzGAjIHuT0qQCcgpsg
 c3FIL6s9RmNbm54NsMpjBHjyNIy3QIDrmw==
X-Google-Smtp-Source: ABdhPJzriqZyRKvGrZLDXm7/suRhXqumeYjQ8boMMTVchMs6w/LHutLlrB2Xai8edvv63O33ylZxRw==
X-Received: by 2002:a63:4b20:: with SMTP id y32mr26498076pga.382.1626719451665; 
 Mon, 19 Jul 2021 11:30:51 -0700 (PDT)
Received: from omlet.com ([134.134.137.83])
 by smtp.gmail.com with ESMTPSA id w23sm6961555pfc.60.2021.07.19.11.30.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 11:30:51 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 0/6] Fix the debugfs splat from mock selftests
Date: Mon, 19 Jul 2021 13:30:41 -0500
Message-Id: <20210719183047.2624569-1-jason@jlekstrand.net>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Jason Ekstrand <jason@jlekstrand.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch series fixes a miscellaneous collection of bugs that all add up
to all our mock selftests throwing dmesg warnings in CI.  As can be seen
from "drm/i915: Always call i915_globals_exit() from i915_exit()", it's
especially fun since those warnings don't always show up in the selftests
but can show up in other random IGTs depending on test execution order.

Cc: Daniel Vetter <daniel.vetter@ffwll.ch>

Jason Ekstrand (6):
  drm/i915: Call i915_globals_exit() after i915_pmu_exit()
  drm/i915: Call i915_globals_exit() if pci_register_device() fails
  drm/i915: Always call i915_globals_exit() from i915_exit()
  drm/ttm: Force re-init if ttm_global_init() fails
  drm/ttm: Initialize debugfs from ttm_global_init()
  drm/i915: Make the kmem slab for i915_buddy_block a global

 drivers/gpu/drm/i915/i915_buddy.c   | 44 ++++++++++++++++++++++-------
 drivers/gpu/drm/i915/i915_buddy.h   |  3 +-
 drivers/gpu/drm/i915/i915_globals.c |  6 ++--
 drivers/gpu/drm/i915/i915_pci.c     | 33 +++++++++++++++++-----
 drivers/gpu/drm/ttm/ttm_device.c    | 14 +++++++++
 drivers/gpu/drm/ttm/ttm_module.c    |  4 ---
 6 files changed, 80 insertions(+), 24 deletions(-)

-- 
2.31.1

