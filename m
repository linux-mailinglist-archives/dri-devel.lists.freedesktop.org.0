Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4A791C1D0
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 16:55:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 289C010E2FD;
	Fri, 28 Jun 2024 14:55:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="KtNdcKH9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D100310E271
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 14:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1719586538;
 bh=heDRFv45aM3a+Kw+TbpT21NKlZS21J5XX9UA2DowyuU=;
 h=From:To:Cc:Subject:Date:From;
 b=KtNdcKH9zOWxkkGroZoeza6mQMq6JBvPB8vfD5LT+fWGdP3sDKk1Q+8Q9OOvOs1dz
 2n/Xg3y091WpQ7FIu5a/nxxpo3IxsvP9eNG5TM4bQq5Z5ybRPSHl6P9bPa6GflK7s5
 9Pq6bGwdoyfFUNnInBHFxw7s6+1a+E1j2eROdlZo06Hm3Ab14Q9mM1VXR4EQ55PpN4
 vTNR/i3Ey67OenL78dkAdplP620aCvLDLfiTv9OAbTL5X1tV0W0u+yMCao8gSDr7g6
 mf/5Pc5VSHwDn4MDWChlBAV9DH9Aoqe1qFl8nSccw0U67gVLvWSFGGl6FHMHPQzth9
 G+vyRiilXmxfA==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id BD43437803EE;
 Fri, 28 Jun 2024 14:55:37 +0000 (UTC)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org,
	kernel@collabora.com
Subject: [PATCH 0/2] drm/panthor: Fix support for sync-only jobs
Date: Fri, 28 Jun 2024 16:55:34 +0200
Message-ID: <20240628145536.778349-1-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.45.0
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

Here are two relatively trivial fixes for bugs found while woking
on the Vulkan implementation, where NULL CS are needed to implement
VkQueue synchronization.

Regards,

Boris

Boris Brezillon (2):
  drm/panthor: Don't check the array stride on empty uobj arrays
  drm/panthor: Fix sync-only jobs

 drivers/gpu/drm/panthor/panthor_drv.c   |  6 ++--
 drivers/gpu/drm/panthor/panthor_sched.c | 41 ++++++++++++++++++++-----
 include/uapi/drm/panthor_drm.h          |  5 +++
 3 files changed, 41 insertions(+), 11 deletions(-)

-- 
2.45.0

