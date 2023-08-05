Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EAA3771066
	for <lists+dri-devel@lfdr.de>; Sat,  5 Aug 2023 18:01:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2379B10E199;
	Sat,  5 Aug 2023 16:01:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2C7F10E174
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Aug 2023 16:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1691251235;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=94zmfgo0irut0mqrSKRpC00gDlp8lHtPNk77GMVRJ94=;
 b=GLQDichAVSrMwwxNionJ8KFvg2UlWdCVigW2txAGwdX6B1E8D2vC96n/qgGB6zLIAR882r
 Rn2SDyKpXp1dMN+MXvE7cgo03fKSYCmhBVjXnbivCdTYd3a5Z1DPbV9sYKRQIlUDCij9mm
 lCbxN7S7yP47vlqid5ZwIINO0sshOvY=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-554-TgKnx763O2CdQaZVuKqs_g-1; Sat, 05 Aug 2023 12:00:33 -0400
X-MC-Unique: TgKnx763O2CdQaZVuKqs_g-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-99c8bbc902eso135955866b.1
 for <dri-devel@lists.freedesktop.org>; Sat, 05 Aug 2023 09:00:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691251232; x=1691856032;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=94zmfgo0irut0mqrSKRpC00gDlp8lHtPNk77GMVRJ94=;
 b=VXSNT8LNSyGZInNDiFooxAt6nwE5nrXSS8O8/HWKgiDPbwbY4Te9jyIE5VMkrVfpWJ
 KyT1Z97smqxKR5QJnWwPWx++bt0qgcEJAtoHGSiyzsW9zezkDykagMTZBVYwsOc5c2Wr
 ktje7WWu1dHlWR/xQdT4nsRWF81QmizBp9XSK8WyE6LU+8QhbfNxeQXF53JpM2MlVyUY
 cCLU2lvL8mV01jDjO7jvYI55+bInB7LnQvtAp6SB1ScMuOdRULb8LKPG2BibtpGlilXK
 mqKP+Ae1vZ27kw/SN8lGWCAY9DvsNWMI/Yztf0h9j5dSwtBHPc+TVtgJC3ZsGRGLpuj9
 iJjw==
X-Gm-Message-State: AOJu0YxkU5fA+IiD+Dbj3fywFRLC2ZtSkSVSjzEACrpZGeSht5xTqeeS
 WueBnZE4odEbHBTIhgoHbsScFbcKV1sOJGEuK7V/VVjUrJgMIEdG5m1vVZskr6gCgfpQwVQN8XU
 d/06AnYy4DWqqDTNSSvG2ncW9xlGA
X-Received: by 2002:a17:906:51d7:b0:994:9ed:300b with SMTP id
 v23-20020a17090651d700b0099409ed300bmr4797606ejk.16.1691251232459; 
 Sat, 05 Aug 2023 09:00:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGlgipzP1IYg7V0bplG+SRR8mHBM0tv5PNbAHj2TUpHdzAhtZ4nJ+lrwfRjJt+2AhCBvJ0oSg==
X-Received: by 2002:a17:906:51d7:b0:994:9ed:300b with SMTP id
 v23-20020a17090651d700b0099409ed300bmr4797582ejk.16.1691251232105; 
 Sat, 05 Aug 2023 09:00:32 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 x2-20020a1709060a4200b00993b381f808sm2856900ejf.38.2023.08.05.09.00.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Aug 2023 09:00:30 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, bskeggs@redhat.com, kherbst@redhat.com,
 lyude@redhat.com
Subject: [PATCH drm-misc-next] nouveau/dmem: fix copy-paste error in
 nouveau_dmem_migrate_chunk()
Date: Sat,  5 Aug 2023 18:00:15 +0200
Message-ID: <20230805160027.88116-1-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix call to nouveau_fence_emit() with wrong channel parameter.

Fixes: 7f2a0b50b2b2 ("drm/nouveau: fence: separate fence alloc and emit")
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

base-commit: 82d750e9d2f5d0594c8f7057ce59127e701af781
-- 
2.41.0

