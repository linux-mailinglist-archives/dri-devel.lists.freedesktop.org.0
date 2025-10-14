Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9858ABD8D50
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 12:57:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D8DA10E1FE;
	Tue, 14 Oct 2025 10:57:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="NViuIYzE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 766A710E1FE
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 10:57:00 +0000 (UTC)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
 by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59EAubh41487485;
 Tue, 14 Oct 2025 05:56:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1760439397;
 bh=4I9IeP5+v23+fU9SgOJKXWPke6g0irOYHRWxEeXH2CE=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=NViuIYzE9BrqSHlrAbA3dMJVsw67+Yeu0gms3JAyt+E1o/OgoYrZKO0+NxCjsstWk
 tt3IRql9i9ZtZ+x0f+AImu2TPUlSqh7eWEdJXXcnv//0YxVmzIlnhX7t2fmbBq8D1Z
 UGWqUMqZx2agTUmc5VlIT2iKxyHbKuxP+UqxFHTI=
Received: from DFLE215.ent.ti.com (dfle215.ent.ti.com [10.64.6.73])
 by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59EAub39387009
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 14 Oct 2025 05:56:37 -0500
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 14 Oct
 2025 05:56:36 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 14 Oct 2025 05:56:36 -0500
Received: from lelv0854.itg.ti.com (lelv0854.itg.ti.com [10.181.64.140])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59EAuaHE3439828;
 Tue, 14 Oct 2025 05:56:36 -0500
Received: from localhost (meghana-pc.dhcp.ti.com [10.24.69.13] (may be forged))
 by lelv0854.itg.ti.com (8.14.7/8.14.7) with ESMTP id 59EAuZQR010693;
 Tue, 14 Oct 2025 05:56:36 -0500
From: Meghana Malladi <m-malladi@ti.com>
To: <horms@kernel.org>, <namcao@linutronix.de>, <jacob.e.keller@intel.com>,
 <m-malladi@ti.com>, <christian.koenig@amd.com>,
 <sumit.semwal@linaro.org>, <sdf@fomichev.me>,
 <john.fastabend@gmail.com>, <hawk@kernel.org>, <daniel@iogearbox.net>,
 <ast@kernel.org>, <pabeni@redhat.com>, <kuba@kernel.org>,
 <edumazet@google.com>, <davem@davemloft.net>, <andrew+netdev@lunn.ch>
CC: <linaro-mm-sig@lists.linaro.org>, <dri-devel@lists.freedesktop.org>,
 <linux-media@vger.kernel.org>, <bpf@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>, Vignesh Raghavendra
 <vigneshr@ti.com>, Roger Quadros <rogerq@kernel.org>, <danishanwar@ti.com>
Subject: [PATCH net-next v3 6/6] net: ti: icssg-prueth: Enable zero copy in
 XDP features
Date: Tue, 14 Oct 2025 16:26:12 +0530
Message-ID: <20251014105613.2808674-7-m-malladi@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251014105613.2808674-1-m-malladi@ti.com>
References: <20251014105613.2808674-1-m-malladi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
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

Enable the zero copy feature flag in xdp_set_features_flag()
for a given ndev to get the AF-XDP zero copy support running
for both Tx and Rx.

Signed-off-by: Meghana Malladi <m-malladi@ti.com>
---
 drivers/net/ethernet/ti/icssg/icssg_prueth.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth.c b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
index 92f2c33affda..9894f1f30b58 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_prueth.c
+++ b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
@@ -1545,7 +1545,8 @@ static int prueth_netdev_init(struct prueth *prueth,
 	xdp_set_features_flag(ndev,
 			      NETDEV_XDP_ACT_BASIC |
 			      NETDEV_XDP_ACT_REDIRECT |
-			      NETDEV_XDP_ACT_NDO_XMIT);
+			      NETDEV_XDP_ACT_NDO_XMIT |
+			      NETDEV_XDP_ACT_XSK_ZEROCOPY);
 
 	netif_napi_add(ndev, &emac->napi_rx, icssg_napi_rx_poll);
 	hrtimer_setup(&emac->rx_hrtimer, &emac_rx_timer_callback, CLOCK_MONOTONIC,
-- 
2.43.0

