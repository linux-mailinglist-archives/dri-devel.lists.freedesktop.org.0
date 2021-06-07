Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C23A39D592
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jun 2021 09:07:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B83936E23D;
	Mon,  7 Jun 2021 07:07:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8681A6E23D
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jun 2021 07:07:00 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id f2so16246829wri.11
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Jun 2021 00:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SmI4GBAWtLhxiuDpnFa/YiHbCqYEqnOGsqhEG1zjbQ8=;
 b=LZuVbLhXbGly3bSJStHLhMIEdTnuQ9J/+WRPlQgfEI5fnGwRtJa3l86kMAKU+EEyoP
 dvqTHHUrmNKIb712NoOzhTWZJlI6XTC3I/gWSRQyl9EHE4cxlKS59pGIHDjDlwONvPSP
 NzQ93DgsjvXXcsj9rBblJmC1J0WcSIpNdDG7TgpS1U9oXRlc1knqh66l88I4SQmtBQxe
 HEG1tnoGyqPrpGFmLPniUh49DyxrVqKuOhEbLf+2woa/hiW+M7qeHexdL7RmiphfrBY6
 2fQu9zcR3zrcAFxKeV0/itOncIajLd8+X58/1Z2GQVz6jWIzPHoaRYniU/ZYiKrrsTDa
 SgRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SmI4GBAWtLhxiuDpnFa/YiHbCqYEqnOGsqhEG1zjbQ8=;
 b=EMrLSsE0sGAOMJf0r9i4A2QRpfQPiFE9w02G0l/N5oBKONUu/imRw4k2Z+0Z8y8KON
 q3J6fj762Y6W9T0zE0mwEBP7PTys5mMt8CSH3H+/w+3Cr5HXgeXuXzW2SYObBBdmRLBH
 yYcei21QT8vpmTHSXVg5mFY/weidEZ8V0FYb5SdF0VQdP61k78kG8fBHkgskdLwKX/eN
 xfF3HA0J+Vfzwofrw6n0S3UDZRZOCV4bnBmpdRAn4v3fk3xdtxyOm1BKHghqvkI/AgRK
 adid8O3DgHScrWkKwZs9mhgL3BaOmFIzaE+r5GI9hjHpyOpJIBgvP6aIUs0MKOarqBtH
 IgEw==
X-Gm-Message-State: AOAM532Bl/d/B+PhP/R+0zEq+aYFDh8hxzfzEsbz67rxL6OCIUqEygcD
 nEBQfD8Oeh87WK1L2SrzlHY=
X-Google-Smtp-Source: ABdhPJw8ier2ibk3zrZ7iW7I/KCK6hEbrWm6J61mEHUTaigxKZAlF5WSo4rBGruXHpzqSmsne/MMrg==
X-Received: by 2002:adf:9b9d:: with SMTP id d29mr8636104wrc.226.1623049619324; 
 Mon, 07 Jun 2021 00:06:59 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:281b:1208:a095:f965])
 by smtp.gmail.com with ESMTPSA id w23sm13283763wmi.0.2021.06.07.00.06.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 00:06:58 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel.vetter@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] RDMA/umem: fix missing automated rename
Date: Mon,  7 Jun 2021 09:06:58 +0200
Message-Id: <20210607070658.11586-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
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

This occasions was missed during the recent rename of the function.

Signed-off-by: Christian König <christian.koenig@amd.com>
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/infiniband/core/umem_dmabuf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/infiniband/core/umem_dmabuf.c b/drivers/infiniband/core/umem_dmabuf.c
index 0d65ce146fc4..c6e875619fac 100644
--- a/drivers/infiniband/core/umem_dmabuf.c
+++ b/drivers/infiniband/core/umem_dmabuf.c
@@ -66,7 +66,7 @@ int ib_umem_dmabuf_map_pages(struct ib_umem_dmabuf *umem_dmabuf)
 	 * may be not up-to-date. Wait for the exporter to finish
 	 * the migration.
 	 */
-	fence = dma_resv_get_excl(umem_dmabuf->attach->dmabuf->resv);
+	fence = dma_resv_excl_fence(umem_dmabuf->attach->dmabuf->resv);
 	if (fence)
 		return dma_fence_wait(fence, false);
 
-- 
2.25.1

