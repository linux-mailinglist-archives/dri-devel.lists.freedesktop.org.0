Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D064CA474
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 13:10:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0419810E75C;
	Wed,  2 Mar 2022 12:10:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2098.outbound.protection.outlook.com [40.107.237.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BD8710E75C
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 12:10:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JGoFsWZ+KxAy6w5B4lce2akjQ0Cd+6FVCGzdtxv/iaCCrHXkuO4wG4EQQwnS2zIZsTEPEw7yqTrxd2eDNj2S4e8rJMWD1SRBfrPCSVGtDHuE+ErcwIISUXJE4DZV5StAyjR3VIMMGrRo8trGShx2cJTqvFrzXhXreU7y2TFF3dginkGhGo+N+mEzUBTq2oE4g4H1ZCoBPyqDJizxrBWmknjP8/wAFPM/pUyLySy93ROfKuOWOmshTnLcvFMYG58me5tMbsprAMfBybAjcVVdWf2LruwiuWj1DonqOdVcIqFIHUuPnvgdA34b1RXNZUZ/wocaD8/EEz+63KAY17Kvrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ofADRLsDAC5B9Sfnm/eivt3HMrtkBZu7FnUAOkGdqDA=;
 b=F+7x3J/2flaYyohT2/buASRXKw/Ms4h4sYV2fzGOHEes5Zh3pmS39ZVuhrufofBlhXNY/W7+FfTCGcncf+5vAU8D5Iq1Ox1hGN1qRgn5WnJAyTUzT9XzJRhC0Js3NpMBsNLPFzSwIlFWXWCjpgiGbih2QPfUUTUK3dtDg+XSkXXexMD5zA5/wAKhzYRLSF8N/ksATeppe5X5STr0V7zJJKNDZeloRD+cfbFeIt43mGtf9ATQFgbvVk8FJR0NrMa5BFLEe0qFaYzIiPSQerJdJQWeFhjGxAwbc1j78/V6Iz7NJUbyT77zSQ4KUcoHsZOuN40+t6CZbQfwEwNuOc5BIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ofADRLsDAC5B9Sfnm/eivt3HMrtkBZu7FnUAOkGdqDA=;
 b=arz6FCfDlC1FiTiVXUa2gvWT742IdshtAC5c2fj0Gn9NORzJBAZrJYu2c7MLpaCB0sqVyvdAiyZ4xYiVvmrBhXIaemPE5bQRXEY9oRwFp9jIJh1on+nDGHJR4Bfhp4wjQMDZT4AQ5EFpeZyKG4G3mD/h0y2FYW03XrI2pFrhmgA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BN8PR04MB5905.namprd04.prod.outlook.com (2603:10b6:408:a8::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Wed, 2 Mar
 2022 12:10:02 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::a865:6d10:c4a9:1142]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::a865:6d10:c4a9:1142%9]) with mapi id 15.20.5038.014; Wed, 2 Mar 2022
 12:10:02 +0000
From: Xin Ji <xji@analogixsemi.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/bridge: anx7625: Set downstream sink into normal status
Date: Wed,  2 Mar 2022 20:09:25 +0800
Message-Id: <20220302120925.4153592-1-xji@analogixsemi.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR0302CA0009.apcprd03.prod.outlook.com
 (2603:1096:202::19) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 41365ec4-eef1-4212-1d6d-08d9fc459400
X-MS-TrafficTypeDiagnostic: BN8PR04MB5905:EE_
X-Microsoft-Antispam-PRVS: <BN8PR04MB590556F55B62FAD2DBACC7D7C7039@BN8PR04MB5905.namprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6d7Bcugz1zLFEYR6hKU3j7Vrwz1u1v9ng9d2R7Bv/EFUICCghMM5h8q8NwDwH+a4L14ijSWprOaQjiBkkFri680zz4c/vIg+rcEZ2qpFLumJhJ+Xw5wrduIa+HDSZfVN4zLrgprn3BVAWjbv5qiuBW2VAJvbnurETkLdwvTQGGn6aCk4qwwWai14TY7plYJMpJ5G6W0CLxM0iyEmbB+4eL0STVzmyIINg/zypL0VAmb6WDyW9Do++XRa5d1mgmTDWqiMcGCNDyu5MTVVNAyL6zD3atvKohSXn5WftDwuR8tWKsYTB+X9REiChMkiU9z6+P98GjQzRwEJ6yA+S1IkVsk3a0MmBOAxGThmJBF0nTwMsF0603mu8rqCyePmiKOUTUQCRs1cqN6HttieB14/tY/RlK/f1OTKKoNzlHBOHvf7V9KX26bMfHWypPE4TqUqAZxPY3Sz9ROrBZ1VXe5ya+Dkd3aMbGPY7uQip9rGkHFt8TN+7UH1XvoTHj1hs50fC2X4wcLvZn4YTqJxbdsslpw2EaEgfDQckadY7YqU+Jty3s64UZZSNvptdMGtJ3B3zGvlL6AdSOswzTnEPxgsdHRuoZPJ61uP2vsxAv+N+0tTBY3A1qfV3q+pT2O8qtS1jU9CTVodfCjW36LLAgCClFIrMQyqQvZXxIeo9HvOTihY0zbIlgOWzpBl3jbY8uGt8l2d4mC2LKzZtc3k/dUZng==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(316002)(26005)(4326008)(110136005)(1076003)(2616005)(186003)(8676002)(66556008)(66946007)(66476007)(36756003)(86362001)(2906002)(5660300002)(83380400001)(6486002)(8936002)(7416002)(52116002)(38350700002)(38100700002)(55236004)(6666004)(6512007)(6506007)(508600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DZF6AZoekgJFzMRLzR0FthsfMZsfV7+QiPrHWcNXnX9AT0rufICki7qOTteC?=
 =?us-ascii?Q?3wMNZjqftc1to6AzKjoFqk1E5rQ9E0FhDAjGkOY1K7EbvkCP+hk6T64IZtFQ?=
 =?us-ascii?Q?uCHdUxefcTE/fHiFCU0ztueBLkH175dL8eGgyhbKLPTYjH0vgRpRQcGX249k?=
 =?us-ascii?Q?7gH5oODmy4A8MB/grsEYQiDTsUsF2pp25VxJzf9bBe1+a8E2bp2Jp2AmwvJ0?=
 =?us-ascii?Q?d92xW370YhgtLRmmIsXLKKtwrtuKOkPQZtrlC0phtAm8KeS7fS1BX8SSjdcG?=
 =?us-ascii?Q?XTh85oBd9H8D0MyRhum9v7rgDczjA2D5C1uwxEzW8MG/w1NoM3XDMXSvo11V?=
 =?us-ascii?Q?z4XyRPwJdkKvyAO/Sr95TYx1qobtKUVMSHmB6ci/aN7wprORxzRhPBuKpDSN?=
 =?us-ascii?Q?Whhgtipx29QFN8sn+H20I72keSnHeVl10xfFkeQHqo8mlD+2Qvae9y2P7K2e?=
 =?us-ascii?Q?fyHWmAC33YVummHxsEconHoKU75ePuk3aL9oCrQ+ExouEBRZgY2SLZl20y7Y?=
 =?us-ascii?Q?KuPG9x9hdIeaXA2T22lu9r/d1zKyYsycH9/BIKMMY/SXPWPd0/6tZrmO6+4j?=
 =?us-ascii?Q?MUpAFy5OOCv2b/sDJRFYjokwgTlVr8btC6jZ1BigURVbKtDTZoOp1D3C/ZMJ?=
 =?us-ascii?Q?t8iZOfXDnF7HyhJBiwDoPjhnQ6LQCAASlzjxIV/iL9uRvUifhF3PHzVJeYd8?=
 =?us-ascii?Q?5Lp5E3jXC1uzGvuzJeGfcCYMm1tWcy5mu0ZfII8vxB60L7P/Wul4sRyNWYXF?=
 =?us-ascii?Q?akl2ijnlpC2PGgLy4WAarGDoBQ8wyQEcn0gadRLsy9A/tW62y8LbGp91DZyu?=
 =?us-ascii?Q?M12Be1MA0cuH6/yr5umGfudx+Ndvfd27n4o3cYwxzr/+0vUBNh1vZ74Ov+b6?=
 =?us-ascii?Q?kYGmc6SrTRdhLH08TqsfR5GcOV/vbA4FGgQ4JTmwGHAnaZtFO/fXqQjz7+Gf?=
 =?us-ascii?Q?KfszSnLV/6AogGMXr+G/MMDURRQ5WMhN7Z8uzZuzYAtCo1wOfiL0sK9dDKbd?=
 =?us-ascii?Q?vEWT9q8q9aKqvZ4DC9fCzMTdjXlR6BlBA0bSnYMSXnsv4oP4vDO6rMUcwDfS?=
 =?us-ascii?Q?bEyquukk683yVKibcfCKr9qqSzTZaVMGWmHlZeXE9c6+WG956P7JB00ZpFLj?=
 =?us-ascii?Q?Z4I0X1WNIjjGVXtjnOVC49MObbxbdOCsvvoKYUFQNxTr91tgO63Tt3xILjkS?=
 =?us-ascii?Q?gLiq3/ubjY04+lxUp/NTGfPG/SphK76tBDctOvBxMvAd6Bv2ES+S2GVkBnEv?=
 =?us-ascii?Q?ey54EM+tBdfO+ZiXvYKNBOG7bq4dwNqRe5ZCCWJSvLYfCv6ePg81hGQLcvDS?=
 =?us-ascii?Q?5tCjZE3Z9NPbI9c2pKwRw900Q1O2EHJSZwXM/kLkJsSvlopk7TTRDG4C/IdQ?=
 =?us-ascii?Q?JP8EwqyZoPQEsJ/oZ3LW+8yKGWrdjZKZN+Lj/wjxdh63pE6YThhj1QyhHVlK?=
 =?us-ascii?Q?ZuarbNA3mXbUkrSpcepMvGJt0VdoS9nNMuNmu/GZsQH2KHpQS9YlEUmjtI2c?=
 =?us-ascii?Q?ijYLRyTdpqQMuq1jLeg407MTWhWm+rUFYzKQdtj+zdJXxb0J6Sfpp11keZax?=
 =?us-ascii?Q?Y9VvWmj9ge2m8YqgZio3fHpD7zKaeBbUXtXPUB/nzVM/L2+JuIObAAjmZAt/?=
 =?us-ascii?Q?GbGVA1PqY+tVfOXv8Nnk/h0=3D?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41365ec4-eef1-4212-1d6d-08d9fc459400
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2022 12:10:02.2034 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gWKy9e78ECM4S+ZRyPfRu7TpUerfqBVG/z/QZH6PS+5wzZjXXzLefJ+YYxhzMsdi2+6qY7zJ9GFfZThpaYA37A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR04MB5905
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
Cc: treapking@google.com, qwen@analogixsemi.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, hsinyi@chromium.org, bliang@analogixsemi.com,
 Xin Ji <xji@analogixsemi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As downstream sink was set into standby mode while bridge disabled,
this patch used for setting downstream sink into normal status
while enable bridge.

Signed-off-by: Xin Ji <xji@analogixsemi.com>
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 9aab879a8851..963eaf73ecab 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -919,12 +919,20 @@ static void anx7625_dp_start(struct anx7625_data *ctx)
 {
 	int ret;
 	struct device *dev = &ctx->client->dev;
+	u8 data;
 
 	if (!ctx->display_timing_valid) {
 		DRM_DEV_ERROR(dev, "mipi not set display timing yet.\n");
 		return;
 	}
 
+	dev_info(dev, "set downstream sink into normal\n");
+	/* Downstream sink enter into normal mode */
+	data = 1;
+	ret = anx7625_aux_trans(ctx, DP_AUX_NATIVE_WRITE, 0x000600, 1, &data);
+	if (ret < 0)
+		dev_err(dev, "IO error : set sink into normal mode fail\n");
+
 	/* Disable HDCP */
 	anx7625_write_and(ctx, ctx->i2c.rx_p1_client, 0xee, 0x9f);
 
-- 
2.25.1

