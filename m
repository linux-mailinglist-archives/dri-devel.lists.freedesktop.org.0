Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 939BA39373D
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 22:38:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3045F6F4C3;
	Thu, 27 May 2021 20:38:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9137C6F4C2
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 20:38:22 +0000 (UTC)
Received: from localhost.localdomain (unknown [IPv6:2600:8800:8c09:5500::19dc])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: alyssa)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 1E6DD1F43DF3;
 Thu, 27 May 2021 21:38:19 +0100 (BST)
From: alyssa.rosenzweig@collabora.com
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/4] drm/panfrost: Plumb cycle counters to userspace
Date: Thu, 27 May 2021 16:38:00 -0400
Message-Id: <20210527203804.12914-1-alyssa.rosenzweig@collabora.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: tomeu.vizoso@collabora.com, airlied@linux.ie, steven.price@arm.com,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>

Mali has hardware cycle counters (and GPU timestamps) available for
profiling. These are exposed in various ways:

- Kernel: As CYCLE_COUNT and TIMESTAMP registers 
- Job chain: As WRITE_VALUE descriptors
- Shader (Midgard): As LD_SPECIAL selectors
- Shader (Bifrost): As the LD_GCLK.u64 instruction

These form building blocks for profiling features, for example the
ARB_shader_clock extension which accesses the counters from an
application's shader.

The counters consume power, so it is recommended to disable the counters
when not in use. To do so, we follow the strategy from mali_kbase: add a
counter requirement to the job, start the counters only when required,
and stop them as quickly as possible.

The new UABI will be used in Mesa. An implementation of ARB_shader_clock
using this UABI is available as a pending upstream merge request [1].
The implementation passes the relevant piglit test, validating both the
kernel and mesa.

The main outstanding questing is the proper name. Performance monitoring
("PERMON") is the name used by kbase, but it's jargon-y and risks
confusion with performance counters, an orthogonal mechanism. Cycle
count is more descriptive and matches the actual hardware name, but
obscures that the same mechanism is required for GPU timestamps. This
bit of bikeshedding aside, I'm pleased with the patches.

[1] https://gitlab.freedesktop.org/mesa/mesa/merge_requests/11051

Alyssa Rosenzweig (4):
  drm/panfrost: Add cycle counter job requirement
  drm/panfrost: Add CYCLE_COUNT_START/STOP commands
  drm/panfrost: Add permon acquire/release helpers
  drm/panfrost: Handle PANFROST_JD_REQ_PERMON

 drivers/gpu/drm/panfrost/panfrost_device.h |  3 +++
 drivers/gpu/drm/panfrost/panfrost_drv.c    | 10 +++++++---
 drivers/gpu/drm/panfrost/panfrost_gpu.c    | 20 ++++++++++++++++++++
 drivers/gpu/drm/panfrost/panfrost_gpu.h    |  3 +++
 drivers/gpu/drm/panfrost/panfrost_job.c    |  6 ++++++
 drivers/gpu/drm/panfrost/panfrost_regs.h   |  2 ++
 include/uapi/drm/panfrost_drm.h            |  3 ++-
 7 files changed, 43 insertions(+), 4 deletions(-)

-- 
2.30.2

