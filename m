Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 370EC2416B3
	for <lists+dri-devel@lfdr.de>; Tue, 11 Aug 2020 08:59:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 851596E4B0;
	Tue, 11 Aug 2020 06:58:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEBBC89D8E;
 Mon, 10 Aug 2020 12:56:58 +0000 (UTC)
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 40A3B26EEED119206D00;
 Mon, 10 Aug 2020 20:56:55 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.487.0; Mon, 10 Aug 2020 20:56:46 +0800
From: Qinglang Miao <miaoqinglang@huawei.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Subject: [PATCH] drm/amd/display: convert to use le16_add_cpu()
Date: Mon, 10 Aug 2020 20:59:19 +0800
Message-ID: <20200810125919.185312-1-miaoqinglang@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 11 Aug 2020 06:58:41 +0000
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, miaoqinglang@huawei.com,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert cpu_to_le16(le16_to_cpu(E1) + E2) to use le16_add_cpu().

Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>
---
 drivers/gpu/drm/amd/display/dc/bios/command_table.c  | 4 +---
 drivers/gpu/drm/amd/display/dc/bios/command_table2.c | 5 +----
 2 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/bios/command_table.c b/drivers/gpu/drm/amd/display/dc/bios/command_table.c
index 5815983ca..070459e3e 100644
--- a/drivers/gpu/drm/amd/display/dc/bios/command_table.c
+++ b/drivers/gpu/drm/amd/display/dc/bios/command_table.c
@@ -1877,9 +1877,7 @@ static enum bp_result set_crtc_using_dtd_timing_v3(
 			 * but it is 4 either from Edid data (spec CEA 861)
 			 * or CEA timing table.
 			 */
-			params.usV_SyncOffset =
-					cpu_to_le16(le16_to_cpu(params.usV_SyncOffset) + 1);
-
+			le16_add_cpu(&params.usV_SyncOffset, 1);
 		}
 	}
 
diff --git a/drivers/gpu/drm/amd/display/dc/bios/command_table2.c b/drivers/gpu/drm/amd/display/dc/bios/command_table2.c
index bed91572f..e8f52eb8e 100644
--- a/drivers/gpu/drm/amd/display/dc/bios/command_table2.c
+++ b/drivers/gpu/drm/amd/display/dc/bios/command_table2.c
@@ -569,10 +569,7 @@ static enum bp_result set_crtc_using_dtd_timing_v3(
 			 * but it is 4 either from Edid data (spec CEA 861)
 			 * or CEA timing table.
 			 */
-			params.v_syncoffset =
-				cpu_to_le16(le16_to_cpu(params.v_syncoffset) +
-						1);
-
+			le16_add_cpu(&params.v_syncoffset, 1);
 		}
 	}
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
