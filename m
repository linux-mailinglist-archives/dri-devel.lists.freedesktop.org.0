Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 007639EFD5B
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 21:24:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2F3610E090;
	Thu, 12 Dec 2024 20:24:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="hYWGHMJY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C57210E090
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 20:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iua+OXH6xm75zlW6cmhBHtjMHpCS3XK8J4E1D/NNAqo=; b=hYWGHMJYlHgA7zRy0C8kyXgrrg
 PX+O81qh0EEJ+AVuUcyxlfDzjDCxvZ9Oalfk3OcUXdSMbdq+B7B4hwHyOU5L3CPeh21jiHoYH2V1b
 AQkWO5jMatTxgA1Bu1Ixob1To5yLYMFF00MWuu8gGUTHcroaO5ovba77ZAwUDU8HqkE8QwesDYmc+
 f4VFrLHACzF1w3LXSzVmOIxoXmmM8+cJfKPtZzr/KDUlX+QbHuvit4Fx4PUMVsCW3/4hV7lpT0Ujf
 Prjm9H1bUMuVDzoILMOlM0jHbShZsw1LfIcTX7h3YGPqsZS+0hhILoKYgDXS/yNxqkAcEQVOhthqq
 NqrgXBaw==;
Received: from [187.36.213.55] (helo=morissey..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tLpj1-002O7j-0x; Thu, 12 Dec 2024 21:23:55 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Maxime Ripard <mripard@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Tvrtko Ursulin <tursulin@igalia.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
Subject: [PATCH v2 0/4] drm/vc4: Clean-up the BO seqnos
Date: Thu, 12 Dec 2024 17:20:51 -0300
Message-ID: <20241212202337.381614-1-mcanal@igalia.com>
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

* Patch #2: Implements the VC4 wait BO IOCTL using DMA reservations.
The new implementation closely mirrors the V3D approach and removes
the IOCTL's dependency on BO sequence numbers.

* Patch #3: The central piece of this patchset. It removes `bo->seqno`,
`bo->write_seqno`, and `exec->bin_dep_seqno` from the driver. As the
seqno tracking system is redundant, its deletion is relatively
straightforward. The only notable change is `vc4_async_set_fence_cb()`,
which now uses `dma_fence_add_callback()` to add the VC4 callback.

* Patch #4: Deletes the now-unused function `vc4_queue_seqno_cb()`.

Changes
=======

v1 -> v2: https://lore.kernel.org/dri-devel/20241206131706.203324-1-mcanal@igalia.com/T/

* [1/4]: Use DRM Exec to replace the (un)lock reservation functions (Christian König)

Best Regards,
- Maíra

Maíra Canal (4):
  drm/vc4: Use DRM Execution Contexts
  drm/vc4: Use DMA Resv to implement VC4 wait BO IOCTL
  drm/vc4: Remove BOs seqnos
  drm/vc4: Remove `vc4_queue_seqno_cb()`

 drivers/gpu/drm/vc4/Kconfig        |   1 +
 drivers/gpu/drm/vc4/vc4_crtc.c     |  22 ++--
 drivers/gpu/drm/vc4/vc4_drv.h      |  26 ++---
 drivers/gpu/drm/vc4/vc4_gem.c      | 180 +++++++----------------------
 drivers/gpu/drm/vc4/vc4_validate.c |  11 --
 5 files changed, 64 insertions(+), 176 deletions(-)

-- 
2.47.1

