Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF0A6577158
	for <lists+dri-devel@lfdr.de>; Sat, 16 Jul 2022 22:16:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEF2D10E25C;
	Sat, 16 Jul 2022 20:16:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2084.outbound.protection.outlook.com [40.107.21.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08D0C88220
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jul 2022 13:43:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZoN/r0XrZQ2pydv0HwbLLacuGKIjdA9N5EX5eW3jWM9lKaomOpKczzk7OKuOj+WBb4uChhE/hroa0xqcT6qNaxYdVI77LeZfXbxtfPJMbidfPSv1n4+z3q8WKW0CX8tbU5U6wHrNLdgTw68Z5YdSvFxT9yYQcfE+nOI/ejk4IaO+5OuHGvJPTDP+zjO4Cd1fDHOcNy1F3vW87Pbnx0N2FRrUX6T9FIxPSm9r0gzFzV1yPMO9QAEaNadW8Jfbw/5RtbE0g9rB+MAiYiknoEwFyMY1eJK/o3GRyvPyTRtlKYjulye16JxUj37d1FW932p9zZTl84gywTj4sktQK9aRIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UT2YZNebZE7imDte3csX8Nk4Y2yyjUGK22Jn3XMMi9Q=;
 b=oEFgZuGqte5+pxF2ZgwRufPyNxaHtUI4WPB6vPMKrbax6Nw+t2FfkI4U+RFGAJ5s+JYd18vKD2flqbwhoW+lGha2xzqtpr6B0URvO6cUnBYfShUNKWkPBdk1JtNUt1R2HZU7NuxBpUnsCcQy0SagvnaCH5TAkz4rdaCCsMdyTZjgwOHGvuhwUNII43MxRq8lN2OLn9DI2QrSMr7N1Y35r9fKGC3ckNfRlynX1FQsdMex2lKsaktThtMtaZmqy9VJ0f9HzE11uFbBrWOOJz0Vnf/Fz9dpRPyMVStRzWqHaLDLJIhOa+mv+7cs9Bl3iZsVikAEQkH0PzaysV7XFl0nng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 151.1.184.193) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=asem.it; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=asem.it; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asem.it; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UT2YZNebZE7imDte3csX8Nk4Y2yyjUGK22Jn3XMMi9Q=;
 b=oq6JqUTSBRc+EqEKbxhriIxcc1chJVvbqIdaTRULaZnXYx38M4T/g3UJadNxSwMquP8dV5bv6iLqWHtks3EF7RiSatg0qy4s2gN+3Z0L9AJJqCcb9Jj2m8GwXQSgyR1GjtV3CJrunupFnEXLDN0unjD2LznoudezUde4P7uvMi4=
Received: from FR3P281CA0060.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4b::10)
 by DB6PR01MB2949.eurprd01.prod.exchangelabs.com (2603:10a6:6:f::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.17; Fri, 15 Jul
 2022 13:42:20 +0000
Received: from VE1EUR01FT098.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:d10:4b:cafe::3) by FR3P281CA0060.outlook.office365.com
 (2603:10a6:d10:4b::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.6 via Frontend
 Transport; Fri, 15 Jul 2022 13:42:20 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 151.1.184.193) smtp.mailfrom=asem.it; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=asem.it;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 asem.it discourages use of 151.1.184.193 as permitted sender)
Received: from asas054.asem.intra (151.1.184.193) by
 VE1EUR01FT098.mail.protection.outlook.com (10.152.2.106) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5438.12 via Frontend Transport; Fri, 15 Jul 2022 13:42:20 +0000
Received: from flavio-x.asem.intra ([172.16.17.64]) by asas054.asem.intra with
 Microsoft SMTPSVC(10.0.14393.0); Fri, 15 Jul 2022 15:42:19 +0200
From: Flavio Suligoi <f.suligoi@asem.it>
To: Oleksij Rempel <linux@rempel-privat.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH v2] i2c: imx: fix typo in comment
Date: Fri, 15 Jul 2022 15:42:18 +0200
Message-Id: <20220715134218.595269-1-f.suligoi@asem.it>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 15 Jul 2022 13:42:19.0798 (UTC)
 FILETIME=[B4593360:01D89850]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 663e430d-06bc-40b9-0035-08da6667d734
X-MS-TrafficTypeDiagnostic: DB6PR01MB2949:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cVHpSvptgqNfoX2sowN7O7OezJepd0bHBZEfDAjrx3anzJHiVPutsAvLRkhcuJtDkR1ISkF8JDQn12n6wycSaC1KfIRU/L3VY54tB9/2iQZc3lvlN2tJwEaETTXdXtH2LcGQWkLlt34Sgry2iimxmCLMkZGntM64G4odVrEYr+l8fmSLmUlZufwN8uka8CuSHDsGLDQLZ3C7eW/FdRx5Kt7uOZYu8BPQBEQibeqKkMgqt7L+8BIMPf0656KRYIpwVozQlgSUc5sXQLou3vBH5J+5VoKham9iZ+71x82ZHQMPIoF5qYFHm7tNdLZ3TZjcFhj6I2CHY5ctMg4XPGnG1Dh6CArmuLj0M/RaNf8i4YiYR8YU+Pia+rhZFw7M2llkrCPZ9+nqCV173tXugHMCq1XP24HGQ8S/Mrw9t1I2PaXFxhFCHgr68+gVb7DMWDeBUsTO8sUoDiJKdcwZVD1DxGxwVSO+bFeht/MO638GUZTBmbrmd+KkQ5rChquzGDAb/J3hPvQbGnqU7CBrFfvetNlBLK92Vp6Fmj7MTyFnc83RphHFW3RZqshi0ZqpJF7/+QeLPPNRk/TzRKT9FLiNSh6IuaGpWI4xWUpcJBosibMb73XoeyWFvlsdemimRPJXwXuVHyXKK4HFXdZSXhVpIwjcJHx+FDHJJvxt1JWHufSBt9OahA8iRt6rxWC6QvNF5rulvHHOIgyiShZ+vkYz/csAt2vjsHA7RTk63ySfTLk8dDp0Fs0E8uhqoRLkXLcCmyxSgKIjOaQ15+a1jYKT4HsZPbhayYGSBzUsHAwMwL7fVQCZaxaJZCxiBx/hSUA+
X-Forefront-Antispam-Report: CIP:151.1.184.193; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:asas054.asem.intra; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(376002)(39840400004)(396003)(346002)(136003)(36840700001)(46966006)(40480700001)(186003)(110136005)(70206006)(70586007)(336012)(8676002)(478600001)(4326008)(36756003)(47076005)(356005)(107886003)(1076003)(26005)(82310400005)(81166007)(83380400001)(36860700001)(2616005)(86362001)(5660300002)(316002)(8936002)(4744005)(2906002)(41300700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: asem.it
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2022 13:42:20.3426 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 663e430d-06bc-40b9-0035-08da6667d734
X-MS-Exchange-CrossTenant-Id: d0a766c6-7992-4344-a4a2-a467a7bb1ed2
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d0a766c6-7992-4344-a4a2-a467a7bb1ed2; Ip=[151.1.184.193];
 Helo=[asas054.asem.intra]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR01FT098.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR01MB2949
X-Mailman-Approved-At: Sat, 16 Jul 2022 20:16:03 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-i2c@vger.kernel.org,
 Flavio Suligoi <f.suligoi@asem.it>, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

to provid --> to provide

Signed-off-by: Flavio Suligoi <f.suligoi@asem.it>
---
v2:
 - fix typo in subject

 drivers/i2c/busses/i2c-imx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index e9e2db68b9fb..78fb1a4274a6 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -66,7 +66,7 @@
 
 /* IMX I2C registers:
  * the I2C register offset is different between SoCs,
- * to provid support for all these chips, split the
+ * to provide support for all these chips, split the
  * register offset into a fixed base address and a
  * variable shift value, then the full register offset
  * will be calculated by
-- 
2.25.1

