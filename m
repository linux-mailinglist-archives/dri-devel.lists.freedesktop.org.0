Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF46D204124
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jun 2020 22:09:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEC616E901;
	Mon, 22 Jun 2020 20:09:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9730E6E8FD
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jun 2020 20:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592856554;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UZYhBvbDDNRy7VCCeT+Z/3+KFjbOGADAaOoqLREGB6A=;
 b=RbmyUuktvhr1x2PKsi4icDgaAfQrLVPOi1BWV+0/+ws1RZqJxlFm6K+DEySZJrnq/Jz3D7
 cAdZg1gw3vBr93IV9uLSPgVCopxx0t2dNAJ7DSMwv7/lKnrVMXU+F/Z2Kel8PVRN/I9JxI
 A9ovSrsUurTmc4wiKTgtsxHr9VDaZrM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-477-i68MNScaNN2_TUS01uOEkw-1; Mon, 22 Jun 2020 16:09:10 -0400
X-MC-Unique: i68MNScaNN2_TUS01uOEkw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4D035109AEA7;
 Mon, 22 Jun 2020 20:08:26 +0000 (UTC)
Received: from Whitewolf.redhat.com (ovpn-117-166.rdu2.redhat.com
 [10.10.117.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 594DF5C662;
 Mon, 22 Jun 2020 20:08:22 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org
Subject: [RFC v5 08/10] drm/nouveau/kms/nv50-: Expose nv50_outp_atom in disp.h
Date: Mon, 22 Jun 2020 16:07:28 -0400
Message-Id: <20200622200730.120716-9-lyude@redhat.com>
In-Reply-To: <20200622200730.120716-1-lyude@redhat.com>
References: <20200622200730.120716-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
Cc: Jani Nikula <jani.nikula@intel.com>, David Airlie <airlied@linux.ie>,
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 James Jones <jajones@nvidia.com>, open list <linux-kernel@vger.kernel.org>,
 Ben Skeggs <bskeggs@redhat.com>, Alex Deucher <alexander.deucher@amd.com>,
 Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In order to make sure that we flush disable updates at the right time
when disabling CRCs, we'll need to be able to look at the outp state to
see if we're changing it at the same time that we're disabling CRCs.

So, expose the struct in disp.h.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c | 18 ------------------
 drivers/gpu/drm/nouveau/dispnv50/disp.h | 14 ++++++++++++++
 2 files changed, 14 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 368069a5b181a..090882794f7d6 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -57,24 +57,6 @@
 
 #include <subdev/bios/dp.h>
 
-/******************************************************************************
- * Atomic state
- *****************************************************************************/
-
-struct nv50_outp_atom {
-	struct list_head head;
-
-	struct drm_encoder *encoder;
-	bool flush_disable;
-
-	union nv50_outp_atom_mask {
-		struct {
-			bool ctrl:1;
-		};
-		u8 mask;
-	} set, clr;
-};
-
 /******************************************************************************
  * EVO channel
  *****************************************************************************/
diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.h b/drivers/gpu/drm/nouveau/dispnv50/disp.h
index 696e70a6b98b6..c7b72fa850995 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.h
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.h
@@ -71,6 +71,20 @@ struct nv50_dmac {
 	struct mutex lock;
 };
 
+struct nv50_outp_atom {
+	struct list_head head;
+
+	struct drm_encoder *encoder;
+	bool flush_disable;
+
+	union nv50_outp_atom_mask {
+		struct {
+			bool ctrl:1;
+		};
+		u8 mask;
+	} set, clr;
+};
+
 int nv50_dmac_create(struct nvif_device *device, struct nvif_object *disp,
 		     const s32 *oclass, u8 head, void *data, u32 size,
 		     u64 syncbuf, struct nv50_dmac *dmac);
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
