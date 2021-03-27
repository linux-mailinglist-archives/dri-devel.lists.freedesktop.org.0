Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D4C34B33D
	for <lists+dri-devel@lfdr.de>; Sat, 27 Mar 2021 01:10:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 445B46F50C;
	Sat, 27 Mar 2021 00:10:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8EEE6F50A
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Mar 2021 00:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616803837;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p+le+7o7WICus9ZcLLEMXNUCCrtxxyozGQvSzYxP59s=;
 b=gBwGiwu9HH/tRLmA9KlTQjFJAO5yRq9NHS4Qpzgd1l9+O+2yFwGkUyhhvBOCZiinsiB0Fn
 zOH2EFQX5MVeTFVdun5Y46WBiUFHFIU+PjgkoIrZ3CSqauBNDSOcSTSiyoDLZM1JOGf7x2
 kXkHxRtiNrdLAMA3npitkJ8Ed0ahT2g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-597-J9RQ6Dm5MIaokVwDed9NIw-1; Fri, 26 Mar 2021 20:10:35 -0400
X-MC-Unique: J9RQ6Dm5MIaokVwDed9NIw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7B425107ACCD;
 Sat, 27 Mar 2021 00:10:34 +0000 (UTC)
Received: from Whitewolf.lyude.net (ovpn-114-133.rdu2.redhat.com
 [10.10.114.133])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A8AEA1972B;
 Sat, 27 Mar 2021 00:10:33 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org
Subject: [PATCH v2 3/3] drm/nouveau: begin documenting core nouveau structures
Date: Fri, 26 Mar 2021 20:10:01 -0400
Message-Id: <20210327001001.229093-4-lyude@redhat.com>
In-Reply-To: <20210327001001.229093-1-lyude@redhat.com>
References: <20210327001001.229093-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <dri-devel@lists.freedesktop.org>, Jeremy Cline <jcline@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jeremy Cline <jcline@redhat.com>

Start on documentation for the Nouveau device structure and the NVIF
client structure it uses. This documentation is not complete as the
structures are non-trivial and I am not familiar with large portions of
them.

Signed-off-by: Jeremy Cline <jcline@redhat.com>
Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_drv.h | 67 +++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index 8eb133fd6df0..43d751d2445f 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -88,8 +88,20 @@ enum nouveau_drm_handle {
 	NVDRM_NVSW    = 0x55550000,
 };
 
+/**
+ * struct nouveau_cli - A DRM-specific NVIF client.
+ *
+ * This encapsulates a NVIF client and is intended to be the sole interface
+ * between the DRM APIs and NVKM. An instance of this structure is allocated
+ * for each userspace client when they open the device file. Additionally,
+ * there are several allocated strictly for the kernel's use.
+ */
 struct nouveau_cli {
 	struct nvif_client base;
+
+	/**
+	 * @drm: A reference to the device that the client is associated with.
+	 */
 	struct nouveau_drm *drm;
 	struct mutex mutex;
 
@@ -99,6 +111,9 @@ struct nouveau_cli {
 	struct nouveau_vmm svm;
 	const struct nvif_mclass *mem;
 
+	/**
+	 * @head: The list entry for this client in the @drm device's list of clients.
+	 */
 	struct list_head head;
 	void *abi16;
 	struct list_head objects;
@@ -106,13 +121,36 @@ struct nouveau_cli {
 	char name[32];
 
 	struct work_struct work;
+
+	/**
+	 * @worker: List of pending &struct nouveau_cli_work associated with this client.
+	 */
 	struct list_head worker;
+
+	/**
+	 * @lock: Protects the @worker list. Additionally, this lock on the
+	 * @drm.master instance is used to serialize destruction of the @base
+	 * member in this structure, as well as the destruction of the &struct
+	 * nvif_mem embedded in &struct nouveau_mem instances.
+	 */
 	struct mutex lock;
 };
 
+/**
+ * struct nouveau_cli_work - A pending work item for an NVIF client.
+ */
 struct nouveau_cli_work {
 	void (*func)(struct nouveau_cli_work *);
+
+	/**
+	 * @cli: Reference to the NVIF client this work belongs to.
+	 */
 	struct nouveau_cli *cli;
+
+	/**
+	 * @head: The list entry for this work item in the &struct nouveau_cli
+	 * worker list.
+	 */
 	struct list_head head;
 
 	struct dma_fence *fence;
@@ -131,9 +169,32 @@ nouveau_cli(struct drm_file *fpriv)
 #include <nvif/object.h>
 #include <nvif/parent.h>
 
+/**
+ * struct nouveau_drm - The nouveau-specific device structure.
+ *
+ * This structure is allocated for a device when it is probed and keeps track
+ * of all the nouveau-specific device details. The lifetime of this structure
+ * is the same as the lifetime of a &struct drm_device and is managed by the
+ * DRM layer.
+ */
 struct nouveau_drm {
+	/**
+	 * @parent: Implementation of the interface required to use the NVIF_DEBUG
+	 * and NVIF_ERROR macros
+	 */
 	struct nvif_parent parent;
+
+	/**
+	 * @master: This NVIF client is used to initialize the NVIF driver and used
+	 * for TTM memory allocations. It is the root of the NVIF object tree.
+	 */
 	struct nouveau_cli master;
+
+	/**
+	 * @client: This NVIF client is used by the DRM layer to interact with
+	 * the NVKM layer for everything except TTM memory allocations. It, and
+	 * all other clients, are children of the primary (@master) client.
+	 */
 	struct nouveau_cli client;
 
 	/**
@@ -141,6 +202,12 @@ struct nouveau_drm {
 	 */
 	struct drm_device drm_dev;
 
+	/**
+	 * @clients: List of all &struct nouveau_cli allocated for userspace
+	 * associated with this DRM device. Clients are allocated when the DRM
+	 * file is opened and deallocated when the file is closed. This list is
+	 * protected by the mutex in @client.
+	 */
 	struct list_head clients;
 
 	u8 old_pm_cap;
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
