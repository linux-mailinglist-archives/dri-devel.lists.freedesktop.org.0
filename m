Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2260851D9A9
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 15:56:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9384510E726;
	Fri,  6 May 2022 13:55:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBFCD10E726
 for <dri-devel@lists.freedesktop.org>; Fri,  6 May 2022 13:55:58 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id t6so10160529wra.4
 for <dri-devel@lists.freedesktop.org>; Fri, 06 May 2022 06:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gg/JXMjpfOwiEZg6JQBAtzWxMQokLCT2waLLfWBbD+0=;
 b=gqFlZWoAEphOQA4KiBpzJ/0Q8MIO+jvtWxLDmDWS8JeqkDSnXm1pxZwuSJzR2wrvTe
 DALuSt7xR2VWB4jz3x2GjB1iyAuqqaGkJOd1AY3lfTbNUwYKo7ZzF2LNzgt3lJVbEUrr
 XcT6+n0kVdqe4Z9SNg+FCJLxJyCl9ZJhLoQdRX47RZi9F85urOafN9UPvEL4dPIGEb95
 aIEFf4fS79s2pj0PimLKhDTjRZ1i/Y7AfPs5zwJWgwr9sGYgX1TBjUf7w1evf2eA9Tw4
 Oa3eW3bVrgCJU3dkguKXIKaWcRjnz8UvIZk24kjW5jwcGAmkpWGunqRs9YCpallyGpTG
 Gnog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gg/JXMjpfOwiEZg6JQBAtzWxMQokLCT2waLLfWBbD+0=;
 b=Td2G6VEGJBtrtPsoOAqWKk554rFGfb1Lmm4ZcYHQc3Oy22hQhO8JBxikajxII2voOO
 Mix/jHFlCDERMSuDlrICEquAPkWZ8e6G4xlToFmDVRTVOI4t57uGuzC3rDTPSXXnQgoj
 tm1pxzvScH8AlbpQwWSSrp3oc3vmkf8ZvD92doDZTvSIZGDs2wXB5N3+LWcSb8jalzKV
 FdkDJ/mShjvlRpSVAfQNnEt1bSQU5lMVCRbrXl2Kk8NzLe9BeJWnNOdOdZPbjtLqNCNf
 l9mySf+YFrOwFog96YFsBlya84u10kLEtKA3sI3yxRMPxauKwIenUGwyXqCHv+nNk07I
 zpeA==
X-Gm-Message-State: AOAM5319JxFxXE6yXkxnNdcPfm8VE81lc9wOgUL2ayvpzsEieZLRdass
 ZmwFn2Mb8CbHni9sc9jaICxK4gnxuYg=
X-Google-Smtp-Source: ABdhPJz/G3rJIS2qAFjbcSCV0/1cHjKw2VsLuFIl/Hf+bylt36IxaQ+FDHWSptNmOUuo0r33ce1rZg==
X-Received: by 2002:a05:6000:1acd:b0:20c:811c:9f39 with SMTP id
 i13-20020a0560001acd00b0020c811c9f39mr2768730wry.482.1651845357175; 
 Fri, 06 May 2022 06:55:57 -0700 (PDT)
Received: from localhost ([62.96.65.119]) by smtp.gmail.com with ESMTPSA id
 r190-20020a1c2bc7000000b003942a244f51sm8765545wmr.42.2022.05.06.06.55.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 May 2022 06:55:56 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH] drm/tegra: gem: Do not try to dereference ERR_PTR()
Date: Fri,  6 May 2022 15:55:52 +0200
Message-Id: <20220506135552.3913468-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.35.1
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
Cc: linux-tegra@vger.kernel.org, Dan Carpenter <dan.carpenter@oracle.com>,
 kernel test robot <lkp@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

When mapping the DMA-BUF attachment fails, map->sgt will be an ERR_PTR-
encoded error code and the cleanup code would try to free that memory,
which obviously would fail.

Zero out that pointer after extracting the error code when this happens
so that kfree() can do the right thing.

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/gem.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
index 0063403ab5e1..7c7dd84e6db8 100644
--- a/drivers/gpu/drm/tegra/gem.c
+++ b/drivers/gpu/drm/tegra/gem.c
@@ -88,6 +88,7 @@ static struct host1x_bo_mapping *tegra_bo_pin(struct device *dev, struct host1x_
 		if (IS_ERR(map->sgt)) {
 			dma_buf_detach(buf, map->attach);
 			err = PTR_ERR(map->sgt);
+			map->sgt = NULL;
 			goto free;
 		}
 
-- 
2.35.1

