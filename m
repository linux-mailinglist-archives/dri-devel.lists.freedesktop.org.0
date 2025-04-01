Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E837A775C1
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 09:57:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E57310E507;
	Tue,  1 Apr 2025 07:57:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="DuUpeq+K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E42410E03E
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Apr 2025 07:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1743494234;
 bh=/cPp2FOZempdD1jZLPyNYNzLMxH3a4f39Y/s9EMo9lo=;
 h=From:To:Cc:Subject:Date:From;
 b=DuUpeq+KoUEgy2OM4lsFo+cvoy/c3cm1jpRpk3ChrRx+ZkxSDcF5Nhe37ubze/F08
 2iNuZhZvopb7Hs1SeFNv636VftAYeIjguk9aYe3IDKM8qcqR2NYYmyLFSI+7d5gyYx
 dEGNVqa7ryVuYvw+Gynq3mNh+YhomepMoWJA8k9e8EN+Htg0p7W2tx/PSpz9To5hNq
 W/RJPcUKWqzmqNiyXyIQfopHrOKeWAIqkSv2BJYVKcbcUo0sRhWrtKRNa1ZANEs5J5
 rl5XoX2MPyGYsLBC1iTKG2DF8Y5uEnH8dRUvDJHWvKSMBy5ec9exW2IojhFJwul/S9
 P8MMkkQFKVssA==
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 23A4117E0860;
 Tue,  1 Apr 2025 09:57:14 +0200 (CEST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org,
	kernel@collabora.com
Subject: [PATCH 0/3] drm/panthor: Misc fixes
Date: Tue,  1 Apr 2025 09:57:07 +0200
Message-ID: <20250401075710.2638950-1-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.48.1
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

Note that the last one doesn't have a Fixes tag because all MMU faults
are considered fatal right now, so unblocking the writer/reader early
on a fault will just make it crash, which is eventually want would
happen anyway.

Regards,

Boris

Boris Brezillon (3):
  drm/panthor: Call panthor_gpu_coherency_init() after PM resume()
  drm/panthor: Update panthor_mmu::irq::mask when needed
  drm/panthor: Let IRQ handlers clear the interrupts themselves

 drivers/gpu/drm/panthor/panthor_device.c | 8 ++++----
 drivers/gpu/drm/panthor/panthor_device.h | 2 --
 drivers/gpu/drm/panthor/panthor_fw.c     | 2 ++
 drivers/gpu/drm/panthor/panthor_gpu.c    | 2 ++
 drivers/gpu/drm/panthor/panthor_mmu.c    | 3 +++
 5 files changed, 11 insertions(+), 6 deletions(-)

-- 
2.48.1

