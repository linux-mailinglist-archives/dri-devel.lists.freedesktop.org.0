Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA8EA3318E7
	for <lists+dri-devel@lfdr.de>; Mon,  8 Mar 2021 21:55:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 627DF6E883;
	Mon,  8 Mar 2021 20:55:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EX13-EDG-OU-001.vmware.com (ex13-edg-ou-001.vmware.com
 [208.91.0.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 172106E883
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Mar 2021 20:55:02 +0000 (UTC)
Received: from sc9-mailhost1.vmware.com (10.113.161.71) by
 EX13-EDG-OU-001.vmware.com (10.113.208.155) with Microsoft SMTP Server id
 15.0.1156.6; Mon, 8 Mar 2021 12:54:57 -0800
Received: from vertex.localdomain (unknown [10.16.119.57])
 by sc9-mailhost1.vmware.com (Postfix) with ESMTP id CBDB52040A;
 Mon,  8 Mar 2021 12:54:58 -0800 (PST)
From: Zack Rusin <zackr@vmware.com>
To: <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/2] drm/vmwgfx: Remove custom locking code
Date: Mon, 8 Mar 2021 15:54:56 -0500
Message-ID: <20210308205456.1317366-3-zackr@vmware.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210308205456.1317366-1-zackr@vmware.com>
References: <20210308205456.1317366-1-zackr@vmware.com>
MIME-Version: 1.0
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
Cc: Martin Krastev <krastevm@vmware.com>,
 Roland Scheidegger <sroland@vmware.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

vmwgfx used a custom locking code to support semantics of a
interruptible rwsem. Now with down_(read|write)_interruptible
implemented in the rwsem we can completely remove the custom
locking code. It also allows us to remove the hacks we needed
to support proper waits for write resources before
hibernation.

Cc: Martin Krastev <krastevm@vmware.com>
Cc: Roland Scheidegger <sroland@vmware.com>
Cc: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
---
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
 15 files changed, 74 insertions(+), 515 deletions(-)
 delete mode 100644 drivers/gpu/drm/vmwgfx/ttm_lock.c
 delete mode 100644 drivers/gpu/drm/vmwgfx/ttm_lock.h

diff --git a/drivers/gpu/drm/vmwgfx/Makefile b/drivers/gpu/drm/vmwgfx/Makefile
index cc4cdca7176e..744a806918df 100644
--- a/drivers/gpu/drm/vmwgfx/Makefile
+++ b/drivers/gpu/drm/vmwgfx/Makefile
@@ -9,7 +9,7 @@ vmwgfx-y := vmwgfx_execbuf.o vmwgfx_gmr.o vmwgfx_kms.o vmwgfx_drv.o \
 	    vmwgfx_cotable.o vmwgfx_so.o vmwgfx_binding.o vmwgfx_msg.o \
 	    vmwgfx_simple_resource.o vmwgfx_va.o vmwgfx_blit.o \
 	    vmwgfx_validation.o vmwgfx_page_dirty.o vmwgfx_streamoutput.o \
-	    ttm_object.o ttm_lock.o
+	    ttm_object.o
 
 vmwgfx-$(CONFIG_TRANSPARENT_HUGEPAGE) += vmwgfx_thp.o
 obj-$(CONFIG_DRM_VMWGFX) := vmwgfx.o
diff --git a/drivers/gpu/drm/vmwgfx/ttm_lock.c b/drivers/gpu/drm/vmwgfx/ttm_lock.c
deleted file mode 100644
index 5971c72e6d10..000000000000
--- a/drivers/gpu/drm/vmwgfx/ttm_lock.c
+++ /dev/null
@@ -1,194 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 OR MIT */
-/**************************************************************************
- *
- * Copyright (c) 2007-2009 VMware, Inc., Palo Alto, CA., USA
- * All Rights Reserved.
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the
- * "Software"), to deal in the Software without restriction, including
- * without limitation the rights to use, copy, modify, merge, publish,
- * distribute, sub license, and/or sell copies of the Software, and to
- * permit persons to whom the Software is furnished to do so, subject to
- * the following conditions:
- *
- * The above copyright notice and this permission notice (including the
- * next paragraph) shall be included in all copies or substantial portions
- * of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL
- * THE COPYRIGHT HOLDERS, AUTHORS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM,
- * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
- * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
- * USE OR OTHER DEALINGS IN THE SOFTWARE.
- *
- **************************************************************************/
-/*
- * Authors: Thomas Hellstrom <thellstrom-at-vmware-dot-com>
- */
-
-#include <linux/atomic.h>
-#include <linux/errno.h>
-#include <linux/wait.h>
-#include <linux/sched/signal.h>
-#include "ttm_lock.h"
-#include "ttm_object.h"
-
-#define TTM_WRITE_LOCK_PENDING    (1 << 0)
-#define TTM_VT_LOCK_PENDING       (1 << 1)
-#define TTM_SUSPEND_LOCK_PENDING  (1 << 2)
-#define TTM_VT_LOCK               (1 << 3)
-#define TTM_SUSPEND_LOCK          (1 << 4)
-
-void ttm_lock_init(struct ttm_lock *lock)
-{
-	spin_lock_init(&lock->lock);
-	init_waitqueue_head(&lock->queue);
-	lock->rw = 0;
-	lock->flags = 0;
-}
-
-void ttm_read_unlock(struct ttm_lock *lock)
-{
-	spin_lock(&lock->lock);
-	if (--lock->rw == 0)
-		wake_up_all(&lock->queue);
-	spin_unlock(&lock->lock);
-}
-
-static bool __ttm_read_lock(struct ttm_lock *lock)
-{
-	bool locked = false;
-
-	spin_lock(&lock->lock);
-	if (lock->rw >= 0 && lock->flags == 0) {
-		++lock->rw;
-		locked = true;
-	}
-	spin_unlock(&lock->lock);
-	return locked;
-}
-
-int ttm_read_lock(struct ttm_lock *lock, bool interruptible)
-{
-	int ret = 0;
-
-	if (interruptible)
-		ret = wait_event_interruptible(lock->queue,
-					       __ttm_read_lock(lock));
-	else
-		wait_event(lock->queue, __ttm_read_lock(lock));
-	return ret;
-}
-
-static bool __ttm_read_trylock(struct ttm_lock *lock, bool *locked)
-{
-	bool block = true;
-
-	*locked = false;
-
-	spin_lock(&lock->lock);
-	if (lock->rw >= 0 && lock->flags == 0) {
-		++lock->rw;
-		block = false;
-		*locked = true;
-	} else if (lock->flags == 0) {
-		block = false;
-	}
-	spin_unlock(&lock->lock);
-
-	return !block;
-}
-
-int ttm_read_trylock(struct ttm_lock *lock, bool interruptible)
-{
-	int ret = 0;
-	bool locked;
-
-	if (interruptible)
-		ret = wait_event_interruptible
-			(lock->queue, __ttm_read_trylock(lock, &locked));
-	else
-		wait_event(lock->queue, __ttm_read_trylock(lock, &locked));
-
-	if (unlikely(ret != 0)) {
-		BUG_ON(locked);
-		return ret;
-	}
-
-	return (locked) ? 0 : -EBUSY;
-}
-
-void ttm_write_unlock(struct ttm_lock *lock)
-{
-	spin_lock(&lock->lock);
-	lock->rw = 0;
-	wake_up_all(&lock->queue);
-	spin_unlock(&lock->lock);
-}
-
-static bool __ttm_write_lock(struct ttm_lock *lock)
-{
-	bool locked = false;
-
-	spin_lock(&lock->lock);
-	if (lock->rw == 0 && ((lock->flags & ~TTM_WRITE_LOCK_PENDING) == 0)) {
-		lock->rw = -1;
-		lock->flags &= ~TTM_WRITE_LOCK_PENDING;
-		locked = true;
-	} else {
-		lock->flags |= TTM_WRITE_LOCK_PENDING;
-	}
-	spin_unlock(&lock->lock);
-	return locked;
-}
-
-int ttm_write_lock(struct ttm_lock *lock, bool interruptible)
-{
-	int ret = 0;
-
-	if (interruptible) {
-		ret = wait_event_interruptible(lock->queue,
-					       __ttm_write_lock(lock));
-		if (unlikely(ret != 0)) {
-			spin_lock(&lock->lock);
-			lock->flags &= ~TTM_WRITE_LOCK_PENDING;
-			wake_up_all(&lock->queue);
-			spin_unlock(&lock->lock);
-		}
-	} else
-		wait_event(lock->queue, __ttm_write_lock(lock));
-
-	return ret;
-}
-
-void ttm_suspend_unlock(struct ttm_lock *lock)
-{
-	spin_lock(&lock->lock);
-	lock->flags &= ~TTM_SUSPEND_LOCK;
-	wake_up_all(&lock->queue);
-	spin_unlock(&lock->lock);
-}
-
-static bool __ttm_suspend_lock(struct ttm_lock *lock)
-{
-	bool locked = false;
-
-	spin_lock(&lock->lock);
-	if (lock->rw == 0) {
-		lock->flags &= ~TTM_SUSPEND_LOCK_PENDING;
-		lock->flags |= TTM_SUSPEND_LOCK;
-		locked = true;
-	} else {
-		lock->flags |= TTM_SUSPEND_LOCK_PENDING;
-	}
-	spin_unlock(&lock->lock);
-	return locked;
-}
-
-void ttm_suspend_lock(struct ttm_lock *lock)
-{
-	wait_event(lock->queue, __ttm_suspend_lock(lock));
-}
diff --git a/drivers/gpu/drm/vmwgfx/ttm_lock.h b/drivers/gpu/drm/vmwgfx/ttm_lock.h
deleted file mode 100644
index af8b28ca546f..000000000000
--- a/drivers/gpu/drm/vmwgfx/ttm_lock.h
+++ /dev/null
@@ -1,218 +0,0 @@
-/**************************************************************************
- *
- * Copyright (c) 2007-2009 VMware, Inc., Palo Alto, CA., USA
- * All Rights Reserved.
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the
- * "Software"), to deal in the Software without restriction, including
- * without limitation the rights to use, copy, modify, merge, publish,
- * distribute, sub license, and/or sell copies of the Software, and to
- * permit persons to whom the Software is furnished to do so, subject to
- * the following conditions:
- *
- * The above copyright notice and this permission notice (including the
- * next paragraph) shall be included in all copies or substantial portions
- * of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL
- * THE COPYRIGHT HOLDERS, AUTHORS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM,
- * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
- * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
- * USE OR OTHER DEALINGS IN THE SOFTWARE.
- *
- **************************************************************************/
-/*
- * Authors: Thomas Hellstrom <thellstrom-at-vmware-dot-com>
- */
-
-/** @file ttm_lock.h
- * This file implements a simple replacement for the buffer manager use
- * of the DRM heavyweight hardware lock.
- * The lock is a read-write lock. Taking it in read mode and write mode
- * is relatively fast, and intended for in-kernel use only.
- *
- * The vt mode is used only when there is a need to block all
- * user-space processes from validating buffers.
- * It's allowed to leave kernel space with the vt lock held.
- * If a user-space process dies while having the vt-lock,
- * it will be released during the file descriptor release. The vt lock
- * excludes write lock and read lock.
- *
- * The suspend mode is used to lock out all TTM users when preparing for
- * and executing suspend operations.
- *
- */
-
-#ifndef _TTM_LOCK_H_
-#define _TTM_LOCK_H_
-
-#include <linux/atomic.h>
-#include <linux/wait.h>
-
-#include "ttm_object.h"
-
-/**
- * struct ttm_lock
- *
- * @base: ttm base object used solely to release the lock if the client
- * holding the lock dies.
- * @queue: Queue for processes waiting for lock change-of-status.
- * @lock: Spinlock protecting some lock members.
- * @rw: Read-write lock counter. Protected by @lock.
- * @flags: Lock state. Protected by @lock.
- */
-
-struct ttm_lock {
-	struct ttm_base_object base;
-	wait_queue_head_t queue;
-	spinlock_t lock;
-	int32_t rw;
-	uint32_t flags;
-};
-
-
-/**
- * ttm_lock_init
- *
- * @lock: Pointer to a struct ttm_lock
- * Initializes the lock.
- */
-extern void ttm_lock_init(struct ttm_lock *lock);
-
-/**
- * ttm_read_unlock
- *
- * @lock: Pointer to a struct ttm_lock
- *
- * Releases a read lock.
- */
-extern void ttm_read_unlock(struct ttm_lock *lock);
-
-/**
- * ttm_read_lock
- *
- * @lock: Pointer to a struct ttm_lock
- * @interruptible: Interruptible sleeping while waiting for a lock.
- *
- * Takes the lock in read mode.
- * Returns:
- * -ERESTARTSYS If interrupted by a signal and interruptible is true.
- */
-extern int ttm_read_lock(struct ttm_lock *lock, bool interruptible);
-
-/**
- * ttm_read_trylock
- *
- * @lock: Pointer to a struct ttm_lock
- * @interruptible: Interruptible sleeping while waiting for a lock.
- *
- * Tries to take the lock in read mode. If the lock is already held
- * in write mode, the function will return -EBUSY. If the lock is held
- * in vt or suspend mode, the function will sleep until these modes
- * are unlocked.
- *
- * Returns:
- * -EBUSY The lock was already held in write mode.
- * -ERESTARTSYS If interrupted by a signal and interruptible is true.
- */
-extern int ttm_read_trylock(struct ttm_lock *lock, bool interruptible);
-
-/**
- * ttm_write_unlock
- *
- * @lock: Pointer to a struct ttm_lock
- *
- * Releases a write lock.
- */
-extern void ttm_write_unlock(struct ttm_lock *lock);
-
-/**
- * ttm_write_lock
- *
- * @lock: Pointer to a struct ttm_lock
- * @interruptible: Interruptible sleeping while waiting for a lock.
- *
- * Takes the lock in write mode.
- * Returns:
- * -ERESTARTSYS If interrupted by a signal and interruptible is true.
- */
-extern int ttm_write_lock(struct ttm_lock *lock, bool interruptible);
-
-/**
- * ttm_lock_downgrade
- *
- * @lock: Pointer to a struct ttm_lock
- *
- * Downgrades a write lock to a read lock.
- */
-extern void ttm_lock_downgrade(struct ttm_lock *lock);
-
-/**
- * ttm_suspend_lock
- *
- * @lock: Pointer to a struct ttm_lock
- *
- * Takes the lock in suspend mode. Excludes read and write mode.
- */
-extern void ttm_suspend_lock(struct ttm_lock *lock);
-
-/**
- * ttm_suspend_unlock
- *
- * @lock: Pointer to a struct ttm_lock
- *
- * Releases a suspend lock
- */
-extern void ttm_suspend_unlock(struct ttm_lock *lock);
-
-/**
- * ttm_vt_lock
- *
- * @lock: Pointer to a struct ttm_lock
- * @interruptible: Interruptible sleeping while waiting for a lock.
- * @tfile: Pointer to a struct ttm_object_file to register the lock with.
- *
- * Takes the lock in vt mode.
- * Returns:
- * -ERESTARTSYS If interrupted by a signal and interruptible is true.
- * -ENOMEM: Out of memory when locking.
- */
-extern int ttm_vt_lock(struct ttm_lock *lock, bool interruptible,
-		       struct ttm_object_file *tfile);
-
-/**
- * ttm_vt_unlock
- *
- * @lock: Pointer to a struct ttm_lock
- *
- * Releases a vt lock.
- * Returns:
- * -EINVAL If the lock was not held.
- */
-extern int ttm_vt_unlock(struct ttm_lock *lock);
-
-/**
- * ttm_write_unlock
- *
- * @lock: Pointer to a struct ttm_lock
- *
- * Releases a write lock.
- */
-extern void ttm_write_unlock(struct ttm_lock *lock);
-
-/**
- * ttm_write_lock
- *
- * @lock: Pointer to a struct ttm_lock
- * @interruptible: Interruptible sleeping while waiting for a lock.
- *
- * Takes the lock in write mode.
- * Returns:
- * -ERESTARTSYS If interrupted by a signal and interruptible is true.
- */
-extern int ttm_write_lock(struct ttm_lock *lock, bool interruptible);
-
-#endif
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
index 63dbc44eebe0..70e4ef01ee7b 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
@@ -96,7 +96,7 @@ int vmw_bo_pin_in_placement(struct vmw_private *dev_priv,
 	int ret;
 	uint32_t new_flags;
 
-	ret = ttm_write_lock(&dev_priv->reservation_sem, interruptible);
+	ret = vmw_reservation_down_write(dev_priv, interruptible);
 	if (unlikely(ret != 0))
 		return ret;
 
@@ -118,7 +118,7 @@ int vmw_bo_pin_in_placement(struct vmw_private *dev_priv,
 	ttm_bo_unreserve(bo);
 
 err:
-	ttm_write_unlock(&dev_priv->reservation_sem);
+	up_write(&dev_priv->reservation_sem);
 	return ret;
 }
 
@@ -145,7 +145,7 @@ int vmw_bo_pin_in_vram_or_gmr(struct vmw_private *dev_priv,
 	int ret;
 	uint32_t new_flags;
 
-	ret = ttm_write_lock(&dev_priv->reservation_sem, interruptible);
+	ret = vmw_reservation_down_write(dev_priv, interruptible);
 	if (unlikely(ret != 0))
 		return ret;
 
@@ -173,7 +173,7 @@ int vmw_bo_pin_in_vram_or_gmr(struct vmw_private *dev_priv,
 
 	ttm_bo_unreserve(bo);
 err:
-	ttm_write_unlock(&dev_priv->reservation_sem);
+	up_write(&dev_priv->reservation_sem);
 	return ret;
 }
 
@@ -229,7 +229,7 @@ int vmw_bo_pin_in_start_of_vram(struct vmw_private *dev_priv,
 	placement.num_busy_placement = 1;
 	placement.busy_placement = &place;
 
-	ret = ttm_write_lock(&dev_priv->reservation_sem, interruptible);
+	ret = vmw_reservation_down_write(dev_priv, interruptible);
 	if (unlikely(ret != 0))
 		return ret;
 
@@ -264,7 +264,7 @@ int vmw_bo_pin_in_start_of_vram(struct vmw_private *dev_priv,
 
 	ttm_bo_unreserve(bo);
 err_unlock:
-	ttm_write_unlock(&dev_priv->reservation_sem);
+	up_write(&dev_priv->reservation_sem);
 
 	return ret;
 }
@@ -288,7 +288,7 @@ int vmw_bo_unpin(struct vmw_private *dev_priv,
 	struct ttm_buffer_object *bo = &buf->base;
 	int ret;
 
-	ret = ttm_read_lock(&dev_priv->reservation_sem, interruptible);
+	ret = vmw_reservation_down_read(dev_priv, interruptible);
 	if (unlikely(ret != 0))
 		return ret;
 
@@ -301,7 +301,7 @@ int vmw_bo_unpin(struct vmw_private *dev_priv,
 	ttm_bo_unreserve(bo);
 
 err:
-	ttm_read_unlock(&dev_priv->reservation_sem);
+	up_read(&dev_priv->reservation_sem);
 	return ret;
 }
 
@@ -882,7 +882,7 @@ int vmw_bo_alloc_ioctl(struct drm_device *dev, void *data,
 	uint32_t handle;
 	int ret;
 
-	ret = ttm_read_lock(&dev_priv->reservation_sem, true);
+	ret = down_read_interruptible(&dev_priv->reservation_sem);
 	if (unlikely(ret != 0))
 		return ret;
 
@@ -900,7 +900,7 @@ int vmw_bo_alloc_ioctl(struct drm_device *dev, void *data,
 	vmw_bo_unreference(&vbo);
 
 out_no_bo:
-	ttm_read_unlock(&dev_priv->reservation_sem);
+	up_read(&dev_priv->reservation_sem);
 
 	return ret;
 }
@@ -1095,7 +1095,7 @@ int vmw_dumb_create(struct drm_file *file_priv,
 	args->pitch = args->width * ((args->bpp + 7) / 8);
 	args->size = args->pitch * args->height;
 
-	ret = ttm_read_lock(&dev_priv->reservation_sem, true);
+	ret = down_read_interruptible(&dev_priv->reservation_sem);
 	if (unlikely(ret != 0))
 		return ret;
 
@@ -1107,7 +1107,7 @@ int vmw_dumb_create(struct drm_file *file_priv,
 
 	vmw_bo_unreference(&vbo);
 out_no_bo:
-	ttm_read_unlock(&dev_priv->reservation_sem);
+	up_read(&dev_priv->reservation_sem);
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_context.c b/drivers/gpu/drm/vmwgfx/vmwgfx_context.c
index 6f4d0da11ad8..e8b150bb4e32 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_context.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_context.c
@@ -748,7 +748,7 @@ static int vmw_context_define(struct drm_device *dev, void *data,
 		  ((dev_priv->has_mob) ? vmw_cmdbuf_res_man_size() : 0) +
 		  + VMW_IDA_ACC_SIZE + TTM_OBJ_EXTRA_SIZE;
 
-	ret = ttm_read_lock(&dev_priv->reservation_sem, true);
+	ret = down_read_interruptible(&dev_priv->reservation_sem);
 	if (unlikely(ret != 0))
 		return ret;
 
@@ -795,7 +795,7 @@ static int vmw_context_define(struct drm_device *dev, void *data,
 out_err:
 	vmw_resource_unreference(&res);
 out_unlock:
-	ttm_read_unlock(&dev_priv->reservation_sem);
+	up_read(&dev_priv->reservation_sem);
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index dd69b51c40e4..2012045fac83 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -264,8 +264,6 @@ static int vmw_restrict_dma_mask;
 static int vmw_assume_16bpp;
 
 static int vmw_probe(struct pci_dev *, const struct pci_device_id *);
-static int vmwgfx_pm_notifier(struct notifier_block *nb, unsigned long val,
-			      void *ptr);
 
 MODULE_PARM_DESC(enable_fbdev, "Enable vmwgfx fbdev");
 module_param_named(enable_fbdev, enable_fbdev, int, 0600);
@@ -723,7 +721,7 @@ static int vmw_driver_load(struct vmw_private *dev_priv, u32 pci_id)
 	mutex_init(&dev_priv->release_mutex);
 	mutex_init(&dev_priv->binding_mutex);
 	mutex_init(&dev_priv->global_kms_state_mutex);
-	ttm_lock_init(&dev_priv->reservation_sem);
+	init_rwsem(&dev_priv->reservation_sem);
 	spin_lock_init(&dev_priv->resource_lock);
 	spin_lock_init(&dev_priv->hw_lock);
 	spin_lock_init(&dev_priv->waiter_lock);
@@ -992,9 +990,6 @@ static int vmw_driver_load(struct vmw_private *dev_priv, u32 pci_id)
 		vmw_fb_init(dev_priv);
 	}
 
-	dev_priv->pm_nb.notifier_call = vmwgfx_pm_notifier;
-	register_pm_notifier(&dev_priv->pm_nb);
-
 	return 0;
 
 out_no_fifo:
@@ -1032,8 +1027,6 @@ static void vmw_driver_unload(struct drm_device *dev)
 	struct pci_dev *pdev = to_pci_dev(dev->dev);
 	enum vmw_res_type i;
 
-	unregister_pm_notifier(&dev_priv->pm_nb);
-
 	if (dev_priv->ctx.res_ht_initialized)
 		drm_ht_remove(&dev_priv->ctx.res_ht);
 	vfree(dev_priv->ctx.cmd_bounce);
@@ -1205,9 +1198,9 @@ static void __vmw_svga_enable(struct vmw_private *dev_priv)
  */
 void vmw_svga_enable(struct vmw_private *dev_priv)
 {
-	(void) ttm_read_lock(&dev_priv->reservation_sem, false);
+	(void) down_read(&dev_priv->reservation_sem);
 	__vmw_svga_enable(dev_priv);
-	ttm_read_unlock(&dev_priv->reservation_sem);
+	up_read(&dev_priv->reservation_sem);
 }
 
 /**
@@ -1252,7 +1245,7 @@ void vmw_svga_disable(struct vmw_private *dev_priv)
 	 *
 	 */
 	vmw_kms_lost_device(&dev_priv->drm);
-	ttm_write_lock(&dev_priv->reservation_sem, false);
+	down_write(&dev_priv->reservation_sem);
 	if (ttm_resource_manager_used(man)) {
 		if (ttm_resource_manager_evict_all(&dev_priv->bdev, man))
 			DRM_ERROR("Failed evicting VRAM buffers.\n");
@@ -1261,7 +1254,7 @@ void vmw_svga_disable(struct vmw_private *dev_priv)
 			  SVGA_REG_ENABLE_HIDE |
 			  SVGA_REG_ENABLE_ENABLE);
 	}
-	ttm_write_unlock(&dev_priv->reservation_sem);
+	up_write(&dev_priv->reservation_sem);
 }
 
 static void vmw_remove(struct pci_dev *pdev)
@@ -1284,38 +1277,6 @@ vmw_get_unmapped_area(struct file *file, unsigned long uaddr,
 				     &dev_priv->vma_manager);
 }
 
-static int vmwgfx_pm_notifier(struct notifier_block *nb, unsigned long val,
-			      void *ptr)
-{
-	struct vmw_private *dev_priv =
-		container_of(nb, struct vmw_private, pm_nb);
-
-	switch (val) {
-	case PM_HIBERNATION_PREPARE:
-		/*
-		 * Take the reservation sem in write mode, which will make sure
-		 * there are no other processes holding a buffer object
-		 * reservation, meaning we should be able to evict all buffer
-		 * objects if needed.
-		 * Once user-space processes have been frozen, we can release
-		 * the lock again.
-		 */
-		ttm_suspend_lock(&dev_priv->reservation_sem);
-		dev_priv->suspend_locked = true;
-		break;
-	case PM_POST_HIBERNATION:
-	case PM_POST_RESTORE:
-		if (READ_ONCE(dev_priv->suspend_locked)) {
-			dev_priv->suspend_locked = false;
-			ttm_suspend_unlock(&dev_priv->reservation_sem);
-		}
-		break;
-	default:
-		break;
-	}
-	return 0;
-}
-
 static int vmw_pci_suspend(struct pci_dev *pdev, pm_message_t state)
 {
 	struct drm_device *dev = pci_get_drvdata(pdev);
@@ -1366,20 +1327,16 @@ static int vmw_pm_freeze(struct device *kdev)
 	int ret;
 
 	/*
-	 * Unlock for vmw_kms_suspend.
 	 * No user-space processes should be running now.
 	 */
-	ttm_suspend_unlock(&dev_priv->reservation_sem);
 	ret = vmw_kms_suspend(&dev_priv->drm);
 	if (ret) {
-		ttm_suspend_lock(&dev_priv->reservation_sem);
 		DRM_ERROR("Failed to freeze modesetting.\n");
 		return ret;
 	}
 	if (dev_priv->enable_fb)
 		vmw_fb_off(dev_priv);
 
-	ttm_suspend_lock(&dev_priv->reservation_sem);
 	vmw_execbuf_release_pinned_bo(dev_priv);
 	vmw_resource_evict_all(dev_priv);
 	vmw_release_device_early(dev_priv);
@@ -1391,8 +1348,6 @@ static int vmw_pm_freeze(struct device *kdev)
 		if (dev_priv->enable_fb)
 			vmw_fifo_resource_inc(dev_priv);
 		WARN_ON(vmw_request_device_late(dev_priv));
-		dev_priv->suspend_locked = false;
-		ttm_suspend_unlock(&dev_priv->reservation_sem);
 		if (dev_priv->suspend_state)
 			vmw_kms_resume(dev);
 		if (dev_priv->enable_fb)
@@ -1428,8 +1383,6 @@ static int vmw_pm_restore(struct device *kdev)
 		__vmw_svga_enable(dev_priv);
 
 	vmw_fence_fifo_up(dev_priv->fman);
-	dev_priv->suspend_locked = false;
-	ttm_suspend_unlock(&dev_priv->reservation_sem);
 	if (dev_priv->suspend_state)
 		vmw_kms_resume(&dev_priv->drm);
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
index 5fa5bcd20cc5..6bd9ba2d1ba2 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
@@ -28,6 +28,7 @@
 #ifndef _VMWGFX_DRV_H_
 #define _VMWGFX_DRV_H_
 
+#include <linux/rwsem.h>
 #include <linux/suspend.h>
 #include <linux/sync_file.h>
 
@@ -40,7 +41,6 @@
 #include <drm/ttm/ttm_bo_driver.h>
 #include <drm/ttm/ttm_execbuf_util.h>
 
-#include "ttm_lock.h"
 #include "ttm_object.h"
 
 #include "vmwgfx_fence.h"
@@ -588,17 +588,12 @@ struct vmw_private {
 	/**
 	 * PM management.
 	 */
-	struct notifier_block pm_nb;
 	bool refuse_hibernation;
-	bool suspend_locked;
 
 	struct mutex release_mutex;
 	atomic_t num_fifo_resources;
 
-	/*
-	 * Replace this with an rwsem as soon as we have down_xx_interruptible()
-	 */
-	struct ttm_lock reservation_sem;
+	struct rw_semaphore reservation_sem;
 
 	/*
 	 * Query processing. These members
@@ -1577,4 +1572,27 @@ static inline void vmw_fifo_mem_write(struct vmw_private *vmw, u32 fifo_reg,
 {
 	WRITE_ONCE(*(vmw->fifo_mem + fifo_reg), value);
 }
+
+static inline int vmw_reservation_down_write(struct vmw_private *vmw,
+					     bool interruptible)
+{
+	if (interruptible) {
+		return down_write_interruptible(&vmw->reservation_sem);
+	} else {
+		down_write(&vmw->reservation_sem);
+		return 0;
+	}
+}
+
+static inline int vmw_reservation_down_read(struct vmw_private *vmw,
+					    bool interruptible)
+{
+	if (interruptible) {
+		return down_read_interruptible(&vmw->reservation_sem);
+	} else {
+		down_read(&vmw->reservation_sem);
+		return 0;
+	}
+}
+
 #endif
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
index 462f17320708..960bdf9be12a 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
@@ -4427,7 +4427,7 @@ int vmw_execbuf_ioctl(struct drm_device *dev, void *data,
 			goto out;
 	}
 
-	ret = ttm_read_lock(&dev_priv->reservation_sem, true);
+	ret = down_read_interruptible(&dev_priv->reservation_sem);
 	if (unlikely(ret != 0))
 		return ret;
 
@@ -4438,7 +4438,7 @@ int vmw_execbuf_ioctl(struct drm_device *dev, void *data,
 				  (void __user *)(unsigned long)arg->fence_rep,
 				  NULL, arg->flags);
 
-	ttm_read_unlock(&dev_priv->reservation_sem);
+	up_read(&dev_priv->reservation_sem);
 	if (unlikely(ret != 0))
 		goto out;
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_fb.c b/drivers/gpu/drm/vmwgfx/vmwgfx_fb.c
index 33f07abfc3ae..c5a1905bd479 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_fb.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_fb.c
@@ -195,7 +195,7 @@ static void vmw_fb_dirty_flush(struct work_struct *work)
 	if (!cur_fb)
 		goto out_unlock;
 
-	(void) ttm_read_lock(&vmw_priv->reservation_sem, false);
+	(void) down_read(&vmw_priv->reservation_sem);
 	(void) ttm_bo_reserve(&vbo->base, false, false, NULL);
 	virtual = vmw_bo_map_and_cache(vbo);
 	if (!virtual)
@@ -254,7 +254,7 @@ static void vmw_fb_dirty_flush(struct work_struct *work)
 
 out_unreserve:
 	ttm_bo_unreserve(&vbo->base);
-	ttm_read_unlock(&vmw_priv->reservation_sem);
+	up_read(&vmw_priv->reservation_sem);
 	if (w && h) {
 		WARN_ON_ONCE(par->set_fb->funcs->dirty(cur_fb, NULL, 0, 0,
 						       &clip, 1));
@@ -396,7 +396,7 @@ static int vmw_fb_create_bo(struct vmw_private *vmw_priv,
 	struct vmw_buffer_object *vmw_bo;
 	int ret;
 
-	(void) ttm_write_lock(&vmw_priv->reservation_sem, false);
+	(void) down_write(&vmw_priv->reservation_sem);
 
 	vmw_bo = kmalloc(sizeof(*vmw_bo), GFP_KERNEL);
 	if (!vmw_bo) {
@@ -412,12 +412,12 @@ static int vmw_fb_create_bo(struct vmw_private *vmw_priv,
 		goto err_unlock; /* init frees the buffer on failure */
 
 	*out = vmw_bo;
-	ttm_write_unlock(&vmw_priv->reservation_sem);
+	up_write(&vmw_priv->reservation_sem);
 
 	return 0;
 
 err_unlock:
-	ttm_write_unlock(&vmw_priv->reservation_sem);
+	up_write(&vmw_priv->reservation_sem);
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ioctl.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ioctl.c
index 80af8772b8c2..3b4f9132e03a 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ioctl.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ioctl.c
@@ -302,7 +302,7 @@ int vmw_present_ioctl(struct drm_device *dev, void *data,
 	}
 	vfb = vmw_framebuffer_to_vfb(fb);
 
-	ret = ttm_read_lock(&dev_priv->reservation_sem, true);
+	ret = down_read_interruptible(&dev_priv->reservation_sem);
 	if (unlikely(ret != 0))
 		goto out_no_ttm_lock;
 
@@ -322,7 +322,7 @@ int vmw_present_ioctl(struct drm_device *dev, void *data,
 	vmw_surface_unreference(&surface);
 
 out_no_surface:
-	ttm_read_unlock(&dev_priv->reservation_sem);
+	up_read(&dev_priv->reservation_sem);
 out_no_ttm_lock:
 	drm_framebuffer_put(fb);
 out_no_fb:
@@ -391,7 +391,7 @@ int vmw_present_readback_ioctl(struct drm_device *dev, void *data,
 		goto out_no_ttm_lock;
 	}
 
-	ret = ttm_read_lock(&dev_priv->reservation_sem, true);
+	ret = down_read_interruptible(&dev_priv->reservation_sem);
 	if (unlikely(ret != 0))
 		goto out_no_ttm_lock;
 
@@ -399,7 +399,7 @@ int vmw_present_readback_ioctl(struct drm_device *dev, void *data,
 			       vfb, user_fence_rep,
 			       clips, num_clips);
 
-	ttm_read_unlock(&dev_priv->reservation_sem);
+	up_read(&dev_priv->reservation_sem);
 out_no_ttm_lock:
 	drm_framebuffer_put(fb);
 out_no_fb:
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
index 9a89f658e501..d197bb2f3d34 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
@@ -1001,7 +1001,7 @@ static int vmw_framebuffer_bo_dirty(struct drm_framebuffer *framebuffer,
 
 	drm_modeset_lock_all(&dev_priv->drm);
 
-	ret = ttm_read_lock(&dev_priv->reservation_sem, true);
+	ret = down_read_interruptible(&dev_priv->reservation_sem);
 	if (unlikely(ret != 0)) {
 		drm_modeset_unlock_all(&dev_priv->drm);
 		return ret;
@@ -1030,7 +1030,7 @@ static int vmw_framebuffer_bo_dirty(struct drm_framebuffer *framebuffer,
 	}
 
 	vmw_cmd_flush(dev_priv, false);
-	ttm_read_unlock(&dev_priv->reservation_sem);
+	up_read(&dev_priv->reservation_sem);
 
 	drm_modeset_unlock_all(&dev_priv->drm);
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
index d1e7b9608145..104c52bc4d4d 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
@@ -989,7 +989,7 @@ int vmw_resource_pin(struct vmw_resource *res, bool interruptible)
 	struct vmw_private *dev_priv = res->dev_priv;
 	int ret;
 
-	ttm_write_lock(&dev_priv->reservation_sem, interruptible);
+	vmw_reservation_down_write(dev_priv, interruptible);
 	mutex_lock(&dev_priv->cmdbuf_mutex);
 	ret = vmw_resource_reserve(res, interruptible, false);
 	if (ret)
@@ -1028,7 +1028,7 @@ int vmw_resource_pin(struct vmw_resource *res, bool interruptible)
 	vmw_resource_unreserve(res, false, false, false, NULL, 0UL);
 out_no_reserve:
 	mutex_unlock(&dev_priv->cmdbuf_mutex);
-	ttm_write_unlock(&dev_priv->reservation_sem);
+	up_write(&dev_priv->reservation_sem);
 
 	return ret;
 }
@@ -1046,7 +1046,7 @@ void vmw_resource_unpin(struct vmw_resource *res)
 	struct vmw_private *dev_priv = res->dev_priv;
 	int ret;
 
-	(void) ttm_read_lock(&dev_priv->reservation_sem, false);
+	(void) down_read(&dev_priv->reservation_sem);
 	mutex_lock(&dev_priv->cmdbuf_mutex);
 
 	ret = vmw_resource_reserve(res, false, true);
@@ -1064,7 +1064,7 @@ void vmw_resource_unpin(struct vmw_resource *res)
 	vmw_resource_unreserve(res, false, false, false, NULL, 0UL);
 
 	mutex_unlock(&dev_priv->cmdbuf_mutex);
-	ttm_read_unlock(&dev_priv->reservation_sem);
+	up_read(&dev_priv->reservation_sem);
 }
 
 /**
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_shader.c b/drivers/gpu/drm/vmwgfx/vmwgfx_shader.c
index 905ae50aaa2a..618a0b9500e0 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_shader.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_shader.c
@@ -876,7 +876,7 @@ static int vmw_shader_define(struct drm_device *dev, struct drm_file *file_priv,
 		goto out_bad_arg;
 	}
 
-	ret = ttm_read_lock(&dev_priv->reservation_sem, true);
+	ret = down_read_interruptible(&dev_priv->reservation_sem);
 	if (unlikely(ret != 0))
 		goto out_bad_arg;
 
@@ -884,7 +884,7 @@ static int vmw_shader_define(struct drm_device *dev, struct drm_file *file_priv,
 				    shader_type, num_input_sig,
 				    num_output_sig, tfile, shader_handle);
 
-	ttm_read_unlock(&dev_priv->reservation_sem);
+	up_read(&dev_priv->reservation_sem);
 out_bad_arg:
 	vmw_bo_unreference(&buffer);
 	return ret;
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_simple_resource.c b/drivers/gpu/drm/vmwgfx/vmwgfx_simple_resource.c
index 73e9a487e659..b0000bfafe4f 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_simple_resource.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_simple_resource.c
@@ -162,13 +162,13 @@ vmw_simple_resource_create_ioctl(struct drm_device *dev, void *data,
 	account_size = ttm_round_pot(alloc_size) + VMW_IDA_ACC_SIZE +
 		TTM_OBJ_EXTRA_SIZE;
 
-	ret = ttm_read_lock(&dev_priv->reservation_sem, true);
+	ret = down_read_interruptible(&dev_priv->reservation_sem);
 	if (ret)
 		return ret;
 
 	ret = ttm_mem_global_alloc(vmw_mem_glob(dev_priv), account_size,
 				   &ctx);
-	ttm_read_unlock(&dev_priv->reservation_sem);
+	up_read(&dev_priv->reservation_sem);
 	if (ret) {
 		if (ret != -ERESTARTSYS)
 			DRM_ERROR("Out of graphics memory for %s"
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
index f6cab77075a0..682832ecf1a4 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
@@ -776,7 +776,7 @@ int vmw_surface_define_ioctl(struct drm_device *dev, void *data,
 		return -EINVAL;
 	}
 
-	ret = ttm_read_lock(&dev_priv->reservation_sem, true);
+	ret = down_read_interruptible(&dev_priv->reservation_sem);
 	if (unlikely(ret != 0))
 		return ret;
 
@@ -910,7 +910,7 @@ int vmw_surface_define_ioctl(struct drm_device *dev, void *data,
 	rep->sid = user_srf->prime.base.handle;
 	vmw_resource_unreference(&res);
 
-	ttm_read_unlock(&dev_priv->reservation_sem);
+	up_read(&dev_priv->reservation_sem);
 	return 0;
 out_no_copy:
 	kfree(srf->offsets);
@@ -921,7 +921,7 @@ int vmw_surface_define_ioctl(struct drm_device *dev, void *data,
 out_no_user_srf:
 	ttm_mem_global_free(vmw_mem_glob(dev_priv), size);
 out_unlock:
-	ttm_read_unlock(&dev_priv->reservation_sem);
+	up_read(&dev_priv->reservation_sem);
 	return ret;
 }
 
@@ -1539,7 +1539,7 @@ vmw_gb_surface_define_internal(struct drm_device *dev,
 	if (drm_is_primary_client(file_priv))
 		user_srf->master = drm_master_get(file_priv->master);
 
-	ret = ttm_read_lock(&dev_priv->reservation_sem, true);
+	ret = down_read_interruptible(&dev_priv->reservation_sem);
 	if (unlikely(ret != 0))
 		return ret;
 
@@ -1624,7 +1624,7 @@ vmw_gb_surface_define_internal(struct drm_device *dev,
 	vmw_resource_unreference(&res);
 
 out_unlock:
-	ttm_read_unlock(&dev_priv->reservation_sem);
+	up_read(&dev_priv->reservation_sem);
 	return ret;
 }
 
@@ -2109,7 +2109,7 @@ int vmw_gb_surface_define(struct vmw_private *dev_priv,
 	if (req->sizes != NULL)
 		return -EINVAL;
 
-	ret = ttm_read_lock(&dev_priv->reservation_sem, true);
+	ret = down_read_interruptible(&dev_priv->reservation_sem);
 	if (unlikely(ret != 0))
 		return ret;
 
@@ -2176,13 +2176,13 @@ int vmw_gb_surface_define(struct vmw_private *dev_priv,
 	 */
 	ret = vmw_surface_init(dev_priv, srf, vmw_user_surface_free);
 
-	ttm_read_unlock(&dev_priv->reservation_sem);
+	up_read(&dev_priv->reservation_sem);
 	return ret;
 
 out_no_user_srf:
 	ttm_mem_global_free(vmw_mem_glob(dev_priv), user_accounting_size);
 
 out_unlock:
-	ttm_read_unlock(&dev_priv->reservation_sem);
+	up_read(&dev_priv->reservation_sem);
 	return ret;
 }
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
