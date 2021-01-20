Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC9E2FE57D
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jan 2021 09:53:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23A826E566;
	Thu, 21 Jan 2021 08:52:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m12-12.163.com (m12-12.163.com [220.181.12.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DA776E14B
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jan 2021 09:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=Yp61YTYqIPSgUyAXLx
 mxc3um8VNJsJyV0cVgGrHmGug=; b=TTMhZ6cI2mgr2FLdC4e99khPVydugSXX2/
 Vo8VoMqjshjnmjj69OF8q9orVA9Uax+IBeDFebWriYqqey0ZS44igfkqZ76pbzp9
 L1VnKzVn00mxNCxstePH4p+/QyHtfz++Si+YpnRMVVgREtqBLOoxmB5eJ7ny+Yrz
 BBEkpnAo8=
Received: from localhost.localdomain (unknown [119.3.119.20])
 by smtp8 (Coremail) with SMTP id DMCowADHt_bd9Adg5f7IMw--.65179S4;
 Wed, 20 Jan 2021 17:16:19 +0800 (CST)
From: Pan Bian <bianpan2016@163.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>
Subject: [PATCH] drm/imx: fix memory leak when fails to init
Date: Wed, 20 Jan 2021 01:16:08 -0800
Message-Id: <20210120091608.12430-1-bianpan2016@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: DMCowADHt_bd9Adg5f7IMw--.65179S4
X-Coremail-Antispam: 1Uf129KBjvdXoW7Wr1xJr47KFW7ur4Duw48Zwb_yoW3Xrg_G3
 WUXryxWrsa9a4qvw13ZF4Yyryayrn7ZF4Fyr1xKaykJ342v3ZrXFyjgr9rZ348Xa1xCFyk
 WFs5XF17Zr17CjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUU9Xo7UUUUU==
X-Originating-IP: [119.3.119.20]
X-CM-SenderInfo: held01tdqsiiqw6rljoofrz/1tbiDgMgclXly8C2BAAAsW
X-Mailman-Approved-At: Thu, 21 Jan 2021 08:52:31 +0000
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
Cc: Pan Bian <bianpan2016@163.com>, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Put DRM device on initialization failure path rather than directly
return error code.

Fixes: a67d5088ceb8 ("drm/imx: drop explicit drm_mode_config_cleanup")
Signed-off-by: Pan Bian <bianpan2016@163.com>
---
 drivers/gpu/drm/imx/imx-drm-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/imx/imx-drm-core.c b/drivers/gpu/drm/imx/imx-drm-core.c
index d1a9841adeed..e6a88c8cbd69 100644
--- a/drivers/gpu/drm/imx/imx-drm-core.c
+++ b/drivers/gpu/drm/imx/imx-drm-core.c
@@ -215,7 +215,7 @@ static int imx_drm_bind(struct device *dev)
 
 	ret = drmm_mode_config_init(drm);
 	if (ret)
-		return ret;
+		goto err_kms;
 
 	ret = drm_vblank_init(drm, MAX_CRTC);
 	if (ret)
-- 
2.17.1


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
