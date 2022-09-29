Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C39AC5EF5F0
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 15:01:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4A7A10E604;
	Thu, 29 Sep 2022 13:01:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 378DA10E604
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 13:01:50 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id u10so1973446wrq.2
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 06:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=QKIpHGs3LeinzeIaUGKa0ICPFZL+uew+WBou+/qEEMs=;
 b=AgFahVNBMPAdTt6Hji1RhoPcnR8MCGZgvz/2UE5Q1CTjXVo9CW0ak/uSx1R+Vq8LPI
 U6nGupIT3g1fujwOUBuemHE58YZu1E5MiLno/O/luh9m6dchtkEs62VjfDkZkPxImpQA
 t3sDG+ehBpLP3dFCgjV6xQP4qBUYtyfshdD8TVIkwAD9om7bLf7WSEghDLkQ/L7diKJ1
 FlGMrf6Q1kFxxEen86Qbwl+o5C+b2T31ZgQ1bDX51wzN6PbMuKltWkFJzQFr7U4esERu
 sFe7Y3tiwEuE+2Vh2+uoJvCbR72J69DxTNPMuukHXoVFQr5x+LCQg0dtMPRiWgK8Hchp
 HWLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=QKIpHGs3LeinzeIaUGKa0ICPFZL+uew+WBou+/qEEMs=;
 b=r6g8hvI8BMoDvbsug9yRYyYtzVmxthQn1odW33VuIFPdIBGYMekFnfgifzeODW9A1W
 6MELknRWCfycql/DKHVkqVUOpHUJrN23/p/YXvaKW2yccf54oXNv0Yul/v+vXiZOOQ5m
 xd48FxNQnSbVEh1MRT9xeqmgEQGOv87qpw4R2T0h2N6kO7+nWC2Dzfe4sq5D6HOpdtqa
 nvIBURLTREY1Yp+YvQhOdI7DHxF36yN55opkLxwrB2Dsf4t53nQYvxe6HdXiPDISHMHO
 e6YwlqjN8cKcUP7UIfMibE05ZeXqm3XhooLv0qpCAargGuJ1x4g7qoJ6MDSzuXFayu9/
 2bLA==
X-Gm-Message-State: ACrzQf0BVwvmeazRX6SPsg/uuLAZnrwyoOQHsyOcekzyFC/j9IJrT/Ec
 Eg10dPKpiIYisV8BzsfZtO/VnpKrAmra2f9T
X-Google-Smtp-Source: AMsMyM5vXaXH5fZ3dIbmRJWeClvpwWiO6Y9sSQYzNl6JW42LcFYRMSzFHH58H6hdJJTPcWhcyowbbQ==
X-Received: by 2002:a05:6000:1051:b0:228:e1a0:7221 with SMTP id
 c17-20020a056000105100b00228e1a07221mr2213671wrx.165.1664456508569; 
 Thu, 29 Sep 2022 06:01:48 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194]) by smtp.gmail.com with ESMTPSA id
 m13-20020a5d4a0d000000b0021e43b4edf0sm6555454wrq.20.2022.09.29.06.01.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 06:01:48 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-phy@lists.infradead.org
Subject: [PATCH] phy: phy-mtk-dp: make array driving_params static const
Date: Thu, 29 Sep 2022 14:01:47 +0100
Message-Id: <20220929130147.97375-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Don't populate the read-only array driving_params on the stack but instead
make it static const. Also makes the object code a little smaller.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/phy/mediatek/phy-mtk-dp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/mediatek/phy-mtk-dp.c b/drivers/phy/mediatek/phy-mtk-dp.c
index 31266e7ca324..232fd3f1ff1b 100644
--- a/drivers/phy/mediatek/phy-mtk-dp.c
+++ b/drivers/phy/mediatek/phy-mtk-dp.c
@@ -85,7 +85,7 @@ struct mtk_dp_phy {
 static int mtk_dp_phy_init(struct phy *phy)
 {
 	struct mtk_dp_phy *dp_phy = phy_get_drvdata(phy);
-	u32 driving_params[] = {
+	static const u32 driving_params[] = {
 		DRIVING_PARAM_3_DEFAULT,
 		DRIVING_PARAM_4_DEFAULT,
 		DRIVING_PARAM_5_DEFAULT,
-- 
2.37.1

