Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A16AF2FAE80
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jan 2021 02:54:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B216D6E7E5;
	Tue, 19 Jan 2021 01:54:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BD8A6E7E6
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jan 2021 01:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611021285;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=owShhWubuLDYnuCn88Yhig5n0v7/el9dv8Ir9ddy4ek=;
 b=jEIhjLwDcCvS3JNxpfXa4QOqF4pDAUG8Z/KItF3guDFU7fDDtZ0pTmBvKxj+AhscP9usXL
 kaOiCBi+P3BJqSl/Q7OBnc11JtqgShiQ4o2G0rDZa7b1J1TGRGBjbxostkLoTQ6S4JwQUP
 E6RgPfFYY61SK4mVFaJ5wxgf0PeqRMc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-257-J0pb_dC1MUSdHbeCJf8zdw-1; Mon, 18 Jan 2021 20:54:43 -0500
X-MC-Unique: J0pb_dC1MUSdHbeCJf8zdw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3BC7010054FF;
 Tue, 19 Jan 2021 01:54:42 +0000 (UTC)
Received: from Whitewolf.lyude.net (ovpn-113-206.rdu2.redhat.com
 [10.10.113.206])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CC71A5D9CD;
 Tue, 19 Jan 2021 01:54:38 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org
Subject: [PATCH 3/3] drm/nouveau/kms/nve4-nv138: Fix > 64x64 cursors
Date: Mon, 18 Jan 2021 20:54:14 -0500
Message-Id: <20210119015415.2511028-3-lyude@redhat.com>
In-Reply-To: <20210119015415.2511028-1-lyude@redhat.com>
References: <20210119015415.2511028-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Cc: David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <dri-devel@lists.freedesktop.org>, open list <linux-kernel@vger.kernel.org>,
 stable@vger.kernel.org, Jeremy Cline <jcline@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

While we do handle the additional cursor sizes introduced in NVE4, it looks
like we accidentally broke this when converting over to use Nvidia's
display headers. Since we now use NVVAL in dispnv50/head907d.c in order to
format the value for the cursor layout and NVD9 only had one byte reserved
vs. the 2 bytes reserved in later generations, we end up accidentally
stripping the second bit in the cursor layout format parameter - causing us
to set the wrong cursor size.

This fixes that by adding our own curs_set hook for 917d which uses the
NV917D headers.

Cc: Martin Peres <martin.peres@free.fr>
Cc: Jeremy Cline <jcline@redhat.com>
Cc: Simon Ser <contact@emersion.fr>
Cc: <stable@vger.kernel.org> # v5.9+
Signed-off-by: Lyude Paul <lyude@redhat.com>
Fixes: ed0b86a90bf9 ("drm/nouveau/kms/nv50-: use NVIDIA's headers for core head_curs_set()")
---
 drivers/gpu/drm/nouveau/dispnv50/head917d.c   | 28 ++++++++++++++++++-
 .../drm/nouveau/include/nvhw/class/cl917d.h   |  4 +++
 2 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/head917d.c b/drivers/gpu/drm/nouveau/dispnv50/head917d.c
index a5d827403660..ea9f8667305e 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/head917d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/head917d.c
@@ -22,6 +22,7 @@
 #include "head.h"
 #include "core.h"
 
+#include "nvif/push.h"
 #include <nvif/push507c.h>
 
 #include <nvhw/class/cl917d.h>
@@ -73,6 +74,31 @@ head917d_base(struct nv50_head *head, struct nv50_head_atom *asyh)
 	return 0;
 }
 
+static int
+head917d_curs_set(struct nv50_head *head, struct nv50_head_atom *asyh)
+{
+	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	const int i = head->base.index;
+	int ret;
+
+	ret = PUSH_WAIT(push, 5);
+	if (ret)
+		return ret;
+
+	PUSH_MTHD(push, NV917D, HEAD_SET_CONTROL_CURSOR(i),
+		  NVDEF(NV917D, HEAD_SET_CONTROL_CURSOR, ENABLE, ENABLE) |
+		  NVVAL(NV917D, HEAD_SET_CONTROL_CURSOR, FORMAT, asyh->curs.format) |
+		  NVVAL(NV917D, HEAD_SET_CONTROL_CURSOR, SIZE, asyh->curs.layout) |
+		  NVVAL(NV917D, HEAD_SET_CONTROL_CURSOR, HOT_SPOT_X, 0) |
+		  NVVAL(NV917D, HEAD_SET_CONTROL_CURSOR, HOT_SPOT_Y, 0) |
+		  NVDEF(NV917D, HEAD_SET_CONTROL_CURSOR, COMPOSITION, ALPHA_BLEND),
+
+				HEAD_SET_OFFSET_CURSOR(i), asyh->curs.offset >> 8);
+
+	PUSH_MTHD(push, NV917D, HEAD_SET_CONTEXT_DMA_CURSOR(i), asyh->curs.handle);
+	return 0;
+}
+
 int
 head917d_curs_layout(struct nv50_head *head, struct nv50_wndw_atom *asyw,
 		     struct nv50_head_atom *asyh)
@@ -101,7 +127,7 @@ head917d = {
 	.core_clr = head907d_core_clr,
 	.curs_layout = head917d_curs_layout,
 	.curs_format = head507d_curs_format,
-	.curs_set = head907d_curs_set,
+	.curs_set = head917d_curs_set,
 	.curs_clr = head907d_curs_clr,
 	.base = head917d_base,
 	.ovly = head907d_ovly,
diff --git a/drivers/gpu/drm/nouveau/include/nvhw/class/cl917d.h b/drivers/gpu/drm/nouveau/include/nvhw/class/cl917d.h
index 2a2612d6e1e0..fb223723a38a 100644
--- a/drivers/gpu/drm/nouveau/include/nvhw/class/cl917d.h
+++ b/drivers/gpu/drm/nouveau/include/nvhw/class/cl917d.h
@@ -66,6 +66,10 @@
 #define NV917D_HEAD_SET_CONTROL_CURSOR_COMPOSITION_ALPHA_BLEND                  (0x00000000)
 #define NV917D_HEAD_SET_CONTROL_CURSOR_COMPOSITION_PREMULT_ALPHA_BLEND          (0x00000001)
 #define NV917D_HEAD_SET_CONTROL_CURSOR_COMPOSITION_XOR                          (0x00000002)
+#define NV917D_HEAD_SET_OFFSET_CURSOR(a)                                        (0x00000484 + (a)*0x00000300)
+#define NV917D_HEAD_SET_OFFSET_CURSOR_ORIGIN                                    31:0
+#define NV917D_HEAD_SET_CONTEXT_DMA_CURSOR(a)                                   (0x0000048C + (a)*0x00000300)
+#define NV917D_HEAD_SET_CONTEXT_DMA_CURSOR_HANDLE                               31:0
 #define NV917D_HEAD_SET_DITHER_CONTROL(a)                                       (0x000004A0 + (a)*0x00000300)
 #define NV917D_HEAD_SET_DITHER_CONTROL_ENABLE                                   0:0
 #define NV917D_HEAD_SET_DITHER_CONTROL_ENABLE_DISABLE                           (0x00000000)
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
