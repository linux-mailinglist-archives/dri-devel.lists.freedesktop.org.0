Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B58F13A946B
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jun 2021 09:50:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0DD68999E;
	Wed, 16 Jun 2021 07:50:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2133.outbound.protection.outlook.com [40.107.92.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11DBE8999E
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jun 2021 07:50:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZCLOGVH2uTqt5jQ0ZhEfk3e3JiUXPYTwmcFZ2+bZkwQ+KlQv40J19sULXQ8anMADX62/mo05Y2TyAHZIJzjol4q8ESWelMJ8magNf1Rr05vs1E9nbzTaf9Rpfe28a3/+OtgNuAOeZE6TgU7NZfey6edAlruy+HyI/oa3jvHXYSZdwcoAeZw1Bo2tCRNdsJHHT//EsRsL7JdNxtlbWGP2TCd81n7tAcUQsMMwwZZ4EBdkpH/KM3FQ+neoQet6g204a6chOAd0ophaXIfb3n0tM40T0zk+WInfHSY5oDDC/wdIDyy+lY0+Pm5ednQz8DxrbuLAtsLzQEAIAYPrBvATNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ng+LBj0ddO9omGc64akNdzLD4clbX9FARvyE/dX2Z30=;
 b=KdAKTq5QyfclgcM5ksySTEO9/kAkW1Qr4oQa29G33vFgWN6ROrAb2BOK7wpQ775lZrs0hINkBn3QxRsPgV3zVbnAxOS93V+pWAd/KokHFhspkyQkV69xuzrWYWOyU5HvZM5giHiT4XVkpzkGzGGTdv6WjSib40PVhyCKEgMnYaOuDTtJiqFOaM6kJ0d397Ed5dcwTicHkdj/AoBLLO1/G2uaK5wIX52lnaVg2TyP+moI17oUnHsYaCcoAyXRa9Mr+Ond4TILrzjsuAsLQCpGCWE3v3+oq3RQZ9U8aBQhjQ4z3yp3HwizMbiU6nuzL/9ZBphMuFubM3h2ERelejCwZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ng+LBj0ddO9omGc64akNdzLD4clbX9FARvyE/dX2Z30=;
 b=z6B4NrnvR4qoHfPFBzW+cyt75NbyLc5rknT49aYAiqMN7Y8ldySgxMvZ2Kwqd4ZXIVZQIS0Jw3snCj9y7d+iV64Gn3MTKhIed+1/1AYI2QUipWhTN/bO8DEtkojTlpZF833drHFyx/9yWA5MXPzOITlfh25wgS0969r3sAoGpVY=
Authentication-Results: driverdev.osuosl.org; dkim=none (message not signed)
 header.d=none;driverdev.osuosl.org; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by SJ0PR04MB7245.namprd04.prod.outlook.com (2603:10b6:a03:294::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.20; Wed, 16 Jun
 2021 07:50:22 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::5c0e:fbe5:2bd6:ec6]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::5c0e:fbe5:2bd6:ec6%3]) with mapi id 15.20.4219.026; Wed, 16 Jun 2021
 07:50:22 +0000
Date: Wed, 16 Jun 2021 15:50:17 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Robert Foss <robert.foss@linaro.org>,
 Nicolas Boichat <drinkcat@google.com>, Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH v8 2/4] drm/bridge: anx7625: fix not correct return value
Message-ID: <9c71344ad8036869231993585475c86b110ca3eb.1623725300.git.xji@analogixsemi.com>
References: <cover.1623725300.git.xji@analogixsemi.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1623725300.git.xji@analogixsemi.com>
X-Originating-IP: [60.251.58.79]
X-ClientProxiedBy: HK2PR06CA0022.apcprd06.prod.outlook.com
 (2603:1096:202:2e::34) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from anxtwsw-Precision-3640-Tower (60.251.58.79) by
 HK2PR06CA0022.apcprd06.prod.outlook.com (2603:1096:202:2e::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.16 via Frontend Transport; Wed, 16 Jun 2021 07:50:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9a41f5b4-02cd-448d-079c-08d9309b64cf
X-MS-TrafficTypeDiagnostic: SJ0PR04MB7245:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR04MB72450304F882CA817A3705FDC70F9@SJ0PR04MB7245.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:813;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9Kwm5dkCTo69RXOojrYX+0CKuPs+9I+Amgj2waz2UTUmMD4GoEdr6u+kmFPY7mcv3ZwUWWEg6FDlf1RbMcQgAUd/KExb6PNw0o/IcfXIaKcXdzVojQSxvYQSZ5vv90XtUt2UHDhJOCa5DazvQdlZJAh6ieKJXcmNZOHV0C94kfoEdN4CpY8E1pOWi7PzJskahURb1OHZmnLCeJPvJ9a08YUNctdhcYagVjNd+HUxpjD1sERk5UAsDmvw3pF0MqVGpeuxMo5LOY4XSqH0lZ4dWdRc2Ev8P7cfsXuc9ktj9D60KdEEUxiLtfXsuBg6m4Zgb8TDNnLldy4WL7skFF1HDCTophHMzrgpbzMMfEToyW0yWsNCN0xOPZWo+q8sffeGLW0JrhU3nj/AbCxvmDZgrpCAfHShyJXQa961vLlqP/JQ0tN4PZ8dn16Zz9X4NkdGoexW7Dxr0cwJDjrxYxWAL4P8ONhHBDmj+/zWCaqjdZKNJtUbVihNHHH6kg+3+u6bZdS3Mn+ULicFHpDvlu/+2K5SnhNaTX0G87W3R8urmQNzT5ZcRCDD2gQDpQhIJIJIRQga8iAbiOgtABznZmQU9ROAtk1Y2HhicvkyvxCn1+/h9hpIOLgDT4HrKy/gE+ue6Mr+ide4t5+n9b3R/Uu6JHwNfclzOIxINo/C8iLrNjM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(346002)(136003)(39840400004)(376002)(366004)(52116002)(36756003)(38350700002)(6486002)(38100700002)(6496006)(4744005)(86362001)(16526019)(2906002)(186003)(8936002)(5660300002)(8676002)(6666004)(66946007)(83380400001)(54906003)(478600001)(2616005)(7416002)(26005)(110136005)(4326008)(66556008)(66476007)(316002)(956004)(55236004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lEedRNLI8sf9apUNZTb1AzDVVEZnSLFyjAa6xQlulTUbTJXTXkkcy+n2NVBh?=
 =?us-ascii?Q?4dugBgOVDDbi80StjFiSZ4ylBiU4I5nAETMXQAoYq/JaN7Nnh6IpoUppUGkg?=
 =?us-ascii?Q?y/HKoFGYFba/PSwHRjw15IfzWcJNYUiFP5FqwRIGpIVi5F1RS5O3gaPQ0rp7?=
 =?us-ascii?Q?B+2EPHCyY0vVbq7onXfO+d40JCSjRccGsrROcK2BFSCF6rXIZH4wGeOlSpei?=
 =?us-ascii?Q?zJcpe5e4KqQl2jhGfmz6f3lD1qVPE5FS6XFVi4vWN7gcj4oQxjZ3bxkCrVei?=
 =?us-ascii?Q?xjveYeA/2LPOiw02E6QN1+812vmlkfoJEwCyXQITjp/843cvqRMhJLIth/DB?=
 =?us-ascii?Q?x+TFOmo8lENg4EQrhImn0g6jOOfCuF35ewOpiAFj0M7KBK8oLF5CLF6d4dsr?=
 =?us-ascii?Q?b9a7CnCOGKRAS5cs/ych6VDcvWlKA28jfYQhLo4WUXuwBQOoSch9BwaNzSiH?=
 =?us-ascii?Q?+FNQ2dDniVZV5JH3U34s5MlkVzjIdR9TzNdzWqUzeFaE78TT3hqqFnuX/iLY?=
 =?us-ascii?Q?6Z/gh/AABlKLRC0C3V9UIY/zFp2rujInMuiZCbLQiPeTHyb5BHqJnr+z0j/c?=
 =?us-ascii?Q?iPpDbWpH2KuYj7jrR4aFvJtu6qhpElUXuUmDQwMqdIlfeEoopP70dBw7gZW5?=
 =?us-ascii?Q?gx+QCy0k57svW4rZCeC4qgBNTWFF4LsvwB7L06JQcKUsVFu4TJDjSuCnQnix?=
 =?us-ascii?Q?rvD29DhOA3PlblG7peSqr3NTHUUDz7U7G4mia2qD03NaGcF12hhpefM+RvLa?=
 =?us-ascii?Q?UGdcDoZy6nXDAL1Fe7Yy241adDUACCkNNeS7kxGwGjt965cxS/cdhDUq0xUq?=
 =?us-ascii?Q?mJz5DmgpFORQxRQ0fi4GY/xbU6NaLr9eK+BzX3zzt7HZ3GDP65Ra2KNq3vLe?=
 =?us-ascii?Q?cdR8BZNFNaWay5s+6zMmJv5AxhMc4DZiHB6nOGtU4MO9am6kRffl4TxjbrU/?=
 =?us-ascii?Q?zTwwQiVhjmS6durW47gWxP6ImzpYE9EpNF8dNOCbef4TyUsKNel9s3J+gMTe?=
 =?us-ascii?Q?hUHYDqv2+Ra0VkzblZdwxOnnSV74n5p7h9CjMFxNt4sGT4THgZ/n4634bUbW?=
 =?us-ascii?Q?wWtMfmGNPh8p+EFjXu/NcBtN0GSNjzWLayUuIE/ElW+nxsWtSgeuhZ8ZXUfo?=
 =?us-ascii?Q?InRo1fQSh3poAt8Wtpsu+LP1GKTJW0LW4Lrz8Ah5CaHQJ3ClkXlIFuh1kLpp?=
 =?us-ascii?Q?AEQsdY02ozfVrMJirBu7otqZ4PI295LcK00kowGBpTIVUexTnrEUuRsCYbKG?=
 =?us-ascii?Q?5trFKNPSc9SZSe1lPMGBgp/KPo5azOpAsz4QycWPEBslBwRpUkrNOzMmN//V?=
 =?us-ascii?Q?NtTbN8CyRDSTfAPrGZnAyOL5?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a41f5b4-02cd-448d-079c-08d9309b64cf
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2021 07:50:22.2304 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iCiGoEaxalCWo0//uYJZvObTXIkzjVP90v/TozpHFU/HebCUf92na9GmmcwZrH78a+j+KJQwyvDR1Ojmh3GICQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR04MB7245
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
Cc: devel@driverdev.osuosl.org, Sheng Pan <span@analogixsemi.com>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Bernie Liang <bliang@analogixsemi.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Zhen Li <zhenli@analogixsemi.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Vasily Khoruzhick <anarsoul@gmail.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, Torsten Duwe <duwe@lst.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

At some time, the original code may return non zero value, force return 0
if operation finished.

Reviewed-by: Robert Foss <robert.foss@linaro.org>
Signed-off-by: Xin Ji <xji@analogixsemi.com>
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 7519b7a0f29d..048080e75016 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -191,10 +191,10 @@ static int wait_aux_op_finish(struct anx7625_data *ctx)
 			       AP_AUX_CTRL_STATUS);
 	if (val < 0 || (val & 0x0F)) {
 		DRM_DEV_ERROR(dev, "aux status %02x\n", val);
-		val = -EIO;
+		return -EIO;
 	}
 
-	return val;
+	return 0;
 }
 
 static int anx7625_video_mute_control(struct anx7625_data *ctx,
-- 
2.25.1

