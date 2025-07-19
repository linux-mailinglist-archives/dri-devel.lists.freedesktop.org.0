Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AFE3B0B03B
	for <lists+dri-devel@lfdr.de>; Sat, 19 Jul 2025 15:25:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43D8B10E352;
	Sat, 19 Jul 2025 13:24:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="GBC7AJox";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 587DA10E352
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Jul 2025 13:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 Message-Id:Date:Subject:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=f5+bcX1/PaomuFXflGWyLeeOrvCwfILVaO/ksNTjfos=; b=GBC7AJoxlb+uaDDy2+jO/zehHP
 HGVDOGkvwdIAnbSBAhBhODndPI5VuhuEVns+WA4J6jczkD0XmAeusRxJM416naZZ6apnOqIw6eFr5
 VcrQUgYsz5ZLe5k36jp2eyNpGeqeWcTzrAr6iOqKFsXcso8X1ZTS7PHvzUHFIpdZ3MOR3Ru2FoYws
 mG/Fz8QnGhG36nwrsom29S6QsgA7sLy0/6RPzJ+JANgqnSN3DEZoqDUAIKImUfyZKFsv6dbEt9vgz
 2ASslESig/stLxfpcrUz0UteHf1VXX+LJ92zckMAfx4bVIxFoFi6S0GnbMs5VhVgrc3XnWoP6OJwR
 CaFMwBvA==;
Received: from [187.36.210.68] (helo=1.0.0.127.in-addr.arpa)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1ud7Yb-000wkK-Ej; Sat, 19 Jul 2025 15:24:53 +0200
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Subject: [PATCH 0/6] drm/v3d: General job locking improvements +
 race-condition fixes
Date: Sat, 19 Jul 2025 10:24:39 -0300
Message-Id: <20250719-v3d-queue-lock-v1-0-bcc61210f1e5@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAJece2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDc0ML3TLjFN3C0tTSVN2c/ORsXVPLpMSktCRTE4ukZCWgpoKi1LTMCrC
 B0bG1tQBy7qGzYAAAAA==
X-Change-ID: 20250718-v3d-queue-lock-59babfb548bc
To: Melissa Wen <mwen@igalia.com>, Iago Toral Quiroga <itoral@igalia.com>, 
 Jose Maria Casanova Crespo <jmcasanova@igalia.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1823; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=tB5aaL/WHK1xiOHSmQeYgTiAOVZ8WUcjpvFBuc/9HF0=;
 b=owGbwMvMwMFo/5mvq6zj1yrG02pJDBnVcxa25csI6oc3FBy05o/te154PSmp873f1Q5BNwP5B
 4IfUi91MhqzMDByMMiKKbL8eBJbyyhWzq65rPwizCBWJpApDFycAjCRhDr2/6nt9v9fWyTyTih3
 d4zS6lDwyHaWjZgacuSvVA6zhNyci+s1rp+w9k+JZttY3Hg1aMm37ebz58asfS0erHhGZLW8nIm
 LqrfZ+aM5rEENCelvHpeumyCpZho6ZZZ5c7CjsPp/ddkXjSl3Jjrf02gOcLY6Muu86eo6jTnc32
 MbZS7qHHhqGBJZWZ++ID88LrvCQGnDydbl87f8ll8kvv7Nv1yXyGvsG9qzPJ/JVjRErcxT+HmI9
 2C7aen07Mt3TAq//4p/MyOjWvLeF8n8j1JG8pv0ml+e9mqvP3xnSmfz3ZxLW09uv7PJS2l2rGeX
 SiNncPokS8N36cZZBofDjd9I511xE/R8+69QndvhSiIA
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
 drivers/gpu/drm/v3d/v3d_sched.c  | 85 +++++++++++++++++++++++-----------------
 drivers/gpu/drm/v3d/v3d_submit.c |  2 +-
 7 files changed, 108 insertions(+), 104 deletions(-)
---
base-commit: ca2a6abdaee43808034cdb218428d2ed85fd3db8
change-id: 20250718-v3d-queue-lock-59babfb548bc

