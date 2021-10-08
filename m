Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF2F426F95
	for <lists+dri-devel@lfdr.de>; Fri,  8 Oct 2021 19:31:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E961D6E0FC;
	Fri,  8 Oct 2021 17:31:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EX13-EDG-OU-001.vmware.com (ex13-edg-ou-001.vmware.com
 [208.91.0.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94FAC6E0FC
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Oct 2021 17:31:50 +0000 (UTC)
Received: from sc9-mailhost2.vmware.com (10.113.161.72) by
 EX13-EDG-OU-001.vmware.com (10.113.208.155) with Microsoft SMTP Server id
 15.0.1156.6; Fri, 8 Oct 2021 10:31:43 -0700
Received: from vmware.com (unknown [10.21.244.180])
 by sc9-mailhost2.vmware.com (Postfix) with ESMTP id D5C0D204A4;
 Fri,  8 Oct 2021 10:31:47 -0700 (PDT)
From: Zack Rusin <zackr@vmware.com>
To: <dri-devel@lists.freedesktop.org>
CC: Zack Rusin <zackr@vmware.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, =?UTF-8?q?Thomas=20Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>
Subject: [PATCH 0/5] drm/vmwgfx: Support module unload and hotunplug
Date: Fri, 8 Oct 2021 13:31:41 -0400
Message-ID: <20211008173146.645127-1-zackr@vmware.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (EX13-EDG-OU-001.vmware.com: zackr@vmware.com does not
 designate permitted sender hosts)
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

This is a largely trivial set that makes vmwgfx support module reload
and PCI hot-unplug. It also makes IGT's core_hotunplug pass instead
of kernel oops'ing.

The one "ugly" change is the "Introduce a new placement for MOB page
tables". It seems vmwgfx has been violating a TTM assumption that
TTM_PL_SYSTEM buffers are never fenced for a while. Apart from a kernel
oops on module unload it didn't seem to wreak too much havoc, but we
shouldn't be abusing TTM. So to solve it we're introducing a new
placement, which is basically system, but can deal with fenced bo's.

Cc: Christian König <christian.koenig@amd.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Zack Rusin (5):
  drm/vmwgfx: Remove the deprecated lower mem limit
  drm/vmwgfx: Release ttm memory if probe fails
  drm/vmwgfx: Fail to initialize on broken configs
  drm/vmwgfx: Introduce a new placement for MOB page tables
  drm/vmwgfx: Switch the internal BO's to ttm_bo_type_kernel

 drivers/gpu/drm/vmwgfx/Makefile               |  2 +-
 drivers/gpu/drm/vmwgfx/ttm_memory.c           | 99 +------------------
 drivers/gpu/drm/vmwgfx/ttm_memory.h           |  6 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c            |  2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c           |  7 ++
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c           | 40 +++++---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h           | 12 ++-
 .../gpu/drm/vmwgfx/vmwgfx_system_manager.c    | 90 +++++++++++++++++
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c    | 58 +++++------
 9 files changed, 164 insertions(+), 152 deletions(-)
 create mode 100644 drivers/gpu/drm/vmwgfx/vmwgfx_system_manager.c

-- 
2.30.2

