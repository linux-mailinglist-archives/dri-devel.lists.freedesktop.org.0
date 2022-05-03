Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ACF9518CFB
	for <lists+dri-devel@lfdr.de>; Tue,  3 May 2022 21:13:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E96DE10E7CC;
	Tue,  3 May 2022 19:13:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30B7610E187;
 Tue,  3 May 2022 19:13:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: bbeckett) with ESMTPSA id 7F46E1F445A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651605220;
 bh=+gBdRtvLQdGVcoXaWTnmpgxw7h/r83P/zCjCku+IvYo=;
 h=From:To:Cc:Subject:Date:From;
 b=GGwEI3IbfciDKGZJND124UDmL5bV3M7qC+LhAk+StGU8OFzQfeeJ26FqyianGj+P1
 zTtD5h9xLQJvojy2Q7/M5RtbbPE+omyqielXEDH+5cCDePeWLNjiYUbe+xB/V0hhFf
 OmLQLE9ZsNt+raKQqZWaNKmD7DWYUAj9QmFj+YLlKl+Ylv1ye7Dnjtgn6NFJcGVthI
 hafdi+ygvEIaJ9DMNB0oEnPQyxy9HU1YwYV1dSb5eZm7LOfjoWK4IXDmy1dBo5dezi
 MLoBlgsaiSvAE4y50kbOhyNSNb7+IKpFFzbqefDBltNrrl2WuYbU9VJusUeiWXBHyP
 Gv3zQtcAIK8TQ==
From: Robert Beckett <bob.beckett@collabora.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 0/4] ttm for internal
Date: Tue,  3 May 2022 19:13:12 +0000
Message-Id: <20220503191316.1145124-1-bob.beckett@collabora.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Robert Beckett <bob.beckett@collabora.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series refactors i915's internal buffer backend to use ttm.
It uses ttm's pool allocator to allocate volatile pages in place of the
old code which rolled its own via alloc_pages.
This is continuing progress to align all backends on using ttm.

Robert Beckett (4):
  drm/i915: add gen6 ppgtt dummy creation function
  drm/i915: setup ggtt scratch page after memory regions
  drm/i915: allow volatile buffers to use ttm pool allocator
  drm/i915: internal buffers use ttm backend

 drivers/gpu/drm/i915/gem/i915_gem_internal.c | 264 ++++++++-----------
 drivers/gpu/drm/i915/gem/i915_gem_internal.h |   5 -
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c      |  15 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.h      |  12 +-
 drivers/gpu/drm/i915/gt/gen6_ppgtt.c         |  43 ++-
 drivers/gpu/drm/i915/gt/intel_gt_gmch.c      |  20 +-
 drivers/gpu/drm/i915/gt/intel_gt_gmch.h      |   6 +
 drivers/gpu/drm/i915/i915_driver.c           |  16 +-
 8 files changed, 201 insertions(+), 180 deletions(-)

-- 
2.25.1

