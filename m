Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76447461499
	for <lists+dri-devel@lfdr.de>; Mon, 29 Nov 2021 13:08:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 234E06FA73;
	Mon, 29 Nov 2021 12:07:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B95FC6FA5B
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Nov 2021 12:07:16 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id i5so36283559wrb.2
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Nov 2021 04:07:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IRN4qp5Iqo3k44JzsPUytvzY07JybWV7N7oXbJsRX+E=;
 b=GNCy9OAidh99/qEk1zKxyw4ypwtKj8LdbT2qsAqoTvD4EFB+BauBwFE+qGkDlWqECB
 8TdYZiIKmH7NT3lkZw0ykvvAfRrkLuoG3bkjH4IIWaQH5veBzyS+4jxm6HTktp59r5Ij
 73IrqDDmcSL2Pznrd2yP23du5MKuhuw4bGgTdiYjf+g/aEabrozTJfTNPLEkmpQtJDLa
 y/eI5q51uizdJ58MlsovowQ3dD51AKQYK1eJMFFIcT2cgzqhYY9YnNDdpG+N3FW5A5rg
 Qpv/HqAY/ySZjMPLap699LVMY1n0yhuMcP8x1uUME4T4PrYc0AI+baPCYmgvztsE1GYf
 KILA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IRN4qp5Iqo3k44JzsPUytvzY07JybWV7N7oXbJsRX+E=;
 b=I6Jc2jxNyH1gFYh4HqFuvP8LMo+i9LLrmQSCFfPf9VdF6OYi6Syjuff0fcMq/tUgSK
 CkMe81AD9ASPDSMCSCAUxn+F9n0iCq/x1y6rBd1KxZX6ZiJ+CErJ7gdm40GJgm85OdKL
 etvNh5TdpEotMk8fuK3Us0UyWX00BC4jgIMAHqt+TfKJ4lI/bDNz2KS4oOg0hYAzAXcK
 G+L2SGX0z7yOYwKLm7G39O7ZbIikQSVCkitXhX/154n6a2JkANfHzNE7gBAiAdXiFCMK
 J1tc0DShXPv3lQEXD5Wqw+8ngNjvSCF1YCJIzi3dckeoUcjKTglSoNOqeN7mtl2Lrp9F
 VeOQ==
X-Gm-Message-State: AOAM532y0ODHxFFpCjqbNSmPop1t2TTb1T7AmpeDut/3qEWAYgyUAjp+
 tzb/yJmygozpp/j/ADkAkr4=
X-Google-Smtp-Source: ABdhPJyBF+tlFX4VwvgGat3TR86DCM4R3QSZ1WW22O70tCZn2dZIPBlsIfogSx0kdHmK5dtWChU2+A==
X-Received: by 2002:a05:6000:2a3:: with SMTP id
 l3mr33033215wry.415.1638187635333; 
 Mon, 29 Nov 2021 04:07:15 -0800 (PST)
Received: from abel.fritz.box (p57b0b77b.dip0.t-ipconnect.de. [87.176.183.123])
 by smtp.gmail.com with ESMTPSA id b6sm20415234wmq.45.2021.11.29.04.07.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 04:07:14 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch
Subject: [PATCH 12/28] drm/vmwgfx: stop using dma_resv_excl_fence
Date: Mon, 29 Nov 2021 13:06:43 +0100
Message-Id: <20211129120659.1815-13-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129120659.1815-1-christian.koenig@amd.com>
References: <20211129120659.1815-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Instead use the new dma_resv_get_singleton function.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_resource.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
index 8d1e869cc196..23c3fc2cbf10 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
@@ -1168,8 +1168,10 @@ int vmw_resources_clean(struct vmw_buffer_object *vbo, pgoff_t start,
 		vmw_bo_fence_single(bo, NULL);
 		if (bo->moving)
 			dma_fence_put(bo->moving);
-		bo->moving = dma_fence_get
-			(dma_resv_excl_fence(bo->base.resv));
+
+		/* TODO: This is actually a memory management dependency */
+		return dma_resv_get_singleton(bo->base.resv, false,
+					      &bo->moving);
 	}
 
 	return 0;
-- 
2.25.1

