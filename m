Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 274199F936B
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 14:42:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D4EC10E167;
	Fri, 20 Dec 2024 13:42:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="p1YnKXxj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE86A10E167
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 13:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jUuyHyrqddnZKmocdYUAZOz8iGF+Yo4lvJtDeFJvnsY=; b=p1YnKXxjYM0accHlZUfRkB3WzG
 4IKJLqH7OyThVm+6p/0EzrWG1/hnXGCaOCDGl1RN4TLUZEF22ZRq10aF/juKyiS+kW3EZccTR2dvi
 1zBQgrLymWgAex72T5SXgEEQ02k+I8qCl8ZYJhP63cr0EhSQWyqPDdq2i3TBV/SGOhA7msOTO0f2C
 gmo/8h+axga5hiZNdzAI/d5PfpkAyMwGz5KQLMKd5sZUDKkh/XBpCWs+rY3oNKYu4+PKhnk3EKWsx
 d32oBqqlJZCxRtwImZyy9nl6JeaGOLM3D0tlQTWPA745a/+3iEoW9zx7rr6VEljCXQePNEBbPJnGT
 NZTrryGQ==;
Received: from [187.36.213.55] (helo=morissey..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tOdGq-005n05-28; Fri, 20 Dec 2024 14:42:24 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Maxime Ripard <mripard@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Tvrtko Ursulin <tursulin@igalia.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
Subject: [PATCH v3 0/3] drm/vc4: Clean-up BO seqnos
Date: Fri, 20 Dec 2024 10:37:06 -0300
Message-ID: <20241220134204.634577-1-mcanal@igalia.com>
X-Mailer: git-send-email 2.47.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series introduces a series of clean-ups for BO reservations in
the VC4 driver. Currently, VC4 uses shared fences to track BO
reservations, similar to many other DRM devices. However, in addition
to DMA reservation objects, VC4 has been maintaining a separate seqno
tracking system for BOs to track job completion.

The seqno tracking system was implemented before DMA reservation
objects and was left in the code after DMA reservation's introduction.
This approach is now redundant, as job completion can be effectively
tracked using fences. Consequently, this series focuses on eliminating
seqnos from the BO implementation.

Patch Breakdown
===============

* Patch #1: Uses the DRM Exec to replace the open-coded implementation
of the functions `drm_gem_lock_reservations()` and
`drm_gem_unlock_reservations()` in the VC4 driver code. A straightforward
change with no functional changes.

* Patch #2: Implements the VC4 wait BO IOCTL using DMA Resv Objects.
The new implementation closely mirrors the V3D approach and removes
the IOCTL's dependency on BO sequence numbers.

* Patch #3: The central piece of this patchset. It removes `bo->seqno`,
`bo->write_seqno`, and `exec->bin_dep_seqno` from the driver. As the
seqno tracking system is redundant, its deletion is relatively
straightforward. The only notable change is `vc4_async_set_fence_cb()`,
which now uses `dma_fence_add_callback()` to add the VC4 callback.

Changes
=======

v1 -> v2: https://lore.kernel.org/dri-devel/20241206131706.203324-1-mcanal@igalia.com/T/

* [1/4] Use DRM Exec to replace the (un)lock reservation functions
        (Christian König)

v2 -> v3: https://lore.kernel.org/dri-devel/20241212202337.381614-1-mcanal@igalia.com/T/

* [1/4] König's A-b (Christian König)
* [2/4] s/dma_gem_dma_resv_wait/drm_gem_dma_resv_wait (Melissa Wen)
* [2/4] Use `usecs_to_jiffies()` to calculate the timeout in jiffies
        (Tvrtko Ursulin)
* [2/4] Remove -EAGAIN errno from the IOCTL (Tvrtko Ursulin)
* [3/4] s/vc4_async_page_flip_seqno_complete/vc4_async_page_flip_complete_with_cleanup
        (Melissa Wen)
* [3/4] Add `dma_fence_put()` in `vc4_async_page_flip_complete_with_cleanup()`
* [3/4] Maxime's R-b (Maxime Ripard)
* [4/4] Squashed to PATCH 3/4 (Melissa Wen)
* [4/4] Remove `vc4->seqno_cb_list` and `struct vc4_seqno_cb` (Tvrtko Ursulin)

Best Regards,
- Maíra

---

Maíra Canal (3):
  drm/vc4: Use DRM Execution Contexts
  drm/vc4: Use DMA Resv to implement VC4 wait BO IOCTL
  drm/vc4: Remove BOs seqnos

 drivers/gpu/drm/vc4/Kconfig        |   1 +
 drivers/gpu/drm/vc4/vc4_crtc.c     |  33 +++---
 drivers/gpu/drm/vc4/vc4_drv.h      |  27 -----
 drivers/gpu/drm/vc4/vc4_gem.c      | 183 ++++++-----------------------
 drivers/gpu/drm/vc4/vc4_validate.c |  11 --
 5 files changed, 53 insertions(+), 202 deletions(-)

-- 
2.47.1

