Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE0A4EABD8
	for <lists+dri-devel@lfdr.de>; Tue, 29 Mar 2022 13:03:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB9A510EFF2;
	Tue, 29 Mar 2022 11:03:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADDB910EFF0
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 11:03:02 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id h4so12472800edr.3
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 04:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=u5x/drmbH/vD4w2V/h+YAGK5Zzz4ELYc8AnPi7W94+I=;
 b=Wn/d5tPYF1FU1zkYsvkgPU+GXJDnKCuvDg9Cihl0OeONeiPNZeQ/nEAiphKjLpkZpy
 8Q/DI6zOmMX8NG2eyZ/dYocruCFXCjc+2CPfszStgXR0t5jnNA/4K1i4IHaaGPhMI81i
 qMEwDavndVemZa+flFtqQVDsrbF+4Z/fp65RTFxo7AuimaOnPqaUgPjR6jD6dpyyssDg
 IzLMiqDTY8Gy4YzbOa9Y24aj71apxCBhcIfPPGOUUlcdns5PWWEImd817rMmMeCTiLhT
 Nxk9oEVtjF2U8q63bJMP6d4ka0s2StJcFfs9B05jHSB7H53TAVh3xUe1TudJG65Zo66u
 nIFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=u5x/drmbH/vD4w2V/h+YAGK5Zzz4ELYc8AnPi7W94+I=;
 b=AMs7UgJDxv+Mon8XzR140xuwbP5NWAKEsODsSwQ09B4ikqp2HdLszSehB4+2wfulgB
 ijpEWCmIM3Yn3GC9NYpvDZdEgplwKYUag1pyoggCbjQxvzTBWNWfLYTy0WUaYPm3BVvI
 BGR3lfGDTfeuB1t5Wrq05aG5X9PaiAv7sY/Glu2Nxw2zx2H7Sq954TwtaQqnrtH+9+68
 UPKFFBKUXeDu0OpsgPhEkAveBtEtWdic7I/5mPmobY1j9KViyqAQS9m4yXPS/UWasiTV
 1VrgHKPEZn3Fs2MAnF51Ilfso/DGsmI8G2stK9mmk2PP9MT2/keQAQlOLqpuyprjQQP2
 qYCA==
X-Gm-Message-State: AOAM532591Ab7ceu6dG2lDa65DLqFAkE2F5Vbde6Ncj5zQhn05L0wcqH
 WG74bWh8V95akYvP+W5E0PI=
X-Google-Smtp-Source: ABdhPJwl42Ax3P7mT01XiKsJG8Fd1LCAi3ShQxPzUARC94JWwWp5fgUvg9Cj47Z2DmPJHh8M/j48ww==
X-Received: by 2002:a05:6402:1d55:b0:419:992b:9286 with SMTP id
 dz21-20020a0564021d5500b00419992b9286mr3695275edb.235.1648551781297; 
 Tue, 29 Mar 2022 04:03:01 -0700 (PDT)
Received: from able.fritz.box (p5b0eab60.dip0.t-ipconnect.de. [91.14.171.96])
 by smtp.gmail.com with ESMTPSA id
 h20-20020a1709060f5400b006d6d54b9203sm6958402ejj.38.2022.03.29.04.03.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Mar 2022 04:03:00 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: bob.beckett@collabora.com,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 10/11] drm/ttm: stop allocating dummy resources during BO
 creation
Date: Tue, 29 Mar 2022 13:02:42 +0200
Message-Id: <20220329110243.6335-11-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220329110243.6335-1-christian.koenig@amd.com>
References: <20220329110243.6335-1-christian.koenig@amd.com>
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

That should not be necessary any more when drivers should at least be
able to handle the move without a resource.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index bd001fdde9fb..9d40641dcf39 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -956,7 +956,6 @@ int ttm_bo_init_validate(struct ttm_device *bdev, struct ttm_buffer_object *bo,
 			 struct sg_table *sg, struct dma_resv *resv,
 			 void (*destroy) (struct ttm_buffer_object *))
 {
-	static const struct ttm_place sys_mem = { .mem_type = TTM_PL_SYSTEM };
 	int ret;
 
 	kref_init(&bo->kref);
@@ -975,12 +974,6 @@ int ttm_bo_init_validate(struct ttm_device *bdev, struct ttm_buffer_object *bo,
 		bo->base.resv = &bo->base._resv;
 	atomic_inc(&ttm_glob.bo_count);
 
-	ret = ttm_resource_alloc(bo, &sys_mem, &bo->resource);
-	if (unlikely(ret)) {
-		ttm_bo_put(bo);
-		return ret;
-	}
-
 	/*
 	 * For ttm_bo_type_device buffers, allocate
 	 * address space from the device.
-- 
2.25.1

