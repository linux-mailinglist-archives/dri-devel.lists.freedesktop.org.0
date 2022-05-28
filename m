Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA85536D4E
	for <lists+dri-devel@lfdr.de>; Sat, 28 May 2022 16:35:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45EEA10E07D;
	Sat, 28 May 2022 14:35:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4D8D10E07D
 for <dri-devel@lists.freedesktop.org>; Sat, 28 May 2022 14:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653748502;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=XE622bwRFQLXoWlWGwkx558rDBHwnMuHGZROqrwvbw4=;
 b=DtQOkWwWVgh5By12XGOM70kcMF97uvxnCDuiQdatjTPipcPA0Y1BV1XSNX9J0SHxBt4sB6
 kX0wN5pzPT3DULg0jqcuM34luY4EwwPd7i2eCyLwPKiMUZWAObUjJLJDhcTouxmEd+BBz4
 5DST17TSVOFVOhB3iDXwJ3SXS+aUIIc=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-152-bTxykjxsOYyY5EcVwpECyQ-1; Sat, 28 May 2022 10:34:48 -0400
X-MC-Unique: bTxykjxsOYyY5EcVwpECyQ-1
Received: by mail-qk1-f199.google.com with SMTP id
 c8-20020a05620a268800b0069c0f1b3206so5825567qkp.18
 for <dri-devel@lists.freedesktop.org>; Sat, 28 May 2022 07:34:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XE622bwRFQLXoWlWGwkx558rDBHwnMuHGZROqrwvbw4=;
 b=ajJQv4QTZrtz64G6lrPN9wEg5aukXoOjcVoZv/B3pDjTLK+mZ1y9nnYOVuQOppOWAR
 wiBOPHWcNTylBZsyvuhHsrDTIsXRh5yPymwlrTmTRL1K9E+L+8sszQ9GONYA3zcBrUtR
 7vXoVLvEx6bsWlKdr75OpO9VucOhEWnNoKKC+fENrIH+KXvVeAj0QgIJj4cC2CLhRBjZ
 2dpluhzsPVOrk2s2KFstgNQgNh+B/HRBrHPrEZ0ty25vibNly7EB2o9jI89ogyDHYnJX
 ccs5Ix9Lkdm91iN6BCxpzjHtFtMis+3Lmu9yLcXdCcXmach8LWWAMlgqC0m0OGeeD9BR
 xZow==
X-Gm-Message-State: AOAM531QL0KBcxyKcoP8T9J3uYPyi65aNyDIYfST74XOuvYKIeMPTkIL
 NIvgDC/QhjMVd8PowRviSnas2TL62yi3BigM94NFJoct6F4FYfyj9+Lr4yX9eF4D28R5GKIzAbn
 9mA2HwIfrwLD24jEQlWDf+AM6s2rG
X-Received: by 2002:a05:622a:186:b0:2f3:b5e1:8f2c with SMTP id
 s6-20020a05622a018600b002f3b5e18f2cmr37699917qtw.99.1653748487880; 
 Sat, 28 May 2022 07:34:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzfw+zDbPoW1PujPqrT77plf9K/dqh5eJc8Y+lAMBwBf227Q8xlr2ZkX6Cc6T3ziRTt2IzQLA==
X-Received: by 2002:a05:622a:186:b0:2f3:b5e1:8f2c with SMTP id
 s6-20020a05622a018600b002f3b5e18f2cmr37699895qtw.99.1653748487608; 
 Sat, 28 May 2022 07:34:47 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id
 c131-20020a379a89000000b006a098381abcsm4541947qke.114.2022.05.28.07.34.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 May 2022 07:34:46 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: bskeggs@redhat.com, kherbst@redhat.com, lyude@redhat.com, airlied@linux.ie,
 daniel@ffwll.ch
Subject: [PATCH] drm/nouveau/fifo/gv100-: set gv100_fifo_runlist storage-class
 to static
Date: Sat, 28 May 2022 10:18:36 -0400
Message-Id: <20220528141836.4155970-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
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

sparse reports
drivers/gpu/drm/nouveau/nvkm/engine/fifo/gv100.c:56:1: warning: symbol 'gv100_fifo_runlist' was not declared. Should it be static?

gv100_fifo_runlist is only used in gv100.c, so change it to static.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/gv100.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gv100.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gv100.c
index 70e16a91ac12..faf0fe9f704c 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gv100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gv100.c
@@ -52,7 +52,7 @@ gv100_fifo_runlist_cgrp(struct nvkm_fifo_cgrp *cgrp,
 	nvkm_wo32(memory, offset + 0xc, 0x00000000);
 }
 
-const struct gk104_fifo_runlist_func
+static const struct gk104_fifo_runlist_func
 gv100_fifo_runlist = {
 	.size = 16,
 	.cgrp = gv100_fifo_runlist_cgrp,
-- 
2.27.0

