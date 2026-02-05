Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id BI+AIzYMhWlm7wMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 22:31:34 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2041CF7ACD
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 22:31:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 607CD10E11E;
	Thu,  5 Feb 2026 21:31:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="VzgRbO63";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45A3710E0CA
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Feb 2026 21:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 Message-Id:Date:Subject:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CFgWUr4gkLA0kd+KffzAF9k4CXcvML/PwxKI5ufzbks=; b=VzgRbO635eYs/ZqR3xwrsWHGl2
 vEqXGOV2ZZKsxW9GPIl6OtJfZszDQnWsXu/OuLanx3X00UD7Fa5UM5JIA1PILG3E7QVyrhV3EV/Pn
 G2KxYx8eM2v8gtbiVGcl72QHTNLNAdUSgt2x3Lt1LUTB6A97jOkAv61qV7vTVqrvv7b51BeTrW098
 bt0ARFIXlbg0OJkxyIzeEDkahHAlm3gurTlbGFgyDYSYtqNETWrcrhcg+j1tnPoyNnh2qHJBCKLvP
 gx919LjeI4mcwAxXS+wR0IOW7I73QMofb1cxqDMAJA+6hrcMWDPsDZAQ6VxrvnTGkirkX9Qp7KnOZ
 Zut36IWQ==;
Received: from [187.36.210.68]
 (helo=1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vo6wT-00EZx4-8h; Thu, 05 Feb 2026 22:31:13 +0100
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Subject: [PATCH 00/11] drm/vc4: Switch to DRM GPU scheduler
Date: Thu, 05 Feb 2026 18:30:59 -0300
Message-Id: <20260205-vc4-drm-scheduler-v1-0-c6174fd7bbc1@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIABMMhWkC/x3MTQqAIBBA4avIrBtQC4uuEi1Kpxroj5EiCO+et
 PwW770QSZgitOoFoZsjH3uGKRT4ZdhnQg7ZYLV12liDt68wyIbRLxSulQR16UPjaj2Wk4PcnUI
 TP/+z61P6AJXpxW1jAAAA
X-Change-ID: 20260121-vc4-drm-scheduler-03cd8670b3f6
To: Melissa Wen <mwen@igalia.com>, Maxime Ripard <mripard@kernel.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3609; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=yqx+YjxEonnVVLBR6aYewh1aOvtKKtAu4JuEOlojKvA=;
 b=owEBbQGS/pANAwAIAT/zDop2iPqqAcsmYgBphQwcH3C0n5dWEancoqkvk0Gz0eG8RP+gDD32x
 72Jh9tJ+gOJATMEAAEIAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCaYUMHAAKCRA/8w6Kdoj6
 qhSIB/9AZMnMtvRmT38Zs13WXNA2ufVgvDqqOvtUfo8XQUvLsOwGWZt1uEcqX41QVhfWcoAYrBg
 WK8KJhLV1rjRrcrhx2OVgO6mcnmFQtCrOdydFSDc5zRCynKL4gJ2Iq376fJb4p5j/wwJ8ifwMdH
 csqfuXEH5LOxwUYupu3uO1A8v1I5IwPQferbMXoaR5zMAUi3lYnz5S/F/2GXDmn+K5R8MiylvIE
 GqQwjgiUkJsxAqPngdF3cKVsjkhZNJJLNMgHuUKqyNXjvwILY4aB1unnVzLIa1y5DWNvjBc8Z0/
 o18V60I63edQWzs93ChZJvZNzkOuOxs8SN8oD6oPFzsa7gTj
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.49 / 15.00];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:mwen@igalia.com,m:mripard@kernel.org,m:dave.stevenson@raspberrypi.com,m:kernel-list@raspberrypi.com,m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:kernel-dev@igalia.com,m:mcanal@igalia.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[igalia.com,kernel.org,raspberrypi.com,linux.intel.com,suse.de,gmail.com,ffwll.ch];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[mcanal@igalia.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mcanal@igalia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[igalia.com:-];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,igalia.com:mid]
X-Rspamd-Queue-Id: 2041CF7ACD
X-Rspamd-Action: no action

Hi,

Since its introduction, the vc4 driver schedules its jobs and tracks the
dependencies in between them using its own internal job queue
implementation. This internal implementation is based in job lists, wait
queues and hand-rolled seqnos. Although job scheduling worked most of
the time, in more GPU intensive scenarios, many GPU hangs were reported
[1][2].

After investigating several GPU hangs, I noticed that job dependencies
weren't being tracked correctly, which could lead to synchronization
issues and GPU resets. Also, the GPU reset path had issues related to
job resubmission.

Considering the many issues related to the internal job queue
implementation, this series proposes switching to the DRM GPU scheduler,
which is a well-established implementation used by multiple DRM drivers.

This has many advantages:

1. Using common code: Instead of relying on a custom implementation, use
   a trusted common framework. This helps with maintainability of the
   vc4 driver. It also makes the code more readable.

2. Synchronization issues are gone: With this series, applications can
   work reliably on RPi 3. Many users reported that they weren't able to
   open applications like emulators on the device. Now, it's possible to
   play several retro games without issues.

3. GPU resets are recoverable: Even if a timeout happens, the GPU is able
   to recover successfully with minimal impact to the user.

4. PM actually works: Before this series, the GPU was active during the 
   entire runtime. After this series, the GPU is able to autosuspend and
   resume when needed.

In order to improve reviewability of the patches, I introduced piece by
piece of the new infrastructure without actually plugging it in. The
actual switchover only happens in the patch "drm/vc4: Switch to DRM GPU
scheduler".

This series was mostly based on the design of the v3d driver as the two
drivers are very similar.

[1] https://github.com/raspberrypi/linux/issues/5780
[2] https://github.com/raspberrypi/linux/issues/3221

Best regards,
- Maíra

---
Maíra Canal (11):
      drm/vc4: Release runtime PM reference after binding V3D
      drm/vc4: Fix a memory leak in hang state error path
      drm/vc4: Move vc4_wait_bo_ioctl() to vc4_bo.c
      drm/vc4: Introduce vc4_job structures for DRM scheduler integration
      drm/vc4: Add DRM GPU scheduler infrastructure
      drm/vc4: Add new job submission implementation
      drm/vc4: Add per-file descriptor seqno tracking
      drm/vc4: Switch to DRM GPU scheduler
      drm/vc4: Use unique fence timeline names per queue
      drm/vc4: Get PM reference before register access
      drm/vc4: Use devm_request_irq() for automatic cleanup

 drivers/gpu/drm/vc4/Kconfig         |   1 +
 drivers/gpu/drm/vc4/Makefile        |   2 +
 drivers/gpu/drm/vc4/vc4_bo.c        |  33 ++
 drivers/gpu/drm/vc4/vc4_drv.c       |  15 +
 drivers/gpu/drm/vc4/vc4_drv.h       | 232 +++++----
 drivers/gpu/drm/vc4/vc4_fence.c     |  33 +-
 drivers/gpu/drm/vc4/vc4_gem.c       | 976 ++----------------------------------
 drivers/gpu/drm/vc4/vc4_irq.c       | 163 ++----
 drivers/gpu/drm/vc4/vc4_render_cl.c |  17 +-
 drivers/gpu/drm/vc4/vc4_sched.c     | 322 ++++++++++++
 drivers/gpu/drm/vc4/vc4_submit.c    | 569 +++++++++++++++++++++
 drivers/gpu/drm/vc4/vc4_v3d.c       |  25 +-
 drivers/gpu/drm/vc4/vc4_validate.c  |  21 +-
 13 files changed, 1208 insertions(+), 1201 deletions(-)
---
base-commit: 2bcbc706dfa02ae50118173a6f6d8a12e735480c
change-id: 20260121-vc4-drm-scheduler-03cd8670b3f6

