Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD0B466192
	for <lists+dri-devel@lfdr.de>; Thu,  2 Dec 2021 11:38:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60A576EB17;
	Thu,  2 Dec 2021 10:38:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09A196EB17
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Dec 2021 10:38:32 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id 137so22624028wma.1
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Dec 2021 02:38:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yUuUZ5lL4gU0D/CEhS68cNvEv4fc0BxGT8NCpICNU9U=;
 b=Oy/hXZ+fx3Pv712/+xZZS66JR8Gb94hUcz5EjlDTvJp48Y5t62MduGxsiT6UCZl1Gr
 XXOT8iX0j7aRo5t65gPaWO6vX9s/8c5wu0CJFhYb1qMkd95Tp1xnbhOBUlo2tRdLEYUs
 HcSE9RdKkoFFo5dwhhxNieyDZX7C8F2qVx9lYMM8Ujq1sFJslmKi5Ge7addl+3ded0YL
 D04uJxo0iUkuMn1+kT7wyDtcn5KzkFZXz8aC9LQA9oAvaeJpXKT1ALoWXjQoJ58HBCjp
 qVD4VdtpP6LVtYgXhMX5SI4z7sV/lzGKIqAg30U0IlfCKTOvKcXyLbX9q0NOQHxIRort
 IPVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yUuUZ5lL4gU0D/CEhS68cNvEv4fc0BxGT8NCpICNU9U=;
 b=Eido5mb9t4JDTku9i/eBWRAz7OVjjL7sulpaFMlK3fhHUpiwKcYhi0QiamMjcxjTPv
 qmJ18g00hkkiJ1KHZML1sMhnslpCVJbWFCl0f7WlnGyZ6RTlFJb99zmi26pclTbnbf5d
 NPZP6WytrzQGc2fpRc4XJssnm3iI2pS27kMndv64JqbNAP4jtRZoi6owCx6xpmuAZvoT
 PkaAGXIy4VTzIiVBG4Bvfrnka5bopTpjuAOqqvaFx/JUqSAekIxL4Bz32H7qgLrJKqDm
 GcxO9Z/4rjnPMFQuw3iTCCWOww2mc3lplgu+OEsLIcfwW1i3vt5FTmJGodD/VcpCvRah
 oPHA==
X-Gm-Message-State: AOAM531sMglJ0+/B3lDo605Sr1W5PERS6HXp/ocSDdfS/KDdY8tlYQHB
 OhzzgH+QhIrpNFDt/6tISMcIGRqSU8I=
X-Google-Smtp-Source: ABdhPJwMakaI+JtOSOodsgtl7+cNFoWsnU0WA+NlU5vHjQrh1xiloiCLuNS63wGNHxaEPe3RrpKudA==
X-Received: by 2002:a05:600c:3c9b:: with SMTP id
 bg27mr5220637wmb.163.1638441510568; 
 Thu, 02 Dec 2021 02:38:30 -0800 (PST)
Received: from abel.fritz.box (p57b0b77b.dip0.t-ipconnect.de. [87.176.183.123])
 by smtp.gmail.com with ESMTPSA id u23sm1783297wmc.7.2021.12.02.02.38.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Dec 2021 02:38:30 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: xinhui.pan@amd.com,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/ttm: fix ttm_bo_swapout
Date: Thu,  2 Dec 2021 11:38:28 +0100
Message-Id: <20211202103828.44573-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit 7120a447c7fe ("drm/ttm: Double check mem_type of BO while eviction")
made ttm_bo_evict_swapout_allowable() function actually check the
placement, but we always used a dummy placement in ttm_bo_swapout.

Fix this by using the real placement instead.

Signed-off-by: Christian König <christian.koenig@amd.com>
Fixes: 7120a447c7fe ("drm/ttm: Double check mem_type of BO while eviction")
---
 drivers/gpu/drm/ttm/ttm_bo.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 739f11c0109c..047adc42d9a0 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -1103,7 +1103,7 @@ int ttm_bo_swapout(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
 	 * as an indication that we're about to swap out.
 	 */
 	memset(&place, 0, sizeof(place));
-	place.mem_type = TTM_PL_SYSTEM;
+	place.mem_type = bo->resource->mem_type;
 	if (!ttm_bo_evict_swapout_allowable(bo, ctx, &place, &locked, NULL))
 		return -EBUSY;
 
@@ -1135,6 +1135,7 @@ int ttm_bo_swapout(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
 		struct ttm_place hop;
 
 		memset(&hop, 0, sizeof(hop));
+		place.mem_type = TTM_PL_SYSTEM;
 		ret = ttm_resource_alloc(bo, &place, &evict_mem);
 		if (unlikely(ret))
 			goto out;
-- 
2.25.1

