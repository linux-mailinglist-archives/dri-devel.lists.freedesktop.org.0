Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 400163D3E70
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 19:21:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46A2D6F415;
	Fri, 23 Jul 2021 17:21:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E6296F415
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 17:21:46 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 a4-20020a17090aa504b0290176a0d2b67aso1430013pjq.2
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 10:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8/v8CdglWrt6v9ASQleiVlFYsqJirNYOdm0j1r50y5o=;
 b=Ugw7xGFYfPEw0IRclD4WO7V8j/hnEgvfh+vuO5XhoPkyKvSGDN9U/rFwt086FVN5s4
 EW01+EvZu59SCZ5lhD7DerKBHnrojhR3dKWsNvC9JSogBXtD+slATvQKi2k1EWZEWE2C
 3OvDzl5TPXMBufSQTXxPbYioEtLoBaskUaz4kAWIuehxnIZvCp4IE1X/81DOaF6pEBHf
 ybKlbYHRtViWtoa2zfCR9T9YoecwcxVZKXWAwnMeSqBI6L1f9OXK9o9rw3qbDrz0tyRI
 NSM0+uHPWi/n8iJw15Cf+8CgXpSN8qIPKTn2+mD0LuITGvfynbanMoNyX8ceVEM5YZxT
 QbvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8/v8CdglWrt6v9ASQleiVlFYsqJirNYOdm0j1r50y5o=;
 b=uoR9KvqFb98N2dqLi6wBH61ZOgOFiT8UJOGf6+pSWllUFSouD/M2cdmQDuqVYihk7C
 TzPr0wt9bTd+X4+xJhz7aSDvu7uQtPkUckGZB1Qk/QWlMSZtIWA6YwJrNakDelyiFec/
 gOI/5tSq2Tq9mrsHyLBgb+WmGN+y6hOw3a7PbxfR41SZB6jWb9DNKS2MQLIkmZAhxu/F
 T+esGtNB6To8y4G12Y/LZ8DVjfx97yL9wcOzmJRRGN8mVi4ckWGVtSHAWZGW4sQHVwmj
 OvYc0EKjzjbySqWqAAGeSoUigH5MZTJIcI4ZD+tluW6KbZ/8rhdYBzwGMPYHM87SKpN/
 0TNA==
X-Gm-Message-State: AOAM531cEWv9yVSoYxL9ENRQMlQjDYzlai6gn7KNYLpYASyNovvWM7IA
 HoI+KrGa0iG58oZaVjrKf5G1zA==
X-Google-Smtp-Source: ABdhPJxotkdALrFhEzQAPeeJamAQOkTxvoN/FO0eYvgxddk3Prij1WgdvgRHqDNZpcgbYz8SfN34tg==
X-Received: by 2002:a62:c501:0:b029:32a:dfe9:8648 with SMTP id
 j1-20020a62c5010000b029032adfe98648mr5698070pfg.28.1627060906021; 
 Fri, 23 Jul 2021 10:21:46 -0700 (PDT)
Received: from omlet.lan ([134.134.137.86])
 by smtp.gmail.com with ESMTPSA id s36sm24288648pgl.8.2021.07.23.10.21.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 10:21:45 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 0/8] drm/i915: Migrate memory to SMEM when imported
 cross-device (v8)
Date: Fri, 23 Jul 2021 12:21:34 -0500
Message-Id: <20210723172142.3273510-1-jason@jlekstrand.net>
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
v9:
 - Replace the i915/ttm patch with two that are hopefully more correct

Jason Ekstrand (6):
  drm/i915/gem: Check object_can_migrate from object_migrate
  drm/i915/gem: Refactor placement setup for i915_gem_object_create*
    (v2)
  drm/i915/gem: Call i915_gem_flush_free_objects() in
    i915_gem_dumb_create()
  drm/i915/gem: Unify user object creation (v3)
  drm/i915/gem/ttm: Only call __i915_gem_object_set_pages if needed
  drm/i915/gem: Always call obj->ops->migrate unless can_migrate fails

Thomas Hellström (2):
  drm/i915/gem: Correct the locking and pin pattern for dma-buf (v8)
  drm/i915/gem: Migrate to system at dma-buf attach time (v7)

 drivers/gpu/drm/i915/gem/i915_gem_create.c    | 177 ++++++++--------
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c    |  58 ++++--
 drivers/gpu/drm/i915/gem/i915_gem_object.c    |  20 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.h    |   4 +
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c       |  13 +-
 .../drm/i915/gem/selftests/i915_gem_dmabuf.c  | 190 +++++++++++++++++-
 .../drm/i915/gem/selftests/i915_gem_migrate.c |  15 --
 7 files changed, 341 insertions(+), 136 deletions(-)

-- 
2.31.1

