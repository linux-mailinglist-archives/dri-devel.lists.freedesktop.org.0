Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C20BFB26B
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 11:26:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7EC110E71F;
	Wed, 22 Oct 2025 09:26:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="rH6MnR3/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11013065.outbound.protection.outlook.com [52.101.72.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85F9010E71F
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 09:26:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bCJ66ATu05wm7Ce2KcxYMQNqcCgFTfh1zrw2T5JMrvZvoDnAZT5ocmuY5HwPuA00VxT+Z++0C1SzVT/nRoffp5DA+nqmhMqdwWFMxOiOoOqNe4DBdUYeV4Ad8Q1f/oGiL9Sngs1POt2XhR+lR21lskfTV1LH2zvO56L82EXtFDwkjP1iYHdMCi1F9OoLGzfw8iNiuYn2M4B+kdE8gukR72I8X8rqxP5Z0SLgIO+0mpUEyFauswO1m2jJOA3JyevpVSr+X9t9O+/1Fv52zdav2YLGSNPk6986SwriStf2PwAmLsHlD5EbmR6G8YCoS+IE0X0utnXlTBAs4321dvnlMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4oGvfYtNO+8r3mt0p7QFbJk3JrOnI5gYqvNwWRZwAfU=;
 b=THUaArRKAhUQpFAiNx2iuG+AMNKxfmefhsUFDRjQu3IIDOQbIrY1yi5VvBTUl2r+vmVAgWWjiaP0EHA9cKeEgh7fTYgsuIsGA5OZ+9693Z6kvSeYAX1v9VE3lFrHjnLp4xA+283imfjsjDg9nFLucPgU7qHQrMDFjrCON9kpoUdcqixjlqRDty8IemRXSlBwxUnpqBRc0otREk9yNNc0PlcHhHktcJIMKBnNr7GSzSERWS9DTDOdZnY7AJJ3aAGTs7uLbOux1hp+l+b4F8DO9TMf9p9hbtqZlBakRMAWoMYasHZCHQsLnhCvHrQZISlq+27Nu94AbOwL4duB53FsIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4oGvfYtNO+8r3mt0p7QFbJk3JrOnI5gYqvNwWRZwAfU=;
 b=rH6MnR3/upwzIjZvLp1cEAXcP4ShxldFCNuv6MQDBJ27xHWQnmpguCJUmy8TOeARQAIWAkC81585K3SVc3/OLttkgv36UyqDrjndrn9i68PsqZDkQ+tnobaYYUFUiWfEiTcNoX6f1iEeN7RbkOnF+pljbime7t4XiPErWAKM4kkxsBAnv/yDvcEcbNAL8aVvbnNbfYIlIXKaCcB1QN9d6MCFQTOARwzDsk8hfoI2sfj7t3K88WIzNs6JVCSj9AITe55uBKRXzfAgil8H0axJ9uTcquU1NLvG1JXdSyV23bWHuzvNpU36dYhDnad70c5eEun+ZVd/7SuxPhTOatduGA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB9PR04MB9627.eurprd04.prod.outlook.com (2603:10a6:10:30a::13)
 by DB9PR04MB8185.eurprd04.prod.outlook.com (2603:10a6:10:240::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Wed, 22 Oct
 2025 09:26:31 +0000
Received: from DB9PR04MB9627.eurprd04.prod.outlook.com
 ([fe80::c5f7:3093:4ebd:1a2]) by DB9PR04MB9627.eurprd04.prod.outlook.com
 ([fe80::c5f7:3093:4ebd:1a2%6]) with mapi id 15.20.9228.015; Wed, 22 Oct 2025
 09:26:30 +0000
From: Rain Yang <jiyu.yang@oss.nxp.com>
To: imx@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: boris.brezillon@collabora.com, steven.price@arm.com, liviu.dudau@arm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, xianzhong.li@nxp.com,
 Rain Yang <jiyu.yang@nxp.com>,
 Prabhu Sundararaj <prabhu.sundararaj@nxp.com>
Subject: [PATCH v3] drm/panthor: attach the driver's multiple power domains
Date: Wed, 22 Oct 2025 17:26:04 +0800
Message-Id: <20251022092604.181752-1-jiyu.yang@oss.nxp.com>
X-Mailer: git-send-email 2.39.5
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0052.apcprd02.prod.outlook.com
 (2603:1096:4:196::18) To DB9PR04MB9627.eurprd04.prod.outlook.com
 (2603:10a6:10:30a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9627:EE_|DB9PR04MB8185:EE_
X-MS-Office365-Filtering-Correlation-Id: a4d719b4-e6f4-4e47-5d92-08de114d155f
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|19092799006|376014|52116014|7416014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?omKZ2bT4zkD9BHUVwnPQ2IiPxlIoMv/sQXYAnZMd4bkjVycqskrJHGQdYv84?=
 =?us-ascii?Q?MbkDpN1okLui8f2LrDRszRRGvPlKIYUv5ZTJeI4AyRtOjjwnMz15z7PJ0RxL?=
 =?us-ascii?Q?JvDgBGcNN7Z2i1z3miR6vzOMxpBdLWIv4MoGisCK/j07EAmGPhmtuatq8Av8?=
 =?us-ascii?Q?8yKCoRWLuxodnNSIrPA/Pz5p0XhN8N5bu3YKDNKO4bcWn5RDvWstQIhbw+OV?=
 =?us-ascii?Q?Bm2doIhAmnRYhoMBbptBRRrwOqfpb2wAGxR5C1f2ty6ymynDRmo3MnJWBIp4?=
 =?us-ascii?Q?3Lgoqm5CMVm6cPv848ms7ms1KqiItCi+CIVTYK3JwPsKv9nk8YRmsG5yLQBQ?=
 =?us-ascii?Q?xEX1kNGWQNNPAWzn7El9eUCMVYym/pVVj0jbxkc1i5Zd0rZaLeAE5DpG2TSM?=
 =?us-ascii?Q?zqErXRhaBbWmi+SOzIb3gx4dwr4Ub/ZFLmFbFhGmLHijQVufOLt973fG6jNF?=
 =?us-ascii?Q?/bclmnvav+eVAmSBChv3BVSAh+frjKUxghSy551gpgaM6o4JrXG2CZqftn6v?=
 =?us-ascii?Q?kH2JsA4H42l2ttnAn+BT8V9QLLPBOzinKPBx+XS2rN5m2flIBcD0lkE9Vipw?=
 =?us-ascii?Q?XfJg5hOulvOqMQJl6xTFkK01PRh2ufMporBFoXg0v16vhl9U9b9xVFA+GOHh?=
 =?us-ascii?Q?5qiJi8LAVYfrQIVPCfgTNx6VoWQGNZZiyp5yUt94SZ5hsceSHDWK+6YHK8dx?=
 =?us-ascii?Q?9vxctbX3yoP36vYegAH94ERsjNF5q0I3hUWP5DFT9q1Xn8q4ryKxhs0x3hiE?=
 =?us-ascii?Q?mXHEvqW+IlV1wjKQLNv4LMmoyOhtAoF1NWRz6GynHSzdpkYvvQKSATdHSaQA?=
 =?us-ascii?Q?aBU6YrTdI4ZH16vHWSKE0Qr+P6V48D+9vAcmB5vZuqiGogYf+1tUHcTIQHD4?=
 =?us-ascii?Q?A+cHZqtXgwck4hCl4UtJKAOfjoqpf0QLeRJLNsj24PNFSxl+jQvAi3htu0yD?=
 =?us-ascii?Q?RR1vNhXgMKfRICl3bOMsedg7Sb+JV12/E8anYziyORVvyl8/tuyn/PjexbmQ?=
 =?us-ascii?Q?qll88TA1A1a7xGse7iGCkOCui5uoHvmNyUZbHOzAxxT9xPGFKEBQZ9U0MDj4?=
 =?us-ascii?Q?KBtp4gB1O5fh41aXdDzbenvLic5oViZl9TFqBQh+yaviqiVjzfXTHmdW+TTG?=
 =?us-ascii?Q?OOxgTWadDxfogrl0QMWB/ft4+9FIGyXADocaTCcwk3jm4/n/VpsCmH5sPc4d?=
 =?us-ascii?Q?M1L8gVRbjqnhJRhPwRclydU6lDa63Tncl8l19zWes+MOEa4kFvrf/FClCcKz?=
 =?us-ascii?Q?NiFRbEg+8zZfYbEbQUQ5U11dc0626uaeYEyAf2Pnq4gg7jNaklZtvVEM9RlF?=
 =?us-ascii?Q?1OPmC1EL2ofbJWky+pMkOK4uZwWfDwhRaXt60RQzCTkFXxTi8JfDRYAqPODM?=
 =?us-ascii?Q?CZFZpo8jDiY0+xh1MqbfsJ/DfFjkK1h7rsh0kNbtT1CpPK/ebyXx7G38YAJ7?=
 =?us-ascii?Q?M+9UnoBzsYW4dN8EYc1m814l1+ruH4FU643tiQBkhGwhZiHZVY04HRZ5Fb7T?=
 =?us-ascii?Q?tE8ltPSvbZ4evAyoICykpZfp9syKB/Qu2xqZ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR04MB9627.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(19092799006)(376014)(52116014)(7416014)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?g/wusT09ouX5Tbo45ch9L54FUsFfRRjyZrkX+NuItSbdhr8eyWD9ZUALS6Yv?=
 =?us-ascii?Q?3/w33iIkyVxp1vT4FL0q/tpxw3ge8NGgQluMwd6rHi+Q6/4Trc9SF7AGOwnH?=
 =?us-ascii?Q?nizXwbGaOUoMX4hONP6NPuf4Ns5tRzbf6DPmTFPgbkTsBrkQW8YpBZtr9j8B?=
 =?us-ascii?Q?NtRYADO/Gdh0/jeN4yIf6uS0kvznUD9er/y+/jA3Jqi9yYzlil+PB3E6Oeo8?=
 =?us-ascii?Q?7v2v/qJdPvqPxn6utMeZO9isVdj9j7auO7WrO4sf1Pd5q6nHXC+rjAsCs0QW?=
 =?us-ascii?Q?BtVTbRxwwRYiFOi17NFNE+0UuGrXbejdm/vKX+BnBUS+RBd9/9fkThFRZq7k?=
 =?us-ascii?Q?DNN6r0XRg5ViFR2Wg5LJQ2Yjuxp3qP+gpNX15lWKEclI97JXOGl/c3TvCHZV?=
 =?us-ascii?Q?KuV3ycn/8HaR/zYuLXG2ncTvJbtBm94TpzaEI2wd9yz4nB1m/jIS11pBLSr2?=
 =?us-ascii?Q?14OxcW8t7PWbCe9OaotaG80507MyhMAvs/Iw7fauKDbclQW1+rtBVDVVTTag?=
 =?us-ascii?Q?fvCFo92cZODnBWenn4O4Krv4jURbCmmLtHXRC18IP10Eip4fEwWgcRAAmFxA?=
 =?us-ascii?Q?E6lU70hjYjh9NWYhywbyiQVqFvexj3DQ54CDAC85MrfsBtpNzZeRxhIG9Kmv?=
 =?us-ascii?Q?TlfrAIlOTjiJexe0VFneX1OUmVx07BSegTibErQHi2UD6ilXVBAtP4aKB5HD?=
 =?us-ascii?Q?+CnnmellJd7uJsRKw6rWTBJaBEUlCAD6P3lXs8lvGQYLVpC2iZjCOb3Rey4u?=
 =?us-ascii?Q?48YmJ3+gURkfldLTJk1YFB/rb4WCBXGFcfZXdf/+lse2ip5YlDI/nO4DnWxX?=
 =?us-ascii?Q?JCwHtfc94F0gY7qCxsy9KjIBv86/FBFRGyd5An1ih7y5yf+20SOZafcUt9Gk?=
 =?us-ascii?Q?s/2Rq2fgLMVkLET4Kvng+cXcgYKloXxjBgFJ2u7x8WsBYKg1hB54MSOkXEO7?=
 =?us-ascii?Q?H3F6csSdm8P5t4mog8lGBMA8ZzTGMz81lswphXaBLd5fe3uNkHMII74Rs7pX?=
 =?us-ascii?Q?N7k31IDsYthMQmcxIB9IbOf47dDeSgSl6rsILyP8G8cpiPYw2bcDsEPysQzd?=
 =?us-ascii?Q?6UNWdHeIxKaXNQH8jOA0erAY7MdAgsie8HlMTOOJdBfOFTRVxhSv4yb7PzXT?=
 =?us-ascii?Q?kSrZQCAGmC8i+B9u1Zgi+VAVyboNWqSw/knDtkYW5QFGDzsXMXoj7Hx63lbO?=
 =?us-ascii?Q?XYWk2mLBSpe0qrTaYMxmTIuU4O0afsYwOK2IZHFJdJtaXrG6S8j4xT+mu98j?=
 =?us-ascii?Q?IT+nq2GpaljIcDElnNQlUi6QM0L3A+8vY12nbKwwGK1vqDtM43c8q+knTpMp?=
 =?us-ascii?Q?TAQHvXbRXKvh8Qr0HTlwrt3iCKS59gJQWWuJA6GJfLwlntIWdy/pvsS/3Tab?=
 =?us-ascii?Q?oAbgml2ljl4TXNJaoTyKamPWkvTFzOizoUBLHt9r7CHrtmBViAVjQYVuACrA?=
 =?us-ascii?Q?ZfPyFGDigncRwlCIW62/QsH2DolWFuyQnlXObmvQTziWV95BqJ/PG8c/+mxj?=
 =?us-ascii?Q?eWDS1sFVw+YVJqRNu7TkfFSPos/q3+ndfGCNoJtSzuHQS6Klef99wchjh2XP?=
 =?us-ascii?Q?9sqVQY7PaoF12ZOfz+Lt+oMF7Q0+5FM3efS2u8dg?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4d719b4-e6f4-4e47-5d92-08de114d155f
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9627.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 09:26:30.6621 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +MoYzfrtdmM7SXCSA4nuJwfczq/gAzgprlqrB74ODMYTOGHiZZDftDDkOmEB9OUMZ5tqRW3ZaNVSxMfZyEhxWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8185
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
Suggested-by: Steven Price <steven.price@arm.com>
Signed-off-by: Prabhu Sundararaj <prabhu.sundararaj@nxp.com>
Signed-off-by: Rain Yang <jiyu.yang@nxp.com>
---
 drivers/gpu/drm/panthor/panthor_device.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
index f0b2da5b2b96..c39b9812eaa7 100644
--- a/drivers/gpu/drm/panthor/panthor_device.c
+++ b/drivers/gpu/drm/panthor/panthor_device.c
@@ -64,6 +64,16 @@ static int panthor_clk_init(struct panthor_device *ptdev)
 	return 0;
 }
 
+static int panthor_init_power(struct device *dev)
+{
+	struct dev_pm_domain_list  *pd_list = NULL;
+
+	if (dev->pm_domain)
+		return 0;
+
+	return devm_pm_domain_attach_list(dev, NULL, &pd_list);
+}
+
 void panthor_device_unplug(struct panthor_device *ptdev)
 {
 	/* This function can be called from two different path: the reset work
@@ -218,6 +228,12 @@ int panthor_device_init(struct panthor_device *ptdev)
 	if (ret)
 		return ret;
 
+	ret = panthor_init_power(ptdev->base.dev);
+	if (ret < 0) {
+		drm_err(&ptdev->base, "init power domains failed, ret=%d", ret);
+		return ret;
+	}
+
 	ret = panthor_devfreq_init(ptdev);
 	if (ret)
 		return ret;
-- 
2.39.5

