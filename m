Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F5C76A0F8
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jul 2023 21:16:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AE0910E04B;
	Mon, 31 Jul 2023 19:16:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E68410E04B
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jul 2023 19:16:05 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-586-1j9igSbDPg-9vfI0unmnEg-1; Mon, 31 Jul 2023 15:16:01 -0400
X-MC-Unique: 1j9igSbDPg-9vfI0unmnEg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D77DC185A78B;
 Mon, 31 Jul 2023 19:16:00 +0000 (UTC)
Received: from nomad.redhat.com (unknown [10.64.136.87])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A23DBC57964;
 Mon, 31 Jul 2023 19:15:59 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/nouveau: fixup the uapi header file.
Date: Tue,  1 Aug 2023 05:15:57 +1000
Message-ID: <20230731191557.4179175-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=WINDOWS-1252; x-default=true
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
Cc: nouveau@lists.freedesktop.org, skeggsb@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

nouveau > 10 years ago had a plan for new multiplexer inside a multiplexer
API using nvif. It never fully reached fruition, fast forward 10 years,
and the new vulkan driver is avoiding libdrm and calling ioctls, and
these 3 ioctls, getparam, channel alloc + free don't seem to be things
we'd want to use nvif for.

Undeprecate and put them into the uapi header so we can just copy it
into mesa later.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_abi16.h | 41 ---------------------
 include/uapi/drm/nouveau_drm.h          | 48 +++++++++++++++++++++++--
 2 files changed, 45 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.h b/drivers/gpu/drm/nouv=
eau/nouveau_abi16.h
index 27eae85f33e6..d5d80d0d9011 100644
--- a/drivers/gpu/drm/nouveau/nouveau_abi16.h
+++ b/drivers/gpu/drm/nouveau/nouveau_abi16.h
@@ -43,28 +43,6 @@ int  nouveau_abi16_usif(struct drm_file *, void *data, u=
32 size);
 #define NOUVEAU_GEM_DOMAIN_VRAM      (1 << 1)
 #define NOUVEAU_GEM_DOMAIN_GART      (1 << 2)
=20
-struct drm_nouveau_channel_alloc {
-=09uint32_t     fb_ctxdma_handle;
-=09uint32_t     tt_ctxdma_handle;
-
-=09int          channel;
-=09uint32_t     pushbuf_domains;
-
-=09/* Notifier memory */
-=09uint32_t     notifier_handle;
-
-=09/* DRM-enforced subchannel assignments */
-=09struct {
-=09=09uint32_t handle;
-=09=09uint32_t grclass;
-=09} subchan[8];
-=09uint32_t nr_subchan;
-};
-
-struct drm_nouveau_channel_free {
-=09int channel;
-};
-
 struct drm_nouveau_grobj_alloc {
 =09int      channel;
 =09uint32_t handle;
@@ -83,31 +61,12 @@ struct drm_nouveau_gpuobj_free {
 =09uint32_t handle;
 };
=20
-#define NOUVEAU_GETPARAM_PCI_VENDOR      3
-#define NOUVEAU_GETPARAM_PCI_DEVICE      4
-#define NOUVEAU_GETPARAM_BUS_TYPE        5
-#define NOUVEAU_GETPARAM_FB_SIZE         8
-#define NOUVEAU_GETPARAM_AGP_SIZE        9
-#define NOUVEAU_GETPARAM_CHIPSET_ID      11
-#define NOUVEAU_GETPARAM_VM_VRAM_BASE    12
-#define NOUVEAU_GETPARAM_GRAPH_UNITS     13
-#define NOUVEAU_GETPARAM_PTIMER_TIME     14
-#define NOUVEAU_GETPARAM_HAS_BO_USAGE    15
-#define NOUVEAU_GETPARAM_HAS_PAGEFLIP    16
-struct drm_nouveau_getparam {
-=09uint64_t param;
-=09uint64_t value;
-};
-
 struct drm_nouveau_setparam {
 =09uint64_t param;
 =09uint64_t value;
 };
=20
-#define DRM_IOCTL_NOUVEAU_GETPARAM           DRM_IOWR(DRM_COMMAND_BASE + D=
RM_NOUVEAU_GETPARAM, struct drm_nouveau_getparam)
 #define DRM_IOCTL_NOUVEAU_SETPARAM           DRM_IOWR(DRM_COMMAND_BASE + D=
RM_NOUVEAU_SETPARAM, struct drm_nouveau_setparam)
-#define DRM_IOCTL_NOUVEAU_CHANNEL_ALLOC      DRM_IOWR(DRM_COMMAND_BASE + D=
RM_NOUVEAU_CHANNEL_ALLOC, struct drm_nouveau_channel_alloc)
-#define DRM_IOCTL_NOUVEAU_CHANNEL_FREE       DRM_IOW (DRM_COMMAND_BASE + D=
RM_NOUVEAU_CHANNEL_FREE, struct drm_nouveau_channel_free)
 #define DRM_IOCTL_NOUVEAU_GROBJ_ALLOC        DRM_IOW (DRM_COMMAND_BASE + D=
RM_NOUVEAU_GROBJ_ALLOC, struct drm_nouveau_grobj_alloc)
 #define DRM_IOCTL_NOUVEAU_NOTIFIEROBJ_ALLOC  DRM_IOWR(DRM_COMMAND_BASE + D=
RM_NOUVEAU_NOTIFIEROBJ_ALLOC, struct drm_nouveau_notifierobj_alloc)
 #define DRM_IOCTL_NOUVEAU_GPUOBJ_FREE        DRM_IOW (DRM_COMMAND_BASE + D=
RM_NOUVEAU_GPUOBJ_FREE, struct drm_nouveau_gpuobj_free)
diff --git a/include/uapi/drm/nouveau_drm.h b/include/uapi/drm/nouveau_drm.=
h
index 853a327433d3..1cd97b3d8eda 100644
--- a/include/uapi/drm/nouveau_drm.h
+++ b/include/uapi/drm/nouveau_drm.h
@@ -33,6 +33,44 @@
 extern "C" {
 #endif
=20
+#define NOUVEAU_GETPARAM_PCI_VENDOR      3
+#define NOUVEAU_GETPARAM_PCI_DEVICE      4
+#define NOUVEAU_GETPARAM_BUS_TYPE        5
+#define NOUVEAU_GETPARAM_FB_SIZE         8
+#define NOUVEAU_GETPARAM_AGP_SIZE        9
+#define NOUVEAU_GETPARAM_CHIPSET_ID      11
+#define NOUVEAU_GETPARAM_VM_VRAM_BASE    12
+#define NOUVEAU_GETPARAM_GRAPH_UNITS     13
+#define NOUVEAU_GETPARAM_PTIMER_TIME     14
+#define NOUVEAU_GETPARAM_HAS_BO_USAGE    15
+#define NOUVEAU_GETPARAM_HAS_PAGEFLIP    16
+struct drm_nouveau_getparam {
+=09uint64_t param;
+=09uint64_t value;
+};
+
+struct drm_nouveau_channel_alloc {
+=09uint32_t     fb_ctxdma_handle;
+=09uint32_t     tt_ctxdma_handle;
+
+=09int          channel;
+=09uint32_t     pushbuf_domains;
+
+=09/* Notifier memory */
+=09uint32_t     notifier_handle;
+
+=09/* DRM-enforced subchannel assignments */
+=09struct {
+=09=09uint32_t handle;
+=09=09uint32_t grclass;
+=09} subchan[8];
+=09uint32_t nr_subchan;
+};
+
+struct drm_nouveau_channel_free {
+=09int channel;
+};
+
 #define NOUVEAU_GEM_DOMAIN_CPU       (1 << 0)
 #define NOUVEAU_GEM_DOMAIN_VRAM      (1 << 1)
 #define NOUVEAU_GEM_DOMAIN_GART      (1 << 2)
@@ -126,10 +164,10 @@ struct drm_nouveau_gem_cpu_fini {
 =09__u32 handle;
 };
=20
-#define DRM_NOUVEAU_GETPARAM           0x00 /* deprecated */
+#define DRM_NOUVEAU_GETPARAM           0x00
 #define DRM_NOUVEAU_SETPARAM           0x01 /* deprecated */
-#define DRM_NOUVEAU_CHANNEL_ALLOC      0x02 /* deprecated */
-#define DRM_NOUVEAU_CHANNEL_FREE       0x03 /* deprecated */
+#define DRM_NOUVEAU_CHANNEL_ALLOC      0x02
+#define DRM_NOUVEAU_CHANNEL_FREE       0x03
 #define DRM_NOUVEAU_GROBJ_ALLOC        0x04 /* deprecated */
 #define DRM_NOUVEAU_NOTIFIEROBJ_ALLOC  0x05 /* deprecated */
 #define DRM_NOUVEAU_GPUOBJ_FREE        0x06 /* deprecated */
@@ -188,6 +226,10 @@ struct drm_nouveau_svm_bind {
 #define NOUVEAU_SVM_BIND_TARGET__GPU_VRAM               (1UL << 31)
=20
=20
+#define DRM_IOCTL_NOUVEAU_GETPARAM           DRM_IOWR(DRM_COMMAND_BASE + D=
RM_NOUVEAU_GETPARAM, struct drm_nouveau_getparam)
+#define DRM_IOCTL_NOUVEAU_CHANNEL_ALLOC      DRM_IOWR(DRM_COMMAND_BASE + D=
RM_NOUVEAU_CHANNEL_ALLOC, struct drm_nouveau_channel_alloc)
+#define DRM_IOCTL_NOUVEAU_CHANNEL_FREE       DRM_IOW (DRM_COMMAND_BASE + D=
RM_NOUVEAU_CHANNEL_FREE, struct drm_nouveau_channel_free)
+
 #define DRM_IOCTL_NOUVEAU_SVM_INIT           DRM_IOWR(DRM_COMMAND_BASE + D=
RM_NOUVEAU_SVM_INIT, struct drm_nouveau_svm_init)
 #define DRM_IOCTL_NOUVEAU_SVM_BIND           DRM_IOWR(DRM_COMMAND_BASE + D=
RM_NOUVEAU_SVM_BIND, struct drm_nouveau_svm_bind)
=20
--=20
2.41.0

