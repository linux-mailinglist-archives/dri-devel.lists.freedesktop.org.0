Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9EA44693C
	for <lists+dri-devel@lfdr.de>; Fri,  5 Nov 2021 20:40:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 677626ECDC;
	Fri,  5 Nov 2021 19:40:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EX13-EDG-OU-002.vmware.com (ex13-edg-ou-002.vmware.com
 [208.91.0.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 231B46EB25
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Nov 2021 19:40:44 +0000 (UTC)
Received: from sc9-mailhost1.vmware.com (10.113.161.71) by
 EX13-EDG-OU-002.vmware.com (10.113.208.156) with Microsoft SMTP Server id
 15.0.1156.6; Fri, 5 Nov 2021 12:40:35 -0700
Received: from vmware.com (unknown [10.21.244.23])
 by sc9-mailhost1.vmware.com (Postfix) with ESMTP id 788FB205B8;
 Fri,  5 Nov 2021 12:40:42 -0700 (PDT)
From: Zack Rusin <zackr@vmware.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 0/6] Support module unload and hotunplug
Date: Fri, 5 Nov 2021 15:38:41 -0400
Message-ID: <20211105193845.258816-1-zackr@vmware.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (EX13-EDG-OU-002.vmware.com: zackr@vmware.com does not
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

v2: Introduces a TTM documentation change to clarify the discussion that
happened after the first version of this series was sent.
Also, removing pointless "unlikely" in the "Introduce a new placement for
MOB page tables" commit that Thomas noticed.

This is a largely trivial set that makes vmwgfx support module reload
and PCI hot-unplug. It also makes IGT's core_hotunplug pass instead
of kernel oops'ing.

Cc: Christian König <christian.koenig@amd.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Zack Rusin (6):
  drm/vmwgfx: Remove the deprecated lower mem limit
  drm/vmwgfx: Release ttm memory if probe fails
  drm/vmwgfx: Fail to initialize on broken configs
  drm/vmwgfx: Introduce a new placement for MOB page tables
  drm/vmwgfx: Switch the internal BO's to ttm_bo_type_kernel
  drm/ttm: Clarify that the TTM_PL_SYSTEM buffers need to stay idle

 drivers/gpu/drm/vmwgfx/Makefile               |  2 +-
 drivers/gpu/drm/vmwgfx/ttm_memory.c           | 99 +------------------
 drivers/gpu/drm/vmwgfx/ttm_memory.h           |  6 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c            |  2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c           |  7 ++
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c           | 40 +++++---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h           | 12 ++-
 .../gpu/drm/vmwgfx/vmwgfx_system_manager.c    | 90 +++++++++++++++++
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c    | 58 +++++------
 include/drm/ttm/ttm_placement.h               | 10 ++
 10 files changed, 174 insertions(+), 152 deletions(-)
 create mode 100644 drivers/gpu/drm/vmwgfx/vmwgfx_system_manager.c

-- 
2.32.0

