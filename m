Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A31EBCB3250
	for <lists+dri-devel@lfdr.de>; Wed, 10 Dec 2025 15:31:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7710E10E177;
	Wed, 10 Dec 2025 14:31:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="aDhczwz4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C3BC10E74C
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Dec 2025 14:31:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1765377049; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=U5gHm0oq74xPZBEsDxarjYdNj36uIV1gNNpPXSpNIipgafo+LGy1GyGNMs4LZC2gK00J2ORufGNNHPg0IH0/zCOQArTQDKVKtOkVEOmIzl1XKNxeKjo9+MTvPBuKwogXk8uBnGRd0K/v85aY+LebnytqpOBRNYW/wRNA7dTxCho=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1765377049;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=0HnmsETSFLDq3Xjgq+bdcSqYYtmRqRH3eJ3a2M4Wdng=; 
 b=AYmIk2hQIJEymbNcwv6BSGlC3CFkVyvesfCvcP9KWWeC5VIbPaed44rXLGhP6jK9B2DyFAt+AlSZIfmxPYG89cEz0S0u/oxM3sCyw6ziqBZdGWFbdOUSBJk+21XJdK733UK0Ed10HiznoFJrcHz53af9EuaxP2BTj3dnVVSMX6M=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1765377049; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
 bh=0HnmsETSFLDq3Xjgq+bdcSqYYtmRqRH3eJ3a2M4Wdng=;
 b=aDhczwz4yQGO12iBZTPS9PH7fxGNBd4K8Dvz9+wMLOig7H0D7js5s+QYjnmT5tPr
 sCdO1fOCGSYJUYn2/9pFSeB8tdhe5To6eipjRVPhGl9zKtsY9WieqiGRwiz7UifgEwf
 JLaED44CTnlwQdM/HKScTtD3XfvB6tq90B/m6x1o=
Received: by mx.zohomail.com with SMTPS id 1765377046673959.3859467811806;
 Wed, 10 Dec 2025 06:30:46 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: [PATCH v2 0/4] Add a few tracepoints to panthor
Date: Wed, 10 Dec 2025 15:30:36 +0100
Message-Id: <20251210-panthor-tracepoints-v2-0-ace2e29bad0f@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAyEOWkC/32OQQ6CMBBFr0JmbbVFlMLKexgWpQwyiVCcVqIh3
 N0Krl1N3iTv/z+DRyb0UCYzME7kyQ0R0l0CtjPDDQU1kSGV6Uml8ihGM4TOsQhsLI6OhuBFprV
 pZdFkZ8whmiNjS6819VptzPh4xvCwPaE2HoV1fU+hTBruRaDx8LvwVTrywfF73TWp1fk7YVJCC
 p0rqwuVo9TZxbr73dSOzT72QLUsywccY0UF7QAAAA==
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
is done by reading four hardware registers when a certain IRQ fires.

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
      drm/panthor: Add panthor_*_irq_mask_set helper
      drm/panthor: Add SHADER_PWRFEATURES register definition
      drm/panthor: Add tracepoint for hardware utilisation changes
      drm/panthor: Add gpu_job_irq tracepoint

 drivers/gpu/drm/panthor/panthor_device.h |  7 +++
 drivers/gpu/drm/panthor/panthor_fw.c     | 13 +++++
 drivers/gpu/drm/panthor/panthor_gpu.c    | 96 +++++++++++++++++++++++++++++++-
 drivers/gpu/drm/panthor/panthor_regs.h   |  2 +
 drivers/gpu/drm/panthor/panthor_trace.h  | 90 ++++++++++++++++++++++++++++++
 5 files changed, 206 insertions(+), 2 deletions(-)
---
base-commit: 8362fcabaa24e5d632c7d0fa35f74103e74e8850
change-id: 20251203-panthor-tracepoints-488af09d46e7

Best regards,
-- 
Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

