Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B51344AC2BF
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 16:14:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2D3D10F932;
	Mon,  7 Feb 2022 15:14:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70081.outbound.protection.outlook.com [40.107.7.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D344910F8D4
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Feb 2022 15:14:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NAiSOVzHN+qsrO/hS2gt7BBfTZEpOaUelKbWS7jrLbrXrmugBGcpD2QM2akWh9MCtOnoNeQhisaW1HREaQyB/rE+3O7NE1tSqGz0Sk6juTXis1OmBALJIHPpC/BUCz2/+bREo1uTRlryNMKGZLJPeaaxt9+59Zp15XsVDnT5aH1IoTcT5P9Jv+IVenRbvV3KS5JDtwYYiHJwG8/7IblMAO7IfFzDnb8tlQokyEvmt4y47ieVOA2BcaeRf5wxlIPVGtg/BWQUsT+8VE7YMSSjECpOwlp7zdpHlQgXyA9byhDTw0R4KsuEV0YFCRugjumtUZtJHcUGALfAHiYsleXJjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t9Zd1dc31B2ptklV5TBhUXuMMqIr5qAkzJ4cgOkdmpo=;
 b=NyO8AWdiMOr8DMcJ2stsRwnzvHgSWssrtfWlviqvTzv/eUXA/KVKcHfVpOTP1ZGGPSxNb5wros6TOdBF/PA11fNuuWMZmRK6KIcxOw8Uvk9EyZ5F+VG+uIxJhZKuBE7jzzC86fw6aRRN6Q45LHnCsdV0lr8tMe/LBa/mSFWPkrixE8lUKkTR6I+f9mNPBZ/TUy/OKbUn/oOr49kiFDq5DVFC5I/RGVaGa1FxsYh5a2diol1C3EOKjpkz/NPf5H+mWPJkwlyl0ateAMGqOJwV8wI/q9PlYeuDB6IchZoxLJ5ltTcJaSUTzH0fC5s2V/NDhBD2aZZwZ6TJFpOhs4zvvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.201) smtp.rcpttodomain=pengutronix.de smtp.mailfrom=de.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=de.bosch.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t9Zd1dc31B2ptklV5TBhUXuMMqIr5qAkzJ4cgOkdmpo=;
 b=QvO/r1agdYlLaxvLWWWoWur9p8kR8iXE7EuWL1SienKCAazs9/pL9uWpPb9ENqrgzAWX0yndjBdn5uUenCH21Mz9Mclri+t1F7UHvePX0GoxMNlSefJzGN4LfY/EjmYfoxwxX0S3MsPVUPaHJWV2LIsWF4lwLsLuRfCsEZpHFhs=
Received: from AS9PR06CA0154.eurprd06.prod.outlook.com (2603:10a6:20b:45c::28)
 by DB9PR10MB4443.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:226::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Mon, 7 Feb
 2022 15:14:53 +0000
Received: from AM5EUR03FT052.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45c:cafe::19) by AS9PR06CA0154.outlook.office365.com
 (2603:10a6:20b:45c::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.17 via Frontend
 Transport; Mon, 7 Feb 2022 15:14:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.201)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.201 as permitted sender)
 receiver=protection.outlook.com; 
 client-ip=139.15.153.201; helo=eop.bosch-org.com;
Received: from eop.bosch-org.com (139.15.153.201) by
 AM5EUR03FT052.mail.protection.outlook.com (10.152.17.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4951.12 via Frontend Transport; Mon, 7 Feb 2022 15:14:53 +0000
Received: from SI-EXCAS2000.de.bosch.com (10.139.217.201) by eop.bosch-org.com
 (139.15.153.201) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2375.18; Mon, 7 Feb
 2022 16:14:45 +0100
Received: from SI-HUB2000.de.bosch.com (10.4.103.108) by
 SI-EXCAS2000.de.bosch.com (10.139.217.201) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.18; Mon, 7 Feb 2022 16:14:45 +0100
Received: from luchador.grb-fir.grb.de.bosch.com (10.19.187.97) by
 SI-HUB2000.de.bosch.com (10.4.103.108) with Microsoft SMTP Server id
 15.1.2375.18; Mon, 7 Feb 2022 16:14:45 +0100
From: Mark Jonas <mark.jonas@de.bosch.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] gpu: ipu-v3: Fix dev_dbg frequency output
Date: Mon, 7 Feb 2022 16:14:11 +0100
Message-ID: <20220207151411.5009-1-mark.jonas@de.bosch.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: df01d6af-efc0-48c5-8784-08d9ea4c97ac
X-MS-TrafficTypeDiagnostic: DB9PR10MB4443:EE_
X-Microsoft-Antispam-PRVS: <DB9PR10MB44435CC7380EB88D02A2B619AD2C9@DB9PR10MB4443.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:192;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d/48mt/R01x6n/QoTd7OpCBqoNvm3ALxULFSwgi7mgNnxExoKfebsBaQG7EDnNBX/4UkoNOa9WJmi6WJkHZAj4oc4vTaFCSDxZKcNWeEqx+WKEqIlZP7iK6Brb7iy3WgH1n2rm4DNi6OTotypFMcGbae82AgWAzz99BjHgIdMwN5hftU0ArPDNgpwS3VG+xTROGbqpBPvzUXcj2ymuxe52LBfBAJlXbiCBj4iQCFgy+74NTViPOfiJwDFKf453Kl1BQmHu8wjxhynQDoWTSX3xdksAiTNZoqTialeQ6qb02EwGQEUDnv8FkbwaX9wg47t8M5eAUw3MQMBWx5lfLdxbKUFTsu41NRBYaD3RbBozDTLanxlynNawSLfcz0lX/pjB0SvKdpF8IJE8Kf84bymqEZWzV9x2hSIdIhuoTlC1seH8PBy4SgwE1HynT9CJP/GN4aBnZ9cJCXvZ768PVFnDvhSy6HgkwMS0EUHYyFywKiu4zQ41I30/VJS+dSs0Le7CovL/VOQvjW6sbC43xBX2Ng/QKszlnUce1Wrt+kq9EDSUWsALuDMQuhronKdpMVVhio491xBhjnjoyEeby5YBuas3tmWAGAdK5aCcdwZlh1h1Uydcpaog+nE8uwQjfbqm0uN1L7GSCoOq2bDs4k2yg8U5DmKt31zb3sPC0Nkim0ZT8YMrWp/L7cgBUxDzZm46jkExtL7Y/W8B64DPu2cQ==
X-Forefront-Antispam-Report: CIP:139.15.153.201; CTRY:DE; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:eop.bosch-org.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(47076005)(4326008)(36860700001)(70206006)(7696005)(8936002)(8676002)(70586007)(316002)(107886003)(82310400004)(86362001)(54906003)(110136005)(2906002)(2616005)(6666004)(508600001)(40460700003)(81166007)(336012)(26005)(83380400001)(356005)(186003)(1076003)(82960400001)(44832011)(426003)(5660300002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2022 15:14:53.1778 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: df01d6af-efc0-48c5-8784-08d9ea4c97ac
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4; Ip=[139.15.153.201];
 Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource: AM5EUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB4443
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
Cc: mark.jonas@de.bosch.com, tingquan.ruan@cn.bosch.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Leo Ruan <tingquan.ruan@cn.bosch.com>

This commit corrects the printing of the IPU clock error percentage if
it is between -0.1% to -0.9%. For example, if the pixel clock requested
is 27.2 MHz but only 27.0 MHz can be achieved the deviation is -0.8%.
But the fixed point math had a flaw and calculated error of 0.2%.

Before:
  Clocks: IPU 270000000Hz DI 24716667Hz Needed 27200000Hz
  IPU clock can give 27000000 with divider 10, error 0.2%
  Want 27200000Hz IPU 270000000Hz DI 24716667Hz using IPU, 27000000Hz

After:
  Clocks: IPU 270000000Hz DI 24716667Hz Needed 27200000Hz
  IPU clock can give 27000000 with divider 10, error -0.8%
  Want 27200000Hz IPU 270000000Hz DI 24716667Hz using IPU, 27000000Hz

Signed-off-by: Leo Ruan <tingquan.ruan@cn.bosch.com>
Signed-off-by: Mark Jonas <mark.jonas@de.bosch.com>
---
 drivers/gpu/ipu-v3/ipu-di.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/ipu-v3/ipu-di.c b/drivers/gpu/ipu-v3/ipu-di.c
index b4a31d506fcc..74eca68891ad 100644
--- a/drivers/gpu/ipu-v3/ipu-di.c
+++ b/drivers/gpu/ipu-v3/ipu-di.c
@@ -451,8 +451,9 @@ static void ipu_di_config_clock(struct ipu_di *di,
 
 		error = rate / (sig->mode.pixelclock / 1000);
 
-		dev_dbg(di->ipu->dev, "  IPU clock can give %lu with divider %u, error %d.%u%%\n",
-			rate, div, (signed)(error - 1000) / 10, error % 10);
+		dev_dbg(di->ipu->dev, "  IPU clock can give %lu with divider %u, error %c%d.%d%%\n",
+			rate, div, error < 1000 ? '-' : '+',
+			abs(error - 1000) / 10, abs(error - 1000) % 10);
 
 		/* Allow a 1% error */
 		if (error < 1010 && error >= 990) {
-- 
2.17.1

