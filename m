Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 667EE3318E6
	for <lists+dri-devel@lfdr.de>; Mon,  8 Mar 2021 21:55:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EB4F6E875;
	Mon,  8 Mar 2021 20:55:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EX13-EDG-OU-002.vmware.com (ex13-edg-ou-002.vmware.com
 [208.91.0.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A44246E3D0
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Mar 2021 20:54:59 +0000 (UTC)
Received: from sc9-mailhost1.vmware.com (10.113.161.71) by
 EX13-EDG-OU-002.vmware.com (10.113.208.156) with Microsoft SMTP Server id
 15.0.1156.6; Mon, 8 Mar 2021 12:54:56 -0800
Received: from vertex.localdomain (unknown [10.16.119.57])
 by sc9-mailhost1.vmware.com (Postfix) with ESMTP id 487EF2040A;
 Mon,  8 Mar 2021 12:54:57 -0800 (PST)
From: Zack Rusin <zackr@vmware.com>
To: <linux-kernel@vger.kernel.org>
Subject: [PATCH 0/2] locking/rwsem: Add down_write_interruptible and use it
Date: Mon, 8 Mar 2021 15:54:54 -0500
Message-ID: <20210308205456.1317366-1-zackr@vmware.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 Roland Scheidegger <sroland@vmware.com>, dri-devel@lists.freedesktop.org,
 Martin Krastev <krastevm@vmware.com>, Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

vmwgfx has really ugly implemention of an interruptible lock trying
to match rw sem semantics. By adding a small bit of code implementing
down_write_interruptible to rwsem which already supported
down_read_interruptible we can completely remove all of the custom
code from vmwgfx.

Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Will Deacon <will@kernel.org>
Cc: Martin Krastev <krastevm@vmware.com>
Cc: Roland Scheidegger <sroland@vmware.com>
Cc: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org

Zack Rusin (2):
  locking/rwsem: Add down_write_interruptible
  drm/vmwgfx: Remove custom locking code

 drivers/gpu/drm/vmwgfx/Makefile               |   2 +-
 drivers/gpu/drm/vmwgfx/ttm_lock.c             | 194 ----------------
 drivers/gpu/drm/vmwgfx/ttm_lock.h             | 218 ------------------
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c            |  24 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_context.c       |   4 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c           |  57 +----
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h           |  32 ++-
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c       |   4 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_fb.c            |  10 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ioctl.c         |   8 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c           |   4 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_resource.c      |   8 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_shader.c        |   4 +-
 .../gpu/drm/vmwgfx/vmwgfx_simple_resource.c   |   4 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c       |  16 +-
 include/linux/rwsem.h                         |   1 +
 kernel/locking/rwsem.c                        |  23 ++
 17 files changed, 98 insertions(+), 515 deletions(-)
 delete mode 100644 drivers/gpu/drm/vmwgfx/ttm_lock.c
 delete mode 100644 drivers/gpu/drm/vmwgfx/ttm_lock.h

-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
