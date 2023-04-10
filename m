Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA0F6DCE02
	for <lists+dri-devel@lfdr.de>; Tue, 11 Apr 2023 01:27:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05C3B10E2DC;
	Mon, 10 Apr 2023 23:26:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com
 [209.85.167.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F9F110E2DC;
 Mon, 10 Apr 2023 23:26:54 +0000 (UTC)
Received: by mail-oi1-f170.google.com with SMTP id f14so22704274oiw.10;
 Mon, 10 Apr 2023 16:26:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681169213; x=1683761213;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=g+lsRPR514idYMKUtLslcoXrNYCKeBOjYwsL0KuiBuc=;
 b=CfMi6xZU7zRaSYwrpP34Xn/28j+2+nHgnUWJoU341Jqz/cs0/xUIWU1WWnj4Q2erqu
 35X1rcg9NcZzdAFpPQmLNnBUF/zLIjPKkykSdtVDnt5igyp4PXFYc9OQlB6FMxVCTgGS
 7qAt2CGZkycUS1OgjNN7TvRehZJVlqlVNchv2Of9z6Z+8xeUgG4teHL1PHRA5GloZHY6
 JkPdZBs0npkvwR0/dcR3EliKGNruj6PhcNZTWaB/RQZ3s3kcvGYLFWkLwIT+ijwiSBBG
 VijaXPoekGhPxtVnBKYPEVqrXWTl+5bjnu1KTwA8mnxcJo2vhjMb7gTsYb6MR2k7i72m
 CkzA==
X-Gm-Message-State: AAQBX9ckVjzBwrXd260eGozS7/7prP3Sv6n8B7OwXFTc3FmLp9ptB9ZQ
 GYri1MET+UAnKrZe3iqYWw==
X-Google-Smtp-Source: AKy350bMRODLWiHG8M3XGvsdW3OXsPmqZaFRg21HJ4+qq9Le0+B1ipqYChCPdF/n1NeqoBs7wmg3XQ==
X-Received: by 2002:aca:220b:0:b0:387:2075:59b with SMTP id
 b11-20020aca220b000000b003872075059bmr4660945oic.24.1681169212605; 
 Mon, 10 Apr 2023 16:26:52 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 17-20020a544191000000b00383ece4c29bsm4930513oiy.6.2023.04.10.16.26.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 16:26:52 -0700 (PDT)
Received: (nullmailer pid 1561407 invoked by uid 1000);
 Mon, 10 Apr 2023 23:26:51 -0000
From: Rob Herring <robh@kernel.org>
To: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm: etnaviv: Replace of_platform.h with explicit includes
Date: Mon, 10 Apr 2023 18:26:47 -0500
Message-Id: <20230410232647.1561308-1-robh@kernel.org>
X-Mailer: git-send-email 2.39.2
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
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Etnaviv doesn't use anything from of_platform.h, but depends on
of.h, of_device.h, and platform_device.h which are all implicitly
included, but that is going to be removed soon.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/gpu/drm/etnaviv/etnaviv_drv.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
index 44ca803237a5..c68e83ed5a23 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
@@ -6,7 +6,9 @@
 #include <linux/component.h>
 #include <linux/dma-mapping.h>
 #include <linux/module.h>
-#include <linux/of_platform.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
 #include <linux/uaccess.h>
 
 #include <drm/drm_debugfs.h>
-- 
2.39.2

