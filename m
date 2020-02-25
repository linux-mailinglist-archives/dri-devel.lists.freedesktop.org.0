Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E03A16EE78
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 19:56:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 620136EB93;
	Tue, 25 Feb 2020 18:56:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc41.google.com (mail-yw1-xc41.google.com
 [IPv6:2607:f8b0:4864:20::c41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AC0189FAC;
 Tue, 25 Feb 2020 18:56:24 +0000 (UTC)
Received: by mail-yw1-xc41.google.com with SMTP id n184so524951ywc.3;
 Tue, 25 Feb 2020 10:56:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TpruaIXBBflTMfnh9Z90Mo/eXVMEZYSzq64zz9on4Y0=;
 b=PgN0nOH3vE3C/xEkP3JWjrGqApjUZlIQUBLgR427nHBEARUwNBOJnvQ01znV/vVPAy
 ac4UIv4BppeIvVggX6s7Oc/ILFKse1AgghzPea/AVGB7RHME5kSlcfs05xZlSw6Yr9GX
 vMHzU/+7DejhBaL2VbeiQEPPFGfJEv6Ayv40hsERAKcxr0WvLMa8OCfFe4+099DuLzhg
 3LZhzBICJFite9W3dKUEunvRrSZ2jLwj2Aug7y+ORQiT2WaCEdhsOPgq1KKqQPbItODR
 BR5lSBC6odmQoqpGXS3msGlvB+RcgOdofmPOSClkCPn5NlPVPnKwIixln+Npc4J03ANB
 8tZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TpruaIXBBflTMfnh9Z90Mo/eXVMEZYSzq64zz9on4Y0=;
 b=lXj8pfqGrRvZWLZc40LJrWTG8Bz19fY0esqsjl21zvjOctArWfQp2Vmd3Uf5q2wU7m
 OEbrCaZ9V+GBc2dNikrsWRw64qswGdjBh/8DGW+FSrVir9yBHAKTo061U+zHG3EP6SbC
 JPQxAjMUXULFs4B7VPJ+27lMcGmIciDwsHI/SAg63akKp36BGPV0yab9rnhjLGCzsgPv
 iCjf34X7EUb8mE6qXaShvaA1OmQy8lLsAvSOVNivkrBUrlv1aiBSuptspRBXDedgSnTs
 C0OcOXepsqsDeLjjqpTjI69e/LyArII3ORECn4irieuFAz8+V1HXYCSlXgrSIli1+m6E
 Mtrw==
X-Gm-Message-State: APjAAAU/zH8XjkpCZmGJP4CEcbTf1IkZ+ZCJoT/0qwsrRQgyCQKMEFiG
 5gwE+UK0byQIF3sYK2bHAKeDEnY8
X-Google-Smtp-Source: APXvYqwlhvRdsti0wCgTK47jaLxH+kFpcXHYxory4W7I7rmc6vHL1BaCBWTVY7uw7fryaHUzBiDptQ==
X-Received: by 2002:a81:44b:: with SMTP id 72mr118349ywe.373.1582656983198;
 Tue, 25 Feb 2020 10:56:23 -0800 (PST)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id s31sm7063149ywa.30.2020.02.25.10.56.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2020 10:56:22 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/ttm: fix leaking fences via ttm_buffer_object_transfer
Date: Tue, 25 Feb 2020 13:56:14 -0500
Message-Id: <20200225185614.1058688-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Ahzo <Ahzo@tutanota.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ahzo <Ahzo@tutanota.com>

Set the drm_device to NULL, so that the newly created buffer object
doesn't appear to use the embedded gem object.

This is necessary, because otherwise no corresponding dma_resv_fini for
the dma_resv_init is called, resulting in a memory leak.

The dma_resv_fini in ttm_bo_release_list is only called if the embedded
gem object is not used, which is determined by checking if the
drm_device is NULL.

Bug: https://gitlab.freedesktop.org/drm/amd/issues/958
Fixes: 1e053b10ba60 ("drm/ttm: use gem reservation object")
Signed-off-by: Ahzo <Ahzo@tutanota.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo_util.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index c8e359ded1df..44c1e7adfb7c 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -514,6 +514,7 @@ static int ttm_buffer_object_transfer(struct ttm_buffer_object *bo,
 		fbo->base.base.resv = &fbo->base.base._resv;
 
 	dma_resv_init(&fbo->base.base._resv);
+	fbo->base.base.dev = NULL;
 	ret = dma_resv_trylock(&fbo->base.base._resv);
 	WARN_ON(!ret);
 
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
