Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C23793CB889
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jul 2021 16:14:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 015006E99D;
	Fri, 16 Jul 2021 14:14:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86DB66E99D
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jul 2021 14:14:29 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 59-20020a9d0ac10000b0290462f0ab0800so9975026otq.11
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jul 2021 07:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Oim7jPrTVkM2pDEEkqpUZTCntMS1B3Z5p458DzstJgQ=;
 b=xE/bJXQcnpsya7VSVPy1JltYVko++gFnbQLjMEdnzeOrPxtnjhWUpLOYR3qxq8S/T0
 evHab9hZFVzcWh8BtOiuMDbfdnj5Ieev1qIMEeKpdXYKIlqi2niSt9fhibwa0q3RYH2a
 UJwErp5mhRquduhyZGiN/6QMxgkk0CvK3rn/jHvFfRtAeVloNE+Fl1T/Tk0BFYJua9tS
 LCgVYbVXSMfKY+l9pN1iGOedXCnm3KolTZ13mOs4Ysv/B+jejroVkdMzhjojGDRLoIJE
 hGQo/zm5jZbnCOQFKIT3cW0SSMNVz+QbZIL3zS+VyGpLpmp0W2c/KQX7hL3S7xxAOava
 8qGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Oim7jPrTVkM2pDEEkqpUZTCntMS1B3Z5p458DzstJgQ=;
 b=g7i24ebGQPEK+XkCmHde4W+xnkwa6tji4s0fQT4sScxfYmee5DWWCtWmV54zVT5nsy
 3yetU3fuSNYq/T9/D3q1HDd08XwE78YPYm8f1if40HSZCG1jsO+MG8YlVvYLF1bEWoIm
 yYtTEmYc5QaO+gCnufsn3nF7C+U1klXvqK33tRZIoJr2/Yzz606y5U8oEOsu1XjgaWVG
 bP8ztsfPupQoRy3KagFPaWdNHawjBn4AcgHizNOF2fAIv4Z4axZrOEM7sZ7uX5lPm6G/
 OKk0ztQ2NEOLSxcWw1EXqCY6hH7iqDoLNI6ae14eI+k0Hf8KCJCGtQHY0l1VwCu8hUcy
 Ud1g==
X-Gm-Message-State: AOAM533aIukaHgqlQ/VDdKOxil+pPO/NDhlrIaOgzUi/WUKKDCeOJZcj
 y42kxsAWuAzaLN2gcbA8L7UfOQ==
X-Google-Smtp-Source: ABdhPJx/qotWSX56earD3luVu3JbTu3DfHWojqG3m+weY5JezEx+D/EGo012BQuwLdrX8miD90DPOw==
X-Received: by 2002:a9d:190e:: with SMTP id j14mr8246767ota.48.1626444868759; 
 Fri, 16 Jul 2021 07:14:28 -0700 (PDT)
Received: from omlet.lan ([68.203.99.148])
 by smtp.gmail.com with ESMTPSA id v42sm1852266ott.70.2021.07.16.07.14.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jul 2021 07:14:28 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 0/7] drm/i915: Migrate memory to SMEM when imported
 cross-device (v7)
Date: Fri, 16 Jul 2021 09:14:19 -0500
Message-Id: <20210716141426.1904528-1-jason@jlekstrand.net>
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

This patch series fixes an issue with discrete graphics on Intel where we
allowed dma-buf import while leaving the object in local memory.  This
breaks down pretty badly if the import happened on a different physical
device.

v7:
 - Drop "drm/i915/gem/ttm: Place new BOs in the requested region"
 - Add a new "drm/i915/gem: Call i915_gem_flush_free_objects() in i915_gem_dumb_create()"
 - Misc. review feedback from Matthew Auld

Jason Ekstrand (5):
  drm/i915/gem: Check object_can_migrate from object_migrate
  drm/i915/gem: Refactor placement setup for i915_gem_object_create*
    (v2)
  drm/i915/gem: Call i915_gem_flush_free_objects() in
    i915_gem_dumb_create()
  drm/i915/gem: Unify user object creation (v2)
  drm/i915/gem/ttm: Respect the objection region in placement_from_obj

Thomas Hellström (2):
  drm/i915/gem: Correct the locking and pin pattern for dma-buf (v6)
  drm/i915/gem: Migrate to system at dma-buf attach time (v6)

 drivers/gpu/drm/i915/gem/i915_gem_create.c    | 165 ++++++++--------
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c    |  64 ++++--
 drivers/gpu/drm/i915/gem/i915_gem_object.c    |  13 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.h    |   4 +
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c       |   3 +-
 .../drm/i915/gem/selftests/i915_gem_dmabuf.c  | 184 +++++++++++++++++-
 .../drm/i915/gem/selftests/i915_gem_migrate.c |  15 --
 7 files changed, 318 insertions(+), 130 deletions(-)

-- 
2.31.1

