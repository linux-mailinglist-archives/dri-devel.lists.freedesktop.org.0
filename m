Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D934F7AB1
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 11:00:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F3AE10E6E8;
	Thu,  7 Apr 2022 09:00:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65A7589121;
 Thu,  7 Apr 2022 09:00:00 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id qh7so9352098ejb.11;
 Thu, 07 Apr 2022 02:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0ov3S8RZTCggS0GEzbXNpgrQxhDHVpnmFzd0+6eO884=;
 b=SoL7FLKQx/b0y1RqtsFfK/KKbCbxrAQgM0p11H+ohbXN7bbcetc864N7HTyFln1EV0
 EsdS3oa9agYsu401LN3KFheViE/A2LgRw+oEdD7NYVc+ztOtu5a2f/jbx6Y1ExVwKGjd
 ZzqqhVBgj/2xDnjIpSw27/txMKWaE9dUlg7L8htLVYbVEXWniv17Y73A4fd0kx5NDoqy
 7BCz0uXgSjdy8SLvDQwuPBnqIW9ZZP05RRPae63eKfix7qZ8voNf39OnUEQxfa1JRAMh
 jNiustN/xvluOU2fsd1DOESHsA4wIrrbUZ7BKMrLhbfTsBGszdy1PQIAMwWTxXfNMdzd
 OQ2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0ov3S8RZTCggS0GEzbXNpgrQxhDHVpnmFzd0+6eO884=;
 b=uX/GWj1GaHsxiAZlltzaGHDWGM18vkvFkcKRYz6AChyAryiW32UY+lHCak2kZNF/Yq
 czCvcy71M5UuxN2Fn2xk0Q2Xac4j8uiWpBEVJo+4KcVigt8DA8XOuhvEQL2wtKe3XSGg
 zPjdbsD5YF5eRds1TYtk+BPFpY0r+rSzf5naaOltYHDlNzxEGsxoOXhnYTnL/avR9+wa
 DWilaxZorq5jJ8fq9WVyoJOiP/73uUDxwna3PHILvadrk//sBLNwDcn1D1Hvn6so246t
 +ROl9ASQihsuuVKF+jGwaQu6ANqmS1ACiCkxZLK54OtfHNJhM1ufQb6vFRL0oq9J1St3
 QWZw==
X-Gm-Message-State: AOAM531E7TZEHqf4xl7DhsShOy6aaocW64VhEJAfM8MgCMJcUPDqBEMh
 cW15nUBGxAr6hxGZJptShkNr8C3qMtE=
X-Google-Smtp-Source: ABdhPJx5XXdRljepf+g/LnGaehJT/bMOkDj5bEiDu7hHb47Qc8rfGy+jdo3yes9DUgGAvINqso3pyA==
X-Received: by 2002:a17:907:6d9b:b0:6db:8eab:94e0 with SMTP id
 sb27-20020a1709076d9b00b006db8eab94e0mr12115593ejc.687.1649321998884; 
 Thu, 07 Apr 2022 01:59:58 -0700 (PDT)
Received: from able.fritz.box (p57b0b9e1.dip0.t-ipconnect.de. [87.176.185.225])
 by smtp.gmail.com with ESMTPSA id
 h26-20020a170906111a00b006e778bd4fc8sm5186563eja.38.2022.04.07.01.59.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Apr 2022 01:59:58 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH 08/15] RDMA: use DMA_RESV_USAGE_KERNEL
Date: Thu,  7 Apr 2022 10:59:39 +0200
Message-Id: <20220407085946.744568-9-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220407085946.744568-1-christian.koenig@amd.com>
References: <20220407085946.744568-1-christian.koenig@amd.com>
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We only need to wait for kernel submissions here.

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/infiniband/core/umem_dmabuf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/infiniband/core/umem_dmabuf.c b/drivers/infiniband/core/umem_dmabuf.c
index f9901d273b8e..fce80a4a5147 100644
--- a/drivers/infiniband/core/umem_dmabuf.c
+++ b/drivers/infiniband/core/umem_dmabuf.c
@@ -68,7 +68,7 @@ int ib_umem_dmabuf_map_pages(struct ib_umem_dmabuf *umem_dmabuf)
 	 * the migration.
 	 */
 	return dma_resv_wait_timeout(umem_dmabuf->attach->dmabuf->resv,
-				     DMA_RESV_USAGE_WRITE,
+				     DMA_RESV_USAGE_KERNEL,
 				     false, MAX_SCHEDULE_TIMEOUT);
 }
 EXPORT_SYMBOL(ib_umem_dmabuf_map_pages);
-- 
2.25.1

