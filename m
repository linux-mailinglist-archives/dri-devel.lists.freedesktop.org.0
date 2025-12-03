Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A2EC9F33D
	for <lists+dri-devel@lfdr.de>; Wed, 03 Dec 2025 14:56:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C3CE10E172;
	Wed,  3 Dec 2025 13:56:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="jOyCEdoS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4214C10E157
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Dec 2025 13:56:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1764770200; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=MfD7HeTOAfYFqPdNWb5To4kAsLSZdylqnYbA4drXn2sqgy/7zMx/4xY/7cVLKdGv+SQJVqUm7v3TYG0eFQlE1QqKUSNSeNF0BmEmSlQ+3ue5RiVyVgpwxGVEnJl2iI/NiO6l7ZppkJVIo+Mfzrj9Xr75XXpMmSWVt7grFLUghz4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1764770200;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=HoysW/1n7TBBKdA+MT51tASVcRfCXJFPQ7yjinrjBI8=; 
 b=dkS00fGiW5vxCwaniU5GMplhDtIiz85YUUhVCvPARrfCceR2EuvkpUyq0U7ftE8Wek9YpTzDlDiH+v/F2yShSIav4C2bqSZNgcFo7jLun++Xwawmu1gn8qowQcpR4a9AIUcIW5RJngEH1t67V6XyC5WBT4vw1gCe+IBGORiNpUQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1764770200; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
 bh=HoysW/1n7TBBKdA+MT51tASVcRfCXJFPQ7yjinrjBI8=;
 b=jOyCEdoSTS2Wu00ieCGRZq61Y3A0eFguWVbtiVTG5KuV1KI3JFYhfbUjG0Cp2twz
 0otX7lKUr6gABa34EVnZotfsJUqESU6giL7XRUtUy0Uh0t9BWgJffyVvM8VVohFtWsU
 62wItE6zqDHP38dZUIz+X0dd5GwZ1aN8DlQKQ5NQ=
Received: by mx.zohomail.com with SMTPS id 1764770200324374.5408172125982;
 Wed, 3 Dec 2025 05:56:40 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: [PATCH 0/2] Add a few tracepoints to panthor
Date: Wed, 03 Dec 2025 14:56:21 +0100
Message-Id: <20251203-panthor-tracepoints-v1-0-871c8917e084@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIVBMGkC/y2Myw6CMBBFf4XM2sZSUZFfMSxqO8gs+mA6GhPCv
 9uIq5tzk3NWKMiEBYZmBcY3FUqxQntowM02PlGRrwxGm3Nr9EllG2VOrIStw5woSlFd39tJ33x
 3wStUMzNO9PlV7+POjMurxmU/4WELKpdCIBkaz0EJ5eN/Ydy2Lwj9PraYAAAA
X-Change-ID: 20251203-panthor-tracepoints-488af09d46e7
To: Boris Brezillon <boris.brezillon@collabora.com>, 
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
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

The first tracepoint allows for inspecting utilisation of the hardware
subdivisions, e.g. how many shader cores are active. This is done by
reading three hardware registers when a certain IRQ fires.

The second tracepoint instruments panthor's job IRQ handler. This is
more useful than the generic interrupt tracing functionality, as the
tracepoint has the events bit mask included, which indicates which
command stream group interfaces triggered the interrupt.

To test the tracepoints, the following can be used:

  :~# echo 1 > /sys/kernel/tracing/events/panthor/gpu_power_active/enable
  :~# echo 1 > /sys/kernel/tracing/events/panthor/gpu_job_irq/enable
  :~# echo 1 > /sys/kernel/tracing/tracing_on
  :~# cat /sys/kernel/tracing/trace_pipe

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
Nicolas Frattaroli (2):
      drm/panthor: Add tracepoint for hardware utilisation changes
      drm/panthor: Add gpu_job_irq tracepoint

 drivers/gpu/drm/panthor/panthor_device.c |  1 +
 drivers/gpu/drm/panthor/panthor_fw.c     | 13 +++++++
 drivers/gpu/drm/panthor/panthor_gpu.c    |  9 +++++
 drivers/gpu/drm/panthor/panthor_trace.h  | 62 ++++++++++++++++++++++++++++++++
 4 files changed, 85 insertions(+)
---
base-commit: 6ef847703ac6da2deaaf735ce95369ba25c2c432
change-id: 20251203-panthor-tracepoints-488af09d46e7

Best regards,
-- 
Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

