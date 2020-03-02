Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17FD517710C
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 09:24:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D93F6E9F7;
	Tue,  3 Mar 2020 08:24:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57B446E25A
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2020 10:32:33 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id d10so11110337ljl.9
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2020 02:32:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=a42O4KV4bEmBFQrB6svb5MCsREuatuBAEWKoVrmbJO0=;
 b=cWTcWZAIYzjyX4csJQI8qpY9zS6H5etvZc0N+Mrjfy88j2LDsNnKBZ2r9ZOt7c0ee1
 Z3l7UAHxFeonp5mJo00Zi1tUpr3Q/MWTk56CuJWDaegT83D6Bi0DGPOjReSz7hCi6jBE
 D1//q/27Sh7NMHJX5zt+R9JW3R799Sc4ccu9n1NERTb5xBYG8OxenY6BJ6X/M4AGPh8W
 9DWOReMKA3aRztFwCRoDvEgY7PBSzMnehaXPgokPEiuCHiVc22zv0RugHl5TZ9VdZx/I
 PGFVb8zFCYwHgI8Jlgq+dw1zf0KLMSd/EOqh3KN/r12jgXFGrbk7J3MxjBTxjPXTxY2F
 pPsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=a42O4KV4bEmBFQrB6svb5MCsREuatuBAEWKoVrmbJO0=;
 b=dDeaPHuxbHxJZdVCzT5TMtgl+Z1kTJqljutSOkh1HtxdBNnDdxCxKqCWJqg5oPJpbm
 /Q5elw9K8TpqMfN6Ss2wswtUEqRFGJfpvK9+DmwJaX9AxX8qXzRs8XCVyVPZlc5YgcWc
 yJlszqEvBoVpcU4+E+7cjtAMgcZ1I9Ri0Ggwhp+2kWW4PFbE7Sj16JCivpU9/8ibkfhw
 FL4wB1LdgdnbguKO5WqBwdedn7vmCuroBs5pumrUrq1lcMIokBjN4rIBBSNCR+iyWm7/
 p9f/0CRl2lkeZLZBKbZC6hL0y3AmZItWhBtBEx55u4I8VbTpa5iOQEOtkFngE4gKAOpt
 Tsfw==
X-Gm-Message-State: ANhLgQ1BHy3rZUJNJSBqe+rzogaqxkWnxSaQl7pRb7NtMFOycKwUzScR
 A1ZlSI5fu/kQGW+Dty78rYA=
X-Google-Smtp-Source: ADFU+vvy4hEeA0Fk8eWL+molTfrJlcJGZig6kMdWtN2clniYcBX6YHZQdFlQSI1P0cwNHUtitZvmcQ==
X-Received: by 2002:a05:651c:cf:: with SMTP id
 15mr11454597ljr.288.1583145151835; 
 Mon, 02 Mar 2020 02:32:31 -0800 (PST)
Received: from localhost.localdomain ([149.255.131.2])
 by smtp.gmail.com with ESMTPSA id n21sm3895328lfh.2.2020.03.02.02.32.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 02:32:31 -0800 (PST)
From: Roman Stratiienko <r.stratiienko@gmail.com>
To: jernej.skrabec@siol.net,
	mripard@kernel.org,
	wens@csie.org
Subject: [PATCH v4 4/4] RFC: drm/sun4i: Process alpha channel of most bottom
 layer
Date: Mon,  2 Mar 2020 12:31:38 +0200
Message-Id: <20200302103138.17916-5-r.stratiienko@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200302103138.17916-1-r.stratiienko@gmail.com>
References: <.>
 <20200302103138.17916-1-r.stratiienko@gmail.com>
X-Mailman-Approved-At: Tue, 03 Mar 2020 08:24:06 +0000
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
Cc: airlied@linux.ie, Roman Stratiienko <r.stratiienko@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Allwinner display engine blender consists of 3 pipelined blending units.

PIPE0->\
        BLD0-\
PIPE1->/      BLD1-\
PIPE2->------/      BLD2->OUT
PIPE3->------------/

This pipeline produces incorrect composition if PIPE0 buffer has alpha.
Correct solution is to add one more blending step and mix PIPE0 with
background, but it is not supported by the hardware.

Use premultiplied alpha buffer of PIPE0 overlay channel as is.
In this case we got same effect as mixing PIPE0 with black background.

Signed-off-by: Roman Stratiienko <r.stratiienko@gmail.com>

---

v4:
- Initial version, depends on other unmerged patches in the patchset.
---
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 2 +-
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index dd6145f80c36..d94f4d8b9128 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -106,7 +106,7 @@ static void sun8i_ui_layer_update_alpha(struct sun8i_mixer *mixer, int channel,
 	regmap_update_bits(mixer->engine.regs,
 			   SUN8I_MIXER_BLEND_PREMULTIPLY(bld_base),
 			   SUN8I_MIXER_BLEND_PREMULTIPLY_EN(zpos),
-			   SUN8I_MIXER_BLEND_PREMULTIPLY_EN(zpos));
+			   zpos ? SUN8I_MIXER_BLEND_PREMULTIPLY_EN(zpos) : 0);
 }
 
 static int sun8i_ui_layer_update_coord(struct sun8i_mixer *mixer, int channel,
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index e6d8a539614f..68a6843db4ab 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -108,7 +108,7 @@ static void sun8i_vi_layer_update_alpha(struct sun8i_mixer *mixer, int channel,
 	regmap_update_bits(mixer->engine.regs,
 			   SUN8I_MIXER_BLEND_PREMULTIPLY(bld_base),
 			   SUN8I_MIXER_BLEND_PREMULTIPLY_EN(zpos),
-			   (mixer->cfg->is_de3) ?
+			   (zpos != 0 && mixer->cfg->is_de3) ?
 				SUN8I_MIXER_BLEND_PREMULTIPLY_EN(zpos) : 0);
 
 }
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
