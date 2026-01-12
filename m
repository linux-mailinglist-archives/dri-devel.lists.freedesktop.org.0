Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1422BD1332F
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 15:38:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B858F10E3F0;
	Mon, 12 Jan 2026 14:38:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="MigpbcLU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE87310E3F0
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 14:38:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1768228687; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=YczOGcgurcRFb4Teg0lL+0JLwFSZH+1X8EZj+g+6TtRhE9niw4kixk+EcmHA+Krd3+4GDZbYfSnnjYYYePHeZV4xGmtuDeHNX/1bSLdQY5dgYNv+OJob1c69EVfUMO7Q2dOMLz1AMpX1pfqvHk5yhf76RqxsazE5ffSry/X6rnI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1768228687;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=Q6KnT1VT8eXWVMEIvy0swMKtZHujwlndHn5yQHpo5+o=; 
 b=f4mQaEzuwZ+9XR0s2ME6KzMhbdkChbC4cjsLlQV0q4tQyHazLJqMctR+4a+MAaS98cV0xzVHrt1jf12nMhHRUDWsxsHT6cvnn9gYnQBCyOxL4cHmlXnvBHJu/IYPlaA4Nz1DWWR5XI/p4WrKFn3btXelQe4FjLu+VvN1QHgIi+A=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1768228687; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
 bh=Q6KnT1VT8eXWVMEIvy0swMKtZHujwlndHn5yQHpo5+o=;
 b=MigpbcLU5kPMEkZw/hlUI+5zw9O822EVE8gf7u5A4EvUNCowDQwmIf054zDbOg2O
 C40psVdmqve1zP5s5mecDTbR1Y00mXGDj0ZZxK0g+6jOATh12zedXXnn9onOtOn32Me
 llUBYU9QFdbO+8fPpJiofBzUoTCY6RkJ3ibIt40w=
Received: by mx.zohomail.com with SMTPS id 1768228685434217.70761535741792;
 Mon, 12 Jan 2026 06:38:05 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: [PATCH v8 0/4] Add a few tracepoints to panthor
Date: Mon, 12 Jan 2026 15:37:48 +0100
Message-Id: <20260112-panthor-tracepoints-v8-0-63efcb421d22@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33QwU7EIBAG4FfZcBYFSmHYk+9hPFCYuiS7pVJsN
 Ju+u7SrSWNYT+QnmY/hv5IJU8CJHA9XknAOU4hDCfBwIO5khzekwZdMBBMtF6yhox3yKSaak3U
 4xjDkiUoA2zPjpUJNyuSYsA+fm/ryessJ3z8Knm+XpLMTUhcvl5CPB58uNIfx6eck68gpTDmmr
 22vmW8z/64wc8ooaO7AcI0M5LOL57PtYrKP5Z3NnMXO4azuiOKUKFCYznrW15xm7/C60xTHCOm
 Mb1plW1dz5N7RdUeuDlcclOvAs6bmtDtH3NmnXfsBg70GrloPNUftnTs9q+L4xhkDiEWr/kv/O
 opxBnVHrz33aJED77W0f51lWb4BPaLt0Z0CAAA=
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
Changes in v8:
- Reorder panthor_irq::state patch to be before the new mask
  modification helpers. The full set of states was kept (rather than
  just active/suspended) as they don't hurt and make the follow-up patch
  more concise in scope.
- Also bail out on STATE_SUSPENDING in irq_raw_handler
- Job irq: initialize start to 0 and don't emit a tracepoint if it is 0,
  to fix passing an uninitialised stack variable to userspace if the
  tracepoint was enabled while the handler was running
- Link to v7: https://lore.kernel.org/r/20260108-panthor-tracepoints-v7-0-afeae181f74a@collabora.com

Changes in v7:
- Get rid of old resume IRQ helper by reworking code throughout panthor,
  and make what used to be resume_restore in v6 the new resume.
- Rename mask_enable/mask_disable to enable_events/disable_events.
- Turn panthor_irq::suspended into a multi-state value, and utilise it
  in the IRQ helpers as appropriate.
- Link to v6: https://lore.kernel.org/r/20251223-panthor-tracepoints-v6-0-d3c998ee9efc@collabora.com

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
Nicolas Frattaroli (4):
      drm/panthor: Rework panthor_irq::suspended into panthor_irq::state
      drm/panthor: Extend IRQ helpers for mask modification/restoration
      drm/panthor: Add tracepoint for hardware utilisation changes
      drm/panthor: Add gpu_job_irq tracepoint

 drivers/gpu/drm/panthor/panthor_device.h |  96 ++++++++++--
 drivers/gpu/drm/panthor/panthor_fw.c     |  16 +-
 drivers/gpu/drm/panthor/panthor_gpu.c    |  30 +++-
 drivers/gpu/drm/panthor/panthor_gpu.h    |   2 +
 drivers/gpu/drm/panthor/panthor_hw.c     |  62 ++++++++
 drivers/gpu/drm/panthor/panthor_hw.h     |   8 +
 drivers/gpu/drm/panthor/panthor_mmu.c    | 247 ++++++++++++++++---------------
 drivers/gpu/drm/panthor/panthor_pwr.c    |   2 +-
 drivers/gpu/drm/panthor/panthor_trace.h  |  86 +++++++++++
 9 files changed, 409 insertions(+), 140 deletions(-)
---
base-commit: f339d0352f5f7e023e8ff89bb18291df8dfdad6e
change-id: 20251203-panthor-tracepoints-488af09d46e7

Best regards,
-- 
Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

