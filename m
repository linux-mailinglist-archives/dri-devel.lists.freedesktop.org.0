Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72FA2688C7C
	for <lists+dri-devel@lfdr.de>; Fri,  3 Feb 2023 02:27:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A23810E6E5;
	Fri,  3 Feb 2023 01:26:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AADDF10E6E5
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Feb 2023 01:26:57 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 13DF6B8289F;
 Fri,  3 Feb 2023 01:26:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABA63C433D2;
 Fri,  3 Feb 2023 01:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675387614;
 bh=BeDxNw/tbCXEvqvBC4QZZK3yzQcUhswiYl5f9/R3DnU=;
 h=Date:From:To:Cc:Subject:From;
 b=fgjB/OX/yNDmVt8S9/mAB1WYIfH8CuP9RCrtSbH3soSX4Kuz2IJ9bbMmLxxNalu4S
 DtdEgK36CFsj58PLna91BETx2B5TO4eJ6od4DJC2r5cxMQJ9G8DUEjjHtSSU1CpVql
 /FfRN8XVncaUoqHOYNJss3kfPAFP8RXEXHFkNf2oRwyi0YspICLPJhFn8m97hr6fgH
 Nb+48MtQKRxTRrU+SVb1M4GBqfClIq+UNBWj9YFpj7fQ03W0CM60Rp3/1OsmiQUuT2
 Ar03yAWEbnWMNlnm3HgiY2Sz2HD1ImFMxOtKe1O1PZPiNVdaco9hTp0/Kr3ot4sloI
 dWPogeww9QBXQ==
Date: Thu, 2 Feb 2023 19:27:10 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Zack Rusin <zackr@vmware.com>,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH][next] drm/vmwgfx: Replace one-element array with
 flexible-array member
Message-ID: <Y9xi7nFWRV3S9gCg@work>
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
Cc: linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

One-element arrays are deprecated, and we are replacing them with flexible
array members instead. So, replace one-element array with flexible-array
member in struct vmw_view.

This helps with the ongoing efforts to tighten the FORTIFY_SOURCE
routines on memcpy() and help us make progress towards globally
enabling -fstrict-flex-arrays=3 [1].

This results in no differences in binary output.

Link: https://github.com/KSPP/linux/issues/79
Link: https://github.com/KSPP/linux/issues/254
Link: https://gcc.gnu.org/pipermail/gcc-patches/2022-October/602902.html [1]
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_so.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_so.c b/drivers/gpu/drm/vmwgfx/vmwgfx_so.c
index 4ea32b01efc0..0f696ccaddc6 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_so.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_so.c
@@ -70,7 +70,7 @@ struct vmw_view {
 	unsigned view_id;              /* Immutable */
 	u32 cmd_size;                  /* Immutable */
 	bool committed;                /* Protected by binding_mutex */
-	u32 cmd[1];                    /* Immutable */
+	u32 cmd[];		       /* Immutable */
 };
 
 static int vmw_view_create(struct vmw_resource *res);
-- 
2.34.1

