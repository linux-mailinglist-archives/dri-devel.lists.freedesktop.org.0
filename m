Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8719AA82D5
	for <lists+dri-devel@lfdr.de>; Sat,  3 May 2025 23:01:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB33310E226;
	Sat,  3 May 2025 21:00:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="UoyFh9f+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C8F310E223;
 Sat,  3 May 2025 21:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 Message-Id:Date:Subject:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lxhSoIfN4iQm/O6riMc+khj2au53FSMA6l3ILbTZAbw=; b=UoyFh9f+qqtc7VRunF7/nK5ZMR
 Io9a3CYUBpdeY4r+l1BTX0QNF3WfkD0A48L1yvF2B8VY37U+MMuurbpOwpGRK0Cond4YQGqjPdPPi
 rvUpSfavi7QEjRhWieYpblKHXVC8O0BvlmN1t4tz7GQa3KvHzxePdSKxhSWSOFg2K/B9QYM3zZXLG
 fE+72Z7ezuUojKq+J4ql9oUSEEJNRXadryRT1dyrlxsCYKOF4bLSa2YaRZtYIIApRUgfdSEYHdLa6
 nZoDUuQpg5JjyQ6x4bH4N60OyFnKn051vk/IbueZUhNPG/Ee49YDtqbsGQ1Rbs4dSaZ+hJrniSznd
 a4Nwn0DA==;
Received: from [189.7.87.174] (helo=janis.local)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uBJvs-002dbs-Rb; Sat, 03 May 2025 23:00:29 +0200
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Subject: [PATCH 0/8] drm/sched: Allow drivers to skip the reset with
 DRM_GPU_SCHED_STAT_RUNNING
Date: Sat, 03 May 2025 17:59:51 -0300
Message-Id: <20250503-sched-skip-reset-v1-0-ed0d6701a3fe@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAMiDFmgC/x3MQQqAIBBA0avErBswxYKuEi1MxxqCEiciCO+et
 HyL/18QykwCY/NCppuFz6OiaxvwmztWQg7VoJW2yiqN4jcKKDsnzCR04RIH3/VGGxMc1Cxlivz
 8y2ku5QN5f59MYgAAAA==
X-Change-ID: 20250502-sched-skip-reset-bf7c163233da
To: Matthew Brost <matthew.brost@intel.com>, 
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, Simona Vetter <simona@ffwll.ch>, 
 Melissa Wen <mwen@igalia.com>, Lucas Stach <l.stach@pengutronix.de>, 
 Russell King <linux+etnaviv@armlinux.org.uk>, 
 Christian Gmeiner <christian.gmeiner@gmail.com>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org, 
 etnaviv@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3601; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=Ejd6PC9pI+Q9AgPMDLzll5NMMyC4pXm9R0tz4HZeZPg=;
 b=owEBbQGS/pANAwAIAT/zDop2iPqqAcsmYgBoFoPmSQZ4dZrkG4Rlwsvq7yhjNZUkk+7YlPrOK
 +w6LVC8KkeJATMEAAEIAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCaBaD5gAKCRA/8w6Kdoj6
 qnYlB/0UTi9N4U4s6vV0HSVJpKrggz4VPJ0FmFQI360uNOynEtKOYhB7Fkvie5RaIK3wbS09/88
 Gy1SS1SoRfzblokZYzd//mJYqUctC1vxnP8G9yxc2VRnHAKTLki7OWHFqlvtJvNrgK3MLCDGWxu
 18BCFoxxAfQPmbhkphgBCxlGi2m62EfVb+xJDbZhuVAxh6rUEkNqlmUX53mmBN0ciQvc+KLCXH9
 o8c3Yqpr7pehqkoDTO3B6e8nnUCa8NlHIb6BNE5Or6zoKEnWeM2hKCyy7HJ0OpkqilYQtCQt+2B
 4iceQEtARzuni/kHvFF6mzOOaJ7bNLEI4RIT0fCpyMhpM5ru
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

When the DRM scheduler times out, it's possible that the GPU isn't hung;
instead, a job may still be running, and there may be no valid reason to
reset the hardware. This can occur in two situations:

  1. The GPU exposes some mechanism that ensures the GPU is still making
     progress. By checking this mechanism, we can safely skip the reset,
     rearm the timeout, and allow the job to continue running until
     completion. This is the case for v3d and Etnaviv.

  2. TDR has fired before the IRQ that signals the fence. Consequently,
     the job actually finishes, but it triggers a timeout before signaling
     the completion fence.

These two scenarios are problematic because we remove the job from the
`sched->pending_list` before calling `sched->ops->timedout_job()`. This
means that when the job finally signals completion (e.g. in the IRQ
handler), the scheduler won't call `sched->ops->free_job()`. As a result,
the job and its resources won't be freed, leading to a memory leak.

For v3d specifically, we have observed that these memory leaks can be
significant in certain scenarios, as reported by users in [1][2]. To
address this situation, I submitted a patch similar to commit 704d3d60fec4
("drm/etnaviv: don't block scheduler when GPU is still active") for v3d [3].
This patch has already landed in drm-misc-fixes and successfully resolved
the users' issues.

However, as I mentioned in [3], exposing the scheduler's internals within
the drivers isn't ideal and I believe this specific situation can be
addressed within the DRM scheduler framework.

This series aims to resolve this issue by adding a new DRM sched status
that allows a driver to skip the reset. This new status will indicate that
the job should be reinserted into the pending list, and the driver will
still signal its completion.

The series can be divided into three parts:

  * Patch 1: Implementation of the new status in the DRM scheduler.
  * Patches 2-4: Some fixes to the DRM scheduler KUnit tests and the
    addition of a test for the new status.
  * Patches 5-8: Usage the new status in four different drivers.

[1] https://gitlab.freedesktop.org/mesa/mesa/-/issues/12227
[2] https://github.com/raspberrypi/linux/issues/6817
[3] https://lore.kernel.org/dri-devel/20250430210643.57924-1-mcanal@igalia.com/T/

Best Regards,
- Maíra

---
Maíra Canal (8):
      drm/sched: Allow drivers to skip the reset and keep on running
      drm/sched: Always free the job after the timeout
      drm/sched: Reduce scheduler's timeout for timeout tests
      drm/sched: Add new test for DRM_GPU_SCHED_STAT_RUNNING
      drm/v3d: Use DRM_GPU_SCHED_STAT_RUNNING to skip the reset
      drm/etnaviv: Use DRM_GPU_SCHED_STAT_RUNNING to skip the reset
      drm/xe: Use DRM_GPU_SCHED_STAT_RUNNING to skip the reset
      drm/panfrost: Use DRM_GPU_SCHED_STAT_RUNNING to skip the reset

 drivers/gpu/drm/etnaviv/etnaviv_sched.c          | 12 ++---
 drivers/gpu/drm/panfrost/panfrost_job.c          |  8 ++--
 drivers/gpu/drm/scheduler/sched_main.c           | 14 ++++++
 drivers/gpu/drm/scheduler/tests/mock_scheduler.c | 13 ++++++
 drivers/gpu/drm/scheduler/tests/tests_basic.c    | 57 ++++++++++++++++++++++--
 drivers/gpu/drm/v3d/v3d_sched.c                  |  4 +-
 drivers/gpu/drm/xe/xe_guc_submit.c               |  8 +---
 include/drm/gpu_scheduler.h                      |  2 +
 8 files changed, 94 insertions(+), 24 deletions(-)
---
base-commit: 760e296124ef3b6e14cd1d940f2a01c5ed7c0dac
change-id: 20250502-sched-skip-reset-bf7c163233da

