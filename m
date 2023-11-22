Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62CB17F4607
	for <lists+dri-devel@lfdr.de>; Wed, 22 Nov 2023 13:25:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2F0410E616;
	Wed, 22 Nov 2023 12:25:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF06310E60F
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Nov 2023 12:24:56 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1643D1FD5F;
 Wed, 22 Nov 2023 12:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1700655895; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aT2rXaDbygh8YxGzTB5shrK5h7V9pMxCBk1NgcqEbQA=;
 b=hhkn7VTRzY80StmdVJxJt3T9y3EKddBxuqtaJQhY/BIJl6MSeBkq0A2C1ycMP6vCtwBnn+
 92P18ApDXed/7aurZuuCUYMLuAEs7kfG2sYjfoC5yDqBVRNZd6B+OOe0twnLd7Z/NqQ/xJ
 HCaMehluyp+3byOBN5c8ojWGuZ01Qe8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1700655895;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aT2rXaDbygh8YxGzTB5shrK5h7V9pMxCBk1NgcqEbQA=;
 b=ooyLX6Sly26U2WFYOD2Slywp7JTUufEkMaWrvJ0+qFufNaQzhTzPXE3rxzKpYoYXiX4Hnm
 OFcS2ryEBPWL7LAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EB17B13467;
 Wed, 22 Nov 2023 12:24:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id wNSlOBbzXWU2TAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 22 Nov 2023 12:24:54 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@gmail.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, cai.huoqing@linux.dev
Subject: [PATCH 08/14] drm: Remove entry points for legacy ioctls
Date: Wed, 22 Nov 2023 13:09:37 +0100
Message-ID: <20231122122449.11588-9-tzimmermann@suse.de>
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
 TO_DN_SOME(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 R_MISSING_CHARSET(2.50)[]; MIME_GOOD(-0.10)[text/plain];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; REPLY(-4.00)[];
 BROKEN_CONTENT_TYPE(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
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

DRM drivers with user-space mode setting have been removed in Linux
v6.3. [1] Now remove the ioctl entry points for these drivers. Invoking
any of the ioctl ops will unconditionally return -EINVAL to user space.
This has already been the behavior for kernels without CONFIG_DRM_LEGACY
set.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Link: https://patchwork.freedesktop.org/series/111602/ # [1]
---
 drivers/gpu/drm/drm_ioc32.c | 610 ------------------------------------
 drivers/gpu/drm/drm_ioctl.c |  57 ----
 2 files changed, 667 deletions(-)

diff --git a/drivers/gpu/drm/drm_ioc32.c b/drivers/gpu/drm/drm_ioc32.c
index c0163cb076ad8..910cadf14756e 100644
--- a/drivers/gpu/drm/drm_ioc32.c
+++ b/drivers/gpu/drm/drm_ioc32.c
@@ -37,7 +37,6 @@
 
 #include "drm_crtc_internal.h"
 #include "drm_internal.h"
-#include "drm_legacy.h"
 
 #define DRM_IOCTL_VERSION32		DRM_IOWR(0x00, drm_version32_t)
 #define DRM_IOCTL_GET_UNIQUE32		DRM_IOWR(0x01, drm_unique32_t)
@@ -164,92 +163,6 @@ static int compat_drm_setunique(struct file *file, unsigned int cmd,
 	return -EINVAL;
 }
 
-#if IS_ENABLED(CONFIG_DRM_LEGACY)
-typedef struct drm_map32 {
-	u32 offset;		/* Requested physical address (0 for SAREA) */
-	u32 size;		/* Requested physical size (bytes) */
-	enum drm_map_type type;	/* Type of memory to map */
-	enum drm_map_flags flags;	/* Flags */
-	u32 handle;		/* User-space: "Handle" to pass to mmap() */
-	int mtrr;		/* MTRR slot used */
-} drm_map32_t;
-
-static int compat_drm_getmap(struct file *file, unsigned int cmd,
-			     unsigned long arg)
-{
-	drm_map32_t __user *argp = (void __user *)arg;
-	drm_map32_t m32;
-	struct drm_map map;
-	int err;
-
-	if (copy_from_user(&m32, argp, sizeof(m32)))
-		return -EFAULT;
-
-	map.offset = m32.offset;
-	err = drm_ioctl_kernel(file, drm_legacy_getmap_ioctl, &map, 0);
-	if (err)
-		return err;
-
-	m32.offset = map.offset;
-	m32.size = map.size;
-	m32.type = map.type;
-	m32.flags = map.flags;
-	m32.handle = ptr_to_compat((void __user *)map.handle);
-	m32.mtrr = map.mtrr;
-	if (copy_to_user(argp, &m32, sizeof(m32)))
-		return -EFAULT;
-	return 0;
-
-}
-
-static int compat_drm_addmap(struct file *file, unsigned int cmd,
-			     unsigned long arg)
-{
-	drm_map32_t __user *argp = (void __user *)arg;
-	drm_map32_t m32;
-	struct drm_map map;
-	int err;
-
-	if (copy_from_user(&m32, argp, sizeof(m32)))
-		return -EFAULT;
-
-	map.offset = m32.offset;
-	map.size = m32.size;
-	map.type = m32.type;
-	map.flags = m32.flags;
-
-	err = drm_ioctl_kernel(file, drm_legacy_addmap_ioctl, &map,
-				DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY);
-	if (err)
-		return err;
-
-	m32.offset = map.offset;
-	m32.mtrr = map.mtrr;
-	m32.handle = ptr_to_compat((void __user *)map.handle);
-	if (map.handle != compat_ptr(m32.handle))
-		pr_err_ratelimited("compat_drm_addmap truncated handle %p for type %d offset %x\n",
-				   map.handle, m32.type, m32.offset);
-
-	if (copy_to_user(argp, &m32, sizeof(m32)))
-		return -EFAULT;
-
-	return 0;
-}
-
-static int compat_drm_rmmap(struct file *file, unsigned int cmd,
-			    unsigned long arg)
-{
-	drm_map32_t __user *argp = (void __user *)arg;
-	struct drm_map map;
-	u32 handle;
-
-	if (get_user(handle, &argp->handle))
-		return -EFAULT;
-	map.handle = compat_ptr(handle);
-	return drm_ioctl_kernel(file, drm_legacy_rmmap_ioctl, &map, DRM_AUTH);
-}
-#endif
-
 typedef struct drm_client32 {
 	int idx;	/* Which client desired? */
 	int auth;	/* Is client authenticated? */
@@ -309,501 +222,6 @@ static int compat_drm_getstats(struct file *file, unsigned int cmd,
 	return 0;
 }
 
-#if IS_ENABLED(CONFIG_DRM_LEGACY)
-typedef struct drm_buf_desc32 {
-	int count;		 /* Number of buffers of this size */
-	int size;		 /* Size in bytes */
-	int low_mark;		 /* Low water mark */
-	int high_mark;		 /* High water mark */
-	int flags;
-	u32 agp_start;		 /* Start address in the AGP aperture */
-} drm_buf_desc32_t;
-
-static int compat_drm_addbufs(struct file *file, unsigned int cmd,
-			      unsigned long arg)
-{
-	drm_buf_desc32_t __user *argp = (void __user *)arg;
-	drm_buf_desc32_t desc32;
-	struct drm_buf_desc desc;
-	int err;
-
-	if (copy_from_user(&desc32, argp, sizeof(drm_buf_desc32_t)))
-		return -EFAULT;
-
-	desc = (struct drm_buf_desc){
-		desc32.count, desc32.size, desc32.low_mark, desc32.high_mark,
-		desc32.flags, desc32.agp_start
-	};
-
-	err = drm_ioctl_kernel(file, drm_legacy_addbufs, &desc,
-				   DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY);
-	if (err)
-		return err;
-
-	desc32 = (drm_buf_desc32_t){
-		desc.count, desc.size, desc.low_mark, desc.high_mark,
-		desc.flags, desc.agp_start
-	};
-	if (copy_to_user(argp, &desc32, sizeof(drm_buf_desc32_t)))
-		return -EFAULT;
-
-	return 0;
-}
-
-static int compat_drm_markbufs(struct file *file, unsigned int cmd,
-			       unsigned long arg)
-{
-	drm_buf_desc32_t b32;
-	drm_buf_desc32_t __user *argp = (void __user *)arg;
-	struct drm_buf_desc buf;
-
-	if (copy_from_user(&b32, argp, sizeof(b32)))
-		return -EFAULT;
-
-	buf.size = b32.size;
-	buf.low_mark = b32.low_mark;
-	buf.high_mark = b32.high_mark;
-
-	return drm_ioctl_kernel(file, drm_legacy_markbufs, &buf,
-				DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY);
-}
-
-typedef struct drm_buf_info32 {
-	int count;		/**< Entries in list */
-	u32 list;
-} drm_buf_info32_t;
-
-static int copy_one_buf32(void *data, int count, struct drm_buf_entry *from)
-{
-	drm_buf_info32_t *request = data;
-	drm_buf_desc32_t __user *to = compat_ptr(request->list);
-	drm_buf_desc32_t v = {.count = from->buf_count,
-			      .size = from->buf_size,
-			      .low_mark = from->low_mark,
-			      .high_mark = from->high_mark};
-
-	if (copy_to_user(to + count, &v, offsetof(drm_buf_desc32_t, flags)))
-		return -EFAULT;
-	return 0;
-}
-
-static int drm_legacy_infobufs32(struct drm_device *dev, void *data,
-			struct drm_file *file_priv)
-{
-	drm_buf_info32_t *request = data;
-
-	return __drm_legacy_infobufs(dev, data, &request->count, copy_one_buf32);
-}
-
-static int compat_drm_infobufs(struct file *file, unsigned int cmd,
-			       unsigned long arg)
-{
-	drm_buf_info32_t req32;
-	drm_buf_info32_t __user *argp = (void __user *)arg;
-	int err;
-
-	if (copy_from_user(&req32, argp, sizeof(req32)))
-		return -EFAULT;
-
-	if (req32.count < 0)
-		req32.count = 0;
-
-	err = drm_ioctl_kernel(file, drm_legacy_infobufs32, &req32, DRM_AUTH);
-	if (err)
-		return err;
-
-	if (put_user(req32.count, &argp->count))
-		return -EFAULT;
-
-	return 0;
-}
-
-typedef struct drm_buf_pub32 {
-	int idx;		/**< Index into the master buffer list */
-	int total;		/**< Buffer size */
-	int used;		/**< Amount of buffer in use (for DMA) */
-	u32 address;		/**< Address of buffer */
-} drm_buf_pub32_t;
-
-typedef struct drm_buf_map32 {
-	int count;		/**< Length of the buffer list */
-	u32 virtual;		/**< Mmap'd area in user-virtual */
-	u32 list;		/**< Buffer information */
-} drm_buf_map32_t;
-
-static int map_one_buf32(void *data, int idx, unsigned long virtual,
-			struct drm_buf *buf)
-{
-	drm_buf_map32_t *request = data;
-	drm_buf_pub32_t __user *to = compat_ptr(request->list) + idx;
-	drm_buf_pub32_t v;
-
-	v.idx = buf->idx;
-	v.total = buf->total;
-	v.used = 0;
-	v.address = virtual + buf->offset;
-	if (copy_to_user(to, &v, sizeof(v)))
-		return -EFAULT;
-	return 0;
-}
-
-static int drm_legacy_mapbufs32(struct drm_device *dev, void *data,
-		       struct drm_file *file_priv)
-{
-	drm_buf_map32_t *request = data;
-	void __user *v;
-	int err = __drm_legacy_mapbufs(dev, data, &request->count,
-				    &v, map_one_buf32,
-				    file_priv);
-	request->virtual = ptr_to_compat(v);
-	return err;
-}
-
-static int compat_drm_mapbufs(struct file *file, unsigned int cmd,
-			      unsigned long arg)
-{
-	drm_buf_map32_t __user *argp = (void __user *)arg;
-	drm_buf_map32_t req32;
-	int err;
-
-	if (copy_from_user(&req32, argp, sizeof(req32)))
-		return -EFAULT;
-	if (req32.count < 0)
-		return -EINVAL;
-
-	err = drm_ioctl_kernel(file, drm_legacy_mapbufs32, &req32, DRM_AUTH);
-	if (err)
-		return err;
-
-	if (put_user(req32.count, &argp->count)
-	    || put_user(req32.virtual, &argp->virtual))
-		return -EFAULT;
-
-	return 0;
-}
-
-typedef struct drm_buf_free32 {
-	int count;
-	u32 list;
-} drm_buf_free32_t;
-
-static int compat_drm_freebufs(struct file *file, unsigned int cmd,
-			       unsigned long arg)
-{
-	drm_buf_free32_t req32;
-	struct drm_buf_free request;
-	drm_buf_free32_t __user *argp = (void __user *)arg;
-
-	if (copy_from_user(&req32, argp, sizeof(req32)))
-		return -EFAULT;
-
-	request.count = req32.count;
-	request.list = compat_ptr(req32.list);
-	return drm_ioctl_kernel(file, drm_legacy_freebufs, &request, DRM_AUTH);
-}
-
-typedef struct drm_ctx_priv_map32 {
-	unsigned int ctx_id;	 /**< Context requesting private mapping */
-	u32 handle;		/**< Handle of map */
-} drm_ctx_priv_map32_t;
-
-static int compat_drm_setsareactx(struct file *file, unsigned int cmd,
-				  unsigned long arg)
-{
-	drm_ctx_priv_map32_t req32;
-	struct drm_ctx_priv_map request;
-	drm_ctx_priv_map32_t __user *argp = (void __user *)arg;
-
-	if (copy_from_user(&req32, argp, sizeof(req32)))
-		return -EFAULT;
-
-	request.ctx_id = req32.ctx_id;
-	request.handle = compat_ptr(req32.handle);
-	return drm_ioctl_kernel(file, drm_legacy_setsareactx, &request,
-				DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY);
-}
-
-static int compat_drm_getsareactx(struct file *file, unsigned int cmd,
-				  unsigned long arg)
-{
-	struct drm_ctx_priv_map req;
-	drm_ctx_priv_map32_t req32;
-	drm_ctx_priv_map32_t __user *argp = (void __user *)arg;
-	int err;
-
-	if (copy_from_user(&req32, argp, sizeof(req32)))
-		return -EFAULT;
-
-	req.ctx_id = req32.ctx_id;
-	err = drm_ioctl_kernel(file, drm_legacy_getsareactx, &req, DRM_AUTH);
-	if (err)
-		return err;
-
-	req32.handle = ptr_to_compat((void __user *)req.handle);
-	if (copy_to_user(argp, &req32, sizeof(req32)))
-		return -EFAULT;
-
-	return 0;
-}
-
-typedef struct drm_ctx_res32 {
-	int count;
-	u32 contexts;
-} drm_ctx_res32_t;
-
-static int compat_drm_resctx(struct file *file, unsigned int cmd,
-			     unsigned long arg)
-{
-	drm_ctx_res32_t __user *argp = (void __user *)arg;
-	drm_ctx_res32_t res32;
-	struct drm_ctx_res res;
-	int err;
-
-	if (copy_from_user(&res32, argp, sizeof(res32)))
-		return -EFAULT;
-
-	res.count = res32.count;
-	res.contexts = compat_ptr(res32.contexts);
-	err = drm_ioctl_kernel(file, drm_legacy_resctx, &res, DRM_AUTH);
-	if (err)
-		return err;
-
-	res32.count = res.count;
-	if (copy_to_user(argp, &res32, sizeof(res32)))
-		return -EFAULT;
-
-	return 0;
-}
-
-typedef struct drm_dma32 {
-	int context;		  /**< Context handle */
-	int send_count;		  /**< Number of buffers to send */
-	u32 send_indices;	  /**< List of handles to buffers */
-	u32 send_sizes;		  /**< Lengths of data to send */
-	enum drm_dma_flags flags;		  /**< Flags */
-	int request_count;	  /**< Number of buffers requested */
-	int request_size;	  /**< Desired size for buffers */
-	u32 request_indices;	  /**< Buffer information */
-	u32 request_sizes;
-	int granted_count;	  /**< Number of buffers granted */
-} drm_dma32_t;
-
-static int compat_drm_dma(struct file *file, unsigned int cmd,
-			  unsigned long arg)
-{
-	drm_dma32_t d32;
-	drm_dma32_t __user *argp = (void __user *)arg;
-	struct drm_dma d;
-	int err;
-
-	if (copy_from_user(&d32, argp, sizeof(d32)))
-		return -EFAULT;
-
-	d.context = d32.context;
-	d.send_count = d32.send_count;
-	d.send_indices = compat_ptr(d32.send_indices);
-	d.send_sizes = compat_ptr(d32.send_sizes);
-	d.flags = d32.flags;
-	d.request_count = d32.request_count;
-	d.request_indices = compat_ptr(d32.request_indices);
-	d.request_sizes = compat_ptr(d32.request_sizes);
-	err = drm_ioctl_kernel(file, drm_legacy_dma_ioctl, &d, DRM_AUTH);
-	if (err)
-		return err;
-
-	if (put_user(d.request_size, &argp->request_size)
-	    || put_user(d.granted_count, &argp->granted_count))
-		return -EFAULT;
-
-	return 0;
-}
-#endif
-
-#if IS_ENABLED(CONFIG_DRM_LEGACY)
-#if IS_ENABLED(CONFIG_AGP)
-typedef struct drm_agp_mode32 {
-	u32 mode;	/**< AGP mode */
-} drm_agp_mode32_t;
-
-static int compat_drm_agp_enable(struct file *file, unsigned int cmd,
-				 unsigned long arg)
-{
-	drm_agp_mode32_t __user *argp = (void __user *)arg;
-	struct drm_agp_mode mode;
-
-	if (get_user(mode.mode, &argp->mode))
-		return -EFAULT;
-
-	return drm_ioctl_kernel(file,  drm_legacy_agp_enable_ioctl, &mode,
-				DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY);
-}
-
-typedef struct drm_agp_info32 {
-	int agp_version_major;
-	int agp_version_minor;
-	u32 mode;
-	u32 aperture_base;	/* physical address */
-	u32 aperture_size;	/* bytes */
-	u32 memory_allowed;	/* bytes */
-	u32 memory_used;
-
-	/* PCI information */
-	unsigned short id_vendor;
-	unsigned short id_device;
-} drm_agp_info32_t;
-
-static int compat_drm_agp_info(struct file *file, unsigned int cmd,
-			       unsigned long arg)
-{
-	drm_agp_info32_t __user *argp = (void __user *)arg;
-	drm_agp_info32_t i32;
-	struct drm_agp_info info;
-	int err;
-
-	err = drm_ioctl_kernel(file, drm_legacy_agp_info_ioctl, &info, DRM_AUTH);
-	if (err)
-		return err;
-
-	i32.agp_version_major = info.agp_version_major;
-	i32.agp_version_minor = info.agp_version_minor;
-	i32.mode = info.mode;
-	i32.aperture_base = info.aperture_base;
-	i32.aperture_size = info.aperture_size;
-	i32.memory_allowed = info.memory_allowed;
-	i32.memory_used = info.memory_used;
-	i32.id_vendor = info.id_vendor;
-	i32.id_device = info.id_device;
-	if (copy_to_user(argp, &i32, sizeof(i32)))
-		return -EFAULT;
-
-	return 0;
-}
-
-typedef struct drm_agp_buffer32 {
-	u32 size;	/**< In bytes -- will round to page boundary */
-	u32 handle;	/**< Used for binding / unbinding */
-	u32 type;	/**< Type of memory to allocate */
-	u32 physical;	/**< Physical used by i810 */
-} drm_agp_buffer32_t;
-
-static int compat_drm_agp_alloc(struct file *file, unsigned int cmd,
-				unsigned long arg)
-{
-	drm_agp_buffer32_t __user *argp = (void __user *)arg;
-	drm_agp_buffer32_t req32;
-	struct drm_agp_buffer request;
-	int err;
-
-	if (copy_from_user(&req32, argp, sizeof(req32)))
-		return -EFAULT;
-
-	request.size = req32.size;
-	request.type = req32.type;
-	err = drm_ioctl_kernel(file, drm_legacy_agp_alloc_ioctl, &request,
-				DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY);
-	if (err)
-		return err;
-
-	req32.handle = request.handle;
-	req32.physical = request.physical;
-	if (copy_to_user(argp, &req32, sizeof(req32))) {
-		drm_ioctl_kernel(file, drm_legacy_agp_free_ioctl, &request,
-				DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY);
-		return -EFAULT;
-	}
-
-	return 0;
-}
-
-static int compat_drm_agp_free(struct file *file, unsigned int cmd,
-			       unsigned long arg)
-{
-	drm_agp_buffer32_t __user *argp = (void __user *)arg;
-	struct drm_agp_buffer request;
-
-	if (get_user(request.handle, &argp->handle))
-		return -EFAULT;
-
-	return drm_ioctl_kernel(file, drm_legacy_agp_free_ioctl, &request,
-				DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY);
-}
-
-typedef struct drm_agp_binding32 {
-	u32 handle;	/**< From drm_agp_buffer */
-	u32 offset;	/**< In bytes -- will round to page boundary */
-} drm_agp_binding32_t;
-
-static int compat_drm_agp_bind(struct file *file, unsigned int cmd,
-			       unsigned long arg)
-{
-	drm_agp_binding32_t __user *argp = (void __user *)arg;
-	drm_agp_binding32_t req32;
-	struct drm_agp_binding request;
-
-	if (copy_from_user(&req32, argp, sizeof(req32)))
-		return -EFAULT;
-
-	request.handle = req32.handle;
-	request.offset = req32.offset;
-	return drm_ioctl_kernel(file, drm_legacy_agp_bind_ioctl, &request,
-				DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY);
-}
-
-static int compat_drm_agp_unbind(struct file *file, unsigned int cmd,
-				 unsigned long arg)
-{
-	drm_agp_binding32_t __user *argp = (void __user *)arg;
-	struct drm_agp_binding request;
-
-	if (get_user(request.handle, &argp->handle))
-		return -EFAULT;
-
-	return drm_ioctl_kernel(file, drm_legacy_agp_unbind_ioctl, &request,
-				DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY);
-}
-#endif /* CONFIG_AGP */
-
-typedef struct drm_scatter_gather32 {
-	u32 size;	/**< In bytes -- will round to page boundary */
-	u32 handle;	/**< Used for mapping / unmapping */
-} drm_scatter_gather32_t;
-
-static int compat_drm_sg_alloc(struct file *file, unsigned int cmd,
-			       unsigned long arg)
-{
-	drm_scatter_gather32_t __user *argp = (void __user *)arg;
-	struct drm_scatter_gather request;
-	int err;
-
-	if (get_user(request.size, &argp->size))
-		return -EFAULT;
-
-	err = drm_ioctl_kernel(file, drm_legacy_sg_alloc, &request,
-				DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY);
-	if (err)
-		return err;
-
-	/* XXX not sure about the handle conversion here... */
-	if (put_user(request.handle >> PAGE_SHIFT, &argp->handle))
-		return -EFAULT;
-
-	return 0;
-}
-
-static int compat_drm_sg_free(struct file *file, unsigned int cmd,
-			      unsigned long arg)
-{
-	drm_scatter_gather32_t __user *argp = (void __user *)arg;
-	struct drm_scatter_gather request;
-	unsigned long x;
-
-	if (get_user(x, &argp->handle))
-		return -EFAULT;
-	request.handle = x << PAGE_SHIFT;
-	return drm_ioctl_kernel(file, drm_legacy_sg_free, &request,
-				DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY);
-}
-#endif
 #if defined(CONFIG_X86)
 typedef struct drm_update_draw32 {
 	drm_drawable_t handle;
@@ -915,37 +333,9 @@ static struct {
 #define DRM_IOCTL32_DEF(n, f) [DRM_IOCTL_NR(n##32)] = {.fn = f, .name = #n}
 	DRM_IOCTL32_DEF(DRM_IOCTL_VERSION, compat_drm_version),
 	DRM_IOCTL32_DEF(DRM_IOCTL_GET_UNIQUE, compat_drm_getunique),
-#if IS_ENABLED(CONFIG_DRM_LEGACY)
-	DRM_IOCTL32_DEF(DRM_IOCTL_GET_MAP, compat_drm_getmap),
-#endif
 	DRM_IOCTL32_DEF(DRM_IOCTL_GET_CLIENT, compat_drm_getclient),
 	DRM_IOCTL32_DEF(DRM_IOCTL_GET_STATS, compat_drm_getstats),
 	DRM_IOCTL32_DEF(DRM_IOCTL_SET_UNIQUE, compat_drm_setunique),
-#if IS_ENABLED(CONFIG_DRM_LEGACY)
-	DRM_IOCTL32_DEF(DRM_IOCTL_ADD_MAP, compat_drm_addmap),
-	DRM_IOCTL32_DEF(DRM_IOCTL_ADD_BUFS, compat_drm_addbufs),
-	DRM_IOCTL32_DEF(DRM_IOCTL_MARK_BUFS, compat_drm_markbufs),
-	DRM_IOCTL32_DEF(DRM_IOCTL_INFO_BUFS, compat_drm_infobufs),
-	DRM_IOCTL32_DEF(DRM_IOCTL_MAP_BUFS, compat_drm_mapbufs),
-	DRM_IOCTL32_DEF(DRM_IOCTL_FREE_BUFS, compat_drm_freebufs),
-	DRM_IOCTL32_DEF(DRM_IOCTL_RM_MAP, compat_drm_rmmap),
-	DRM_IOCTL32_DEF(DRM_IOCTL_SET_SAREA_CTX, compat_drm_setsareactx),
-	DRM_IOCTL32_DEF(DRM_IOCTL_GET_SAREA_CTX, compat_drm_getsareactx),
-	DRM_IOCTL32_DEF(DRM_IOCTL_RES_CTX, compat_drm_resctx),
-	DRM_IOCTL32_DEF(DRM_IOCTL_DMA, compat_drm_dma),
-#if IS_ENABLED(CONFIG_AGP)
-	DRM_IOCTL32_DEF(DRM_IOCTL_AGP_ENABLE, compat_drm_agp_enable),
-	DRM_IOCTL32_DEF(DRM_IOCTL_AGP_INFO, compat_drm_agp_info),
-	DRM_IOCTL32_DEF(DRM_IOCTL_AGP_ALLOC, compat_drm_agp_alloc),
-	DRM_IOCTL32_DEF(DRM_IOCTL_AGP_FREE, compat_drm_agp_free),
-	DRM_IOCTL32_DEF(DRM_IOCTL_AGP_BIND, compat_drm_agp_bind),
-	DRM_IOCTL32_DEF(DRM_IOCTL_AGP_UNBIND, compat_drm_agp_unbind),
-#endif
-#endif
-#if IS_ENABLED(CONFIG_DRM_LEGACY)
-	DRM_IOCTL32_DEF(DRM_IOCTL_SG_ALLOC, compat_drm_sg_alloc),
-	DRM_IOCTL32_DEF(DRM_IOCTL_SG_FREE, compat_drm_sg_free),
-#endif
 #if defined(CONFIG_X86)
 	DRM_IOCTL32_DEF(DRM_IOCTL_UPDATE_DRAW, compat_drm_update_draw),
 #endif
diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
index 44fda68c28aeb..e6c32f76c7452 100644
--- a/drivers/gpu/drm/drm_ioctl.c
+++ b/drivers/gpu/drm/drm_ioctl.c
@@ -42,7 +42,6 @@
 
 #include "drm_crtc_internal.h"
 #include "drm_internal.h"
-#include "drm_legacy.h"
 
 /**
  * DOC: getunique and setversion story
@@ -559,21 +558,11 @@ static int drm_ioctl_permit(u32 flags, struct drm_file *file_priv)
 		.name = #ioctl			\
 	}
 
-#if IS_ENABLED(CONFIG_DRM_LEGACY)
-#define DRM_LEGACY_IOCTL_DEF(ioctl, _func, _flags)  DRM_IOCTL_DEF(ioctl, _func, _flags)
-#else
-#define DRM_LEGACY_IOCTL_DEF(ioctl, _func, _flags) DRM_IOCTL_DEF(ioctl, drm_invalid_op, _flags)
-#endif
-
 /* Ioctl table */
 static const struct drm_ioctl_desc drm_ioctls[] = {
 	DRM_IOCTL_DEF(DRM_IOCTL_VERSION, drm_version, DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF(DRM_IOCTL_GET_UNIQUE, drm_getunique, 0),
 	DRM_IOCTL_DEF(DRM_IOCTL_GET_MAGIC, drm_getmagic, 0),
-	DRM_LEGACY_IOCTL_DEF(DRM_IOCTL_IRQ_BUSID, drm_legacy_irq_by_busid,
-			     DRM_MASTER|DRM_ROOT_ONLY),
-
-	DRM_LEGACY_IOCTL_DEF(DRM_IOCTL_GET_MAP, drm_legacy_getmap_ioctl, 0),
 
 	DRM_IOCTL_DEF(DRM_IOCTL_GET_CLIENT, drm_getclient, 0),
 	DRM_IOCTL_DEF(DRM_IOCTL_GET_STATS, drm_getstats, 0),
@@ -586,60 +575,14 @@ static const struct drm_ioctl_desc drm_ioctls[] = {
 	DRM_IOCTL_DEF(DRM_IOCTL_UNBLOCK, drm_noop, DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY),
 	DRM_IOCTL_DEF(DRM_IOCTL_AUTH_MAGIC, drm_authmagic, DRM_MASTER),
 
-	DRM_LEGACY_IOCTL_DEF(DRM_IOCTL_ADD_MAP, drm_legacy_addmap_ioctl, DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY),
-	DRM_LEGACY_IOCTL_DEF(DRM_IOCTL_RM_MAP, drm_legacy_rmmap_ioctl, DRM_AUTH),
-
-	DRM_LEGACY_IOCTL_DEF(DRM_IOCTL_SET_SAREA_CTX, drm_legacy_setsareactx, DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY),
-	DRM_LEGACY_IOCTL_DEF(DRM_IOCTL_GET_SAREA_CTX, drm_legacy_getsareactx, DRM_AUTH),
-
 	DRM_IOCTL_DEF(DRM_IOCTL_SET_MASTER, drm_setmaster_ioctl, 0),
 	DRM_IOCTL_DEF(DRM_IOCTL_DROP_MASTER, drm_dropmaster_ioctl, 0),
 
-	DRM_LEGACY_IOCTL_DEF(DRM_IOCTL_ADD_CTX, drm_legacy_addctx, DRM_AUTH|DRM_ROOT_ONLY),
-	DRM_LEGACY_IOCTL_DEF(DRM_IOCTL_RM_CTX, drm_legacy_rmctx, DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY),
-	DRM_LEGACY_IOCTL_DEF(DRM_IOCTL_MOD_CTX, drm_noop, DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY),
-	DRM_LEGACY_IOCTL_DEF(DRM_IOCTL_GET_CTX, drm_legacy_getctx, DRM_AUTH),
-	DRM_LEGACY_IOCTL_DEF(DRM_IOCTL_SWITCH_CTX, drm_legacy_switchctx, DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY),
-	DRM_LEGACY_IOCTL_DEF(DRM_IOCTL_NEW_CTX, drm_legacy_newctx, DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY),
-	DRM_LEGACY_IOCTL_DEF(DRM_IOCTL_RES_CTX, drm_legacy_resctx, DRM_AUTH),
-
 	DRM_IOCTL_DEF(DRM_IOCTL_ADD_DRAW, drm_noop, DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY),
 	DRM_IOCTL_DEF(DRM_IOCTL_RM_DRAW, drm_noop, DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY),
 
-	DRM_LEGACY_IOCTL_DEF(DRM_IOCTL_LOCK, drm_legacy_lock, DRM_AUTH),
-	DRM_LEGACY_IOCTL_DEF(DRM_IOCTL_UNLOCK, drm_legacy_unlock, DRM_AUTH),
-
 	DRM_IOCTL_DEF(DRM_IOCTL_FINISH, drm_noop, DRM_AUTH),
 
-	DRM_LEGACY_IOCTL_DEF(DRM_IOCTL_ADD_BUFS, drm_legacy_addbufs, DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY),
-	DRM_LEGACY_IOCTL_DEF(DRM_IOCTL_MARK_BUFS, drm_legacy_markbufs, DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY),
-	DRM_LEGACY_IOCTL_DEF(DRM_IOCTL_INFO_BUFS, drm_legacy_infobufs, DRM_AUTH),
-	DRM_LEGACY_IOCTL_DEF(DRM_IOCTL_MAP_BUFS, drm_legacy_mapbufs, DRM_AUTH),
-	DRM_LEGACY_IOCTL_DEF(DRM_IOCTL_FREE_BUFS, drm_legacy_freebufs, DRM_AUTH),
-	DRM_LEGACY_IOCTL_DEF(DRM_IOCTL_DMA, drm_legacy_dma_ioctl, DRM_AUTH),
-	DRM_LEGACY_IOCTL_DEF(DRM_IOCTL_CONTROL, drm_legacy_irq_control, DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY),
-
-#if IS_ENABLED(CONFIG_AGP)
-	DRM_LEGACY_IOCTL_DEF(DRM_IOCTL_AGP_ACQUIRE, drm_legacy_agp_acquire_ioctl,
-			     DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY),
-	DRM_LEGACY_IOCTL_DEF(DRM_IOCTL_AGP_RELEASE, drm_legacy_agp_release_ioctl,
-			     DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY),
-	DRM_LEGACY_IOCTL_DEF(DRM_IOCTL_AGP_ENABLE, drm_legacy_agp_enable_ioctl,
-			     DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY),
-	DRM_LEGACY_IOCTL_DEF(DRM_IOCTL_AGP_INFO, drm_legacy_agp_info_ioctl, DRM_AUTH),
-	DRM_LEGACY_IOCTL_DEF(DRM_IOCTL_AGP_ALLOC, drm_legacy_agp_alloc_ioctl,
-			     DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY),
-	DRM_LEGACY_IOCTL_DEF(DRM_IOCTL_AGP_FREE, drm_legacy_agp_free_ioctl,
-			     DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY),
-	DRM_LEGACY_IOCTL_DEF(DRM_IOCTL_AGP_BIND, drm_legacy_agp_bind_ioctl,
-			     DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY),
-	DRM_LEGACY_IOCTL_DEF(DRM_IOCTL_AGP_UNBIND, drm_legacy_agp_unbind_ioctl,
-			     DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY),
-#endif
-
-	DRM_LEGACY_IOCTL_DEF(DRM_IOCTL_SG_ALLOC, drm_legacy_sg_alloc, DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY),
-	DRM_LEGACY_IOCTL_DEF(DRM_IOCTL_SG_FREE, drm_legacy_sg_free, DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY),
-
 	DRM_IOCTL_DEF(DRM_IOCTL_WAIT_VBLANK, drm_wait_vblank_ioctl, DRM_UNLOCKED),
 
 	DRM_IOCTL_DEF(DRM_IOCTL_MODESET_CTL, drm_legacy_modeset_ctl_ioctl, 0),
-- 
2.42.1

