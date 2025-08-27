Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D0EB385E7
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 17:13:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E08CD10E846;
	Wed, 27 Aug 2025 15:13:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="AyzWDH9c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BF8A10E149
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 15:12:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 9B293441FD;
 Wed, 27 Aug 2025 15:12:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16F63C4CEF9;
 Wed, 27 Aug 2025 15:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756307577;
 bh=uP7VrIhR0S0n6XikKxh4fvAsgSssIZys68koJDMOXK0=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=AyzWDH9c/dRaqFbFLLopAVhe7M6mQrp2SGvgz/5JzPE0+vvjRkRROMTbrp5ap2uxf
 YIIj15YknVvmT0eWEc/Y5S/zaoih7xoQLWvnynl4OcUNj/r6NUjwrwVMzIdu6rJcWZ
 coUXJOkl14tIuPjVct6nw5iiD4w2dZVoKC5S60YaAuM0/R8apIxwgSMFBV6/nVK2uu
 B5hdKyuYUlL8w1e6vNf/i9j1VprDoAEwLOVFizJYARiOfVKr0m+abOL/djtrDOQBCR
 bHXcmGimLer6y0ZgdHVg82+n4CM/RvqILyJJxdtSq6OVF+Jk+ePbHpQtfAGXmrjZjY
 5R0unXV5aRH2w==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 27 Aug 2025 17:12:36 +0200
Subject: [PATCH v3 05/14] drm/tidss: dispc: Get rid of FLD_GET
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250827-drm-tidss-field-api-v3-5-7689b664cc63@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2757; i=mripard@kernel.org;
 h=from:subject:message-id; bh=uP7VrIhR0S0n6XikKxh4fvAsgSssIZys68koJDMOXK0=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBnrFVIjzv06nt9vkfTTd+HDJgftjlff5k90F41u2LSa7
 +Xv688udExlYRDmZJAVU2R5IhN2enn74ioH+5U/YOawMoEMYeDiFICJsF9lrJXqKDB0v3fR7cfW
 G9ra7e/vfbSad/7IEV3GkC+H/s00WvJ23pOapYb1fAa+BfUBBS1bKhgbul9kbD1oJPO6o8Je/9o
 httesJxVW6tS0KdsubNec+2TPX4ZVvzkcL/buZG/5mTjpzbWVAA==
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

The FLD_GET function is an equivalent to what FIELD_GET + GENMASK
provide, so let's drop it and switch to the latter.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/tidss/tidss_dispc.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
index 43f8078a1effa2b5a09532cb069131dc0cbf3c10..b4ba342ac241a603db447d6c5ae147c981013be2 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.c
+++ b/drivers/gpu/drm/tidss/tidss_dispc.c
@@ -592,27 +592,21 @@ void tidss_disable_oldi(struct tidss_device *tidss, u32 hw_videoport)
 /*
  * TRM gives bitfields as start:end, where start is the higher bit
  * number. For example 7:0
  */
 
-#define FLD_GET(val, start, end)					\
-	({								\
-		int _end = (end);					\
-		u32 _ret_val = ((val) & GENMASK((start), _end)) >> _end; \
-		_ret_val;						\
-	})
-
 #define FLD_MOD(orig, val, start, end)					\
 	({								\
 		int _start = (start), _end = (end);			\
 		u32 _masked_val = (orig) & ~GENMASK(_start, _end);	\
 		u32 _new_val = _masked_val | FIELD_PREP(GENMASK(_start, _end), (val)); \
 		_new_val;						\
 	})
 
 #define REG_GET(dispc, idx, start, end)					\
-	((u32)FLD_GET(dispc_read((dispc), (idx)), (start), (end)))
+	((u32)FIELD_GET(GENMASK((start), (end)),			\
+			dispc_read((dispc), (idx))))
 
 #define REG_FLD_MOD(dispc, idx, val, start, end)			\
 	({								\
 		struct dispc_device *_dispc = (dispc);			\
 		u32 _idx = (idx);					\
@@ -620,11 +614,12 @@ void tidss_disable_oldi(struct tidss_device *tidss, u32 hw_videoport)
 		u32 _new = FLD_MOD(_curr, (val), (start), (end));	\
 		dispc_write(_dispc, _idx, _new);			\
 	})
 
 #define VID_REG_GET(dispc, hw_plane, idx, start, end)			\
-	((u32)FLD_GET(dispc_vid_read((dispc), (hw_plane), (idx)), (start), (end)))
+	((u32)FIELD_GET(GENMASK((start), (end)),			\
+			dispc_vid_read((dispc), (hw_plane), (idx))))
 
 #define VID_REG_FLD_MOD(dispc, hw_plane, idx, val, start, end)		\
 	({								\
 		struct dispc_device *_dispc = (dispc);			\
 		u32 _hw_plane = (hw_plane);				\
@@ -633,11 +628,12 @@ void tidss_disable_oldi(struct tidss_device *tidss, u32 hw_videoport)
 		u32 _new = FLD_MOD(_curr, (val), (start), (end));	\
 		dispc_vid_write(_dispc, _hw_plane, _idx, _new);		\
 	})
 
 #define VP_REG_GET(dispc, vp, idx, start, end)				\
-	((u32)FLD_GET(dispc_vp_read((dispc), (vp), (idx)), (start), (end)))
+	((u32)FIELD_GET(GENMASK((start), (end)),			\
+			dispc_vp_read((dispc), (vp), (idx))))
 
 #define VP_REG_FLD_MOD(dispc, vp, idx, val, start, end)			\
 	({								\
 		struct dispc_device *_dispc = (dispc);			\
 		u32 _vp = (vp);						\

-- 
2.50.1

