Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC3B77665A7
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 09:45:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC15310E66F;
	Fri, 28 Jul 2023 07:44:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 919 seconds by postgrey-1.36 at gabe;
 Thu, 27 Jul 2023 17:19:49 UTC
Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.216])
 by gabe.freedesktop.org (Postfix) with ESMTP id 66A3010E1DC
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 17:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=sbcgdPd7//5eQ2jdrq
 nCNHQO+6z0ts+727955oICVbA=; b=ffE4gZ1mCC8ezIx91G59KavYQcd9/fejqp
 LLXv7V71YIKTYrraooyMUheXmLU5OVNpCUYZvTm8cBc4srp2vg8PCLUpK/hwGCTH
 KT0voO/8hh7PdktVxHq/hpvgWYdev9SMwZ3FhnnEsuV+tCf2rvRFFD46AxFDb25p
 5ebg/x0mw=
Received: from localhost.localdomain (unknown [202.112.113.212])
 by zwqz-smtp-mta-g3-4 (Coremail) with SMTP id _____wAXXCF+o8JkAvnRBQ--.3132S4; 
 Fri, 28 Jul 2023 01:04:06 +0800 (CST)
From: Yuanjun Gong <ruc_gongyuanjun@163.com>
To: Joel Stanley <joel@jms.id.au>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Andrew Jeffery <andrew@aj.id.au>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] gpu: drm: aspeed: fix value check in aspeed_gfx_load()
Date: Fri, 28 Jul 2023 01:03:42 +0800
Message-Id: <20230727170342.18506-1-ruc_gongyuanjun@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: _____wAXXCF+o8JkAvnRBQ--.3132S4
X-Coremail-Antispam: 1Uf129KBjvdXoW7Jr4rAw4fGw18tFWfKw4UArb_yoWDCFgE9r
 WxursxXFsrurWDGa45Zws3Jr92kF97uFWxWF18t34YyFy7ZryDXrWUWa4DZ343Ja1IyF98
 tF1UZw43CFnrGjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRNdgAUUUUUU==
X-Originating-IP: [202.112.113.212]
X-CM-SenderInfo: 5uxfsw5rqj53pdqm30i6rwjhhfrp/1tbiUQe55WDESc5Q-gAAsH
X-Mailman-Approved-At: Fri, 28 Jul 2023 07:44:51 +0000
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
Cc: Yuanjun Gong <ruc_gongyuanjun@163.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

in aspeed_gfx_load(), check the return value of clk_prepare_enable()
and return the error code if clk_prepare_enable() returns an
unexpected value.

Fixes: 4f2a8f5898ec ("drm: Add ASPEED GFX driver")
Signed-off-by: Yuanjun Gong <ruc_gongyuanjun@163.com>
---
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
index c8c7f8215155..3bfa39bc4f7e 100644
--- a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
+++ b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
@@ -199,7 +199,11 @@ static int aspeed_gfx_load(struct drm_device *drm)
 			"missing or invalid clk device tree entry");
 		return PTR_ERR(priv->clk);
 	}
-	clk_prepare_enable(priv->clk);
+	ret = clk_prepare_enable(priv->clk);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to enable clock\n");
+		return ret;
+	}
 
 	/* Sanitize control registers */
 	writel(0, priv->base + CRT_CTRL1);
-- 
2.17.1

