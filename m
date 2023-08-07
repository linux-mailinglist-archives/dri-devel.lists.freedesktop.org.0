Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3CA4772AE9
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 18:32:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FC4610E2C0;
	Mon,  7 Aug 2023 16:32:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBAD210E2C1
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Aug 2023 16:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1691425969;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IfDXzRQJmq7hjHOSakYboiQj+aP0Hf7JLmie7OP7ZJg=;
 b=N0osMx9ikyfZApFfWzSlj4j5shhjINUgcAufA4J2jFR8gRM3ONk99yi762jKOZRDF7GKJ4
 nR5f6wx1lOh47ErIEJCEFFkBvPPoHDFe6/t8mIutrckr/FWko2PL6cbceNW+xkBsNUkCpX
 F19hdIeQqW344rrum+zY/adSLtd5fL4=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-486-WUfh6ysTPGyLRH9B6lHm2w-1; Mon, 07 Aug 2023 12:32:47 -0400
X-MC-Unique: WUfh6ysTPGyLRH9B6lHm2w-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-99cc32f2ec5so135795766b.1
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Aug 2023 09:32:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691425966; x=1692030766;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IfDXzRQJmq7hjHOSakYboiQj+aP0Hf7JLmie7OP7ZJg=;
 b=Sey0Gp0EM11H8V23rQb8HI81cGEWoQYyrU6hBd/sIuK9ZJJqlZ6BylL0a+nMGGAltI
 uRqldXRF4RCxrW2bkEkrH4AHm2Max2SQAptDaDOUi+dCGZnsRXxosbgsWhFIc04egTR5
 B6Uhq/P6uCTdqi20SuuPn+Q2m3wUNYjOE0zwaDCzwGGc65CZ02n3ugponxIHX5Q3pnwa
 XClfrW/ejZbBlGDQ/kv4X5UhzonxXQqW4vjGfUlX/X4cP7rgS1O4bN6AAids8m6X+qo9
 DFnZiijgNmj3qJuvamVu474S7LPoWa8Y4fZHp+7viIHKpJqVvy2nIMJFVWaodvj3bwIt
 Nm/w==
X-Gm-Message-State: AOJu0YzOhA/tJipuCtmfDtvI/KNe8oCJPgBt/RsuiToIRvtSOsWzUfXt
 v9wOpKbwrs/YJFpXMUqG8mR1dOBgUH4LqvNKx6iPB5j6M2zzDp+oQbh0yW+Ut8mkC/8Mg8tVOX7
 Y+9zk0THFMNnc/4ChQLj1p/xxIkF4
X-Received: by 2002:a17:906:31c1:b0:99b:c0f0:77fe with SMTP id
 f1-20020a17090631c100b0099bc0f077femr8075280ejf.69.1691425966377; 
 Mon, 07 Aug 2023 09:32:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHdZuNVePss2xGOu78Sr/qq+zLojadIk9YBj7opOTUz4DKdRdl9uzjpJuWytvQBggwWEfgpTg==
X-Received: by 2002:a17:906:31c1:b0:99b:c0f0:77fe with SMTP id
 f1-20020a17090631c100b0099bc0f077femr8075269ejf.69.1691425966094; 
 Mon, 07 Aug 2023 09:32:46 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 o17-20020a17090608d100b00988dbbd1f7esm5397484eje.213.2023.08.07.09.32.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 09:32:45 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, bskeggs@redhat.com, kherbst@redhat.com,
 lyude@redhat.com, sfr@canb.auug.org.au
Subject: [PATCH drm-misc-next 1/5] nouveau/dmem: fix copy-paste error in
 nouveau_dmem_migrate_chunk()
Date: Mon,  7 Aug 2023 18:32:22 +0200
Message-ID: <20230807163238.2091-2-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230807163238.2091-1-dakr@redhat.com>
References: <20230807163238.2091-1-dakr@redhat.com>
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
 kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix call to nouveau_fence_emit() with wrong channel parameter.

Fixes: 7f2a0b50b2b2 ("drm/nouveau: fence: separate fence alloc and emit")
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Reviewed-by: Karol Herbst <kherbst@redhat.com>
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_dmem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
index 4ad40e42cae1..61e84562094a 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -678,7 +678,7 @@ static void nouveau_dmem_migrate_chunk(struct nouveau_drm *drm,
 	}
 
 	if (!nouveau_fence_new(&fence))
-		nouveau_fence_emit(fence, chunk->drm->dmem->migrate.chan);
+		nouveau_fence_emit(fence, drm->dmem->migrate.chan);
 	migrate_vma_pages(args);
 	nouveau_dmem_fence_done(&fence);
 	nouveau_pfns_map(svmm, args->vma->vm_mm, args->start, pfns, i);
-- 
2.41.0

