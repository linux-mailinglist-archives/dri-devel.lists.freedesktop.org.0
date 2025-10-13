Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7DC7BD2506
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 11:35:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E18A10E414;
	Mon, 13 Oct 2025 09:35:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="peY8jPhI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013000.outbound.protection.outlook.com [40.107.159.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35A6510E414
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 09:35:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=az1Zbb0kIqzqMSUZKMDtHCHYPQgvkW0Xlyersz9HS69aVLIw3pFPQK0wyMZ8Jo0cFS0RBKGJfMnap5IEUhgz2F0CzpuqpSyOcNUdgY9SIMV3Ik+fZU9I0pzijhYvWYGbhWxKA+7Z+6kvOSpEOHSY8Lz6X1cklqW88aRIOxcunz9RaocUEw2lwEEiBn3EZdgtrPCw9Kzrde+nTf1mDJkKqzxMVavuYcfEHvhObIqc3l3W+gR8DE/v3yhe1PGQogS83P856KOO5FQqWo4vqdjnnD/JI1EdXf/THLlpmRAhSnKsLDAfFEHaHTdzGl72tM1+oOUCn0GgF/H2mJTvTudcQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b2U3lzCWm5Jh72vWAgBbKFObrHIKuZjqGvt53Vz6GKU=;
 b=hybkXIY/xf+lWWreqx5mkYYCQWLHlAbRdNMouTbhZn6/Dp44QWkqpqfhp4L7+aQq3AvfSpqIiAk/AvnWMwO2KncZbz4eep/Ms27AOu3N9rpCXsReMUt6NpZyEinZ/awgy3znhA8gp8kZG36SNVVW8yT23fGypWsAPY1lIVIOOPnAE5ttKQNg201Nl1FAqEBYpqaEbU6WJYcSCHBo/2saifvwkabI79sbvOReKkdDTBoGxCiQ+gVxh8Zvk7NWIliaB7JvNZEBuHaXs/9FTbAa0d7KpRGlwrvXfW+YKjSdWSN332qDigBd5Tc596Fc3XEe7mItQ873NoAzNr2J0KR/wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b2U3lzCWm5Jh72vWAgBbKFObrHIKuZjqGvt53Vz6GKU=;
 b=peY8jPhISNpeWluFjI2DWZBJzAcwYAlmI27n46BduSnYGTvV+SbiGy2Cjt5zaSSAU19jFR9BE+CkjUYHTN8ek2HtQQZLmmkoP1LYDGOfhAooq3JgV1qviZEZy4vWrFj+orzNPT57Ea9QwTr8zTp6q6BoDeZi3dsL6OadC64uuxCpXlFinc2kW4vMp5nhiZqcmxSI5mM0SnAv8+JZMD0iAMhrRBIfaQuajYFxstAI32XnS6edRfT7qZhGPedzakN63uUWfFHaz+xPP1/H+xL91UtaB1t3LGh/ydAM54fW6bmkIieeSPI7hmJM8nluyG5X3HtPio8yyNFNfxrcvCaZZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS4PR04MB9624.eurprd04.prod.outlook.com (2603:10a6:20b:4ce::9)
 by PAXPR04MB8444.eurprd04.prod.outlook.com (2603:10a6:102:1db::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 09:35:01 +0000
Received: from AS4PR04MB9624.eurprd04.prod.outlook.com
 ([fe80::fa4e:dc6f:3f71:13b7]) by AS4PR04MB9624.eurprd04.prod.outlook.com
 ([fe80::fa4e:dc6f:3f71:13b7%4]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 09:35:01 +0000
From: Rain Yang <jiyu.yang@oss.nxp.com>
To: imx@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: boris.brezillon@collabora.com, steven.price@arm.com, liviu.dudau@arm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, xianzhong.li@nxp.com,
 Rain Yang <jiyu.yang@nxp.com>,
 Prabhu Sundararaj <prabhu.sundararaj@nxp.com>
Subject: [PATCH v2] drm/panthor: attach the driver's multiple power domains
Date: Mon, 13 Oct 2025 17:34:38 +0800
Message-Id: <20251013093438.125243-1-jiyu.yang@oss.nxp.com>
X-Mailer: git-send-email 2.39.5
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN4P287CA0025.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:26f::7) To AS4PR04MB9624.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ce::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9624:EE_|PAXPR04MB8444:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d5e3ffe-b2f8-491f-44aa-08de0a3bc85c
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|19092799006|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fSkARsYjwHRL8XEKdke7C18H4KN4UbjyISgEYuaRF7XVu3nXXzxh+kMqVKv6?=
 =?us-ascii?Q?LY1muuZZQQsXztG+QOcoBo6kGq55TJyYjYZCGdgtNmQ8breLHm0USy+Yiewd?=
 =?us-ascii?Q?Seobe3FboWekkmtFVKPjTChejmZYQWKF5rZYyeLQZkwv2g8L66Z7o89WHOuM?=
 =?us-ascii?Q?4LuYXvmTYAtSgS6puFiT6O7j/JGOJ5NtpcjuScA00kEUvs0TmSfou9GP4oqe?=
 =?us-ascii?Q?ufMyRWnAlGziFcyXbb5x3zzDPPuArQ3hWIBloru4CWTNjRRlQDKH+wvZDZE5?=
 =?us-ascii?Q?Ai7aHe9iKF5K4FLnuQjhCYJdPK5sy4bhfyglc+eiLRaKcShVa1gFr3X1iRy1?=
 =?us-ascii?Q?4yjoteuEtR8fURkmrxwI0u9C7OmOotIDqEeV5tMQrMVcaJg5RCeXNNNlZ97I?=
 =?us-ascii?Q?yXiD+UZr+BEyxYlxwwmPtB52jinEo/U1HN60v6JIulxpPHEoROqLWJSPigzr?=
 =?us-ascii?Q?3h+hsSzYocnOH4PDCWJkTxltPT/EwF//x3ZfZJJNEAnJwSRAIQTvkX9gkcYg?=
 =?us-ascii?Q?Op7KROoiQavljoefgxpRNgqb0WsRjuP5x6a2gGmDL5vzWi35sQ5BhyVlfa+a?=
 =?us-ascii?Q?PDwv1sF6dfM1zN1zkNkoWjknt7+vf+UM9q3xj2cXXWrYkCzYeEFwlujoQhqT?=
 =?us-ascii?Q?4UpXqIzew9ka93ZcE7m6Ty7TU3JM/71ecafGtOSP9TJqW7JVY1QOpxGOxSEr?=
 =?us-ascii?Q?PgYDqH9+IS79Y81tneBf/vghL4KrhdZgWAuoICSMa4Ew7s7yc2lkzM0vBwC+?=
 =?us-ascii?Q?CGJQ4LhYL0N0j2cEzYFbMYLiRoAw55ntnnU6PhlMW/s34vp6eglNwNU5i5yu?=
 =?us-ascii?Q?Gx1oYK1hZV0H9VUyKFXc+0KW+K4fwi41JwxY7fSyIAY+b8vlIoAoNS0vFZfS?=
 =?us-ascii?Q?i7YBQ+mqETpVuxBILWMyckKkqgCr5vHSb4ggL3JXJlXvvy2ox9Mm1QQAe+i6?=
 =?us-ascii?Q?zjxvjsYRS070XXZ/mcKg+/3JS9AUMp+Sg79CXpMHJNUXb+CiVdgjzv/bdpX7?=
 =?us-ascii?Q?JCj40rEWSy/x0GDKN6dbE/NyuUELh3HA2Yi6E1lCU/Jc9IvF2gytHneQ+jrE?=
 =?us-ascii?Q?MUs3QeREtowLhb/U0qY76WQzb7aKya3aHRUS2Xs7n6hSU2hmiUAxceq8xGpz?=
 =?us-ascii?Q?rqF23djSWrN8HdMnZ/oZ+MTcf4Bi+jGpY9ySx82B8f5mRZ1rsUzJJpHIlPnq?=
 =?us-ascii?Q?ahrrkEdJkt2ScrPQZu8XlWP20YFZ9MIsXXQSne1n9DIOMMHQ1W+XjnvIoxWN?=
 =?us-ascii?Q?VECknLJEXBN97ci5IB0ySMtT4HdDQbHpAA6eT58adXMlK7frcZG0+b7c7aK5?=
 =?us-ascii?Q?dSm/jKUJ/7iQ8Fb670KPK92kGDPaJ4qZjPcjZqJ7i7YNXTasqykeIvR6O5Xw?=
 =?us-ascii?Q?bWSm/lAzotDfhCOPQh+f+wxsHohXDpPakrrJie3paaNI6BAC+HYkGipSC5le?=
 =?us-ascii?Q?j6rwPVt3s5wb+rxPv78wdC9mwhkSxwyMtFoyysSJLjvo06a8GIpBTQsImClP?=
 =?us-ascii?Q?yvzK39XXRdW1RuudvrN9zWClmqdoj/KFVDQ4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4PR04MB9624.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(19092799006)(52116014)(7416014)(376014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NVxXBobNFL4Y9X3hgB5C0Sr+xwl5c93HFQNmQ5cfe21yM7ppfUIZ6uabujDh?=
 =?us-ascii?Q?FIyazy81S4qIwZPzkz/7KAqaSlOqek6q3LD7B9iOjJDdHqNxlNnh+Kla6nyf?=
 =?us-ascii?Q?eZe7qdca+DGsJJ7lUe8DOuPmjbaIReL6NPdGLmn/skUHhsul1sXaKvMvkcms?=
 =?us-ascii?Q?wSl/uxHy1iYiOiF5JHHENYvGZXAMT59+ZC4QJC8WQ/jRNFqqOTMEcxZwHalP?=
 =?us-ascii?Q?jaJpGkhXGA/azdiLLcgXCt+zmByrNiv28JI55IGQ7uMx8ZsZjcvh0xtP7d5U?=
 =?us-ascii?Q?8isW1aVnaR0VT0SiJjQVq7kF/nphR/omlYw0kwDVDsg5clpCMhhSOz/j9Tgl?=
 =?us-ascii?Q?QNb/EVpca5PZsI7enbv1ZpJdnxQ+woVAyPqpuAd95LDvK8pox2KoSSGxWihE?=
 =?us-ascii?Q?LVbmFGPRYTS/BAe+w0ulq4ngJhBn410qL342GSRgTC/fQ0A+5qCf++rU12zZ?=
 =?us-ascii?Q?sYlcezG4lH3AM1LD/4Sz2aylxyj2pzHxoQiCFpAPUTKyjYDQVh77mYx/fEIF?=
 =?us-ascii?Q?VpDaCTG2Vgttcts9k7KyKDSas8PMh9co5QPVuR3xhkcWIFGPOH/WhDoLztof?=
 =?us-ascii?Q?x0j3WuEHxbn6jH5Np9vLrfjXDfwsu/+AlijJF0qNHvwjNld9OoKvnRf78Daa?=
 =?us-ascii?Q?PIZXJiAFbGQbQUgBazrfvCYeBOZyoNGaACvf/zAlXT9ZmWZyQSS8XmpREJq6?=
 =?us-ascii?Q?XBLn9PDeh7hRpAsR0TPQtQBxNVsfRHB/WuTImPDlwSbqSG3j0PubIr5lwMLM?=
 =?us-ascii?Q?cfzRYA7cBEQcD2FqCz65DHVMDZTMtjc3VzvSH12TTM09NbvM5yI+Sa/ycBR9?=
 =?us-ascii?Q?k/CFdK55Iw1FlERpHNNUZiTJdGLlPmuDtKOGw6+BTqZCtuhOJc1QfkDLFCCh?=
 =?us-ascii?Q?HX7J0xtsPE9eMsN/i3uXs0Sx786FEc1XoFcZGVFpnJ1cEp2NqU6irLSnvv8U?=
 =?us-ascii?Q?wnYSVpisvB9tnNKr60GQx/OHQ7BWBLeHhZKGCpp0A2sp44LZGZdQDPC2GWdr?=
 =?us-ascii?Q?TIaAVcMEvhNZcmHulhAC5RCVSuEq4RCxKes03HqI27AJYx8oWRMHEvQ9zNlY?=
 =?us-ascii?Q?NDrnCPMBeiuNxKQ0UN1SZq6u/7bDec1NXYE8olXCHE0hMPvykupZYDsMGEBw?=
 =?us-ascii?Q?E6AdyfGkeFDH9L2tO7kdL48b2hM1s5vo+zFUhy9nuPN38CpzAACrgNytRf/u?=
 =?us-ascii?Q?uRUioaps2Sw3NGkyB95m0LpAQ9OhUvdxTEZW3PhDumAAD8dIvXabjx5knL8T?=
 =?us-ascii?Q?Lp4nhtd/QVVHqnJ7a3d0IHZl8iwCYjDt0PiRfqtwgWLDGMllJ1WAV5tYknis?=
 =?us-ascii?Q?EFKOvXr3V88Q8elE6FfedDfTd85oIgmC+RxIIrKOhMb3fKjSxRP5KkTs9JAn?=
 =?us-ascii?Q?BYV1fYk2dJDqpBDXEu1O93LCV/PjGXz6143iuMNRGyIMfu6+Rvo/SNF+VEI6?=
 =?us-ascii?Q?Qq8oy32S5ICJS2BaMmq4GAcBUeOeN9U+Sto8ejWUTsEGaUpZP6hJLM6GEoVY?=
 =?us-ascii?Q?6gUWgDIRZWSMWRvmRBe3m69mRTXGMqBjYmrr6Xov2LL/bPCNdT7lKQ9pCEPv?=
 =?us-ascii?Q?RYk7j3j7ItAtLjkiyaaKdGrKacavbGT3VslhZ+mt?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d5e3ffe-b2f8-491f-44aa-08de0a3bc85c
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9624.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 09:35:01.7882 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 099hbJ18mU9UEBjzv9EiRLP7g9TdJZ46aHRoy4osplSiu2Js5yw9VUJoN4105CPnNeE4fTx2gqI+eTFf7RYqnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8444
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

From: Rain Yang <jiyu.yang@nxp.com>

Some platforms, such as i.MX95, utilize multiple power domains that need
to be attached explicitly. This patch ensures that the driver properly
attaches all available power domains using devm_pm_domain_attach_list().

Suggested-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Prabhu Sundararaj <prabhu.sundararaj@nxp.com>
Signed-off-by: Rain Yang <jiyu.yang@nxp.com>
---
 drivers/gpu/drm/panthor/panthor_device.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
index f0b2da5b2b96..fbbc84e9efbe 100644
--- a/drivers/gpu/drm/panthor/panthor_device.c
+++ b/drivers/gpu/drm/panthor/panthor_device.c
@@ -167,6 +167,7 @@ static void panthor_device_free_page(struct drm_device *ddev, void *data)
 int panthor_device_init(struct panthor_device *ptdev)
 {
 	u32 *dummy_page_virt;
+	struct dev_pm_domain_list  *pd_list = NULL;
 	struct resource *res;
 	struct page *p;
 	int ret;
@@ -218,6 +219,12 @@ int panthor_device_init(struct panthor_device *ptdev)
 	if (ret)
 		return ret;
 
+	ret = devm_pm_domain_attach_list(ptdev->base.dev, NULL, &pd_list);
+	if (ret < 0) {
+		drm_err(&ptdev->base, "attach power domains failed, ret=%d", ret);
+		return ret;
+	}
+
 	ret = panthor_devfreq_init(ptdev);
 	if (ret)
 		return ret;
-- 
2.39.5

