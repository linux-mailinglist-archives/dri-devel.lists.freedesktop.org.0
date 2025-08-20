Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D89C6B2DE8B
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 16:02:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E4B310E747;
	Wed, 20 Aug 2025 14:02:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oxd2C/zb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E46C610E745
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 14:02:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id CCE3E4672E;
 Wed, 20 Aug 2025 14:02:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AE46C4CEE7;
 Wed, 20 Aug 2025 14:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755698529;
 bh=IIsNedq+iyblpRYlMXmp6+zZ9khsNh/7IwMpr1pIVrc=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=oxd2C/zbpQbbcuqDiyV0Owp8XvGtgKTQJr+SZu6qgOV2YH3sQi2uAx/y/LR+YTDPS
 tJ9bff8uMeTfdVXzeQYGwOEs8ptbI0ADL2lX6sbpVRT4l2RI2CX6QzI5tOA45pqB6E
 doBWzjrG4uvhGs0sYnDHWFMwjI5AYR6+2SCvTAfnTGYIZwibtWlXZAYPz0ogZaMJVZ
 Cya2A6XMCkkdvIZKJor4OoqwmhYTrecRw185ZgL/N9h1teEbFJtzSIM8pHIldpwrXy
 OSH/PfYRUtaO8tqh8siJyr/K4CluEIfwdUK0sUFybLe9i+ORpSe2s7yIKHgL+NGuO4
 At9vHJwHw9zLw==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 20 Aug 2025 16:01:43 +0200
Subject: [PATCH v2 03/14] drm/tidss: dispc: Switch to GENMASK instead of
 FLD_MASK
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250820-drm-tidss-field-api-v2-3-43cab671c648@kernel.org>
References: <20250820-drm-tidss-field-api-v2-0-43cab671c648@kernel.org>
In-Reply-To: <20250820-drm-tidss-field-api-v2-0-43cab671c648@kernel.org>
To: Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1844; i=mripard@kernel.org;
 h=from:subject:message-id; bh=IIsNedq+iyblpRYlMXmp6+zZ9khsNh/7IwMpr1pIVrc=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBlLrwY83fSQv9ujNnwWy7OqrjkLq405mw1ZdywqShG/f
 t5lYnRjx1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZjI1TmMteL88+ZWrbkb+fxt
 6DU7JpUNScpBXazBqamxNkuv2fEtk95jGbGPfd4jhspcvu6TQu9fMlazS5vceGxtOU200s59ucn
 hsl+vQor0jqetW6pcusjUv3Spr/XdnK3qadKZ+4Wz2J88XgsA
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

The dispc FLD_MASK function is an exact equivalent of the GENMASK macro.
Let's convert the dispc driver to the latter.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/tidss/tidss_dispc.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
index 10fbc99621c149f4e119ef4a45867c369ca5df0b..929c9e3ac1174df68937afd86f13bda4e3a66394 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.c
+++ b/drivers/gpu/drm/tidss/tidss_dispc.c
@@ -607,35 +607,28 @@ void tidss_disable_oldi(struct tidss_device *tidss, u32 hw_videoport)
 /*
  * TRM gives bitfields as start:end, where start is the higher bit
  * number. For example 7:0
  */
 
-#define FLD_MASK(start, end)						\
-	({								\
-		int _end_inner = (end);					\
-		u32 _mask = ((1 << ((start) - _end_inner + 1)) - 1) << _end_inner; \
-		_mask;							\
-	})
-
 #define FLD_VAL(val, start, end)					\
 	({								\
 		int _end_inner = (end);					\
-		u32 _new_val = ((val) << _end_inner) & FLD_MASK((start), _end_inner); \
+		u32 _new_val = ((val) << _end_inner) & GENMASK((start), _end_inner); \
 		_new_val;						\
 	})
 
 #define FLD_GET(val, start, end)					\
 	({								\
 		int _end = (end);					\
-		u32 _ret_val = ((val) & FLD_MASK((start), _end)) >> _end; \
+		u32 _ret_val = ((val) & GENMASK((start), _end)) >> _end; \
 		_ret_val;						\
 	})
 
 #define FLD_MOD(orig, val, start, end)					\
 	({								\
 		int _start = (start), _end = (end);			\
-		u32 _masked_val = (orig) & ~FLD_MASK(_start, _end);	\
+		u32 _masked_val = (orig) & ~GENMASK(_start, _end);	\
 		u32 _new_val = _masked_val | FLD_VAL((val), _start, _end); \
 		_new_val;						\
 	})
 
 #define REG_GET(dispc, idx, start, end)					\

-- 
2.50.1

