Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 584A57707CC
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 20:24:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2498110E750;
	Fri,  4 Aug 2023 18:24:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0119910E74A
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 18:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1691173478;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uwdeGZqElHaeNok5koZwxqm81zQwPAs60eGGyV3zg50=;
 b=NxnfWZhWTuFSr0AceaDeOeIyvPtFtSTvsLtK+5+7nCgYjB71g9ijunoh7k2rdFIMYD49Vj
 QAJ7M2njVA9mYVZ9FLitOG50Q3esydyXh29QqyhuuLPtLVdqAJCR5y3BYS5WTA23jDB4uR
 Hgu+KElFvAhlcSkCCruTxfrLh9v7M2M=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-584-dxwABnMxPze4j27Q39S1dA-1; Fri, 04 Aug 2023 14:24:36 -0400
X-MC-Unique: dxwABnMxPze4j27Q39S1dA-1
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-99c8bbc902eso90240866b.1
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Aug 2023 11:24:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691173474; x=1691778274;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uwdeGZqElHaeNok5koZwxqm81zQwPAs60eGGyV3zg50=;
 b=KOGxk2hxWPWhuRkmv1OEEVrWKoQ0kHerkm8TAGNvdCCKIjiPXJWuv8/46UrUk7BCQX
 LX+LZ6AhDfxx/6AyTRILW1r0WB4vzoMCb+pXe3bakZNTzY8SxRm8V+8zq2JS+7e89068
 E+EfM2UXuOT9XZt0QKebD0HWuANFn8wq47vknzKxVoArwsrf/ZVOEVmTtCwp60YqnArh
 Nrd6cS6Yy94QDxFMUZtChejoLcTrBcMe4a2/L+Q0ZAK7sI+vGoDoHwkODhXFo8To7Img
 bxZsl3A37IKBCC7cqQ6kCqpwi4fApYrJMp6zt/TF5BBadUozzipAB0LqOoa3Cy8YI+wW
 rDQw==
X-Gm-Message-State: AOJu0YysfP2Hi15qZ/8TO19HO4cBVlSWGDcOAykUxEY+fc267N6/aIKa
 H2pTofIs3CUdTmgSzQJaEDrInHPfUKsQVVndZIVM4yWGv7kE+ncOsQJQQYd6bcYGglBtTckaALb
 V3RbRkIaJb3cY8oR1xuJrDzluDrF9ixVpao3Y
X-Received: by 2002:a17:906:5a5c:b0:99b:65fa:e30f with SMTP id
 my28-20020a1709065a5c00b0099b65fae30fmr2089705ejc.1.1691173474210; 
 Fri, 04 Aug 2023 11:24:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEEryZP9aoJVNn8MC19nvMnlJKcLY3kuJDlB/w4c0Aec7ZI6lMZWBxZ3bUEK2krqN5p5MUOQw==
X-Received: by 2002:a17:906:5a5c:b0:99b:65fa:e30f with SMTP id
 my28-20020a1709065a5c00b0099b65fae30fmr2089692ejc.1.1691173474066; 
 Fri, 04 Aug 2023 11:24:34 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 gs2-20020a170906f18200b00992b71d8f19sm1643966ejb.133.2023.08.04.11.24.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Aug 2023 11:24:33 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de,
 mripard@kernel.org, corbet@lwn.net, christian.koenig@amd.com,
 bskeggs@redhat.com, Liam.Howlett@oracle.com, matthew.brost@intel.com,
 boris.brezillon@collabora.com, alexdeucher@gmail.com, ogabbay@kernel.org,
 bagasdotme@gmail.com, willy@infradead.org, jason@jlekstrand.net,
 donald.robson@imgtec.com
Subject: [PATCH drm-misc-next v10 05/12] drm/nouveau: bo: initialize GEM GPU
 VA interface
Date: Fri,  4 Aug 2023 20:23:45 +0200
Message-ID: <20230804182406.5222-6-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230804182406.5222-1-dakr@redhat.com>
References: <20230804182406.5222-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: linux-doc@vger.kernel.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Danilo Krummrich <dakr@redhat.com>, Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Initialize the GEM's DRM GPU VA manager interface in preparation for the
(u)vmm implementation, provided by subsequent commits, to make use of it.

Reviewed-by: Dave Airlie <airlied@redhat.com>
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_bo.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 7724fe63067d..6130c99b6b2c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -215,6 +215,7 @@ nouveau_bo_alloc(struct nouveau_cli *cli, u64 *size, int *align, u32 domain,
 	nvbo = kzalloc(sizeof(struct nouveau_bo), GFP_KERNEL);
 	if (!nvbo)
 		return ERR_PTR(-ENOMEM);
+
 	INIT_LIST_HEAD(&nvbo->head);
 	INIT_LIST_HEAD(&nvbo->entry);
 	INIT_LIST_HEAD(&nvbo->vma_list);
@@ -339,6 +340,11 @@ nouveau_bo_new(struct nouveau_cli *cli, u64 size, int align,
 	dma_resv_init(&nvbo->bo.base._resv);
 	drm_vma_node_reset(&nvbo->bo.base.vma_node);
 
+	/* This must be called before ttm_bo_init_reserved(). Subsequent
+	 * bo_move() callbacks might already iterate the GEMs GPUVA list.
+	 */
+	drm_gem_gpuva_init(&nvbo->bo.base);
+
 	ret = nouveau_bo_init(nvbo, size, align, domain, sg, robj);
 	if (ret)
 		return ret;
-- 
2.41.0

