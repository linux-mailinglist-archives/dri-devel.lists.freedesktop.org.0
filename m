Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EDF64B9605
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 03:45:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77E6510E6F6;
	Thu, 17 Feb 2022 02:45:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2096.outbound.protection.outlook.com [40.107.93.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 123D010E6F6
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 02:45:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YUqiGQ1wmYL854Vd6FN24nARCObx5SqhlJHm/fqfQaLCeFKHA7rqvvKTMhwfV0EOaDqFO71KfJRRImx3FnULQGqKqtE5cJFCVMjX5FconcxR2MXKMaEQtVR69QlXaV5eJc73PXHv9P4wGdDcDQihYD1qTwVbmd3pSxKSHsnGPQvZnvMr/wUngVLzz8ZitDs1ulBTYl3C9vOxlZudKVFXraDHnmDpNWu+5s3ga4vyOfWebhgMXCgS/+1YvgemmRmWlBXsdedZ12mcoYRhICcyalbf3dUsG7Hkp5gEcZ24MtAofn5FACfbnSrgn8r2PaiY35/WmdP0Ug8f/G5zt3uKgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z4nJOhQ/ZyOtg0M9L1d5IXn1LseoCCTHXN9jMAucXxE=;
 b=LzJHblpwA+syWLFSD5TL55gU+J2alqDfkKMbSryTYaDmnrbyv9cRuv/rOJJ8lLagDvqxbkAOAse4mAaNUU+OXMl+xpzriURW1D8Eq1gCPzfZol1XFCglaq8woUljO7ESAXbgLoGd2Z6OZKRWMq+lnPvZNmEGAYgGwKTgZp20J/jpTFTnUmWhsHTDxI8vhU2DQXZFz/7KrksSKqt2QzmCaQA8Lasrwikwryh0pI2UBzR+lRp+FpuUPZKCyCvZk5MLM+Hy8iF/csSPXpFV6lvS6EJewQAijhDVaIWncbTbcnySVqAoCnCp82xhUF7uShQgtPnevF75kkOdFtLmBAXI0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z4nJOhQ/ZyOtg0M9L1d5IXn1LseoCCTHXN9jMAucXxE=;
 b=Hh5KwYkCE7hDlfvn2RQKU1wtDv6MsuaTBw3TG6dd0adaGCnVvf/7RiZzkKrdly8oLmcni2SgPs93NuqZLAp7gHEzws8H4BUZdf4gWVk4LAXRiu0le89NewmQB+OjntVBrSoncPInYa1V1zA2UIGf7eBT4cRv5jH4UQYhm/RtXTo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BN7PR04MB5393.namprd04.prod.outlook.com (2603:10b6:408:36::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.12; Thu, 17 Feb
 2022 02:45:47 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::a865:6d10:c4a9:1142]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::a865:6d10:c4a9:1142%7]) with mapi id 15.20.4995.015; Thu, 17 Feb 2022
 02:45:47 +0000
From: Xin Ji <xji@analogixsemi.com>
To: andrzej.hajda@intel.com, Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Xin Ji <xji@analogixsemi.com>
Subject: [PATCH] drm/bridge: anx7625: Fix release wrong workqueue
Date: Thu, 17 Feb 2022 10:44:17 +0800
Message-Id: <20220217024418.3780171-1-xji@analogixsemi.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK0PR01CA0065.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::29) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 637a13b4-d21e-4b29-f9d7-08d9f1bf9986
X-MS-TrafficTypeDiagnostic: BN7PR04MB5393:EE_
X-Microsoft-Antispam-PRVS: <BN7PR04MB53930DAADB31E1FA333BF9EFC7369@BN7PR04MB5393.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:49;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MnW/hlk5O9xG6yK9HJI6+msOXpAkbNlP73Wn1FynCs7Gzb/9fd0ITxBPBtZlPIdTOWE+abaznY6rJHouTId33D2PLKoOLUlayKLxnEUFYwEA2zrSaxJR0VFg8h046cfEl/Sy4bsxfmT3ya7BOGIzBghIF/s3wJvOvkbhg8s8vqSUzcDhXGI0qMgmFhkeXA41l/30yPN/hLrv4LlEc5Cka/XVz5qA8JR7dCnD+C7faHCakRWbziU1rkqizijStzKak1v+9+Fb0ZbrEapiyLrSMyRTDbuAt5iApU6fFk8rJ1lEN1I0MF6VGph4QkIw+wMfl3K8DoM+J7v+K6zZ8w0asaKXgzjJXnHKqGln1Q+pDgKgo3qLro1IOMG+b3HLqfvPa9fyaJYqQ55rBzCBPNhtX11G4/HWpjiok5qW0X5FiBTXncUrTVj+jMUWP+5QoTGO285NerCGAN+URgN3aXjp+QD3R9axzq7qjz4axcG2/YLSk3Z+41iIfzr+dKIOT9FOxvtZSL5UvFPme1o2hvcgtC2Vdp6ts1A4EQoPNal2Q1W5AaYOgt+jOOKysQhTaUcRJI0wYA4hZr7dhC6C6YTuBWyn1ol8IfG1zOOF4RQZXq5hvOJFyTplRyLXXTqA36k95HYpjK6mZ5xmddXnP3pMZ5NTHsHbQJ3tcLysePFJEywoSDA4eT26RJIEEzo4zJVhkguVhJaNCYyC+Iuvj+Xaxw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(508600001)(316002)(6506007)(110136005)(4326008)(7049001)(86362001)(6512007)(52116002)(6666004)(6486002)(55236004)(186003)(26005)(38100700002)(38350700002)(2616005)(1076003)(83380400001)(4744005)(36756003)(7416002)(2906002)(5660300002)(8676002)(66476007)(66556008)(66946007)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FVtLy56aoqSxGQ8Hqo1iX71Xll5IaLzOPZwDrsnmWXa7GcY5oi7y2dUMwSPi?=
 =?us-ascii?Q?NF1mtqTy/ViY8jckaKq+dxgp4LcGMq5Wg3D2nevqOawbOImUP7XneccJxiNW?=
 =?us-ascii?Q?KneUT+B1Z7XiJnQIq4qgEC33zNOIAGyzIXXMG/0Xbu1IBlZ0El1Nei4yFD2e?=
 =?us-ascii?Q?u5NDCd5yqlxEzPnuMrRYlmm4lv6VqKv5w6/qSycgm+RrXHT9I23A38ltBQbu?=
 =?us-ascii?Q?7ijXsFS6Q7Rn7XxDJK5J3lcb3wF2R5klQtrgTzpCrWGY8RFwfnWVm2M2h7Y+?=
 =?us-ascii?Q?KgMNvast7ac2VRS3UGxfe4MbBVWpOJLIDTKueoR3GqWHp3qN9vVTrh8w4jIw?=
 =?us-ascii?Q?Tzj8IVMxkbM/5SEvumMhff8TqRCvmXos75lRLdkL3TvDX74LPTc8yk9WB1Nu?=
 =?us-ascii?Q?BdiPU0smO5pXZIsX464nF2IS+UOLHhXo5q63CTbmuMYQhOh5R8UrkoBg0h82?=
 =?us-ascii?Q?/7FI1xVqC02xEJx4RoDZD2zAoPajmkJ31WhZXRK5Y/DeNqL1NKQf7SYPOJzH?=
 =?us-ascii?Q?Xrh5FAuIjtNY2JBoUo8j6ysF6Ad4RJQac2xpahd3qnbM2MPBkfqPYlQs/HKI?=
 =?us-ascii?Q?9On/2nuu9zk3WsWWNHamC4bcZVL2kSAi7jpWJelu776skcQEjRB69XxWmOcN?=
 =?us-ascii?Q?zb/oo1/Et90iqkJBV3PCXt8tSY8YjB3WQHhuca3eNRuIpnooPeHePKUTSUV6?=
 =?us-ascii?Q?5vU9wBgv3IXjtMqs4F3tMMSBmQwGRUUCpb8d+hc4lNK5rtY38EEhv0EaCdgg?=
 =?us-ascii?Q?xKsVWkucJ4LpiA95bROZoQqMYshBXPEwRA8ChmR9jWuc1hkwrYgh3TyF1214?=
 =?us-ascii?Q?qYtmdV1wcQpCBVS6820ZYXV2e12YsrKIWphgnaAq6Bcjv6HGTtKzIU0nwQBQ?=
 =?us-ascii?Q?huimcfdsHnGhh1be78OgaQbv5rK/SiWRN5UkcFQA3+hL7a0nNcGt3eo3Z0Y0?=
 =?us-ascii?Q?Cw9AUtxBk4BQyUlQgY93A9EE2ckJHgR6J5F2PYyMBOz+qv4iE2OJX09/zAOA?=
 =?us-ascii?Q?pAZ+5ZXE5o5hmNaUN0nk1UNK7ullIFtNKoPw+uV/sXqotXP3ZS36qVo/pkIW?=
 =?us-ascii?Q?/Lri42BZNU5UWKEgcJRV4VXX4dg4uAPGG07kHdxk+ZMYwdmsU/tRSawPChZy?=
 =?us-ascii?Q?hW/wBrIVeVPpW6u2PMkT2zjcqW2EpBgGnSxToCyetYdf4ytKgwcFgcUPYb5M?=
 =?us-ascii?Q?iPG76r5fcWUneSSSRgcl++7KyseG/QPIgIy4PglKvCVPsixliTdOYil98GIx?=
 =?us-ascii?Q?WtDM7vaRCVCN/blSWkoZxf1lRu3g7sN20lcFm5Rly8qCGQxDbkQZqHHtHGLU?=
 =?us-ascii?Q?YaTvhE2XiLP3puqIvMY+e1doQEPgsT69ebZwqlOiFd9h5JQIQ9g6Ivh5NqE7?=
 =?us-ascii?Q?RNoJtHvGQAHGLWkQXtp8q1ZSwJLOPGszKhXD0KJtAb+xo94qrUi0Q+4iQgiD?=
 =?us-ascii?Q?9aN/6cPMzjuXCS2KL6c4CsEmUKB9fGBG+0RSIZrEXFWtRUynAyE84yrtRtO1?=
 =?us-ascii?Q?u7pGuPBeSEM+kMcwR/Csh7lmyFLI1/88Z5jG30hLJuEx1Ii6aNK0yikQcnNQ?=
 =?us-ascii?Q?Sd84jWA/Yw73C8Yj1AxATDv9TbH2QwRLLO0jr2CE7ZCOcyPHHKBjIMBs26Ng?=
 =?us-ascii?Q?2nAtl7k5VWJdJXu34NoFzIo=3D?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 637a13b4-d21e-4b29-f9d7-08d9f1bf9986
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2022 02:45:47.0036 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LIP/hNiAM2eN1mAB8fN0kosdm1Yt/eyEAOc38UGcdqYF/a4O0ROLQMe3mF8pUTzW0jSDz/shQeCIXfha9/mVnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR04MB5393
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
Cc: qwen@analogixsemi.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Xin Ji <xji@analogix.corp-partner.google.com>,
 hsinyi@chromium.org, bliang@analogixsemi.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Xin Ji <xji@analogix.corp-partner.google.com>

If "hdcp_workqueue" exist, must release "hdcp_workqueue",
not "workqueue".

Fixes: cd1637c7e480 ("drm/bridge: anx7625: add HDCP support")
Signed-off-by: Xin Ji <xji@analogixsemi.com>
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 633618bafd75..9aab879a8851 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -2736,8 +2736,8 @@ static int anx7625_i2c_remove(struct i2c_client *client)
 
 	if (platform->hdcp_workqueue) {
 		cancel_delayed_work(&platform->hdcp_work);
-		flush_workqueue(platform->workqueue);
-		destroy_workqueue(platform->workqueue);
+		flush_workqueue(platform->hdcp_workqueue);
+		destroy_workqueue(platform->hdcp_workqueue);
 	}
 
 	if (!platform->pdata.low_power_mode)
-- 
2.25.1

