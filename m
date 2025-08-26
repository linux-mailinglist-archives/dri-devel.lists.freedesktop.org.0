Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C61DEB368C5
	for <lists+dri-devel@lfdr.de>; Tue, 26 Aug 2025 16:19:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CCDD10E665;
	Tue, 26 Aug 2025 14:19:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="MR39VPT1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5426410E665
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Aug 2025 14:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 Message-Id:Date:Subject:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wTjgpFBwJdU6dShNKkXGX7YMneW1cWe3+Jt+143OZko=; b=MR39VPT1vJ37QUSiPxYtWTgAMf
 3N/wennlAuOrUqV8PpBVyCU984XPFRqsL/fL+Eb7zoEz43d0wAU3ebTx7uAjLogEbA7980hrCulLw
 UwsK1P4XrhXCvT30S1jV4EK9lmJH9S4STSYfWDgZ8LW+jsxJi9cyDZxlZrwZ5TB+CeeVJ/c8FfVDU
 oiALKLbQbZXy1zxLbCVJtDNZVV6kp63kvcTgFzJlPSRoQquQsjbFerALToclQqnvy69Qge/AOcg5l
 ShjrZBEbEYE89TMk2bmG1svgoVTfJh/ay6fJfSzwYHyx+UHLn93YFoDBe06m6Zfle6CV8pL6ZVfW8
 1sR6nmpA==;
Received: from [189.7.87.79] (helo=[192.168.0.8])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uquVv-001wrM-F4; Tue, 26 Aug 2025 16:19:07 +0200
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Subject: [PATCH v3 0/6] drm/v3d: General job locking improvements +
 race-condition fixes
Date: Tue, 26 Aug 2025 11:18:57 -0300
Message-Id: <20250826-v3d-queue-lock-v3-0-979efc43e490@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAFHCrWgC/2WOQQ7CIBQFr9KwFlNALLryHsYF0E/7Yy0Klmia3
 l3axBh1OS+ZyRtJhIAQyb4YSYCEEX2fQawKYlvdN0Cxzkx4yWVZMUWTqOltgAFo5+2Zyp3Rxhm
 5UcaSLF0DOHwsweMpc4vx7sNz6Sc2r+/U7jeVGC2psXbLOCsdA3nARneo19ZfyNxK/OMrJv98n
 n0LouJSuXxJfPnTNL0As+dr1O0AAAA=
X-Change-ID: 20250718-v3d-queue-lock-59babfb548bc
To: Melissa Wen <mwen@igalia.com>, Iago Toral Quiroga <itoral@igalia.com>, 
 Jose Maria Casanova Crespo <jmcasanova@igalia.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2319; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=XZeAMhHfiDp/YV3FbTfAX852Tgojf5vIwZrCwd6cfWs=;
 b=owEBbQGS/pANAwAKAT/zDop2iPqqAcsmYgBorcJXEvEYrlV2ZhwM289ybabmzS6sWZm8EA2Hc
 wjajZRyJfuJATMEAAEKAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCaK3CVwAKCRA/8w6Kdoj6
 qgwSB/wKaHjktkPmN+pciv3+wHyTjB9bVSWEgjp364MpZlqB3P+YYe8wa8hwDwLTquvyx8P/S99
 ufS3OrlUKPpNy65gZTxDckm12TSsHpDCHDc3NZH3U2d/h7e3cRCVmRTBTaKPH2MpK815aB1n1zl
 Y3I8mTtkjtsY9ZWzLpiN4G5JAFTyPF70ziSNGoi9+Kq81qmZJ8AynhumfMCws1Mn/+O8sO5N2yW
 8Kagub5ZU07jxYaZ3XBeg+rltUgggUaIPsggtS7Bsfz0b3LC6wwO73J3U4lP9QfgwVrdrwiITHu
 YLj2BDZvWfyO94wF3OLaJJefVy7qGg5yr5GUPZEU5vaxlim6
X-Developer-Key: i=mcanal@igalia.com; a=openpgp;
 fpr=F8E45D7D0116770729A677D13FF30E8A7688FAAA
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

This patch series was initially motivated by a race condition (exposed
in PATCH 4/6) where we lacked synchronization for `job->file` access.
This led to use-after-free issues when a file descriptor was closed
while a job was still running.

However, beyond fixing this specific race, the series introduces
broader improvements to active job management and locking. While PATCH
1/6, 2/6, and 5/6 are primarily code refactors, PATCH 3/6 brings a
significant change to the locking scheme. Previously, all queues shared
the same spinlock, which caused unnecessary contention during high GPU
usage across different queues. PATCH 3/6 allows queues to operate more
independently.

Finally, PATCH 6/6 addresses a similar race condition to PATCH 4/6, but
this time, on the per-file descriptor reset counter.

Best Regards,
- Maíra

---
v1 -> v2:

- Add Iago's R-b to all patches.
- Rebase on top of drm-misc-next.
- Link to v1: https://lore.kernel.org/r/20250719-v3d-queue-lock-v1-0-bcc61210f1e5@igalia.com

v2 -> v3:

- [1/6, 2/6, 3/6, 5/6] Add Melissa's R-b.
- [1/6] Improve the commit message (Melissa Wen)
- [2/6] Use `&job->base` instead of `to_v3d_job(sched_job)`
- [6/6] Fix the loop index (s/q/i) (Melissa Wen)
- Link to v2: https://lore.kernel.org/r/20250815-v3d-queue-lock-v2-0-ce37258ffb53@igalia.com

---
Maíra Canal (6):
      drm/v3d: Store a pointer to `struct v3d_file_priv` inside each job
      drm/v3d: Store the active job inside the queue's state
      drm/v3d: Replace a global spinlock with a per-queue spinlock
      drm/v3d: Address race-condition between per-fd GPU stats and fd release
      drm/v3d: Synchronous operations can't timeout
      drm/v3d: Protect per-fd reset counter against fd release

 drivers/gpu/drm/v3d/v3d_drv.c    | 14 ++++++-
 drivers/gpu/drm/v3d/v3d_drv.h    | 22 ++++-------
 drivers/gpu/drm/v3d/v3d_fence.c  | 11 +++---
 drivers/gpu/drm/v3d/v3d_gem.c    | 10 ++---
 drivers/gpu/drm/v3d/v3d_irq.c    | 68 +++++++++++++-------------------
 drivers/gpu/drm/v3d/v3d_sched.c  | 85 +++++++++++++++++++++-------------------
 drivers/gpu/drm/v3d/v3d_submit.c |  2 +-
 7 files changed, 105 insertions(+), 107 deletions(-)
---
base-commit: 7399c13f619f33dc8bdce838f3c83e88a18765ee
change-id: 20250718-v3d-queue-lock-59babfb548bc

