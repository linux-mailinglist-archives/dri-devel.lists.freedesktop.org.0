Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D47925477
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 09:16:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7C4210E739;
	Wed,  3 Jul 2024 07:16:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="e0bAWyIN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4739210E740
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2024 07:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1719991002;
 bh=pSTBL0K8Q7cpJIxl8f3tLcgrolPj1/GHa8X8Nkv+3gI=;
 h=From:To:Cc:Subject:Date:From;
 b=e0bAWyINAK2OijVih/JPkDK+CylJu1uG65DXDogYwdaQ9zi/x1lTIpY21TVqAKab+
 D9KxgsS5sbrUiWnrFLhfC3fyCWhBkoJ5GeY3Hd46o5TfN1aS70CmB0gYLcwQMfA6yb
 sQi6U7keXMhqIkCVSNsqKzdC+sWvubnV0JtFQlclvXfpJJcpHX2e4l0gmGUVUv9XZ4
 Hy33JIi+/enTuPxzhKnDxDPDDVQu6u/q4sN1njhOIhdW+owl4KKOWCiqSIKO3/9/MK
 ZvC18KglpZdehWreomTsobDUKQG8T3R0kV5tV/E735PmhASODQjGUmUWB/2QwFe0qu
 2u8pB406HTZQQ==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 72FFC378219C;
 Wed,  3 Jul 2024 07:16:42 +0000 (UTC)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org,
	kernel@collabora.com
Subject: [PATCH v2 0/2] drm/panthor: Fix support for sync-only jobs
Date: Wed,  3 Jul 2024 09:16:38 +0200
Message-ID: <20240703071640.231278-1-boris.brezillon@collabora.com>
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

v2:
- Fix a UAF bug in the second patch

Boris Brezillon (2):
  drm/panthor: Don't check the array stride on empty uobj arrays
  drm/panthor: Fix sync-only jobs

 drivers/gpu/drm/panthor/panthor_drv.c   |  6 ++--
 drivers/gpu/drm/panthor/panthor_sched.c | 44 ++++++++++++++++++-------
 include/uapi/drm/panthor_drm.h          |  5 +++
 3 files changed, 41 insertions(+), 14 deletions(-)

-- 
2.45.0

