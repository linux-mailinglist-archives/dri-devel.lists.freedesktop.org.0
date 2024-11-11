Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B49CD9C3FCC
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2024 14:47:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E691610E1EC;
	Mon, 11 Nov 2024 13:47:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="mMiQUC0+";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="mMiQUC0+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2049.outbound.protection.outlook.com [40.107.20.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7A8410E1EC
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Nov 2024 13:47:41 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=B/FaiAEtFRgIvZ2AEQ98Ch68wY6v9uYq90X5+yhvpSJTxUBqi2qOVzqmQwJLaYia8g1ssl8y4lCMeWf81z9rfVk92lrqvXJI/gmE3X2iKUPFRR/8Dqum7zdHbgddVIoe4kkRZPjHUBlgAVL2OesvoxAaO6hNQaxj2RjBsZWt9baB8XvUDPzgJ5vjx+QL+ScRkicctelvDfIfwVWZaaOSaB5+jJPk3me391haeKVkH07VWNIZcn9J9J19r6o0KlQ/fJ9W0iCL4Mj6luFHEagMiR/hBseNpaEi4P9rTna7tZkdzCSQINjQWHXjUa4D0TTkbUAWOXrC1jgSGEl13AOfZQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hz/YdidCUvsm0/1YeVz0mY5fg9cwFdORZy2m3ITzB18=;
 b=VRGShVKxM4Vl7+PQPYGSP1gw3xGD0HTRRzVKyieSZhLMle1s7lgl1fF/gIVEAlnJwI1Z67pmaHd3tdhVMFeEtIbcZ3qQXd3VW4u73ZhkTHfC3AW3N4xaaLxfdP50ARILSJxUgfYAF+UFI7jAdlg8cVbHUT9ULLc27ODZWI/389TLNstuAGiBWISBdQhPUHkNmKZeDMs0ZuM2lII2AuRcMiUrmj3SmK64EN2OI3Zyeg+t70o0nKSPxD0OwGaAfKd6xobOR3PzrUn+A1An78AI965uqrUSdK6Jhc1sgKKobEM4xXtXMdnUZKnDR1+wbx1aBUIBaVvcNUjpZUiYTQvQxg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hz/YdidCUvsm0/1YeVz0mY5fg9cwFdORZy2m3ITzB18=;
 b=mMiQUC0+95enqGc53WCzgWnKTVFyVt4+FKffvBBNRuRv0dXca//3xcbOwIBDnKqiZqohK6+EZR0jZZ10aAcyZ7m5/zi101no1Oe5m1KL5Tv7Z1lXaJQMKunU1cab189u2KsD9xY3Q9zNb0hxZu4fXFstGgIggOuNxhxFlm8H76E=
Received: from AS9PR04CA0133.eurprd04.prod.outlook.com (2603:10a6:20b:48a::6)
 by AS8PR08MB7886.eurprd08.prod.outlook.com (2603:10a6:20b:52a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Mon, 11 Nov
 2024 13:47:35 +0000
Received: from AMS1EPF00000046.eurprd04.prod.outlook.com
 (2603:10a6:20b:48a:cafe::fa) by AS9PR04CA0133.outlook.office365.com
 (2603:10a6:20b:48a::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28 via Frontend
 Transport; Mon, 11 Nov 2024 13:47:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS1EPF00000046.mail.protection.outlook.com (10.167.16.43) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8158.14
 via Frontend Transport; Mon, 11 Nov 2024 13:47:35 +0000
Received: ("Tessian outbound b291e78f2ea6:v490");
 Mon, 11 Nov 2024 13:47:34 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6d72aba52f051b3d
X-TessianGatewayMetadata: zuZBtxbUpY4gYrAteEJodP3HTMzbY6C4x5oDA9LcNFbkC01ic7/RzdpLjQppSZfMaTfcLjJb0bH+ZNamRaweF/dvEwORuBoIwA/QVpzZGNIol6Zm+dxsBGh8lfEjN/reZHgMdIrtw59pveFuY9hG5kZ+PRtjORCyimr43RLMLhw=
X-CR-MTA-TID: 64aa7808
Received: from L3b3e890fc096.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 794663EA-600C-49BF-975F-B6212CE3ED26.1; 
 Mon, 11 Nov 2024 13:47:27 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L3b3e890fc096.2 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 11 Nov 2024 13:47:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RjWM1hAHYAW3dpxigUdRy0CGGkrs9qUQB15jvx4pO7E8BFm0Sy30MJJxYqUUB441kJB2vPeIntk/GgdLi8KKuGDSye54YzOknrfOg0UcCx+nR3loyU1t0DNMoJ3IfMpGkEqDWl7o1NScA9TlL97E94kJ9cnlcH4lyxIDz0kKhDv5U/olmjuzOyZg2xuxaZ2y5jPo3cm0JK3o7NgsqEnVCkho4Q4LZnQiE/ZQ2q1PLwuaW98PaBYeYxaK6TU6yXeB5F6jl0RRSlhxkBNqkVsHzGASe7z0yZXWHVMFUyvf7vq3SwC/xsoyBtnrr0Z7G/5dvjScS+dGLtMGiL6KF0dSkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hz/YdidCUvsm0/1YeVz0mY5fg9cwFdORZy2m3ITzB18=;
 b=V+PbcJ71Mb6YhNwQtl0cskUsJzCDc+brAOjhYPjgTKDWYSOn1ChusDh2Rfs2hW6fYyrgE8zTQnsjBVP3PT+r1C4iFFoYcYJobrOe/EvV7r6MRSOXXkcMXZliloBGq/u9NWgvqinrgouHKUcEMPVC3AmrNGq5fslThcJYXaDcBS1WLZkhJoDQ7PDQzskBBvN2zO8sd97yubtyGCqSzHM3dJOianSccQu7TQpn1KniqUW/dpxpRGzJW4U1E4sj7SOSjgs6eL5TprKYNdbAsfvxDfH1mfKwFjuLkktDDPJevus6ChQT4iiwgHAAdE9IJgiPAhCE44sjGXrAeCulITaTdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hz/YdidCUvsm0/1YeVz0mY5fg9cwFdORZy2m3ITzB18=;
 b=mMiQUC0+95enqGc53WCzgWnKTVFyVt4+FKffvBBNRuRv0dXca//3xcbOwIBDnKqiZqohK6+EZR0jZZ10aAcyZ7m5/zi101no1Oe5m1KL5Tv7Z1lXaJQMKunU1cab189u2KsD9xY3Q9zNb0hxZu4fXFstGgIggOuNxhxFlm8H76E=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB6982.eurprd08.prod.outlook.com (2603:10a6:20b:415::16)
 by AM7PR08MB5319.eurprd08.prod.outlook.com (2603:10a6:20b:dc::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Mon, 11 Nov
 2024 13:47:25 +0000
Received: from AM9PR08MB6982.eurprd08.prod.outlook.com
 ([fe80::5d5d:a4a7:198c:fbdd]) by AM9PR08MB6982.eurprd08.prod.outlook.com
 ([fe80::5d5d:a4a7:198c:fbdd%3]) with mapi id 15.20.8137.027; Mon, 11 Nov 2024
 13:47:25 +0000
From: Akash Goel <akash.goel@arm.com>
To: boris.brezillon@collabora.com, liviu.dudau@arm.com, steven.price@arm.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 mihail.atanassov@arm.com, ketil.johnsen@arm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, nd@arm.com,
 Akash Goel <akash.goel@arm.com>
Subject: [PATCH v2] drm/panthor: Fix handling of partial GPU mapping of BOs
Date: Mon, 11 Nov 2024 13:47:20 +0000
Message-Id: <20241111134720.780403-1-akash.goel@arm.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0052.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:152::21) To AM9PR08MB6982.eurprd08.prod.outlook.com
 (2603:10a6:20b:415::16)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM9PR08MB6982:EE_|AM7PR08MB5319:EE_|AMS1EPF00000046:EE_|AS8PR08MB7886:EE_
X-MS-Office365-Filtering-Correlation-Id: 102ee922-f7f1-4000-0b8c-08dd025765e5
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?4jQcbtEXgvjjXi1gbZWSY8UerqVMji2avmuYwkTcDmZVyuhxqGX7usnZY13Z?=
 =?us-ascii?Q?kBpMfNHU1kX3QKWoIdhk+tB6/0V/ePGCbZrZTZQcBNCoJohrwjx7llcvgFM1?=
 =?us-ascii?Q?gOIkXMIus0rBH+UlezskkdG7BBvE49HMQS+L9I4fZc++nUikbAdIIKYHtmHX?=
 =?us-ascii?Q?iYJiGVzIs4ykJEhr18Cr97ipUgcJ7b505mDF78aEpF9PhfqWlWh5Xfs/IHgx?=
 =?us-ascii?Q?DKJAhK3/PcmaILhsgTkoowpSz5xAidvNVRRTVPaIZ5ev/FeEXszhhA0MfMEW?=
 =?us-ascii?Q?gKAL+406e/rybBPdxKW1Q2w8975KlgvY7G3130CnSdynhIwXsAx6DXmE1ox2?=
 =?us-ascii?Q?Wzu6Oci97vtsAIoLkZNvzKMtJo6V1q31Ix2UVbjOuHEW0/UZIaipNP1Fxxpn?=
 =?us-ascii?Q?QX+rr+BLR0alEYAz3UTcuBkuv0vXK9pF81RVYsyg/pbc4W94etTBvVSq+mY5?=
 =?us-ascii?Q?dWSU+Xw5LuGd8WH1vGRK0/uDoRVtRmMf7ko/Mlw+OwJCYgLzcbVsm0ofahYy?=
 =?us-ascii?Q?tUmH6uX/t+SxnnwshFupkWzbUv+XQsstjkJnfK/qOzV55VNe1DD/w+WyHXcy?=
 =?us-ascii?Q?cEtqeNNN+y89j1232RQCR/kbd46oGhYf19ur1NgvkKwjwwal0g+0ywsVig+N?=
 =?us-ascii?Q?vwnlBF2NkSSwJPNMJ7zTp09H7WdnXmuodGLTHurSeBTuo2n0g9mzR6+Ts0A/?=
 =?us-ascii?Q?JHGfpfjFnVa0fcNacZrPoIqf+cL2QEbsyj4cAKDFiVG/waVsG7OC445Xl4ik?=
 =?us-ascii?Q?5ro120QaUEUnaKb8JxucgfNV7UAVY8mHbIrBLcKRdh23oxmovezqn3+p9ksX?=
 =?us-ascii?Q?5t4cV5rdB6Ve5QKHsm8f1pmP4BeiBltozv+a8s419NA04+PfSmNprtrg/ZUZ?=
 =?us-ascii?Q?o4b5sIOLtkbaRGbB24G8QzGqZY/Lt2k3GX2MBo8aIifscCm8sIfiFgvqz3Mb?=
 =?us-ascii?Q?pXsI4xMOulpsZqfwmy1biQlceCiaXRE67WXBJVQ8dvQrAGaN2hf3jS06Gxza?=
 =?us-ascii?Q?x1zZt2fx/+e0YVqWBhUkdRSPJRFfClYhtf3fUsprM4dtUhbibbZ/ya1MrL4K?=
 =?us-ascii?Q?ROt3POqLi1oiSu0lRNsccJBSOWzoHA0CXiywP5GV/BB0/DJIBwynpstBXuQH?=
 =?us-ascii?Q?CWQS4aHzd71hcH6J2GYU9C4bS0xz4qh2NOUibAbVmq7FrN76qftzPP0a5Ung?=
 =?us-ascii?Q?DGDf9/6CjgkdkFCP7gU5hwL3QzCVlXLVlJlQSr5Lzmu7Z6r8+n6REhCFJPVa?=
 =?us-ascii?Q?8n5ZtnYMukYzRQ77P5QKrc8NGwuEa1xwkZ7S4w0qqXUjrvhpiQ8PB099Mb9i?=
 =?us-ascii?Q?ZeIh1vAZEle+XYZ70fohRGIW?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM9PR08MB6982.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5319
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:20b:415::16];
 domain=AM9PR08MB6982.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS1EPF00000046.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 9580b422-b4fa-46cf-d54e-08dd0257600e
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|36860700013|35042699022|14060799003;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xYeAFczAdkOR8+ePS8E8xbPTVKVo77s1XxAUbtJ4ryXySAniZ7ykEq5NIr9f?=
 =?us-ascii?Q?ulIn6gJ/vJOkO33sXEviouWwwD21UNYczRvIJhhfrGaRQdknRRt3gtMQqon2?=
 =?us-ascii?Q?A1t80VtbkVXN0Qs8eE+K4RDPAnf2ogJhhUSRCKIwKZgpUkScP+Kpx7FHElxb?=
 =?us-ascii?Q?MyJgjZePB/oyNUdG1w7+Oqdgmh1M6MSwrAnRsbEgAHsMmwE/rajNuN0Kc6bJ?=
 =?us-ascii?Q?K3E98xElDlRvYItgIGUpLAK6v1KkIFl/cYFUd/91nkGxhCBYC4kN8bOnxLgG?=
 =?us-ascii?Q?Pz1Vt4sGRkSmU1A1MTmcgIyiMSAJuCffsT6E1aDdQillxDqpsWioE4343DCy?=
 =?us-ascii?Q?Rkmep3lCq23gieHpdmiv89iK3Y0+46ojCU0tjQe5VwadO2mzkALoRe4CEW04?=
 =?us-ascii?Q?5S+5H7VwKif2+xHzRwLIqsvzV4oeQwaGEIpW5yPS77ZEAa24K7xkQ2Pof0Uw?=
 =?us-ascii?Q?nrqe6kHCsCAlslIwrP2SHjOwrCxvqQv4E7FmaAwpOm5gDOtKIdES0UK0QLMe?=
 =?us-ascii?Q?0UgSWbqs1zkyIs6NoVysN48cvRkwx1Nd9czt/sR+kI5gSDp/LfD36LIv16V2?=
 =?us-ascii?Q?Z2uTPH57gfCw133vyFBT7HUS1Se4l5dz2hEjdLXco0pcqBFVMAFUopiKEkxB?=
 =?us-ascii?Q?V92O6x/iGG3o4SpaJ8padMhUZnIJ7WjhLzBmIzyDayJ7nqL5CN8aIXJGX4wh?=
 =?us-ascii?Q?8kWMXuiL40PdHOiQp9WO9UE0YPBKcOg9DS9h2J0Acto9UEfKg1rMN5WRQcco?=
 =?us-ascii?Q?8iVK0QLk3W5YuJVUBAYexjUDREqYrhEWurqRCN7ljPJzLOjvklvQbJDilBb3?=
 =?us-ascii?Q?tFDGzDyQUk1WrbZGwAG45uggb2D/4iEJos1BgJRLmDgvIZpwFSuAD/Nrrbny?=
 =?us-ascii?Q?rTWKmRYpFPDPty5PtUuloakxtJ0+VC41+9WrLkqJ2GDz0cbuwv1vL30VC93j?=
 =?us-ascii?Q?e/FPoFdhAgrCJlLKaNTlYY4ZYewOIJQwT/vx5m4t7RGBdE5XJHZHWWaMHCpQ?=
 =?us-ascii?Q?oj1tJWAIX9ud8tyRse85SuHg3a5CPdh34k4zYRdSEAvZOpBG1MmaE91UC4yH?=
 =?us-ascii?Q?eqn2wI2ai6ajAytZRmnlRXW0YAbb/A8UVtFP58nYpVN8M5GwM1S4xcL8dRYQ?=
 =?us-ascii?Q?5To4Ilo15auMDK3n6HHZx7mRvwoq1gx/XmUJ9vJidu8EPLqs58VbAlhXCq0n?=
 =?us-ascii?Q?PNcKzRlo7kJy3HmoyUjkMFGgfT4ndgpHySFf4zLN+c4xiegXD9uLe0BFy/E5?=
 =?us-ascii?Q?DKN/KUg1Rn417ImoAVR31dPq2iGFyKOe7kLIRPLZp45QDJN7hufCo2DHV+XC?=
 =?us-ascii?Q?yngL5QUD3s0XEwMVStGtEvzCGpO3Pu2E9+tOt46/0DJPvIv1YaIYNs5lzZj3?=
 =?us-ascii?Q?afyK8rTBS5F5f5wq0DidGcxBL0VWYw1lUKAeY0q7J+zLK+FWoA=3D=3D?=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013)(35042699022)(14060799003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2024 13:47:35.0929 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 102ee922-f7f1-4000-0b8c-08dd025765e5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF00000046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7886
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

This commit fixes the bug in the handling of partial mapping of the
buffer objects to the GPU, which caused kernel warnings.

Panthor didn't correctly handle the case where the partial mapping
spanned multiple scatterlists and the mapping offset didn't point
to the 1st page of starting scatterlist. The offset variable was
not cleared after reaching the starting scatterlist.

Following warning messages were seen.
WARNING: CPU: 1 PID: 650 at drivers/iommu/io-pgtable-arm.c:659 __arm_lpae_unmap+0x254/0x5a0
<snip>
pc : __arm_lpae_unmap+0x254/0x5a0
lr : __arm_lpae_unmap+0x2cc/0x5a0
<snip>
Call trace:
 __arm_lpae_unmap+0x254/0x5a0
 __arm_lpae_unmap+0x108/0x5a0
 __arm_lpae_unmap+0x108/0x5a0
 __arm_lpae_unmap+0x108/0x5a0
 arm_lpae_unmap_pages+0x80/0xa0
 panthor_vm_unmap_pages+0xac/0x1c8 [panthor]
 panthor_gpuva_sm_step_unmap+0x4c/0xc8 [panthor]
 op_unmap_cb.isra.23.constprop.30+0x54/0x80
 __drm_gpuvm_sm_unmap+0x184/0x1c8
 drm_gpuvm_sm_unmap+0x40/0x60
 panthor_vm_exec_op+0xa8/0x120 [panthor]
 panthor_vm_bind_exec_sync_op+0xc4/0xe8 [panthor]
 panthor_ioctl_vm_bind+0x10c/0x170 [panthor]
 drm_ioctl_kernel+0xbc/0x138
 drm_ioctl+0x210/0x4b0
 __arm64_sys_ioctl+0xb0/0xf8
 invoke_syscall+0x4c/0x110
 el0_svc_common.constprop.1+0x98/0xf8
 do_el0_svc+0x24/0x38
 el0_svc+0x34/0xc8
 el0t_64_sync_handler+0xa0/0xc8
 el0t_64_sync+0x174/0x178
<snip>
panthor : [drm] drm_WARN_ON(unmapped_sz != pgsize * pgcount)
WARNING: CPU: 1 PID: 650 at drivers/gpu/drm/panthor/panthor_mmu.c:922 panthor_vm_unmap_pages+0x124/0x1c8 [panthor]
<snip>
pc : panthor_vm_unmap_pages+0x124/0x1c8 [panthor]
lr : panthor_vm_unmap_pages+0x124/0x1c8 [panthor]
<snip>
panthor : [drm] *ERROR* failed to unmap range ffffa388f000-ffffa3890000 (requested range ffffa388c000-ffffa3890000)

Fixes: 647810ec2476 ("drm/panthor: Add the MMU/VM logical block")
Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
Reviewed-by: Steven Price <steven.price@arm.com>
Signed-off-by: Akash Goel <akash.goel@arm.com>
---
 drivers/gpu/drm/panthor/panthor_mmu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index d8cc9e7d064e..8d05124793f5 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -989,6 +989,8 @@ panthor_vm_map_pages(struct panthor_vm *vm, u64 iova, int prot,
 
 		if (!size)
 			break;
+
+		offset = 0;
 	}
 
 	return panthor_vm_flush_range(vm, start_iova, iova - start_iova);
-- 
2.25.1

