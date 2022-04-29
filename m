Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A67465154E4
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 21:54:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB9BD10EE98;
	Fri, 29 Apr 2022 19:54:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3405610E9D7
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 19:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651262071;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=nORssVNFSPGiam+YA0wQPxcM033zLAladfHr6fH3pgg=;
 b=TFQk2ad/8LVjcadj+gosL7klV469XXFHNyupc3uQtR83Igky6Fo6eslwO44FMRzn88fIpP
 RQiTgGFNuN0Lona45Wszs0m6GrO/7DsGTSIfv+4EIHu+Ur9OFDEKVfWdsLC2x0bt0z/X/V
 wheSVVQ/1bRD892iyJjzn/mpqCyiFqs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-110-hizdAN70OnGH8m37kkElmw-1; Fri, 29 Apr 2022 15:54:26 -0400
X-MC-Unique: hizdAN70OnGH8m37kkElmw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 346B183395E;
 Fri, 29 Apr 2022 19:54:26 +0000 (UTC)
Received: from emerald.lyude.net (unknown [10.22.16.90])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6AF2B2166B4D;
 Fri, 29 Apr 2022 19:54:22 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/nouveau/subdev/bus: Ratelimit logging for fault errors
Date: Fri, 29 Apr 2022 15:53:47 -0400
Message-Id: <20220429195350.85620-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
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
Cc: David Airlie <airlied@linux.ie>, Ben Skeggs <bskeggs@redhat.com>,
 Karol Herbst <kherbst@redhat.com>, open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There's plenty of ways to fudge the GPU when developing on nouveau by
mistake, some of which can result in nouveau seriously spamming dmesg with
fault errors. This can be somewhat annoying, as it can quickly overrun the
message buffer (or your terminal emulator's buffer) and get rid of actually
useful feedback from the driver. While working on my new atomic only MST
branch, I ran into this issue a couple of times.

So, let's fix this by adding nvkm_error_ratelimited(), and using it to
ratelimit errors from faults. This should be fine for developers, since
it's nearly always only the first few faults that we care about seeing.
Plus, you can turn off rate limiting in the kernel if you really need to.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h |  2 ++
 drivers/gpu/drm/nouveau/nvkm/subdev/bus/gf100.c    | 14 +++++++-------
 drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv31.c     |  6 +++---
 drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv50.c     |  6 +++---
 4 files changed, 15 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h b/drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h
index 1665738948fb..96113c8bee8c 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h
@@ -62,4 +62,6 @@ void nvkm_subdev_intr(struct nvkm_subdev *);
 #define nvkm_debug(s,f,a...) nvkm_printk((s), DEBUG,   info, f, ##a)
 #define nvkm_trace(s,f,a...) nvkm_printk((s), TRACE,   info, f, ##a)
 #define nvkm_spam(s,f,a...)  nvkm_printk((s),  SPAM,    dbg, f, ##a)
+
+#define nvkm_error_ratelimited(s,f,a...) nvkm_printk((s), ERROR, err_ratelimited, f, ##a)
 #endif
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bus/gf100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/bus/gf100.c
index 53a6651ac225..80b5aaceeaad 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/bus/gf100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bus/gf100.c
@@ -35,13 +35,13 @@ gf100_bus_intr(struct nvkm_bus *bus)
 		u32 addr = nvkm_rd32(device, 0x009084);
 		u32 data = nvkm_rd32(device, 0x009088);
 
-		nvkm_error(subdev,
-			   "MMIO %s of %08x FAULT at %06x [ %s%s%s]\n",
-			   (addr & 0x00000002) ? "write" : "read", data,
-			   (addr & 0x00fffffc),
-			   (stat & 0x00000002) ? "!ENGINE " : "",
-			   (stat & 0x00000004) ? "PRIVRING " : "",
-			   (stat & 0x00000008) ? "TIMEOUT " : "");
+		nvkm_error_ratelimited(subdev,
+				       "MMIO %s of %08x FAULT at %06x [ %s%s%s]\n",
+				       (addr & 0x00000002) ? "write" : "read", data,
+				       (addr & 0x00fffffc),
+				       (stat & 0x00000002) ? "!ENGINE " : "",
+				       (stat & 0x00000004) ? "PRIVRING " : "",
+				       (stat & 0x00000008) ? "TIMEOUT " : "");
 
 		nvkm_wr32(device, 0x009084, 0x00000000);
 		nvkm_wr32(device, 0x001100, (stat & 0x0000000e));
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv31.c b/drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv31.c
index ad8da523bb22..c75e463f3501 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv31.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv31.c
@@ -45,9 +45,9 @@ nv31_bus_intr(struct nvkm_bus *bus)
 		u32 addr = nvkm_rd32(device, 0x009084);
 		u32 data = nvkm_rd32(device, 0x009088);
 
-		nvkm_error(subdev, "MMIO %s of %08x FAULT at %06x\n",
-			   (addr & 0x00000002) ? "write" : "read", data,
-			   (addr & 0x00fffffc));
+		nvkm_error_ratelimited(subdev, "MMIO %s of %08x FAULT at %06x\n",
+				       (addr & 0x00000002) ? "write" : "read", data,
+				       (addr & 0x00fffffc));
 
 		stat &= ~0x00000008;
 		nvkm_wr32(device, 0x001100, 0x00000008);
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv50.c b/drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv50.c
index 3a1e45adeedc..2055d0b100d3 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv50.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv50.c
@@ -60,9 +60,9 @@ nv50_bus_intr(struct nvkm_bus *bus)
 		u32 addr = nvkm_rd32(device, 0x009084);
 		u32 data = nvkm_rd32(device, 0x009088);
 
-		nvkm_error(subdev, "MMIO %s of %08x FAULT at %06x\n",
-			   (addr & 0x00000002) ? "write" : "read", data,
-			   (addr & 0x00fffffc));
+		nvkm_error_ratelimited(subdev, "MMIO %s of %08x FAULT at %06x\n",
+				       (addr & 0x00000002) ? "write" : "read", data,
+				       (addr & 0x00fffffc));
 
 		stat &= ~0x00000008;
 		nvkm_wr32(device, 0x001100, 0x00000008);
-- 
2.35.1

