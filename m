Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F2B4E6F99
	for <lists+dri-devel@lfdr.de>; Fri, 25 Mar 2022 09:49:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0CCC10E1F8;
	Fri, 25 Mar 2022 08:49:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nksmu.kylinos.cn (mailgw.kylinos.cn [123.150.8.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 166C010E0A5;
 Fri, 25 Mar 2022 01:20:33 +0000 (UTC)
X-UUID: f2e9e587d0b344779316483ce14ebf00-20220324
X-Spam-Fingerprint: 0
X-GW-Reason: 11101
X-Policy-Incident: 5pS25Lu25Lq66LaF6L+HNeS6uumcgOimgeWuoeaguA==
X-Content-Feature: ica/max.line-size 74 audit/email.address 1 meta/cnt.alert 1
X-UUID: f2e9e587d0b344779316483ce14ebf00-20220324
Received: from cs2c.com.cn [(172.17.111.24)] by nksmu.kylinos.cn
 (envelope-from <liucong2@kylinos.cn>) (Generic MTA)
 with ESMTP id 1781606887; Thu, 24 Mar 2022 18:49:12 +0800
X-ns-mid: postfix-623C4CD5-4726359750
Received: from localhost.localdomain (unknown [172.20.12.219])
 by cs2c.com.cn (NSMail) with ESMTPA id 2B333383C640;
 Thu, 24 Mar 2022 10:49:57 +0000 (UTC)
From: Cong Liu <liucong2@kylinos.cn>
To: airlied@linux.ie, airlied@redhat.com, christian.koenig@amd.com,
 kraxel@redhat.com, robin.murphy@arm.com
Subject: [PATCH v2] drm/qxl: fix qxl can't use in arm64
Date: Thu, 24 Mar 2022 18:49:28 +0800
Message-Id: <20220324104928.2959545-1-liucong2@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <12eba824-ee80-0aac-56ed-e13084c9cae7@amd.com>
References: <12eba824-ee80-0aac-56ed-e13084c9cae7@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 25 Mar 2022 08:49:35 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, ray.huang@amd.com,
 Cong Liu <liucong2@kylinos.cn>, spice-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

qxl use ioremap to map ram_header and rom, in the arm64 implementation,
the device is mapped as DEVICE_nGnRE, it can not support unaligned
access. and qxl is a virtual device, it can be treated more like RAM
than actual MMIO registers. use ioremap_wc() replace it.

Signed-off-by: Cong Liu <liucong2@kylinos.cn>
---
 drivers/gpu/drm/qxl/qxl_kms.c | 4 ++--
 drivers/gpu/drm/qxl/qxl_ttm.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/qxl/qxl_kms.c b/drivers/gpu/drm/qxl/qxl_kms.c
index 4dc5ad13f12c..a054e4a00fe8 100644
--- a/drivers/gpu/drm/qxl/qxl_kms.c
+++ b/drivers/gpu/drm/qxl/qxl_kms.c
@@ -165,7 +165,7 @@ int qxl_device_init(struct qxl_device *qdev,
 		 (int)qdev->surfaceram_size / 1024,
 		 (sb == 4) ? "64bit" : "32bit");
 
-	qdev->rom = ioremap(qdev->rom_base, qdev->rom_size);
+	qdev->rom = ioremap_wc(qdev->rom_base, qdev->rom_size);
 	if (!qdev->rom) {
 		pr_err("Unable to ioremap ROM\n");
 		r = -ENOMEM;
@@ -183,7 +183,7 @@ int qxl_device_init(struct qxl_device *qdev,
 		goto rom_unmap;
 	}
 
-	qdev->ram_header = ioremap(qdev->vram_base +
+	qdev->ram_header = ioremap_wc(qdev->vram_base +
 				   qdev->rom->ram_header_offset,
 				   sizeof(*qdev->ram_header));
 	if (!qdev->ram_header) {
diff --git a/drivers/gpu/drm/qxl/qxl_ttm.c b/drivers/gpu/drm/qxl/qxl_ttm.c
index b2e33d5ba5d0..95df5750f47f 100644
--- a/drivers/gpu/drm/qxl/qxl_ttm.c
+++ b/drivers/gpu/drm/qxl/qxl_ttm.c
@@ -82,13 +82,13 @@ int qxl_ttm_io_mem_reserve(struct ttm_device *bdev,
 	case TTM_PL_VRAM:
 		mem->bus.is_iomem = true;
 		mem->bus.offset = (mem->start << PAGE_SHIFT) + qdev->vram_base;
-		mem->bus.caching = ttm_cached;
+		mem->bus.caching = ttm_write_combined;
 		break;
 	case TTM_PL_PRIV:
 		mem->bus.is_iomem = true;
 		mem->bus.offset = (mem->start << PAGE_SHIFT) +
 			qdev->surfaceram_base;
-		mem->bus.caching = ttm_cached;
+		mem->bus.caching = ttm_write_combined;
 		break;
 	default:
 		return -EINVAL;
-- 
2.25.1

