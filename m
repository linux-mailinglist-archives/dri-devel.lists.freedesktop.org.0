Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC5D8B2963
	for <lists+dri-devel@lfdr.de>; Thu, 25 Apr 2024 22:07:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ACE211A877;
	Thu, 25 Apr 2024 20:07:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="LvMwa3Tu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7575511A877
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Apr 2024 20:07:16 +0000 (UTC)
Received: by mail-qk1-f170.google.com with SMTP id
 af79cd13be357-78f031a4442so93353485a.2
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Apr 2024 13:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1714075635; x=1714680435;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Hrf5rMrA2Yr2VlKzee9lYWI7dYbsc6Gr+Xi/bDn+rz0=;
 b=LvMwa3TubbE0mqm+TPOdDvYsBiK+vsIet0I+xV/aSfgM34+P4DbF5j1eT4QVpRgf14
 WRovYU4EtGmTP2+ZWuKX2uH+PYE83KwN3B04wmrSXhThidHJy7yEuoVZ8SNOmWW7G5Uz
 M8dYP1tN2Nb3g081qxRonKmkEkUiVO09jc2Ik=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714075635; x=1714680435;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Hrf5rMrA2Yr2VlKzee9lYWI7dYbsc6Gr+Xi/bDn+rz0=;
 b=UNXdepu27KxsHzP+oWOu8pZfYL2y+jXyVdcCgAQaBy2cbDzwJ47FRIH/whOKxpjWWv
 CFmfQslkBmg07FtDz01GxKt226HqAJwkfcgGiQ1jEcCM2NxYFWrVsezLazFEF77HiwHL
 3M3z/tGBRNfb6F2Etul8w3Sn5PJrxpIt0ChDJKoW+OcL60A21E37ylAEMddTIMNzqpWB
 xS4khSUZzsIw4kue7Xm+t1FerPemTweo/wk9FEP6S2eV0z8ZmLGO3tiRI+WDDKS8UPfA
 bqlZrre4BI0Azge4tx2VWRlOmfl7/Mwgohzwlpfhghc5ynYAdL1n21LHDQVCtFYHLxVs
 z69w==
X-Gm-Message-State: AOJu0Yy3gRlIRYOfgZ3qTKVTy0oWdMinzA4XUNGjUSCsLVHSZtxybtf0
 Hxz9jseV0yhZny4x4iood5LbLWnypslgji/miiks+QQ0133Q9Vhl3Ive29Mn1KI8jEVB3IQLYTy
 dIGoaDWjHMNFeMLxjP19ecMPcuuDIhcLGNy99X0Ki66SGA6wu4BOdJ/o5hR0llKncMS9yRrQ05U
 78qwSWb7FnCwDJIGJGv23VHhOisVl6uwPkZWa/25f+RqIkgjREh/ua
X-Google-Smtp-Source: AGHT+IHyRkYUe/0gy0s0tS/OX5ymL0pDu2uagfpJmaEPf+YoGRhJF+xf+fM/3zk+kXdOrIq5GkZOSQ==
X-Received: by 2002:ad4:5d6c:0:b0:6a0:9fd9:faac with SMTP id
 fn12-20020ad45d6c000000b006a09fd9faacmr1131728qvb.9.1714075634874; 
 Thu, 25 Apr 2024 13:07:14 -0700 (PDT)
Received: from localhost ([173.205.42.30]) by smtp.gmail.com with ESMTPSA id
 x1-20020a0ce0c1000000b006a047d74b10sm1940226qvk.4.2024.04.25.13.07.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Apr 2024 13:07:14 -0700 (PDT)
From: Ian Forbes <ian.forbes@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: bcm-kernel-feedback-list@broadcom.com, zack.rusin@broadcom.com,
 martin.krastev@broadcom.com, maaz.mombasawala@broadcom.com,
 Ian Forbes <ian.forbes@broadcom.com>, stable@vger.kernel.org
Subject: [PATCH] drm/vmwgfx: Fix Legacy Display Unit
Date: Thu, 25 Apr 2024 15:07:00 -0500
Message-Id: <20240425200700.24403-1-ian.forbes@broadcom.com>
X-Mailer: git-send-email 2.34.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Legacy DU was broken by the referenced fixes commit because the placement
and the busy_placement no longer pointed to the same object. This was later
fixed indirectly by commit a78a8da51b36c7a0c0c16233f91d60aac03a5a49
("drm/ttm: replace busy placement with flags v6") in v6.9.

Fixes: 39985eea5a6d ("drm/vmwgfx: Abstract placement selection")
Signed-off-by: Ian Forbes <ian.forbes@broadcom.com>
Cc: <stable@vger.kernel.org> # v6.4+
---
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
index 2bfac3aad7b7..98e73eb0ccf1 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
@@ -204,6 +204,7 @@ int vmw_bo_pin_in_start_of_vram(struct vmw_private *dev_priv,
 			     VMW_BO_DOMAIN_VRAM,
 			     VMW_BO_DOMAIN_VRAM);
 	buf->places[0].lpfn = PFN_UP(bo->resource->size);
+	buf->busy_places[0].lpfn = PFN_UP(bo->resource->size);
 	ret = ttm_bo_validate(bo, &buf->placement, &ctx);
 
 	/* For some reason we didn't end up at the start of vram */
-- 
2.34.1

