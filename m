Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB69CB670D
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 17:16:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47B3310E814;
	Thu, 11 Dec 2025 16:16:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="AXQruz8+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8986710E2DB
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 16:16:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1765469761; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=JRC9TTTk7ivce09mfx9r+Lm8STMUEcldj5LMB1JctiUgLxerzNvGNLMcU/fSDaljtDBTWbFDnKBYLewAa8CUYZAotERnDoo7tr7qNlTx5lsj6zKDlvOoiwvbPFdJQexJL1QXgtfXjbMgHGaEe5oe2BggZhLPthmoMXiIqF4VokY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1765469761;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=JiN7+WmFR/BEvsDyqOmJNNXU/EA7tG/mo26wtMdMTjM=; 
 b=XxOR6TzEH3KWT24JNwsaL7nyomE+cQufxYVqKXWdEWsvGEXHQI6i5FYCcbQy7GBYCHxVyaRnpM/a/001ob9LsrZT9Y7DFV9/ZoiETzYcCfuT4Fn4tU2oT5vY8Wa74WhTghtXQlM9LhbYUnMtLY1sIyLaJ7U1IYyZLy1Lh9PiM9o=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1765469761; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
 bh=JiN7+WmFR/BEvsDyqOmJNNXU/EA7tG/mo26wtMdMTjM=;
 b=AXQruz8+G0JfKvkqrkYfHdtkV0mt4ZYsEcDvkD8kEMMROcPHf+GymcO2yuPrjWfo
 hfuydbvGZb55C0UB6EzMyXVJ11C0GsqCmdZtwFyDVurBAJP921id4Fnam6Mdmqbofu1
 6ecvKFDGcwCmTlQWqMqLYVShYXQUfsPmPZ+i7MUI=
Received: by mx.zohomail.com with SMTPS id 1765469758925478.4331588496592;
 Thu, 11 Dec 2025 08:15:58 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: [PATCH v3 0/3] Add a few tracepoints to panthor
Date: Thu, 11 Dec 2025 17:15:34 +0100
Message-Id: <20251211-panthor-tracepoints-v3-0-924c9d356a5c@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACbuOmkC/32OQQ6CMBBFr0K6ttpWlMLKexgXpQwyCVCcVqIx3
 N0KLowxriZvkv/+fzAPhOBZkTwYwYgeXR9hu0qYbUx/Bo5VZKaE2kkltnwwfWgc8UDGwuCwD56
 nWpta5FW6h4zF5EBQ4222Hk8LE1yuUR6WJyuNB25d12Eokoo6HnDYvC97RRr0wdF93jXKOfN3w
 ii54DqTVucyA6HTg3Vta0pHZh17ZueoPjxS/Pao6ImoQOWlqUT97Zmm6QlxoCxmNQEAAA==
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
 drivers/gpu/drm/panthor/panthor_trace.h  | 87 ++++++++++++++++++++++++++++++++
 7 files changed, 215 insertions(+), 2 deletions(-)
---
base-commit: f8da8e7cee8489b7d7d92d34adf1bd8be14cf527
change-id: 20251203-panthor-tracepoints-488af09d46e7

Best regards,
-- 
Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

