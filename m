Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 445F78B853D
	for <lists+dri-devel@lfdr.de>; Wed,  1 May 2024 07:13:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76AF710EDDE;
	Wed,  1 May 2024 05:13:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="P4LlReB3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-184.mta1.migadu.com (out-184.mta1.migadu.com
 [95.215.58.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2380910EDDE
 for <dri-devel@lists.freedesktop.org>; Wed,  1 May 2024 05:13:38 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1714540415;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=05WNzqmqLv1QKE4Y/P8AHkj3HrmEQHj1mc/aw/CiANo=;
 b=P4LlReB3hNgroqsQTv26mFyfidd8iGuH/1AmYn2a2a+9/AAjaNSHIv/1eduVEhv/qT0Mu1
 CmWzSBBOMzrQUlXyqtVDQ5eRxj2xmPevcqmh4supYL87m1NFulRvWkIt6O04idgr4BDPuV
 o+itTgVj/XYKtPLs0TlKOIi3TnzUFOU=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Doug Anderson <dianders@chromium.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Sui Jingfeng <sui.jingfeng@linux.dev>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2] drm/debugfs: Drop conditionals around of_node pointers
Date: Wed,  1 May 2024 13:13:23 +0800
Message-Id: <20240501051323.805076-1-sui.jingfeng@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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

Having conditional around the of_node pointer of the drm_bridge structure
is not necessary anymore, since drm_bridge structure always has the of_node
member since the commit d8dfccde2709 ("drm/bridge: Drop conditionals around
of_node pointers").

So drop the conditional, please also note that this patch is following the
convention used by driver core, see commit c9e358dfc4a8 ("driver-core:
remove conditionals around devicetree pointers").

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
---
v2: Update commit message
---
 drivers/gpu/drm/drm_debugfs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index 08fcefd804bc..28a471fe4bc8 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -597,10 +597,10 @@ static int bridges_show(struct seq_file *m, void *data)
 		drm_printf(&p, "\ttype: [%d] %s\n",
 			   bridge->type,
 			   drm_get_connector_type_name(bridge->type));
-#ifdef CONFIG_OF
+
 		if (bridge->of_node)
 			drm_printf(&p, "\tOF: %pOFfc\n", bridge->of_node);
-#endif
+
 		drm_printf(&p, "\tops: [0x%x]", bridge->ops);
 		if (bridge->ops & DRM_BRIDGE_OP_DETECT)
 			drm_puts(&p, " detect");
-- 
2.34.1

