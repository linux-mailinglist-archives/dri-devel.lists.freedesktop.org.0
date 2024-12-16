Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB34A9F4959
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 11:55:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7895A10E90D;
	Tue, 17 Dec 2024 10:55:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.nfschina.com (unknown [42.101.60.213])
 by gabe.freedesktop.org (Postfix) with SMTP id 3636E10E66F;
 Mon, 16 Dec 2024 12:47:04 +0000 (UTC)
Received: from localhost.localdomain (unknown [103.163.180.3])
 by mail.nfschina.com (MailData Gateway V2.8.8) with ESMTPSA id 297C1602A5E6F; 
 Mon, 16 Dec 2024 20:47:01 +0800 (CST)
X-MD-Sfrom: zhanxin@nfschina.com
X-MD-SrcIP: 103.163.180.3
From: Zhanxin Qi <zhanxin@nfschina.com>
To: kherbst@redhat.com, lyude@redhat.com, dakr@redhat.com, airlied@gmail.com,
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Zhanxin Qi <zhanxin@nfschina.com>, Duanjun Li <duanjun@nfschina.com>
Subject: [PATCH v1 v1] drm/nouveau: Fix memory leak in nvbios_iccsense_parse
Date: Mon, 16 Dec 2024 20:46:52 +0800
Message-Id: <20241216124652.244776-1-zhanxin@nfschina.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <Z1_2sugsla44LgIz@cassiopeiae>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 17 Dec 2024 10:55:20 +0000
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

The nvbios_iccsense_parse function allocates memory for sensor data
but fails to free it when the function exits, leading to a memory
leak. Add proper cleanup to free the allocated memory.

Fixes: 39b7e6e547ff ("drm/nouveau/nvbios/iccsense: add parsing of the SENSE table")

Signed-off-by: Zhanxin Qi <zhanxin@nfschina.com>
Signed-off-by: Duanjun Li <duanjun@nfschina.com>
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 .../include/nvkm/subdev/bios/iccsense.h       |  2 ++
 .../drm/nouveau/nvkm/subdev/bios/iccsense.c   | 20 +++++++++++++++++++
 .../drm/nouveau/nvkm/subdev/iccsense/base.c   |  3 +++
 3 files changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/bios/iccsense.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/bios/iccsense.h
index 4c108fd2c805..8bfc28c3f7a7 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/bios/iccsense.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/bios/iccsense.h
@@ -20,4 +20,6 @@ struct nvbios_iccsense {
 };
 
 int nvbios_iccsense_parse(struct nvkm_bios *, struct nvbios_iccsense *);
+
+void nvbios_iccsense_cleanup(struct nvbios_iccsense *iccsense);
 #endif
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/iccsense.c b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/iccsense.c
index dea444d48f94..38fcc91ffea6 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/iccsense.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/iccsense.c
@@ -56,6 +56,19 @@ nvbios_iccsense_table(struct nvkm_bios *bios, u8 *ver, u8 *hdr, u8 *cnt,
 	return 0;
 }
 
+/**
+ * nvbios_iccsense_parse - Parse ICCSENSE table from VBIOS
+ * @bios: VBIOS base pointer
+ * @iccsense: ICCSENSE table structure to fill
+ *
+ * Parses the ICCSENSE table from VBIOS and fills the provided structure.
+ * The caller must invoke nvbios_iccsense_cleanup() after successful parsing
+ * to free the allocated rail resources.
+ *
+ * Returns:
+ *   0        - Success
+ *   -ENODEV  - Table not found
+ */
 int
 nvbios_iccsense_parse(struct nvkm_bios *bios, struct nvbios_iccsense *iccsense)
 {
@@ -127,3 +140,10 @@ nvbios_iccsense_parse(struct nvkm_bios *bios, struct nvbios_iccsense *iccsense)
 
 	return 0;
 }
+
+void
+nvbios_iccsense_cleanup(struct nvbios_iccsense *iccsense)
+{
+	kfree(iccsense->rail);
+	iccsense->rail = NULL;
+}
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c
index 8f0ccd3664eb..4c1759ecce38 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c
@@ -291,6 +291,9 @@ nvkm_iccsense_oneinit(struct nvkm_subdev *subdev)
 			list_add_tail(&rail->head, &iccsense->rails);
 		}
 	}
+
+	nvbios_iccsense_cleanup(&stbl);
+
 	return 0;
 }
 
-- 
2.30.2

