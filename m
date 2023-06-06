Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D118C724FB0
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 00:32:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9DCC10E3F6;
	Tue,  6 Jun 2023 22:32:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D242910E3F2
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jun 2023 22:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686090732;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N2u1hP2d/8CjIhjRb+gqUMgVIAuG2+DtyciZrujYDGU=;
 b=OX2TGK7a9+sO4Vw9bEJh0Ngg4LVkOxtaZDT5SVBMVaUwRxzvcwN5HnqWLPz5dv5R+vCw0z
 372jbtnFVWR9htRnq/EA7rdKMRWRpVOgNT3gJ9tMstYgs+iI1ngh9bpQ+IBi15VPRKsULY
 5SxKDzoQ7btUt44P5Ku+a7X0aX3Bizk=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-284-MTmmHeIVMM6vGyeuc5Knjg-1; Tue, 06 Jun 2023 18:32:08 -0400
X-MC-Unique: MTmmHeIVMM6vGyeuc5Knjg-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-977c8170b52so370578666b.0
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jun 2023 15:32:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686090727; x=1688682727;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N2u1hP2d/8CjIhjRb+gqUMgVIAuG2+DtyciZrujYDGU=;
 b=k8R5GT9JPNVS7g/SmEw1NW8i2kV02DLC7YtPBbhfdo+g2plYMPjpdJWnTi5rdJDbm/
 TBDDJiSVs4C32h97sHYQc9m0LElz9zA6zC1bGuYm04kN5QG+vSQm2jHYKcuNW+MoI97V
 5F/nOaOE39cauqCCAZyL3j9Pqb2WfCEGZDoZ/yfjArt+Ot6eJFVXUKhxFsu3VW2p+zp1
 ECRgJAX0fCVBKNIvdfbsUQFla3bjPKJP3UPXsaiveubN+rIQ4TGfVJrpw0elV3XKwOKx
 KUN8wPnlMRN/fU+2mdyZuEIgSJ+g411Gukc2W7HEbj5NhPrl1a6cCkjDZkP6w+ZFOINg
 kz0g==
X-Gm-Message-State: AC+VfDxj55gRDt5hOMuHqnfkhR5tX9EBUQMrLQimNH/sW8Rk0YgCCUZE
 njiKnXq0wLm7RRx4jowk08D4HEqJwg3plRe17AmxaxZ4QXMr+UlB5iyt6J+kEsWC9qB8o6L3r82
 Z13ygeWkYuNp4C06yZgRXqtvAw2O/
X-Received: by 2002:a17:907:9444:b0:978:70e1:f02b with SMTP id
 dl4-20020a170907944400b0097870e1f02bmr3019205ejc.75.1686090727629; 
 Tue, 06 Jun 2023 15:32:07 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ60EgMsVBlpBGdwrOsxpVWKELnoC+Mm9sVNrrUUkpw45lXY27cxGTST5LbhjokUCldhqWhttw==
X-Received: by 2002:a17:907:9444:b0:978:70e1:f02b with SMTP id
 dl4-20020a170907944400b0097870e1f02bmr3019183ejc.75.1686090727413; 
 Tue, 06 Jun 2023 15:32:07 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 j19-20020a170906255300b00977cd6d2127sm4018465ejb.6.2023.06.06.15.32.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jun 2023 15:32:07 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de,
 mripard@kernel.org, corbet@lwn.net, christian.koenig@amd.com,
 bskeggs@redhat.com, Liam.Howlett@oracle.com, matthew.brost@intel.com,
 boris.brezillon@collabora.com, alexdeucher@gmail.com, ogabbay@kernel.org,
 bagasdotme@gmail.com, willy@infradead.org, jason@jlekstrand.net
Subject: [PATCH drm-next v4 07/14] drm/nouveau: bo: initialize GEM GPU VA
 interface
Date: Wed,  7 Jun 2023 00:31:23 +0200
Message-Id: <20230606223130.6132-8-dakr@redhat.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230606223130.6132-1-dakr@redhat.com>
References: <20230606223130.6132-1-dakr@redhat.com>
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
 linux-mm@kvack.org, Danilo Krummrich <dakr@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Initialize the GEM's DRM GPU VA manager interface in preparation for the
(u)vmm implementation, provided by subsequent commits, to make use of it.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_bo.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 7724fe63067d..057bc995f19b 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -215,11 +215,14 @@ nouveau_bo_alloc(struct nouveau_cli *cli, u64 *size, int *align, u32 domain,
 	nvbo = kzalloc(sizeof(struct nouveau_bo), GFP_KERNEL);
 	if (!nvbo)
 		return ERR_PTR(-ENOMEM);
+
 	INIT_LIST_HEAD(&nvbo->head);
 	INIT_LIST_HEAD(&nvbo->entry);
 	INIT_LIST_HEAD(&nvbo->vma_list);
 	nvbo->bo.bdev = &drm->ttm.bdev;
 
+	drm_gem_gpuva_init(&nvbo->bo.base);
+
 	/* This is confusing, and doesn't actually mean we want an uncached
 	 * mapping, but is what NOUVEAU_GEM_DOMAIN_COHERENT gets translated
 	 * into in nouveau_gem_new().
-- 
2.40.1

