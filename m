Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 008FB75A32D
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 02:15:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F148C10E53D;
	Thu, 20 Jul 2023 00:15:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4508410E534
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 00:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689812120;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cJWbnZRk37PbyOPLbQx6TkJaNwAsU77I+1I9gnkS+kQ=;
 b=SgZJD2sjgNLOpumpzpey8ahCsxhbGxWe72LRlNNUMmy1vNojYo++NLxl5ajk/m2OXH8SVu
 QvxA9XDuzFYJgqPXWsFus56V++Z37dUdtCMg53CF4tHgDJzOCpAjgfMR0FliqnikioB93L
 A8mfuDx0HZCtJebVeTqkFa+j6bYjTdA=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-213-2SYsf3XPP0Cv_JcT0vhBpg-1; Wed, 19 Jul 2023 20:15:19 -0400
X-MC-Unique: 2SYsf3XPP0Cv_JcT0vhBpg-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-997d069a914so15016066b.1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 17:15:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689812118; x=1692404118;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cJWbnZRk37PbyOPLbQx6TkJaNwAsU77I+1I9gnkS+kQ=;
 b=d8JLj3HDEW3D9YiaOJ9UrrmVPuLlOusWZ87sjOjJBob2ASYz1cIhc2nbg/ydUmOOVb
 B/lcVyavf3MTZj/zQCyb7Nt75Zj1YLQ2QMGWbXDEDJNVlZSll3qOJ3tTa1+IcV0KYmSE
 DstnC3Rz58n4b7kqcPw65mbPf6ALBI/rMgE/yyHJm1ehFIrYDVIXf+U5ICrwHk7K8rx+
 UMrTnZR8n3Cyb3QsidFGWptKZTVcMIGe39HaZnroricAzKowPojyZenLey2htW0qXBxp
 bl0oTG67or3TXtBDg6kMsnl1GgAPMFZMp85ORHHg2LPk5sAUNurKFeBovbTSIswELDTB
 mqgA==
X-Gm-Message-State: ABy/qLZyrj1rpRyNYGs+vCI8ORyXdzs10oWvja4qcI6AX7nqzoOi5aAx
 FWAYuYRosuxZOUgmslDwTlt6AseRw/W5D+IG9Pe2eqF2KuIqoIlFMcmh1sHHgGH0JvxvXcrR1Eh
 v+GjsW0yOupsT6Lr0D+SEiBsgGUtN
X-Received: by 2002:a17:907:da6:b0:992:b928:adb3 with SMTP id
 go38-20020a1709070da600b00992b928adb3mr901034ejc.54.1689812117996; 
 Wed, 19 Jul 2023 17:15:17 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHa8q78eRCT9mzZQfSzXoKE/kSwuJuwQ3ITBz9WxHl26tCWAX/ns/AgxlMnhDJjuuJMUh0tUQ==
X-Received: by 2002:a17:907:da6:b0:992:b928:adb3 with SMTP id
 go38-20020a1709070da600b00992b928adb3mr901023ejc.54.1689812117799; 
 Wed, 19 Jul 2023 17:15:17 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 gz5-20020a170906f2c500b0099b48ad487asm718119ejb.93.2023.07.19.17.15.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jul 2023 17:15:17 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de,
 mripard@kernel.org, corbet@lwn.net, christian.koenig@amd.com,
 bskeggs@redhat.com, Liam.Howlett@oracle.com, matthew.brost@intel.com,
 boris.brezillon@collabora.com, alexdeucher@gmail.com, ogabbay@kernel.org,
 bagasdotme@gmail.com, willy@infradead.org, jason@jlekstrand.net,
 donald.robson@imgtec.com
Subject: [PATCH drm-misc-next v8 05/12] drm/nouveau: bo: initialize GEM GPU VA
 interface
Date: Thu, 20 Jul 2023 02:14:26 +0200
Message-ID: <20230720001443.2380-6-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230720001443.2380-1-dakr@redhat.com>
References: <20230720001443.2380-1-dakr@redhat.com>
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

