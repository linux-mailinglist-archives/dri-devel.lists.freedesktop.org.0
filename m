Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9617B4567BE
	for <lists+dri-devel@lfdr.de>; Fri, 19 Nov 2021 02:58:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 793826E9EA;
	Fri, 19 Nov 2021 01:58:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2106.outbound.protection.outlook.com [40.107.212.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A56C6E9EA
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Nov 2021 01:58:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V08ujwM0t1hOdc2xMbRM+5BYMFE3KtASy3urkccPAa3Wft5Z2+pjmVVyFJ34xg1S5M7EhEQDo4U1cfwvsWlkCB95+tdpWWEIuqp05fl9q13u8aSwFwdnU5HGzOYbmngKBG5BRpEBiisNmcCZUmwVeHtVJR2Y8HduHUbpBrsG7py3gp391yAaEQSG8QA6tXn1sngHueisSDtpN943PPTm0LDTJ88k3P/M7X8A9wxA3SR+9ufVmKGrCJhQ/41HHvgfWHhsY6IJdeZvrmyqNMRc0RIC34Xxo2gnqHO0w2tB8I4gL8ObLHf1COoiNold9qRF68to5K1YaG88lg4jmS3VJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b1QrxTOqny8qCHu+8QyO8MBKmMZ6UvDidigWTcl9MrI=;
 b=j7CFXWzjOzYxwWkhOhk7WPTDfozo9Y+uXqrHDQyKHnVvncq1LxCRcUHgVK5gvi9b07lCYLY9o+WyivH0H2aOy6MZZoNdsbRUu5jchW/FCdfoYi9tKtUEUL29aXEaPsQteeRyrA1zGhg678iqb/vKRfx4flefXE+y+eFteEGQgyFsz1tbNjAXZ0mECWdI60mJKbB5LSOiRAGMQvSmxWXSSow4vZ1gkuJtf6kJaKtqkwsAd4F7KA+vuhYmauRHAZfYlg8yu58Lw22ZJD/x4DaILG5tMHm24+rQnrJAH6P0j2zfCSiP6mR8C374Ajk2a9G2fpe5NDdld8hoXTLy0vYp2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b1QrxTOqny8qCHu+8QyO8MBKmMZ6UvDidigWTcl9MrI=;
 b=mXMEaP6u6eb1Fvo1WViBvNgeP+ndHAGgZG28FcbWLFBcoUsasNuLMNddP0ZmUt9tXWrGmHIkKl0z/81QOwIO/sLaKAV0f1Wkb/lDzcbPTCgRKaMyOiUp8BLFVk9NlJ2mBE+otICQ+H71xhRyayaNqyzdXodfTObs0NpeqU7EzKs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BY5PR04MB6865.namprd04.prod.outlook.com (2603:10b6:a03:219::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.21; Fri, 19 Nov
 2021 01:58:15 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::6807:22c:61f6:d595]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::6807:22c:61f6:d595%3]) with mapi id 15.20.4713.022; Fri, 19 Nov 2021
 01:58:15 +0000
From: Xin Ji <xji@analogixsemi.com>
To: narmstrong@baylibre.com, dan.carpenter@oracle.com, robert.foss@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@linux.ie, daniel@ffwll.ch,
 sam@ravnborg.org, pihsun@chromium.org, tzungbi@google.com,
 maxime@cerno.tech, drinkcat@google.com, hsinyi@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 bliang@analogixsemi.com, qwen@analogixsemi.com
Subject: [PATCH v2] drm/bridge: anx7625: Check GPIO description to avoid crash
Date: Fri, 19 Nov 2021 09:58:04 +0800
Message-Id: <20211119015804.3824027-1-xji@analogixsemi.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR06CA0023.apcprd06.prod.outlook.com
 (2603:1096:202:2e::35) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
Received: from anxtwsw-Precision-3640-Tower (60.251.58.79) by
 HK2PR06CA0023.apcprd06.prod.outlook.com (2603:1096:202:2e::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.19 via Frontend Transport; Fri, 19 Nov 2021 01:58:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6f6d7205-cd1a-47ff-4f5a-08d9ab000cae
X-MS-TrafficTypeDiagnostic: BY5PR04MB6865:
X-Microsoft-Antispam-PRVS: <BY5PR04MB68656A706311460DCF0CC3F1C79C9@BY5PR04MB6865.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1388;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dsXqcYp+rMAPqQW7su2WdogPFw5ZLqIazLuXhN5irWdH9qm9/ILXMQiI4JHLmtMdtwW9NwbYYp7dFb/4nHu9HMBhXHy5xya47Uo9pu/cOxGNXCnlC1YLxGDTtcGBWzy6HmP7iy8El8tx8ShiOWnQnnS0tquboWbF9AaHRvBoZKkdtCKk6fyM0TihNlTcWvddvhQ85AX4WxdxcDpx3rPr85cBe6j7AjslAPsABGDdox5tBTIqLv6IHXDc3jzJSC5MdfIAXBySgmlBvlYpiwpsbmvkYpWiDqtfPojMvPEY0a0+ATF66YdG5JAx4RSUubdGH7Cy11N5cvALUb4FwBFE1JKOFVdujZ+iQQtYEtZZLJKVBnZ/o84cOkarvYQw65mqI2wvIl3XZOcUYq2rH+x+zmA7minSxa4Vaa/+ssgW+qNWJDTxjKf0GkTxeFQRVNwaklvpXo9fLkrdQCazitTGmup8vwP6rVqIVzjWoCoeYEcVHwynXGa6tEGJOM6bZxbiTNijG7pj1MrP2GvwW5ANqGeiI0mnhHY0/rwlHKvgkfCNJ1ei/YeoCSsAR6KXiMf7+V3ySITBhMxvcgWBag2nlN8ycW+yMr2xgqWoaQWmHYSLtHsDfdL8c5YAhFZxHM4JQTWnrGcVd90V2pi0F83bLnlvKel8UzQ0UrK3B+L11+ZNsQ/hT1t+1punDDPttxsTh+IhG29eQLDQekzUzbCtPvH5hSTiTwVAheo+5PcLkvw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(921005)(38350700002)(956004)(6666004)(36756003)(86362001)(38100700002)(8936002)(2616005)(6486002)(26005)(8676002)(55236004)(508600001)(316002)(2906002)(4326008)(6496006)(107886003)(66556008)(1076003)(66476007)(52116002)(6636002)(66946007)(186003)(7416002)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gEwKYM8mb3+ucPKBCUYS/j5KtSYqYAoZxjQcT4nAdcqqOXpPRPNNIpEMDdcc?=
 =?us-ascii?Q?cIk2eU+JBNSY+THsvrUi2WTGCz/crUgp0go2PyDAHt2BPodQmOSiaabdie9f?=
 =?us-ascii?Q?nc8AUGazqOPuG9WqhSJXmKoSUpE4Yeh/nlxuJesev1GjYLlZ4Y6LXJAXCSUO?=
 =?us-ascii?Q?23uLMQWCah/vCBqHsm/mDuihkK97o1tf7/NpunIQ1Vd7j5fcwzNhJZObODwD?=
 =?us-ascii?Q?OvMvcoRoY71DLqyVCmx080bE7dYsKhR4KlKU2O9H9tRD6MEZO+1sMQWF70Ha?=
 =?us-ascii?Q?gCAEVD/pr1FI/qe3YZyhqDPPpZbbXTY2kQz++rXzJ8ORVyJqfr0yLWV6CFNu?=
 =?us-ascii?Q?XawtztqNTMv5CZ7yqLEnx757owNhbzgll1rEG0NFezAZKa8evqAtpYFqNn7b?=
 =?us-ascii?Q?J7Moe6s98VN4ScHE8jbQqpXy4oI97RPD/wK7TP3O6iFO2CNCihOklG1CXlSk?=
 =?us-ascii?Q?EO2rhKq57m1RiHWqk9tnZ9t4ABXzqfFKdJTvnoHzQAY+xliDhprMUH4JEeQP?=
 =?us-ascii?Q?5uPGE1uLUlVlyG0N+T8tHCncyaKjo9ApC6HZ/x97CDl4ntHFnf8sL659S5Lc?=
 =?us-ascii?Q?zsLblEQLW25/lwlzvFlFJs+Ht6B1/VzJ/n/jD43FIDY3a5+udx1ZBGfFZmfi?=
 =?us-ascii?Q?xrFvAOcfTBDZAc73jDVWpYXjZ1hNVucLFzzaiusBJ86DIwDLG74HNl/zg6NT?=
 =?us-ascii?Q?TYMQm40YfrBCWjUfMrYC62uo223MEpxYOUfoP9gYQnPr2gZkQSEAf09j2KqN?=
 =?us-ascii?Q?CKzi7d60ZmqCJvk8Id49aVO9bIpHKFoLxtplT/yPiHIPaSwd4JbyS9FVAavb?=
 =?us-ascii?Q?Drfp1cbsXwmu9S3SPV8gv+/eSLSpbDJOQdlSQwiWnw4SwAOuivHYsgETEuW+?=
 =?us-ascii?Q?l0YJFHj8Q7cW3sqFWb5EpJDcNLgn155SwIpAk9ke2OyN1j8z1N4JimDuIYw5?=
 =?us-ascii?Q?dHfP/Kv539gSKdPjaUUYJ96+F10/s+lP8r8g/coYNn/ktnf6/D5Ep5es3vcs?=
 =?us-ascii?Q?75CsfWxgTaunhNNnprvkL6OxF7ebwGvLt/GZkhtbZ9O+z5NgZo47e9GvVtGY?=
 =?us-ascii?Q?mZwWkn93aYUI7ON/HBTODU8gZkZAqw4amWzkOLI3KLOTThLgcx4DFaFuvxTZ?=
 =?us-ascii?Q?CMsr30mXX/o1Eqftkyn6DCgz6NsP1ZuZmtIytEeyQeluwD7gZQnLiCwnrMRx?=
 =?us-ascii?Q?7kN5mD9ZESbFGa14EzKsb5oGWXQFUhkmIjTD0GgSOPTHQYVOkJ+lbEYhObt/?=
 =?us-ascii?Q?1hAXgmJfjBjMZpdvjuZGbDSGh3qt7yZG4sBX+jH6vkffH6tJeQzjixxzcmVS?=
 =?us-ascii?Q?Kf8cLgAg1/ejWdRbX9zO10qVmCCh3Wru2EJpQjkzzFYnTXeRYHxOw9YooyYX?=
 =?us-ascii?Q?Rj+VhFZn529mvUE7dBaxo+Chmw0MZZckBvOKr4sCb9lPhjTt1VuIRc3gSzL5?=
 =?us-ascii?Q?98MVPCIrtJErInbpQ5vVXB4W0rW7iF+CXBEp4Yqh1BRBiFOpNfDYR/aDjLzC?=
 =?us-ascii?Q?IAIponEOCN1JWykAluJVRB649EDW4rBcW17/ODKrCUhMic/SUoC9bvdY1YCH?=
 =?us-ascii?Q?CuEFH5NQI+BziEj1qAOmzRWFESi2s3RfaxU893SG3sNoqO3YpjkQgEHVbdI2?=
 =?us-ascii?Q?X8TGjjur4t5CiLB/2/4JecA=3D?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f6d7205-cd1a-47ff-4f5a-08d9ab000cae
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2021 01:58:15.3294 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cPcMB5Nh9mw6zx2vXBj/sfAdN8RZoe8EVZpgc0h0XLnGokgi822WXOleyF5y+V7SJvUYVqTb+PSMxRAKvB2dSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6865
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
Cc: Xin Ji <xji@analogixsemi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As GPIO probe function "devm_gpiod_get_optional()" may return error
code, driver should identify GPIO desc as NULL to avoid crash.

Acked-by: Tzung-Bi Shih <tzungbi@google.com>
Signed-off-by: Xin Ji <xji@analogixsemi.com>
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 001fb39d9919..652ae814246d 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -1098,9 +1098,18 @@ static void anx7625_init_gpio(struct anx7625_data *platform)
 	/* Gpio for chip power enable */
 	platform->pdata.gpio_p_on =
 		devm_gpiod_get_optional(dev, "enable", GPIOD_OUT_LOW);
+	if (IS_ERR_OR_NULL(platform->pdata.gpio_p_on)) {
+		DRM_DEV_DEBUG_DRIVER(dev, "no enable gpio found\n");
+		platform->pdata.gpio_p_on = NULL;
+	}
+
 	/* Gpio for chip reset */
 	platform->pdata.gpio_reset =
 		devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
+	if (IS_ERR_OR_NULL(platform->pdata.gpio_reset)) {
+		DRM_DEV_DEBUG_DRIVER(dev, "no reset gpio found\n");
+		platform->pdata.gpio_reset = NULL;
+	}
 
 	if (platform->pdata.gpio_p_on && platform->pdata.gpio_reset) {
 		platform->pdata.low_power_mode = 1;
-- 
2.25.1

