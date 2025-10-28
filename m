Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10DB9C14C16
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 14:06:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22F2510E3DD;
	Tue, 28 Oct 2025 13:06:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 302 seconds by postgrey-1.36 at gabe;
 Tue, 28 Oct 2025 10:11:48 UTC
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F3A110E1A7
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 10:11:47 +0000 (UTC)
X-UUID: ca1cbda2b3e511f0a38c85956e01ac42-20251028
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6, REQID:7e21202b-5fbd-4966-9d7a-2f78413668f8, IP:0,
 UR
 L:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:25
X-CID-META: VersionHash:a9d874c, CLOUDID:2b600168f7e49529e3d19fd91175a3fc,
 BulkI
 D:nil,BulkQuantity:0,Recheck:0,SF:102|850,TC:nil,Content:0|50,EDM:5,IP:nil
 ,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:
 1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: ca1cbda2b3e511f0a38c85956e01ac42-20251028
X-User: liqiang01@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
 (envelope-from <liqiang01@kylinos.cn>)
 (Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
 with ESMTP id 1876996662; Tue, 28 Oct 2025 18:06:36 +0800
From: Li Qiang <liqiang01@kylinos.cn>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Li Qiang <liqiang01@kylinos.cn>
Subject: [PATCH] drm/modeset: Remove redundant __GFP_NOWARN from GFP_NOWAIT
 allocations
Date: Tue, 28 Oct 2025 18:06:32 +0800
Message-Id: <20251028100632.132744-1-liqiang01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 28 Oct 2025 13:06:26 +0000
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

Commit 16f5dfbc851b ("gfp: include __GFP_NOWARN in GFP_NOWAIT") made
GFP_NOWAIT implicitly include __GFP_NOWARN. Therefore, explicit
__GFP_NOWARN combined with GFP_NOWAIT is redundant and can be removed.

Clean up such redundant flag usage in DRM modeset lock debug code.

Signed-off-by: Li Qiang <liqiang01@kylinos.cn>
---
 drivers/gpu/drm/drm_modeset_lock.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_modeset_lock.c b/drivers/gpu/drm/drm_modeset_lock.c
index beb91a13a312..58eac20a8138 100644
--- a/drivers/gpu/drm/drm_modeset_lock.c
+++ b/drivers/gpu/drm/drm_modeset_lock.c
@@ -88,7 +88,7 @@ static noinline depot_stack_handle_t __drm_stack_depot_save(void)
 
 	n = stack_trace_save(entries, ARRAY_SIZE(entries), 1);
 
-	return stack_depot_save(entries, n, GFP_NOWAIT | __GFP_NOWARN);
+	return stack_depot_save(entries, n, GFP_NOWAIT);
 }
 
 static void __drm_stack_depot_print(depot_stack_handle_t stack_depot)
@@ -98,7 +98,7 @@ static void __drm_stack_depot_print(depot_stack_handle_t stack_depot)
 	unsigned int nr_entries;
 	char *buf;
 
-	buf = kmalloc(PAGE_SIZE, GFP_NOWAIT | __GFP_NOWARN);
+	buf = kmalloc(PAGE_SIZE, GFP_NOWAIT);
 	if (!buf)
 		return;
 
-- 
2.25.1

