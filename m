Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A7A533C00
	for <lists+dri-devel@lfdr.de>; Wed, 25 May 2022 13:54:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0579810E04D;
	Wed, 25 May 2022 11:54:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49E6410E04D
 for <dri-devel@lists.freedesktop.org>; Wed, 25 May 2022 11:54:21 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id y199so18997882pfb.9
 for <dri-devel@lists.freedesktop.org>; Wed, 25 May 2022 04:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8yxWvcY2SALhCu7O1YfNmzl9qm4kjTTfVDTmiCC4+Dk=;
 b=q5+JawkNSA+SJWs7Kaab97339qddNR/hzU/H6kDcQ4pirilP6uf+8B+PyDh47W3e8d
 ihdx6zfJyu8iF/4osmZ8BmYiqhYGJzFdb40929Lp7xuhUpCAvffX5qEh0cLe1cCL2ARx
 shfLl4DKC4gMpQRWU9wjluyCU/RK2dVgeRMaUNTxEAqWyZEoBatwRT46tBoXGB76ZwQj
 T8Gv1DI9kV+Wqs3i2YOn8+dE66MXiYrMr7e+CnpNs64XHQYRQiR9L4JeZz1u1bugz6hl
 IX3HumOGRa1IPyYxCmtm4PjNjnQuMGE7rYWREj8prbV/wKLXUAuWqR02HYTEc6sSdjeA
 exNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8yxWvcY2SALhCu7O1YfNmzl9qm4kjTTfVDTmiCC4+Dk=;
 b=k3VaJ8PNdGhyAKIHo+3wyPfttTkuMdblS67HtxIVAQUK3lVMSU2YBO9fDHLU4as01d
 x4k2IxLdpScAtBgIeBjYSNfSFFYLIHJ/EQtGhWyrjdvEPCjr3Jx5+oTQ7+qhOhnC8OP+
 U3ZficaXTx8E5CQMfu0pDbJG7W7H9k4SSWV3nN7u6+PjiDEfdVjZdHueZI2mRCcrapNc
 4LFuLN8OZ6ugqJQmgXFUTVfKYJilAmtf+u1m01L+6fLfkYBTP0qsOdn10E0Hyww/mtGa
 TcDSWWs1K1MOSzerKY1P2IXT2FIDduI6lsa18EysEh0qXrCr9SKOZ7q0zfdB2LZsOxrt
 pvyg==
X-Gm-Message-State: AOAM532cjqfAq3hheHvH8zEDYXZ+M6jJL0vEZw/9KNaJ8VdZLCwFraPY
 IHXhATtINmlD3bujTYzkhMo=
X-Google-Smtp-Source: ABdhPJym/TjfU6YuFpUgkO1ZxmprHrgC5PQcEiARQ+48NCFRNJ8Q73Y7W+gum6ApxrbSM5L8w+T58Q==
X-Received: by 2002:a63:95:0:b0:3da:ec5a:141 with SMTP id
 143-20020a630095000000b003daec5a0141mr28135869pga.480.1653479660841; 
 Wed, 25 May 2022 04:54:20 -0700 (PDT)
Received: from localhost.localdomain ([202.120.234.246])
 by smtp.googlemail.com with ESMTPSA id
 x15-20020a170902a38f00b00162496617b9sm3326519pla.286.2022.05.25.04.54.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 May 2022 04:54:19 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/mcde: Fix refcount leak in mcde_dsi_bind
Date: Wed, 25 May 2022 15:54:11 +0400
Message-Id: <20220525115411.65455-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Cc: linmq006@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Every iteration of for_each_available_child_of_node() decrements
the reference counter of the previous node. There is no decrement
when break out from the loop and results in refcount leak.
Add missing of_node_put() to fix this.

Fixes: 5fc537bfd000 ("drm/mcde: Add new driver for ST-Ericsson MCDE")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/gpu/drm/mcde/mcde_dsi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/mcde/mcde_dsi.c b/drivers/gpu/drm/mcde/mcde_dsi.c
index 5651734ce977..9f9ac8699310 100644
--- a/drivers/gpu/drm/mcde/mcde_dsi.c
+++ b/drivers/gpu/drm/mcde/mcde_dsi.c
@@ -1111,6 +1111,7 @@ static int mcde_dsi_bind(struct device *dev, struct device *master,
 			bridge = of_drm_find_bridge(child);
 			if (!bridge) {
 				dev_err(dev, "failed to find bridge\n");
+				of_node_put(child);
 				return -EINVAL;
 			}
 		}
-- 
2.25.1

