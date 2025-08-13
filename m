Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0CDB240E9
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 08:04:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C7D210E4A6;
	Wed, 13 Aug 2025 06:03:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="v1rtQnSm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE79A10E4A9
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 06:03:54 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-605b9488c28so10767705a12.2
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 23:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755065033; x=1755669833; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S9RDpqZGncYw4GV9WsRoAupSSI2K1DVKB1tocQmYgMc=;
 b=v1rtQnSmhJZPUTmeGJI6U4zAMuPcglNWSPbSCAO5LHFaFATjNXRvll34lSDGNz3TsZ
 r2l4fRfGAp5XTi2/eCCsekYAKkdux17p8M92+0WX4bfLJElDj4EkY4IdlOitzfte/d5A
 i753fUw2S0LLGdA2mDygSWlu8DirMGZTcNYOj6Y4YgePTRe579B6SXRTSOVAX4rY+xFb
 KogENXPackq2Brk7C6WCdMEnSGwwr8iG1vZNvO1mZWchUpKFxGI7B7tnYwnBXALP1DZ/
 3HW+MeyfE3XjeksYkH/r8UBlg5zmP2k3MYFgE4Jsm65SBGPi4fLQ26e1H4SAHyyslTeq
 D/vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755065033; x=1755669833;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S9RDpqZGncYw4GV9WsRoAupSSI2K1DVKB1tocQmYgMc=;
 b=snoSJOmYDXcX6OMfm7RCbrnpIOj2PcGc+vQS766AlFSb9PRt0h0dz/0k3SnTfOKdT3
 OtOUwknPFqhrc193MujKDgnj34nEiX+jDxodaqYBMqgJlYRrUyEzc9UC2FMsSWpFjrLL
 G/yskPFlNM3y3dqyVy26wTDE9IsaT/dysTxWoNkwIUEwgibXIVnJ8aS7ytMnjHi03mXt
 BwXNDT6CZ87LLGf6QGs79UCix4cPLCCiFLum5ZmpbQmhwV2qvzmBi52ad8OJGoA0b4FC
 KQZTxlxaHYRX9fcy9gJl5i0LZfjT1mqoh0jHhdj/DZvAgeQF7JS5dcWRa+avkdn7A4vs
 QHsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVr9vD9wyqartcvVMnb9Ib2VdmUqF9H7Ir8D7qNl4vAkjD9MWJLFDA+E0AKGgGWhoCvQIvcO5jS9gs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwkpBa5UFa7ekTxOnZMfiVi1kCENbBExupCD67wS0UXyA0NYk/o
 L6928rVLiameohqccrCzKVxE14TfrEdn+ScmIclPYV55Unk151mktnzHZJwZ5JZoxPPP0+AhXb5
 actkPBFk=
X-Gm-Gg: ASbGnctYDybqthou9dSPreR1+J218IbfaHQza9eS+3vc5nSm8h2wAfVfuPmMAfM3vU4
 urfPA/7ft5/KxdBxb/Bi52vvLJGBmMvg9I/KuFPnb2Nzth9YOiJPkbhReeO2Op1XkicgeNCkgxJ
 YnoAVldfcUrKk6VlXn6KlQUo1L4kLDWuC7fKD0nTA6jZn7y43fYN7Fm3uem55KlY6iLiQrrFMlR
 MiQoNUdgqboVlrUu/P3DXJpV3FsgmD5Rw2KbHRB8ZPkyv1JPBZih0ARC7HOx6oFdpwfphuEd63M
 4E/5On4SCu5qGNwxxz/LvwfPH917/ijLrtpTOq01P5/6dZm9/eb+P0wZhqZIACrSiU6fCWR4pIO
 UH/b+hzwOa/rfW1kzkgYEFx+w1XDlZMTG1AKO339muicq4+BjVG+rYBTRMkXH80pJUKJZoZhNSx
 s=
X-Google-Smtp-Source: AGHT+IHPDW4Qxib/c3fl/QvNCJB64Z5YGN/d1oTyw+2Hx0fudTx9zXp/j1zq+pONC9zrU1nldBcONA==
X-Received: by 2002:a05:6402:22cc:b0:618:534:550a with SMTP id
 4fb4d7f45d1cf-6186c000f03mr916573a12.24.1755065033114; 
 Tue, 12 Aug 2025 23:03:53 -0700 (PDT)
Received: from rayden.urgonet (h-37-123-177-177.A175.priv.bahnhof.se.
 [37.123.177.177]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-615a8f2b892sm21498679a12.25.2025.08.12.23.03.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Aug 2025 23:03:52 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org
Cc: Olivier Masse <olivier.masse@nxp.com>,
 Thierry Reding <thierry.reding@gmail.com>, Yong Wu <yong.wu@mediatek.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T . J . Mercier" <tjmercier@google.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Sumit Garg <sumit.garg@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 azarrabi@qti.qualcomm.com, Simona Vetter <simona.vetter@ffwll.ch>,
 Daniel Stone <daniel@fooishbar.org>,
 Rouven Czerwinski <rouven.czerwinski@linaro.org>, robin.murphy@arm.com,
 Jens Wiklander <jens.wiklander@linaro.org>,
 Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: [PATCH v11 2/9] dma-buf: dma-heap: export declared functions
Date: Wed, 13 Aug 2025 08:02:51 +0200
Message-ID: <20250813060339.2977604-3-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250813060339.2977604-1-jens.wiklander@linaro.org>
References: <20250813060339.2977604-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Export the dma-buf heap functions to allow them to be used by the OP-TEE
driver. The OP-TEE driver wants to register and manage specific secure
DMA heaps with it.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
---
 drivers/dma-buf/dma-heap.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
index 3cbe87d4a464..cdddf0e24dce 100644
--- a/drivers/dma-buf/dma-heap.c
+++ b/drivers/dma-buf/dma-heap.c
@@ -202,6 +202,7 @@ void *dma_heap_get_drvdata(struct dma_heap *heap)
 {
 	return heap->priv;
 }
+EXPORT_SYMBOL(dma_heap_get_drvdata);
 
 /**
  * dma_heap_get_name - get heap name
@@ -214,6 +215,7 @@ const char *dma_heap_get_name(struct dma_heap *heap)
 {
 	return heap->name;
 }
+EXPORT_SYMBOL(dma_heap_get_name);
 
 /**
  * dma_heap_add - adds a heap to dmabuf heaps
@@ -303,6 +305,7 @@ struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info)
 	kfree(heap);
 	return err_ret;
 }
+EXPORT_SYMBOL(dma_heap_add);
 
 static char *dma_heap_devnode(const struct device *dev, umode_t *mode)
 {
-- 
2.43.0

