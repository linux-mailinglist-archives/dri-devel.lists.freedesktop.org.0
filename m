Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE97CAF0091
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 18:50:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0970C10E5ED;
	Tue,  1 Jul 2025 16:50:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from rtg-sunil-navi33.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F129E10E5E9;
 Tue,  1 Jul 2025 16:50:15 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (localhost [127.0.0.1])
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id
 561GnrNp008154; Tue, 1 Jul 2025 22:19:53 +0530
Received: (from sunil@localhost)
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Submit) id 561Gnokr008135;
 Tue, 1 Jul 2025 22:19:50 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org, simona@ffwll.ch, tzimmermann@suse.de,
 tursulin@ursulin.net, phasta@kernel.org, dakr@kernel.org,
 linux-kernel@vger.kernel.org, Oded Gabbay <ogabbay@kernel.org>,
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>, Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH v9 0/4] Enable debugfs information based on client-id
Date: Tue,  1 Jul 2025 22:19:44 +0530
Message-Id: <20250701164948.8105-1-sunil.khatri@amd.com>
X-Mailer: git-send-email 2.34.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

client-id is a unique id across the system no matter if its from a VM
or on a host system. This unique id is a good base to use create
client-id based dentry in debugfs in the root directory.

This directory could be a unique directory where drivers could dump
the debug information.

For amdgpu driver, we want to dump the VM PTBASE address and MQD for 
userqueue which can be used by a tool like amd umr to dump the memory
and that is really important to debug userqueues and VM related issues.

One of the challenge in this how to access the root directory which is
beyond the drm_device hence moving the debugfs related information to
drm_debugfs.c 

Sunil Khatri (4):
  drm: move drm based debugfs funcs to drm_debugfs.c
  drm: add debugfs support on per client-id basis
  drm/amdgpu: add debugfs support for VM pagetable per client
  drm/amdgpu: add support of debugfs for mqd information

 drivers/accel/drm_accel.c                   |  16 ---
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c |  52 +++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.h |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c     |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c   |  52 +++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.h   |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c      |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h      |   4 +-
 drivers/gpu/drm/drm_debugfs.c               | 113 ++++++++++++++++++--
 drivers/gpu/drm/drm_drv.c                   |  14 +--
 drivers/gpu/drm/drm_file.c                  |   9 ++
 drivers/gpu/drm/drm_internal.h              |   6 +-
 include/drm/drm_accel.h                     |   5 -
 include/drm/drm_debugfs.h                   |  11 ++
 include/drm/drm_drv.h                       |  14 ++-
 include/drm/drm_file.h                      |   7 ++
 16 files changed, 265 insertions(+), 46 deletions(-)

-- 
2.34.1

