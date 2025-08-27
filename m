Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F223B385EA
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 17:13:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1E4610E849;
	Wed, 27 Aug 2025 15:13:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nxo6kY9s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 395B510E84B
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 15:13:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 211C544B2C;
 Wed, 27 Aug 2025 15:13:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5BC9C4CEEB;
 Wed, 27 Aug 2025 15:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756307588;
 bh=YR/gYRTUbGVsPcXt+qNXfBhGUDKi5WInCy3Qs5bL5Cw=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=nxo6kY9scmEYDx7Cu2pXPuIwgx4qmT1gxiMlpW4N7VpoD9nS3cCKl0bRXjd/DhrJv
 LRGY0t7zDLssSZwYJczQv0M/LtIv0wQ4MHqolc6aajhI5HVyoUs5jehn59otX0lXah
 0/PUWD+XOwAsFiOgpC5u7H5p0HDqkVLEC+Jb2iYlTxLDdZ2pZCF4GvSUFlGglxlblW
 2dYlEH0ZVdrOMoTNVdbdFs7OP7Ma55iuHX0U6Bi5hMI3Vwokt1pXPytwdFtpaNS7WA
 +fYMzqAWFPw4wFgGpGfVlk2/EVsjdqvTra1PsxZKtsGRqvBkLfqvTTogHMXe30VReA
 AiKTULFxtXAeA==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 27 Aug 2025 17:12:40 +0200
Subject: [PATCH v3 09/14] drm/tidss: dispc: Switch VID_REG_GET to using a mask
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250827-drm-tidss-field-api-v3-9-7689b664cc63@kernel.org>
References: <20250827-drm-tidss-field-api-v3-0-7689b664cc63@kernel.org>
In-Reply-To: <20250827-drm-tidss-field-api-v3-0-7689b664cc63@kernel.org>
To: Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2081; i=mripard@kernel.org;
 h=from:subject:message-id; bh=YR/gYRTUbGVsPcXt+qNXfBhGUDKi5WInCy3Qs5bL5Cw=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBnrFdLal9a6+K4JSHEpu7znRGjRrAnNi3cx2bVZzpzJv
 jlCbB1vx1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZhI2HbGhtUrF8+tadSt4kos
 uLTHdluCxq7ZZzwNbxodnmep+lyz2kt5w/y9LAfvegvdP3Wq8qvnb8aGZY9Mrs4zlmyI4fn7co/
 8IZvg/oJ1HBafZb9MY/m37p+R5LO7invv7QthZP25fcLtd9UlAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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

The VID_REG_GET function takes the start and end bits as parameter and
will generate a mask out of them.

This makes it difficult to share the masks between callers, since we now
need two arguments and to keep them consistent.

Let's change VID_REG_GET to take the mask as an argument instead, and
let the caller create the mask. Eventually, this mask will be moved to a
define.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/tidss/tidss_dispc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
index 82b038285acc245f86573a6a854da37248c92407..8e2c8ecb9f18c71cb532f1f5cea2bc00a0262ad3 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.c
+++ b/drivers/gpu/drm/tidss/tidss_dispc.c
@@ -604,13 +604,12 @@ void tidss_disable_oldi(struct tidss_device *tidss, u32 hw_videoport)
 		u32 _reg = dispc_read(_dispc, _idx);			\
 		FIELD_MODIFY((mask), &_reg, (val));			\
 		dispc_write(_dispc, _idx, _reg);			\
 	})
 
-#define VID_REG_GET(dispc, hw_plane, idx, start, end)			\
-	((u32)FIELD_GET(GENMASK((start), (end)),			\
-			dispc_vid_read((dispc), (hw_plane), (idx))))
+#define VID_REG_GET(dispc, hw_plane, idx, mask)				\
+	((u32)FIELD_GET((mask), dispc_vid_read((dispc), (hw_plane), (idx))))
 
 #define VID_REG_FLD_MOD(dispc, hw_plane, idx, val, start, end)		\
 	({								\
 		struct dispc_device *_dispc = (dispc);			\
 		u32 _hw_plane = (hw_plane);				\
@@ -2292,11 +2291,12 @@ void dispc_plane_enable(struct dispc_device *dispc, u32 hw_plane, bool enable)
 	VID_REG_FLD_MOD(dispc, hw_plane, DISPC_VID_ATTRIBUTES, !!enable, 0, 0);
 }
 
 static u32 dispc_vid_get_fifo_size(struct dispc_device *dispc, u32 hw_plane)
 {
-	return VID_REG_GET(dispc, hw_plane, DISPC_VID_BUF_SIZE_STATUS, 15, 0);
+	return VID_REG_GET(dispc, hw_plane, DISPC_VID_BUF_SIZE_STATUS,
+			   GENMASK(15, 0));
 }
 
 static void dispc_vid_set_mflag_threshold(struct dispc_device *dispc,
 					  u32 hw_plane, u32 low, u32 high)
 {

-- 
2.50.1

