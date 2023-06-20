Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66CC37360AF
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 02:43:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD6EA10E241;
	Tue, 20 Jun 2023 00:43:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AB8610E23E
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 00:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1687221783;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N2u1hP2d/8CjIhjRb+gqUMgVIAuG2+DtyciZrujYDGU=;
 b=OKX1MvwDR7WaJrzgDUBKN0gYhmXR/v1Imo6TftmfSiZ4ZltiFu2B63InxSXGaeuNOVNqhm
 mIMTzD6TkqPXyhHaQ5sCBF6FuB1+AU+KdXAsk56Ju6KAXJYlA35Utz2rwDPFL31xLLkTwd
 Yd6rK4xMJANhDTlSnfnQgRP0L914or8=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-643-pgP-Wp_GMXSJ2S2e9Z93Iw-1; Mon, 19 Jun 2023 20:43:00 -0400
X-MC-Unique: pgP-Wp_GMXSJ2S2e9Z93Iw-1
Received: by mail-ed1-f70.google.com with SMTP id
 4fb4d7f45d1cf-51a5b073299so664804a12.3
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jun 2023 17:43:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687221779; x=1689813779;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N2u1hP2d/8CjIhjRb+gqUMgVIAuG2+DtyciZrujYDGU=;
 b=AwwJSFJ7Vf+YeMr/xZCKICE7RgCFCwKIWThecDP1WpSTOhR/r8Z0NWdVf7tJdlS4Yg
 0Bh3NyLQWCWGGZP8KRRdIDqVF9pLmdtBo2U3H7vtFadE5mx0LraJVgGX2VJ7CasuBKN7
 dG5z4fCphWUp3m07YRAolCuIGnRIKiNUpKOFIN/xzsxZolKtAYoWogMIUlwh2gsIqX7p
 MilljiWeeIavGXGSFCXlG0r5L9thLkWED6uwoSyOYlLsJ+YCbuvCj6dFX/MW+/acs2Kt
 QbYuC6W9H9V3oyEQxgSV3YdAAUMNtMtZckUmL7gule7dxBOfZYiWccyxFUXQMdibjPzL
 idWA==
X-Gm-Message-State: AC+VfDxGMglVoGHPvwxPB0zQSz6W6TOEcoWbxUSe7a3QDCwjYK2vIX3v
 rk7x8NbdT7lVTzGoen1lcbChzQymwKjmmEpE4bAKq/qYGTuevapjPN5lWi46JhRnlTP9LkWDIwE
 Bl/5EvPTZ+VMAdKGXmUtgRjfC0kz7
X-Received: by 2002:aa7:cd45:0:b0:514:994c:2982 with SMTP id
 v5-20020aa7cd45000000b00514994c2982mr6151185edw.40.1687221779429; 
 Mon, 19 Jun 2023 17:42:59 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ65FSvnjaoggF9h58zTqyT2DOkL9H5Vbq5o8fo2niPqP1lOxX39BSK0TAWF98v1OjzcZEYMlQ==
X-Received: by 2002:aa7:cd45:0:b0:514:994c:2982 with SMTP id
 v5-20020aa7cd45000000b00514994c2982mr6151166edw.40.1687221779253; 
 Mon, 19 Jun 2023 17:42:59 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 d8-20020a056402078800b005187a42b44fsm310743edy.58.2023.06.19.17.42.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jun 2023 17:42:58 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de,
 mripard@kernel.org, corbet@lwn.net, christian.koenig@amd.com,
 bskeggs@redhat.com, Liam.Howlett@oracle.com, matthew.brost@intel.com,
 boris.brezillon@collabora.com, alexdeucher@gmail.com, ogabbay@kernel.org,
 bagasdotme@gmail.com, willy@infradead.org, jason@jlekstrand.net
Subject: [PATCH drm-next v5 07/14] drm/nouveau: bo: initialize GEM GPU VA
 interface
Date: Tue, 20 Jun 2023 02:42:10 +0200
Message-Id: <20230620004217.4700-8-dakr@redhat.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230620004217.4700-1-dakr@redhat.com>
References: <20230620004217.4700-1-dakr@redhat.com>
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

