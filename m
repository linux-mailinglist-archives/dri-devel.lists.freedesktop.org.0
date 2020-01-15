Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D4313BEE3
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2020 12:54:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9F036E934;
	Wed, 15 Jan 2020 11:53:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa2.bahnhof.se (pio-pvt-msa2.bahnhof.se [79.136.2.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D11B6E933
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2020 11:53:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTP id DFC763F545;
 Wed, 15 Jan 2020 12:53:48 +0100 (CET)
Authentication-Results: pio-pvt-msa2.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=LlHU8da+; 
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Received: from pio-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GnDMb4bwdUMf; Wed, 15 Jan 2020 12:53:47 +0100 (CET)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id D4EEB3F32B;
 Wed, 15 Jan 2020 12:53:46 +0100 (CET)
Received: from localhost.localdomain.localdomain
 (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 080AD360444;
 Wed, 15 Jan 2020 12:53:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1579089226; bh=5yqsZODkIYAwtK3TQ3XOuYxr8JdROwjJRVrigWmkDWY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LlHU8da+Ol+jZSwJzthVyK+dl76gnWCzxiqvE3IwmNj6Z1S3dmK63/NpfWS5EBH9a
 8MvtB2IUYbAiEb+PQX/nVDh4P5M0HOKuGmpzS46zdh3pr9C0wm/df2eF2q8mcxfndW
 iA2VKN6QLskoF3t+UNEfDQ2FSS6nDY2B/VX0QV98=
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m=20=28VMware=29?=
 <thomas_os@shipmail.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 8/9] drm/vmwgfx: add ioctl for messaging from/to guest
 userspace to/from host
Date: Wed, 15 Jan 2020 12:53:28 +0100
Message-Id: <20200115115329.2836-8-thomas_os@shipmail.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200115115329.2836-1-thomas_os@shipmail.org>
References: <20200115115329.2836-1-thomas_os@shipmail.org>
MIME-Version: 1.0
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
Cc: Roland Scheidegger <sroland@vmware.com>,
 Thomas Hellstrom <thellstrom@vmware.com>, linux-graphics-maintainer@vmware.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Roland Scheidegger <sroland@vmware.com>

Up to now, guest userspace does logging directly to host using essentially
the same rather complex port assembly stuff as the kernel.
We'd rather use the same mechanism than duplicate it (it may also change in
the future), hence add a new ioctl for relaying guest/host messaging
(logging is just one application of it).

Signed-off-by: Roland Scheidegger <sroland@vmware.com>
Reviewed-by: Thomas Hellstrom <thellstrom@vmware.com>
Signed-off-by: Thomas Hellstrom <thellstrom@vmware.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c |  6 +++
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h |  2 +
 drivers/gpu/drm/vmwgfx/vmwgfx_msg.c | 83 +++++++++++++++++++++++++++++
 include/uapi/drm/vmwgfx_drm.h       | 17 ++++++
 4 files changed, 108 insertions(+)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index bc3d85174ca0..827458f49112 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -150,6 +150,9 @@
 #define DRM_IOCTL_VMW_GB_SURFACE_REF_EXT				\
 	DRM_IOWR(DRM_COMMAND_BASE + DRM_VMW_GB_SURFACE_REF_EXT,		\
 		union drm_vmw_gb_surface_reference_ext_arg)
+#define DRM_IOCTL_VMW_MSG						\
+	DRM_IOWR(DRM_COMMAND_BASE + DRM_VMW_MSG,			\
+		struct drm_vmw_msg_arg)
 
 /**
  * The core DRM version of this macro doesn't account for
@@ -243,6 +246,9 @@ static const struct drm_ioctl_desc vmw_ioctls[] = {
 	VMW_IOCTL_DEF(VMW_GB_SURFACE_REF_EXT,
 		      vmw_gb_surface_reference_ext_ioctl,
 		      DRM_RENDER_ALLOW),
+	VMW_IOCTL_DEF(VMW_MSG,
+		      vmw_msg_ioctl,
+		      DRM_RENDER_ALLOW),
 };
 
 static const struct pci_device_id vmw_pci_id_list[] = {
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
index a31e726d6d71..bfcb12dbaac1 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
@@ -1403,6 +1403,8 @@ int vmw_bo_cpu_blit(struct ttm_buffer_object *dst,
 int vmw_host_get_guestinfo(const char *guest_info_param,
 			   char *buffer, size_t *length);
 int vmw_host_log(const char *log);
+int vmw_msg_ioctl(struct drm_device *dev, void *data,
+		  struct drm_file *file_priv);
 
 /* VMW logging */
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c b/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c
index d63441194249..e9f448a5ebb3 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c
@@ -57,6 +57,8 @@
 
 #define HIGH_WORD(X) ((X & 0xFFFF0000) >> 16)
 
+#define MAX_USER_MSG_LENGTH	PAGE_SIZE
+
 static u32 vmw_msg_enabled = 1;
 
 enum rpc_msg_type {
@@ -517,3 +519,84 @@ int vmw_host_log(const char *log)
 
 	return -EINVAL;
 }
+
+
+/**
+ * vmw_msg_ioctl: Sends and receveives a message to/from host from/to user-space
+ *
+ * Sends a message from user-space to host.
+ * Can also receive a result from host and return that to user-space.
+ *
+ * @dev: Identifies the drm device.
+ * @data: Pointer to the ioctl argument.
+ * @file_priv: Identifies the caller.
+ * Return: Zero on success, negative error code on error.
+ */
+
+int vmw_msg_ioctl(struct drm_device *dev, void *data,
+		  struct drm_file *file_priv)
+{
+	struct drm_vmw_msg_arg *arg =
+		(struct drm_vmw_msg_arg *) data;
+	struct rpc_channel channel;
+	char *msg;
+	int length;
+
+	msg = kmalloc(MAX_USER_MSG_LENGTH, GFP_KERNEL);
+	if (!msg) {
+		DRM_ERROR("Cannot allocate memory for log message.\n");
+		return -ENOMEM;
+	}
+
+	length = strncpy_from_user(msg, (void __user *)((unsigned long)arg->send),
+				   MAX_USER_MSG_LENGTH);
+	if (length < 0 || length >= MAX_USER_MSG_LENGTH) {
+		DRM_ERROR("Userspace message access failure.\n");
+		kfree(msg);
+		return -EINVAL;
+	}
+
+
+	if (vmw_open_channel(&channel, RPCI_PROTOCOL_NUM)) {
+		DRM_ERROR("Failed to open channel.\n");
+		goto out_open;
+	}
+
+	if (vmw_send_msg(&channel, msg)) {
+		DRM_ERROR("Failed to send message to host.\n");
+		goto out_msg;
+	}
+
+	if (!arg->send_only) {
+		char *reply = NULL;
+		size_t reply_len = 0;
+
+		if (vmw_recv_msg(&channel, (void *) &reply, &reply_len)) {
+			DRM_ERROR("Failed to receive message from host.\n");
+			goto out_msg;
+		}
+		if (reply && reply_len > 0) {
+			if (copy_to_user((void __user *)((unsigned long)arg->receive),
+							 reply, reply_len)) {
+				DRM_ERROR("Failed to copy message to userspace.\n");
+				kfree(reply);
+				goto out_msg;
+			}
+			arg->receive_len = (__u32)reply_len;
+		}
+		kfree(reply);
+	}
+
+	vmw_close_channel(&channel);
+	kfree(msg);
+
+	return 0;
+
+out_msg:
+	vmw_close_channel(&channel);
+out_open:
+	kfree(msg);
+
+	return -EINVAL;
+}
+
diff --git a/include/uapi/drm/vmwgfx_drm.h b/include/uapi/drm/vmwgfx_drm.h
index 02cab33f2f25..fcb741e3068f 100644
--- a/include/uapi/drm/vmwgfx_drm.h
+++ b/include/uapi/drm/vmwgfx_drm.h
@@ -71,6 +71,7 @@ extern "C" {
 #define DRM_VMW_CREATE_EXTENDED_CONTEXT 26
 #define DRM_VMW_GB_SURFACE_CREATE_EXT   27
 #define DRM_VMW_GB_SURFACE_REF_EXT      28
+#define DRM_VMW_MSG                     29
 
 /*************************************************************************/
 /**
@@ -1213,6 +1214,22 @@ union drm_vmw_gb_surface_reference_ext_arg {
 	struct drm_vmw_surface_arg req;
 };
 
+/**
+ * struct drm_vmw_msg_arg
+ *
+ * @send: Pointer to user-space msg string (null terminated).
+ * @receive: Pointer to user-space receive buffer.
+ * @send_only: Boolean whether this is only sending or receiving too.
+ *
+ * Argument to the DRM_VMW_MSG ioctl.
+ */
+struct drm_vmw_msg_arg {
+	__u64 send;
+	__u64 receive;
+	__s32 send_only;
+	__u32 receive_len;
+};
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.21.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
