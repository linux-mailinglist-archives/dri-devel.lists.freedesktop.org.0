Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F06A1C56E80
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 11:40:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9A9310E34E;
	Thu, 13 Nov 2025 10:40:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="jXgVfk5g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C32E10E348
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 10:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1763030402;
 bh=vXPQXrIjpo2NMPPg3p64u2IjOYRE7s9RtGLr8K9wQU4=;
 h=From:To:Cc:Subject:Date:From;
 b=jXgVfk5gG8jJVSALp4l966wFXCpIy26GY6AgqBre6Q6IyXHtwSnS0FTWk2A/my74L
 8oI/CM6J1FUwUrgpt/z2fK0DrHOPJgyZRONCQjuaRGOKYYMe3eGIJCPI2IgsmYK//q
 3Mh2c+Ea4xEYrxpIE6ubAYvMD40Q95wj/lQJMJHe8dZIqxiKJ8srEC4Dv8uheZ04jW
 7SOj5utQEiYcVA0e23uze5KmmSRFbiXXAouQb4+iDrk+CCPkaxjFeVfkBpyrI4ODMD
 9CYsnUwycEVYMeMD64UtcreiVdtAJhqlmb4utqc0DBcGWc/DXe8Gqxp6EyaSH954U3
 0qSzRPKcmUtvg==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:a2a7:f53:ebb0:945e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 6633F17E0364;
 Thu, 13 Nov 2025 11:40:02 +0100 (CET)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, Akash Goel <akash.goel@arm.com>,
 Karunika Choo <karunika.choo@arm.com>, kernel@collabora.com
Subject: [PATCH v2 0/6] drm/panthor: Misc fixes
Date: Thu, 13 Nov 2025 11:39:47 +0100
Message-ID: <20251113103953.1519935-1-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.51.1
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

This is a set of fixes for bugs I ran into while looking at [1].
Hopefully that's enough to recover from AS_ACTIVE bit stuck
situations, but it'd be good to understand why the MMU block is
completely blocked in some cases and try to come up with better
mitigations than a full GPU reset.

Check each patch for a detailed changelog.

Regards,

Boris

Boris Brezillon (6):
  drm/panthor: Always wait after sending a command to an AS
  drm/panthor: Kill lock_region()
  drm/panthor: Recover from panthor_gpu_flush_caches() failures
  drm/panthor: Add support for atomic page table updates
  drm/panthor: Make panthor_vm_[un]map_pages() more robust
  drm/panthor: Relax a check in panthor_sched_pre_reset()

 drivers/gpu/drm/panthor/panthor_gpu.c   |  19 +-
 drivers/gpu/drm/panthor/panthor_mmu.c   | 277 +++++++++++++-----------
 drivers/gpu/drm/panthor/panthor_sched.c |   2 -
 3 files changed, 164 insertions(+), 134 deletions(-)

-- 
2.51.1

