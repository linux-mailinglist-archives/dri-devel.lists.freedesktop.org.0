Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF373D17AB
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 22:13:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC2F16E878;
	Wed, 21 Jul 2021 20:13:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB99A6E169
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 20:13:49 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id h1so1679718plf.6
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 13:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gcfgktxwhi2gPaW3PDmABicLcLcpYa8hHzB10quc6oc=;
 b=tKy5/iXouGwrFGF90VcOOgKMisKvE7XWsDlwiGkyXDWO/mIvMMaMgSJukSrkgg3OPK
 rl9z4i+etzaiJHr0h95df6ozB5gHfMHsscfHJLK42DKxgDHdBLnF8YvywAKxE61FhJS+
 e+mgzP2f39DfBfndorbwB2IG0OsfGjwfKM4gUdXs7yY1fJLOnKsKWiKE4giZIA0UCWda
 jh7Ji3XQjOiuxgSjJ99LNh33WpbfEJHlkMA3ExTqFDlT06zUDBMf4WYDV6MCDFbTjtPF
 2zz1LDnltn7Jt+FAVNzpz7smz6nGnYjl0HKecrZs/0VBiSdm6IllJldb1lGyzSo5r2Jw
 Ueuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gcfgktxwhi2gPaW3PDmABicLcLcpYa8hHzB10quc6oc=;
 b=mTvvZCVKS9JKPWt3l3P7YjA0S2WpBanxBvEAs3DPh6VpDGTZwl43vDtd44lwqDJpp9
 wA61HGfQPvljM6zLxlgwm6Ncu5SkhGr35YTRUkqcnEoQlO+KhAwTcOY7wMYpVoWed/4o
 RGw2nilktz63JAvtHwVxah2hz6jELZeWYSfUGeHOosOG3xeiMZfsDEPXsUzwu+aa8ZDE
 1fAtUjt6qFKSLG+QqsUtiCK0x1C93CtV7+5bKBUkORKOZANHO/LmeQdoWtJU6Ft6rxtJ
 sUw8+tp3ujYgLiAqv0kMkk26FuZeclajLEcOQi/TcxX2OBg72UWUjuv/H9bfVXccNsjS
 2FCw==
X-Gm-Message-State: AOAM533FAku5YGnJC9HccXhz9lY6OoKhqewfdR+WPaAMlAYB3KoiJpXr
 GhOu4sYJjG+QZGqman7qYLEw9Q==
X-Google-Smtp-Source: ABdhPJxp4btwqWXuywGw24iuxSRhjzPVOmBDW5KpL5aBWZsLAQoJUoAcRXhRop1OxGMQOVl3Pfunsw==
X-Received: by 2002:a63:f712:: with SMTP id x18mr37678449pgh.389.1626898429337; 
 Wed, 21 Jul 2021 13:13:49 -0700 (PDT)
Received: from omlet.com ([134.134.137.82])
 by smtp.gmail.com with ESMTPSA id h24sm28777439pfn.180.2021.07.21.13.13.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 13:13:48 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 0/7] drm/i915: Migrate memory to SMEM when imported
 cross-device (v8)
Date: Wed, 21 Jul 2021 15:13:36 -0500
Message-Id: <20210721201343.2962674-1-jason@jlekstrand.net>
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
v8:
 - Misc. review feedback from Matthew Auld

Jason Ekstrand (5):
  drm/i915/gem: Check object_can_migrate from object_migrate
  drm/i915/gem: Refactor placement setup for i915_gem_object_create*
    (v2)
  drm/i915/gem: Call i915_gem_flush_free_objects() in
    i915_gem_dumb_create()
  drm/i915/gem: Unify user object creation (v3)
  drm/i915/gem/ttm: Respect the objection region in placement_from_obj

Thomas Hellström (2):
  drm/i915/gem: Correct the locking and pin pattern for dma-buf (v8)
  drm/i915/gem: Migrate to system at dma-buf attach time (v7)

 drivers/gpu/drm/i915/gem/i915_gem_create.c    | 177 ++++++++--------
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c    |  58 ++++--
 drivers/gpu/drm/i915/gem/i915_gem_object.c    |  13 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.h    |   4 +
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c       |   3 +-
 .../drm/i915/gem/selftests/i915_gem_dmabuf.c  | 190 +++++++++++++++++-
 .../drm/i915/gem/selftests/i915_gem_migrate.c |  15 --
 7 files changed, 330 insertions(+), 130 deletions(-)

-- 
2.31.1

