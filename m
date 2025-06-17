Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF9FADC821
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 12:26:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7548F10E5E0;
	Tue, 17 Jun 2025 10:26:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from rtg-sunil-navi33.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 354B010E5E5;
 Tue, 17 Jun 2025 10:26:31 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (localhost [127.0.0.1])
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id
 55HAQKVU2441140; Tue, 17 Jun 2025 15:56:20 +0530
Received: (from sunil@localhost)
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Submit) id 55HAQKRJ2441139;
 Tue, 17 Jun 2025 15:56:20 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org, Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH v3 0/4] Add support of VM PT and MQD per client-id
Date: Tue, 17 Jun 2025 15:56:15 +0530
Message-Id: <20250617102619.2441095-1-sunil.khatri@amd.com>
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

The set of patches rearranges the debugfs related code in the drm
subsystem to better manager the root node "dri". Since the dentry
for the "dri" is needed in other functionality so the task is necessary.

Over the above amdgpu VM PT support along with User queues MQD dumping
support is added based on per client-id as that is a unique no across
devices and unlike PID it is more reliable.

Sunil Khatri (4):
  drm: move debugfs functionality from drm_drv.c to drm_debugfs.c
  drm: add debugfs support on per client-id basis
  drm/amdgpu: add debugfs support for VM pagetable per client
  drm/amdgpu: add support of debugfs for mqd information

 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c   |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c | 50 +++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c    | 58 +++++++++++++++++++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h    |  4 +-
 drivers/gpu/drm/drm_debugfs.c             | 59 +++++++++++++++++++++--
 drivers/gpu/drm/drm_drv.c                 | 11 ++---
 drivers/gpu/drm/drm_file.c                | 10 ++++
 drivers/gpu/drm/drm_internal.h            |  6 +--
 include/drm/drm_debugfs.h                 | 12 +++++
 include/drm/drm_device.h                  |  4 ++
 include/drm/drm_drv.h                     | 10 ++++
 include/drm/drm_file.h                    |  7 +++
 12 files changed, 215 insertions(+), 18 deletions(-)

-- 
2.34.1

