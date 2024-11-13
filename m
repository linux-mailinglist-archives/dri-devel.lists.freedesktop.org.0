Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A8F99C7784
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2024 16:43:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E26610E14A;
	Wed, 13 Nov 2024 15:43:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="A6C2w/0/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D61210E14A
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2024 15:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1731512582;
 bh=5MMoDiswPCTnzlU0R/Pe8MLAZlST6t7H/CPr6zvIyh8=;
 h=From:To:Cc:Subject:Date:From;
 b=A6C2w/0/Uxnv8CO+GEIWbGGj8uELHZB17HXFebh1KIi6U+9EtoOYw22vOeec8JdrB
 WGAFeAW7Xdf8TyODvjP2lSjGxRjVSUngyI5i9SkaPWkIpW6gcIfLsARknq5JtwYbV4
 pmZhYmYoNGvUSbYPhzAC8z+C4vH+KLR+tqsEiTLMEx8ZN9uxWkMr6trQsrS9Jta1Zv
 yz19wOGKdLI1pT3C7Y1GLsjl3huFy0KE+s/LPfpwYBfVyqdqsVCrE8ImPfPvRoV1Hs
 1Zaiyt8BS6oHuj0QCxrWp1O6oo5H7LVR7DXD7jPB3Xy1q5E2IM/WeTDJkIUAiYl58E
 i1e2gKSk9/sHA==
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id E34A517E36CB;
 Wed, 13 Nov 2024 16:43:01 +0100 (CET)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org,
	kernel@collabora.com
Subject: [PATCH 0/5] drm/panthor: Be robust against failures in the resume path
Date: Wed, 13 Nov 2024 16:42:52 +0100
Message-ID: <20241113154257.1971284-1-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.46.2
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

Here's a collection of patches improving robustness to failures in
the device resume/suspend path. Those failures are pretty hard to
reproduce (happens once in a while on a deqp-vk run), so I used a
mechanism to fake them.

Faking a FW boot failure is kinda tricky though, which means the
last patch has only been partially tested:
- the fast reset path is well tested because that's the default on
  a device suspend
- the slow reset has been tested with a hack replacing fast resets
  by slow resets
- the fast -> slow reset fallback has been tested by faking boot
  failures after a fast reset, but these are not real, which means
  we can't really validate if the MCU recovers fine after a slow
  reset

On the other hand, this implementation doesn't look like it could
do more harm than the current one (the only difference is the
extra GPU soft-reset that happens between the fast and slow FW
boot).

Regards,

Boris

Boris Brezillon (5):
  drm/panthor: Preserve the result returned by panthor_fw_resume()
  drm/panthor: Be robust against runtime PM resume failures in the
    suspend path
  drm/panthor: Ignore devfreq_{suspend,resume}_device() failures
  drm/panthor: Be robust against resume failures
  drm/panthor: Fix the fast-reset logic

 drivers/gpu/drm/panthor/panthor_devfreq.c | 12 ++--
 drivers/gpu/drm/panthor/panthor_devfreq.h |  4 +-
 drivers/gpu/drm/panthor/panthor_device.c  | 78 +++++++++++------------
 drivers/gpu/drm/panthor/panthor_device.h  | 28 ++++++++
 drivers/gpu/drm/panthor/panthor_drv.c     |  2 +-
 drivers/gpu/drm/panthor/panthor_fw.c      | 62 +++++-------------
 drivers/gpu/drm/panthor/panthor_gpu.c     | 14 ++--
 drivers/gpu/drm/panthor/panthor_mmu.c     |  3 +-
 drivers/gpu/drm/panthor/panthor_sched.c   |  4 +-
 9 files changed, 102 insertions(+), 105 deletions(-)

-- 
2.46.2

