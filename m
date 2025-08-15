Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99CABB286C5
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 21:59:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1B4810E289;
	Fri, 15 Aug 2025 19:59:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="TD3EfHCi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D53EF10E286
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Aug 2025 19:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 Message-Id:Date:Subject:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=50VYbSIrOLNLJ+3w+PxBnnE8IpQCnNiwuLSa53UmHfM=; b=TD3EfHCiLL7ZrfjBQWx58WsirG
 oASF4F25OTnPnTCGbIaEhigOtkSOhMkOiqJWGCTWEgggbolpirTLrPJcN46CvneW2jSMchGHxGUAW
 fKc2OhyJt3Q7Viurc5SLPgVqYQ1udfvGlBlzYmkaTfILpDeHUXlUOuj3iLsfJnwTrOJDOCoQQiQlO
 kJGNwCe1uUcXQIgFh2uU1ahulo+LXmzMalw3GwElKguHe3EVR8edMzr2kI0q8UT2yYuXuvbnuq9Yv
 NiiZpDBipuNkYh1+bXQY8Wq6u+5K+FZmHDq4NyFml8seX4fPy2zoHusnmrkR9nLg+DjKmIbkEn209
 E2A+8PWQ==;
Received: from [177.191.196.76] (helo=[192.168.0.165])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1un0Zm-00EoI4-TM; Fri, 15 Aug 2025 21:58:59 +0200
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Subject: [PATCH v2 0/6] drm/v3d: General job locking improvements +
 race-condition fixes
Date: Fri, 15 Aug 2025 16:58:39 -0300
Message-Id: <20250815-v3d-queue-lock-v2-0-ce37258ffb53@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAG+Rn2gC/13MQQ6CMBCF4auQWTumrVbBlfcwLNoywESk2kqjI
 dzdSuLG5f+S980QKTBFOBUzBEoc2Y851KYA15uxI+QmNyihtDjKEtOuwcdEE+Hg3RV1ZY1trd6
 X1kE+3QO1/FrBS5275/j04b36SX7XH1X9U0miQOvcQSopWkn6zJ0Z2Gydv0G9LMsHSHcBrK0AA
 AA=
X-Change-ID: 20250718-v3d-queue-lock-59babfb548bc
To: Melissa Wen <mwen@igalia.com>, Iago Toral Quiroga <itoral@igalia.com>, 
 Jose Maria Casanova Crespo <jmcasanova@igalia.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1972; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=sehh7sLqthK26iyxILASKNQ4rCeVLb/v0UQE5b3oOP4=;
 b=owEBbQGS/pANAwAKAT/zDop2iPqqAcsmYgBon5FzQyLzkqQR6M+WNJEKbhe2KEa1bdMSK5ZEb
 tOouTE9EBCJATMEAAEKAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCaJ+RcwAKCRA/8w6Kdoj6
 qm1pCADRfs+a3F/PnvigjY+wTnMEBrBd2B2pthckKyCnS6snEqTv+KmYQ8F5y1pKVzFORwE6j47
 za/j0XwzWIAeFvoexMkltRI2lB9dssa32ZO9dnTDUYl69nAXjiybRNDQyy417mVVdjggdIslz6u
 oNhA/INgu+toHXMlYLWOWO5HmMfGKPNs/sVlyfrU1RQHV0f4rZAunN6MukXiiYGEc9sHtZKAMFm
 p/HCoP2ReMGsbWTmEDvEDgLp2Ubpr3m9zjU42rFXh7VanUXONVI0G+7gVMXyddEYSNVT0ZU8gzc
 MonK7Rhj+QdHIz5942VHYoES4AdP0feDKpLHjahPndFLoX84
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

- Rebase on top of drm-misc-next.
- Link to v1: https://lore.kernel.org/r/20250719-v3d-queue-lock-v1-0-bcc61210f1e5@igalia.com

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
 drivers/gpu/drm/v3d/v3d_sched.c  | 83 +++++++++++++++++++++-------------------
 drivers/gpu/drm/v3d/v3d_submit.c |  2 +-
 7 files changed, 104 insertions(+), 106 deletions(-)
---
base-commit: f9c67b019bc3c0324ee42c0dbfbb2d55726d751e
change-id: 20250718-v3d-queue-lock-59babfb548bc

