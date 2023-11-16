Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6BE57EE679
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 19:12:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE8E710E2B3;
	Thu, 16 Nov 2023 18:11:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C480E10E2B1;
 Thu, 16 Nov 2023 18:11:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id E3AE4CE2150;
 Thu, 16 Nov 2023 18:11:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E2C7C433C9;
 Thu, 16 Nov 2023 18:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1700158307;
 bh=Ry4mQQ1q/vn/j3+Dj1Ms0K/kq2DMCGX9s61dOISwTRo=;
 h=Date:From:To:Cc:Subject:From;
 b=la6R0gS4A9sua9wheZyCxfbRGCUfMXibabY/Ch7ODIveMD52xRHRGABVg9QniPV3L
 /5Z5+C+0ck49xRi+27ggYHvoNZ3Oq4AxSk6SqMgLOYo+Q56/tu7/awDVwGKwQU3SG3
 VEgi/EuHhu7B8nSgTEx7dl4Q7xjz2zJL6LLENK82zgRCCPA5RZYClmRkDBA7TsP1+5
 8LkS2PdipAWqokVc9o8iBKQ3B0Z0al6fKdNvMtOHlA3MylPEzhnCFMQhedTPgQd9Bs
 ka46ygRkuiJqgbpkdHucUNQ2Vj94TTjKwtYlHTz8Wu4/J3Wm9yRZztnQU8cgsHZ9CS
 Jcg/Mtvj3mylA==
Date: Thu, 16 Nov 2023 12:11:43 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@redhat.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH][next] nouveau/gsp: replace zero-length array with flex-array
 member and use __counted_by
Message-ID: <ZVZbX7C5suLMiBf+@work>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: nouveau@lists.freedesktop.org, linux-hardening@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fake flexible arrays (zero-length and one-element arrays) are deprecated,
and should be replaced by flexible-array members. So, replace
zero-length array with a flexible-array member in `struct
PACKED_REGISTRY_TABLE`.

Also annotate array `entries` with `__counted_by()` to prepare for the
coming implementation by GCC and Clang of the `__counted_by` attribute.
Flexible array members annotated with `__counted_by` can have their
accesses bounds-checked at run-time via `CONFIG_UBSAN_BOUNDS` (for array
indexing) and `CONFIG_FORTIFY_SOURCE` (for strcpy/memcpy-family functions).

This fixes multiple -Warray-bounds warnings:
drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:1069:29: warning: array subscript 0 is outside array bounds of 'PACKED_REGISTRY_ENTRY[0]' [-Warray-bounds=]
drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:1070:29: warning: array subscript 0 is outside array bounds of 'PACKED_REGISTRY_ENTRY[0]' [-Warray-bounds=]
drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:1071:29: warning: array subscript 0 is outside array bounds of 'PACKED_REGISTRY_ENTRY[0]' [-Warray-bounds=]
drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:1072:29: warning: array subscript 0 is outside array bounds of 'PACKED_REGISTRY_ENTRY[0]' [-Warray-bounds=]

While there, also make use of the struct_size() helper, and address
checkpatch.pl warning:
WARNING: please, no spaces at the start of a line

This results in no differences in binary output.

Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 .../nvrm/535.113.01/nvidia/generated/g_os_nvoc.h   | 14 +++++++-------
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c     |  2 +-
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/generated/g_os_nvoc.h b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/generated/g_os_nvoc.h
index 754c6af42f30..259b25c2ac6b 100644
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/generated/g_os_nvoc.h
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/generated/g_os_nvoc.h
@@ -28,17 +28,17 @@
 
 typedef struct PACKED_REGISTRY_ENTRY
 {
-    NvU32                   nameOffset;
-    NvU8                    type;
-    NvU32                   data;
-    NvU32                   length;
+	NvU32                   nameOffset;
+	NvU8                    type;
+	NvU32                   data;
+	NvU32                   length;
 } PACKED_REGISTRY_ENTRY;
 
 typedef struct PACKED_REGISTRY_TABLE
 {
-    NvU32                   size;
-    NvU32                   numEntries;
-    PACKED_REGISTRY_ENTRY   entries[0];
+	NvU32                   size;
+	NvU32                   numEntries;
+	PACKED_REGISTRY_ENTRY   entries[] __counted_by(numEntries);
 } PACKED_REGISTRY_TABLE;
 
 #endif
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
index dc44f5c7833f..228335487af5 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -1048,7 +1048,7 @@ r535_gsp_rpc_set_registry(struct nvkm_gsp *gsp)
 	char *strings;
 	int str_offset;
 	int i;
-	size_t rpc_size = sizeof(*rpc) + sizeof(rpc->entries[0]) * NV_GSP_REG_NUM_ENTRIES;
+	size_t rpc_size = struct_size(rpc, entries, NV_GSP_REG_NUM_ENTRIES);
 
 	/* add strings + null terminator */
 	for (i = 0; i < NV_GSP_REG_NUM_ENTRIES; i++)
-- 
2.34.1

