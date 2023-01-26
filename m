Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A5967C192
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 01:28:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3088810E124;
	Thu, 26 Jan 2023 00:28:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3576210E124
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 00:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674692931;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=JbyYoo+iTg/7s516SgITKP/ggW6rCx9usz1BqFXsKhg=;
 b=Js2HiijuVF4q58AtiwUG8LC6+kaGPVgXYP8Ya8cZgQq6afdq9R3i2ljiGkyKGTPkay4nYA
 21n5tdLZQiMreAVGyXrJ1ATEbBYM/TEI31F/wVPHTouh8QIqLqkptSjQ7wNBK1mkeqeLzb
 t3z53EZpJCi1xy8l9srgyf0JWYOeR6Q=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-79-pPLg4un8NxiDIh23ytZpuQ-1; Wed, 25 Jan 2023 19:28:50 -0500
X-MC-Unique: pPLg4un8NxiDIh23ytZpuQ-1
Received: by mail-ej1-f71.google.com with SMTP id
 nc27-20020a1709071c1b00b0086dae705676so227907ejc.12
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jan 2023 16:28:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JbyYoo+iTg/7s516SgITKP/ggW6rCx9usz1BqFXsKhg=;
 b=oVZ1ODKpgbtqApcQpo46yAEHs+h+cYvGRRLYXLulQeP9mckkAv7tF5TtBpHRSmj1+5
 ULBeDL+B1+8FUnYmxs2L/2VC9gaB+LyPb2JPNX6Tb1pIoeYgabVkfiPohkIVHmk/u2QJ
 S61ckGM2DefaXyh8JWTRjV7WfCuFg3z0xYPq+qJgpJbymNXQSMJq5JaVGddaijAqnlGy
 FMauMhNX5MiQGofuzrYHyXClTFh7KgrEg2zD4lnRsn3wNyVyhv8f+8SxYGy2RdAe5Jzx
 Sibdd/shxUYEYdi8++CHKuomLDnVMKT1U05nkyjNKxo6Z6JKXvi6obsWn7CEJtUADPXF
 To/g==
X-Gm-Message-State: AFqh2kqJc4PnU1rHEACICey5tT6jquMPjwvwfcwyNoMzBb7RmLeFTQUE
 N8hwHAXXxUjOYFdYsD7LlUs2HSyu6HcHPwljDALqNGY+OOY/Au5C/isBLV3mWl/tGehkUaZKg/T
 C8KLgKYPsNKdtMq9WoH4FHyY+ZBT7
X-Received: by 2002:a05:6402:5419:b0:463:9193:404a with SMTP id
 ev25-20020a056402541900b004639193404amr36659384edb.21.1674692929039; 
 Wed, 25 Jan 2023 16:28:49 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvGz2LNpp1BEszvXNVD/n0jXIZ8CQsApiWD0Hl3aVbSLJvpgJWIyT48ddPBP9ROdENyzemY5A==
X-Received: by 2002:a05:6402:5419:b0:463:9193:404a with SMTP id
 ev25-20020a056402541900b004639193404amr36659373edb.21.1674692928896; 
 Wed, 25 Jan 2023 16:28:48 -0800 (PST)
Received: from pollux.. ([2a02:810d:4b3f:de78:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 j15-20020aa7de8f000000b0049622a61f8fsm3009706edv.30.2023.01.25.16.28.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jan 2023 16:28:48 -0800 (PST)
From: Danilo Krummrich <dakr@redhat.com>
To: christian.koenig@amd.com, Arvind.Yadav@amd.com, sumit.semwal@linaro.org,
 gustavo@padovan.org
Subject: [PATCH] dma-buf: actually set signaling bit for private sub fences
Date: Thu, 26 Jan 2023 01:28:44 +0100
Message-Id: <20230126002844.339593-1-dakr@redhat.com>
X-Mailer: git-send-email 2.39.1
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
Cc: Danilo Krummrich <dakr@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In dma_fence_allocate_private_stub() set the signaling bit of the newly
allocated private stub fence rather than the signaling bit of the
shared dma_fence_stub.

Fixes: c85d00d4fd8b ("dma-buf: set signaling bit for the stub fence")
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/dma-buf/dma-fence.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index 406b4e26f538..0de0482cd36e 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -167,7 +167,7 @@ struct dma_fence *dma_fence_allocate_private_stub(void)
 		       0, 0);
 
 	set_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
-		&dma_fence_stub.flags);
+		&fence->flags);
 
 	dma_fence_signal(fence);
 
-- 
2.39.1

