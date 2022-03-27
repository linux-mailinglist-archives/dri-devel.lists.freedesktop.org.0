Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1094E8692
	for <lists+dri-devel@lfdr.de>; Sun, 27 Mar 2022 09:39:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1674B10E099;
	Sun, 27 Mar 2022 07:39:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80C4A10E075;
 Sun, 27 Mar 2022 07:39:33 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id c2so9850300pga.10;
 Sun, 27 Mar 2022 00:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=O3PyRZqqQh72JcsvYztaOf/qr4ybAn9k/u2PdxyHICY=;
 b=nvGGBOnXV1+wWMEOMbhZUSf6f5Zt9YLJWJ5ymTGyk9mxkOL6wNtSx2D1BBlCCV05ji
 YWbA5dxwDOK1lZMpsQBheNr3aLYi791kjM16ZggoHsF9+ZdWlCT1maMQuhfZkfrPxRby
 BEqbW6sS0eNA1TGvVzNN3kqX+0hiJ8SXGmrzNCuMgLALsmRgP/FIrJTu1JEN/SHX3M03
 BXU134bXzjlTl7hP6USgDEyR5oufYSyULlh5QjknFXm+sWYa6Fjv9HY90FJF9IA5cd8s
 5NshequTbJcgykoN8UI3aQtd23V1H7LlAar/JzAbY4t9pI7KVYWiXdqxaFpM5OWgS2oI
 Yjfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=O3PyRZqqQh72JcsvYztaOf/qr4ybAn9k/u2PdxyHICY=;
 b=l9I9//EbpT/7UIv/5vRF6Js2gTdomZZaLFCXXiFN2cm+YSqmdqQ9urzgVa9YckwJ44
 3r83+tinv8TPaMM2cBTM5Ia11MplRIEcrgb8CypqPGTL2OkXx++kIXoTnzbX+DJvSm4+
 1kgkYJnO7HsRCI0C0BA97rtplJEjtRHQOiHiDQtHNr92xD6dfuGXUPM3J3SFllxM0Re2
 PU4Rf1uHzUQx9dOVyp87L7CnBXbOTSxAceK+gNYj1W5D9hNOKCZxXfpzc3HoPuGIFUVZ
 4mV6lc1TFkOGn2QNNFFGPpxG8bGVoxaWzkfOuGakuSmXzykJkURvsJRgR9/O3Ujl8eau
 E7Kw==
X-Gm-Message-State: AOAM532L6mbb0ri2Zy6bwwdfvmDafNzUiCemvNtKHyYhz0C8ah7JHi5N
 GKxiQSdXmK5tjjw3pzwKOQo=
X-Google-Smtp-Source: ABdhPJx3gRZk3pDQgkapY0ZHu5LFAijgb2Y/bH7NxBmXkU8qFs8ivrJQq62gnTVAQ8rgLDSqvn4npg==
X-Received: by 2002:a63:6a41:0:b0:386:5d6f:a643 with SMTP id
 f62-20020a636a41000000b003865d6fa643mr5911347pgc.169.1648366773155; 
 Sun, 27 Mar 2022 00:39:33 -0700 (PDT)
Received: from localhost ([115.220.243.108]) by smtp.gmail.com with ESMTPSA id
 j6-20020a63b606000000b003808b0ea96fsm9243231pgf.66.2022.03.27.00.39.31
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 27 Mar 2022 00:39:32 -0700 (PDT)
From: Xiaomeng Tong <xiam0nd.tong@gmail.com>
To: bskeggs@redhat.com, kherbst@redhat.com, lyude@redhat.com, airlied@linux.ie,
 daniel@ffwll.ch
Subject: [PATCH] dispnv50: atom: fix an incorrect NULL check on list iterator
Date: Sun, 27 Mar 2022 15:39:25 +0800
Message-Id: <20220327073925.11121-1-xiam0nd.tong@gmail.com>
X-Mailer: git-send-email 2.17.1
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
Cc: nouveau@lists.freedesktop.org, yangyingliang@huawei.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Xiaomeng Tong <xiam0nd.tong@gmail.com>, stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The bug is here:
	return encoder;

The list iterator value 'encoder' will *always* be set and non-NULL
by drm_for_each_encoder_mask(), so it is incorrect to assume that the
iterator value will be NULL if the list is empty or no element found.
Otherwise it will bypass some NULL checks and lead to invalid memory
access passing the check.

To fix this bug, just return 'encoder' when found, otherwise return
NULL.

Cc: stable@vger.kernel.org
Fixes: 12885ecbfe62d ("drm/nouveau/kms/nvd9-: Add CRC support")
Signed-off-by: Xiaomeng Tong <xiam0nd.tong@gmail.com>
---
 drivers/gpu/drm/nouveau/dispnv50/atom.h |  6 +++---
 drivers/gpu/drm/nouveau/dispnv50/crc.c  | 27 ++++++++++++++++++++-----
 2 files changed, 25 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/atom.h b/drivers/gpu/drm/nouveau/dispnv50/atom.h
index 3d82b3c67dec..93f8f4f64578 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/atom.h
+++ b/drivers/gpu/drm/nouveau/dispnv50/atom.h
@@ -160,14 +160,14 @@ nv50_head_atom_get(struct drm_atomic_state *state, struct drm_crtc *crtc)
 static inline struct drm_encoder *
 nv50_head_atom_get_encoder(struct nv50_head_atom *atom)
 {
-	struct drm_encoder *encoder = NULL;
+	struct drm_encoder *encoder;
 
 	/* We only ever have a single encoder */
 	drm_for_each_encoder_mask(encoder, atom->state.crtc->dev,
 				  atom->state.encoder_mask)
-		break;
+		return encoder;
 
-	return encoder;
+	return NULL;
 }
 
 #define nv50_wndw_atom(p) container_of((p), struct nv50_wndw_atom, state)
diff --git a/drivers/gpu/drm/nouveau/dispnv50/crc.c b/drivers/gpu/drm/nouveau/dispnv50/crc.c
index 29428e770f14..b834e8a9ae77 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/crc.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/crc.c
@@ -390,9 +390,18 @@ void nv50_crc_atomic_check_outp(struct nv50_atom *atom)
 		struct nv50_head_atom *armh = nv50_head_atom(old_crtc_state);
 		struct nv50_head_atom *asyh = nv50_head_atom(new_crtc_state);
 		struct nv50_outp_atom *outp_atom;
-		struct nouveau_encoder *outp =
-			nv50_real_outp(nv50_head_atom_get_encoder(armh));
-		struct drm_encoder *encoder = &outp->base.base;
+		struct nouveau_encoder *outp;
+		struct drm_encoder *encoder, *enc;
+
+		enc = nv50_head_atom_get_encoder(armh);
+		if (!enc)
+			continue;
+
+		outp = nv50_real_outp(enc);
+		if (!outp)
+			continue;
+
+		encoder = &outp->base.base;
 
 		if (!asyh->clr.crc)
 			continue;
@@ -443,8 +452,16 @@ void nv50_crc_atomic_set(struct nv50_head *head,
 	struct drm_device *dev = crtc->dev;
 	struct nv50_crc *crc = &head->crc;
 	const struct nv50_crc_func *func = nv50_disp(dev)->core->func->crc;
-	struct nouveau_encoder *outp =
-		nv50_real_outp(nv50_head_atom_get_encoder(asyh));
+	struct nouveau_encoder *outp;
+	struct drm_encoder *encoder;
+
+	encoder = nv50_head_atom_get_encoder(asyh);
+	if (!encoder)
+		return;
+
+	outp = nv50_real_outp(encoder);
+	if (!outp)
+		return;
 
 	func->set_src(head, outp->or, nv50_crc_source_type(outp, asyh->crc.src),
 		      &crc->ctx[crc->ctx_idx]);
-- 
2.17.1

