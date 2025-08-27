Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1274B385DE
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 17:12:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CC7C10E844;
	Wed, 27 Aug 2025 15:12:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="PZSgVF+U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F15AE10E844
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 15:12:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 46AFE602C7;
 Wed, 27 Aug 2025 15:12:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF079C4CEF5;
 Wed, 27 Aug 2025 15:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756307572;
 bh=EBPSGENkTcwztznrwhtBrxgFnzCYLtSKl6BkLZjU1c8=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=PZSgVF+UQTzFbvQD+OJCASw7ojVoJ//PgyIDpDpBxZ/qvsNZBXl+ZcfWLI9gPQorp
 QSoOP4VblCzR23UaNal0kPKVVTQozfHUNU+6ZqtX8XI9fTicZYzmbCFoQOWxVY/nRo
 1ydumtnahPsSW+AZmvRh573YT65Qr1T3qxlxZcWV85ISUbstG3asgNRBXOTBso77x3
 fNnNlNmuq+f70TEBMqbPgz+cCP9fCM4L2n9n4SjaYuiWsCereKyizbkkOZVmo5D2RE
 uDmeywUBe4UqUaNgdq1B37Y3M//o94eJ92y+H4ne14tBhiO6AkasX0js7NslT7t7FL
 XWIB87Js5sUDw==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 27 Aug 2025 17:12:34 +0200
Subject: [PATCH v3 03/14] drm/tidss: dispc: Switch to GENMASK instead of
 FLD_MASK
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250827-drm-tidss-field-api-v3-3-7689b664cc63@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1844; i=mripard@kernel.org;
 h=from:subject:message-id; bh=EBPSGENkTcwztznrwhtBrxgFnzCYLtSKl6BkLZjU1c8=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBnrFVK2nZJXucLJzBdZ+crutUyV9bZtiY7FTrx+JRMEr
 G+9Sd7ZMZWFQZiTQVZMkeWJTNjp5e2LqxzsV/6AmcPKBDKEgYtTACYSl8lYn2uSO2Xm19+b7ZeH
 b8h/veFaE6PrY5Uo9rsTbL4/38jJVVHPf6w5enrKoed2VTPut3YkMNZpV8WV18Y7m3YXMwi/f31
 vidnx3vbZjcxsUkeb+qLU86VEpwQXT7+nm+ldOfv0sglhRQA=
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
index 6231e1aa07fdfa4ea1265b8239e561972dbba8f3..b5f09ed2f3700068bc39bef3630a86a33c16fabb 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.c
+++ b/drivers/gpu/drm/tidss/tidss_dispc.c
@@ -592,35 +592,28 @@ void tidss_disable_oldi(struct tidss_device *tidss, u32 hw_videoport)
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

