Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A79134E28E0
	for <lists+dri-devel@lfdr.de>; Mon, 21 Mar 2022 14:59:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F8E210E451;
	Mon, 21 Mar 2022 13:59:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9AAC10E430
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Mar 2022 13:59:05 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id h4so2854887wrc.13
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Mar 2022 06:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=09+OZY0MO5bnMgqYdcklnL95CtjCA0G+15DEhlIQKlg=;
 b=IfZug0x9+JSU5caPDMz3f0sC4ORWVR+AoqM+3CakFKprSH4Yml+aAREfEypve8w1bc
 vPz6QvX7snXa+rX85BN4JhAi+AIYM+EHiJ2eLhFENJ5h8jQDmEy97fq040ngrEX7gG8Y
 d3OKW4/jBxDv96K80/swIHIRzWRTsxxjKICEgKBw0er//93NkZA74/JX7mUNvkDtYLlz
 iw+VKtkdXecz8FBrA5C5NpbyBAj9SV4KBPW+xhGdsybE7muIMPstwK9RPH/RZfdUGLuc
 79jQXal9HMe42igZCtRezAE3VbXSuyCwiJ0pwFTASMdOVQZUtMdf6wCF0GHvI2Wdrif8
 nY8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=09+OZY0MO5bnMgqYdcklnL95CtjCA0G+15DEhlIQKlg=;
 b=7dLm7SnMwZId1jRf1huTOJq0nBgQdI1EMjWVvAOaEpxrL7oVIEsHIeOuGqE1bHwTnj
 0ZexhNfKQwv9kG6QIwASq+T+VYtqeC2LzkoD0C2UdpENMuV96eCr5mcydRlo12b75iC6
 vV2oNaBWsCtQMbno4lOL1+p1cJVrX4bRiqjfDGS9QU/GMAIRE3LopqvQ4Lmg6NXlwMBB
 gSn5vA3+OeeLJTpA/VJGh2SGfqBPKDpi3UXKw8VRP7QAsOmAEFX12UWe1PZKzY6bbHHN
 4QQzIZdHmxAVx5rHZzn26dYIJdw68RyF2auTrHKIBhOVDAD9dkFUTaRj47dLxg6xokzb
 xN+Q==
X-Gm-Message-State: AOAM531XaTJP2ypKDBp4OCspQlAQ1PSXsLAfXSrAQNeNQq/9RAvl9vGn
 QubJh9hBxaI5GFQ6lFqHBqE=
X-Google-Smtp-Source: ABdhPJxctHq1eFv5hEg6ns7JyOQ2qTsY4BvtkS/6mEfHHmlwq34b02bIRbwbJOTcqTkSICcT1dp8FA==
X-Received: by 2002:adf:ebc1:0:b0:1e6:1109:5a1c with SMTP id
 v1-20020adfebc1000000b001e611095a1cmr18151995wrn.228.1647871144003; 
 Mon, 21 Mar 2022 06:59:04 -0700 (PDT)
Received: from able.fritz.box (p5b0eab60.dip0.t-ipconnect.de. [91.14.171.96])
 by smtp.gmail.com with ESMTPSA id
 m3-20020a5d6243000000b001e33760776fsm13317640wrv.10.2022.03.21.06.59.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Mar 2022 06:59:03 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel.vetter@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 07/23] drm/vmwgfx: stop using dma_resv_excl_fence
Date: Mon, 21 Mar 2022 14:58:40 +0100
Message-Id: <20220321135856.1331-7-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220321135856.1331-1-christian.koenig@amd.com>
References: <20220321135856.1331-1-christian.koenig@amd.com>
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
Cc: VMware Graphics <linux-graphics-maintainer@vmware.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Instead use the new dma_resv_get_singleton function.

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: VMware Graphics <linux-graphics-maintainer@vmware.com>
Cc: Zack Rusin <zackr@vmware.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_resource.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
index 708899ba2102..36c3b5db7e69 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
@@ -1165,8 +1165,10 @@ int vmw_resources_clean(struct vmw_buffer_object *vbo, pgoff_t start,
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

