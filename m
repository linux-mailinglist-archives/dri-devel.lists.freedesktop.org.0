Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14BD86D55EB
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 03:28:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91AC710E1B9;
	Tue,  4 Apr 2023 01:28:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C86710E28E
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 01:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680571699;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wzrmMp6+aqWo/TvsnNZiIixlQKMUKus548lCDw5p9Z4=;
 b=S4NVLsttjoqb+WYVESdKcUB4uGbuHkcjfDuIs4y4Uxz1kB5dWs7t4YRbNMjesiIZ/jY5K2
 6Z8kLaV6ESSmzrH6hTXh7+3DrXL9wPoUpbs5YyYLYbppJfoi/eYh5FARa0ogj+7dCw+MXM
 TtqOceNgM9YxEzbLarf2l6LZtP4CGmA=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-32-bRaYM7YjO96HiH8Vm0B97g-1; Mon, 03 Apr 2023 21:28:18 -0400
X-MC-Unique: bRaYM7YjO96HiH8Vm0B97g-1
Received: by mail-ed1-f70.google.com with SMTP id
 i22-20020a05640242d600b004f5962985f4so44236824edc.12
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Apr 2023 18:28:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680571697;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wzrmMp6+aqWo/TvsnNZiIixlQKMUKus548lCDw5p9Z4=;
 b=ZDTDOIDZvcVrQK5j/7bkq2K1tHeXVUub1TT5+H00Tj35/aKYRAqZf57y2JnezYQ+qt
 4W/tHY+454z3Yt/QnjYvQFYZgrOsEdDxIUUvYdH1BRS5TcAf0NecNcOGxEoIrlIhgti1
 ZeDaiRW++R9BP+2Bb8Nfm8s8wkXXyfxcDAX4jhik1s+ZW4GfIHMgeogPBHzTV4qAFU/z
 YTKHILdtnlqcKwB2EwuyXh2Z9ZNzgBivTo5gcOJAXT1iLeaz+gakRTCphKdEQsc62PWL
 Wdo0q79llKyuYQ/I13TkqkqwRRjmMGOUpg0ZbK0Q6Lfh/V1h2+x+SLxE/dTUm83a93me
 JlGg==
X-Gm-Message-State: AAQBX9dEC3T//GAa1X8snScWNTXKs9XbnlShKeMWQRI4S7FJbmMcG1pE
 tAWskg5kjh265zWHr9zXXmC4qr3wYaXA8Gzxf+SkkXNWMDKPX1BCTskY53DOQjLS4ZZhBrSpUxD
 zrzefPmFqM1PHjkEQEUKCfT65NKF9
X-Received: by 2002:a17:907:b12:b0:8c3:3439:24d9 with SMTP id
 h18-20020a1709070b1200b008c3343924d9mr549189ejl.24.1680571697341; 
 Mon, 03 Apr 2023 18:28:17 -0700 (PDT)
X-Google-Smtp-Source: AKy350bOuZVfqTuVyFepzGmLZe0Dusjy763ib39Sg1Hu3aDle0xx1it+4Dx6IGT3ClEiv+jGPdjVUA==
X-Received: by 2002:a17:907:b12:b0:8c3:3439:24d9 with SMTP id
 h18-20020a1709070b1200b008c3343924d9mr549180ejl.24.1680571697206; 
 Mon, 03 Apr 2023 18:28:17 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de78:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 w14-20020a170906384e00b00932fa67b48fsm5210797ejc.183.2023.04.03.18.28.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Apr 2023 18:28:16 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de,
 mripard@kernel.org, corbet@lwn.net, christian.koenig@amd.com,
 bskeggs@redhat.com, Liam.Howlett@oracle.com, matthew.brost@intel.com,
 boris.brezillon@collabora.com, alexdeucher@gmail.com, ogabbay@kernel.org,
 bagasdotme@gmail.com, willy@infradead.org, jason@jlekstrand.net
Subject: [PATCH drm-next v3 08/15] drm/nouveau: bo: initialize GEM GPU VA
 interface
Date: Tue,  4 Apr 2023 03:27:34 +0200
Message-Id: <20230404012741.116502-9-dakr@redhat.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230404012741.116502-1-dakr@redhat.com>
References: <20230404012741.116502-1-dakr@redhat.com>
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
2.39.2

