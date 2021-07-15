Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 600173CAF3D
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jul 2021 00:39:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28C8489E2A;
	Thu, 15 Jul 2021 22:39:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 345F489362
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jul 2021 22:39:08 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id d12so7023056pfj.2
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jul 2021 15:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=G1Lpom/liCFd7FkPda8eG+Ob59hWafgxm9MVZyipJKo=;
 b=0hy8UNQn6b8g3IZrpVAd8Q9Obk69uJrHeqzA3FUwOB0ty1FC0JRHimil0TRxjH1lK8
 D7txpJzPQx9dM/dSQCBqF12E6+OtyH2mBquV+lmrjoW7lTeg19saD47m3Nfaq+gI5ka7
 nY/Y7DrZCBjvxD6BaJft5F76PAD90IO2PL+mpA8sDAZvWfswD1WXfGdj0VlFZmPJBC5X
 Cvw0IUxZoD4F0DKF6dmVEKbwid3HdOeJKI6MaSx1BWe9gHdI2FFg9GjZVgJoKj3Zl1Li
 eNYOIJ9HKiLgf+VNcIK+mcmJLhKVlBR2DaGHxj3mFivXSy3tvv73kApxawJ7kch2iMis
 4ndg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=G1Lpom/liCFd7FkPda8eG+Ob59hWafgxm9MVZyipJKo=;
 b=i4SwykPc/gQt8UTquzknsjHVp+Mfa/M/QRDLCYLHtsKT1YhRPL3hVUjvAYq24BGD0r
 y+0nuNyXvXMpTRKNBs+N861b6hjP6PtFGEWcqypHlaaXPV1yWp9Unv60KFqnv2aixsJL
 rs4zpIuKV3BvC50uYEP25ftlRoxmNwOrGJVqbDy68LzsqPOlEnRGm/Q6gUNCseF/Z1ku
 ZUAtzjYQAOMqQg6/yZsQWOekf2lK3zWtnZN048Q7QELJsobogZ6uQj7no34DgUY+znMD
 Y/W63MQuNQtIvMRI5+dabif3UmEVpKT2AYwbHeHbsbKwbopVR4OlrLxH+JIEAQcjiulG
 v3Cw==
X-Gm-Message-State: AOAM532sLsxmQWNk4c3SiD8L/HyX2q9kazBu7TPt50ul/8YovK0MGmdy
 skj72RaS6Lxd8bTs/mjthVnwNg==
X-Google-Smtp-Source: ABdhPJzDILL7sndS34R3iOTTaSbyM8hR+PBuVhZinzcqPzSNlp9xv8k+9pOlFG5FKA+2DCiEfRiexQ==
X-Received: by 2002:a05:6a00:84d:b029:329:a067:b1bf with SMTP id
 q13-20020a056a00084db0290329a067b1bfmr6883158pfk.47.1626388747488; 
 Thu, 15 Jul 2021 15:39:07 -0700 (PDT)
Received: from omlet.com ([134.134.137.87])
 by smtp.gmail.com with ESMTPSA id ft7sm9959459pjb.32.2021.07.15.15.39.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jul 2021 15:39:06 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 0/7] drm/i915: Migrate memory to SMEM when imported
 cross-device
Date: Thu, 15 Jul 2021 17:38:53 -0500
Message-Id: <20210715223900.1840576-1-jason@jlekstrand.net>
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

Jason Ekstrand (5):
  drm/i915/gem: Check object_can_migrate from object_migrate
  drm/i915/gem: Refactor placement setup for i915_gem_object_create*
  drm/i915/gem: Unify user object creation
  drm/i915/gem/ttm: Place new BOs in the requested region
  drm/i915/gem/ttm: Respect the objection region in placement_from_obj

Thomas Hellström (2):
  drm/i915/gem: Correct the locking and pin pattern for dma-buf (v6)
  drm/i915/gem: Migrate to system at dma-buf attach time (v6)

 drivers/gpu/drm/i915/gem/i915_gem_create.c    | 159 ++++++++-------
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c    |  64 ++++--
 drivers/gpu/drm/i915/gem/i915_gem_object.c    |  13 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.h    |   4 +
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c       |  11 +-
 .../drm/i915/gem/selftests/i915_gem_dmabuf.c  | 184 +++++++++++++++++-
 .../drm/i915/gem/selftests/i915_gem_migrate.c |  15 --
 7 files changed, 324 insertions(+), 126 deletions(-)

-- 
2.31.1

