Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F46CD9F0D
	for <lists+dri-devel@lfdr.de>; Tue, 23 Dec 2025 17:25:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D09AE10E24B;
	Tue, 23 Dec 2025 16:25:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="fQsIIZcY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEB9910E24B
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Dec 2025 16:25:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1766507119; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=PkpmWEYWSGMZ4ZtaHPlVb7ZfrfCNSbbKqdac/I5Ybw5m/JjTU+84kcSZbxF7d9g9VeKwckAtld1lzgqIookmnvfQAE63VMQVTotnx0KvPJBasJsTk9ENId/V/5pSHU8Z/f2QFWy+WgPErLoGs2ZxuXTV3XrRkerlqD8N3w+kR7o=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1766507119;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=cmsLyhrEPrdE5GXirU8ExFCmel8L1WH1gneVT3Gbhlk=; 
 b=a1tRZR4MDvE2tnx3srHs04nNQfwmIXwFK7lRH0PDv3ENn9ko05oAD+hxeIVP1Na2sAuqj6AKjo1Ib8CgtN37CCAseJPT3pHBLlYpVbEV0mh2f7QqcOhzG9Vof1ZX21TecUOd2s6a/HPd4Ur0DLWvazXFK8M8eCAJX+UsOOad7Ms=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1766507119; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
 bh=cmsLyhrEPrdE5GXirU8ExFCmel8L1WH1gneVT3Gbhlk=;
 b=fQsIIZcYu4RLykNlSc4zpjmI0C0uwG9Q7V5x0+G1+eyMpS3JNqoWQPhmKht6aN4q
 MXBWJ45PdBNzpO87EY7VR3bO75IyH5YqrC1b3MICMv5UUiGaHqyAX+nL+d9UtG1DAp/
 iQOQFxUWczv4RJniI9bcKUy4199kB6CXi0y+tUsM=
Received: by mx.zohomail.com with SMTPS id 1766507118105104.8362441587376;
 Tue, 23 Dec 2025 08:25:18 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: [PATCH v6 0/3] Add a few tracepoints to panthor
Date: Tue, 23 Dec 2025 17:24:57 +0100
Message-Id: <20251223-panthor-tracepoints-v6-0-d3c998ee9efc@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFnCSmkC/33QQU7EIBgF4Ks0rEWBAoVZeQ/jgsJfSzItFbDRT
 Hp3acdFY9AVeSTv44UbShA9JHRpbijC6pMPcwnyoUF2NPMbYO9KRowwQRlp8WLmPIaIczQWluD
 nnDBXygxEOy6hQ6W5RBj856G+vN5zhPePguf7JepNAmzDNPl8aVyccPbL08+J9sroUw7x69i10
 qPz74SVYoJVR63StAOi+LMN16vpQzSP5Z3DXNnJoaTusOKUyIDp3jgy1Jz27NC60xZHM261a4U
 0wtYcfna6usN3h0qqpO2VI23NESeH/bFH7P+jNAydolI49dvZtu0btVjOgw0CAAA=
X-Change-ID: 20251203-panthor-tracepoints-488af09d46e7
To: Boris Brezillon <boris.brezillon@collabora.com>, 
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chia-I Wu <olvaffe@gmail.com>, Karunika Choo <karunika.choo@arm.com>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.3
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

This series adds two tracepoints to panthor.

The first tracepoint allows for inspecting the power status of the
hardware subdivisions, e.g. how many shader cores are powered on. This
is done by reading three hardware registers when a certain IRQ fires.

The second tracepoint instruments panthor's job IRQ handler. This is
more useful than the generic interrupt tracing functionality, as the
tracepoint has the events bit mask included, which indicates which
command stream group interfaces triggered the interrupt.

To test the tracepoints, the following can be used:

  :~# echo 1 > /sys/kernel/tracing/events/panthor/gpu_power_status/enable
  :~# echo 1 > /sys/kernel/tracing/events/panthor/gpu_job_irq/enable
  :~# echo 1 > /sys/kernel/tracing/tracing_on
  :~# cat /sys/kernel/tracing/trace_pipe

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
Changes in v6:
- Read the mask member into a local while holding the lock in
  irq_threaded_handler.
- Drop the lock before entering the while loop, letting the threaded
  handler function run without holding a spinlock
- Re-acquire the spinlock at the end of irq_threaded_handler, OR'ing the
  mask register's contents with the mask local ANDed by the member. This
  avoids stomping over any other modified bits, or restoring ones that
  have been disabled in the meantime.
- Link to v5: https://lore.kernel.org/r/20251221-panthor-tracepoints-v5-0-889ef78165d8@collabora.com

Changes in v5:
- Change the panthor IRQ helpers to guard the mask member and register
  with a spinlock. The rationale behind using a spinlock, rather than
  some constellation of atomics, is that we have to guarantee mutual
  exclusion for state beyond just a single value, namely both the register
  write, and writes to/reads from the mask member, including
  reads-from-member-writes-to-register. Making the mask atomic does not do
  anything to avoid concurrency issues in such a case.
- Change the IRQ mask member to not get zeroed when suspended. It's
  possible something outside of the IRQ helpers depends on this
  behaviour, but I'd argue the code should not access the mask outside
  of the IRQ helpers, as it'll do so with no lock taken.
- Drop the mask_set function, but add mask_enable/mask_disable helpers
  to enable/disable individual parts of the IRQ mask.
- Add a resume_restore IRQ helper that does the same thing as resume,
  but does not overwrite the mask member. This avoids me having to
  refactor whatever panthor_mmu.c is doing with that poor mask member.
- Link to v4: https://lore.kernel.org/r/20251217-panthor-tracepoints-v4-0-916186cb8d03@collabora.com

Changes in v4:
- Include "panthor_hw.h" in panthor_trace.h instead of duplicating the
  reg/unreg function prototypes.
- Link to v3: https://lore.kernel.org/r/20251211-panthor-tracepoints-v3-0-924c9d356a5c@collabora.com

Changes in v3:
- Drop PWRFEATURES patch, as this register is no longer needed by this
  series.
- Eliminate the rt_on field from the gpu_power_status register, as per
  Steven Price's feedback.
- Make gpu_power_status tracepoint reg/unreg functions generic across
  hardware generations by wrapping a hw op in panthor_hw.c.
- Reimplement the <= v13 IRQ mask modification functions as the new hw
  ops functions. v14 can add its own ops in due time.
- Link to v2: https://lore.kernel.org/r/20251210-panthor-tracepoints-v2-0-ace2e29bad0f@collabora.com

Changes in v2:
- Only enable the GPU_IRQ_POWER_CHANGED_* IRQ mask bits when the
  tracepoint is enabled. Necessitates the new irq helper patch.
- Only enable the GPU_IRQ_POWER_CHANGED_* IRQ mask bits if the hardware
  architecture is <= v13, as v14 changes things.
- Use _READY instead of _PWRACTIVE registers, and rename the tracepoint
  accordingly.
- Also read the status of the ray tracing unit's power. This is a global
  flag for all shader cores, it seems. Necessitates the new register
  definition patch.
- Move the POWER_CHANGED_* check to earlier in the interrupt handler.
- Also listen to POWER_CHANGED, not just POWER_CHANGED_ALL, as this
  provides useful information with the _READY registers.
- Print the device name in both tracepoints, to disambiguate things on
  systems with multiple Mali GPUs.
- Document the gpu_power_status tracepoint, so the meaning of the fields
  is made clear.
- Link to v1: https://lore.kernel.org/r/20251203-panthor-tracepoints-v1-0-871c8917e084@collabora.com

---
Nicolas Frattaroli (3):
      drm/panthor: Extend IRQ helpers for mask modification/restoration
      drm/panthor: Add tracepoint for hardware utilisation changes
      drm/panthor: Add gpu_job_irq tracepoint

 drivers/gpu/drm/panthor/panthor_device.h | 68 +++++++++++++++++++++----
 drivers/gpu/drm/panthor/panthor_fw.c     | 13 +++++
 drivers/gpu/drm/panthor/panthor_gpu.c    | 30 ++++++++++-
 drivers/gpu/drm/panthor/panthor_gpu.h    |  2 +
 drivers/gpu/drm/panthor/panthor_hw.c     | 62 +++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_hw.h     |  8 +++
 drivers/gpu/drm/panthor/panthor_trace.h  | 86 ++++++++++++++++++++++++++++++++
 7 files changed, 258 insertions(+), 11 deletions(-)
---
base-commit: 98fdf8a438c3a1d9de8d5804cdcda94e097d53a0
change-id: 20251203-panthor-tracepoints-488af09d46e7

Best regards,
-- 
Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

