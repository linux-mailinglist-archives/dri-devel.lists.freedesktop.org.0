Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2184F743070
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jun 2023 00:27:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5924010E3EC;
	Thu, 29 Jun 2023 22:27:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1935C10E405
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jun 2023 22:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1688077646;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cJWbnZRk37PbyOPLbQx6TkJaNwAsU77I+1I9gnkS+kQ=;
 b=Zg5jMd74yKw2ytZkJMfM3O17bGUi3IDR1FNR3MILX+KJR7JbMr+qzRHFEExfbEQSGUrCJd
 uPA2NBjvEb9xau1zqF5WU6ot6+hnN9+/dzdsOg6Z81Eesz97+hA8Ebr0FXUI7lBjq7TJag
 oL7NKFtAoo0JMA/kbo3m5pOtRzSvu1g=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-141-81CE7k1pOkG4SN2arfJ1jA-1; Thu, 29 Jun 2023 18:27:25 -0400
X-MC-Unique: 81CE7k1pOkG4SN2arfJ1jA-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-313f10072daso610321f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jun 2023 15:27:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688077644; x=1690669644;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cJWbnZRk37PbyOPLbQx6TkJaNwAsU77I+1I9gnkS+kQ=;
 b=B6HIkJvlgJo3p7vQqfGGfM/7Ip7mjzwRCr6gVQF7G46afLb1qrEn8L3XwzNwFjYpjs
 h5dks3oluYZXSSZGiA8X4b80Lh3HZUwZ3oUvkeXZYrQCwIwSWsQlFSdNuNDIC6EVYoYG
 Pkv7ZTMRy7XamLGqWp1Bwz0XhQVTdPiY8nyIGtMbX9VlYBuUI+pmk7SJjEUN16J4GGgv
 VPcdivYbZCZlCE+1qqZp8RfhUlqTdot6u+YaxokTw2VGkhqJiNFiC0cLfh+f3fsCsIfK
 4HW17b38tEpY3j1QBldpmB5RrFvuJHVhU0YnssNLNFgZ+YQFDjvsryQVAYqIAydVgeYk
 8niw==
X-Gm-Message-State: ABy/qLaf9NgYRwcbmc/8FR//KsHMcIFgwTPULy4OVq6TQropBbiXV7G4
 OOQ0kC+MnpSiK86hFhc8En2zxAZM1VK7xplKxL+ZKSlSzW/iEvArUPXsuWCxVNRsr9vykqtntQu
 wrHcsBgKJEfORad3/A78d4zJjC/qf
X-Received: by 2002:adf:df04:0:b0:313:eeb3:c57a with SMTP id
 y4-20020adfdf04000000b00313eeb3c57amr712060wrl.15.1688077643961; 
 Thu, 29 Jun 2023 15:27:23 -0700 (PDT)
X-Google-Smtp-Source: APBJJlG7GyWmtfFzWGI2T6+X0GNR2UPFhGUrcAEJPnjYpUD/fKQGW/GRkOsPdyF5/34TvCU73KOwJQ==
X-Received: by 2002:adf:df04:0:b0:313:eeb3:c57a with SMTP id
 y4-20020adfdf04000000b00313eeb3c57amr712036wrl.15.1688077643775; 
 Thu, 29 Jun 2023 15:27:23 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 u13-20020a5d514d000000b0030e56a9ff25sm16660739wrt.31.2023.06.29.15.27.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jun 2023 15:27:23 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de,
 mripard@kernel.org, corbet@lwn.net, christian.koenig@amd.com,
 bskeggs@redhat.com, Liam.Howlett@oracle.com, matthew.brost@intel.com,
 boris.brezillon@collabora.com, alexdeucher@gmail.com, ogabbay@kernel.org,
 bagasdotme@gmail.com, willy@infradead.org, jason@jlekstrand.net
Subject: [PATCH drm-next v6 06/13] drm/nouveau: bo: initialize GEM GPU VA
 interface
Date: Fri, 30 Jun 2023 00:25:22 +0200
Message-ID: <20230629222651.3196-7-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230629222651.3196-1-dakr@redhat.com>
References: <20230629222651.3196-1-dakr@redhat.com>
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

