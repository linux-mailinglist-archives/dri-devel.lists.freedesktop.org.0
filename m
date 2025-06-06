Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D16ACFDF6
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jun 2025 10:09:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6668710E93C;
	Fri,  6 Jun 2025 08:09:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="SpgneS5p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A777110E96D
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jun 2025 08:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1749197374;
 bh=/MEBfAev8vovYhb1rnxE5pK6xRkkLqMbuJRYRW3dpv8=;
 h=From:To:Cc:Subject:Date:From;
 b=SpgneS5pMihwmtyA6a+NH7NjIHGjU9t0m8vL/PK8Lf26fe92FCdzhEbomoTHpRVIt
 +n2KIP/oKktrKhzO/nYweYgwr/OAGUNw/yo++pW+YAK7aQDT4EOT1aMCxQzJgDwAL6
 UgAR02TOfz1P0HuQoe3dhKt2ITL0crm/WpxnQa8w4zs3oDkB/5bG2HSTgFdNhjh8fH
 2QVrbP18yivsYdIvTY0rU4LiLwVtE5geNOuzBV6Cs/XQHVW3Qa1vFcDCjTSjcToLIc
 qstJUZ8+nrdm8twf2avj8efaO0xk+fDLU7pHZxtAg2god5+UqjOEEUwemv2XQSPgwR
 nr5eNJKbnWntQ==
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 9E43D17E00AC;
 Fri,  6 Jun 2025 10:09:34 +0200 (CEST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org,
	kernel@collabora.com
Subject: [PATCH v3 0/2] drm/panthor: Fix panthor+FEX-Emu
Date: Fri,  6 Jun 2025 10:09:30 +0200
Message-ID: <20250606080932.4140010-1-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.49.0
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

Hello,

This is an attempt a couple bugs exposed by FEX-Emu. The first one
is pretty trivial and should be uncontroversial, since it's just
a missing padding field in one of our uAPI structs. We are getting
away with it on arm32 because of the alignment rules provided by
the Arm ABI, but x86 has relaxed constraints for u64 fields, and
this bug is definitely hit when running a 32-bit x86 mesa binary
under FEX Emu.

The second fix is addressing a problem we have because FEX-Emu is
an aarch64 process executing 32-bit x86 code, meaning the check
we do on the is-32bit-task check we do to figure out the MMIO
offset seen by the user won't work. In order to fix that, we add
an ioctl to let the user explicitly set this offset. The offset
can only be set early on, if no MMIO range has been mapped before.

With those, and the mesa MR at [1], I managed to run a 32-bit x86
glmark2 through FEX without using the host mesa (if we were to use
the thunked mesa lib, both the kernel and mesa would use
MMIO_OFFSET_64BIT, and the problem doesn't exist anymore).

Regards,

Boris

Changes in v2:
- Simplify the logic in patch2 to have a lockless solution that's
  still safe for what we need

Changes in v3:
- Fix a comment

[1]https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/34573

Boris Brezillon (2):
  drm/panthor: Add missing explicit padding in drm_panthor_gpu_info
  drm/panthor: Fix the user MMIO offset logic for emulators

 drivers/gpu/drm/panthor/panthor_device.h | 18 ++++++++
 drivers/gpu/drm/panthor/panthor_drv.c    | 56 +++++++++++++++++-------
 include/uapi/drm/panthor_drm.h           | 41 +++++++++++++++++
 3 files changed, 99 insertions(+), 16 deletions(-)

-- 
2.49.0

