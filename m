Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E987B4C2B
	for <lists+dri-devel@lfdr.de>; Mon,  2 Oct 2023 09:04:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0636E10E189;
	Mon,  2 Oct 2023 07:04:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CDBC10E189
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Oct 2023 07:04:17 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-32336a30d18so7962450f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Oct 2023 00:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696230256; x=1696835056; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Y6/vJt9ctuXTzh2TrR+gtgZxArsjz8X1YrhkfYqmY7U=;
 b=GmnG3yTyBOK594ePZFE1lkuHkiaW6l26L/XjDFC9dADloV3jIYu2EyD8TqxTVURV9U
 qgOmvC+afQRqs1XZKF7ttFN0OQ0NnZX9r/VQW1UcXRWL/zzgv7+9TaxiI5YxrlX7Ui8z
 Dj/lDwKrpP3BbSiAxyxIK/Di/RTrfd3qSMjcoq2WhqL++ma1SB7UUNscbTsJesjaA4Wy
 1HipJlsnwWXAEoduTitokj2P4uXdp2VmBdUZT0EpFpqOHCaT7eDNUMhjWaQQ5z1cvF3i
 g0CjMONU8F0BgLYmh9IYNYKmN0ZeyLSa6wZ0mXuf2jSXwczzFOJSj3t0j0sX+zrbpJ50
 XDQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696230256; x=1696835056;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Y6/vJt9ctuXTzh2TrR+gtgZxArsjz8X1YrhkfYqmY7U=;
 b=gTyRh9qXSOePv1cmru59btnDicURz/LDaOKewMBwmW9f2z5hz1Rr3SeVdzudIgI9Ps
 5aQ0bP0LtpIMhSMBhYAYnb/Pe6EMw9D+175H7cHmhZt55AD1bUK1FRm7YE+niJx5qrMu
 l1dcgoekl0ZthxPLQ0h5T0VM+2qYCme7KdT492v5cScGmFyoC2woY6vjiqgfY5Ke/11o
 pBcDE6fTjasCGUrYaiEMOL8+ME7UBwQaDDgHaIPFvTxsxIycq6YpGfJS/gFUsqdpYoEX
 02lGRntQzN0miS5/NIbtR7kgaNv+ntTgcG/N1uMw4Ay0GohKoJ2xMEulGKcH6rCc1HdN
 t7rA==
X-Gm-Message-State: AOJu0YzH1Ok8uP8SfIC5PCLvfxXgFJ5XCPFnFZar+J1hBEevHsjOVQWU
 N9g4PCeR+dL27Cs5Rk+0e4Rd+Q==
X-Google-Smtp-Source: AGHT+IEyYBJJMbHZjWHeeTihAKMquhbpnNMcEirvRUurb/E/iXkqlOsL65t+QCELvd7XjCoC8de/Mg==
X-Received: by 2002:adf:edc2:0:b0:320:932:80a0 with SMTP id
 v2-20020adfedc2000000b00320093280a0mr9049441wro.54.1696230255722; 
 Mon, 02 Oct 2023 00:04:15 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 s5-20020adf9785000000b003232380ffd7sm19295168wrb.102.2023.10.02.00.04.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Oct 2023 00:04:15 -0700 (PDT)
Date: Mon, 2 Oct 2023 10:04:12 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: John Stultz <jstultz@google.com>
Subject: [PATCH] dma-buf: heaps: Fix off by one in cma_heap_vm_fault()
Message-ID: <bc145167-0471-4ab3-935c-aa5dc20e342a@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
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
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>, linaro-mm-sig@lists.linaro.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "T.J. Mercier" <tjmercier@google.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The buffer->pages[] has "buffer->pagecount" elements so this > comparison
has to be changed to >= to avoid reading beyond the end of the array.
The buffer->pages[] array is allocated in cma_heap_allocate().

Fixes: a5d2d29e24be ("dma-buf: heaps: Move heap-helper logic into the cma_heap implementation")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/dma-buf/heaps/cma_heap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
index ee899f8e6721..bea7e574f916 100644
--- a/drivers/dma-buf/heaps/cma_heap.c
+++ b/drivers/dma-buf/heaps/cma_heap.c
@@ -165,7 +165,7 @@ static vm_fault_t cma_heap_vm_fault(struct vm_fault *vmf)
 	struct vm_area_struct *vma = vmf->vma;
 	struct cma_heap_buffer *buffer = vma->vm_private_data;
 
-	if (vmf->pgoff > buffer->pagecount)
+	if (vmf->pgoff >= buffer->pagecount)
 		return VM_FAULT_SIGBUS;
 
 	vmf->page = buffer->pages[vmf->pgoff];
-- 
2.39.2

