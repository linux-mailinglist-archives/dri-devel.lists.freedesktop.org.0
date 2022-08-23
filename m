Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C8459CD12
	for <lists+dri-devel@lfdr.de>; Tue, 23 Aug 2022 02:17:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 234C6A78DC;
	Tue, 23 Aug 2022 00:17:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78CF311B482
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Aug 2022 00:16:45 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 27N0GabP084538;
 Mon, 22 Aug 2022 19:16:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1661213796;
 bh=IXS3eOpGeVTQhnzmRvwBTKZZwv0GAWdYS0tpv7glTv4=;
 h=From:To:CC:Subject:Date;
 b=CtsjRT6KqXspxbsq858IDz7DOMgcoMVGPp6gP4znuKH7oUCscQ44v0V13Q7m17q6d
 zAiVkVVC77V6A3g1BanAqh70jA63g4Duiz6sh6ZFRwlwoTPt7YsrmWyHP9L3ZHFvR0
 EZRLmt7CEefrLTaPKti+JhzypQ9ebPnj0AIJBNS8=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 27N0GZqC018842
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 22 Aug 2022 19:16:36 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Mon, 22
 Aug 2022 19:16:35 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Mon, 22 Aug 2022 19:16:35 -0500
Received: from ula0226330.dal.design.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 27N0GZ0u007537;
 Mon, 22 Aug 2022 19:16:35 -0500
From: Andrew Davis <afd@ti.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Tomi
 Valkeinen <tomba@kernel.org>, Jyri Sarha <jyri.sarha@iki.fi>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/tidss: Set max DMA segment size
Date: Mon, 22 Aug 2022 19:16:34 -0500
Message-ID: <20220823001634.11461-1-afd@ti.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: Andrew Davis <afd@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We have no segment size limitations. Set to unlimited.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 drivers/gpu/drm/tidss/tidss_dispc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
index dd3c6a606ae2..624545e4636c 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.c
+++ b/drivers/gpu/drm/tidss/tidss_dispc.c
@@ -2685,6 +2685,7 @@ int dispc_init(struct tidss_device *tidss)
 		if (r)
 			dev_warn(dev, "cannot set DMA masks to 48-bit\n");
 	}
+	dma_set_max_seg_size(dev, UINT_MAX);
 
 	dispc = devm_kzalloc(dev, sizeof(*dispc), GFP_KERNEL);
 	if (!dispc)
-- 
2.36.1

