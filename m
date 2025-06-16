Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D0BADB89F
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jun 2025 20:15:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4C6B10E420;
	Mon, 16 Jun 2025 18:15:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="PpKrbbTW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABC8F10E423;
 Mon, 16 Jun 2025 18:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vDKcW68nzROUj9CbHR0FyUYWXknhrv44YLJ1qPZX0+0=; b=PpKrbbTWxEZovYBMAIrzJBDH+T
 vp7VyvpfLx6c59EjZciDSaNTp3n3mnwVTXfKefVGnm/rRD/r/wdSJl82HwxqY5E2e/oJmqQXo09MM
 ME3kjsugkBIhWb3E4hvHM3+b9TkCFyiOhbVhnRjRQHoGQA1/fSaYMQB/xRLYEU6Xfsc+1wOYUjZRP
 gstaU4CflbOXWQAA6iWXlAxMxRlAXEg1KcyTiEYPZ0K56W3oGqxovS/7gTBLxbREqBpYRKXkqIpZ+
 3WFugXmi3AV61B7ImMOC7k4A7BDvllYH2065J/Qnw8qF9S5TMkesWWTXDbXzzLfYEx0No3oIyryj9
 myFKVQ8g==;
Received: from [191.204.192.64] (helo=localhost.localdomain)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uREMW-004Eh6-2G; Mon, 16 Jun 2025 20:15:16 +0200
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: "Alex Deucher" <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 siqueira@igalia.com, airlied@gmail.com, simona@ffwll.ch,
 "Raag Jadav" <raag.jadav@intel.com>, rodrigo.vivi@intel.com,
 jani.nikula@linux.intel.com, Xaver Hugl <xaver.hugl@gmail.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com, amd-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
Subject: [PATCH v8 0/6] drm: Create a task info option for wedge events
Date: Mon, 16 Jun 2025 15:14:32 -0300
Message-ID: <20250616181438.2124656-1-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patchset implements a request made by Xaver Hugl about wedge events:

"I'd really like to have the PID of the client that triggered the GPU
reset, so that we can kill it if multiple resets are triggered in a
row (or switch to software rendering if it's KWin itself) and show a
user-friendly notification about why their app(s) crashed, but that
can be added later."

From https://lore.kernel.org/dri-devel/CAFZQkGwJ4qgHV8WTp2=svJ_VXhb-+Y8_VNtKB=jLsk6DqMYp9w@mail.gmail.com/

For testing, I've used amdgpu's debug_mask options debug_disable_soft_recovery
and debug_disable_gpu_ring_reset to test both wedge event paths in the driver.
To trigger a ring timeout, I've used this app:
https://gitlab.freedesktop.org/andrealmeid/gpu-timeout

Thanks!

Changelog:

v8:
 - New patch "Allow NULL pointers at amdgpu_vm_put_task_info()"
 - Dropped inline for amdgpu_vm_print_task_info()
 - Code style changes for "Create a task info option for wedge events"
 - Drop check before calling amdgpu_vm_put_task_info()

v7:
 - Change `char *comm` to `char comm[TASK_COMM_LEN]`
 - New patches to encapsulate struct drm_wedge_task_info inside of struct
   amdgpu_task_info
 - Remove struct cast for struct amdgpu_task_info, now we can use `info =
   &ti->task`
 - Fix struct lifetime, move amdgpu_vm_put_task_info() after
   drm_dev_wedged_event() call

v6:
 - Check if PID >= 0 for displaying the task info
 - s/app/task in a comment

v5:
 - Change from app to task also in structs, commit message and docs
 - Add a check for NULL or empty task name string

v4:
 - Change from APP to TASK
 - Add defines for event_string and pid_string length

v3:
 - Make comm_string and pid_string empty when there's no app info
 - Change "app that caused ..." to "app involved ..."
 - Clarify that devcoredump have more information about what happened

v2:
  - Rebased on top of drm/drm-next
  - Added new patch for documentation

André Almeida (6):
  drm: amdgpu: Allow NULL pointers at amdgpu_vm_put_task_info()
  drm: amdgpu: Create amdgpu_vm_print_task_info()
  drm: Create a task info option for wedge events
  drm/doc: Add a section about "Task information" for the wedge API
  drm: amdgpu: Use struct drm_wedge_task_info inside of struct
    amdgpu_task_info
  drm/amdgpu: Make use of drm_wedge_task_info

 Documentation/gpu/drm-uapi.rst                | 17 ++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c   |  2 +-
 .../gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c  |  4 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    | 13 +++++++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c       |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c       | 11 +++++-----
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c        | 22 ++++++++++++++-----
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h        |  6 +++--
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c        |  5 +----
 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c        |  5 +----
 drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c        |  5 +----
 drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c         |  4 +---
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c         |  5 +----
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c        |  2 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c      |  2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_events.c       |  2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c   |  8 +++----
 drivers/gpu/drm/drm_drv.c                     | 21 ++++++++++++++----
 drivers/gpu/drm/i915/gt/intel_reset.c         |  3 ++-
 drivers/gpu/drm/xe/xe_device.c                |  3 ++-
 include/drm/drm_device.h                      |  9 ++++++++
 include/drm/drm_drv.h                         |  3 ++-
 22 files changed, 103 insertions(+), 51 deletions(-)

-- 
2.49.0

