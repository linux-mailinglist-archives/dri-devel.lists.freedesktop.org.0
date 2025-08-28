Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4AC5B3AC44
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 23:01:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 257DD10EADA;
	Thu, 28 Aug 2025 21:01:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D14510EADD
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 21:01:44 +0000 (UTC)
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-167-8136KvKeMQ2PGwpZWQZYig-1; Thu,
 28 Aug 2025 16:55:27 -0400
X-MC-Unique: 8136KvKeMQ2PGwpZWQZYig-1
X-Mimecast-MFC-AGG-ID: 8136KvKeMQ2PGwpZWQZYig_1756414526
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 7ADA019560BB; Thu, 28 Aug 2025 20:55:26 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.67.32.4])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 2AD5919560AB; Thu, 28 Aug 2025 20:55:23 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org,
	dakr@kernel.org
Subject: [PATCH 2/2] nouveau: Membar before between semaphore writes and the
 interrupt
Date: Fri, 29 Aug 2025 06:55:17 +1000
Message-ID: <20250828205517.1553768-2-airlied@gmail.com>
In-Reply-To: <20250828205517.1553768-1-airlied@gmail.com>
References: <20250828205517.1553768-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: EXyOO2NgulsO4R64ZJQQnw1db2TnJU1lnuzaqHmlVGM_1756414526
X-Mimecast-Originator: gmail.com
Content-Transfer-Encoding: quoted-printable
content-type: text/plain; charset=WINDOWS-1252; x-default=true
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

From: Faith Ekstrand <faith.ekstrand@collabora.com>

This ensures that the memory write and the interrupt are properly
ordered and we won't wake up the kernel before the semaphore write has
hit memory.

Fixes: b1ca384772b6 ("drm/nouveau/gv100-: switch to volta semaphore methods=
")
Cc: stable@vger.kernel.org
Signed-off-by: Faith Ekstrand <faith.ekstrand@collabora.com>
Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/nouveau/gv100_fence.c         |  7 +-
 .../drm/nouveau/include/nvhw/class/clc36f.h   | 85 +++++++++++++++++++
 2 files changed, 91 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/gv100_fence.c b/drivers/gpu/drm/nouvea=
u/gv100_fence.c
index cccdeca72002..317e516c4ec7 100644
--- a/drivers/gpu/drm/nouveau/gv100_fence.c
+++ b/drivers/gpu/drm/nouveau/gv100_fence.c
@@ -18,7 +18,7 @@ gv100_fence_emit32(struct nouveau_channel *chan, u64 virt=
ual, u32 sequence)
 =09struct nvif_push *push =3D &chan->chan.push;
 =09int ret;
=20
-=09ret =3D PUSH_WAIT(push, 8);
+=09ret =3D PUSH_WAIT(push, 13);
 =09if (ret)
 =09=09return ret;
=20
@@ -32,6 +32,11 @@ gv100_fence_emit32(struct nouveau_channel *chan, u64 vir=
tual, u32 sequence)
 =09=09  NVDEF(NVC36F, SEM_EXECUTE, PAYLOAD_SIZE, 32BIT) |
 =09=09  NVDEF(NVC36F, SEM_EXECUTE, RELEASE_TIMESTAMP, DIS));
=20
+=09PUSH_MTHD(push, NVC36F, MEM_OP_A, 0,
+=09=09=09=09MEM_OP_B, 0,
+=09=09=09=09MEM_OP_C, NVDEF(NVC36F, MEM_OP_C, MEMBAR_TYPE, SYS_MEMBAR),
+=09=09=09=09MEM_OP_D, NVDEF(NVC36F, MEM_OP_D, OPERATION, MEMBAR));
+
 =09PUSH_MTHD(push, NVC36F, NON_STALL_INTERRUPT, 0);
=20
 =09PUSH_KICK(push);
diff --git a/drivers/gpu/drm/nouveau/include/nvhw/class/clc36f.h b/drivers/=
gpu/drm/nouveau/include/nvhw/class/clc36f.h
index 8735dda4c8a7..338f74b9f501 100644
--- a/drivers/gpu/drm/nouveau/include/nvhw/class/clc36f.h
+++ b/drivers/gpu/drm/nouveau/include/nvhw/class/clc36f.h
@@ -7,6 +7,91 @@
=20
 #define NVC36F_NON_STALL_INTERRUPT                                 (0x0000=
0020)
 #define NVC36F_NON_STALL_INTERRUPT_HANDLE                                 =
31:0
+// NOTE - MEM_OP_A and MEM_OP_B have been replaced in gp100 with methods f=
or
+// specifying the page address for a targeted TLB invalidate and the uTLB =
for
+// a targeted REPLAY_CANCEL for UVM.
+// The previous MEM_OP_A/B functionality is in MEM_OP_C/D, with slightly
+// rearranged fields.
+#define NVC36F_MEM_OP_A                                            (0x0000=
0028)
+#define NVC36F_MEM_OP_A_TLB_INVALIDATE_CANCEL_TARGET_CLIENT_UNIT_ID       =
 5:0  // only relevant for REPLAY_CANCEL_TARGETED
+#define NVC36F_MEM_OP_A_TLB_INVALIDATE_INVALIDATION_SIZE                  =
 5:0  // Used to specify size of invalidate, used for invalidates which are=
 not of the REPLAY_CANCEL_TARGETED type
+#define NVC36F_MEM_OP_A_TLB_INVALIDATE_CANCEL_TARGET_GPC_ID               =
10:6  // only relevant for REPLAY_CANCEL_TARGETED
+#define NVC36F_MEM_OP_A_TLB_INVALIDATE_CANCEL_MMU_ENGINE_ID               =
 6:0  // only relevant for REPLAY_CANCEL_VA_GLOBAL
+#define NVC36F_MEM_OP_A_TLB_INVALIDATE_SYSMEMBAR                         1=
1:11
+#define NVC36F_MEM_OP_A_TLB_INVALIDATE_SYSMEMBAR_EN                 0x0000=
0001
+#define NVC36F_MEM_OP_A_TLB_INVALIDATE_SYSMEMBAR_DIS                0x0000=
0000
+#define NVC36F_MEM_OP_A_TLB_INVALIDATE_TARGET_ADDR_LO                    3=
1:12
+#define NVC36F_MEM_OP_B                                            (0x0000=
002c)
+#define NVC36F_MEM_OP_B_TLB_INVALIDATE_TARGET_ADDR_HI                     =
31:0
+#define NVC36F_MEM_OP_C                                            (0x0000=
0030)
+#define NVC36F_MEM_OP_C_MEMBAR_TYPE                                       =
 2:0
+#define NVC36F_MEM_OP_C_MEMBAR_TYPE_SYS_MEMBAR                      0x0000=
0000
+#define NVC36F_MEM_OP_C_MEMBAR_TYPE_MEMBAR                          0x0000=
0001
+#define NVC36F_MEM_OP_C_TLB_INVALIDATE_PDB                                =
 0:0
+#define NVC36F_MEM_OP_C_TLB_INVALIDATE_PDB_ONE                      0x0000=
0000
+#define NVC36F_MEM_OP_C_TLB_INVALIDATE_PDB_ALL                      0x0000=
0001  // Probably nonsensical for MMU_TLB_INVALIDATE_TARGETED
+#define NVC36F_MEM_OP_C_TLB_INVALIDATE_GPC                                =
 1:1
+#define NVC36F_MEM_OP_C_TLB_INVALIDATE_GPC_ENABLE                   0x0000=
0000
+#define NVC36F_MEM_OP_C_TLB_INVALIDATE_GPC_DISABLE                  0x0000=
0001
+#define NVC36F_MEM_OP_C_TLB_INVALIDATE_REPLAY                             =
 4:2  // only relevant if GPC ENABLE
+#define NVC36F_MEM_OP_C_TLB_INVALIDATE_REPLAY_NONE                  0x0000=
0000
+#define NVC36F_MEM_OP_C_TLB_INVALIDATE_REPLAY_START                 0x0000=
0001
+#define NVC36F_MEM_OP_C_TLB_INVALIDATE_REPLAY_START_ACK_ALL         0x0000=
0002
+#define NVC36F_MEM_OP_C_TLB_INVALIDATE_REPLAY_CANCEL_TARGETED       0x0000=
0003
+#define NVC36F_MEM_OP_C_TLB_INVALIDATE_REPLAY_CANCEL_GLOBAL         0x0000=
0004
+#define NVC36F_MEM_OP_C_TLB_INVALIDATE_REPLAY_CANCEL_VA_GLOBAL      0x0000=
0005
+#define NVC36F_MEM_OP_C_TLB_INVALIDATE_ACK_TYPE                           =
 6:5  // only relevant if GPC ENABLE
+#define NVC36F_MEM_OP_C_TLB_INVALIDATE_ACK_TYPE_NONE                0x0000=
0000
+#define NVC36F_MEM_OP_C_TLB_INVALIDATE_ACK_TYPE_GLOBALLY            0x0000=
0001
+#define NVC36F_MEM_OP_C_TLB_INVALIDATE_ACK_TYPE_INTRANODE           0x0000=
0002
+#define NVC36F_MEM_OP_C_TLB_INVALIDATE_ACCESS_TYPE                        =
 9:7 //only relevant for REPLAY_CANCEL_VA_GLOBAL
+#define NVC36F_MEM_OP_C_TLB_INVALIDATE_ACCESS_TYPE_VIRT_READ              =
   0
+#define NVC36F_MEM_OP_C_TLB_INVALIDATE_ACCESS_TYPE_VIRT_WRITE             =
   1
+#define NVC36F_MEM_OP_C_TLB_INVALIDATE_ACCESS_TYPE_VIRT_ATOMIC_STRONG     =
   2
+#define NVC36F_MEM_OP_C_TLB_INVALIDATE_ACCESS_TYPE_VIRT_RSVRVD            =
   3
+#define NVC36F_MEM_OP_C_TLB_INVALIDATE_ACCESS_TYPE_VIRT_ATOMIC_WEAK       =
   4
+#define NVC36F_MEM_OP_C_TLB_INVALIDATE_ACCESS_TYPE_VIRT_ATOMIC_ALL        =
   5
+#define NVC36F_MEM_OP_C_TLB_INVALIDATE_ACCESS_TYPE_VIRT_WRITE_AND_ATOMIC  =
   6
+#define NVC36F_MEM_OP_C_TLB_INVALIDATE_ACCESS_TYPE_VIRT_ALL               =
   7
+#define NVC36F_MEM_OP_C_TLB_INVALIDATE_PAGE_TABLE_LEVEL                   =
 9:7  // Invalidate affects this level and all below
+#define NVC36F_MEM_OP_C_TLB_INVALIDATE_PAGE_TABLE_LEVEL_ALL         0x0000=
0000  // Invalidate tlb caches at all levels of the page table
+#define NVC36F_MEM_OP_C_TLB_INVALIDATE_PAGE_TABLE_LEVEL_PTE_ONLY    0x0000=
0001
+#define NVC36F_MEM_OP_C_TLB_INVALIDATE_PAGE_TABLE_LEVEL_UP_TO_PDE0  0x0000=
0002
+#define NVC36F_MEM_OP_C_TLB_INVALIDATE_PAGE_TABLE_LEVEL_UP_TO_PDE1  0x0000=
0003
+#define NVC36F_MEM_OP_C_TLB_INVALIDATE_PAGE_TABLE_LEVEL_UP_TO_PDE2  0x0000=
0004
+#define NVC36F_MEM_OP_C_TLB_INVALIDATE_PAGE_TABLE_LEVEL_UP_TO_PDE3  0x0000=
0005
+#define NVC36F_MEM_OP_C_TLB_INVALIDATE_PAGE_TABLE_LEVEL_UP_TO_PDE4  0x0000=
0006
+#define NVC36F_MEM_OP_C_TLB_INVALIDATE_PAGE_TABLE_LEVEL_UP_TO_PDE5  0x0000=
0007
+#define NVC36F_MEM_OP_C_TLB_INVALIDATE_PDB_APERTURE                       =
   11:10  // only relevant if PDB_ONE
+#define NVC36F_MEM_OP_C_TLB_INVALIDATE_PDB_APERTURE_VID_MEM             0x=
00000000
+#define NVC36F_MEM_OP_C_TLB_INVALIDATE_PDB_APERTURE_SYS_MEM_COHERENT    0x=
00000002
+#define NVC36F_MEM_OP_C_TLB_INVALIDATE_PDB_APERTURE_SYS_MEM_NONCOHERENT 0x=
00000003
+#define NVC36F_MEM_OP_C_TLB_INVALIDATE_PDB_ADDR_LO                       3=
1:12  // only relevant if PDB_ONE
+#define NVC36F_MEM_OP_C_ACCESS_COUNTER_CLR_TARGETED_NOTIFY_TAG            =
19:0
+// MEM_OP_D MUST be preceded by MEM_OPs A-C.
+#define NVC36F_MEM_OP_D                                            (0x0000=
0034)
+#define NVC36F_MEM_OP_D_TLB_INVALIDATE_PDB_ADDR_HI                        =
26:0  // only relevant if PDB_ONE
+#define NVC36F_MEM_OP_D_OPERATION                                        3=
1:27
+#define NVC36F_MEM_OP_D_OPERATION_MEMBAR                            0x0000=
0005
+#define NVC36F_MEM_OP_D_OPERATION_MMU_TLB_INVALIDATE                0x0000=
0009
+#define NVC36F_MEM_OP_D_OPERATION_MMU_TLB_INVALIDATE_TARGETED       0x0000=
000a
+#define NVC36F_MEM_OP_D_OPERATION_L2_PEERMEM_INVALIDATE             0x0000=
000d
+#define NVC36F_MEM_OP_D_OPERATION_L2_SYSMEM_INVALIDATE              0x0000=
000e
+// CLEAN_LINES is an alias for Tegra/GPU IP usage
+#define NVC36F_MEM_OP_B_OPERATION_L2_INVALIDATE_CLEAN_LINES         0x0000=
000e
+#define NVC36F_MEM_OP_D_OPERATION_L2_CLEAN_COMPTAGS                 0x0000=
000f
+#define NVC36F_MEM_OP_D_OPERATION_L2_FLUSH_DIRTY                    0x0000=
0010
+#define NVC36F_MEM_OP_D_OPERATION_L2_WAIT_FOR_SYS_PENDING_READS     0x0000=
0015
+#define NVC36F_MEM_OP_D_OPERATION_ACCESS_COUNTER_CLR                0x0000=
0016
+#define NVC36F_MEM_OP_D_ACCESS_COUNTER_CLR_TYPE                           =
 1:0
+#define NVC36F_MEM_OP_D_ACCESS_COUNTER_CLR_TYPE_MIMC                0x0000=
0000
+#define NVC36F_MEM_OP_D_ACCESS_COUNTER_CLR_TYPE_MOMC                0x0000=
0001
+#define NVC36F_MEM_OP_D_ACCESS_COUNTER_CLR_TYPE_ALL                 0x0000=
0002
+#define NVC36F_MEM_OP_D_ACCESS_COUNTER_CLR_TYPE_TARGETED            0x0000=
0003
+#define NVC36F_MEM_OP_D_ACCESS_COUNTER_CLR_TARGETED_TYPE                  =
 2:2
+#define NVC36F_MEM_OP_D_ACCESS_COUNTER_CLR_TARGETED_TYPE_MIMC       0x0000=
0000
+#define NVC36F_MEM_OP_D_ACCESS_COUNTER_CLR_TARGETED_TYPE_MOMC       0x0000=
0001
+#define NVC36F_MEM_OP_D_ACCESS_COUNTER_CLR_TARGETED_BANK                  =
 6:3
 #define NVC36F_SEM_ADDR_LO                                         (0x0000=
005c)
 #define NVC36F_SEM_ADDR_LO_OFFSET                                         =
31:2
 #define NVC36F_SEM_ADDR_HI                                         (0x0000=
0060)
--=20
2.50.1

