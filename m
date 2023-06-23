Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E31873C2AF
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 23:22:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9063B10E6BD;
	Fri, 23 Jun 2023 21:22:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FC2210E6BA
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 21:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inria.fr; s=dc;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=42OKv4WqZGQxlnFHmnIuYt+rtnNJuJHuQ6K07YbNUj8=;
 b=GXBNYgmL2uYfs6qFigazu5bHqzJHBpCz8l880MNXwd+9eRslqwZ3OOsI
 Mg6LYxvrebz27/FhrAyaK87WAa+UpTYqEiIKSJflTdI9YiVVutKzyTKHQ
 OMrvn1ry8QKjC8losr/ymVYFeWIWjK52PpQAd1FD2UAhzi/Qrd3wzTeZP s=;
Authentication-Results: mail3-relais-sop.national.inria.fr;
 dkim=none (message not signed) header.i=none;
 spf=SoftFail smtp.mailfrom=Julia.Lawall@inria.fr;
 dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.01,153,1684792800"; d="scan'208";a="59686173"
Received: from i80.paris.inria.fr (HELO i80.paris.inria.fr.) ([128.93.90.48])
 by mail3-relais-sop.national.inria.fr with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2023 23:15:12 +0200
From: Julia Lawall <Julia.Lawall@inria.fr>
To: Oded Gabbay <ogabbay@kernel.org>
Subject: [PATCH 15/26] habanalabs: use array_size
Date: Fri, 23 Jun 2023 23:14:46 +0200
Message-Id: <20230623211457.102544-16-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230623211457.102544-1-Julia.Lawall@inria.fr>
References: <20230623211457.102544-1-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: kernel-janitors@vger.kernel.org, keescook@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use array_size to protect against multiplication overflows.

The changes were done using the following Coccinelle semantic patch:

// <smpl>
@@
    expression E1, E2;
    constant C1, C2;
    identifier alloc = {vmalloc,vzalloc};
@@
    
(
      alloc(C1 * C2,...)
|
      alloc(
-           (E1) * (E2)
+           array_size(E1, E2)
      ,...)
)
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 drivers/accel/habanalabs/common/device.c     |    3 ++-
 drivers/accel/habanalabs/common/state_dump.c |    6 +++---
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/accel/habanalabs/common/device.c b/drivers/accel/habanalabs/common/device.c
index fabfc501ef54..8e2edefa6d3c 100644
--- a/drivers/accel/habanalabs/common/device.c
+++ b/drivers/accel/habanalabs/common/device.c
@@ -2572,7 +2572,8 @@ static void hl_capture_user_mappings(struct hl_device *hdev, bool is_pmmu)
 	 */
 	vfree(pgf_info->user_mappings);
 	pgf_info->user_mappings =
-			vzalloc(pgf_info->num_of_user_mappings * sizeof(struct hl_user_mapping));
+			vzalloc(array_size(pgf_info->num_of_user_mappings,
+					   sizeof(struct hl_user_mapping)));
 	if (!pgf_info->user_mappings) {
 		pgf_info->num_of_user_mappings = 0;
 		goto finish;
diff --git a/drivers/accel/habanalabs/common/state_dump.c b/drivers/accel/habanalabs/common/state_dump.c
index 3a9931f24259..324cb7c9bc26 100644
--- a/drivers/accel/habanalabs/common/state_dump.c
+++ b/drivers/accel/habanalabs/common/state_dump.c
@@ -272,7 +272,7 @@ static u32 *hl_state_dump_read_sync_objects(struct hl_device *hdev, u32 index)
 	base_addr = sds->props[SP_SYNC_OBJ_BASE_ADDR] +
 			sds->props[SP_NEXT_SYNC_OBJ_ADDR] * index;
 
-	sync_objects = vmalloc(sds->props[SP_SYNC_OBJ_AMOUNT] * sizeof(u32));
+	sync_objects = vmalloc(array_size(sds->props[SP_SYNC_OBJ_AMOUNT], sizeof(u32)));
 	if (!sync_objects)
 		return NULL;
 
@@ -453,8 +453,8 @@ hl_state_dump_alloc_read_sm_block_monitors(struct hl_device *hdev, u32 index)
 	s64 base_addr; /* Base addr can be negative */
 	int i;
 
-	monitors = vmalloc(sds->props[SP_MONITORS_AMOUNT] *
-			   sizeof(struct hl_mon_state_dump));
+	monitors = vmalloc(array_size(sds->props[SP_MONITORS_AMOUNT],
+				      sizeof(struct hl_mon_state_dump)));
 	if (!monitors)
 		return NULL;
 

