Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3198A7DC5D1
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 06:20:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03F9810E3FB;
	Tue, 31 Oct 2023 05:19:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3E8D10E3F7
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 05:19:53 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-320-3HJSOVOkOyaHQ83xNYQf8g-1; Tue,
 31 Oct 2023 01:19:50 -0400
X-MC-Unique: 3HJSOVOkOyaHQ83xNYQf8g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B741D3C108C1;
 Tue, 31 Oct 2023 05:19:49 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.64.136.133])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F343040C6EB9;
 Tue, 31 Oct 2023 05:19:47 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3] nouveau/gsp: move to 535.113.01
Date: Tue, 31 Oct 2023 15:18:45 +1000
Message-ID: <20231031051943.1957328-2-airlied@gmail.com>
In-Reply-To: <20231031051943.1957328-1-airlied@gmail.com>
References: <20231031051943.1957328-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
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
Cc: nouveau@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

This moves the initial effort to the latest 535 firmware.

The gsp msg structs have changed, and the message passing also.
The wpr also seems to have some struct changes.

This version of the firmware will be what we are stuck on for a while,
until we can refactor the driver and work out a better path forward.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 .../sdk/nvidia/inc/alloc/alloc_channel.h      | 13 +++-
 .../common/sdk/nvidia/inc/class/cl0000.h      |  4 +-
 .../common/sdk/nvidia/inc/class/cl0005.h      |  2 +-
 .../common/sdk/nvidia/inc/class/cl0080.h      |  2 +-
 .../common/sdk/nvidia/inc/class/cl2080.h      |  2 +-
 .../nvidia/inc/class/cl2080_notification.h    |  2 +-
 .../common/sdk/nvidia/inc/class/cl84a0.h      |  2 +-
 .../common/sdk/nvidia/inc/class/cl90f1.h      |  2 +-
 .../common/sdk/nvidia/inc/class/clc0b5sw.h    |  2 +-
 .../nvidia/inc/ctrl/ctrl0073/ctrl0073common.h |  2 +-
 .../nvidia/inc/ctrl/ctrl0073/ctrl0073dfp.h    |  2 +-
 .../sdk/nvidia/inc/ctrl/ctrl0073/ctrl0073dp.h |  4 +-
 .../inc/ctrl/ctrl0073/ctrl0073specific.h      |  2 +-
 .../nvidia/inc/ctrl/ctrl0073/ctrl0073system.h |  2 +-
 .../nvidia/inc/ctrl/ctrl0080/ctrl0080fifo.h   |  2 +-
 .../nvidia/inc/ctrl/ctrl0080/ctrl0080gpu.h    |  2 +-
 .../sdk/nvidia/inc/ctrl/ctrl0080/ctrl0080gr.h |  2 +-
 .../nvidia/inc/ctrl/ctrl2080/ctrl2080bios.h   |  2 +-
 .../sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080ce.h |  2 +-
 .../nvidia/inc/ctrl/ctrl2080/ctrl2080event.h  |  2 +-
 .../sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080fb.h |  2 +-
 .../nvidia/inc/ctrl/ctrl2080/ctrl2080fifo.h   |  2 +-
 .../nvidia/inc/ctrl/ctrl2080/ctrl2080gpu.h    |  2 +-
 .../sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080gr.h |  2 +-
 .../inc/ctrl/ctrl2080/ctrl2080internal.h      |  2 +-
 .../common/sdk/nvidia/inc/ctrl/ctrl90f1.h     |  2 +-
 .../nvidia/inc/ctrl/ctrla06f/ctrla06fgpfifo.h |  2 +-
 .../common/sdk/nvidia/inc/nvlimits.h          |  2 +-
 .../common/sdk/nvidia/inc/nvos.h              |  2 +-
 .../common/shared/msgq/inc/msgq/msgq_priv.h   |  2 +-
 .../uproc/os/common/include/libos_init_args.h |  2 +-
 .../nvalloc/common/inc/gsp/gsp_fw_sr_meta.h   |  2 +-
 .../nvalloc/common/inc/gsp/gsp_fw_wpr_meta.h  | 47 ++++++++----
 .../arch/nvalloc/common/inc/rmRiscvUcode.h    |  2 +-
 .../nvidia/arch/nvalloc/common/inc/rmgspseq.h |  2 +-
 .../nvidia/generated/g_allclasses.h           |  2 +-
 .../nvidia/generated/g_chipset_nvoc.h         |  2 +-
 .../nvidia/generated/g_fbsr_nvoc.h            |  2 +-
 .../nvidia/generated/g_gpu_nvoc.h             |  2 +-
 .../nvidia/generated/g_kernel_channel_nvoc.h  |  2 +-
 .../nvidia/generated/g_kernel_fifo_nvoc.h     |  2 +-
 .../nvidia/generated/g_mem_desc_nvoc.h        |  2 +-
 .../nvidia/generated/g_os_nvoc.h              |  2 +-
 .../nvidia/generated/g_rpc-structures.h       |  6 +-
 .../nvidia/generated/g_sdk-structures.h       |  4 +-
 .../nvidia/inc/kernel/gpu/gpu_acpi_data.h     |  4 +-
 .../nvidia/inc/kernel/gpu/gpu_engine_type.h   |  2 +-
 .../nvidia/inc/kernel/gpu/gsp/gsp_fw_heap.h   |  2 +-
 .../nvidia/inc/kernel/gpu/gsp/gsp_init_args.h |  2 +-
 .../inc/kernel/gpu/gsp/gsp_static_config.h    | 26 +++----
 .../nvidia/inc/kernel/gpu/intr/engine_idx.h   |  2 +-
 .../nvidia/inc/kernel/gpu/nvbitmask.h         |  4 +-
 .../nvidia/inc/kernel/os/nv_memory_type.h     |  2 +-
 .../nvidia/kernel/inc/vgpu/rpc_global_enums.h |  2 +-
 .../nvidia/kernel/inc/vgpu/rpc_headers.h      |  2 +-
 .../nvidia/kernel/inc/vgpu/sdk-structures.h   |  2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/ce/r535.c |  4 +-
 .../gpu/drm/nouveau/nvkm/engine/disp/r535.c   | 20 ++---
 .../gpu/drm/nouveau/nvkm/engine/fifo/r535.c   | 20 ++---
 drivers/gpu/drm/nouveau/nvkm/engine/gr/r535.c | 10 +--
 .../gpu/drm/nouveau/nvkm/engine/nvdec/r535.c  |  2 +-
 .../gpu/drm/nouveau/nvkm/engine/nvenc/r535.c  |  2 +-
 .../gpu/drm/nouveau/nvkm/engine/nvjpg/r535.c  |  2 +-
 .../gpu/drm/nouveau/nvkm/engine/ofa/r535.c    |  2 +-
 .../gpu/drm/nouveau/nvkm/subdev/bar/r535.c    |  6 +-
 .../gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c   |  4 +-
 .../gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c   |  4 +-
 .../gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c   |  4 +-
 .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    | 76 +++++++++++--------
 .../gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c   |  4 +-
 .../gpu/drm/nouveau/nvkm/subdev/gsp/tu116.c   |  4 +-
 .../drm/nouveau/nvkm/subdev/instmem/r535.c    | 12 +--
 .../gpu/drm/nouveau/nvkm/subdev/mmu/r535.c    |  6 +-
 73 files changed, 217 insertions(+), 171 deletions(-)
 rename drivers/gpu/drm/nouveau/include/nvrm/{535.54.03 =3D> 535.113.01}/co=
mmon/sdk/nvidia/inc/alloc/alloc_channel.h (93%)
 rename drivers/gpu/drm/nouveau/include/nvrm/{535.54.03 =3D> 535.113.01}/co=
mmon/sdk/nvidia/inc/class/cl0000.h (94%)
 rename drivers/gpu/drm/nouveau/include/nvrm/{535.54.03 =3D> 535.113.01}/co=
mmon/sdk/nvidia/inc/class/cl0005.h (97%)
 rename drivers/gpu/drm/nouveau/include/nvrm/{535.54.03 =3D> 535.113.01}/co=
mmon/sdk/nvidia/inc/class/cl0080.h (98%)
 rename drivers/gpu/drm/nouveau/include/nvrm/{535.54.03 =3D> 535.113.01}/co=
mmon/sdk/nvidia/inc/class/cl2080.h (97%)
 rename drivers/gpu/drm/nouveau/include/nvrm/{535.54.03 =3D> 535.113.01}/co=
mmon/sdk/nvidia/inc/class/cl2080_notification.h (98%)
 rename drivers/gpu/drm/nouveau/include/nvrm/{535.54.03 =3D> 535.113.01}/co=
mmon/sdk/nvidia/inc/class/cl84a0.h (97%)
 rename drivers/gpu/drm/nouveau/include/nvrm/{535.54.03 =3D> 535.113.01}/co=
mmon/sdk/nvidia/inc/class/cl90f1.h (97%)
 rename drivers/gpu/drm/nouveau/include/nvrm/{535.54.03 =3D> 535.113.01}/co=
mmon/sdk/nvidia/inc/class/clc0b5sw.h (97%)
 rename drivers/gpu/drm/nouveau/include/nvrm/{535.54.03 =3D> 535.113.01}/co=
mmon/sdk/nvidia/inc/ctrl/ctrl0073/ctrl0073common.h (98%)
 rename drivers/gpu/drm/nouveau/include/nvrm/{535.54.03 =3D> 535.113.01}/co=
mmon/sdk/nvidia/inc/ctrl/ctrl0073/ctrl0073dfp.h (99%)
 rename drivers/gpu/drm/nouveau/include/nvrm/{535.54.03 =3D> 535.113.01}/co=
mmon/sdk/nvidia/inc/ctrl/ctrl0073/ctrl0073dp.h (99%)
 rename drivers/gpu/drm/nouveau/include/nvrm/{535.54.03 =3D> 535.113.01}/co=
mmon/sdk/nvidia/inc/ctrl/ctrl0073/ctrl0073specific.h (99%)
 rename drivers/gpu/drm/nouveau/include/nvrm/{535.54.03 =3D> 535.113.01}/co=
mmon/sdk/nvidia/inc/ctrl/ctrl0073/ctrl0073system.h (98%)
 rename drivers/gpu/drm/nouveau/include/nvrm/{535.54.03 =3D> 535.113.01}/co=
mmon/sdk/nvidia/inc/ctrl/ctrl0080/ctrl0080fifo.h (99%)
 rename drivers/gpu/drm/nouveau/include/nvrm/{535.54.03 =3D> 535.113.01}/co=
mmon/sdk/nvidia/inc/ctrl/ctrl0080/ctrl0080gpu.h (98%)
 rename drivers/gpu/drm/nouveau/include/nvrm/{535.54.03 =3D> 535.113.01}/co=
mmon/sdk/nvidia/inc/ctrl/ctrl0080/ctrl0080gr.h (97%)
 rename drivers/gpu/drm/nouveau/include/nvrm/{535.54.03 =3D> 535.113.01}/co=
mmon/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080bios.h (97%)
 rename drivers/gpu/drm/nouveau/include/nvrm/{535.54.03 =3D> 535.113.01}/co=
mmon/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080ce.h (98%)
 rename drivers/gpu/drm/nouveau/include/nvrm/{535.54.03 =3D> 535.113.01}/co=
mmon/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080event.h (98%)
 rename drivers/gpu/drm/nouveau/include/nvrm/{535.54.03 =3D> 535.113.01}/co=
mmon/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080fb.h (98%)
 rename drivers/gpu/drm/nouveau/include/nvrm/{535.54.03 =3D> 535.113.01}/co=
mmon/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080fifo.h (98%)
 rename drivers/gpu/drm/nouveau/include/nvrm/{535.54.03 =3D> 535.113.01}/co=
mmon/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080gpu.h (99%)
 rename drivers/gpu/drm/nouveau/include/nvrm/{535.54.03 =3D> 535.113.01}/co=
mmon/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080gr.h (98%)
 rename drivers/gpu/drm/nouveau/include/nvrm/{535.54.03 =3D> 535.113.01}/co=
mmon/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080internal.h (99%)
 rename drivers/gpu/drm/nouveau/include/nvrm/{535.54.03 =3D> 535.113.01}/co=
mmon/sdk/nvidia/inc/ctrl/ctrl90f1.h (98%)
 rename drivers/gpu/drm/nouveau/include/nvrm/{535.54.03 =3D> 535.113.01}/co=
mmon/sdk/nvidia/inc/ctrl/ctrla06f/ctrla06fgpfifo.h (98%)
 rename drivers/gpu/drm/nouveau/include/nvrm/{535.54.03 =3D> 535.113.01}/co=
mmon/sdk/nvidia/inc/nvlimits.h (97%)
 rename drivers/gpu/drm/nouveau/include/nvrm/{535.54.03 =3D> 535.113.01}/co=
mmon/sdk/nvidia/inc/nvos.h (99%)
 rename drivers/gpu/drm/nouveau/include/nvrm/{535.54.03 =3D> 535.113.01}/co=
mmon/shared/msgq/inc/msgq/msgq_priv.h (98%)
 rename drivers/gpu/drm/nouveau/include/nvrm/{535.54.03 =3D> 535.113.01}/co=
mmon/uproc/os/common/include/libos_init_args.h (98%)
 rename drivers/gpu/drm/nouveau/include/nvrm/{535.54.03 =3D> 535.113.01}/nv=
idia/arch/nvalloc/common/inc/gsp/gsp_fw_sr_meta.h (98%)
 rename drivers/gpu/drm/nouveau/include/nvrm/{535.54.03 =3D> 535.113.01}/nv=
idia/arch/nvalloc/common/inc/gsp/gsp_fw_wpr_meta.h (81%)
 rename drivers/gpu/drm/nouveau/include/nvrm/{535.54.03 =3D> 535.113.01}/nv=
idia/arch/nvalloc/common/inc/rmRiscvUcode.h (98%)
 rename drivers/gpu/drm/nouveau/include/nvrm/{535.54.03 =3D> 535.113.01}/nv=
idia/arch/nvalloc/common/inc/rmgspseq.h (99%)
 rename drivers/gpu/drm/nouveau/include/nvrm/{535.54.03 =3D> 535.113.01}/nv=
idia/generated/g_allclasses.h (97%)
 rename drivers/gpu/drm/nouveau/include/nvrm/{535.54.03 =3D> 535.113.01}/nv=
idia/generated/g_chipset_nvoc.h (98%)
 rename drivers/gpu/drm/nouveau/include/nvrm/{535.54.03 =3D> 535.113.01}/nv=
idia/generated/g_fbsr_nvoc.h (97%)
 rename drivers/gpu/drm/nouveau/include/nvrm/{535.54.03 =3D> 535.113.01}/nv=
idia/generated/g_gpu_nvoc.h (97%)
 rename drivers/gpu/drm/nouveau/include/nvrm/{535.54.03 =3D> 535.113.01}/nv=
idia/generated/g_kernel_channel_nvoc.h (98%)
 rename drivers/gpu/drm/nouveau/include/nvrm/{535.54.03 =3D> 535.113.01}/nv=
idia/generated/g_kernel_fifo_nvoc.h (99%)
 rename drivers/gpu/drm/nouveau/include/nvrm/{535.54.03 =3D> 535.113.01}/nv=
idia/generated/g_mem_desc_nvoc.h (97%)
 rename drivers/gpu/drm/nouveau/include/nvrm/{535.54.03 =3D> 535.113.01}/nv=
idia/generated/g_os_nvoc.h (98%)
 rename drivers/gpu/drm/nouveau/include/nvrm/{535.54.03 =3D> 535.113.01}/nv=
idia/generated/g_rpc-structures.h (95%)
 rename drivers/gpu/drm/nouveau/include/nvrm/{535.54.03 =3D> 535.113.01}/nv=
idia/generated/g_sdk-structures.h (94%)
 rename drivers/gpu/drm/nouveau/include/nvrm/{535.54.03 =3D> 535.113.01}/nv=
idia/inc/kernel/gpu/gpu_acpi_data.h (95%)
 rename drivers/gpu/drm/nouveau/include/nvrm/{535.54.03 =3D> 535.113.01}/nv=
idia/inc/kernel/gpu/gpu_engine_type.h (99%)
 rename drivers/gpu/drm/nouveau/include/nvrm/{535.54.03 =3D> 535.113.01}/nv=
idia/inc/kernel/gpu/gsp/gsp_fw_heap.h (97%)
 rename drivers/gpu/drm/nouveau/include/nvrm/{535.54.03 =3D> 535.113.01}/nv=
idia/inc/kernel/gpu/gsp/gsp_init_args.h (98%)
 rename drivers/gpu/drm/nouveau/include/nvrm/{535.54.03 =3D> 535.113.01}/nv=
idia/inc/kernel/gpu/gsp/gsp_static_config.h (86%)
 rename drivers/gpu/drm/nouveau/include/nvrm/{535.54.03 =3D> 535.113.01}/nv=
idia/inc/kernel/gpu/intr/engine_idx.h (98%)
 rename drivers/gpu/drm/nouveau/include/nvrm/{535.54.03 =3D> 535.113.01}/nv=
idia/inc/kernel/gpu/nvbitmask.h (93%)
 rename drivers/gpu/drm/nouveau/include/nvrm/{535.54.03 =3D> 535.113.01}/nv=
idia/inc/kernel/os/nv_memory_type.h (97%)
 rename drivers/gpu/drm/nouveau/include/nvrm/{535.54.03 =3D> 535.113.01}/nv=
idia/kernel/inc/vgpu/rpc_global_enums.h (99%)
 rename drivers/gpu/drm/nouveau/include/nvrm/{535.54.03 =3D> 535.113.01}/nv=
idia/kernel/inc/vgpu/rpc_headers.h (98%)
 rename drivers/gpu/drm/nouveau/include/nvrm/{535.54.03 =3D> 535.113.01}/nv=
idia/kernel/inc/vgpu/sdk-structures.h (97%)

diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvid=
ia/inc/alloc/alloc_channel.h b/drivers/gpu/drm/nouveau/include/nvrm/535.113=
.01/common/sdk/nvidia/inc/alloc/alloc_channel.h
similarity index 93%
rename from drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidi=
a/inc/alloc/alloc_channel.h
rename to drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia=
/inc/alloc/alloc_channel.h
index 29d0b58c25c3..7157c7757698 100644
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/=
alloc/alloc_channel.h
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc=
/alloc/alloc_channel.h
@@ -1,8 +1,8 @@
 #ifndef __src_common_sdk_nvidia_inc_alloc_alloc_channel_h__
 #define __src_common_sdk_nvidia_inc_alloc_alloc_channel_h__
-#include <nvrm/535.54.03/common/sdk/nvidia/inc/nvlimits.h>
+#include <nvrm/535.113.01/common/sdk/nvidia/inc/nvlimits.h>
=20
-/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-mo=
dules/tree/535.54.03 */
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-mo=
dules/tree/535.113.01 */
=20
 /*
  * SPDX-FileCopyrightText: Copyright (c) 2022 NVIDIA CORPORATION & AFFILIA=
TES. All rights reserved.
@@ -116,6 +116,9 @@ typedef struct NV_MEMORY_DESC_PARAMS {
 #define NVOS04_FLAGS_SKIP_CTXBUFFER_ALLOC_FALSE                    0x00000=
000
 #define NVOS04_FLAGS_SKIP_CTXBUFFER_ALLOC_TRUE                     0x00000=
001
=20
+#define CC_CHAN_ALLOC_IV_SIZE_DWORD    3U
+#define CC_CHAN_ALLOC_NONCE_SIZE_DWORD 8U
+
 typedef struct NV_CHANNEL_ALLOC_PARAMS {
=20
     NvHandle hObjectError; // error context DMA
@@ -154,6 +157,12 @@ typedef struct NV_CHANNEL_ALLOC_PARAMS {
     NV_DECLARE_ALIGNED(NV_MEMORY_DESC_PARAMS eccErrorNotifierMem, 8); // r=
eserved
     NvU32    ProcessID;                 // reserved
     NvU32    SubProcessID;                 // reserved
+    // IV used for CPU-side encryption / GPU-side decryption.
+    NvU32    encryptIv[CC_CHAN_ALLOC_IV_SIZE_DWORD];          // reserved
+    // IV used for CPU-side decryption / GPU-side encryption.
+    NvU32    decryptIv[CC_CHAN_ALLOC_IV_SIZE_DWORD];          // reserved
+    // Nonce used CPU-side signing / GPU-side signature verification.
+    NvU32    hmacNonce[CC_CHAN_ALLOC_NONCE_SIZE_DWORD];       // reserved
 } NV_CHANNEL_ALLOC_PARAMS;
=20
 typedef NV_CHANNEL_ALLOC_PARAMS NV_CHANNELGPFIFO_ALLOCATION_PARAMETERS;
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvid=
ia/inc/class/cl0000.h b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/com=
mon/sdk/nvidia/inc/class/cl0000.h
similarity index 94%
rename from drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidi=
a/inc/class/cl0000.h
rename to drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia=
/inc/class/cl0000.h
index dfb3b3e0c45b..7a3fc023072d 100644
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/=
class/cl0000.h
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc=
/class/cl0000.h
@@ -1,8 +1,8 @@
 #ifndef __src_common_sdk_nvidia_inc_class_cl0000_h__
 #define __src_common_sdk_nvidia_inc_class_cl0000_h__
-#include <nvrm/535.54.03/common/sdk/nvidia/inc/nvlimits.h>
+#include <nvrm/535.113.01/common/sdk/nvidia/inc/nvlimits.h>
=20
-/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-mo=
dules/tree/535.54.03 */
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-mo=
dules/tree/535.113.01 */
=20
 /*
  * SPDX-FileCopyrightText: Copyright (c) 2001-2022 NVIDIA CORPORATION & AF=
FILIATES. All rights reserved.
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvid=
ia/inc/class/cl0005.h b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/com=
mon/sdk/nvidia/inc/class/cl0005.h
similarity index 97%
rename from drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidi=
a/inc/class/cl0005.h
rename to drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia=
/inc/class/cl0005.h
index 987bae11ad91..e4de36d63666 100644
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/=
class/cl0005.h
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc=
/class/cl0005.h
@@ -1,7 +1,7 @@
 #ifndef __src_common_sdk_nvidia_inc_class_cl0005_h__
 #define __src_common_sdk_nvidia_inc_class_cl0005_h__
=20
-/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-mo=
dules/tree/535.54.03 */
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-mo=
dules/tree/535.113.01 */
=20
 /*
  * SPDX-FileCopyrightText: Copyright (c) 2001-2022 NVIDIA CORPORATION & AF=
FILIATES. All rights reserved.
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvid=
ia/inc/class/cl0080.h b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/com=
mon/sdk/nvidia/inc/class/cl0080.h
similarity index 98%
rename from drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidi=
a/inc/class/cl0080.h
rename to drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia=
/inc/class/cl0080.h
index aeab857b1e50..8868118e47d6 100644
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/=
class/cl0080.h
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc=
/class/cl0080.h
@@ -1,7 +1,7 @@
 #ifndef __src_common_sdk_nvidia_inc_class_cl0080_h__
 #define __src_common_sdk_nvidia_inc_class_cl0080_h__
=20
-/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-mo=
dules/tree/535.54.03 */
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-mo=
dules/tree/535.113.01 */
=20
 /*
  * SPDX-FileCopyrightText: Copyright (c) 2001-2022 NVIDIA CORPORATION & AF=
FILIATES. All rights reserved.
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvid=
ia/inc/class/cl2080.h b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/com=
mon/sdk/nvidia/inc/class/cl2080.h
similarity index 97%
rename from drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidi=
a/inc/class/cl2080.h
rename to drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia=
/inc/class/cl2080.h
index a0106cd77cd9..9040ea5608a0 100644
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/=
class/cl2080.h
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc=
/class/cl2080.h
@@ -1,7 +1,7 @@
 #ifndef __src_common_sdk_nvidia_inc_class_cl2080_h__
 #define __src_common_sdk_nvidia_inc_class_cl2080_h__
=20
-/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-mo=
dules/tree/535.54.03 */
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-mo=
dules/tree/535.113.01 */
=20
 /*
  * SPDX-FileCopyrightText: Copyright (c) 2002-2022 NVIDIA CORPORATION & AF=
FILIATES. All rights reserved.
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvid=
ia/inc/class/cl2080_notification.h b/drivers/gpu/drm/nouveau/include/nvrm/5=
35.113.01/common/sdk/nvidia/inc/class/cl2080_notification.h
similarity index 98%
rename from drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidi=
a/inc/class/cl2080_notification.h
rename to drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia=
/inc/class/cl2080_notification.h
index eea583de08f3..ba659d6477d3 100644
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/=
class/cl2080_notification.h
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc=
/class/cl2080_notification.h
@@ -1,7 +1,7 @@
 #ifndef __src_common_sdk_nvidia_inc_class_cl2080_notification_h__
 #define __src_common_sdk_nvidia_inc_class_cl2080_notification_h__
=20
-/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-mo=
dules/tree/535.54.03 */
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-mo=
dules/tree/535.113.01 */
=20
 /*
  * SPDX-FileCopyrightText: Copyright (c) 2022 NVIDIA CORPORATION & AFFILIA=
TES. All rights reserved.
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvid=
ia/inc/class/cl84a0.h b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/com=
mon/sdk/nvidia/inc/class/cl84a0.h
similarity index 97%
rename from drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidi=
a/inc/class/cl84a0.h
rename to drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia=
/inc/class/cl84a0.h
index d96855d42e62..9eb780a1ac72 100644
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/=
class/cl84a0.h
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc=
/class/cl84a0.h
@@ -1,7 +1,7 @@
 #ifndef __src_common_sdk_nvidia_inc_class_cl84a0_h__
 #define __src_common_sdk_nvidia_inc_class_cl84a0_h__
=20
-/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-mo=
dules/tree/535.54.03 */
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-mo=
dules/tree/535.113.01 */
=20
 /*
  * SPDX-FileCopyrightText: Copyright (c) 2001-2022 NVIDIA CORPORATION & AF=
FILIATES. All rights reserved.
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvid=
ia/inc/class/cl90f1.h b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/com=
mon/sdk/nvidia/inc/class/cl90f1.h
similarity index 97%
rename from drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidi=
a/inc/class/cl90f1.h
rename to drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia=
/inc/class/cl90f1.h
index 6ed4ed49bbcc..f1d21776e395 100644
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/=
class/cl90f1.h
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc=
/class/cl90f1.h
@@ -1,7 +1,7 @@
 #ifndef __src_common_sdk_nvidia_inc_class_cl90f1_h__
 #define __src_common_sdk_nvidia_inc_class_cl90f1_h__
=20
-/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-mo=
dules/tree/535.54.03 */
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-mo=
dules/tree/535.113.01 */
=20
 /*
  * SPDX-FileCopyrightText: Copyright (c) 2011 NVIDIA CORPORATION & AFFILIA=
TES. All rights reserved.
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvid=
ia/inc/class/clc0b5sw.h b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/c=
ommon/sdk/nvidia/inc/class/clc0b5sw.h
similarity index 97%
rename from drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidi=
a/inc/class/clc0b5sw.h
rename to drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia=
/inc/class/clc0b5sw.h
index 7dcc961cf0dc..b8f32576cfaa 100644
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/=
class/clc0b5sw.h
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc=
/class/clc0b5sw.h
@@ -1,7 +1,7 @@
 #ifndef __src_common_sdk_nvidia_inc_class_clc0b5sw_h__
 #define __src_common_sdk_nvidia_inc_class_clc0b5sw_h__
=20
-/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-mo=
dules/tree/535.54.03 */
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-mo=
dules/tree/535.113.01 */
=20
 /*
  * SPDX-FileCopyrightText: Copyright (c) 2014-2022 NVIDIA CORPORATION & AF=
FILIATES. All rights reserved.
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvid=
ia/inc/ctrl/ctrl0073/ctrl0073common.h b/drivers/gpu/drm/nouveau/include/nvr=
m/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl0073/ctrl0073common.h
similarity index 98%
rename from drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidi=
a/inc/ctrl/ctrl0073/ctrl0073common.h
rename to drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia=
/inc/ctrl/ctrl0073/ctrl0073common.h
index 9f2b8557c79c..58b3ba7badf1 100644
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/=
ctrl/ctrl0073/ctrl0073common.h
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc=
/ctrl/ctrl0073/ctrl0073common.h
@@ -1,7 +1,7 @@
 #ifndef __src_common_sdk_nvidia_inc_ctrl_ctrl0073_ctrl0073common_h__
 #define __src_common_sdk_nvidia_inc_ctrl_ctrl0073_ctrl0073common_h__
=20
-/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-mo=
dules/tree/535.54.03 */
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-mo=
dules/tree/535.113.01 */
=20
 /*
  * SPDX-FileCopyrightText: Copyright (c) 2022 NVIDIA CORPORATION & AFFILIA=
TES. All rights reserved.
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvid=
ia/inc/ctrl/ctrl0073/ctrl0073dfp.h b/drivers/gpu/drm/nouveau/include/nvrm/5=
35.113.01/common/sdk/nvidia/inc/ctrl/ctrl0073/ctrl0073dfp.h
similarity index 99%
rename from drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidi=
a/inc/ctrl/ctrl0073/ctrl0073dfp.h
rename to drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia=
/inc/ctrl/ctrl0073/ctrl0073dfp.h
index 193f2cbc302b..596f2ea8344e 100644
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/=
ctrl/ctrl0073/ctrl0073dfp.h
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc=
/ctrl/ctrl0073/ctrl0073dfp.h
@@ -1,7 +1,7 @@
 #ifndef __src_common_sdk_nvidia_inc_ctrl_ctrl0073_ctrl0073dfp_h__
 #define __src_common_sdk_nvidia_inc_ctrl_ctrl0073_ctrl0073dfp_h__
=20
-/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-mo=
dules/tree/535.54.03 */
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-mo=
dules/tree/535.113.01 */
=20
 /*
  * SPDX-FileCopyrightText: Copyright (c) 2005-2022 NVIDIA CORPORATION & AF=
FILIATES. All rights reserved.
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvid=
ia/inc/ctrl/ctrl0073/ctrl0073dp.h b/drivers/gpu/drm/nouveau/include/nvrm/53=
5.113.01/common/sdk/nvidia/inc/ctrl/ctrl0073/ctrl0073dp.h
similarity index 99%
rename from drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidi=
a/inc/ctrl/ctrl0073/ctrl0073dp.h
rename to drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia=
/inc/ctrl/ctrl0073/ctrl0073dp.h
index 76dafc828064..bae4b1997736 100644
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/=
ctrl/ctrl0073/ctrl0073dp.h
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc=
/ctrl/ctrl0073/ctrl0073dp.h
@@ -1,8 +1,8 @@
 #ifndef __src_common_sdk_nvidia_inc_ctrl_ctrl0073_ctrl0073dp_h__
 #define __src_common_sdk_nvidia_inc_ctrl_ctrl0073_ctrl0073dp_h__
-#include <nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl0073/ctrl0073commo=
n.h>
+#include <nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl0073/ctrl0073comm=
on.h>
=20
-/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-mo=
dules/tree/535.54.03 */
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-mo=
dules/tree/535.113.01 */
=20
 /*
  * SPDX-FileCopyrightText: Copyright (c) 2005-2022 NVIDIA CORPORATION & AF=
FILIATES. All rights reserved.
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvid=
ia/inc/ctrl/ctrl0073/ctrl0073specific.h b/drivers/gpu/drm/nouveau/include/n=
vrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl0073/ctrl0073specific.h
similarity index 99%
rename from drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidi=
a/inc/ctrl/ctrl0073/ctrl0073specific.h
rename to drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia=
/inc/ctrl/ctrl0073/ctrl0073specific.h
index bf44b28e7603..954958dcf834 100644
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/=
ctrl/ctrl0073/ctrl0073specific.h
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc=
/ctrl/ctrl0073/ctrl0073specific.h
@@ -1,7 +1,7 @@
 #ifndef __src_common_sdk_nvidia_inc_ctrl_ctrl0073_ctrl0073specific_h__
 #define __src_common_sdk_nvidia_inc_ctrl_ctrl0073_ctrl0073specific_h__
=20
-/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-mo=
dules/tree/535.54.03 */
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-mo=
dules/tree/535.113.01 */
=20
 /*
  * SPDX-FileCopyrightText: Copyright (c) 1993-2022 NVIDIA CORPORATION & AF=
FILIATES. All rights reserved.
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvid=
ia/inc/ctrl/ctrl0073/ctrl0073system.h b/drivers/gpu/drm/nouveau/include/nvr=
m/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl0073/ctrl0073system.h
similarity index 98%
rename from drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidi=
a/inc/ctrl/ctrl0073/ctrl0073system.h
rename to drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia=
/inc/ctrl/ctrl0073/ctrl0073system.h
index 1ff22f06dc82..d69cef3c01fd 100644
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/=
ctrl/ctrl0073/ctrl0073system.h
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc=
/ctrl/ctrl0073/ctrl0073system.h
@@ -1,7 +1,7 @@
 #ifndef __src_common_sdk_nvidia_inc_ctrl_ctrl0073_ctrl0073system_h__
 #define __src_common_sdk_nvidia_inc_ctrl_ctrl0073_ctrl0073system_h__
=20
-/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-mo=
dules/tree/535.54.03 */
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-mo=
dules/tree/535.113.01 */
=20
 /*
  * SPDX-FileCopyrightText: Copyright (c) 2005-2021 NVIDIA CORPORATION & AF=
FILIATES. All rights reserved.
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvid=
ia/inc/ctrl/ctrl0080/ctrl0080fifo.h b/drivers/gpu/drm/nouveau/include/nvrm/=
535.113.01/common/sdk/nvidia/inc/ctrl/ctrl0080/ctrl0080fifo.h
similarity index 99%
rename from drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidi=
a/inc/ctrl/ctrl0080/ctrl0080fifo.h
rename to drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia=
/inc/ctrl/ctrl0080/ctrl0080fifo.h
index 7fda8d2d2067..6acb3f73242d 100644
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/=
ctrl/ctrl0080/ctrl0080fifo.h
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc=
/ctrl/ctrl0080/ctrl0080fifo.h
@@ -1,7 +1,7 @@
 #ifndef __src_common_sdk_nvidia_inc_ctrl_ctrl0080_ctrl0080fifo_h__
 #define __src_common_sdk_nvidia_inc_ctrl_ctrl0080_ctrl0080fifo_h__
=20
-/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-mo=
dules/tree/535.54.03 */
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-mo=
dules/tree/535.113.01 */
=20
 /*
  * SPDX-FileCopyrightText: Copyright (c) 2006-2022 NVIDIA CORPORATION & AF=
FILIATES. All rights reserved.
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvid=
ia/inc/ctrl/ctrl0080/ctrl0080gpu.h b/drivers/gpu/drm/nouveau/include/nvrm/5=
35.113.01/common/sdk/nvidia/inc/ctrl/ctrl0080/ctrl0080gpu.h
similarity index 98%
rename from drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidi=
a/inc/ctrl/ctrl0080/ctrl0080gpu.h
rename to drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia=
/inc/ctrl/ctrl0080/ctrl0080gpu.h
index 60ba4967dcd9..3db099e62364 100644
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/=
ctrl/ctrl0080/ctrl0080gpu.h
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc=
/ctrl/ctrl0080/ctrl0080gpu.h
@@ -1,7 +1,7 @@
 #ifndef __src_common_sdk_nvidia_inc_ctrl_ctrl0080_ctrl0080gpu_h__
 #define __src_common_sdk_nvidia_inc_ctrl_ctrl0080_ctrl0080gpu_h__
=20
-/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-mo=
dules/tree/535.54.03 */
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-mo=
dules/tree/535.113.01 */
=20
 /*
  * SPDX-FileCopyrightText: Copyright (c) 2004-2022 NVIDIA CORPORATION & AF=
FILIATES. All rights reserved.
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvid=
ia/inc/ctrl/ctrl0080/ctrl0080gr.h b/drivers/gpu/drm/nouveau/include/nvrm/53=
5.113.01/common/sdk/nvidia/inc/ctrl/ctrl0080/ctrl0080gr.h
similarity index 97%
rename from drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidi=
a/inc/ctrl/ctrl0080/ctrl0080gr.h
rename to drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia=
/inc/ctrl/ctrl0080/ctrl0080gr.h
index c08e2fcb4979..ed01df925573 100644
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/=
ctrl/ctrl0080/ctrl0080gr.h
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc=
/ctrl/ctrl0080/ctrl0080gr.h
@@ -1,7 +1,7 @@
 #ifndef __src_common_sdk_nvidia_inc_ctrl_ctrl0080_ctrl0080gr_h__
 #define __src_common_sdk_nvidia_inc_ctrl_ctrl0080_ctrl0080gr_h__
=20
-/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-mo=
dules/tree/535.54.03 */
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-mo=
dules/tree/535.113.01 */
=20
 /*
  * SPDX-FileCopyrightText: Copyright (c) 2004-2022 NVIDIA CORPORATION & AF=
FILIATES. All rights reserved.
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvid=
ia/inc/ctrl/ctrl2080/ctrl2080bios.h b/drivers/gpu/drm/nouveau/include/nvrm/=
535.113.01/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080bios.h
similarity index 97%
rename from drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidi=
a/inc/ctrl/ctrl2080/ctrl2080bios.h
rename to drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia=
/inc/ctrl/ctrl2080/ctrl2080bios.h
index 9c61a6f74aa4..b5b7631de99b 100644
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/=
ctrl/ctrl2080/ctrl2080bios.h
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc=
/ctrl/ctrl2080/ctrl2080bios.h
@@ -1,7 +1,7 @@
 #ifndef __src_common_sdk_nvidia_inc_ctrl_ctrl2080_ctrl2080bios_h__
 #define __src_common_sdk_nvidia_inc_ctrl_ctrl2080_ctrl2080bios_h__
=20
-/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-mo=
dules/tree/535.54.03 */
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-mo=
dules/tree/535.113.01 */
=20
 /*
  * SPDX-FileCopyrightText: Copyright (c) 2005-2021 NVIDIA CORPORATION & AF=
FILIATES. All rights reserved.
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvid=
ia/inc/ctrl/ctrl2080/ctrl2080ce.h b/drivers/gpu/drm/nouveau/include/nvrm/53=
5.113.01/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080ce.h
similarity index 98%
rename from drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidi=
a/inc/ctrl/ctrl2080/ctrl2080ce.h
rename to drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia=
/inc/ctrl/ctrl2080/ctrl2080ce.h
index c1e79f64bd03..fe912d2bd183 100644
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/=
ctrl/ctrl2080/ctrl2080ce.h
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc=
/ctrl/ctrl2080/ctrl2080ce.h
@@ -1,7 +1,7 @@
 #ifndef __src_common_sdk_nvidia_inc_ctrl_ctrl2080_ctrl2080ce_h__
 #define __src_common_sdk_nvidia_inc_ctrl_ctrl2080_ctrl2080ce_h__
=20
-/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-mo=
dules/tree/535.54.03 */
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-mo=
dules/tree/535.113.01 */
=20
 /*
  * SPDX-FileCopyrightText: Copyright (c) 2014-2023 NVIDIA CORPORATION & AF=
FILIATES. All rights reserved.
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvid=
ia/inc/ctrl/ctrl2080/ctrl2080event.h b/drivers/gpu/drm/nouveau/include/nvrm=
/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080event.h
similarity index 98%
rename from drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidi=
a/inc/ctrl/ctrl2080/ctrl2080event.h
rename to drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia=
/inc/ctrl/ctrl2080/ctrl2080event.h
index 472702723057..87bc4ff92ce1 100644
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/=
ctrl/ctrl2080/ctrl2080event.h
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc=
/ctrl/ctrl2080/ctrl2080event.h
@@ -1,7 +1,7 @@
 #ifndef __src_common_sdk_nvidia_inc_ctrl_ctrl2080_ctrl2080event_h__
 #define __src_common_sdk_nvidia_inc_ctrl_ctrl2080_ctrl2080event_h__
=20
-/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-mo=
dules/tree/535.54.03 */
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-mo=
dules/tree/535.113.01 */
=20
 /*
  * SPDX-FileCopyrightText: Copyright (c) 2006-2021 NVIDIA CORPORATION & AF=
FILIATES. All rights reserved.
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvid=
ia/inc/ctrl/ctrl2080/ctrl2080fb.h b/drivers/gpu/drm/nouveau/include/nvrm/53=
5.113.01/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080fb.h
similarity index 98%
rename from drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidi=
a/inc/ctrl/ctrl2080/ctrl2080fb.h
rename to drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia=
/inc/ctrl/ctrl2080/ctrl2080fb.h
index 20a50a22e748..68c81f9f803c 100644
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/=
ctrl/ctrl2080/ctrl2080fb.h
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc=
/ctrl/ctrl2080/ctrl2080fb.h
@@ -1,7 +1,7 @@
 #ifndef __src_common_sdk_nvidia_inc_ctrl_ctrl2080_ctrl2080fb_h__
 #define __src_common_sdk_nvidia_inc_ctrl_ctrl2080_ctrl2080fb_h__
=20
-/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-mo=
dules/tree/535.54.03 */
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-mo=
dules/tree/535.113.01 */
=20
 /*
  * SPDX-FileCopyrightText: Copyright (c) 2006-2021 NVIDIA CORPORATION & AF=
FILIATES. All rights reserved.
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvid=
ia/inc/ctrl/ctrl2080/ctrl2080fifo.h b/drivers/gpu/drm/nouveau/include/nvrm/=
535.113.01/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080fifo.h
similarity index 98%
rename from drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidi=
a/inc/ctrl/ctrl2080/ctrl2080fifo.h
rename to drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia=
/inc/ctrl/ctrl2080/ctrl2080fifo.h
index 8865dd589822..bc0f63699b06 100644
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/=
ctrl/ctrl2080/ctrl2080fifo.h
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc=
/ctrl/ctrl2080/ctrl2080fifo.h
@@ -1,7 +1,7 @@
 #ifndef __src_common_sdk_nvidia_inc_ctrl_ctrl2080_ctrl2080fifo_h__
 #define __src_common_sdk_nvidia_inc_ctrl_ctrl2080_ctrl2080fifo_h__
=20
-/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-mo=
dules/tree/535.54.03 */
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-mo=
dules/tree/535.113.01 */
=20
 /*
  * SPDX-FileCopyrightText: Copyright (c) 2006-2022 NVIDIA CORPORATION & AF=
FILIATES. All rights reserved.
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvid=
ia/inc/ctrl/ctrl2080/ctrl2080gpu.h b/drivers/gpu/drm/nouveau/include/nvrm/5=
35.113.01/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080gpu.h
similarity index 99%
rename from drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidi=
a/inc/ctrl/ctrl2080/ctrl2080gpu.h
rename to drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia=
/inc/ctrl/ctrl2080/ctrl2080gpu.h
index ce43708a6f18..29d7a1052142 100644
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/=
ctrl/ctrl2080/ctrl2080gpu.h
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc=
/ctrl/ctrl2080/ctrl2080gpu.h
@@ -1,7 +1,7 @@
 #ifndef __src_common_sdk_nvidia_inc_ctrl_ctrl2080_ctrl2080gpu_h__
 #define __src_common_sdk_nvidia_inc_ctrl_ctrl2080_ctrl2080gpu_h__
=20
-/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-mo=
dules/tree/535.54.03 */
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-mo=
dules/tree/535.113.01 */
=20
 /*
  * SPDX-FileCopyrightText: Copyright (c) 2006-2023 NVIDIA CORPORATION & AF=
FILIATES. All rights reserved.
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvid=
ia/inc/ctrl/ctrl2080/ctrl2080gr.h b/drivers/gpu/drm/nouveau/include/nvrm/53=
5.113.01/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080gr.h
similarity index 98%
rename from drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidi=
a/inc/ctrl/ctrl2080/ctrl2080gr.h
rename to drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia=
/inc/ctrl/ctrl2080/ctrl2080gr.h
index 6f99038d6e16..59f8895bc5d7 100644
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/=
ctrl/ctrl2080/ctrl2080gr.h
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc=
/ctrl/ctrl2080/ctrl2080gr.h
@@ -1,7 +1,7 @@
 #ifndef __src_common_sdk_nvidia_inc_ctrl_ctrl2080_ctrl2080gr_h__
 #define __src_common_sdk_nvidia_inc_ctrl_ctrl2080_ctrl2080gr_h__
=20
-/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-mo=
dules/tree/535.54.03 */
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-mo=
dules/tree/535.113.01 */
=20
 /*
  * SPDX-FileCopyrightText: Copyright (c) 2006-2023 NVIDIA CORPORATION & AF=
FILIATES. All rights reserved.
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvid=
ia/inc/ctrl/ctrl2080/ctrl2080internal.h b/drivers/gpu/drm/nouveau/include/n=
vrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080internal.h
similarity index 99%
rename from drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidi=
a/inc/ctrl/ctrl2080/ctrl2080internal.h
rename to drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia=
/inc/ctrl/ctrl2080/ctrl2080internal.h
index cfe53c7cb4ce..e11b2dbe5288 100644
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/=
ctrl/ctrl2080/ctrl2080internal.h
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc=
/ctrl/ctrl2080/ctrl2080internal.h
@@ -1,7 +1,7 @@
 #ifndef __src_common_sdk_nvidia_inc_ctrl_ctrl2080_ctrl2080internal_h__
 #define __src_common_sdk_nvidia_inc_ctrl_ctrl2080_ctrl2080internal_h__
=20
-/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-mo=
dules/tree/535.54.03 */
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-mo=
dules/tree/535.113.01 */
=20
 /*
  * SPDX-FileCopyrightText: Copyright (c) 2020-2023 NVIDIA CORPORATION & AF=
FILIATES. All rights reserved.
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvid=
ia/inc/ctrl/ctrl90f1.h b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/co=
mmon/sdk/nvidia/inc/ctrl/ctrl90f1.h
similarity index 98%
rename from drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidi=
a/inc/ctrl/ctrl90f1.h
rename to drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia=
/inc/ctrl/ctrl90f1.h
index fbc2794c0341..977e59818533 100644
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/=
ctrl/ctrl90f1.h
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc=
/ctrl/ctrl90f1.h
@@ -1,7 +1,7 @@
 #ifndef __src_common_sdk_nvidia_inc_ctrl_ctrl90f1_h__
 #define __src_common_sdk_nvidia_inc_ctrl_ctrl90f1_h__
=20
-/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-mo=
dules/tree/535.54.03 */
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-mo=
dules/tree/535.113.01 */
=20
 /*
  * SPDX-FileCopyrightText: Copyright (c) 2014-2021 NVIDIA CORPORATION & AF=
FILIATES. All rights reserved.
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvid=
ia/inc/ctrl/ctrla06f/ctrla06fgpfifo.h b/drivers/gpu/drm/nouveau/include/nvr=
m/535.113.01/common/sdk/nvidia/inc/ctrl/ctrla06f/ctrla06fgpfifo.h
similarity index 98%
rename from drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidi=
a/inc/ctrl/ctrla06f/ctrla06fgpfifo.h
rename to drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia=
/inc/ctrl/ctrla06f/ctrla06fgpfifo.h
index fce434425bdf..684045796232 100644
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/=
ctrl/ctrla06f/ctrla06fgpfifo.h
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc=
/ctrl/ctrla06f/ctrla06fgpfifo.h
@@ -1,7 +1,7 @@
 #ifndef __src_common_sdk_nvidia_inc_ctrl_ctrla06f_ctrla06fgpfifo_h__
 #define __src_common_sdk_nvidia_inc_ctrl_ctrla06f_ctrla06fgpfifo_h__
=20
-/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-mo=
dules/tree/535.54.03 */
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-mo=
dules/tree/535.113.01 */
=20
 /*
  * SPDX-FileCopyrightText: Copyright (c) 2007-2022 NVIDIA CORPORATION & AF=
FILIATES. All rights reserved.
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvid=
ia/inc/nvlimits.h b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/=
sdk/nvidia/inc/nvlimits.h
similarity index 97%
rename from drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidi=
a/inc/nvlimits.h
rename to drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia=
/inc/nvlimits.h
index 21f53f46a7b8..5c5a004a8031 100644
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/=
nvlimits.h
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc=
/nvlimits.h
@@ -1,7 +1,7 @@
 #ifndef __src_common_sdk_nvidia_inc_nvlimits_h__
 #define __src_common_sdk_nvidia_inc_nvlimits_h__
=20
-/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-mo=
dules/tree/535.54.03 */
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-mo=
dules/tree/535.113.01 */
=20
 /*
  * SPDX-FileCopyrightText: Copyright (c) 2017 NVIDIA CORPORATION & AFFILIA=
TES. All rights reserved.
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvid=
ia/inc/nvos.h b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/=
nvidia/inc/nvos.h
similarity index 99%
rename from drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidi=
a/inc/nvos.h
rename to drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia=
/inc/nvos.h
index 7e909d8945cd..51b5591c603e 100644
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/=
nvos.h
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc=
/nvos.h
@@ -1,7 +1,7 @@
 #ifndef __src_common_sdk_nvidia_inc_nvos_h__
 #define __src_common_sdk_nvidia_inc_nvos_h__
=20
-/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-mo=
dules/tree/535.54.03 */
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-mo=
dules/tree/535.113.01 */
=20
 /*
  * SPDX-FileCopyrightText: Copyright (c) 1993-2023 NVIDIA CORPORATION & AF=
FILIATES. All rights reserved.
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/shared/m=
sgq/inc/msgq/msgq_priv.h b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/=
common/shared/msgq/inc/msgq/msgq_priv.h
similarity index 98%
rename from drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/shared/ms=
gq/inc/msgq/msgq_priv.h
rename to drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/shared/msg=
q/inc/msgq/msgq_priv.h
index 26b096d0e225..5a2f273d95c8 100644
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/shared/msgq/inc=
/msgq/msgq_priv.h
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/shared/msgq/in=
c/msgq/msgq_priv.h
@@ -1,7 +1,7 @@
 #ifndef __src_common_shared_msgq_inc_msgq_msgq_priv_h__
 #define __src_common_shared_msgq_inc_msgq_msgq_priv_h__
=20
-/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-mo=
dules/tree/535.54.03 */
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-mo=
dules/tree/535.113.01 */
=20
 /*
  * SPDX-FileCopyrightText: Copyright (c) 2018-2019 NVIDIA CORPORATION & AF=
FILIATES. All rights reserved.
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/uproc/os=
/common/include/libos_init_args.h b/drivers/gpu/drm/nouveau/include/nvrm/53=
5.113.01/common/uproc/os/common/include/libos_init_args.h
similarity index 98%
rename from drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/uproc/os/=
common/include/libos_init_args.h
rename to drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/uproc/os/c=
ommon/include/libos_init_args.h
index 0aa4b26fda09..83cf1b2c15a3 100644
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/uproc/os/common=
/include/libos_init_args.h
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/uproc/os/commo=
n/include/libos_init_args.h
@@ -1,7 +1,7 @@
 #ifndef __src_common_uproc_os_common_include_libos_init_args_h__
 #define __src_common_uproc_os_common_include_libos_init_args_h__
=20
-/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-mo=
dules/tree/535.54.03 */
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-mo=
dules/tree/535.113.01 */
=20
 /*
  * SPDX-FileCopyrightText: Copyright (c) 2018-2022 NVIDIA CORPORATION & AF=
FILIATES. All rights reserved.
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/arch/nva=
lloc/common/inc/gsp/gsp_fw_sr_meta.h b/drivers/gpu/drm/nouveau/include/nvrm=
/535.113.01/nvidia/arch/nvalloc/common/inc/gsp/gsp_fw_sr_meta.h
similarity index 98%
rename from drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/arch/nval=
loc/common/inc/gsp/gsp_fw_sr_meta.h
rename to drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/arch/nvall=
oc/common/inc/gsp/gsp_fw_sr_meta.h
index e3754a3bfe39..73213bdfcbda 100644
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/arch/nvalloc/co=
mmon/inc/gsp/gsp_fw_sr_meta.h
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/arch/nvalloc/c=
ommon/inc/gsp/gsp_fw_sr_meta.h
@@ -1,7 +1,7 @@
 #ifndef __src_nvidia_arch_nvalloc_common_inc_gsp_gsp_fw_sr_meta_h__
 #define __src_nvidia_arch_nvalloc_common_inc_gsp_gsp_fw_sr_meta_h__
=20
-/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-mo=
dules/tree/535.54.03 */
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-mo=
dules/tree/535.113.01 */
=20
 /*
  * SPDX-FileCopyrightText: Copyright (c) 2022-2023 NVIDIA CORPORATION & AF=
FILIATES. All rights reserved.
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/arch/nva=
lloc/common/inc/gsp/gsp_fw_wpr_meta.h b/drivers/gpu/drm/nouveau/include/nvr=
m/535.113.01/nvidia/arch/nvalloc/common/inc/gsp/gsp_fw_wpr_meta.h
similarity index 81%
rename from drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/arch/nval=
loc/common/inc/gsp/gsp_fw_wpr_meta.h
rename to drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/arch/nvall=
oc/common/inc/gsp/gsp_fw_wpr_meta.h
index 65efe8985a72..a2e141e4b459 100644
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/arch/nvalloc/co=
mmon/inc/gsp/gsp_fw_wpr_meta.h
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/arch/nvalloc/c=
ommon/inc/gsp/gsp_fw_wpr_meta.h
@@ -1,7 +1,7 @@
 #ifndef __src_nvidia_arch_nvalloc_common_inc_gsp_gsp_fw_wpr_meta_h__
 #define __src_nvidia_arch_nvalloc_common_inc_gsp_gsp_fw_wpr_meta_h__
=20
-/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-mo=
dules/tree/535.54.03 */
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-mo=
dules/tree/535.113.01 */
=20
 /*
  * SPDX-FileCopyrightText: Copyright (c) 2021-2023 NVIDIA CORPORATION & AF=
FILIATES. All rights reserved.
@@ -115,21 +115,42 @@ typedef struct
     //       be moved to a different comm. mechanism between the bootstrap=
per
     //       and the GSP-RM tasks.
=20
-    // Shared partition RPC memory (physical address)
-    NvU64 partitionRpcAddr;
+    union
+    {
+=09struct
+=09{
+=09    // Shared partition RPC memory (physical address)
+=09    NvU64 partitionRpcAddr;
+
+=09    // Offsets relative to partitionRpcAddr
+=09    NvU16 partitionRpcRequestOffset;
+=09    NvU16 partitionRpcReplyOffset;
=20
-    // Offsets relative to partitionRpcAddr
-    NvU16 partitionRpcRequestOffset;
-    NvU16 partitionRpcReplyOffset;
+=09    // Code section and dataSection offset and size.
+=09    NvU32 elfCodeOffset;
+=09    NvU32 elfDataOffset;
+=09    NvU32 elfCodeSize;
+=09    NvU32 elfDataSize;
=20
-    // Code section and dataSection offset and size.
-    NvU32 elfCodeOffset;
-    NvU32 elfDataOffset;
-    NvU32 elfCodeSize;
-    NvU32 elfDataSize;
+=09    // Used during GSP-RM resume to check for revocation
+=09    NvU32 lsUcodeVersion;
+=09};
=20
-    // Used during GSP-RM resume to check for revocation
-    NvU32 lsUcodeVersion;
+        struct
+=09{
+=09    // Pad for the partitionRpc* fields, plus 4 bytes
+=09    NvU32 partitionRpcPadding[4];
+
+            // CrashCat (contiguous) buffer size/location - occupies same =
bytes as the
+            // elf(Code|Data)(Offset|Size) fields above.
+            // TODO: move to GSP_FMC_INIT_PARAMS
+            NvU64 sysmemAddrOfCrashReportQueue;
+            NvU32 sizeOfCrashReportQueue;
+
+            // Pad for the lsUcodeVersion field
+            NvU32 lsUcodeVersionPadding[1];
+        };
+    };
=20
     // Number of VF partitions allocating sub-heaps from the WPR heap
     // Used during boot to ensure the heap is adequately sized
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/arch/nva=
lloc/common/inc/rmRiscvUcode.h b/drivers/gpu/drm/nouveau/include/nvrm/535.1=
13.01/nvidia/arch/nvalloc/common/inc/rmRiscvUcode.h
similarity index 98%
rename from drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/arch/nval=
loc/common/inc/rmRiscvUcode.h
rename to drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/arch/nvall=
oc/common/inc/rmRiscvUcode.h
index da18e7eab940..4eff473e8990 100644
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/arch/nvalloc/co=
mmon/inc/rmRiscvUcode.h
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/arch/nvalloc/c=
ommon/inc/rmRiscvUcode.h
@@ -1,7 +1,7 @@
 #ifndef __src_nvidia_arch_nvalloc_common_inc_rmRiscvUcode_h__
 #define __src_nvidia_arch_nvalloc_common_inc_rmRiscvUcode_h__
=20
-/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-mo=
dules/tree/535.54.03 */
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-mo=
dules/tree/535.113.01 */
=20
 /*
  * SPDX-FileCopyrightText: Copyright (c) 2018-2019 NVIDIA CORPORATION & AF=
FILIATES. All rights reserved.
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/arch/nva=
lloc/common/inc/rmgspseq.h b/drivers/gpu/drm/nouveau/include/nvrm/535.113.0=
1/nvidia/arch/nvalloc/common/inc/rmgspseq.h
similarity index 99%
rename from drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/arch/nval=
loc/common/inc/rmgspseq.h
rename to drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/arch/nvall=
oc/common/inc/rmgspseq.h
index 1048205a0e46..341ab0dbeaf2 100644
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/arch/nvalloc/co=
mmon/inc/rmgspseq.h
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/arch/nvalloc/c=
ommon/inc/rmgspseq.h
@@ -1,7 +1,7 @@
 #ifndef __src_nvidia_arch_nvalloc_common_inc_rmgspseq_h__
 #define __src_nvidia_arch_nvalloc_common_inc_rmgspseq_h__
=20
-/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-mo=
dules/tree/535.54.03 */
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-mo=
dules/tree/535.113.01 */
=20
 /*
  * SPDX-FileCopyrightText: Copyright (c) 2019-2020 NVIDIA CORPORATION & AF=
FILIATES. All rights reserved.
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generate=
d/g_allclasses.h b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/g=
enerated/g_allclasses.h
similarity index 97%
rename from drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generated=
/g_allclasses.h
rename to drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/generated/=
g_allclasses.h
index b17520135233..3144e9beac61 100644
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generated/g_all=
classes.h
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/generated/g_al=
lclasses.h
@@ -1,7 +1,7 @@
 #ifndef __src_nvidia_generated_g_allclasses_h__
 #define __src_nvidia_generated_g_allclasses_h__
=20
-/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-mo=
dules/tree/535.54.03 */
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-mo=
dules/tree/535.113.01 */
=20
 /*
  * SPDX-FileCopyrightText: Copyright (c) 2021-2021 NVIDIA CORPORATION & AF=
FILIATES. All rights reserved.
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generate=
d/g_chipset_nvoc.h b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia=
/generated/g_chipset_nvoc.h
similarity index 98%
rename from drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generated=
/g_chipset_nvoc.h
rename to drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/generated/=
g_chipset_nvoc.h
index 94e79e14cba7..6b8921138c7d 100644
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generated/g_chi=
pset_nvoc.h
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/generated/g_ch=
ipset_nvoc.h
@@ -1,7 +1,7 @@
 #ifndef __src_nvidia_generated_g_chipset_nvoc_h__
 #define __src_nvidia_generated_g_chipset_nvoc_h__
=20
-/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-mo=
dules/tree/535.54.03 */
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-mo=
dules/tree/535.113.01 */
=20
 /*
  * SPDX-FileCopyrightText: Copyright (c) 1993-2022 NVIDIA CORPORATION & AF=
FILIATES. All rights reserved.
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generate=
d/g_fbsr_nvoc.h b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/ge=
nerated/g_fbsr_nvoc.h
similarity index 97%
rename from drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generated=
/g_fbsr_nvoc.h
rename to drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/generated/=
g_fbsr_nvoc.h
index 00198b7ecd23..a5128f00225b 100644
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generated/g_fbs=
r_nvoc.h
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/generated/g_fb=
sr_nvoc.h
@@ -1,7 +1,7 @@
 #ifndef __src_nvidia_generated_g_fbsr_nvoc_h__
 #define __src_nvidia_generated_g_fbsr_nvoc_h__
=20
-/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-mo=
dules/tree/535.54.03 */
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-mo=
dules/tree/535.113.01 */
=20
 /*
  * SPDX-FileCopyrightText: Copyright (c) 2009-2021 NVIDIA CORPORATION & AF=
FILIATES. All rights reserved.
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generate=
d/g_gpu_nvoc.h b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/gen=
erated/g_gpu_nvoc.h
similarity index 97%
rename from drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generated=
/g_gpu_nvoc.h
rename to drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/generated/=
g_gpu_nvoc.h
index 7194a8f02909..5641a21cacca 100644
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generated/g_gpu=
_nvoc.h
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/generated/g_gp=
u_nvoc.h
@@ -1,7 +1,7 @@
 #ifndef __src_nvidia_generated_g_gpu_nvoc_h__
 #define __src_nvidia_generated_g_gpu_nvoc_h__
=20
-/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-mo=
dules/tree/535.54.03 */
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-mo=
dules/tree/535.113.01 */
=20
 /*
  * SPDX-FileCopyrightText: Copyright (c) 2004-2023 NVIDIA CORPORATION & AF=
FILIATES. All rights reserved.
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generate=
d/g_kernel_channel_nvoc.h b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01=
/nvidia/generated/g_kernel_channel_nvoc.h
similarity index 98%
rename from drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generated=
/g_kernel_channel_nvoc.h
rename to drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/generated/=
g_kernel_channel_nvoc.h
index c87503317d8f..b5ad55f854dc 100644
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generated/g_ker=
nel_channel_nvoc.h
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/generated/g_ke=
rnel_channel_nvoc.h
@@ -1,7 +1,7 @@
 #ifndef __src_nvidia_generated_g_kernel_channel_nvoc_h__
 #define __src_nvidia_generated_g_kernel_channel_nvoc_h__
=20
-/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-mo=
dules/tree/535.54.03 */
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-mo=
dules/tree/535.113.01 */
=20
 /*
  * SPDX-FileCopyrightText: Copyright (c) 2020-2023 NVIDIA CORPORATION & AF=
FILIATES. All rights reserved.
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generate=
d/g_kernel_fifo_nvoc.h b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nv=
idia/generated/g_kernel_fifo_nvoc.h
similarity index 99%
rename from drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generated=
/g_kernel_fifo_nvoc.h
rename to drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/generated/=
g_kernel_fifo_nvoc.h
index dd706d126ce6..946954ac5b3d 100644
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generated/g_ker=
nel_fifo_nvoc.h
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/generated/g_ke=
rnel_fifo_nvoc.h
@@ -1,7 +1,7 @@
 #ifndef __src_nvidia_generated_g_kernel_fifo_nvoc_h__
 #define __src_nvidia_generated_g_kernel_fifo_nvoc_h__
=20
-/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-mo=
dules/tree/535.54.03 */
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-mo=
dules/tree/535.113.01 */
=20
 /*
  * SPDX-FileCopyrightText: Copyright (c) 2021-2023 NVIDIA CORPORATION & AF=
FILIATES. All rights reserved.
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generate=
d/g_mem_desc_nvoc.h b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidi=
a/generated/g_mem_desc_nvoc.h
similarity index 97%
rename from drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generated=
/g_mem_desc_nvoc.h
rename to drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/generated/=
g_mem_desc_nvoc.h
index dff4bd362772..daabaee41c87 100644
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generated/g_mem=
_desc_nvoc.h
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/generated/g_me=
m_desc_nvoc.h
@@ -1,7 +1,7 @@
 #ifndef __src_nvidia_generated_g_mem_desc_nvoc_h__
 #define __src_nvidia_generated_g_mem_desc_nvoc_h__
=20
-/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-mo=
dules/tree/535.54.03 */
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-mo=
dules/tree/535.113.01 */
=20
 /*
  * SPDX-FileCopyrightText: Copyright (c) 1993-2023 NVIDIA CORPORATION & AF=
FILIATES. All rights reserved.
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generate=
d/g_os_nvoc.h b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/gene=
rated/g_os_nvoc.h
similarity index 98%
rename from drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generated=
/g_os_nvoc.h
rename to drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/generated/=
g_os_nvoc.h
index 639adbd99545..754c6af42f30 100644
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generated/g_os_=
nvoc.h
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/generated/g_os=
_nvoc.h
@@ -1,7 +1,7 @@
 #ifndef __src_nvidia_generated_g_os_nvoc_h__
 #define __src_nvidia_generated_g_os_nvoc_h__
=20
-/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-mo=
dules/tree/535.54.03 */
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-mo=
dules/tree/535.113.01 */
=20
 /*
  * SPDX-FileCopyrightText: Copyright (c) 1993-2023 NVIDIA CORPORATION & AF=
FILIATES. All rights reserved.
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generate=
d/g_rpc-structures.h b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvid=
ia/generated/g_rpc-structures.h
similarity index 95%
rename from drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generated=
/g_rpc-structures.h
rename to drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/generated/=
g_rpc-structures.h
index a0ca9fff3f07..8d925e24faea 100644
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generated/g_rpc=
-structures.h
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/generated/g_rp=
c-structures.h
@@ -1,9 +1,9 @@
 #ifndef __src_nvidia_generated_g_rpc_structures_h__
 #define __src_nvidia_generated_g_rpc_structures_h__
-#include <nvrm/535.54.03/nvidia/generated/g_sdk-structures.h>
-#include <nvrm/535.54.03/nvidia/kernel/inc/vgpu/sdk-structures.h>
+#include <nvrm/535.113.01/nvidia/generated/g_sdk-structures.h>
+#include <nvrm/535.113.01/nvidia/kernel/inc/vgpu/sdk-structures.h>
=20
-/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-mo=
dules/tree/535.54.03 */
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-mo=
dules/tree/535.113.01 */
=20
 /*
  * SPDX-FileCopyrightText: Copyright (c) 2008-2022 NVIDIA CORPORATION & AF=
FILIATES. All rights reserved.
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generate=
d/g_sdk-structures.h b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvid=
ia/generated/g_sdk-structures.h
similarity index 94%
rename from drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generated=
/g_sdk-structures.h
rename to drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/generated/=
g_sdk-structures.h
index fe2d9062a4c4..e9fed4140468 100644
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generated/g_sdk=
-structures.h
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/generated/g_sd=
k-structures.h
@@ -1,8 +1,8 @@
 #ifndef __src_nvidia_generated_g_sdk_structures_h__
 #define __src_nvidia_generated_g_sdk_structures_h__
-#include <nvrm/535.54.03/nvidia/kernel/inc/vgpu/rpc_headers.h>
+#include <nvrm/535.113.01/nvidia/kernel/inc/vgpu/rpc_headers.h>
=20
-/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-mo=
dules/tree/535.54.03 */
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-mo=
dules/tree/535.113.01 */
=20
 /*
  * SPDX-FileCopyrightText: Copyright (c) 2008-2022 NVIDIA CORPORATION & AF=
FILIATES. All rights reserved.
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/inc/kern=
el/gpu/gpu_acpi_data.h b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nv=
idia/inc/kernel/gpu/gpu_acpi_data.h
similarity index 95%
rename from drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/inc/kerne=
l/gpu/gpu_acpi_data.h
rename to drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/inc/kernel=
/gpu/gpu_acpi_data.h
index 11f822f875d5..af50b11ec3b4 100644
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/inc/kernel/gpu/=
gpu_acpi_data.h
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/inc/kernel/gpu=
/gpu_acpi_data.h
@@ -1,8 +1,8 @@
 #ifndef __src_nvidia_inc_kernel_gpu_gpu_acpi_data_h__
 #define __src_nvidia_inc_kernel_gpu_gpu_acpi_data_h__
-#include <nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl0073/ctrl0073syste=
m.h>
+#include <nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl0073/ctrl0073syst=
em.h>
=20
-/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-mo=
dules/tree/535.54.03 */
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-mo=
dules/tree/535.113.01 */
=20
 /*
  * SPDX-FileCopyrightText: Copyright (c) 2022 NVIDIA CORPORATION & AFFILIA=
TES. All rights reserved.
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/inc/kern=
el/gpu/gpu_engine_type.h b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/=
nvidia/inc/kernel/gpu/gpu_engine_type.h
similarity index 99%
rename from drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/inc/kerne=
l/gpu/gpu_engine_type.h
rename to drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/inc/kernel=
/gpu/gpu_engine_type.h
index 90cd9f6c4d9a..e3160c60036d 100644
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/inc/kernel/gpu/=
gpu_engine_type.h
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/inc/kernel/gpu=
/gpu_engine_type.h
@@ -1,7 +1,7 @@
 #ifndef __src_nvidia_inc_kernel_gpu_gpu_engine_type_h__
 #define __src_nvidia_inc_kernel_gpu_gpu_engine_type_h__
=20
-/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-mo=
dules/tree/535.54.03 */
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-mo=
dules/tree/535.113.01 */
=20
 /*
  * SPDX-FileCopyrightText: Copyright (c) 2021-2022 NVIDIA CORPORATION & AF=
FILIATES. All rights reserved.
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/inc/kern=
el/gpu/gsp/gsp_fw_heap.h b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/=
nvidia/inc/kernel/gpu/gsp/gsp_fw_heap.h
similarity index 97%
rename from drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/inc/kerne=
l/gpu/gsp/gsp_fw_heap.h
rename to drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/inc/kernel=
/gpu/gsp/gsp_fw_heap.h
index 1169ff62160f..3abec59f0cc4 100644
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/inc/kernel/gpu/=
gsp/gsp_fw_heap.h
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/inc/kernel/gpu=
/gsp/gsp_fw_heap.h
@@ -1,7 +1,7 @@
 #ifndef __src_nvidia_inc_kernel_gpu_gsp_gsp_fw_heap_h__
 #define __src_nvidia_inc_kernel_gpu_gsp_gsp_fw_heap_h__
=20
-/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-mo=
dules/tree/535.54.03 */
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-mo=
dules/tree/535.113.01 */
=20
 /*
  * SPDX-FileCopyrightText: Copyright (c) 2022-2023 NVIDIA CORPORATION & AF=
FILIATES. All rights reserved.
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/inc/kern=
el/gpu/gsp/gsp_init_args.h b/drivers/gpu/drm/nouveau/include/nvrm/535.113.0=
1/nvidia/inc/kernel/gpu/gsp/gsp_init_args.h
similarity index 98%
rename from drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/inc/kerne=
l/gpu/gsp/gsp_init_args.h
rename to drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/inc/kernel=
/gpu/gsp/gsp_init_args.h
index cacd46f3208c..4033a6f85a76 100644
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/inc/kernel/gpu/=
gsp/gsp_init_args.h
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/inc/kernel/gpu=
/gsp/gsp_init_args.h
@@ -1,7 +1,7 @@
 #ifndef __src_nvidia_inc_kernel_gpu_gsp_gsp_init_args_h__
 #define __src_nvidia_inc_kernel_gpu_gsp_gsp_init_args_h__
=20
-/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-mo=
dules/tree/535.54.03 */
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-mo=
dules/tree/535.113.01 */
=20
 /*
  * SPDX-FileCopyrightText: Copyright (c) 2020-2022 NVIDIA CORPORATION & AF=
FILIATES. All rights reserved.
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/inc/kern=
el/gpu/gsp/gsp_static_config.h b/drivers/gpu/drm/nouveau/include/nvrm/535.1=
13.01/nvidia/inc/kernel/gpu/gsp/gsp_static_config.h
similarity index 86%
rename from drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/inc/kerne=
l/gpu/gsp/gsp_static_config.h
rename to drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/inc/kernel=
/gpu/gsp/gsp_static_config.h
index 3f99cab47a13..eeab25a5e290 100644
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/inc/kernel/gpu/=
gsp/gsp_static_config.h
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/inc/kernel/gpu=
/gsp/gsp_static_config.h
@@ -1,18 +1,18 @@
 #ifndef __src_nvidia_inc_kernel_gpu_gsp_gsp_static_config_h__
 #define __src_nvidia_inc_kernel_gpu_gsp_gsp_static_config_h__
-#include <nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl0080/ctrl0080gpu.h=
>
-#include <nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl0080/ctrl0080gr.h>
-#include <nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080bios.=
h>
-#include <nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080fb.h>
-#include <nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080gpu.h=
>
-#include <nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080gr.h>
-#include <nvrm/535.54.03/nvidia/generated/g_chipset_nvoc.h>
-#include <nvrm/535.54.03/nvidia/generated/g_gpu_nvoc.h>
-#include <nvrm/535.54.03/nvidia/inc/kernel/gpu/gpu_acpi_data.h>
-#include <nvrm/535.54.03/nvidia/inc/kernel/gpu/nvbitmask.h>
-#include <nvrm/535.54.03/nvidia/kernel/inc/vgpu/rpc_headers.h>
-
-/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-mo=
dules/tree/535.54.03 */
+#include <nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl0080/ctrl0080gpu.=
h>
+#include <nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl0080/ctrl0080gr.h=
>
+#include <nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080bios=
.h>
+#include <nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080fb.h=
>
+#include <nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080gpu.=
h>
+#include <nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080gr.h=
>
+#include <nvrm/535.113.01/nvidia/generated/g_chipset_nvoc.h>
+#include <nvrm/535.113.01/nvidia/generated/g_gpu_nvoc.h>
+#include <nvrm/535.113.01/nvidia/inc/kernel/gpu/gpu_acpi_data.h>
+#include <nvrm/535.113.01/nvidia/inc/kernel/gpu/nvbitmask.h>
+#include <nvrm/535.113.01/nvidia/kernel/inc/vgpu/rpc_headers.h>
+
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-mo=
dules/tree/535.113.01 */
=20
 /*
  * SPDX-FileCopyrightText: Copyright (c) 2019-2023 NVIDIA CORPORATION & AF=
FILIATES. All rights reserved.
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/inc/kern=
el/gpu/intr/engine_idx.h b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/=
nvidia/inc/kernel/gpu/intr/engine_idx.h
similarity index 98%
rename from drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/inc/kerne=
l/gpu/intr/engine_idx.h
rename to drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/inc/kernel=
/gpu/intr/engine_idx.h
index cca520f61818..bd5e01f9814b 100644
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/inc/kernel/gpu/=
intr/engine_idx.h
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/inc/kernel/gpu=
/intr/engine_idx.h
@@ -1,7 +1,7 @@
 #ifndef __src_nvidia_inc_kernel_gpu_intr_engine_idx_h__
 #define __src_nvidia_inc_kernel_gpu_intr_engine_idx_h__
=20
-/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-mo=
dules/tree/535.54.03 */
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-mo=
dules/tree/535.113.01 */
=20
 /*
  * SPDX-FileCopyrightText: Copyright (c) 1993-2023 NVIDIA CORPORATION & AF=
FILIATES. All rights reserved.
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/inc/kern=
el/gpu/nvbitmask.h b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia=
/inc/kernel/gpu/nvbitmask.h
similarity index 93%
rename from drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/inc/kerne=
l/gpu/nvbitmask.h
rename to drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/inc/kernel=
/gpu/nvbitmask.h
index 16168294e524..366447a368bf 100644
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/inc/kernel/gpu/=
nvbitmask.h
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/inc/kernel/gpu=
/nvbitmask.h
@@ -1,8 +1,8 @@
 #ifndef __src_nvidia_inc_kernel_gpu_nvbitmask_h__
 #define __src_nvidia_inc_kernel_gpu_nvbitmask_h__
-#include <nvrm/535.54.03/nvidia/inc/kernel/gpu/gpu_engine_type.h>
+#include <nvrm/535.113.01/nvidia/inc/kernel/gpu/gpu_engine_type.h>
=20
-/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-mo=
dules/tree/535.54.03 */
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-mo=
dules/tree/535.113.01 */
=20
 /*
  * SPDX-FileCopyrightText: Copyright (c) 2021-2022 NVIDIA CORPORATION & AF=
FILIATES. All rights reserved.
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/inc/kern=
el/os/nv_memory_type.h b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nv=
idia/inc/kernel/os/nv_memory_type.h
similarity index 97%
rename from drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/inc/kerne=
l/os/nv_memory_type.h
rename to drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/inc/kernel=
/os/nv_memory_type.h
index c8f046bb630f..4a850dad4776 100644
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/inc/kernel/os/n=
v_memory_type.h
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/inc/kernel/os/=
nv_memory_type.h
@@ -1,7 +1,7 @@
 #ifndef __src_nvidia_inc_kernel_os_nv_memory_type_h__
 #define __src_nvidia_inc_kernel_os_nv_memory_type_h__
=20
-/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-mo=
dules/tree/535.54.03 */
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-mo=
dules/tree/535.113.01 */
=20
 /*
  * SPDX-FileCopyrightText: Copyright (c) 2020 NVIDIA CORPORATION & AFFILIA=
TES. All rights reserved.
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/kernel/i=
nc/vgpu/rpc_global_enums.h b/drivers/gpu/drm/nouveau/include/nvrm/535.113.0=
1/nvidia/kernel/inc/vgpu/rpc_global_enums.h
similarity index 99%
rename from drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/kernel/in=
c/vgpu/rpc_global_enums.h
rename to drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/kernel/inc=
/vgpu/rpc_global_enums.h
index 5b7ffd56084b..73c57f235f6a 100644
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/kernel/inc/vgpu=
/rpc_global_enums.h
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/kernel/inc/vgp=
u/rpc_global_enums.h
@@ -1,7 +1,7 @@
 #ifndef __src_nvidia_kernel_inc_vgpu_rpc_global_enums_h__
 #define __src_nvidia_kernel_inc_vgpu_rpc_global_enums_h__
=20
-/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-mo=
dules/tree/535.54.03 */
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-mo=
dules/tree/535.113.01 */
=20
 #ifndef X
 #    define X(UNIT, RPC) NV_VGPU_MSG_FUNCTION_##RPC,
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/kernel/i=
nc/vgpu/rpc_headers.h b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvi=
dia/kernel/inc/vgpu/rpc_headers.h
similarity index 98%
rename from drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/kernel/in=
c/vgpu/rpc_headers.h
rename to drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/kernel/inc=
/vgpu/rpc_headers.h
index 07143060a9f5..f14b23852456 100644
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/kernel/inc/vgpu=
/rpc_headers.h
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/kernel/inc/vgp=
u/rpc_headers.h
@@ -1,7 +1,7 @@
 #ifndef __src_nvidia_kernel_inc_vgpu_rpc_headers_h__
 #define __src_nvidia_kernel_inc_vgpu_rpc_headers_h__
=20
-/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-mo=
dules/tree/535.54.03 */
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-mo=
dules/tree/535.113.01 */
=20
 /*
  * SPDX-FileCopyrightText: Copyright (c) 2017-2022 NVIDIA CORPORATION & AF=
FILIATES. All rights reserved.
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/kernel/i=
nc/vgpu/sdk-structures.h b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/=
nvidia/kernel/inc/vgpu/sdk-structures.h
similarity index 97%
rename from drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/kernel/in=
c/vgpu/sdk-structures.h
rename to drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/kernel/inc=
/vgpu/sdk-structures.h
index 2dc692ec9352..7801af232dff 100644
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/kernel/inc/vgpu=
/sdk-structures.h
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/kernel/inc/vgp=
u/sdk-structures.h
@@ -1,7 +1,7 @@
 #ifndef __src_nvidia_kernel_inc_vgpu_sdk_structures_h__
 #define __src_nvidia_kernel_inc_vgpu_sdk_structures_h__
=20
-/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-mo=
dules/tree/535.54.03 */
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-mo=
dules/tree/535.113.01 */
=20
 /*
  * SPDX-FileCopyrightText: Copyright (c) 2020-2022 NVIDIA CORPORATION & AF=
FILIATES. All rights reserved.
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/ce/r535.c b/drivers/gpu/dr=
m/nouveau/nvkm/engine/ce/r535.c
index 0c6f921d31c3..bd0d435dbbd3 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/ce/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/ce/r535.c
@@ -26,8 +26,8 @@
 #include <engine/fifo.h>
=20
 #include <nvrm/nvtypes.h>
-#include <nvrm/535.54.03/common/sdk/nvidia/inc/class/cl2080_notification.h=
>
-#include <nvrm/535.54.03/common/sdk/nvidia/inc/class/clc0b5sw.h>
+#include <nvrm/535.113.01/common/sdk/nvidia/inc/class/cl2080_notification.=
h>
+#include <nvrm/535.113.01/common/sdk/nvidia/inc/class/clc0b5sw.h>
=20
 struct r535_ce_obj {
 =09struct nvkm_object object;
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c b/drivers/gpu/=
drm/nouveau/nvkm/engine/disp/r535.c
index 6c54c473bb6d..298035070b3a 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c
@@ -37,16 +37,16 @@
 #include <nvhw/drf.h>
=20
 #include <nvrm/nvtypes.h>
-#include <nvrm/535.54.03/common/sdk/nvidia/inc/class/cl2080_notification.h=
>
-#include <nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl0073/ctrl0073dfp.h=
>
-#include <nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl0073/ctrl0073dp.h>
-#include <nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl0073/ctrl0073speci=
fic.h>
-#include <nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl0073/ctrl0073syste=
m.h>
-#include <nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080inter=
nal.h>
-#include <nvrm/535.54.03/common/sdk/nvidia/inc/nvos.h>
-#include <nvrm/535.54.03/nvidia/generated/g_allclasses.h>
-#include <nvrm/535.54.03/nvidia/generated/g_mem_desc_nvoc.h>
-#include <nvrm/535.54.03/nvidia/inc/kernel/os/nv_memory_type.h>
+#include <nvrm/535.113.01/common/sdk/nvidia/inc/class/cl2080_notification.=
h>
+#include <nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl0073/ctrl0073dfp.=
h>
+#include <nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl0073/ctrl0073dp.h=
>
+#include <nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl0073/ctrl0073spec=
ific.h>
+#include <nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl0073/ctrl0073syst=
em.h>
+#include <nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080inte=
rnal.h>
+#include <nvrm/535.113.01/common/sdk/nvidia/inc/nvos.h>
+#include <nvrm/535.113.01/nvidia/generated/g_allclasses.h>
+#include <nvrm/535.113.01/nvidia/generated/g_mem_desc_nvoc.h>
+#include <nvrm/535.113.01/nvidia/inc/kernel/os/nv_memory_type.h>
=20
 #include <linux/acpi.h>
=20
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c b/drivers/gpu/=
drm/nouveau/nvkm/engine/fifo/r535.c
index 14a67cf96204..b374d72fd1c1 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c
@@ -34,16 +34,16 @@
 #include <nvhw/drf.h>
=20
 #include <nvrm/nvtypes.h>
-#include <nvrm/535.54.03/common/sdk/nvidia/inc/alloc/alloc_channel.h>
-#include <nvrm/535.54.03/common/sdk/nvidia/inc/class/cl2080_notification.h=
>
-#include <nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080ce.h>
-#include <nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080fifo.=
h>
-#include <nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080gpu.h=
>
-#include <nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080inter=
nal.h>
-#include <nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrla06f/ctrla06fgpfif=
o.h>
-#include <nvrm/535.54.03/nvidia/generated/g_kernel_channel_nvoc.h>
-#include <nvrm/535.54.03/nvidia/generated/g_kernel_fifo_nvoc.h>
-#include <nvrm/535.54.03/nvidia/inc/kernel/gpu/gpu_engine_type.h>
+#include <nvrm/535.113.01/common/sdk/nvidia/inc/alloc/alloc_channel.h>
+#include <nvrm/535.113.01/common/sdk/nvidia/inc/class/cl2080_notification.=
h>
+#include <nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080ce.h=
>
+#include <nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080fifo=
.h>
+#include <nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080gpu.=
h>
+#include <nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080inte=
rnal.h>
+#include <nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrla06f/ctrla06fgpfi=
fo.h>
+#include <nvrm/535.113.01/nvidia/generated/g_kernel_channel_nvoc.h>
+#include <nvrm/535.113.01/nvidia/generated/g_kernel_fifo_nvoc.h>
+#include <nvrm/535.113.01/nvidia/inc/kernel/gpu/gpu_engine_type.h>
=20
 static u32
 r535_chan_doorbell_handle(struct nvkm_chan *chan)
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/r535.c b/drivers/gpu/dr=
m/nouveau/nvkm/engine/gr/r535.c
index a7501b52137c..f4bed3eb1ec2 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/r535.c
@@ -31,11 +31,11 @@
 #include <nvhw/drf.h>
=20
 #include <nvrm/nvtypes.h>
-#include <nvrm/535.54.03/common/sdk/nvidia/inc/alloc/alloc_channel.h>
-#include <nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl0080/ctrl0080fifo.=
h>
-#include <nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080gpu.h=
>
-#include <nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080inter=
nal.h>
-#include <nvrm/535.54.03/nvidia/generated/g_kernel_channel_nvoc.h>
+#include <nvrm/535.113.01/common/sdk/nvidia/inc/alloc/alloc_channel.h>
+#include <nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl0080/ctrl0080fifo=
.h>
+#include <nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080gpu.=
h>
+#include <nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080inte=
rnal.h>
+#include <nvrm/535.113.01/nvidia/generated/g_kernel_channel_nvoc.h>
=20
 #define r535_gr(p) container_of((p), struct r535_gr, base)
=20
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/nvdec/r535.c b/drivers/gpu=
/drm/nouveau/nvkm/engine/nvdec/r535.c
index fd6c35e01510..75a24f3e6617 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/nvdec/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/nvdec/r535.c
@@ -26,7 +26,7 @@
 #include <engine/fifo.h>
=20
 #include <nvrm/nvtypes.h>
-#include <nvrm/535.54.03/common/sdk/nvidia/inc/nvos.h>
+#include <nvrm/535.113.01/common/sdk/nvidia/inc/nvos.h>
=20
 struct r535_nvdec_obj {
 =09struct nvkm_object object;
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/nvenc/r535.c b/drivers/gpu=
/drm/nouveau/nvkm/engine/nvenc/r535.c
index 8449b41c72db..c8a2a9196ce5 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/nvenc/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/nvenc/r535.c
@@ -26,7 +26,7 @@
 #include <engine/fifo.h>
=20
 #include <nvrm/nvtypes.h>
-#include <nvrm/535.54.03/common/sdk/nvidia/inc/nvos.h>
+#include <nvrm/535.113.01/common/sdk/nvidia/inc/nvos.h>
=20
 struct r535_nvenc_obj {
 =09struct nvkm_object object;
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/nvjpg/r535.c b/drivers/gpu=
/drm/nouveau/nvkm/engine/nvjpg/r535.c
index a054bff98f96..1babddc4eb80 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/nvjpg/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/nvjpg/r535.c
@@ -26,7 +26,7 @@
 #include <engine/fifo.h>
=20
 #include <nvrm/nvtypes.h>
-#include <nvrm/535.54.03/common/sdk/nvidia/inc/nvos.h>
+#include <nvrm/535.113.01/common/sdk/nvidia/inc/nvos.h>
=20
 struct r535_nvjpg_obj {
 =09struct nvkm_object object;
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/ofa/r535.c b/drivers/gpu/d=
rm/nouveau/nvkm/engine/ofa/r535.c
index b34d6d0a6913..438dc692eefe 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/ofa/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/ofa/r535.c
@@ -27,7 +27,7 @@
 #include <engine/fifo.h>
=20
 #include <nvrm/nvtypes.h>
-#include <nvrm/535.54.03/common/sdk/nvidia/inc/nvos.h>
+#include <nvrm/535.113.01/common/sdk/nvidia/inc/nvos.h>
=20
 struct r535_ofa_obj {
 =09struct nvkm_object object;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bar/r535.c b/drivers/gpu/d=
rm/nouveau/nvkm/subdev/bar/r535.c
index 461fb8daf596..4135690326f4 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/bar/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bar/r535.c
@@ -28,9 +28,9 @@
 #include <subdev/mmu/vmm.h>
=20
 #include <nvrm/nvtypes.h>
-#include <nvrm/535.54.03/nvidia/generated/g_rpc-structures.h>
-#include <nvrm/535.54.03/nvidia/kernel/inc/vgpu/rpc_global_enums.h>
-#include <nvrm/535.54.03/nvidia/kernel/inc/vgpu/rpc_headers.h>
+#include <nvrm/535.113.01/nvidia/generated/g_rpc-structures.h>
+#include <nvrm/535.113.01/nvidia/kernel/inc/vgpu/rpc_global_enums.h>
+#include <nvrm/535.113.01/nvidia/kernel/inc/vgpu/rpc_headers.h>
=20
 static void
 r535_bar_flush(struct nvkm_bar *bar)
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c b/drivers/gpu/=
drm/nouveau/nvkm/subdev/gsp/ad102.c
index 0ca6c397de96..c849c6299c52 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c
@@ -22,7 +22,7 @@
 #include "priv.h"
=20
 static const struct nvkm_gsp_func
-ad102_gsp_r535_54_03 =3D {
+ad102_gsp_r535_113_01 =3D {
 =09.flcn =3D &ga102_gsp_flcn,
 =09.fwsec =3D &ga102_gsp_fwsec,
=20
@@ -45,7 +45,7 @@ ad102_gsp_r535_54_03 =3D {
=20
 static struct nvkm_gsp_fwif
 ad102_gsps[] =3D {
-=09{ 0, r535_gsp_load, &ad102_gsp_r535_54_03, "535.54.03", true },
+=09{ 0, r535_gsp_load, &ad102_gsp_r535_113_01, "535.113.01", true },
 =09{}
 };
=20
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c b/drivers/gpu/=
drm/nouveau/nvkm/subdev/gsp/ga100.c
index 8a2c7347f64e..223f68b532ef 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c
@@ -39,7 +39,7 @@ ga100_gsp_flcn =3D {
 };
=20
 static const struct nvkm_gsp_func
-ga100_gsp_r535_54_03 =3D {
+ga100_gsp_r535_113_01 =3D {
 =09.flcn =3D &ga100_gsp_flcn,
 =09.fwsec =3D &tu102_gsp_fwsec,
=20
@@ -61,7 +61,7 @@ ga100_gsp_r535_54_03 =3D {
=20
 static struct nvkm_gsp_fwif
 ga100_gsps[] =3D {
-=09{  0,  r535_gsp_load, &ga100_gsp_r535_54_03, "535.54.03" },
+=09{  0,  r535_gsp_load, &ga100_gsp_r535_113_01, "535.113.01" },
 =09{ -1, gv100_gsp_nofw, &gv100_gsp },
 =09{}
 };
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c b/drivers/gpu/=
drm/nouveau/nvkm/subdev/gsp/ga102.c
index 1c41e77d607f..4c4b4168a266 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c
@@ -150,7 +150,7 @@ ga102_gsp_flcn =3D {
 };
=20
 static const struct nvkm_gsp_func
-ga102_gsp_r535_54_03 =3D {
+ga102_gsp_r535_113_01 =3D {
 =09.flcn =3D &ga102_gsp_flcn,
 =09.fwsec =3D &ga102_gsp_fwsec,
=20
@@ -178,7 +178,7 @@ ga102_gsp =3D {
=20
 static struct nvkm_gsp_fwif
 ga102_gsps[] =3D {
-=09{  0,  r535_gsp_load, &ga102_gsp_r535_54_03, "535.54.03" },
+=09{  0,  r535_gsp_load, &ga102_gsp_r535_113_01, "535.113.01" },
 =09{ -1, gv100_gsp_nofw, &ga102_gsp },
 =09{}
 };
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/d=
rm/nouveau/nvkm/subdev/gsp/r535.c
index c24693f265e8..47138d797748 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -30,37 +30,46 @@
 #include <nvfw/fw.h>
=20
 #include <nvrm/nvtypes.h>
-#include <nvrm/535.54.03/common/sdk/nvidia/inc/class/cl0000.h>
-#include <nvrm/535.54.03/common/sdk/nvidia/inc/class/cl0005.h>
-#include <nvrm/535.54.03/common/sdk/nvidia/inc/class/cl0080.h>
-#include <nvrm/535.54.03/common/sdk/nvidia/inc/class/cl2080.h>
-#include <nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080event=
.h>
-#include <nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080gpu.h=
>
-#include <nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080inter=
nal.h>
-#include <nvrm/535.54.03/common/sdk/nvidia/inc/nvos.h>
-#include <nvrm/535.54.03/common/shared/msgq/inc/msgq/msgq_priv.h>
-#include <nvrm/535.54.03/common/uproc/os/common/include/libos_init_args.h>
-#include <nvrm/535.54.03/nvidia/arch/nvalloc/common/inc/gsp/gsp_fw_sr_meta=
.h>
-#include <nvrm/535.54.03/nvidia/arch/nvalloc/common/inc/gsp/gsp_fw_wpr_met=
a.h>
-#include <nvrm/535.54.03/nvidia/arch/nvalloc/common/inc/rmRiscvUcode.h>
-#include <nvrm/535.54.03/nvidia/arch/nvalloc/common/inc/rmgspseq.h>
-#include <nvrm/535.54.03/nvidia/generated/g_allclasses.h>
-#include <nvrm/535.54.03/nvidia/generated/g_os_nvoc.h>
-#include <nvrm/535.54.03/nvidia/generated/g_rpc-structures.h>
-#include <nvrm/535.54.03/nvidia/inc/kernel/gpu/gsp/gsp_fw_heap.h>
-#include <nvrm/535.54.03/nvidia/inc/kernel/gpu/gsp/gsp_init_args.h>
-#include <nvrm/535.54.03/nvidia/inc/kernel/gpu/gsp/gsp_static_config.h>
-#include <nvrm/535.54.03/nvidia/inc/kernel/gpu/intr/engine_idx.h>
-#include <nvrm/535.54.03/nvidia/kernel/inc/vgpu/rpc_global_enums.h>
+#include <nvrm/535.113.01/common/sdk/nvidia/inc/class/cl0000.h>
+#include <nvrm/535.113.01/common/sdk/nvidia/inc/class/cl0005.h>
+#include <nvrm/535.113.01/common/sdk/nvidia/inc/class/cl0080.h>
+#include <nvrm/535.113.01/common/sdk/nvidia/inc/class/cl2080.h>
+#include <nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080even=
t.h>
+#include <nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080gpu.=
h>
+#include <nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080inte=
rnal.h>
+#include <nvrm/535.113.01/common/sdk/nvidia/inc/nvos.h>
+#include <nvrm/535.113.01/common/shared/msgq/inc/msgq/msgq_priv.h>
+#include <nvrm/535.113.01/common/uproc/os/common/include/libos_init_args.h=
>
+#include <nvrm/535.113.01/nvidia/arch/nvalloc/common/inc/gsp/gsp_fw_sr_met=
a.h>
+#include <nvrm/535.113.01/nvidia/arch/nvalloc/common/inc/gsp/gsp_fw_wpr_me=
ta.h>
+#include <nvrm/535.113.01/nvidia/arch/nvalloc/common/inc/rmRiscvUcode.h>
+#include <nvrm/535.113.01/nvidia/arch/nvalloc/common/inc/rmgspseq.h>
+#include <nvrm/535.113.01/nvidia/generated/g_allclasses.h>
+#include <nvrm/535.113.01/nvidia/generated/g_os_nvoc.h>
+#include <nvrm/535.113.01/nvidia/generated/g_rpc-structures.h>
+#include <nvrm/535.113.01/nvidia/inc/kernel/gpu/gsp/gsp_fw_heap.h>
+#include <nvrm/535.113.01/nvidia/inc/kernel/gpu/gsp/gsp_init_args.h>
+#include <nvrm/535.113.01/nvidia/inc/kernel/gpu/gsp/gsp_static_config.h>
+#include <nvrm/535.113.01/nvidia/inc/kernel/gpu/intr/engine_idx.h>
+#include <nvrm/535.113.01/nvidia/kernel/inc/vgpu/rpc_global_enums.h>
=20
 #include <linux/acpi.h>
=20
+#define GSP_MSG_MIN_SIZE GSP_PAGE_SIZE
+#define GSP_MSG_MAX_SIZE GSP_PAGE_MIN_SIZE * 16
+
 struct r535_gsp_msg {
+=09u8 auth_tag_buffer[16];
+=09u8 aad_buffer[16];
 =09u32 checksum;
 =09u32 sequence;
+=09u32 elem_count;
+=09u32 pad;
 =09u8  data[];
 };
=20
+#define GSP_MSG_HDR_SIZE offsetof(struct r535_gsp_msg, data)
+
 static void *
 r535_gsp_msgq_wait(struct nvkm_gsp *gsp, u32 repc, u32 *prepc, int *ptime)
 {
@@ -70,7 +79,7 @@ r535_gsp_msgq_wait(struct nvkm_gsp *gsp, u32 repc, u32 *p=
repc, int *ptime)
 =09u8 *msg;
 =09u32 len;
=20
-=09size =3D DIV_ROUND_UP(sizeof(*mqe) + repc, GSP_PAGE_SIZE);
+=09size =3D DIV_ROUND_UP(GSP_MSG_HDR_SIZE + repc, GSP_PAGE_SIZE);
 =09if (WARN_ON(!size || size >=3D gsp->msgq.cnt))
 =09=09return ERR_PTR(-EINVAL);
=20
@@ -135,20 +144,25 @@ r535_gsp_cmdq_push(struct nvkm_gsp *gsp, void *argv)
 =09struct r535_gsp_msg *cqe;
 =09u32 argc =3D cmd->checksum;
 =09u64 *ptr =3D (void *)cmd;
-=09u64 *end =3D (void *)cmd->data + argc;
+=09u64 *end;
 =09u64 csum =3D 0;
 =09int free, time =3D 1000000;
 =09u32 wptr, size;
 =09u32 off =3D 0;
=20
+=09argc =3D ALIGN(GSP_MSG_HDR_SIZE + argc, GSP_PAGE_SIZE);
+
+=09end =3D (u64 *)((char *)ptr + argc);
+=09cmd->pad =3D 0;
 =09cmd->checksum =3D 0;
 =09cmd->sequence =3D gsp->cmdq.seq++;
+=09cmd->elem_count =3D DIV_ROUND_UP(argc, 0x1000);
+
 =09while (ptr < end)
 =09=09csum ^=3D *ptr++;
=20
 =09cmd->checksum =3D upper_32_bits(csum) ^ lower_32_bits(csum);
=20
-=09argc =3D sizeof(*cmd) + argc;
 =09wptr =3D *gsp->cmdq.wptr;
 =09do {
 =09=09do {
@@ -193,8 +207,10 @@ static void *
 r535_gsp_cmdq_get(struct nvkm_gsp *gsp, u32 argc)
 {
 =09struct r535_gsp_msg *cmd;
+=09u32 size =3D GSP_MSG_HDR_SIZE + argc;
=20
-=09cmd =3D kvzalloc(sizeof(*cmd) + argc, GFP_KERNEL);
+=09size =3D ALIGN(size, GSP_MSG_MIN_SIZE);
+=09cmd =3D kvzalloc(size, GFP_KERNEL);
 =09if (!cmd)
 =09=09return ERR_PTR(-ENOMEM);
=20
@@ -2168,10 +2184,10 @@ r535_gsp_load(struct nvkm_gsp *gsp, int ver, const =
struct nvkm_gsp_fwif *fwif)
 }
=20
 #define NVKM_GSP_FIRMWARE(chip)                                  \
-MODULE_FIRMWARE("nvidia/"#chip"/gsp/booter_load-535.54.03.bin");   \
-MODULE_FIRMWARE("nvidia/"#chip"/gsp/booter_unload-535.54.03.bin"); \
-MODULE_FIRMWARE("nvidia/"#chip"/gsp/bootloader-535.54.03.bin");    \
-MODULE_FIRMWARE("nvidia/"#chip"/gsp/gsp-535.54.03.bin")
+MODULE_FIRMWARE("nvidia/"#chip"/gsp/booter_load-535.113.01.bin");   \
+MODULE_FIRMWARE("nvidia/"#chip"/gsp/booter_unload-535.113.01.bin"); \
+MODULE_FIRMWARE("nvidia/"#chip"/gsp/bootloader-535.113.01.bin");    \
+MODULE_FIRMWARE("nvidia/"#chip"/gsp/gsp-535.113.01.bin")
=20
 NVKM_GSP_FIRMWARE(tu102);
 NVKM_GSP_FIRMWARE(tu104);
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c b/drivers/gpu/=
drm/nouveau/nvkm/subdev/gsp/tu102.c
index 999150aa6721..59c5f2b9172a 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c
@@ -163,7 +163,7 @@ tu102_gsp_flcn =3D {
 };
=20
 static const struct nvkm_gsp_func
-tu102_gsp_r535_54_03 =3D {
+tu102_gsp_r535_113_01 =3D {
 =09.flcn =3D &tu102_gsp_flcn,
 =09.fwsec =3D &tu102_gsp_fwsec,
=20
@@ -185,7 +185,7 @@ tu102_gsp_r535_54_03 =3D {
=20
 static struct nvkm_gsp_fwif
 tu102_gsps[] =3D {
-=09{  0,  r535_gsp_load, &tu102_gsp_r535_54_03, "535.54.03" },
+=09{  0,  r535_gsp_load, &tu102_gsp_r535_113_01, "535.113.01" },
 =09{ -1, gv100_gsp_nofw, &gv100_gsp },
 =09{}
 };
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu116.c b/drivers/gpu/=
drm/nouveau/nvkm/subdev/gsp/tu116.c
index e9f0605abbfd..04fbd9ed28b1 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu116.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu116.c
@@ -22,7 +22,7 @@
 #include "priv.h"
=20
 static const struct nvkm_gsp_func
-tu116_gsp_r535_54_03 =3D {
+tu116_gsp_r535_113_01 =3D {
 =09.flcn =3D &tu102_gsp_flcn,
 =09.fwsec =3D &tu102_gsp_fwsec,
=20
@@ -44,7 +44,7 @@ tu116_gsp_r535_54_03 =3D {
=20
 static struct nvkm_gsp_fwif
 tu116_gsps[] =3D {
-=09{  0,  r535_gsp_load, &tu116_gsp_r535_54_03, "535.54.03" },
+=09{  0,  r535_gsp_load, &tu116_gsp_r535_113_01, "535.113.01" },
 =09{ -1, gv100_gsp_nofw, &gv100_gsp },
 =09{}
 };
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/r535.c b/drivers/g=
pu/drm/nouveau/nvkm/subdev/instmem/r535.c
index fc6e54e436d0..5f3c9c02a4c0 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/r535.c
@@ -26,12 +26,12 @@
 #include <nvhw/drf.h>
=20
 #include <nvrm/nvtypes.h>
-#include <nvrm/535.54.03/common/sdk/nvidia/inc/class/cl84a0.h>
-#include <nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080inter=
nal.h>
-#include <nvrm/535.54.03/common/sdk/nvidia/inc/nvos.h>
-#include <nvrm/535.54.03/nvidia/generated/g_fbsr_nvoc.h>
-#include <nvrm/535.54.03/nvidia/generated/g_rpc-structures.h>
-#include <nvrm/535.54.03/nvidia/kernel/inc/vgpu/rpc_global_enums.h>
+#include <nvrm/535.113.01/common/sdk/nvidia/inc/class/cl84a0.h>
+#include <nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080inte=
rnal.h>
+#include <nvrm/535.113.01/common/sdk/nvidia/inc/nvos.h>
+#include <nvrm/535.113.01/nvidia/generated/g_fbsr_nvoc.h>
+#include <nvrm/535.113.01/nvidia/generated/g_rpc-structures.h>
+#include <nvrm/535.113.01/nvidia/kernel/inc/vgpu/rpc_global_enums.h>
=20
 struct fbsr_item {
 =09const char *type;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/r535.c b/drivers/gpu/d=
rm/nouveau/nvkm/subdev/mmu/r535.c
index 9cdea8842923..d3e95453f25d 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/r535.c
@@ -22,9 +22,9 @@
 #include "vmm.h"
=20
 #include <nvrm/nvtypes.h>
-#include <nvrm/535.54.03/common/sdk/nvidia/inc/class/cl90f1.h>
-#include <nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl90f1.h>
-#include <nvrm/535.54.03/common/sdk/nvidia/inc/nvos.h>
+#include <nvrm/535.113.01/common/sdk/nvidia/inc/class/cl90f1.h>
+#include <nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl90f1.h>
+#include <nvrm/535.113.01/common/sdk/nvidia/inc/nvos.h>
=20
 static int
 r535_mmu_promote_vmm(struct nvkm_vmm *vmm)
--=20
2.41.0

