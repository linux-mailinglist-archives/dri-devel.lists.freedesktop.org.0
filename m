Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 418A0CA7AE7
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 14:06:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D2A610EB22;
	Fri,  5 Dec 2025 13:06:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RkCVhq5p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5136310EB20
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Dec 2025 13:06:08 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-47775fb6c56so18662525e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Dec 2025 05:06:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764939967; x=1765544767; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=xFWFQJyqNEArb97bML7scQOt1LXkeAlqXlQJNt06ohg=;
 b=RkCVhq5pnbjxUofQGZ53AWl2l8ctyACCV24eyFi8/zNqgvMfELWqo2iXtcqG4Vt1dh
 E4Cn5/l+n2v1+h4ZOJBGR9ExuM15xBF1BWiZMySs6A+uJQ1XRKtN26aSf6i1VNbk0PU2
 sCOMxhQxMa5m0OGNWa/9F8+gjY8qBKV9HLNiiJR3mNeTOpljnF9bDgxVpQ5nqg9GAlpx
 OP62a5vAacZn9YRi21iLFLzuR5icJoVwfKasoo+Pc5+4Ty/vob0yLHXsTBnlc5iVM+f4
 v+f00Zr6x2SUuLbQIIOJ9pmlhgUTqx0VOd1PMkQIoSIgtIe8dgWOP+9UwwKznZByzr//
 QlMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764939967; x=1765544767;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=xFWFQJyqNEArb97bML7scQOt1LXkeAlqXlQJNt06ohg=;
 b=myGsJ36coIJOLtSyOnXE7qv8QMIL3HdM17wRn4z1JDa5Do/ZqPSxkWF7j6+Vj+t9HW
 syFhjt+ITu2fPpx2EJe+mJZlQJ9DbXgPP0VMssIttMdokG0Liuh3Oj7nE83mw0hXHDUz
 FNfFQIoRJim7ipB9t+l3oicK8x+Lx0Xi21IjH4UXJQTW2dfocP934DHoDQ8a8yD1h3vZ
 k+mZt5/V/IZLgxs6jms4QC/Dzia1Qta9SwJ7sT1+B7PHnblukblXHlwMvDL/BW5zwW/a
 Dh3kyF0p2B2hC1Qpjbukg/bVtTIw1uJZNanNsu+u5NswwcBXHdU4v+RxPr8y+Il81zDh
 dgoQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLim04ENV7mxQOHLWPRO/Lg6aM4/pFHr/+5m6YUoaWi9lHkDGvyoS/oPICjjFalxUtpu7NrtOhCTs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YytZ+jdOK9tAXpO8cgq/QX4ZajmT7LiOZe5zV8O17cAkovNyB0e
 pKH8+dSRhBweT3Mjby9AsnLhto9g8XB1qEBWNa1cv2oCpm4lBJVMWNa3
X-Gm-Gg: ASbGncthn5dnbeP5xyqgQrMIbvNL5KJYtyVUb7zFbLnhNSfz2AA83HigbyVy2BfGTZH
 X8Ku9/qNMISzdkW+9+vXdCa2TB1FPpd3DjV5arRDPNhHarSe81boEOkfG60aClrEHBbPoQVUi43
 Pt4dIdjSE/NLgtmFu9cJkZ/TkOiFIaUdDrdOVGfDaZzbi8dpZdmO/yyyzxBWJZcBs6zds35uiAQ
 bAmtK+bilgqcIQ/Wrgee4+lesmXsyh7leHA5LK6dWmaLpsfiNd6jJfcKLyFfV+sAgDfabPXpu99
 UUuL2mtvYuZMi8To3QDjOBqTiiy9LPOxirv6pGQfRv4NhOR0RGHA1v6jtThJKrOGzRnWRPbJVty
 CqPCHLEZrr039aS0bJcr9kkn0LaV5HMhScTRpPi40zO1dL+2RZWIxgC/mo4IfrJPwZDnzd5iZjT
 i4ChK24lATb8zVLD7EjehXPj8sC972hnju9L4=
X-Google-Smtp-Source: AGHT+IGfxlBIT32x6zSESU365lwi7/s5pKbkYUArsltfwJzJNeozJNoe1Bd0XdZLIEre56SlNK+6Tw==
X-Received: by 2002:a05:6000:60f:b0:42b:38b1:e32e with SMTP id
 ffacd0b85a97d-42f79852017mr6685668f8f.46.1764939966620; 
 Fri, 05 Dec 2025 05:06:06 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:15a5:6d00:a241:8e44:3926:5306])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42f7d353f8bsm8914491f8f.43.2025.12.05.05.06.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Dec 2025 05:06:06 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: matthew.auld@intel.com, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 simona.vetter@ffwll.ch, michael.j.ruhl@intel.com
Subject: [PATCH 2/2] dma-buf: enable DMABUF_DEBUG by default on DEBUG kernels
Date: Fri,  5 Dec 2025 14:06:04 +0100
Message-ID: <20251205130604.1582-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251205130604.1582-1-christian.koenig@amd.com>
References: <20251205130604.1582-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

The overhead of enforcing the DMA-buf rules for importers is now so low
that it save to enable it by default on DEBUG kernels.

This will hopefully result in fixing more issues in importers.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma-buf/Kconfig b/drivers/dma-buf/Kconfig
index b46eb8a552d7..fdd823e446cc 100644
--- a/drivers/dma-buf/Kconfig
+++ b/drivers/dma-buf/Kconfig
@@ -55,7 +55,7 @@ config DMABUF_MOVE_NOTIFY
 config DMABUF_DEBUG
 	bool "DMA-BUF debug checks"
 	depends on DMA_SHARED_BUFFER
-	default y if DMA_API_DEBUG
+	default y if DEBUG
 	help
 	  This option enables additional checks for DMA-BUF importers and
 	  exporters. Specifically it validates that importers do not peek at the
-- 
2.43.0

