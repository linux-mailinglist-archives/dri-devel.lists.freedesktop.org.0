Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD379CC830F
	for <lists+dri-devel@lfdr.de>; Wed, 17 Dec 2025 15:30:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F371A10ECF2;
	Wed, 17 Dec 2025 14:30:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="Vv3//hGq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E9C110ECF2
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Dec 2025 14:30:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1765981798; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=fgBKnPPWhD5YUIXR+hQyseM4ESMaoLv89SeGrEDq863QbUDcxW4dK0bQi/h9ORD1p3Fm2t4jex+/EejhJfkTVeXgXMYcgNNqyPFvrHydq+gKH5njt136wtqJE9JNalZ55LCEs+M8C+/gGF+7ARpbSwIRFdYIT43usJbDnhQ4A/A=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1765981798;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=FIp7ZBT1Fb3jjviP7Z2wGij+9StJ8Dt9Fp878vj8ksE=; 
 b=UJXKAI5MYblNOF6ZPGRx+GCPTXLgq6+WljnH5jh0ENirYi48o1L50W2IIGlKxUhd759DKqSILFyuFO+B8DufNcE0tc3iAwMvroQjDTQBwJ52CCACFAFzQwC3GGcW52thf+foUqa2UgEL+kbunPD8HBvCg6ODk9Ab+iuTNO/Yo2w=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1765981798; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
 bh=FIp7ZBT1Fb3jjviP7Z2wGij+9StJ8Dt9Fp878vj8ksE=;
 b=Vv3//hGqZVUMJJJUP+Pyhte5BJnoGKKTPkuWwgUxKrBGg5V16RzUuNaCjawjY3AF
 4Y8T8emSlPqSefbRY4t+EdX4Ll4DmSvW1tiPmmPAzYWEPpZPY3mlb3ivXXzxsvUdwM8
 g63X2F2fNoMOoX1oVMI7q7i9SPlTUX29bb18HNGg=
Received: by mx.zohomail.com with SMTPS id 1765981796231870.096750580498;
 Wed, 17 Dec 2025 06:29:56 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: [PATCH v4 0/3] Add a few tracepoints to panthor
Date: Wed, 17 Dec 2025 15:29:37 +0100
Message-Id: <20251217-panthor-tracepoints-v4-0-916186cb8d03@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFG+QmkC/33OwW7DIAwG4FeJOI8OCGmgp73HtIMDzoLUhMywa
 FWVdy9Nd6imaCfrt/R/9pUlpICJnaorI1xCCnEqQb9UzA0wfSIPvmSmhGqkEjWfYcpDJJ4JHM4
 xTDlxbQz0wnp9xJaV5kzYh59Nff94ZMKv74Lnx5J1kJC7OI4hnypPI89hfv2d7F4ZQsqRLttfi
 9w6/76wSC64aaUzVrYojH5z8XyGLhIcyp3NXNSTI8W+o4pTokJlO/Ci33PqZ0fuO3VxrNLO+ro
 5QuP+Ouu63gDTTsIGfQEAAA==
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
      drm/panthor: Add panthor_*_irq_mask_set helper
      drm/panthor: Add tracepoint for hardware utilisation changes
      drm/panthor: Add gpu_job_irq tracepoint

 drivers/gpu/drm/panthor/panthor_device.h |  7 +++
 drivers/gpu/drm/panthor/panthor_fw.c     | 13 +++++
 drivers/gpu/drm/panthor/panthor_gpu.c    | 38 +++++++++++++-
 drivers/gpu/drm/panthor/panthor_gpu.h    |  2 +
 drivers/gpu/drm/panthor/panthor_hw.c     | 62 +++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_hw.h     |  8 +++
 drivers/gpu/drm/panthor/panthor_trace.h  | 86 ++++++++++++++++++++++++++++++++
 7 files changed, 214 insertions(+), 2 deletions(-)
---
base-commit: 16f014a645fb35303b8fd3305f23f8ecd3f2f2a6
change-id: 20251203-panthor-tracepoints-488af09d46e7

Best regards,
-- 
Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

