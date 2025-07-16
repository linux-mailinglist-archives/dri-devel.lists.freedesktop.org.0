Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1820B0766A
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 14:56:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C0B110E6AC;
	Wed, 16 Jul 2025 12:56:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="XoEVx3gX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4939910E6AC
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jul 2025 12:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=qp
 Y2tXiGnHNxTZTvdSzkjoCg54zO4OlGJ2IYtvRcdfk=; b=XoEVx3gXhw40Dt9AgC
 HfIIgDMIC4T+UWsiFoWhH7I1TTF6vdKFNV/hDc8m3z0p2K3GIz0gxm1dYkF5ze+/
 390RXrGTS72qSty98fNYhZ4qzniqMMtMK1rhl10bB4PJF6GR1lqqYDfXK1DOeVB+
 VtDxJHNaqvRb7LIEyKkv2sk1k=
Received: from ProDesk.. (unknown [])
 by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id
 _____wDnz4VkoXdox0oSFQ--.65528S2; 
 Wed, 16 Jul 2025 20:56:09 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: dmitry.baryshkov@oss.qualcomm.com
Cc: simona@ffwll.ch, sfr@canb.auug.org.au, airlied@gmail.com,
 jernej.skrabec@gmail.com, jonas@kwiboo.se,
 Laurent.pinchart@ideasonboard.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, neil.armstrong@linaro.org, rfoss@kernel.org,
 tzimmermann@suse.de, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Andy Yan <andyshrk@163.com>
Subject: [PATCH] drm/bridge: Describe the newly introduced drm_connector
 parameter for drm_bridge_detect
Date: Wed, 16 Jul 2025 20:55:55 +0800
Message-ID: <20250716125602.3166573-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDnz4VkoXdox0oSFQ--.65528S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrur17Ww4UJFW8GFW3AFW3GFg_yoWDuwc_uF
 nYq34UJws0kr98Kr17AFWfZ342kw18uFZayr1kK39xtrsxAr18Ja42qry3Xr1xAFy8AFy7
 J3WUGF47Ar1IkjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRKAwIDUUUUU==
X-Originating-IP: [103.29.142.67]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbBkAWMXmh3ljHbzwABsq
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

This fix the make htmldocs warnings:
drivers/gpu/drm/drm_bridge.c:1242: warning: Function parameter or struct
member 'connector' not described in 'drm_bridge_detect'

Fixes: 5d156a9c3d5e ("drm/bridge: Pass down connector to drm bridge detect hook")
Signed-off-by: Andy Yan <andyshrk@163.com>
---

 drivers/gpu/drm/drm_bridge.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index dd45d9b504d8..4bde00083047 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -1227,6 +1227,7 @@ EXPORT_SYMBOL(drm_atomic_bridge_chain_check);
 /**
  * drm_bridge_detect - check if anything is attached to the bridge output
  * @bridge: bridge control structure
+ * @connector: attached connector
  *
  * If the bridge supports output detection, as reported by the
  * DRM_BRIDGE_OP_DETECT bridge ops flag, call &drm_bridge_funcs.detect for the
-- 
2.43.0

base-commit: b5e5ea72502e635ae10c33dd877c918c880f7bf0
branch: drm-misc-next

