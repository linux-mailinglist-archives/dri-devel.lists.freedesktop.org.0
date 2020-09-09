Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C0372626C1
	for <lists+dri-devel@lfdr.de>; Wed,  9 Sep 2020 07:29:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F4F76E96E;
	Wed,  9 Sep 2020 05:29:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3D736E96E;
 Wed,  9 Sep 2020 05:29:13 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id n14so1142093pff.6;
 Tue, 08 Sep 2020 22:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id;
 bh=1G9PTO00jnlOb0OdBNoipBU+IjJp1bIlfQXTQBpTt3o=;
 b=a3j7TQgvH8Ny6QPtjUfvhBi8Be1DcH/wJ5Dayhyb14jfwUxwaAs6qo5GgAVlOxl/sJ
 +jmZqmHz9/+JMpI/AgAGTXnkgpRJOgt+eJphy5+oAVXUnBgRp5K2s6KxJnEeaWvFFUmD
 7Ca61ybt3AJAq8GSEn5jzuytePq6ByU4Is7EUyQAlIzCZ0qOaf18GNr4bNTpzFGUvtMM
 HLLumR5s4bIyMlu4L36sZhOyQy/4tpxfuccZxjFY0IAUFUbR43kdp9Lxh6D1drDH2oxr
 /QakfOnsG3om2Y7Kg/NCprYiQxi1a2Mz4EpQsZI5/SVs0184Umr/EdQ/GM6aw0+WqEKf
 E1Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
 bh=1G9PTO00jnlOb0OdBNoipBU+IjJp1bIlfQXTQBpTt3o=;
 b=I5/9gj3nZg3ZNic/I1my2+yrKujyP8kfqcPU9rK32UJyAmz/44AzIHsHYzQbYae9bU
 JsZxm3xiIFOv8AsoXvZyQNj70el4tCM6w9svvvPqXM0ilyvivVWCRWfBph7tJzeFV8wv
 WkQOCAto12hsAXMWfRQDSbjvA0aXWUG8u6ZJpR5Q+rbr5CeuzQHZVECaVvv/8QZ/zH17
 bYYJeKVMJI9sWK9q4NeefySBUj7bLKaxr8Rkc+PISrStVpv9YLWkYXrsJFm9bLmIvj2E
 lLqN9EZ901sqonbONUfg9Owouukds4Eoeiy2wSAgjswADhEkP0Wnj16nVzztigsxo+IM
 Yx+A==
X-Gm-Message-State: AOAM532vQzS2RtqFXKPlJ8CdlQn3KUqpET5esho3/lctjxEUAvTQTm/O
 /lORD2BXVvyXLeUp2jDlIXW9/fyecgPkIw==
X-Google-Smtp-Source: ABdhPJxDNxMq6Cak3QiwwG0r8Bu3ou6YWB02N5u0VMz6qkv74PYgKMyiNSE0Xxz0oUqEBStauC+kOQ==
X-Received: by 2002:a62:3007:0:b029:13c:1611:6526 with SMTP id
 w7-20020a6230070000b029013c16116526mr2325805pfw.6.1599629353402; 
 Tue, 08 Sep 2020 22:29:13 -0700 (PDT)
Received: from software.domain.org ([45.77.13.216])
 by smtp.gmail.com with ESMTPSA id mt8sm790024pjb.17.2020.09.08.22.29.10
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 08 Sep 2020 22:29:12 -0700 (PDT)
From: Huacai Chen <chenhc@lemote.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>
Subject: [PATCH 1/2] drm/radeon: Don't use WC for VRAM if !RADEON_GEM_GTT_WC
Date: Wed,  9 Sep 2020 13:29:10 +0800
Message-Id: <1599629351-17937-1-git-send-email-chenhc@lemote.com>
X-Mailer: git-send-email 2.7.0
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
Cc: Huacai Chen <chenhc@lemote.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Though RADEON_GEM_GTT_WC is initially used for GTT, but this flag is
bound to drm_arch_can_wc_memory(), and if arch doesn't support WC, then
VRAM should not use WC.

Signed-off-by: Huacai Chen <chenhc@lemote.com>
---
 drivers/gpu/drm/radeon/radeon_object.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_object.c b/drivers/gpu/drm/radeon/radeon_object.c
index f3dee01..07b82d9 100644
--- a/drivers/gpu/drm/radeon/radeon_object.c
+++ b/drivers/gpu/drm/radeon/radeon_object.c
@@ -117,10 +117,16 @@ void radeon_ttm_placement_from_domain(struct radeon_bo *rbo, u32 domain)
 						     TTM_PL_FLAG_VRAM;
 		}
 
-		rbo->placements[c].fpfn = 0;
-		rbo->placements[c++].flags = TTM_PL_FLAG_WC |
-					     TTM_PL_FLAG_UNCACHED |
-					     TTM_PL_FLAG_VRAM;
+		if (rbo->flags & RADEON_GEM_GTT_WC) {
+			rbo->placements[c].fpfn = 0;
+			rbo->placements[c++].flags = TTM_PL_FLAG_WC |
+						     TTM_PL_FLAG_UNCACHED |
+						     TTM_PL_FLAG_VRAM;
+		} else {
+			rbo->placements[c].fpfn = 0;
+			rbo->placements[c++].flags = TTM_PL_FLAG_UNCACHED |
+						     TTM_PL_FLAG_VRAM;
+		}
 	}
 
 	if (domain & RADEON_GEM_DOMAIN_GTT) {
-- 
2.7.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
