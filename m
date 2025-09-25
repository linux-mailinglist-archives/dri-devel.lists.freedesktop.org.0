Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB7CB9E306
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 11:06:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6371310E899;
	Thu, 25 Sep 2025 09:06:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="Qve2yCAG";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Qve2yCAG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010067.outbound.protection.outlook.com [52.101.69.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7276610E89E
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 09:06:26 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=c0FmnV2yPcVV2MDpYI7cHOc9S+ZztBu8jrLapmShbpZlw4pF9Jil1UOs+8PG5MO9lH0XnC5JTVCp6ApTJXzKL507cIWr34QIpPwRjSaBovWAkWLJClGL34VhmGdAZMNl2WzpI+Wd7aEcd3vm7/+ZKLWDu1FOVDiXbZAgnsr1hkWF3wAq/+/jR4W7yfIkY5B0Axoa05Jj+hh9NxuSYPglDSnDw4OhBX55Ol9TeNnwjxYxKe7RFtaMKoh8GXZY5dRtKnk2ZCmwfoyKPbv8F5GIrsQSmT96m7mLg5PbuuVGUV4+fDuGYrJUYkBWSNl0524ugUClPG/6K8WhkxMCxroXaA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=frESDF5nhra81dJ2FrZBVDufHuwM6Bq+2si31VRIaPc=;
 b=bkruhqX6gfAMt24qKce1sg0aa2NshBjnpyvM9Di8UA2p3g9b96mM0ZeSNFjOJMRMcCCHtsrHuNUyYkIC87sXI04EQl8hx6wcmFmvIgUKADZAafDK2dRh0XV4cuxLvWsHhfjnMJM81cJ+uOgf7oEnbvH+ew3b+uvr2xJJFTgrXiqnMTLaVULhZleczjmVjvRFVVU/SKTM5JU6p4ZbAI3NSy6EPBKH1xmb7wodG8q3eA2IclNNve2kJqHMHKo0MCZvdHUILcoLI9ZFiJNm11QVXx6iZo0DJ95prQdouIOBdhFIF0mtTtYbDzupVl8M7kNUgm8XJ0J8SgF1/EunKYrJig==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=frESDF5nhra81dJ2FrZBVDufHuwM6Bq+2si31VRIaPc=;
 b=Qve2yCAGizxdaEkHDThRHJWd2ifesMi40EdiPlCDQztZJRZauqiTOCSfMytSCvsCUjGk7bjhm3wTRjgoINJeUFiP/3u8Q6b5Z50AJoqOflPODkhz6msHTmw85EODyDchFUS5jmc0CFU+kxnQqKPmBLJoyIcTDes8AmBteYY9RsQ=
Received: from AS4P190CA0020.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5d0::8)
 by AS8PR08MB6008.eurprd08.prod.outlook.com (2603:10a6:20b:29d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Thu, 25 Sep
 2025 09:06:23 +0000
Received: from AM1PEPF000252DB.eurprd07.prod.outlook.com
 (2603:10a6:20b:5d0:cafe::8d) by AS4P190CA0020.outlook.office365.com
 (2603:10a6:20b:5d0::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.10 via Frontend Transport; Thu,
 25 Sep 2025 09:06:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM1PEPF000252DB.mail.protection.outlook.com (10.167.16.53) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.9
 via Frontend Transport; Thu, 25 Sep 2025 09:06:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iYqEX4IUUg8iqE2H8G9V0IMxUce19K5stlOTzvEHM+x5qlMsnj/3InA8KZZngntyD3JvFOiDOa6y7RkrJDrSeNyUeT8xu8ixi/WraExdS6UosRXAqCelQe/G4hhL7qESi0LxhMd3HcxGBHmBp3Dl5WzIGGck32aQ/+SDFJbs20l+uAwkR9oy4r6+6mwQDDAg9YER1wKObW73c/PvG7WGJ7hsZZmz1NFJxbJrDN7H6ZO7HE4cJATXe65sBzaAXJcZT9mCafT8AXPQbjgK/0lqqcFrRdrFgVXoPhUQ2IFykUJTHhT8vWgHm5oRqHGu7LTDhK0plLjhFqE4A6m6CGzC0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=frESDF5nhra81dJ2FrZBVDufHuwM6Bq+2si31VRIaPc=;
 b=Lt3edr5A3k+zZtUNCKPntbGYaqYCdHpoz5RJ6hYevbHBNLjKGZ1iqg3nJ2+LpVH35tAB8PepuCyAPvW3e79dueyvAVKkqTUDKCNo9Y+79Qnr/4txDHn2tro02eQFMqC6Loq4Pqx5MDnruH2HZTKTEfO5tM5V2hV/ZiTC+HxiL90gp8GFGd4ntQe2G4v2eXJ5X/YMm8K0QI9PPXtUjm4zKp+j0/eCwjhae6wLS13nJ8oAeeNBwEQmPNxKjJhTE287PbkCu58SwyID7HF1IkwyhWgKzHzaupep44Xq5/8MnyiXY+8zKPMT6672103ZcA1CheoGGbPK0Wa8/mLnofqODw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=frESDF5nhra81dJ2FrZBVDufHuwM6Bq+2si31VRIaPc=;
 b=Qve2yCAGizxdaEkHDThRHJWd2ifesMi40EdiPlCDQztZJRZauqiTOCSfMytSCvsCUjGk7bjhm3wTRjgoINJeUFiP/3u8Q6b5Z50AJoqOflPODkhz6msHTmw85EODyDchFUS5jmc0CFU+kxnQqKPmBLJoyIcTDes8AmBteYY9RsQ=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DU0PR08MB10359.eurprd08.prod.outlook.com (2603:10a6:10:416::17)
 by GV4PR08MB11603.eurprd08.prod.outlook.com (2603:10a6:150:2d9::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Thu, 25 Sep
 2025 09:05:49 +0000
Received: from DU0PR08MB10359.eurprd08.prod.outlook.com
 ([fe80::d10b:a33:84b5:cbd1]) by DU0PR08MB10359.eurprd08.prod.outlook.com
 ([fe80::d10b:a33:84b5:cbd1%6]) with mapi id 15.20.9160.008; Thu, 25 Sep 2025
 09:05:49 +0000
Date: Thu, 25 Sep 2025 11:05:44 +0200
From: Marcin =?utf-8?Q?=C5=9Alusarz?= <marcin.slusarz@arm.com>
To: Chia-I Wu <olvaffe@gmail.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Grant Likely <grant.likely@linaro.org>,
 Heiko Stuebner <heiko@sntech.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, nd@arm.com,
 Lukas Zapolskas <lukas.zapolskas@arm.com>
Subject: Re: [PATCH] drm/panthor: add query for calibrated timstamp info
Message-ID: <aNUF6IDneKxjTP5t@e129842.arm.com>
References: <20250916200751.3999354-1-olvaffe@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250916200751.3999354-1-olvaffe@gmail.com>
X-ClientProxiedBy: LO4P265CA0327.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:390::10) To DU0PR08MB10359.eurprd08.prod.outlook.com
 (2603:10a6:10:416::17)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: DU0PR08MB10359:EE_|GV4PR08MB11603:EE_|AM1PEPF000252DB:EE_|AS8PR08MB6008:EE_
X-MS-Office365-Filtering-Correlation-Id: 467723a6-ebf0-4b0e-a358-08ddfc12cc59
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016; 
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?ZbPiSOZex3ckgxF05jk6r9ajFDHVvjA9IjedP+JbwLRh2Q6Uu23SLYxgTC3r?=
 =?us-ascii?Q?hIvArwNXU0lr3CGp2okzql5jIttKZhxTSNPbF5EIeNRAAeoYIw7Bp0rJTlOL?=
 =?us-ascii?Q?pbIZnjelDSIMqJUz9mGg/NiYD0cPZlt+S4elolO+BrRArBrsh35EMUH+eCto?=
 =?us-ascii?Q?drcaigY+LsL7wgLGxc0cK2unzKnaYIM9+2fAMgUJWYZ6WQCrhC++/TQpMsQC?=
 =?us-ascii?Q?yc178getyOz3zG251QhhJmy6t0mionwbs5dzofuI37y0w1XKmMOCxLggEOx0?=
 =?us-ascii?Q?tZaz6S29mxw3rBROijZgWLMK6Nn6hS5I2lT1MI7Jm/V866oteQtpP0y27TtX?=
 =?us-ascii?Q?DSj7J5IxIhg3mPuAsAXG2sS4bges7YpfNq53FSC6yg8u/KIqiTCg53l96Jsa?=
 =?us-ascii?Q?Dc+xJSqNZvIZ6N66m+YJSZ6Sg68yIKvN24L6zfSYn7Krb7aoUWdAJvJWCgf5?=
 =?us-ascii?Q?rMdobp2x/0Eo8yjnF+OLWD0yFL7vF51ne2GOAEzK+wXWU9xz15mJ7bCxo6Gh?=
 =?us-ascii?Q?XyE7wm0wrWZYlkxEphZNGPI1a0w7EBc2FDVrutpxjzt8YaqXJu9CRvu5ph7x?=
 =?us-ascii?Q?JdnsMFrFN+UypUQhM9YkoYlw1XYGEW0pAasW4XIeBqgs9A1kvACTjnzmBPYz?=
 =?us-ascii?Q?hCJXPh2+k8ikwzbGeFwU7qDRW931sRNCaUPmo48JC1Y3GcxXyr98q+wGXB/R?=
 =?us-ascii?Q?rc+XzhJdSwUWBgIz8rSvI8fl5BAbSMB3KtmOi0HzhJO63YFiLjLzSI9HzRTD?=
 =?us-ascii?Q?tkaa9lVJTeeYDbmt6343TLgyh/XVznVSm1X+KAW+Rbv3ugy70/CSxNR29eKh?=
 =?us-ascii?Q?AHl2HPAC2EfgaGo3CRcfAUGYxHMjOGeotlLeeyLWShm6EvLU2faJDfHHpGT+?=
 =?us-ascii?Q?c7ujN8czKFRH3JeAfTqdIhmxhw+WVfsmUJf0H8VrsY8+Xdsn+HXTj5zbEfn7?=
 =?us-ascii?Q?XF91f5pTW1ElyvvvTWsvmbq8IywC6CCgZsEq1QycnLf/K9P6KK4BhpeoF7aC?=
 =?us-ascii?Q?Dpp7CvwhBMt7QXUdZ/5rY40KD8cxTf7WB76/x70QL3/bqM0TU/N++vFtBzo+?=
 =?us-ascii?Q?I2BX1mQHZSRiYeTZP/bxuenR1hgPRqESAjqidn/PEV2xeZ8x7DMr5Bjv9u8v?=
 =?us-ascii?Q?LCJXLoMbYf+vAJwXccnGPUyqHk7Kfc0VGjtB8JzJKXK5B8xEEyJKiO6XtB4Z?=
 =?us-ascii?Q?0BYk7IyzgrBJMkvkotXhBzftbfCh18fc4Vm6lNlUJ8AOld2xjPHzWSpPLSdZ?=
 =?us-ascii?Q?7/sYwLNMxYxo21yCOGYjZ/3akIaY9G1hq1/hwCPDcseRBCxm7sSI0q4YCkbF?=
 =?us-ascii?Q?PmXLQj2Lfn25d7Gg8b0eY5kckOjEp5WqGRO72nATAriraNe9Os37kDVyL5Ql?=
 =?us-ascii?Q?lM2aoiM=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DU0PR08MB10359.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR08MB11603
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM1PEPF000252DB.eurprd07.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 540ff914-c52d-42f3-93a9-08ddfc12b881
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|35042699022|1800799024|36860700013|7416014|14060799003|376014|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rpIbcF+Dy71nLfZzIS8tHlYGRCFeduRBpfiESTAHinrI1j0S7f8m12U5CmNJ?=
 =?us-ascii?Q?JWfP+6ZdEXztAx8U8N5VbCEpppYsXF0Hw/TovKH8EqfLIWyRBlq5I0sGtzuF?=
 =?us-ascii?Q?DHm5C0oJAmeNn0r7N5Qivx+ntQ8r+Ya8oO5RkSzfpYavRA45ICOU/bvZDc7n?=
 =?us-ascii?Q?IfPlQLhmJ1ssfD/ebMKKFFXgvM0yUhCg61Nx5RWDUhcRpNnBb7p0/T9vJIEu?=
 =?us-ascii?Q?FEej4uckfCIY/A7FPS5GCxtfbXZs9AjxfCchT6nwVTFph0+92nAs0CYoK5Dp?=
 =?us-ascii?Q?IvnhxUue7xmmeXWty5+jWnFyuWCb7yaD1ud83eF8oEcMeJX1s2yVWVMGWkyI?=
 =?us-ascii?Q?ldeIDK3218bUibLCkRL+OjOSs/eay7/1Equh6rcLcfb17BVhcbSHL4eo7ZaS?=
 =?us-ascii?Q?E3f5tLdGi4e9eLKlMkjoSqRTQghUJdMDCgHXUkPq9y46bbS3Cp2sviFL885c?=
 =?us-ascii?Q?Hac7ThTM2S0S1+OMG1CqczbT5x8l77EmQ16symLPULJ+DSMAbJek/eFiOFuF?=
 =?us-ascii?Q?m9xOnJqjHCTGWx3+W7hg1lknVGn3G+r//Y7aNqhxyv2MjMY/4GrLiNZJgVBg?=
 =?us-ascii?Q?fwUBwQnAKrfVkg+POhFqHWSmUReCH/YIVUlDWwyQWp1i4xqiSWzcnnsrMduC?=
 =?us-ascii?Q?Yqr9v0xlDtbA5vQCo3XGKWlzgvu9OeyEOL1ytWfeSKfI1+xMmG8xfCdgBIG9?=
 =?us-ascii?Q?GwWwFtiCp/u4ROzh40698KF5H2L2iqCZC88wlyjG97gy4kKK91RDgHFEd4g0?=
 =?us-ascii?Q?JhUgp1TnRi8WXoPEBKG8Plktas2rarztXUYaSdGaBK9jywKZiclgebAytsMB?=
 =?us-ascii?Q?p8MHh2jgVL+XXtKmM4zWexMrYySl3mzV03HYMaN119cTkNcgTNDrjMVW4f0C?=
 =?us-ascii?Q?4TO5nNw/FQbqVZy4nD5eyKDCjMsLekDR3XRK194pBhzbMvnMqouiPu3n0Poa?=
 =?us-ascii?Q?VWzXRugFgKDvmPvyTA1h0sRrslp3m1MsusKB8VoFOeROmLfNz/br78wj7up1?=
 =?us-ascii?Q?Q5sXwsRzKiC2ioGhZjEfloIl2PQIfGxvpfjcTjJzbBQS5a6seRNg9rteTgFm?=
 =?us-ascii?Q?TAjQJmXjRzgqK2Z+gQY9kr/L6J7GZmiF/VfSw9ZlRLyJ4cgRZmwM+EgaaONw?=
 =?us-ascii?Q?vb6p0EGGiy4PFtbRXFoOZRZ7BkEL4OwIFsPMoqDoFBItIg3htJbSsWJCMzqM?=
 =?us-ascii?Q?35qOVuYJCBqdu0A+wn04VorXhy5dTzuAywVVJ+eu1p+Mk1IZbV8ZpglwKsSf?=
 =?us-ascii?Q?X/mwYel2ZfE5HZc6nBHZunToux/016Kvy0set+kt/ipOJU0bPEezlsc59DVz?=
 =?us-ascii?Q?6RrYCiwSlg7dc+wGAIQiUj0+i3uDHugM/139KNayt9fD4mZQ3vVsqUZ0eiNX?=
 =?us-ascii?Q?p5bhTinTuBK/PANLLN/yYwZ/blSCc+BRErIyrNMF01iLulHq40hRCL+iVnnL?=
 =?us-ascii?Q?8nvR/LLIyZqFDF8Yx4u5EWpO2U4lqgXrQBTC8+0Lb5gAUJvNyODfKw=3D=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(35042699022)(1800799024)(36860700013)(7416014)(14060799003)(376014)(82310400026);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2025 09:06:22.3604 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 467723a6-ebf0-4b0e-a358-08ddfc12cc59
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM1PEPF000252DB.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6008
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

Hi Chia-I,

On Tue, Sep 16, 2025 at 01:07:51PM -0700, Chia-I Wu wrote:
> DRM_PANTHOR_DEV_QUERY_CALIBRATED_TIMESTAMP_INFO provides a way to query
> and calibrate CPU and GPU timestamps.

I worked on a similar patch for Panthor, with a plan of submitting
it upstream soon, but with slightly different requirements, so maybe
we could merge both efforts in a single patch?

The first requirement was that it should be possible to get both CPU
and GPU timestamps, with the expectation that they should be taken as
close as possible (within 50us).

The second requirement was that it should be possible to also get
the value of GPU_CYCLE_COUNT register.

What I did is extend the existing DRM_PANTHOR_DEV_QUERY_TIMESTAMP_INFO
query in backward compatible manner with those new fields and obtaining
gpu and cpu timestamps with preemption and local irqs disabled (more on
that later).

Backward compatibility was achieved by adding new fields at the end of
struct drm_panthor_timestamp_info, and relying on the fact that if user
space passes smaller object it will be silently truncated.

Obtaining all kind of timing information with a single syscall might
be a bit too much, when user space might be interested only in some
data and not the complete view, so I'd propose this as a solution:

1) Extend existing query in backward compatible manner, by adding new
fields at the end.
2) Add flags, cpu timestamp, cycle count, and duration.
3) Flags would be:
DRM_PANTHOR_TIMESTAMP_GPU (1<<0)
DRM_PANTHOR_TIMESTAMP_CPU (1<<1)
DRM_PANTHOR_TIMESTAMP_OFFSET (1<<2)
DRM_PANTHOR_TIMESTAMP_FREQ (1<<3)
DRM_PANTHOR_TIMESTAMP_DURATION (1<<4)
DRM_PANTHOR_TIMESTAMP_SAME_TIME (1<<5)

DRM_PANTHOR_TIMESTAMP_CPU_MONOTONIC (0<<8)
DRM_PANTHOR_TIMESTAMP_CPU_MONOTONIC_RAW (1<<8)
DRM_PANTHOR_TIMESTAMP_CPU_REALTIME (2<<8)
DRM_PANTHOR_TIMESTAMP_CPU_BOOTTIME (3<<8)
DRM_PANTHOR_TIMESTAMP_CPU_TAI (4<<8)

and DRM_PANTHOR_TIMESTAMP_CPU_TYPE_MASK would be (7<<8).

If flags is 0 it would become
(DRM_PANTHOR_TIMESTAMP_GPU |
 DRM_PANTHOR_TIMESTAMP_OFFSET |
 DRM_PANTHOR_TIMESTAMP_FREQ)

For VK_KHR_calibrated_timestamps flags would be set as
(DRM_PANTHOR_TIMESTAMP_GPU |
 DRM_PANTHOR_TIMESTAMP_CPU |
 DRM_PANTHOR_TIMESTAMP_DURATION |
 DRM_PANTHOR_TIMESTAMP_SAME_TIME |
 (raw ? DRM_PANTHOR_TIMESTAMP_CPU_MONOTONIC_RAW : DRM_PANTHOR_TIMESTAMP_CPU_MONOTONIC))

4) The core of the functionality would query all required timing
information with preemption and irqs disabled iif SAME_TIME flag is set.
Probably we should exclude OFFSET and FREQ from that.

Why also interrupts disabled?
Recently we discovered that unrelated devices can raise interrupts for
so long that the assumption of timestamps being taken at the same time
completely breaks down (they are hundreds of microseconds apart).

What do you think?

Cheers,
Marcin

> This is needed because CPU and GPU timestamps are captured separately.
> The implementation makes an effort to minimize the capture duration,
> which is crucial for calibration and not exactly feasible from
> userspace.
> 
> Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
> 
> ---
> The query is inspired by xe's DRM_XE_DEVICE_QUERY_ENGINE_CYCLES and the
> naming is inspired by VK_KHR_calibrated_timestamps. The userspace change
> is https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/37424.
> ---
>  drivers/gpu/drm/panthor/panthor_drv.c | 88 ++++++++++++++++++++++++++-
>  include/uapi/drm/panthor_drm.h        | 31 ++++++++++
>  2 files changed, 118 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
> index fdbe89ef7f43c..06da6dcf016ef 100644
> --- a/drivers/gpu/drm/panthor/panthor_drv.c
> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> @@ -13,6 +13,7 @@
>  #include <linux/pagemap.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/sched/clock.h>
>  #include <linux/time64.h>
>  
>  #include <drm/drm_auth.h>
> @@ -172,6 +173,7 @@ panthor_get_uobj_array(const struct drm_panthor_obj_array *in, u32 min_stride,
>  		 PANTHOR_UOBJ_DECL(struct drm_panthor_csif_info, pad), \
>  		 PANTHOR_UOBJ_DECL(struct drm_panthor_timestamp_info, current_timestamp), \
>  		 PANTHOR_UOBJ_DECL(struct drm_panthor_group_priorities_info, pad), \
> +		 PANTHOR_UOBJ_DECL(struct drm_panthor_calibrated_timestamp_info, gpu_timestamp), \
>  		 PANTHOR_UOBJ_DECL(struct drm_panthor_sync_op, timeline_value), \
>  		 PANTHOR_UOBJ_DECL(struct drm_panthor_queue_submit, syncs), \
>  		 PANTHOR_UOBJ_DECL(struct drm_panthor_queue_create, ringbuf_size), \
> @@ -779,6 +781,74 @@ static int panthor_query_timestamp_info(struct panthor_device *ptdev,
>  	return 0;
>  }
>  
> +static int panthor_query_calibrated_timestamp_info(
> +	struct panthor_device *ptdev, const struct drm_panthor_calibrated_timestamp_info __user *in,
> +	u32 in_size, struct drm_panthor_calibrated_timestamp_info *out)
> +{
> +	/* cpu_clockid and pad take up the first 8 bytes */
> +	const u32 min_size = 8;
> +	u64 (*cpu_timestamp)(void);
> +	int ret;
> +
> +	if (in_size < min_size)
> +		return -EINVAL;
> +	if (!access_ok(in, min_size))
> +		return -EFAULT;
> +	ret = __get_user(out->cpu_clockid, &in->cpu_clockid);
> +	if (ret)
> +		return ret;
> +	ret = __get_user(out->pad, &in->pad);
> +	if (ret)
> +		return ret;
> +
> +	switch (out->cpu_clockid) {
> +	case CLOCK_MONOTONIC:
> +		cpu_timestamp = ktime_get_ns;
> +		break;
> +	case CLOCK_MONOTONIC_RAW:
> +		cpu_timestamp = ktime_get_raw_ns;
> +		break;
> +	case CLOCK_REALTIME:
> +		cpu_timestamp = ktime_get_real_ns;
> +		break;
> +	case CLOCK_BOOTTIME:
> +		cpu_timestamp = ktime_get_boottime_ns;
> +		break;
> +	case CLOCK_TAI:
> +		cpu_timestamp = ktime_get_clocktai_ns;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	if (out->pad)
> +		return -EINVAL;
> +
> +	ret = panthor_device_resume_and_get(ptdev);
> +	if (ret)
> +		return ret;
> +
> +	do {
> +		const u32 hi = gpu_read(ptdev, GPU_TIMESTAMP + 4);
> +
> +		/* keep duration minimal */
> +		preempt_disable();
> +		out->duration = local_clock();
> +		out->cpu_timestamp = cpu_timestamp();
> +		out->gpu_timestamp = gpu_read(ptdev, GPU_TIMESTAMP);
> +		out->duration = local_clock() - out->duration;
> +		preempt_enable();
> +
> +		if (likely(hi == gpu_read(ptdev, GPU_TIMESTAMP + 4))) {
> +			out->gpu_timestamp |= (u64)hi << 32;
> +			break;
> +		}

We don't need to loop on everything to read GPU_TIMESTAMP - using
gpu_read64_counter(ptdev, GPU_TIMESTAMP) is enough to guarantee correctness
(IOW why would we need to reread cpu timestamp if gpu timestamp wrapped
around?)

> +	} while (true);
> +
> +	pm_runtime_put(ptdev->base.dev);
> +	return 0;
> +}
> +
>  static int group_priority_permit(struct drm_file *file,
>  				 u8 priority)
>  {
> @@ -815,6 +885,7 @@ static int panthor_ioctl_dev_query(struct drm_device *ddev, void *data, struct d
>  	struct drm_panthor_dev_query *args = data;
>  	struct drm_panthor_timestamp_info timestamp_info;
>  	struct drm_panthor_group_priorities_info priorities_info;
> +	struct drm_panthor_calibrated_timestamp_info calibrated_timestamp_info;
>  	int ret;
>  
>  	if (!args->pointer) {
> @@ -835,6 +906,10 @@ static int panthor_ioctl_dev_query(struct drm_device *ddev, void *data, struct d
>  			args->size = sizeof(priorities_info);
>  			return 0;
>  
> +		case DRM_PANTHOR_DEV_QUERY_CALIBRATED_TIMESTAMP_INFO:
> +			args->size = sizeof(calibrated_timestamp_info);
> +			return 0;
> +
>  		default:
>  			return -EINVAL;
>  		}
> @@ -859,6 +934,16 @@ static int panthor_ioctl_dev_query(struct drm_device *ddev, void *data, struct d
>  		panthor_query_group_priorities_info(file, &priorities_info);
>  		return PANTHOR_UOBJ_SET(args->pointer, args->size, priorities_info);
>  
> +	case DRM_PANTHOR_DEV_QUERY_CALIBRATED_TIMESTAMP_INFO: {
> +		ret = panthor_query_calibrated_timestamp_info(ptdev, u64_to_user_ptr(args->pointer),
> +							      args->size,
> +							      &calibrated_timestamp_info);
> +		if (ret)
> +			return ret;
> +
> +		return PANTHOR_UOBJ_SET(args->pointer, args->size, calibrated_timestamp_info);
> +	}
> +
>  	default:
>  		return -EINVAL;
>  	}
> @@ -1601,6 +1686,7 @@ static void panthor_debugfs_init(struct drm_minor *minor)
>   * - 1.3 - adds DRM_PANTHOR_GROUP_STATE_INNOCENT flag
>   * - 1.4 - adds DRM_IOCTL_PANTHOR_BO_SET_LABEL ioctl
>   * - 1.5 - adds DRM_PANTHOR_SET_USER_MMIO_OFFSET ioctl
> + * - 1.6 - adds DRM_PANTHOR_DEV_QUERY_CALIBRATED_TIMESTAMP_INFO query
>   */
>  static const struct drm_driver panthor_drm_driver = {
>  	.driver_features = DRIVER_RENDER | DRIVER_GEM | DRIVER_SYNCOBJ |
> @@ -1614,7 +1700,7 @@ static const struct drm_driver panthor_drm_driver = {
>  	.name = "panthor",
>  	.desc = "Panthor DRM driver",
>  	.major = 1,
> -	.minor = 5,
> +	.minor = 6,
>  
>  	.gem_create_object = panthor_gem_create_object,
>  	.gem_prime_import_sg_table = drm_gem_shmem_prime_import_sg_table,
> diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
> index 467d365ed7ba7..7f3ff43f17952 100644
> --- a/include/uapi/drm/panthor_drm.h
> +++ b/include/uapi/drm/panthor_drm.h
> @@ -243,6 +243,11 @@ enum drm_panthor_dev_query_type {
>  	 * @DRM_PANTHOR_DEV_QUERY_GROUP_PRIORITIES_INFO: Query allowed group priorities information.
>  	 */
>  	DRM_PANTHOR_DEV_QUERY_GROUP_PRIORITIES_INFO,
> +
> +	/** @DRM_PANTHOR_DEV_QUERY_CALIBRATED_TIMESTAMP_INFO: Query calibrated
> +	 * timestamp information.
> +	 */
> +	DRM_PANTHOR_DEV_QUERY_CALIBRATED_TIMESTAMP_INFO,
>  };
>  
>  /**
> @@ -402,6 +407,32 @@ struct drm_panthor_group_priorities_info {
>  	__u8 pad[3];
>  };
>  
> +/**
> + * struct drm_panthor_calibrated_timestamp_info - Calibrated timestamp information
> + *
> + * Structure grouping all queryable information relating to the calibrated timestamp.
> + */
> +struct drm_panthor_calibrated_timestamp_info {
> +	/** @clockid: The CPU clock id.
> +	 *
> +	 * Must be one of CLOCK_MONOTONIC, CLOCK_MONOTONIC_RAW,
> +	 * CLOCK_REALTIME, CLOCK_BOOTTIME, or CLOCK_TAI.
> +	 */
> +	__s32 cpu_clockid;
> +
> +	/** @pad: MBZ. */
> +	__u32 pad;
> +
> +	/** @duration: Duration for querying all timestamps in nanoseconds. */
> +	__u64 duration;
> +
> +	/** @cpu_timestamp: The current CPU timestamp in nanoseconds. */
> +	__u64 cpu_timestamp;
> +
> +	/** @gpu_timestamp: The current GPU timestamp in cycles. */
> +	__u64 gpu_timestamp;
> +};
> +
>  /**
>   * struct drm_panthor_dev_query - Arguments passed to DRM_PANTHOR_IOCTL_DEV_QUERY
>   */
> -- 
> 2.51.0.384.g4c02a37b29-goog
> 
> 
