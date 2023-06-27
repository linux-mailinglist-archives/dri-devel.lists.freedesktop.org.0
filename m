Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19FEB73FE9A
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jun 2023 16:44:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C0D810E32C;
	Tue, 27 Jun 2023 14:43:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0E6A10E2FC
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jun 2023 14:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inria.fr; s=dc;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uOCXLaXRiomt/H0q8utpd2M3e4T7ehi0Ry85QhvtitQ=;
 b=hZkO1dGIGwuuQTtoKxGsqKTtjf8AmCS3lBjekTBtliF+28pj2YYjyv+d
 pQuTHMXb9pFINDBs+NiWxzAYZfemeDyybBg1ldmHXdGRE64q83ScGKiPN
 G4UR3nYmAPZhzU/eZeV1XKOTnDpIYYn37BXMGwHkzCRcoxCLjOYD+NAh6 c=;
Authentication-Results: mail2-relais-roc.national.inria.fr;
 dkim=none (message not signed) header.i=none;
 spf=SoftFail smtp.mailfrom=Julia.Lawall@inria.fr;
 dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.01,162,1684792800"; d="scan'208";a="114936338"
Received: from i80.paris.inria.fr (HELO i80.paris.inria.fr.) ([128.93.90.48])
 by mail2-relais-roc.national.inria.fr with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2023 16:43:52 +0200
From: Julia Lawall <Julia.Lawall@inria.fr>
To: Oded Gabbay <ogabbay@kernel.org>
Subject: [PATCH v2 15/24] habanalabs: use vmalloc_array and vcalloc
Date: Tue, 27 Jun 2023 16:43:30 +0200
Message-Id: <20230627144339.144478-16-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230627144339.144478-1-Julia.Lawall@inria.fr>
References: <20230627144339.144478-1-Julia.Lawall@inria.fr>
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
Cc: keescook@chromium.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 christophe.jaillet@wanadoo.fr, kuba@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use vmalloc_array and vcalloc to protect against
multiplication overflows.

The changes were done using the following Coccinelle
semantic patch:

// <smpl>
@initialize:ocaml@
@@

let rename alloc =
  match alloc with
    "vmalloc" -> "vmalloc_array"
  | "vzalloc" -> "vcalloc"
  | _ -> failwith "unknown"

@@
    size_t e1,e2;
    constant C1, C2;
    expression E1, E2, COUNT, x1, x2, x3;
    typedef u8;
    typedef __u8;
    type t = {u8,__u8,char,unsigned char};
    identifier alloc = {vmalloc,vzalloc};
    fresh identifier realloc = script:ocaml(alloc) { rename alloc };
@@

(
      alloc(x1*x2*x3)
|
      alloc(C1 * C2)
|
      alloc((sizeof(t)) * (COUNT), ...)
|
-     alloc((e1) * (e2))
+     realloc(e1, e2)
|
-     alloc((e1) * (COUNT))
+     realloc(COUNT, e1)
|
-     alloc((E1) * (E2))
+     realloc(E1, E2)
)
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
v2: Use vmalloc_array and vcalloc instead of array_size.
This also leaves a multiplication of a constant by a sizeof
as is.  Two patches are thus dropped from the series.

 drivers/accel/habanalabs/common/device.c     |    3 ++-
 drivers/accel/habanalabs/common/state_dump.c |    7 ++++---
 2 files changed, 6 insertions(+), 4 deletions(-)

diff -u -p a/drivers/accel/habanalabs/common/device.c b/drivers/accel/habanalabs/common/device.c
--- a/drivers/accel/habanalabs/common/device.c
+++ b/drivers/accel/habanalabs/common/device.c
@@ -2594,7 +2594,8 @@ static void hl_capture_user_mappings(str
 	 */
 	vfree(pgf_info->user_mappings);
 	pgf_info->user_mappings =
-			vzalloc(pgf_info->num_of_user_mappings * sizeof(struct hl_user_mapping));
+			vcalloc(pgf_info->num_of_user_mappings,
+				sizeof(struct hl_user_mapping));
 	if (!pgf_info->user_mappings) {
 		pgf_info->num_of_user_mappings = 0;
 		goto finish;
diff -u -p a/drivers/accel/habanalabs/common/state_dump.c b/drivers/accel/habanalabs/common/state_dump.c
--- a/drivers/accel/habanalabs/common/state_dump.c
+++ b/drivers/accel/habanalabs/common/state_dump.c
@@ -272,7 +272,8 @@ static u32 *hl_state_dump_read_sync_obje
 	base_addr = sds->props[SP_SYNC_OBJ_BASE_ADDR] +
 			sds->props[SP_NEXT_SYNC_OBJ_ADDR] * index;
 
-	sync_objects = vmalloc(sds->props[SP_SYNC_OBJ_AMOUNT] * sizeof(u32));
+	sync_objects = vmalloc_array(sds->props[SP_SYNC_OBJ_AMOUNT],
+				     sizeof(u32));
 	if (!sync_objects)
 		return NULL;
 
@@ -453,8 +454,8 @@ hl_state_dump_alloc_read_sm_block_monito
 	s64 base_addr; /* Base addr can be negative */
 	int i;
 
-	monitors = vmalloc(sds->props[SP_MONITORS_AMOUNT] *
-			   sizeof(struct hl_mon_state_dump));
+	monitors = vmalloc_array(sds->props[SP_MONITORS_AMOUNT],
+				 sizeof(struct hl_mon_state_dump));
 	if (!monitors)
 		return NULL;
 

