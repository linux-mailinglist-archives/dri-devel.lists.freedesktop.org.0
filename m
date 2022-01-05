Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2382B485239
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jan 2022 13:04:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB09810E54B;
	Wed,  5 Jan 2022 12:04:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7C3210E54B
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jan 2022 12:04:47 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id 200so35338922pgg.3
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jan 2022 04:04:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=wZQVYKA/l1SV8AWz433qKhWKOkbVbgPv85MCDpXpzDk=;
 b=JdOS4h2mHactNft1+fa4HuzLmVEk9WpOntlE3igFnvGIMjpOjcXZYDb7OErXUf6rtI
 iMGPeW1wGazBneBHZZRUdSWhvlbOTjOyaFdkbmDEshZKP+yHTypC/+kzJj/3C0ycKioB
 sB9yikZB0nWJuojd1I9IW+YV/RpAmHqaplxsh0djpSXj98QtFfJLNne+xSsN+i0h9RIK
 pNH1393cOyhch4JImiNmBXfY9TATzSzAEQKdtfdVeW6+VppJhsYPAzh5R6zuNWdCiOfF
 sWjx5W9sN4UzzadMbNyRAdFTPeAvhsWWeBwT8CwWtXhHyoUJQNfCBb9bLBmspja773cV
 kqZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=wZQVYKA/l1SV8AWz433qKhWKOkbVbgPv85MCDpXpzDk=;
 b=r54fLQycyh4EPGSg7bU3EmvgOVl2CYCepXbpmjVZQUSB5hZaJDMaVAjWPgOyUXuiE5
 tW+b7P/ccVzcI6Wg3C/YzId/d0O0R18I2jKy4cW6wgERHfv1lbClXEMmPNqpBC/x+RMf
 xlhDC7wM/QY0T2lv8YeusIA9wkfZMfiWdSCrQL3YQdGiQYe9WNL8mCHCDwjOPGDG2dWX
 d5Wi9An8rzDizaEeeHdFPL9ZdPOfpJe4pigczxlDw+WhEy2sl5/Emw4vf1R+3WEO0a3Z
 Mq8YhrFx1jKXOlNXAyq9qbh7fbQJCpJgjIzn+J85k8JNHaO6a/IpnNp49G52wCjmVAkX
 HhQA==
X-Gm-Message-State: AOAM533z6TRTLiykJ2JcQ2vqUdtSk8NtQONjNb6NeTvJ0d5fFsdYKxGc
 n2DNPo+HP6c86KP3s01ezjI=
X-Google-Smtp-Source: ABdhPJybLgZfdzb84PU0vel94N2UrQNfmRkVoJUvOqo81/mOUSfSO9R+DVoIcNpHEKXN4IWaZi5utQ==
X-Received: by 2002:a63:935e:: with SMTP id w30mr37822635pgm.342.1641384287576; 
 Wed, 05 Jan 2022 04:04:47 -0800 (PST)
Received: from localhost.localdomain ([159.226.95.43])
 by smtp.googlemail.com with ESMTPSA id
 204sm26701428pfy.207.2022.01.05.04.04.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jan 2022 04:04:47 -0800 (PST)
From: Miaoqian Lin <linmq006@gmail.com>
To: 
Subject: [PATCH] drm/v3d: Fix PM disable depth imbalance in
 v3d_platform_drm_probe
Date: Wed,  5 Jan 2022 12:04:42 +0000
Message-Id: <20220105120442.14418-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.17.1
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
Cc: linmq006@gmail.com, Emma Anholt <emma@anholt.net>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Eric Anholt <eric@anholt.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The pm_runtime_enable will increase power disable depth.
If the probe fails, we should use pm_runtime_disable() to balance
pm_runtime_enable().

Fixes: 57692c9 ("drm/v3d: Introduce a new DRM driver for Broadcom V3D V3.x+")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/gpu/drm/v3d/v3d_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
index bd46396a1ae0..4f293aa733b8 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.c
+++ b/drivers/gpu/drm/v3d/v3d_drv.c
@@ -300,6 +300,8 @@ static int v3d_platform_drm_probe(struct platform_device *pdev)
 	v3d_gem_destroy(drm);
 dma_free:
 	dma_free_wc(dev, 4096, v3d->mmu_scratch, v3d->mmu_scratch_paddr);
+pm_disable:
+	pm_runtime_disable(dev);
 	return ret;
 }
 
-- 
2.17.1

