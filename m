Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F56075295D
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 19:05:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95F3510E738;
	Thu, 13 Jul 2023 17:05:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57AF410E727
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 17:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689267902;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cJWbnZRk37PbyOPLbQx6TkJaNwAsU77I+1I9gnkS+kQ=;
 b=OARbj+INUeLxH0XebIpNWwqkUYLn/XW+BT09829M2EU+W4DDuEf6fCfs7uThSQibYZZsId
 BAcpq8+ffW5B+StvyvimELduJEjdj4RuLzqJxqyGvDZ4S0n4S5l56lkVBoxEMQLcXYQT3A
 U153nh1PWqbdkn+ZBPpxAnNRR0OGI5o=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-29--rSKu98NOVqD68MSuvuvNg-1; Thu, 13 Jul 2023 13:05:00 -0400
X-MC-Unique: -rSKu98NOVqD68MSuvuvNg-1
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-993d41cbc31so57468566b.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 10:05:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689267900; x=1691859900;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cJWbnZRk37PbyOPLbQx6TkJaNwAsU77I+1I9gnkS+kQ=;
 b=MEbLnpsIeInDMLDdcIga5qvNloGdLSX4XgOpxJntjDQweFxo/GmAHXVG7oLgSIWpuI
 AylYGDPoVQ+AdAEEOlLtuAspmKdIeeUxjpakHTDJ0ZUuoG2WrW+Mm6H9P8mS4PLVHpjA
 LJVnBGc3UusIUff0XvaYZ/16078rWGld3VnfSR4b+gZYHFKtFdezgRWLduuNgcJ3HQ+k
 KKqYXNP9g2jxW8T0flyueRlHdT/eUfDXTsJ4d64ilZG/Xo4am/nuW9vyqgBDsp6vRbNN
 3o3inSnJCs/Z9tTFk+Eld7jduelCKzfjO6EH+nZKiQ8ogAodwt92zoK1gbf/ydHPaG+e
 n10w==
X-Gm-Message-State: ABy/qLZfv6kTrixngnkdjz9Gcj5Br3ehdq1o+mPhdRexiwRbaqw6xSKi
 rTGbSymUPMVqxkMpfJVt3WQkrp6jHrkUc1GVSnsw4s+WhecjlkeLq7DziDu46R5XlS0beJPdBUd
 NIV4yDjaXCS4OqGOWce91NiRK2Ba3
X-Received: by 2002:a17:906:113:b0:987:fe18:1c56 with SMTP id
 19-20020a170906011300b00987fe181c56mr2115243eje.47.1689267899913; 
 Thu, 13 Jul 2023 10:04:59 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEGCyQeuogsjgxDVJKFBZEg08N1OVXBkYa73JHbS/zCbYQKSeo62Zql1FBRS0FoBHej2bCLIA==
X-Received: by 2002:a17:906:113:b0:987:fe18:1c56 with SMTP id
 19-20020a170906011300b00987fe181c56mr2115221eje.47.1689267899743; 
 Thu, 13 Jul 2023 10:04:59 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 t9-20020a1709064f0900b00992a8a54f32sm4244576eju.139.2023.07.13.10.04.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jul 2023 10:04:59 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de,
 mripard@kernel.org, corbet@lwn.net, christian.koenig@amd.com,
 bskeggs@redhat.com, Liam.Howlett@oracle.com, matthew.brost@intel.com,
 boris.brezillon@collabora.com, alexdeucher@gmail.com, ogabbay@kernel.org,
 bagasdotme@gmail.com, willy@infradead.org, jason@jlekstrand.net,
 donald.robson@imgtec.com
Subject: [PATCH drm-next v7 06/13] drm/nouveau: bo: initialize GEM GPU VA
 interface
Date: Thu, 13 Jul 2023 19:04:01 +0200
Message-ID: <20230713170429.2964-7-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230713170429.2964-1-dakr@redhat.com>
References: <20230713170429.2964-1-dakr@redhat.com>
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
Cc: nouveau@lists.freedesktop.org, Danilo Krummrich <dakr@redhat.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org
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
2.41.0

