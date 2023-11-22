Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7390C7F4605
	for <lists+dri-devel@lfdr.de>; Wed, 22 Nov 2023 13:25:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEBA010E613;
	Wed, 22 Nov 2023 12:25:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D60BB10E60E
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Nov 2023 12:24:57 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 58DA71FD63;
 Wed, 22 Nov 2023 12:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1700655896; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IPAIoJfM7Q/sC5A9TqfAHNe/tG+roReZGzNFkTRBRWE=;
 b=ibKDAXVdHHnednrRv7OETCiK0WxoFGeTcE1vVJmHGkgpCUBr0mHoWm3Ky+kAtF4hqPuH+X
 9JqSb6qZyeM4aJCRbE/tEdlU9sNZwScYa4n1SN3zXtrZ1KSjLwC/hXl65H5K5+NJJiufPm
 Pei0dlVwUkKYvaKj43bUrxy1SMFT1oA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1700655896;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IPAIoJfM7Q/sC5A9TqfAHNe/tG+roReZGzNFkTRBRWE=;
 b=PCR80phWzf13/nUqQQE9r75H39ySfbj5ss1/k4a4wrWmjKfkVsO+nQUREIY2d0GVIIXl6V
 9AIu7ZsOF1drroDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 247AB13467;
 Wed, 22 Nov 2023 12:24:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id sNgyCBjzXWU2TAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 22 Nov 2023 12:24:56 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@gmail.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, cai.huoqing@linux.dev
Subject: [PATCH 13/14] char/agp: Remove frontend code
Date: Wed, 22 Nov 2023 13:09:42 +0100
Message-ID: <20231122122449.11588-14-tzimmermann@suse.de>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231122122449.11588-1-tzimmermann@suse.de>
References: <20231122122449.11588-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; R_MISSING_CHARSET(2.50)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 REPLY(-4.00)[]; BROKEN_CONTENT_TYPE(1.50)[];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; RCPT_COUNT_SEVEN(0.00)[7];
 MID_CONTAINS_FROM(1.00)[];
 FREEMAIL_TO(0.00)[gmail.com,ffwll.ch,linux.intel.com,kernel.org,linux.dev];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_COUNT_TWO(0.00)[2];
 RCVD_TLS_ALL(0.00)[]; BAYES_HAM(-3.00)[100.00%]
X-Spam-Flag: NO
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The AGP subsystem supports a user-space interface via /dev/agpgart. It
is only enabled with DRM support for mode setting in user space. (i.e.,
CONFIG_DRM_LEGACY). All of that DRM code has been removed and the option
will go away. Hence remove the AGP frontend.

Modern DRM drivers with kernel mode setting handle AGP support internally.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/char/agp/Makefile       |    6 -
 drivers/char/agp/agp.h          |    9 -
 drivers/char/agp/backend.c      |   11 -
 drivers/char/agp/compat_ioctl.c |  291 ---------
 drivers/char/agp/compat_ioctl.h |  106 ---
 drivers/char/agp/frontend.c     | 1068 -------------------------------
 6 files changed, 1491 deletions(-)
 delete mode 100644 drivers/char/agp/compat_ioctl.c
 delete mode 100644 drivers/char/agp/compat_ioctl.h
 delete mode 100644 drivers/char/agp/frontend.c

diff --git a/drivers/char/agp/Makefile b/drivers/char/agp/Makefile
index 25834557e4865..43b09cf193bb7 100644
--- a/drivers/char/agp/Makefile
+++ b/drivers/char/agp/Makefile
@@ -1,12 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 agpgart-y := backend.o generic.o isoch.o
 
-ifeq ($(CONFIG_DRM_LEGACY),y)
-agpgart-$(CONFIG_COMPAT)	+= compat_ioctl.o
-agpgart-y			+= frontend.o
-endif
-
-
 obj-$(CONFIG_AGP)		+= agpgart.o
 obj-$(CONFIG_AGP_ALI)		+= ali-agp.o
 obj-$(CONFIG_AGP_ATI)		+= ati-agp.o
diff --git a/drivers/char/agp/agp.h b/drivers/char/agp/agp.h
index 8771dcc9b8e2f..5c36ab85f80b7 100644
--- a/drivers/char/agp/agp.h
+++ b/drivers/char/agp/agp.h
@@ -185,15 +185,6 @@ void agp_put_bridge(struct agp_bridge_data *bridge);
 int agp_add_bridge(struct agp_bridge_data *bridge);
 void agp_remove_bridge(struct agp_bridge_data *bridge);
 
-/* Frontend routines. */
-#if IS_ENABLED(CONFIG_DRM_LEGACY)
-int agp_frontend_initialize(void);
-void agp_frontend_cleanup(void);
-#else
-static inline int agp_frontend_initialize(void) { return 0; }
-static inline void agp_frontend_cleanup(void) {}
-#endif
-
 /* Generic routines. */
 void agp_generic_enable(struct agp_bridge_data *bridge, u32 mode);
 int agp_generic_create_gatt_table(struct agp_bridge_data *bridge);
diff --git a/drivers/char/agp/backend.c b/drivers/char/agp/backend.c
index 0e19c600db531..1776afd3ee078 100644
--- a/drivers/char/agp/backend.c
+++ b/drivers/char/agp/backend.c
@@ -293,13 +293,6 @@ int agp_add_bridge(struct agp_bridge_data *bridge)
 	}
 
 	if (list_empty(&agp_bridges)) {
-		error = agp_frontend_initialize();
-		if (error) {
-			dev_info(&bridge->dev->dev,
-				 "agp_frontend_initialize() failed\n");
-			goto frontend_err;
-		}
-
 		dev_info(&bridge->dev->dev, "AGP aperture is %dM @ 0x%lx\n",
 			 bridge->driver->fetch_size(), bridge->gart_bus_addr);
 
@@ -308,8 +301,6 @@ int agp_add_bridge(struct agp_bridge_data *bridge)
 	list_add(&bridge->list, &agp_bridges);
 	return 0;
 
-frontend_err:
-	agp_backend_cleanup(bridge);
 err_out:
 	module_put(bridge->driver->owner);
 err_put_bridge:
@@ -323,8 +314,6 @@ void agp_remove_bridge(struct agp_bridge_data *bridge)
 {
 	agp_backend_cleanup(bridge);
 	list_del(&bridge->list);
-	if (list_empty(&agp_bridges))
-		agp_frontend_cleanup();
 	module_put(bridge->driver->owner);
 }
 EXPORT_SYMBOL_GPL(agp_remove_bridge);
diff --git a/drivers/char/agp/compat_ioctl.c b/drivers/char/agp/compat_ioctl.c
deleted file mode 100644
index 52ffe1706ce05..0000000000000
--- a/drivers/char/agp/compat_ioctl.c
+++ /dev/null
@@ -1,291 +0,0 @@
-/*
- * AGPGART driver frontend compatibility ioctls
- * Copyright (C) 2004 Silicon Graphics, Inc.
- * Copyright (C) 2002-2003 Dave Jones
- * Copyright (C) 1999 Jeff Hartmann
- * Copyright (C) 1999 Precision Insight, Inc.
- * Copyright (C) 1999 Xi Graphics, Inc.
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included
- * in all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
- * OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
- * JEFF HARTMANN, OR ANY OTHER CONTRIBUTORS BE LIABLE FOR ANY CLAIM,
- * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
- * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE
- * OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
- *
- */
-
-#include <linux/kernel.h>
-#include <linux/pci.h>
-#include <linux/fs.h>
-#include <linux/agpgart.h>
-#include <linux/slab.h>
-#include <linux/uaccess.h>
-#include "agp.h"
-#include "compat_ioctl.h"
-
-static int compat_agpioc_info_wrap(struct agp_file_private *priv, void __user *arg)
-{
-	struct agp_info32 userinfo;
-	struct agp_kern_info kerninfo;
-
-	agp_copy_info(agp_bridge, &kerninfo);
-
-	userinfo.version.major = kerninfo.version.major;
-	userinfo.version.minor = kerninfo.version.minor;
-	userinfo.bridge_id = kerninfo.device->vendor |
-	    (kerninfo.device->device << 16);
-	userinfo.agp_mode = kerninfo.mode;
-	userinfo.aper_base = (compat_long_t)kerninfo.aper_base;
-	userinfo.aper_size = kerninfo.aper_size;
-	userinfo.pg_total = userinfo.pg_system = kerninfo.max_memory;
-	userinfo.pg_used = kerninfo.current_memory;
-
-	if (copy_to_user(arg, &userinfo, sizeof(userinfo)))
-		return -EFAULT;
-
-	return 0;
-}
-
-static int compat_agpioc_reserve_wrap(struct agp_file_private *priv, void __user *arg)
-{
-	struct agp_region32 ureserve;
-	struct agp_region kreserve;
-	struct agp_client *client;
-	struct agp_file_private *client_priv;
-
-	DBG("");
-	if (copy_from_user(&ureserve, arg, sizeof(ureserve)))
-		return -EFAULT;
-
-	if ((unsigned) ureserve.seg_count >= ~0U/sizeof(struct agp_segment32))
-		return -EFAULT;
-
-	kreserve.pid = ureserve.pid;
-	kreserve.seg_count = ureserve.seg_count;
-
-	client = agp_find_client_by_pid(kreserve.pid);
-
-	if (kreserve.seg_count == 0) {
-		/* remove a client */
-		client_priv = agp_find_private(kreserve.pid);
-
-		if (client_priv != NULL) {
-			set_bit(AGP_FF_IS_CLIENT, &client_priv->access_flags);
-			set_bit(AGP_FF_IS_VALID, &client_priv->access_flags);
-		}
-		if (client == NULL) {
-			/* client is already removed */
-			return 0;
-		}
-		return agp_remove_client(kreserve.pid);
-	} else {
-		struct agp_segment32 *usegment;
-		struct agp_segment *ksegment;
-		int seg;
-
-		if (ureserve.seg_count >= 16384)
-			return -EINVAL;
-
-		usegment = kmalloc_array(ureserve.seg_count,
-					 sizeof(*usegment),
-					 GFP_KERNEL);
-		if (!usegment)
-			return -ENOMEM;
-
-		ksegment = kmalloc_array(kreserve.seg_count,
-					 sizeof(*ksegment),
-					 GFP_KERNEL);
-		if (!ksegment) {
-			kfree(usegment);
-			return -ENOMEM;
-		}
-
-		if (copy_from_user(usegment, (void __user *) ureserve.seg_list,
-				   sizeof(*usegment) * ureserve.seg_count)) {
-			kfree(usegment);
-			kfree(ksegment);
-			return -EFAULT;
-		}
-
-		for (seg = 0; seg < ureserve.seg_count; seg++) {
-			ksegment[seg].pg_start = usegment[seg].pg_start;
-			ksegment[seg].pg_count = usegment[seg].pg_count;
-			ksegment[seg].prot = usegment[seg].prot;
-		}
-
-		kfree(usegment);
-		kreserve.seg_list = ksegment;
-
-		if (client == NULL) {
-			/* Create the client and add the segment */
-			client = agp_create_client(kreserve.pid);
-
-			if (client == NULL) {
-				kfree(ksegment);
-				return -ENOMEM;
-			}
-			client_priv = agp_find_private(kreserve.pid);
-
-			if (client_priv != NULL) {
-				set_bit(AGP_FF_IS_CLIENT, &client_priv->access_flags);
-				set_bit(AGP_FF_IS_VALID, &client_priv->access_flags);
-			}
-		}
-		return agp_create_segment(client, &kreserve);
-	}
-	/* Will never really happen */
-	return -EINVAL;
-}
-
-static int compat_agpioc_allocate_wrap(struct agp_file_private *priv, void __user *arg)
-{
-	struct agp_memory *memory;
-	struct agp_allocate32 alloc;
-
-	DBG("");
-	if (copy_from_user(&alloc, arg, sizeof(alloc)))
-		return -EFAULT;
-
-	memory = agp_allocate_memory_wrap(alloc.pg_count, alloc.type);
-
-	if (memory == NULL)
-		return -ENOMEM;
-
-	alloc.key = memory->key;
-	alloc.physical = memory->physical;
-
-	if (copy_to_user(arg, &alloc, sizeof(alloc))) {
-		agp_free_memory_wrap(memory);
-		return -EFAULT;
-	}
-	return 0;
-}
-
-static int compat_agpioc_bind_wrap(struct agp_file_private *priv, void __user *arg)
-{
-	struct agp_bind32 bind_info;
-	struct agp_memory *memory;
-
-	DBG("");
-	if (copy_from_user(&bind_info, arg, sizeof(bind_info)))
-		return -EFAULT;
-
-	memory = agp_find_mem_by_key(bind_info.key);
-
-	if (memory == NULL)
-		return -EINVAL;
-
-	return agp_bind_memory(memory, bind_info.pg_start);
-}
-
-static int compat_agpioc_unbind_wrap(struct agp_file_private *priv, void __user *arg)
-{
-	struct agp_memory *memory;
-	struct agp_unbind32 unbind;
-
-	DBG("");
-	if (copy_from_user(&unbind, arg, sizeof(unbind)))
-		return -EFAULT;
-
-	memory = agp_find_mem_by_key(unbind.key);
-
-	if (memory == NULL)
-		return -EINVAL;
-
-	return agp_unbind_memory(memory);
-}
-
-long compat_agp_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
-{
-	struct agp_file_private *curr_priv = file->private_data;
-	int ret_val = -ENOTTY;
-
-	mutex_lock(&(agp_fe.agp_mutex));
-
-	if ((agp_fe.current_controller == NULL) &&
-	    (cmd != AGPIOC_ACQUIRE32)) {
-		ret_val = -EINVAL;
-		goto ioctl_out;
-	}
-	if ((agp_fe.backend_acquired != true) &&
-	    (cmd != AGPIOC_ACQUIRE32)) {
-		ret_val = -EBUSY;
-		goto ioctl_out;
-	}
-	if (cmd != AGPIOC_ACQUIRE32) {
-		if (!(test_bit(AGP_FF_IS_CONTROLLER, &curr_priv->access_flags))) {
-			ret_val = -EPERM;
-			goto ioctl_out;
-		}
-		/* Use the original pid of the controller,
-		 * in case it's threaded */
-
-		if (agp_fe.current_controller->pid != curr_priv->my_pid) {
-			ret_val = -EBUSY;
-			goto ioctl_out;
-		}
-	}
-
-	switch (cmd) {
-	case AGPIOC_INFO32:
-		ret_val = compat_agpioc_info_wrap(curr_priv, (void __user *) arg);
-		break;
-
-	case AGPIOC_ACQUIRE32:
-		ret_val = agpioc_acquire_wrap(curr_priv);
-		break;
-
-	case AGPIOC_RELEASE32:
-		ret_val = agpioc_release_wrap(curr_priv);
-		break;
-
-	case AGPIOC_SETUP32:
-		ret_val = agpioc_setup_wrap(curr_priv, (void __user *) arg);
-		break;
-
-	case AGPIOC_RESERVE32:
-		ret_val = compat_agpioc_reserve_wrap(curr_priv, (void __user *) arg);
-		break;
-
-	case AGPIOC_PROTECT32:
-		ret_val = agpioc_protect_wrap(curr_priv);
-		break;
-
-	case AGPIOC_ALLOCATE32:
-		ret_val = compat_agpioc_allocate_wrap(curr_priv, (void __user *) arg);
-		break;
-
-	case AGPIOC_DEALLOCATE32:
-		ret_val = agpioc_deallocate_wrap(curr_priv, (int) arg);
-		break;
-
-	case AGPIOC_BIND32:
-		ret_val = compat_agpioc_bind_wrap(curr_priv, (void __user *) arg);
-		break;
-
-	case AGPIOC_UNBIND32:
-		ret_val = compat_agpioc_unbind_wrap(curr_priv, (void __user *) arg);
-		break;
-
-	case AGPIOC_CHIPSET_FLUSH32:
-		break;
-	}
-
-ioctl_out:
-	DBG("ioctl returns %d\n", ret_val);
-	mutex_unlock(&(agp_fe.agp_mutex));
-	return ret_val;
-}
-
diff --git a/drivers/char/agp/compat_ioctl.h b/drivers/char/agp/compat_ioctl.h
deleted file mode 100644
index f30e0fd979635..0000000000000
--- a/drivers/char/agp/compat_ioctl.h
+++ /dev/null
@@ -1,106 +0,0 @@
-/*
- * Copyright (C) 1999 Jeff Hartmann
- * Copyright (C) 1999 Precision Insight, Inc.
- * Copyright (C) 1999 Xi Graphics, Inc.
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included
- * in all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
- * OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
- * JEFF HARTMANN, OR ANY OTHER CONTRIBUTORS BE LIABLE FOR ANY CLAIM,
- * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
- * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE
- * OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
- *
- */
-
-#ifndef _AGP_COMPAT_IOCTL_H
-#define _AGP_COMPAT_IOCTL_H
-
-#include <linux/compat.h>
-#include <linux/agpgart.h>
-
-#define AGPIOC_INFO32       _IOR (AGPIOC_BASE, 0, compat_uptr_t)
-#define AGPIOC_ACQUIRE32    _IO  (AGPIOC_BASE, 1)
-#define AGPIOC_RELEASE32    _IO  (AGPIOC_BASE, 2)
-#define AGPIOC_SETUP32      _IOW (AGPIOC_BASE, 3, compat_uptr_t)
-#define AGPIOC_RESERVE32    _IOW (AGPIOC_BASE, 4, compat_uptr_t)
-#define AGPIOC_PROTECT32    _IOW (AGPIOC_BASE, 5, compat_uptr_t)
-#define AGPIOC_ALLOCATE32   _IOWR(AGPIOC_BASE, 6, compat_uptr_t)
-#define AGPIOC_DEALLOCATE32 _IOW (AGPIOC_BASE, 7, compat_int_t)
-#define AGPIOC_BIND32       _IOW (AGPIOC_BASE, 8, compat_uptr_t)
-#define AGPIOC_UNBIND32     _IOW (AGPIOC_BASE, 9, compat_uptr_t)
-#define AGPIOC_CHIPSET_FLUSH32 _IO (AGPIOC_BASE, 10)
-
-struct agp_info32 {
-	struct agp_version version;	/* version of the driver        */
-	u32 bridge_id;		/* bridge vendor/device         */
-	u32 agp_mode;		/* mode info of bridge          */
-	compat_long_t aper_base;	/* base of aperture             */
-	compat_size_t aper_size;	/* size of aperture             */
-	compat_size_t pg_total;	/* max pages (swap + system)    */
-	compat_size_t pg_system;	/* max pages (system)           */
-	compat_size_t pg_used;		/* current pages used           */
-};
-
-/*
- * The "prot" down below needs still a "sleep" flag somehow ...
- */
-struct agp_segment32 {
-	compat_off_t pg_start;		/* starting page to populate    */
-	compat_size_t pg_count;	/* number of pages              */
-	compat_int_t prot;		/* prot flags for mmap          */
-};
-
-struct agp_region32 {
-	compat_pid_t pid;		/* pid of process               */
-	compat_size_t seg_count;	/* number of segments           */
-	struct agp_segment32 *seg_list;
-};
-
-struct agp_allocate32 {
-	compat_int_t key;		/* tag of allocation            */
-	compat_size_t pg_count;	/* number of pages              */
-	u32 type;		/* 0 == normal, other devspec   */
-	u32 physical;           /* device specific (some devices
-				 * need a phys address of the
-				 * actual page behind the gatt
-				 * table)                        */
-};
-
-struct agp_bind32 {
-	compat_int_t key;		/* tag of allocation            */
-	compat_off_t pg_start;		/* starting page to populate    */
-};
-
-struct agp_unbind32 {
-	compat_int_t key;		/* tag of allocation            */
-	u32 priority;		/* priority for paging out      */
-};
-
-extern struct agp_front_data agp_fe;
-
-int agpioc_acquire_wrap(struct agp_file_private *priv);
-int agpioc_release_wrap(struct agp_file_private *priv);
-int agpioc_protect_wrap(struct agp_file_private *priv);
-int agpioc_setup_wrap(struct agp_file_private *priv, void __user *arg);
-int agpioc_deallocate_wrap(struct agp_file_private *priv, int arg);
-struct agp_file_private *agp_find_private(pid_t pid);
-struct agp_client *agp_create_client(pid_t id);
-int agp_remove_client(pid_t id);
-int agp_create_segment(struct agp_client *client, struct agp_region *region);
-void agp_free_memory_wrap(struct agp_memory *memory);
-struct agp_memory *agp_allocate_memory_wrap(size_t pg_count, u32 type);
-struct agp_memory *agp_find_mem_by_key(int key);
-struct agp_client *agp_find_client_by_pid(pid_t id);
-
-#endif /* _AGP_COMPAT_H */
diff --git a/drivers/char/agp/frontend.c b/drivers/char/agp/frontend.c
deleted file mode 100644
index 321118a9cfa52..0000000000000
--- a/drivers/char/agp/frontend.c
+++ /dev/null
@@ -1,1068 +0,0 @@
-/*
- * AGPGART driver frontend
- * Copyright (C) 2004 Silicon Graphics, Inc.
- * Copyright (C) 2002-2003 Dave Jones
- * Copyright (C) 1999 Jeff Hartmann
- * Copyright (C) 1999 Precision Insight, Inc.
- * Copyright (C) 1999 Xi Graphics, Inc.
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included
- * in all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
- * OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
- * JEFF HARTMANN, OR ANY OTHER CONTRIBUTORS BE LIABLE FOR ANY CLAIM,
- * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
- * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE
- * OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
- *
- */
-
-#include <linux/types.h>
-#include <linux/kernel.h>
-#include <linux/module.h>
-#include <linux/mman.h>
-#include <linux/pci.h>
-#include <linux/miscdevice.h>
-#include <linux/agp_backend.h>
-#include <linux/agpgart.h>
-#include <linux/slab.h>
-#include <linux/mm.h>
-#include <linux/fs.h>
-#include <linux/sched.h>
-#include <linux/uaccess.h>
-
-#include "agp.h"
-#include "compat_ioctl.h"
-
-struct agp_front_data agp_fe;
-
-struct agp_memory *agp_find_mem_by_key(int key)
-{
-	struct agp_memory *curr;
-
-	if (agp_fe.current_controller == NULL)
-		return NULL;
-
-	curr = agp_fe.current_controller->pool;
-
-	while (curr != NULL) {
-		if (curr->key == key)
-			break;
-		curr = curr->next;
-	}
-
-	DBG("key=%d -> mem=%p", key, curr);
-	return curr;
-}
-
-static void agp_remove_from_pool(struct agp_memory *temp)
-{
-	struct agp_memory *prev;
-	struct agp_memory *next;
-
-	/* Check to see if this is even in the memory pool */
-
-	DBG("mem=%p", temp);
-	if (agp_find_mem_by_key(temp->key) != NULL) {
-		next = temp->next;
-		prev = temp->prev;
-
-		if (prev != NULL) {
-			prev->next = next;
-			if (next != NULL)
-				next->prev = prev;
-
-		} else {
-			/* This is the first item on the list */
-			if (next != NULL)
-				next->prev = NULL;
-
-			agp_fe.current_controller->pool = next;
-		}
-	}
-}
-
-/*
- * Routines for managing each client's segment list -
- * These routines handle adding and removing segments
- * to each auth'ed client.
- */
-
-static struct
-agp_segment_priv *agp_find_seg_in_client(const struct agp_client *client,
-						unsigned long offset,
-					    int size, pgprot_t page_prot)
-{
-	struct agp_segment_priv *seg;
-	int i;
-	off_t pg_start;
-	size_t pg_count;
-
-	pg_start = offset / 4096;
-	pg_count = size / 4096;
-	seg = *(client->segments);
-
-	for (i = 0; i < client->num_segments; i++) {
-		if ((seg[i].pg_start == pg_start) &&
-		    (seg[i].pg_count == pg_count) &&
-		    (pgprot_val(seg[i].prot) == pgprot_val(page_prot))) {
-			return seg + i;
-		}
-	}
-
-	return NULL;
-}
-
-static void agp_remove_seg_from_client(struct agp_client *client)
-{
-	DBG("client=%p", client);
-
-	if (client->segments != NULL) {
-		if (*(client->segments) != NULL) {
-			DBG("Freeing %p from client %p", *(client->segments), client);
-			kfree(*(client->segments));
-		}
-		DBG("Freeing %p from client %p", client->segments, client);
-		kfree(client->segments);
-		client->segments = NULL;
-	}
-}
-
-static void agp_add_seg_to_client(struct agp_client *client,
-			       struct agp_segment_priv ** seg, int num_segments)
-{
-	struct agp_segment_priv **prev_seg;
-
-	prev_seg = client->segments;
-
-	if (prev_seg != NULL)
-		agp_remove_seg_from_client(client);
-
-	DBG("Adding seg %p (%d segments) to client %p", seg, num_segments, client);
-	client->num_segments = num_segments;
-	client->segments = seg;
-}
-
-static pgprot_t agp_convert_mmap_flags(int prot)
-{
-	unsigned long prot_bits;
-
-	prot_bits = calc_vm_prot_bits(prot, 0) | VM_SHARED;
-	return vm_get_page_prot(prot_bits);
-}
-
-int agp_create_segment(struct agp_client *client, struct agp_region *region)
-{
-	struct agp_segment_priv **ret_seg;
-	struct agp_segment_priv *seg;
-	struct agp_segment *user_seg;
-	size_t i;
-
-	seg = kzalloc((sizeof(struct agp_segment_priv) * region->seg_count), GFP_KERNEL);
-	if (seg == NULL) {
-		kfree(region->seg_list);
-		region->seg_list = NULL;
-		return -ENOMEM;
-	}
-	user_seg = region->seg_list;
-
-	for (i = 0; i < region->seg_count; i++) {
-		seg[i].pg_start = user_seg[i].pg_start;
-		seg[i].pg_count = user_seg[i].pg_count;
-		seg[i].prot = agp_convert_mmap_flags(user_seg[i].prot);
-	}
-	kfree(region->seg_list);
-	region->seg_list = NULL;
-
-	ret_seg = kmalloc(sizeof(void *), GFP_KERNEL);
-	if (ret_seg == NULL) {
-		kfree(seg);
-		return -ENOMEM;
-	}
-	*ret_seg = seg;
-	agp_add_seg_to_client(client, ret_seg, region->seg_count);
-	return 0;
-}
-
-/* End - Routines for managing each client's segment list */
-
-/* This function must only be called when current_controller != NULL */
-static void agp_insert_into_pool(struct agp_memory * temp)
-{
-	struct agp_memory *prev;
-
-	prev = agp_fe.current_controller->pool;
-
-	if (prev != NULL) {
-		prev->prev = temp;
-		temp->next = prev;
-	}
-	agp_fe.current_controller->pool = temp;
-}
-
-
-/* File private list routines */
-
-struct agp_file_private *agp_find_private(pid_t pid)
-{
-	struct agp_file_private *curr;
-
-	curr = agp_fe.file_priv_list;
-
-	while (curr != NULL) {
-		if (curr->my_pid == pid)
-			return curr;
-		curr = curr->next;
-	}
-
-	return NULL;
-}
-
-static void agp_insert_file_private(struct agp_file_private * priv)
-{
-	struct agp_file_private *prev;
-
-	prev = agp_fe.file_priv_list;
-
-	if (prev != NULL)
-		prev->prev = priv;
-	priv->next = prev;
-	agp_fe.file_priv_list = priv;
-}
-
-static void agp_remove_file_private(struct agp_file_private * priv)
-{
-	struct agp_file_private *next;
-	struct agp_file_private *prev;
-
-	next = priv->next;
-	prev = priv->prev;
-
-	if (prev != NULL) {
-		prev->next = next;
-
-		if (next != NULL)
-			next->prev = prev;
-
-	} else {
-		if (next != NULL)
-			next->prev = NULL;
-
-		agp_fe.file_priv_list = next;
-	}
-}
-
-/* End - File flag list routines */
-
-/*
- * Wrappers for agp_free_memory & agp_allocate_memory
- * These make sure that internal lists are kept updated.
- */
-void agp_free_memory_wrap(struct agp_memory *memory)
-{
-	agp_remove_from_pool(memory);
-	agp_free_memory(memory);
-}
-
-struct agp_memory *agp_allocate_memory_wrap(size_t pg_count, u32 type)
-{
-	struct agp_memory *memory;
-
-	memory = agp_allocate_memory(agp_bridge, pg_count, type);
-	if (memory == NULL)
-		return NULL;
-
-	agp_insert_into_pool(memory);
-	return memory;
-}
-
-/* Routines for managing the list of controllers -
- * These routines manage the current controller, and the list of
- * controllers
- */
-
-static struct agp_controller *agp_find_controller_by_pid(pid_t id)
-{
-	struct agp_controller *controller;
-
-	controller = agp_fe.controllers;
-
-	while (controller != NULL) {
-		if (controller->pid == id)
-			return controller;
-		controller = controller->next;
-	}
-
-	return NULL;
-}
-
-static struct agp_controller *agp_create_controller(pid_t id)
-{
-	struct agp_controller *controller;
-
-	controller = kzalloc(sizeof(struct agp_controller), GFP_KERNEL);
-	if (controller == NULL)
-		return NULL;
-
-	controller->pid = id;
-	return controller;
-}
-
-static int agp_insert_controller(struct agp_controller *controller)
-{
-	struct agp_controller *prev_controller;
-
-	prev_controller = agp_fe.controllers;
-	controller->next = prev_controller;
-
-	if (prev_controller != NULL)
-		prev_controller->prev = controller;
-
-	agp_fe.controllers = controller;
-
-	return 0;
-}
-
-static void agp_remove_all_clients(struct agp_controller *controller)
-{
-	struct agp_client *client;
-	struct agp_client *temp;
-
-	client = controller->clients;
-
-	while (client) {
-		struct agp_file_private *priv;
-
-		temp = client;
-		agp_remove_seg_from_client(temp);
-		priv = agp_find_private(temp->pid);
-
-		if (priv != NULL) {
-			clear_bit(AGP_FF_IS_VALID, &priv->access_flags);
-			clear_bit(AGP_FF_IS_CLIENT, &priv->access_flags);
-		}
-		client = client->next;
-		kfree(temp);
-	}
-}
-
-static void agp_remove_all_memory(struct agp_controller *controller)
-{
-	struct agp_memory *memory;
-	struct agp_memory *temp;
-
-	memory = controller->pool;
-
-	while (memory) {
-		temp = memory;
-		memory = memory->next;
-		agp_free_memory_wrap(temp);
-	}
-}
-
-static int agp_remove_controller(struct agp_controller *controller)
-{
-	struct agp_controller *prev_controller;
-	struct agp_controller *next_controller;
-
-	prev_controller = controller->prev;
-	next_controller = controller->next;
-
-	if (prev_controller != NULL) {
-		prev_controller->next = next_controller;
-		if (next_controller != NULL)
-			next_controller->prev = prev_controller;
-
-	} else {
-		if (next_controller != NULL)
-			next_controller->prev = NULL;
-
-		agp_fe.controllers = next_controller;
-	}
-
-	agp_remove_all_memory(controller);
-	agp_remove_all_clients(controller);
-
-	if (agp_fe.current_controller == controller) {
-		agp_fe.current_controller = NULL;
-		agp_fe.backend_acquired = false;
-		agp_backend_release(agp_bridge);
-	}
-	kfree(controller);
-	return 0;
-}
-
-static void agp_controller_make_current(struct agp_controller *controller)
-{
-	struct agp_client *clients;
-
-	clients = controller->clients;
-
-	while (clients != NULL) {
-		struct agp_file_private *priv;
-
-		priv = agp_find_private(clients->pid);
-
-		if (priv != NULL) {
-			set_bit(AGP_FF_IS_VALID, &priv->access_flags);
-			set_bit(AGP_FF_IS_CLIENT, &priv->access_flags);
-		}
-		clients = clients->next;
-	}
-
-	agp_fe.current_controller = controller;
-}
-
-static void agp_controller_release_current(struct agp_controller *controller,
-				      struct agp_file_private *controller_priv)
-{
-	struct agp_client *clients;
-
-	clear_bit(AGP_FF_IS_VALID, &controller_priv->access_flags);
-	clients = controller->clients;
-
-	while (clients != NULL) {
-		struct agp_file_private *priv;
-
-		priv = agp_find_private(clients->pid);
-
-		if (priv != NULL)
-			clear_bit(AGP_FF_IS_VALID, &priv->access_flags);
-
-		clients = clients->next;
-	}
-
-	agp_fe.current_controller = NULL;
-	agp_fe.used_by_controller = false;
-	agp_backend_release(agp_bridge);
-}
-
-/*
- * Routines for managing client lists -
- * These routines are for managing the list of auth'ed clients.
- */
-
-static struct agp_client
-*agp_find_client_in_controller(struct agp_controller *controller, pid_t id)
-{
-	struct agp_client *client;
-
-	if (controller == NULL)
-		return NULL;
-
-	client = controller->clients;
-
-	while (client != NULL) {
-		if (client->pid == id)
-			return client;
-		client = client->next;
-	}
-
-	return NULL;
-}
-
-static struct agp_controller *agp_find_controller_for_client(pid_t id)
-{
-	struct agp_controller *controller;
-
-	controller = agp_fe.controllers;
-
-	while (controller != NULL) {
-		if ((agp_find_client_in_controller(controller, id)) != NULL)
-			return controller;
-		controller = controller->next;
-	}
-
-	return NULL;
-}
-
-struct agp_client *agp_find_client_by_pid(pid_t id)
-{
-	struct agp_client *temp;
-
-	if (agp_fe.current_controller == NULL)
-		return NULL;
-
-	temp = agp_find_client_in_controller(agp_fe.current_controller, id);
-	return temp;
-}
-
-static void agp_insert_client(struct agp_client *client)
-{
-	struct agp_client *prev_client;
-
-	prev_client = agp_fe.current_controller->clients;
-	client->next = prev_client;
-
-	if (prev_client != NULL)
-		prev_client->prev = client;
-
-	agp_fe.current_controller->clients = client;
-	agp_fe.current_controller->num_clients++;
-}
-
-struct agp_client *agp_create_client(pid_t id)
-{
-	struct agp_client *new_client;
-
-	new_client = kzalloc(sizeof(struct agp_client), GFP_KERNEL);
-	if (new_client == NULL)
-		return NULL;
-
-	new_client->pid = id;
-	agp_insert_client(new_client);
-	return new_client;
-}
-
-int agp_remove_client(pid_t id)
-{
-	struct agp_client *client;
-	struct agp_client *prev_client;
-	struct agp_client *next_client;
-	struct agp_controller *controller;
-
-	controller = agp_find_controller_for_client(id);
-	if (controller == NULL)
-		return -EINVAL;
-
-	client = agp_find_client_in_controller(controller, id);
-	if (client == NULL)
-		return -EINVAL;
-
-	prev_client = client->prev;
-	next_client = client->next;
-
-	if (prev_client != NULL) {
-		prev_client->next = next_client;
-		if (next_client != NULL)
-			next_client->prev = prev_client;
-
-	} else {
-		if (next_client != NULL)
-			next_client->prev = NULL;
-		controller->clients = next_client;
-	}
-
-	controller->num_clients--;
-	agp_remove_seg_from_client(client);
-	kfree(client);
-	return 0;
-}
-
-/* End - Routines for managing client lists */
-
-/* File Operations */
-
-static int agp_mmap(struct file *file, struct vm_area_struct *vma)
-{
-	unsigned int size, current_size;
-	unsigned long offset;
-	struct agp_client *client;
-	struct agp_file_private *priv = file->private_data;
-	struct agp_kern_info kerninfo;
-
-	mutex_lock(&(agp_fe.agp_mutex));
-
-	if (agp_fe.backend_acquired != true)
-		goto out_eperm;
-
-	if (!(test_bit(AGP_FF_IS_VALID, &priv->access_flags)))
-		goto out_eperm;
-
-	agp_copy_info(agp_bridge, &kerninfo);
-	size = vma->vm_end - vma->vm_start;
-	current_size = kerninfo.aper_size;
-	current_size = current_size * 0x100000;
-	offset = vma->vm_pgoff << PAGE_SHIFT;
-	DBG("%lx:%lx", offset, offset+size);
-
-	if (test_bit(AGP_FF_IS_CLIENT, &priv->access_flags)) {
-		if ((size + offset) > current_size)
-			goto out_inval;
-
-		client = agp_find_client_by_pid(current->pid);
-
-		if (client == NULL)
-			goto out_eperm;
-
-		if (!agp_find_seg_in_client(client, offset, size, vma->vm_page_prot))
-			goto out_inval;
-
-		DBG("client vm_ops=%p", kerninfo.vm_ops);
-		if (kerninfo.vm_ops) {
-			vma->vm_ops = kerninfo.vm_ops;
-		} else if (io_remap_pfn_range(vma, vma->vm_start,
-				(kerninfo.aper_base + offset) >> PAGE_SHIFT,
-				size,
-				pgprot_writecombine(vma->vm_page_prot))) {
-			goto out_again;
-		}
-		mutex_unlock(&(agp_fe.agp_mutex));
-		return 0;
-	}
-
-	if (test_bit(AGP_FF_IS_CONTROLLER, &priv->access_flags)) {
-		if (size != current_size)
-			goto out_inval;
-
-		DBG("controller vm_ops=%p", kerninfo.vm_ops);
-		if (kerninfo.vm_ops) {
-			vma->vm_ops = kerninfo.vm_ops;
-		} else if (io_remap_pfn_range(vma, vma->vm_start,
-				kerninfo.aper_base >> PAGE_SHIFT,
-				size,
-				pgprot_writecombine(vma->vm_page_prot))) {
-			goto out_again;
-		}
-		mutex_unlock(&(agp_fe.agp_mutex));
-		return 0;
-	}
-
-out_eperm:
-	mutex_unlock(&(agp_fe.agp_mutex));
-	return -EPERM;
-
-out_inval:
-	mutex_unlock(&(agp_fe.agp_mutex));
-	return -EINVAL;
-
-out_again:
-	mutex_unlock(&(agp_fe.agp_mutex));
-	return -EAGAIN;
-}
-
-static int agp_release(struct inode *inode, struct file *file)
-{
-	struct agp_file_private *priv = file->private_data;
-
-	mutex_lock(&(agp_fe.agp_mutex));
-
-	DBG("priv=%p", priv);
-
-	if (test_bit(AGP_FF_IS_CONTROLLER, &priv->access_flags)) {
-		struct agp_controller *controller;
-
-		controller = agp_find_controller_by_pid(priv->my_pid);
-
-		if (controller != NULL) {
-			if (controller == agp_fe.current_controller)
-				agp_controller_release_current(controller, priv);
-			agp_remove_controller(controller);
-			controller = NULL;
-		}
-	}
-
-	if (test_bit(AGP_FF_IS_CLIENT, &priv->access_flags))
-		agp_remove_client(priv->my_pid);
-
-	agp_remove_file_private(priv);
-	kfree(priv);
-	file->private_data = NULL;
-	mutex_unlock(&(agp_fe.agp_mutex));
-	return 0;
-}
-
-static int agp_open(struct inode *inode, struct file *file)
-{
-	int minor = iminor(inode);
-	struct agp_file_private *priv;
-	struct agp_client *client;
-
-	if (minor != AGPGART_MINOR)
-		return -ENXIO;
-
-	mutex_lock(&(agp_fe.agp_mutex));
-
-	priv = kzalloc(sizeof(struct agp_file_private), GFP_KERNEL);
-	if (priv == NULL) {
-		mutex_unlock(&(agp_fe.agp_mutex));
-		return -ENOMEM;
-	}
-
-	set_bit(AGP_FF_ALLOW_CLIENT, &priv->access_flags);
-	priv->my_pid = current->pid;
-
-	if (capable(CAP_SYS_RAWIO))
-		/* Root priv, can be controller */
-		set_bit(AGP_FF_ALLOW_CONTROLLER, &priv->access_flags);
-
-	client = agp_find_client_by_pid(current->pid);
-
-	if (client != NULL) {
-		set_bit(AGP_FF_IS_CLIENT, &priv->access_flags);
-		set_bit(AGP_FF_IS_VALID, &priv->access_flags);
-	}
-	file->private_data = (void *) priv;
-	agp_insert_file_private(priv);
-	DBG("private=%p, client=%p", priv, client);
-
-	mutex_unlock(&(agp_fe.agp_mutex));
-
-	return 0;
-}
-
-static int agpioc_info_wrap(struct agp_file_private *priv, void __user *arg)
-{
-	struct agp_info userinfo;
-	struct agp_kern_info kerninfo;
-
-	agp_copy_info(agp_bridge, &kerninfo);
-
-	memset(&userinfo, 0, sizeof(userinfo));
-	userinfo.version.major = kerninfo.version.major;
-	userinfo.version.minor = kerninfo.version.minor;
-	userinfo.bridge_id = kerninfo.device->vendor |
-	    (kerninfo.device->device << 16);
-	userinfo.agp_mode = kerninfo.mode;
-	userinfo.aper_base = kerninfo.aper_base;
-	userinfo.aper_size = kerninfo.aper_size;
-	userinfo.pg_total = userinfo.pg_system = kerninfo.max_memory;
-	userinfo.pg_used = kerninfo.current_memory;
-
-	if (copy_to_user(arg, &userinfo, sizeof(struct agp_info)))
-		return -EFAULT;
-
-	return 0;
-}
-
-int agpioc_acquire_wrap(struct agp_file_private *priv)
-{
-	struct agp_controller *controller;
-
-	DBG("");
-
-	if (!(test_bit(AGP_FF_ALLOW_CONTROLLER, &priv->access_flags)))
-		return -EPERM;
-
-	if (agp_fe.current_controller != NULL)
-		return -EBUSY;
-
-	if (!agp_bridge)
-		return -ENODEV;
-
-        if (atomic_read(&agp_bridge->agp_in_use))
-                return -EBUSY;
-
-	atomic_inc(&agp_bridge->agp_in_use);
-
-	agp_fe.backend_acquired = true;
-
-	controller = agp_find_controller_by_pid(priv->my_pid);
-
-	if (controller != NULL) {
-		agp_controller_make_current(controller);
-	} else {
-		controller = agp_create_controller(priv->my_pid);
-
-		if (controller == NULL) {
-			agp_fe.backend_acquired = false;
-			agp_backend_release(agp_bridge);
-			return -ENOMEM;
-		}
-		agp_insert_controller(controller);
-		agp_controller_make_current(controller);
-	}
-
-	set_bit(AGP_FF_IS_CONTROLLER, &priv->access_flags);
-	set_bit(AGP_FF_IS_VALID, &priv->access_flags);
-	return 0;
-}
-
-int agpioc_release_wrap(struct agp_file_private *priv)
-{
-	DBG("");
-	agp_controller_release_current(agp_fe.current_controller, priv);
-	return 0;
-}
-
-int agpioc_setup_wrap(struct agp_file_private *priv, void __user *arg)
-{
-	struct agp_setup mode;
-
-	DBG("");
-	if (copy_from_user(&mode, arg, sizeof(struct agp_setup)))
-		return -EFAULT;
-
-	agp_enable(agp_bridge, mode.agp_mode);
-	return 0;
-}
-
-static int agpioc_reserve_wrap(struct agp_file_private *priv, void __user *arg)
-{
-	struct agp_region reserve;
-	struct agp_client *client;
-	struct agp_file_private *client_priv;
-
-	DBG("");
-	if (copy_from_user(&reserve, arg, sizeof(struct agp_region)))
-		return -EFAULT;
-
-	if ((unsigned) reserve.seg_count >= ~0U/sizeof(struct agp_segment))
-		return -EFAULT;
-
-	client = agp_find_client_by_pid(reserve.pid);
-
-	if (reserve.seg_count == 0) {
-		/* remove a client */
-		client_priv = agp_find_private(reserve.pid);
-
-		if (client_priv != NULL) {
-			set_bit(AGP_FF_IS_CLIENT, &client_priv->access_flags);
-			set_bit(AGP_FF_IS_VALID, &client_priv->access_flags);
-		}
-		if (client == NULL) {
-			/* client is already removed */
-			return 0;
-		}
-		return agp_remove_client(reserve.pid);
-	} else {
-		struct agp_segment *segment;
-
-		if (reserve.seg_count >= 16384)
-			return -EINVAL;
-
-		segment = kmalloc((sizeof(struct agp_segment) * reserve.seg_count),
-				  GFP_KERNEL);
-
-		if (segment == NULL)
-			return -ENOMEM;
-
-		if (copy_from_user(segment, (void __user *) reserve.seg_list,
-				   sizeof(struct agp_segment) * reserve.seg_count)) {
-			kfree(segment);
-			return -EFAULT;
-		}
-		reserve.seg_list = segment;
-
-		if (client == NULL) {
-			/* Create the client and add the segment */
-			client = agp_create_client(reserve.pid);
-
-			if (client == NULL) {
-				kfree(segment);
-				return -ENOMEM;
-			}
-			client_priv = agp_find_private(reserve.pid);
-
-			if (client_priv != NULL) {
-				set_bit(AGP_FF_IS_CLIENT, &client_priv->access_flags);
-				set_bit(AGP_FF_IS_VALID, &client_priv->access_flags);
-			}
-		}
-		return agp_create_segment(client, &reserve);
-	}
-	/* Will never really happen */
-	return -EINVAL;
-}
-
-int agpioc_protect_wrap(struct agp_file_private *priv)
-{
-	DBG("");
-	/* This function is not currently implemented */
-	return -EINVAL;
-}
-
-static int agpioc_allocate_wrap(struct agp_file_private *priv, void __user *arg)
-{
-	struct agp_memory *memory;
-	struct agp_allocate alloc;
-
-	DBG("");
-	if (copy_from_user(&alloc, arg, sizeof(struct agp_allocate)))
-		return -EFAULT;
-
-	if (alloc.type >= AGP_USER_TYPES)
-		return -EINVAL;
-
-	memory = agp_allocate_memory_wrap(alloc.pg_count, alloc.type);
-
-	if (memory == NULL)
-		return -ENOMEM;
-
-	alloc.key = memory->key;
-	alloc.physical = memory->physical;
-
-	if (copy_to_user(arg, &alloc, sizeof(struct agp_allocate))) {
-		agp_free_memory_wrap(memory);
-		return -EFAULT;
-	}
-	return 0;
-}
-
-int agpioc_deallocate_wrap(struct agp_file_private *priv, int arg)
-{
-	struct agp_memory *memory;
-
-	DBG("");
-	memory = agp_find_mem_by_key(arg);
-
-	if (memory == NULL)
-		return -EINVAL;
-
-	agp_free_memory_wrap(memory);
-	return 0;
-}
-
-static int agpioc_bind_wrap(struct agp_file_private *priv, void __user *arg)
-{
-	struct agp_bind bind_info;
-	struct agp_memory *memory;
-
-	DBG("");
-	if (copy_from_user(&bind_info, arg, sizeof(struct agp_bind)))
-		return -EFAULT;
-
-	memory = agp_find_mem_by_key(bind_info.key);
-
-	if (memory == NULL)
-		return -EINVAL;
-
-	return agp_bind_memory(memory, bind_info.pg_start);
-}
-
-static int agpioc_unbind_wrap(struct agp_file_private *priv, void __user *arg)
-{
-	struct agp_memory *memory;
-	struct agp_unbind unbind;
-
-	DBG("");
-	if (copy_from_user(&unbind, arg, sizeof(struct agp_unbind)))
-		return -EFAULT;
-
-	memory = agp_find_mem_by_key(unbind.key);
-
-	if (memory == NULL)
-		return -EINVAL;
-
-	return agp_unbind_memory(memory);
-}
-
-static long agp_ioctl(struct file *file,
-		     unsigned int cmd, unsigned long arg)
-{
-	struct agp_file_private *curr_priv = file->private_data;
-	int ret_val = -ENOTTY;
-
-	DBG("priv=%p, cmd=%x", curr_priv, cmd);
-	mutex_lock(&(agp_fe.agp_mutex));
-
-	if ((agp_fe.current_controller == NULL) &&
-	    (cmd != AGPIOC_ACQUIRE)) {
-		ret_val = -EINVAL;
-		goto ioctl_out;
-	}
-	if ((agp_fe.backend_acquired != true) &&
-	    (cmd != AGPIOC_ACQUIRE)) {
-		ret_val = -EBUSY;
-		goto ioctl_out;
-	}
-	if (cmd != AGPIOC_ACQUIRE) {
-		if (!(test_bit(AGP_FF_IS_CONTROLLER, &curr_priv->access_flags))) {
-			ret_val = -EPERM;
-			goto ioctl_out;
-		}
-		/* Use the original pid of the controller,
-		 * in case it's threaded */
-
-		if (agp_fe.current_controller->pid != curr_priv->my_pid) {
-			ret_val = -EBUSY;
-			goto ioctl_out;
-		}
-	}
-
-	switch (cmd) {
-	case AGPIOC_INFO:
-		ret_val = agpioc_info_wrap(curr_priv, (void __user *) arg);
-		break;
-
-	case AGPIOC_ACQUIRE:
-		ret_val = agpioc_acquire_wrap(curr_priv);
-		break;
-
-	case AGPIOC_RELEASE:
-		ret_val = agpioc_release_wrap(curr_priv);
-		break;
-
-	case AGPIOC_SETUP:
-		ret_val = agpioc_setup_wrap(curr_priv, (void __user *) arg);
-		break;
-
-	case AGPIOC_RESERVE:
-		ret_val = agpioc_reserve_wrap(curr_priv, (void __user *) arg);
-		break;
-
-	case AGPIOC_PROTECT:
-		ret_val = agpioc_protect_wrap(curr_priv);
-		break;
-
-	case AGPIOC_ALLOCATE:
-		ret_val = agpioc_allocate_wrap(curr_priv, (void __user *) arg);
-		break;
-
-	case AGPIOC_DEALLOCATE:
-		ret_val = agpioc_deallocate_wrap(curr_priv, (int) arg);
-		break;
-
-	case AGPIOC_BIND:
-		ret_val = agpioc_bind_wrap(curr_priv, (void __user *) arg);
-		break;
-
-	case AGPIOC_UNBIND:
-		ret_val = agpioc_unbind_wrap(curr_priv, (void __user *) arg);
-		break;
-
-	case AGPIOC_CHIPSET_FLUSH:
-		break;
-	}
-
-ioctl_out:
-	DBG("ioctl returns %d\n", ret_val);
-	mutex_unlock(&(agp_fe.agp_mutex));
-	return ret_val;
-}
-
-static const struct file_operations agp_fops =
-{
-	.owner		= THIS_MODULE,
-	.llseek		= no_llseek,
-	.unlocked_ioctl	= agp_ioctl,
-#ifdef CONFIG_COMPAT
-	.compat_ioctl	= compat_agp_ioctl,
-#endif
-	.mmap		= agp_mmap,
-	.open		= agp_open,
-	.release	= agp_release,
-};
-
-static struct miscdevice agp_miscdev =
-{
-	.minor	= AGPGART_MINOR,
-	.name	= "agpgart",
-	.fops	= &agp_fops
-};
-
-int agp_frontend_initialize(void)
-{
-	memset(&agp_fe, 0, sizeof(struct agp_front_data));
-	mutex_init(&(agp_fe.agp_mutex));
-
-	if (misc_register(&agp_miscdev)) {
-		printk(KERN_ERR PFX "unable to get minor: %d\n", AGPGART_MINOR);
-		return -EIO;
-	}
-	return 0;
-}
-
-void agp_frontend_cleanup(void)
-{
-	misc_deregister(&agp_miscdev);
-}
-- 
2.42.1

