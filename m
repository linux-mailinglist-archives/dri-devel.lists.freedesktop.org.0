Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75415BA312F
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 11:07:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBF3D10EA0F;
	Fri, 26 Sep 2025 09:07:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="bxD9jAWS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010000.outbound.protection.outlook.com [52.101.84.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4596210EA0F
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 09:07:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b129HtFDL3vKRtNAGKPBvphSoXdFIBjvcBjsKJfaKpH6gc3WD+wv3HD+HlnRJDDtrCfxOeciTTDEaKmgOSL+7hktk67xpx0JBTRtxBkYdMsmW18Pr4d6w5hKgy5WuXPikFGSUWnHMomwzFrJrvP8hJNaKT5w38C4nYEEj4XxHVFeb/5VT/5UUC5K5s19BJ1sADEgV/eVeJSBkUMMfVAr84fBNqPLoC6dwqRoS8V7Ww7v8BT70TEugJ/umnPGQgQud34W1wioaBiPzGJKpCPlokVHrjoBWKSFdxXexij0Xxt2rd22LNlkW9S38iLb36QgbB6A9qkQDNlPL/25woGIPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VEaZZ72mspNTASiE4HYy/1H8weAC7yYw3VK4Xl5LZJI=;
 b=i71pfPpXVoNs/6+hGvpkK+UPa6hxLWId6Ew3Kc4mhXTTYvXgWAePcIIWLM5TCZnfDH90ajae3O61fH9KqHaLd6iY0gs8D/bYNqArpoKwsZYa0wAqDpNF5S6qJMBKJcg7O6JWgAG5jQgxhTudDihsFCe5JpFLmnu/YAWsyB6zY8G0q1lnC8hpHA+FBLnDO7vLKNIQ5JdjxkaXv3f8W9HyrDoemJ4DsoD0tIPYpRXOofcUAyVDHaC6pEBZoe82CGcz52pJAcMAkowuw2R6hMzPctVso7ms6cTty8onkkLhkHrzfphT9mfhpOKpb3hARi+ZZqkdYbiwDPOzr/qcGUf8ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VEaZZ72mspNTASiE4HYy/1H8weAC7yYw3VK4Xl5LZJI=;
 b=bxD9jAWShHFBGDKnlkI1IBQfEF1zhifew9/gxRAZfL/3cDXei37uO4IY62IE9eJsYIZlwBcZ9xrITSrGfUEEhJBQcxtKYhe1MyrK7MmwOEU2/adyROkhfPVT/c5l3BD6Fl+w8HYO5pIIiRtCHvyacrPcaebvMIJGnJd/P18S21fqpsatNLk/2Mgn/pml0ZaBPYcWpkkKR43p3nNJuOX7ve3wrlbX2cB7gMZ/oj37Q3kXhXBvEYhnC1mpSCY8ATsVK5iOHpcLRFVsrCjLeKKPBL9BIRo0oYzROJxVvW4rhfO4zbPeMJFN1jhSK8Zom4TC5oO18VAyr+DKA29WF7q4zQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by AM8PR04MB7731.eurprd04.prod.outlook.com (2603:10a6:20b:249::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Fri, 26 Sep
 2025 09:07:31 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9160.008; Fri, 26 Sep 2025
 09:07:31 +0000
From: Rain Yang <jiyu.yang@oss.nxp.com>
To: boris.brezillon@collabora.com, steven.price@arm.com, liviu.dudau@arm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.co, simona@ffwll.ch, marek.vasut@mailbox.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev
Cc: Rain Yang <jiyu.yang@nxp.com>
Subject: [PATCH v1] drm/panthor: skip regulator setup if no such prop
Date: Fri, 26 Sep 2025 17:07:22 +0800
Message-Id: <20250926090722.23097-1-jiyu.yang@oss.nxp.com>
X-Mailer: git-send-email 2.39.5
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0024.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::36)
 To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|AM8PR04MB7731:EE_
X-MS-Office365-Filtering-Correlation-Id: 16d5278a-b388-4483-b6d4-08ddfcdc1f90
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|19092799006|376014|52116014|7416014|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1nSc1rdRMuMPOg9YYSTW5KKAOFC7atej2II9ZK3E9Fbzn2lkVyQy20mwjxQc?=
 =?us-ascii?Q?kRDv3McNLXrg+jpSChXMW8EoTWVlIR0+wBBdugkmoneiYgU/BT4GA3W0Z6gH?=
 =?us-ascii?Q?Tl/1mQTtKlpY5Tw9f8vYSmpX76ccqTIJhPV3KblAyNaewAvnd1p4uTivi3Qo?=
 =?us-ascii?Q?H7r8AyrY86my62xRzd4CYEPIjDJXvS9Z/7hPJHPaMAJXcEiSQ6dXQoAyDMUz?=
 =?us-ascii?Q?ZQArX9AKIp9tzDLgNqJXV6qQw1k40lVc/+UiLXmEInuwuQaooGJ9xpXcLLJB?=
 =?us-ascii?Q?9/3C9n4UkIyLlRuTQ2QWbY5HFhF6nBApqbt6G6LcccLEiU4gfGY4eGyVO6t6?=
 =?us-ascii?Q?V2jkBHWsYNoVjykU7B54LaNMTvlDyoQWSTVt2iMbT8KuAm9pYeLiABDn7lEd?=
 =?us-ascii?Q?mZTbRY9zvlnKR1iOq5ylIKtpdsyrBkwoZ9OQtM2oqD/OYBdGRGNLNVHDFXgq?=
 =?us-ascii?Q?4ZrfD2hvxkOxinsxf/PjEYk/iNcJI7UrK3fV3Zrrnv2bq88BpT1iWqsVtFfv?=
 =?us-ascii?Q?mA0vDYctMvPmhFzsEHnoSKrS2MZqJx0MNjqwBHLxe7lt6UXtx1oI+O4C2izZ?=
 =?us-ascii?Q?4SyLsV3lBv1wccSLGCHLrxwA/8iNXEFFn+ZSPDlMy0jYNcBmBzsKNWKDEMWO?=
 =?us-ascii?Q?B88xxX5x6b/A0F2eUKIXjz/Zj50jvupst0UEKcyDxboF3veUs3LmuUuvUYGR?=
 =?us-ascii?Q?GSnaH9p/0auZI8EZmQYqGos8vU/U8N9/EK5p0jSgxq7KqNLbO1uw2IJlKd7A?=
 =?us-ascii?Q?lKyz6+w9oUUfYL3kOnOYlAyMdF1C2ULc5ZECuzZOojFtoIi8qIgcaOofo/Iu?=
 =?us-ascii?Q?kUU2gtAu1suzbKONl2O+GXi3NFVfe6E+NFg5T7wxJYABieixKNBWg+gNGF93?=
 =?us-ascii?Q?PrmieGeQ/vMDYJaf53nvP5qlD1b7RtcdrtbK58/cZZmnAjectEH0TDyRg8gS?=
 =?us-ascii?Q?A+OD4cTrQmik648YGLbqNMNj1CRU+zRqHM129US6Cv7xaO9Gwt84FbiiFK+M?=
 =?us-ascii?Q?Cn1bM81yJmbs20mvdCzsomqbAzXyvn56nQxRQsrSP8pCuwjQd+ZcTHprvgNg?=
 =?us-ascii?Q?G//B3KqQmp2lO9ajL1aTTn6PS2+MVYoxGr90rK5RBVw13C006W6EKf3Thv3s?=
 =?us-ascii?Q?TKTElDrOr/su+8xC1z17F8jv7FKtlL6XzgKJWKNLgnoK+ZiG0DIQkv3aL+7U?=
 =?us-ascii?Q?Mn96ZKPtPOCxkQYZnEP3rUBA9m5i7pB3JpJFeD813acnS9AKQ8DrGWyoH70h?=
 =?us-ascii?Q?G+k38rii8N0sH1FTGLQ5EhNyurMHnanANaSv8a839nKOUqIG/PMXsdQ8KABY?=
 =?us-ascii?Q?aoZHZPt+1X8SkpZxdRGO7QAeUpxtLrT5HWGNpoHmma66p40eq38R2BKT3JKq?=
 =?us-ascii?Q?HBnJ2TILu3HpJHOu8rQNjafYtfbSJVfTyAaSrQcQ6PpQTAIvYPvljoOSZDVR?=
 =?us-ascii?Q?ll9eUOTVOt/T1ZuHJgGlG29uKwyB5D6020id+3YcqDsoLbGFegWbBWSKFEqJ?=
 =?us-ascii?Q?30p+njQkKO1kOaM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXSPRMB0053.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(19092799006)(376014)(52116014)(7416014)(1800799024)(366016)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gTV9g4poGDqzI57Mw/uHX3eZvebgkFuyWCj5niBp9aYWlGWQrnSKzt2/mCdF?=
 =?us-ascii?Q?fnbnUtrK3cnXQVxaW2fPNSwA4y661A4+XQk82DCC+5EwnvfE/DAI1a0wHj6V?=
 =?us-ascii?Q?n4jNL4xCSbhzZ2IaK+ZcB0O0spRRZqetvuCcuyxGx926cmUU5FPury6DzB9R?=
 =?us-ascii?Q?miqS11qou27+n1XZUdiYjG5LlWJ7k8qIH2y7+BEzXQMdcLVqSGJ9jPDtM6sX?=
 =?us-ascii?Q?Iz94Id3f/T5h31NrCsYXpk5OJGyoQRDQAEDn2xwBXc+3TPIaQ8gheChSmOkf?=
 =?us-ascii?Q?pCn8j5U3DxBq0AVNWOuSmZASv9Cmw0kFpHwzcOPLthPDEnaux43c356gErw/?=
 =?us-ascii?Q?CNpRnBNn951rUWpUxs3bzbRg64tjptaJ1jn364tW+ABYpgEwolKsiV7+NA1k?=
 =?us-ascii?Q?U1v/P0i2ZmMDXtcnkmii7avhhIyrHAyT8ZOq0TYHiKasM/JpB58KLK6eXESU?=
 =?us-ascii?Q?IeQHyLuJ2d3R8dp+/kYb//9uP2vISpGhM+YF2crcdFvtvKpP72Jn0P32aMs4?=
 =?us-ascii?Q?KUAYVxY8kNA+ZcXWhZ3iSA7FQC26lQCCsUPJq+W8+igG8VGDm88mewKjsXp5?=
 =?us-ascii?Q?RiRYJWuVzZJN/tiFGiTqDWYBfsGg+9dBuEZV2K6Ou0SStRZRwLZe3YWBbQQm?=
 =?us-ascii?Q?rWR0HGbv4wXJGPW0d8UNAiaQeYdgwmVmvhj4lMOrezLpaIbCqeAg06CsO5KM?=
 =?us-ascii?Q?cGLFDpR7UyrKhiR4prkmetuTU40MyilW6QZpPjH9nfpq8QI/GR8wrySBvKPa?=
 =?us-ascii?Q?Zpyd+4xgzsqRc2slji07HwQn54bmkxywgcBWSeErWHvwqVV1feqOAYZdQXXe?=
 =?us-ascii?Q?ZiLF1VNM0HoPGvvBIz8sWJBRU/3rT7rs0IoR/2KyPK6yqvzK4GKoh08628Pt?=
 =?us-ascii?Q?ezDaIOeg2LABvYxHwPwBHdC1mb38KwKkqRZA3obv1MsRU/WL1rM9guOt2/Ro?=
 =?us-ascii?Q?YmLjehIy46s6hz8healIFtBW5h2FD+Sw7mZVuI/h6VeJ2ALGvcRgC73hqywC?=
 =?us-ascii?Q?yY8p8e79UKyHYfa77L/LMf2tLG85plPaSv7YFbGzte6Uwwz1YbwtlK/7R7v2?=
 =?us-ascii?Q?NOeVr6G+cGwTUWhLj38+4/qS7n+U7DdCcmc1U3eIlARnHJv+G3+dx6JACTtP?=
 =?us-ascii?Q?O4zxcGxs36FL8p+R90T4ZgjmGMtccnz8mtx5qbPWQjhsTp3qJ2CNN6OJQlCH?=
 =?us-ascii?Q?aWAcjGD90hsD+3gkBnupizJgP1Ur293t8g1kiI4DWoHgtZ5io/X/5IV3LRqZ?=
 =?us-ascii?Q?3Z12AimnhCePApv/xVrmzCUcm6gtMZ+UuRDVPAp/+1PbBmE685ledRta8VX7?=
 =?us-ascii?Q?maAqE1SteW0OTCXmCnQ5NKyYLJZNAfj3O7Co8pBbabL03uBlsTl1KXtAdb2r?=
 =?us-ascii?Q?jAahX+ObEjyT66XaTQ5lt29p2KByf4JwJid39wCzAnQXpqjlinPfVIwLjcCp?=
 =?us-ascii?Q?NKekAp1bak9EqAa+4B+qNpeePqfSRqjfkadVRBKRjdvaS9VzBJh2StfyStG5?=
 =?us-ascii?Q?Nq/x4MQtF1BIN1DYUB3WdZ6j3ugX6STMYnWl9AhJApdchZyZ71OKkG8F4OFn?=
 =?us-ascii?Q?ORVewGi/6G6ZqlDkV3Ane0h3z7ICOyG7I23i+1JY?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16d5278a-b388-4483-b6d4-08ddfcdc1f90
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 09:07:31.2716 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MKletPAoaQRlfgBr/5ZNCZAhG8U21QxpCKNSpQmdmRvNe3H/uoK6/xCcVSrQkbZkC8T9pRCaWNlRDPpxKBpdNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7731
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

The regulator is optional, skip the setup instead of returning an
error if it is not present

Signed-off-by: Rain Yang <jiyu.yang@nxp.com>
---
 drivers/gpu/drm/panthor/panthor_devfreq.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_devfreq.c b/drivers/gpu/drm/panthor/panthor_devfreq.c
index 3686515d368d..2df1d76d84a0 100644
--- a/drivers/gpu/drm/panthor/panthor_devfreq.c
+++ b/drivers/gpu/drm/panthor/panthor_devfreq.c
@@ -146,10 +146,9 @@ int panthor_devfreq_init(struct panthor_device *ptdev)
 	ptdev->devfreq = pdevfreq;
 
 	ret = devm_pm_opp_set_regulators(dev, reg_names);
-	if (ret) {
+	if (ret && ret != -ENODEV) {
 		if (ret != -EPROBE_DEFER)
 			DRM_DEV_ERROR(dev, "Couldn't set OPP regulators\n");
-
 		return ret;
 	}
 
-- 
2.39.5

