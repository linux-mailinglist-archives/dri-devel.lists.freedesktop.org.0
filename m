Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2311C6A6239
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 23:15:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64DD210E0E3;
	Tue, 28 Feb 2023 22:15:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C586710E0E4
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 22:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677622538;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=lkbO8Zr5IWtc4/j1ncgTgHjPYcbP4Lmw69fF7SUMZRo=;
 b=PiHfSqyyxtK/+nyBNjhCmXWUuWQmkxMTj8JQXGcWYNUfCfGSK93g7zOuzSG1SfihV/pvsB
 72ThBJ8xZ1Dmk2oQ6l+kilGkSawq4bNwbVykPTqAIuhEmYQmRc3Jd7+dwZoaVCDVb0vor0
 JhCb93cjekoFkbKi+x0ps5G75ziAXRw=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-513-DgDOJxQpMwKFy_qMzdZIUw-1; Tue, 28 Feb 2023 17:15:37 -0500
X-MC-Unique: DgDOJxQpMwKFy_qMzdZIUw-1
Received: by mail-qk1-f200.google.com with SMTP id
 d4-20020a05620a166400b00742859d0d4fso6623889qko.15
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 14:15:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677622537;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lkbO8Zr5IWtc4/j1ncgTgHjPYcbP4Lmw69fF7SUMZRo=;
 b=Q/j4ggy5EcIu668YUFTiC8HvKbTbLQ1VoYutCOjefulbSMxt3nADA9x3NbQkx8PCKi
 U9XPdM9XXfFvwy2Kmj/Lh3Jq4F3mHF3ZEamWv0qJ70H7opyq0JhYk6PtQtuq3KYW2QbR
 SyJY+lm0ZJUy0FXKF3lTG6N+o+iEiib7mLmKyCNFty5dHk6DI7l/6Y6dKQdyRoZLqaZY
 OLjg6kbR8ivyUlAR9iOsJW211yBoTpVppmZWCZ+OA2W2Nb8wOBoOzw4gIbu3/Ma4dYmt
 VFXc3zw68cQpFNTlN7K3m1CGloL7xptHKiU0xotEa+TeKU0a+zX3KIP2m30ADHT6nEgY
 d0Ew==
X-Gm-Message-State: AO0yUKXFxg2xvjs0+E64fVOW4kCIB5Q3VRjRPxQMoBDvdCzSrsziiSZi
 QwqoWI+gEX0YWf3xNqvDEBylFEIP/IThf0yqFjOnts+TxpGTdSBKB5r3jUK/ugYce/tcZxc8LxJ
 dxCrNxTrmx07D48vzO4XBcoFdwluz
X-Received: by 2002:a05:6214:23cb:b0:56f:5ac:60d5 with SMTP id
 hr11-20020a05621423cb00b0056f05ac60d5mr7339053qvb.0.1677622536779; 
 Tue, 28 Feb 2023 14:15:36 -0800 (PST)
X-Google-Smtp-Source: AK7set8pCi0CAfSgN4N2zWMoTtjUNskBs56MvcyvKZa1GWtrB5qWMiGZ9OAVs86lglXXhTKllq5kqg==
X-Received: by 2002:a05:6214:23cb:b0:56f:5ac:60d5 with SMTP id
 hr11-20020a05621423cb00b0056f05ac60d5mr7339030qvb.0.1677622536534; 
 Tue, 28 Feb 2023 14:15:36 -0800 (PST)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id
 x2-20020ac84a02000000b003b9a426d626sm7076554qtq.22.2023.02.28.14.15.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 14:15:36 -0800 (PST)
From: Tom Rix <trix@redhat.com>
To: bskeggs@redhat.com, kherbst@redhat.com, lyude@redhat.com,
 airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH] drm/nouveau/fifo: set nvkm_engn_cgrp_get
 storage-class-specifier to static
Date: Tue, 28 Feb 2023 17:15:33 -0500
Message-Id: <20230228221533.3240520-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Tom Rix <trix@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

smatch reports
drivers/gpu/drm/nouveau/nvkm/engine/fifo/runl.c:33:18:
  warning: symbol 'nvkm_engn_cgrp_get' was not declared. Should it be static?

nvkm_engn_cgrp_get is only used in runl.c, so it should be static

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/runl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/runl.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/runl.c
index b5836cbc29aa..93d628d7d508 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/runl.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/runl.c
@@ -30,7 +30,7 @@
 #include <subdev/timer.h>
 #include <subdev/top.h>
 
-struct nvkm_cgrp *
+static struct nvkm_cgrp *
 nvkm_engn_cgrp_get(struct nvkm_engn *engn, unsigned long *pirqflags)
 {
 	struct nvkm_cgrp *cgrp = NULL;
-- 
2.27.0

