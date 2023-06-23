Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2951173C2AE
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 23:22:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5C3810E6C2;
	Fri, 23 Jun 2023 21:22:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34B1110E6BA
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 21:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inria.fr; s=dc;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jammjAxbCgbnRHLqhi6UIftAryvqKnOHjwdJrbKzjag=;
 b=Z47OQtnPiaEB5oaBB+oz82Qsg6BtHw8YihUVIhQDCMR+I0tQpbbrpJXq
 nj5C0YQSxjWsFlY9SUmJShUU8xGXEqdHAlNbU+0vzr8txprHO2a1l78O0
 vJXXUrP7E3H3oTBJf1CDCM1QC0nZjMpj3m7aYP6mcSPVWR15IxWF2hFkG o=;
Authentication-Results: mail3-relais-sop.national.inria.fr;
 dkim=none (message not signed) header.i=none;
 spf=SoftFail smtp.mailfrom=Julia.Lawall@inria.fr;
 dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.01,153,1684792800"; d="scan'208";a="59686178"
Received: from i80.paris.inria.fr (HELO i80.paris.inria.fr.) ([128.93.90.48])
 by mail3-relais-sop.national.inria.fr with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2023 23:15:13 +0200
From: Julia Lawall <Julia.Lawall@inria.fr>
To: Zack Rusin <zackr@vmware.com>
Subject: [PATCH 20/26] drm/vmwgfx: use array_size
Date: Fri, 23 Jun 2023 23:14:51 +0200
Message-Id: <20230623211457.102544-21-Julia.Lawall@inria.fr>
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
Cc: keescook@chromium.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use array_size to protect against multiplication overflows.

The changes were done using the following Coccinelle semantic patch:

// <smpl>
@@
    size_t e1,e2;
    expression COUNT;
    identifier alloc = {vmalloc,vzalloc,kvmalloc,kvzalloc};
@@

(
      alloc(
-           (e1) * (e2)
+           array_size(e1, e2)
      ,...)
|
      alloc(
-           (e1) * (COUNT)
+           array_size(COUNT, e1)
      ,...)
)
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 drivers/gpu/drm/vmwgfx/vmwgfx_devcaps.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_devcaps.c b/drivers/gpu/drm/vmwgfx/vmwgfx_devcaps.c
index 829df395c2ed..c72fc8111a11 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_devcaps.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_devcaps.c
@@ -88,7 +88,7 @@ int vmw_devcaps_create(struct vmw_private *vmw)
 	uint32_t i;
 
 	if (gb_objects) {
-		vmw->devcaps = vzalloc(sizeof(uint32_t) * SVGA3D_DEVCAP_MAX);
+		vmw->devcaps = vzalloc(array_size(SVGA3D_DEVCAP_MAX, sizeof(uint32_t)));
 		if (!vmw->devcaps)
 			return -ENOMEM;
 		for (i = 0; i < SVGA3D_DEVCAP_MAX; ++i) {

