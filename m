Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E46E764820
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 09:12:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4271810E504;
	Thu, 27 Jul 2023 07:12:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on2115.outbound.protection.outlook.com [40.107.117.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80C5610E465
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 11:58:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HH2oNjBBse53DXsnGkx/B2K/E2M166SogoMhsiI5XPS3KIklSDI8N904GGOmlvy1WegN5R2IdPhda878G6tMLB21GRC21LJ5MCVcbVIVQMsPhOT1Suilpd/Xy22HfK5pLAutQSdI9mUpNa5YWAvu3bRAoIWqalvGgJubxbr7hT2emRP8EIib3OobJBoYf7ncfyDRAs8d+YnbKmkzTKJycaUMw/0TcXG9NjRIiEdPDlo+mQK7As9hOKh3yGQy9ryhkRqCscTQTQCPLIyqZrZn8Nk28iUwJipYPuhKglovvhXwjTGB6hOq+0anh5laLbT4nCO2KE54tMFtCkJdcuAlzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yEReteL9mcEFSjPblt1m/QYREJHzBl1Gp3O7+iL5F5w=;
 b=aM4bQ/bWfKR0lqqXKljJip7JxJr6B5GOnmQtLrP2IRF9hXFCIkhlQ7lZl75dPZKRNePBPdAr9NcH5HKmhmnSZ/RSVfexeDQK2ycV6GtEIl/6e1UKZhuMSR5/Y9eMQbwh66SXNcjMgNdoj5GCm1gpkiJyqsdzVlCuDs2aq06krpPF/hYNGCNP5jxTxQZsmAkQjIJVemDm4Un/AGkozmUQpcqFgBG411jp+cDAqHM1WXQ/Y+mTJPj5Aa7q7PH0gzyS/dtsoiwH7E9zgRC89k82H+yKIMfro7uh9Snd55X+AbAu2y5JFCSAMbiMQznRVWNew2caPriEKqdCf6Bw6RcbHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yEReteL9mcEFSjPblt1m/QYREJHzBl1Gp3O7+iL5F5w=;
 b=QpkaqNIvRD7nZ7iyYPP3UG43a1g3AZQ6ogdkuEMe+aIlI/d3cJs0I36ClLlvCO/DFH3tBRu6ZIEgC/b/thHq8c4sW6qUDPZwsPo2OikAya679A4WH186Bi3+57QwVasxD0FDsn3UXiuZlL41DA5vXPom10E9HLvv/S3MT6R+D5Mn/Bkuhq9n5a40JnFB4oghsMfV5r5vpDpXLhVHxYe2TNodRFbqWL3+7OmGXh3MBMbPvN3yJ5E5xzFUm1HbO5OZiRQIeDYKcE5QIkqdSaEF4abbGj6+a2XOWfOBxGh++BMhFhIG7chBZ3oQhbBPadcQgX/Vec36o0YXbHaCxuW3KQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SG2PR06MB3743.apcprd06.prod.outlook.com (2603:1096:4:d0::18) by
 KL1PR06MB6580.apcprd06.prod.outlook.com (2603:1096:820:ef::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6631.29; Wed, 26 Jul 2023 11:58:47 +0000
Received: from SG2PR06MB3743.apcprd06.prod.outlook.com
 ([fe80::535e:25af:a3bc:d600]) by SG2PR06MB3743.apcprd06.prod.outlook.com
 ([fe80::535e:25af:a3bc:d600%4]) with mapi id 15.20.6631.026; Wed, 26 Jul 2023
 11:58:45 +0000
From: Wang Ming <machel@vivo.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Michal Simek <michal.simek@amd.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] gpu: drm: Use dev_err_probe instead of dev_err
Date: Wed, 26 Jul 2023 19:57:56 +0800
Message-Id: <20230726115806.5702-1-machel@vivo.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0031.jpnprd01.prod.outlook.com
 (2603:1096:405:1::19) To SG2PR06MB3743.apcprd06.prod.outlook.com
 (2603:1096:4:d0::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PR06MB3743:EE_|KL1PR06MB6580:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bc84672-4ded-4e21-26d2-08db8dcfa8b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BY+7wwJySDdwh3MqNAM2XVaBYW11dCFJkzsfRI1vxctvu3PJL3NIBx079rIp5NWTzrFdeI3ul/1LhfQkk/iQtGUZG/Jpk/QqKF0hNKFcBq2lP2QSVqtIEoUkjC6qSxWvGRfb6+/rsaAJ9G+szf0Zq3hrEhsFJx8e0pdR4GRttPr6SOcP5Yo1vp9KFqCsmNL8TatIU2dX3kNYuQE52uNOYpB0kLtnFxAVJQbegnzlF3cPp5kPJyZELagcmA4TmicJHJtS/hPPBuzJqBpkp27+Eg/JEF73vCNe8rEAkJ0eaerkoKIk4TLYnYbzfacchHW4I3Iw66uXDCvYfCWJxSdhcbclsHrgssVgNex1zObozPb0zezDiKM7qHYou2Xb6FeJm3XErsT0zh1x5l8k14ipVln29nMWUFUAkfLiinQuJmcl/hMFzbzPiMlB6WXigFdNj3ef0qaqys/YJMWO/0RP4JouF2xP6eIawO6kN9Aa4BeXpmBtOMjHvZ2xZpM2bvKXsld+4R1PNfqeaDpdgGRUHP5eDZnRrzFrqAermco1Gl+ar8Bwko7ATNoQrVEXwoJTu+5BkcqEBJQ8fxtot7Ph/JYZxnqXoNwiz2hrbrpGeAdHaOOgbJdgu7zwZbe3Xe7p
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SG2PR06MB3743.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(39860400002)(366004)(376002)(136003)(346002)(451199021)(478600001)(36756003)(6486002)(2906002)(52116002)(6666004)(4326008)(66476007)(66556008)(66946007)(110136005)(4744005)(38100700002)(38350700002)(316002)(186003)(8676002)(86362001)(1076003)(6506007)(26005)(83380400001)(5660300002)(2616005)(8936002)(41300700001)(6512007)(107886003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MgCTh7lWW37uP6kbdgjFDpYizZ6e3P68nLZIztzzfuddHPyowp42/e0g5Dd2?=
 =?us-ascii?Q?qrJBwA7WB2Z9I+tj3U3V4MgbSJK/JqYsOTHGbdfdBzBYjxV3WY8NXzqqUcOu?=
 =?us-ascii?Q?UsbjmWzWa/FUiN1vrXUbLnrkW7yAf+YbQSK8Q1fx7DvEzdmxXmvwjZOFSnfa?=
 =?us-ascii?Q?DFwQxhfbvl4RWkFgU0EubEGi1gG8I+ze9pqtHOzgeMDSwGyrVfyjbYOIlQ5U?=
 =?us-ascii?Q?cnD7UXilP4xjWfHKpVPVcClccW2YT88g4YXnL2H49hbIOCpKtzG8Bw+DTz5h?=
 =?us-ascii?Q?DkFwt6Kb4+HRX7PNFvIgGoBOvSSNc00gmyL8piI4gbk+MMIBIGnI41NOqhnR?=
 =?us-ascii?Q?OmHTk130i/a7hp4LVw/92T+8A+1EwVjSLoP3/nj9FgIyaAYp/PKTt/RLBfIo?=
 =?us-ascii?Q?ZkH9vuEh6CGJBq1KeocEKL6/W0L0v7tBnK5Oeiwt4NeCpQEbblgrGbPzQ+DG?=
 =?us-ascii?Q?t/yrfvoEcTZrh/KRScDouPslErPcLngaq64aShALkjsQEGvKsGh+0WbbPu1O?=
 =?us-ascii?Q?PzypHlM5Y4eUk1Fc+LP5Ei22GXGTQuihoT268h9tcnp1E/QoCkXal3vRY1vV?=
 =?us-ascii?Q?wdwFQOG36XVPXGMYu16qtoj89Gac+yWYUMGflI9rAPJHFCkA3ztWooMKQmLI?=
 =?us-ascii?Q?yIS2AIS9zXe/QnldAdUmwbMdEXRHQ5DCZb8+hqjb/dXc1KuUfw9Vq+oF0ePM?=
 =?us-ascii?Q?zYV96cUQljzI0CtqnSUh9+RMurGrCymT/+dAubzDTSRJjDBfb+hJBuF/e7I/?=
 =?us-ascii?Q?jRsCLKOFWS7uIs4CkehtXSDDL+K6C3AEKMZhgzH4ppQZQP6o14NT+DpeCYGQ?=
 =?us-ascii?Q?dpMloVySrlZYTR2EUIwiGzG16H1JsxuMKGX/fZPBBjvYCSN3SPVBSbp7bHMc?=
 =?us-ascii?Q?Bs1mVXFBH8hmAJY5i7/TiqooatUF1jVa/6p7v704TFyvYbblvvRVnthAY62D?=
 =?us-ascii?Q?E5q9/T2IH4RjCG1vBHQ3b2E3U4STbRLxzPe0IINx97NST3r/f8HQ8ek+klJF?=
 =?us-ascii?Q?GvNM+kB+uLAAcwFMSO7+cGL8R6T7JhkmGgWQ2YmGeGnxqktc3YTb/5gXD5q7?=
 =?us-ascii?Q?SxJb+znNd5MPmdglEss+UxNPxkyEiWI0Ry/s32yx9hs6gqLSuU/Xrg1G/4FI?=
 =?us-ascii?Q?VQJbkpCzhnx9/PyQCCvySSdcbNIM6mNX3TK/gvz2ilQDzbDWJ+QpdewOX5XA?=
 =?us-ascii?Q?Whm5f87TtU2MPdLW/vpjXGGYrV9WRtNA0opkL3Wfwk+4k3KqQAJmZpqzGpzm?=
 =?us-ascii?Q?2jXSpEBLCR5xr/iyPDCFbMb2vVOUUjhr27Xd4g0tQ2Ohu8B/cCOfDwxM8ayU?=
 =?us-ascii?Q?IkyyVW35W/gb6PT41HFVltqdBSxD5ZJ7Pi2tk0d7I3JCgsRG6JpxhJWD1ivx?=
 =?us-ascii?Q?IgrQ7BxJdfWgXgMZIrHUapdTjeB4XNZhkkR9IRPwQ2BOvfj4Y9oh4YqnpbV8?=
 =?us-ascii?Q?ZZ+oxbbiUf3xKdvJUAYdYPNxphrM0LKcpEIz8koGa9RYuMOTnZ4XLQjzSc7w?=
 =?us-ascii?Q?Smuz/MhweXkvCipL60ynClWsm+3CLBuJ9SgA1VX65wQlcgTYSV70saPGF0TC?=
 =?us-ascii?Q?2nBixu44mKc0VmjiGhJkMMRn2rhABt0gGBX0llV1?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bc84672-4ded-4e21-26d2-08db8dcfa8b3
X-MS-Exchange-CrossTenant-AuthSource: SG2PR06MB3743.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 11:58:44.8974 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XVEXZ8DKVpkfnRKy+FVLehs7k9v9OR56gRFK6Li825PHxIFsUR2D6B80L/KDnisuO7ylZhtfRcVHmPbEM/6oWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6580
X-Mailman-Approved-At: Thu, 27 Jul 2023 07:11:21 +0000
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
Cc: Wang Ming <machel@vivo.com>, opensource.kernel@vivo.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It is possible that dma_request_chan will return EPROBE_DEFER,
which means that disp->dev is not ready yet. In this case,
dev_err(disp->dev), there will be no output. This patch fixes the bug.

Signed-off-by: Wang Ming <machel@vivo.com>
---
 drivers/gpu/drm/xlnx/zynqmp_disp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index 3b87eebddc97..676f09fe8594 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
@@ -1094,8 +1094,8 @@ static int zynqmp_disp_layer_request_dma(struct zynqmp_disp *disp,
 			 "%s%u", dma_names[layer->id], i);
 		dma->chan = dma_request_chan(disp->dev, dma_channel_name);
 		if (IS_ERR(dma->chan)) {
-			dev_err(disp->dev, "failed to request dma channel\n");
-			ret = PTR_ERR(dma->chan);
+			ret = dev_err_probe(disp->dev, PTR_ERR(dma->chan),
+				"failed to request dma channel\n");
 			dma->chan = NULL;
 			return ret;
 		}
-- 
2.25.1

