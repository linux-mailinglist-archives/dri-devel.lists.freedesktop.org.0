Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C909CA7B894
	for <lists+dri-devel@lfdr.de>; Fri,  4 Apr 2025 10:09:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58B7510EAC9;
	Fri,  4 Apr 2025 08:09:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="O4jUMOi+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB13A10EB83
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Apr 2025 08:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1743754175;
 bh=vG2/aLoQH2NqodH0R3VU9kCoxT4tTk8CTpFdEHqKVLI=;
 h=From:To:Cc:Subject:Date:From;
 b=O4jUMOi+3kxtd4TjhFqfJaWR/1WxdX8Js7jMZJVmlCP3K0BShb8xdW79KYp7EYIKu
 yoNjMXMM9h9T99m30DhobUXnhTv92hRXnFLQvdV+hLB4fKM4wvy8ID1lMxXaeG1HPX
 335i9hqkVzhgoDxf0xS3VC8s5aKBUIu25bEY7My15Uz1RoPinioUG7rFr6HzBtiLlL
 j3OY90rAHC0ctKD0zeokKX92ek2KtA/O+nlLr58Xkv1y8UAmHlVkVUDoA7FSF3fzhR
 0iPwnKBIJ42cCtA2mUMtv73CYnmDyYxZOh3lbDRSYI1NlQxZRPQ69LI6CEK/mB18fe
 Y7XBG2XjSBmLA==
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 4411617E0865;
 Fri,  4 Apr 2025 10:09:35 +0200 (CEST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org,
	kernel@collabora.com
Subject: [PATCH v3 0/5] drm/panthor: Misc fixes
Date: Fri,  4 Apr 2025 10:09:28 +0200
Message-ID: <20250404080933.2912674-1-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.49.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

This is a collection of fixes for bugs found while working on adding
JM support to panthor. Those are not particularly tied to JM support
and are worth having regardless.

Note that the last two don't have Fixes tag because they fix issues
we can't really hit with the current implementation (no fault
handling, and no shared irq line).

Changelog available in each patch if you're interested.

Regards,

Boris

Boris Brezillon (5):
  drm/panthor: Fix GPU_COHERENCY_ACE[_LITE] definitions
  drm/panthor: Call panthor_gpu_coherency_init() after PM resume()
  drm/panthor: Update panthor_mmu::irq::mask when needed
  drm/panthor: Let IRQ handlers clear the interrupts themselves
  drm/panthor: Don't update MMU_INT_MASK in panthor_mmu_irq_handler()

 drivers/gpu/drm/panthor/panthor_device.c | 8 ++++----
 drivers/gpu/drm/panthor/panthor_device.h | 2 --
 drivers/gpu/drm/panthor/panthor_fw.c     | 2 ++
 drivers/gpu/drm/panthor/panthor_gpu.c    | 2 ++
 drivers/gpu/drm/panthor/panthor_mmu.c    | 9 ++++++++-
 drivers/gpu/drm/panthor/panthor_regs.h   | 4 ++--
 6 files changed, 18 insertions(+), 9 deletions(-)

-- 
2.49.0

