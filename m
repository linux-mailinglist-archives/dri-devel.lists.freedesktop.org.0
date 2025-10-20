Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B237BF3367
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 21:33:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B010010E4CA;
	Mon, 20 Oct 2025 19:33:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="N9ftvfTI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2208B10E4CA
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 19:33:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 9BE9B463CD;
 Mon, 20 Oct 2025 19:33:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F0D5C113D0;
 Mon, 20 Oct 2025 19:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760988820;
 bh=PkFoyVqTYJPVX0d9XsVCFhOxPHX3dsEmwGcy6ZBb+vo=;
 h=From:Subject:Date:To:Cc:From;
 b=N9ftvfTIeA0viVT31Y2ZDvVS2mbmMwBF5NTOFK/atMt1gb1Dddjejz5NpFXzP3imq
 1fDy2kFuucFfSK3XkDEsUzp0ongrE4nqY7AI90d+2nn7WLNeYgzI/BhyXqZDYqZq9E
 CftmreZomQbgNrpzVutGspFq2Krj5vfJ+Vj9+QHL4tPw80lDbJl2N6FOFL8IqaHjNA
 TOACSGxUueRa2k0XgvAxEP1qRtTMqNV8JvGmnRM8ZvEmJKlV2L67qwMYAhUzF47cVv
 9F1nGfwhKHcBL77dmZjw5sCaJouUsk264rKWH5QBHZBJLF530izVMkwCrcIqUwKkjE
 /Ro9xcKGOlJ3A==
From: "Rob Herring (Arm)" <robh@kernel.org>
Subject: [PATCH v6 0/2] accel: Add Arm Ethos-U NPU
Date: Mon, 20 Oct 2025 14:33:26 -0500
Message-Id: <20251020-ethos-v6-0-ecebc383c4b7@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIaO9mgC/2XPTU4DMQwF4KtUWRNkO5O0YcU9EIv8OJ0INIOSK
 gJVc3fSqp2CZvksf8/yWVQumat42Z1F4ZZrnqcezNNOhNFNR5Y59iwISMMeteTTOFepUozKcjI
 Jrei7X4VT/r72vL33POZ6msvPtbbhZXprILo1NJQgQ8CgHQTvk3/94DLx5/NcjuJS0ejBDoh3R
 p05QpuCJmf1lqkHs2TuTHVmfKRB7RUPSW/YsDKE9c02dHbAPnQqBp/Uhum/bL2mO/MOHAcGB2D
 +sWVZfgGREJZjdwEAAA==
X-Change-ID: 20250715-ethos-3fdd39ef6f19
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Robin Murphy <robin.murphy@arm.com>, Steven Price <steven.price@arm.com>, 
 Daniel Stone <daniel@fooishbar.org>, Frank Li <Frank.li@nxp.com>, 
 Sui Jingfeng <sui.jingfeng@linux.dev>, 
 Matthew Brost <matthew.brost@intel.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15-dev
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

The Arm Ethos-U65/85 NPUs are designed for edge AI inference 
applications[0].

The driver works with Mesa Teflon. The Ethos support was merged on 
10/15. The UAPI should also be compatible with the downstream (open 
source) driver stack[2] and Vela compiler though that has not been 
implemented.

Testing so far has been on i.MX93 boards with Ethos-U65 and a FVP model 
with Ethos-U85. More work is needed in mesa for handling U85 command 
stream differences, but that doesn't affect the UAPI.

A git tree is here[3].

Rob

[0] https://www.arm.com/products/silicon-ip-cpu?families=ethos%20npus
[2] https://gitlab.arm.com/artificial-intelligence/ethos-u/
[3] git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git ethos-v6

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
Changes in v6:
- Rework job submit to avoid potential deadlocks with allocations/reclaim
  in the fence signaling paths. ethosu_acquire_object_fences() and the job
  done_fence allocation are moved earlier. The runtime-pm resume now before
  the job is pushed and autosuspend is done when the job is freed.
- Drop unused ethosu_job_is_idle()
- Link to v5: https://lore.kernel.org/r/20251016-ethos-v5-0-ba0aece0a006@kernel.org

Changes in v5:
- Rework Runtime PM init in probe
- Use __free() cleanups where possible
- Use devm_mutex_init()
- Handle U85 NPU_SET_WEIGHT2_BASE and NPU_SET_WEIGHT2_LENGTH
- Link to v4: https://lore.kernel.org/r/20251015-ethos-v4-0-81025a3dcbf3@kernel.org

Changes in v4:
- Use bulk clk API
- Various whitespace fixes mostly due to ethos->ethosu rename
- Drop error check on dma_set_mask_and_coherent()
- Drop unnecessary pm_runtime_mark_last_busy() call
- Move variable declarations out of switch (a riscv/clang build failure)
- Use lowercase hex in all defines
- Drop unused ethosu_device.coherent member
- Add comments on all locks
- Link to v3: https://lore.kernel.org/r/20250926-ethos-v3-0-6bd24373e4f5@kernel.org

Changes in v3:
- Rework and improve job submit validation                                                            
- Rename ethos to ethosu. There was an Ethos-Nxx that's unrelated.
- Add missing init for sched_lock mutex
- Drop some prints to debug level          
- Fix i.MX93 SRAM accesses (AXI config)
- Add U85 AXI configuration and test on FVP with U85
- Print the current cmd value on timeout                                                              
- Link to v2: https://lore.kernel.org/r/20250811-ethos-v2-0-a219fc52a95b@kernel.org

Changes in v2:
- Rebase on v6.17-rc1 adapting to scheduler changes
- scheduler: Drop the reset workqueue. According to the scheduler docs,
  we don't need it since we have a single h/w queue.
- scheduler: Rework the timeout handling to continue running if we are
  making progress. Fixes timeouts on larger jobs.
- Reset the NPU on resume so it's in a known state
- Add error handling on clk_get() calls
- Fix drm_mm splat on module unload. We were missing a put on the
  cmdstream BO in the scheduler clean-up.
- Fix 0-day report needing explicit bitfield.h include
- Link to v1: https://lore.kernel.org/r/20250722-ethos-v1-0-cc1c5a0cbbfb@kernel.org

---
Rob Herring (Arm) (2):
      dt-bindings: npu: Add Arm Ethos-U65/U85
      accel: Add Arm Ethos-U NPU driver

 .../devicetree/bindings/npu/arm,ethos.yaml         |  79 +++
 MAINTAINERS                                        |   9 +
 drivers/accel/Kconfig                              |   1 +
 drivers/accel/Makefile                             |   1 +
 drivers/accel/ethosu/Kconfig                       |  10 +
 drivers/accel/ethosu/Makefile                      |   4 +
 drivers/accel/ethosu/ethosu_device.h               | 195 ++++++
 drivers/accel/ethosu/ethosu_drv.c                  | 403 ++++++++++++
 drivers/accel/ethosu/ethosu_drv.h                  |  15 +
 drivers/accel/ethosu/ethosu_gem.c                  | 704 +++++++++++++++++++++
 drivers/accel/ethosu/ethosu_gem.h                  |  46 ++
 drivers/accel/ethosu/ethosu_job.c                  | 496 +++++++++++++++
 drivers/accel/ethosu/ethosu_job.h                  |  40 ++
 include/uapi/drm/ethosu_accel.h                    | 261 ++++++++
 14 files changed, 2264 insertions(+)
---
base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
change-id: 20250715-ethos-3fdd39ef6f19

Best regards,
--  
Rob Herring (Arm) <robh@kernel.org>

