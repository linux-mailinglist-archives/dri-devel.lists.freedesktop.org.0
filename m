Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27829B41E4E
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 14:06:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63E7010E7B4;
	Wed,  3 Sep 2025 12:06:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="iGUXNQPQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYDPR03CU002.outbound.protection.outlook.com
 (mail-japaneastazon11013001.outbound.protection.outlook.com [52.101.127.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1A7710E7B4;
 Wed,  3 Sep 2025 12:06:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=agZVbhYTFgd3p+M1sZwYLWxhzyIKG4GaynJ8lI1QBnXCwQDURTDJ5Li1gnWsrKxPn3iamgkMd1gKBrx9RGbX3V/LJYrXfkOyRuFWzlj9WcTpbAto6IsW3UN7D7VyrWNcZ2P+RTgCA6EKPC2TozwYoTgBj5GGHS8uyrTAkbvk0GOpsdpTinBs4cDVYboRetqtR7hkVF2vY6Fe2div9ecAmHQIPXxeub3F1DdSVpWe5R1PlRhQdZ3iLp/hBabSSZohQHLkzOzmtq+yDnVze5mWXPCLt45EtWqC0YKairgdjxRCzx1zqdeS/bWXG2Bz95sw1Ff51MCapW8k/K0MOYxepQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EpJFNZairr7NFH+G4QhwttesUVgxvUn0znxt5M/8soo=;
 b=Wl1Dgzt6W2ryglq96LDQLi77Sv72BFB9f3qxf+y6aelFOBO4+2D48Cms4cxizfDCCU0ck73fHc7phLip9eYAcGqlPFfiyqPdpBnwcPbL3Hc6tjvmjEqwmxxcheqKwbGqInnYV8kFstMIgomy+21VeFgYd71hiSsCZHU5/DzMnnImpkZeCD32v0Eqgjc6E3wS5XeAxepY/R169gPGporhrdCX7GB1Tgt6Oq+lXnff4prA8gAMNSYwyMNtufNw9sB6/SDly5MCH5aPq+EiC4nFhsVYOPAGnRAjCgKm+ZtwisINsa2AFlpJhPK8DdR8FQ3uXhf8Yc2lchpScCqgX80bSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EpJFNZairr7NFH+G4QhwttesUVgxvUn0znxt5M/8soo=;
 b=iGUXNQPQeZm/Bgchjmxue/vI5nTvKo39iWDdwUvZZBOcssZCmRx3i1C9wsrBRB8XypBK4mvopnk1dMJ45OAnArLo2qMqax7zyuOe2PLzxfRcgm4kIyiLknq+ejI1F0q3NEnxfK18RwFHOhlIrIqbhxSrhk0JpDQE1rFPO2uUQ3QWJu3HHRhvhNzLsZKOXvmepXhsliT5qlPwh7IUVynyovPE5G9nulAxa1/XZqhMe0bdTq0uQujNO5ZjArpaZm8MD99fY1evLAlmt1qGG9bhFSD4Ph1fesoSYKsMp22Rm4aK73CtEg+sBfYmutC56cyhWh8q0E7w+bKnMr4c/JLXgQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
 by TY1PPF568C2A376.apcprd06.prod.outlook.com (2603:1096:408::914)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Wed, 3 Sep
 2025 12:06:06 +0000
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6]) by SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6%7]) with mapi id 15.20.9094.016; Wed, 3 Sep 2025
 12:06:06 +0000
From: Liao Yuanhong <liaoyuanhong@vivo.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sunil Khatri <sunil.khatri@amd.com>, Boyuan Zhang <boyuan.zhang@amd.com>,
 Emily Deng <Emily.Deng@amd.com>,
 amd-gfx@lists.freedesktop.org (open list:RADEON and AMDGPU DRM DRIVERS),
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 linux-kernel@vger.kernel.org (open list)
Cc: Liao Yuanhong <liaoyuanhong@vivo.com>
Subject: [PATCH 4/6] drm/amdgpu/ih: Remove redundant ternary operators
Date: Wed,  3 Sep 2025 20:03:48 +0800
Message-Id: <20250903120449.380087-5-liaoyuanhong@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250903120449.380087-1-liaoyuanhong@vivo.com>
References: <20250903120449.380087-1-liaoyuanhong@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0293.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c8::11) To SEZPR06MB5576.apcprd06.prod.outlook.com
 (2603:1096:101:c9::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5576:EE_|TY1PPF568C2A376:EE_
X-MS-Office365-Filtering-Correlation-Id: 621139cc-7311-4ee0-2d71-08ddeae2424d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|52116014|376014|1800799024|366016|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xqNDn2Nq6SeS369RDYHVmBqj7w4rImmG0G3TFcFB6wOFxCwoFhDvmeBaF9W/?=
 =?us-ascii?Q?3cnv9FL9QxFlepylCA5g0nq53MLCdPEj1yuyETHxSRp/205lonfztrWpEVtP?=
 =?us-ascii?Q?zuL2zISL3K4KgPgAg3lgNyZTgW8B2VMI8OmtyoLHbPIJZgCOQSkLMp9RlHJW?=
 =?us-ascii?Q?a7A84RQPNeNNKD4dzB2Z7Ikf1uPsoG9TR7l3Krosc/OMZ3Vf/L7CzKE/aCH1?=
 =?us-ascii?Q?MYDs9DRS3lzvSMaArEHuzIDvdQGBlFEWfMBIOzI0+0UMTydwTfhBekyzff5c?=
 =?us-ascii?Q?nuq7iuecDb7f7vYpOCzMreA7kJL5dgkrR7V/kEmFWyIzVfdZ7Xqu3ykUINrV?=
 =?us-ascii?Q?SGI7deAeSwI6JKFgZTwICob5LKIwdHWYjuR664Wsla3CR54uEvOgSQzpHI7A?=
 =?us-ascii?Q?6rOhl24hxbMBdiVx/jo9L8+WLqN9bc4IxGInlMiXslhcYHMaPDRrq8EKNIBf?=
 =?us-ascii?Q?kTBzLphU71wPCP/NVk/+1pe1hBWWpKn8v6cSICJebqMR6Ae6s9+YLltznxMl?=
 =?us-ascii?Q?B1kNoidmcfY8BSRu1LiLt36drVqNg3MSE/TKzoawALz+U+jxJF7//6BRbVQ9?=
 =?us-ascii?Q?8z7lbcaU3+T0o7aWtzpi0lfDl8qG1//W9bufEyOuZNm5l5CEj93m1Sk/qi9d?=
 =?us-ascii?Q?BDU/iGQJypuiBZynTT0QxJ0Sx2aIkTYJRj95PqT0DR2+bwtR+rj7vGKya/u4?=
 =?us-ascii?Q?ZY2myCxf3KQW74HgYAvOD3PKhV4JmBWCA85mZUgBaAd9QEQbJ5b3u+OB+FhM?=
 =?us-ascii?Q?EXzDFqmcfEyrQKP5lrqijUnSts4t/uF+w9YsaOfiUaC3ejKHjpoIoSztzyvv?=
 =?us-ascii?Q?y+yj/W42dLXGSZNSGf0yN04/uoQtS9y+5UbezJgcWfr5b9H4k5T0FfcLacHx?=
 =?us-ascii?Q?0SqHCKpZtTA6ZR6+qmW3AKtxrZp50F+tkzl9aM9q0A+r7ZypcsRDLBq+EglE?=
 =?us-ascii?Q?Di1tlFdKCDxpr5FK4eFEmvM7ltOUHp6uug5V/4yS+ZMD8lr+oDDfEMqSr6Xp?=
 =?us-ascii?Q?wxn/J2DeLSSngqxk/HUipopJ9uXP/vEFwsCUaT+7x+qkkPXBnos3MiFgzZQ5?=
 =?us-ascii?Q?D3toHOaW4FmjffVUBjlzpactsslcKHS0iPBImikS6HgUtKvnLfAIfsshLLZA?=
 =?us-ascii?Q?jh0mofxLuu+/4Px7H2K9G3I6hepVolXvAA7BZd16m1tMWkoS/0aTcVOtN2Xi?=
 =?us-ascii?Q?6qBGGEcoPYexmQSoXpxro8yKKog0Y9x3ZnPEF3VgMWTKKymx0fpM8bSg2uIs?=
 =?us-ascii?Q?LGQNF+/qEDcukzawJekSHkMwRkQiVKaFu6f1p7786qZTlEDerojQPdR+WEP3?=
 =?us-ascii?Q?Bt4uN35Y6pESE0tpNCdQ/wfq5VD0ZxhfkSvpzsRmH903MV7GbxmJA9z4Y963?=
 =?us-ascii?Q?K2UApxDtTR3/PPIQ4u2dGcOEZQ/piNkICyu+K1mku0yr1miuI0RlrmLTBV2x?=
 =?us-ascii?Q?XiRvaSfzG2Bo9mPzDdgpuD6A9t5fvMzzW5Fju22A0biSZI9suIEGUBC4vz+F?=
 =?us-ascii?Q?E/x+JBzKc8xy7jk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5576.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jl0cIsp5DnDnfK04iESYwHg3ZaoRxgSI/iU7SRlXs5smYZGMUJq5i3KXXEwi?=
 =?us-ascii?Q?k6Gu6LHU1MQWTS5eAPgHbc74/q3TpcTRMxpPIqnHCidsjVv4eU4tkp6421qS?=
 =?us-ascii?Q?vHIcru1OHmpwT9RPJeqhhYC0ySSeDBdTtz40w2TPgUITEul/LVVWRjFmQLhC?=
 =?us-ascii?Q?mabo3RPsv/R8WhyeJ0bnP/Q4ANlgjCPnbC9ZA7v/LyWywkWLFOiRAVHCeB2/?=
 =?us-ascii?Q?vsh50z9RmQJZ0YaKxHo7yZbSX7XS12nRpLjwadvqzgMLbn7hm/zr4lcQ+ACe?=
 =?us-ascii?Q?pQGDFyf3pk6u9sA0AAROTC9xiR/6qDdbWM2I9wE/Q+IWTayxf0ObfNMS4Ftd?=
 =?us-ascii?Q?rjOtsEU2neuJUt19b+ReypWSs5VrYe9wbnbhBWFHKIVW/E74X4c7WFHzLmI0?=
 =?us-ascii?Q?Q9NFXI63+8pLGC/136qRPlEDRVM6Ufx3JFDAX01EHc51ZZX0iVRIHTlblEsb?=
 =?us-ascii?Q?GTgT0ylkOLfo+RhTWzunQ/0/9cAqq+tkEzX/u8U/zDPG5+mxS8yT02OGSn33?=
 =?us-ascii?Q?kxP0j7BgJ2WOtere0KorHSor/CLY7gexgfT7+v0y5xkqjy0rpIFVTXcS4jaz?=
 =?us-ascii?Q?RRZotvc656V51WNLb9QH8Kehqs9F7SGhMrbXSjPbkU+UWuJW/zZoT//353mR?=
 =?us-ascii?Q?gKXSlFtQFm3aJyca42GecLKEQVa6vkC5wMQ73qUNU8O2dlN6WXT5WEWvXjZR?=
 =?us-ascii?Q?Hr2yc5LwdvXdw28RM4WbxZNF5ieLaejGZL/L/an1O2aWxZ2gscE/r/TvsZcZ?=
 =?us-ascii?Q?cFmIk+RtQ6BGlvzw9pSGOOf1YC+wd5rzZFWkWFSeznp7Ddn9XvYft1z2bzDQ?=
 =?us-ascii?Q?PnWSsOvjg5DRguECFFWUBFDtTgzV8Ygd3+0IgJBZqrMhBf6XvYVaJjEeXgnU?=
 =?us-ascii?Q?bwSKIlfguNWvrsVtDmk5AapMtrzqv2DR1lpCjdv6b28dfcIg8g9Wen94Dx+o?=
 =?us-ascii?Q?42Qdrls5XuWumtLpSeU+XJClYJEj20xPgBcjb69dHB6l1bcFObarXu5mmUNR?=
 =?us-ascii?Q?LAjMJ0D+Z1Hs+qK7fleyHFG43PuWfYaFMiXrKrZxnGTB82KkOAGLALX/1clR?=
 =?us-ascii?Q?g+rJr1e3aRmiWOYjgXuf8LptiBl96NKEmbyU2zgaynbzGXI1e8NdTfGDFM4m?=
 =?us-ascii?Q?RnhjiHgwhDxxLIjKmg66YbdYelyfBrMMWvHz9aiYdW3NPXMdEPiy1J/FJr2a?=
 =?us-ascii?Q?iWXFgfzsY5roa0GqnuwPHJjIlxfaX5ZTfjb7+Qq1gGVNmgO09bttj4484kPl?=
 =?us-ascii?Q?GNwrTaTOY0IU5sNrS7IdLfxXf50zMYqvftHS5zRyxW9nz3EncRPmq1Bdu8/k?=
 =?us-ascii?Q?khT/quCYz1Oe9Qkc69GHMYDwTkLstXFNTHuGgpYmCrQ0hDXOYXsRJSthW1tU?=
 =?us-ascii?Q?Z3NLnsqgWT8wTkF++L0r+AZfxzhMAe2RUeF4sNcSickgnNK7q/UyLT6v8f2S?=
 =?us-ascii?Q?Fab74oipS93xhMkidbVJAk9I1yQmzh1gBBAHFLqzY2UVYnCdk0+WW1w5s16V?=
 =?us-ascii?Q?NYs8q3s0fOluBA7+Qyl+7Je6ilC5+10eSnain7UDpn8AdYrC4DBPHqk7pw/T?=
 =?us-ascii?Q?U/hqMWtHnm2XbzLA81R2r/NQfQ+CDJBzl1YlQGNg?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 621139cc-7311-4ee0-2d71-08ddeae2424d
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5576.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 12:06:05.9579 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n10Vz2B5mLPIoQrBynDrrxdnHFcXU8wZSADv0fTqtTso7/hZABv9yu3/I1UYiO801y13JMNs1HoJjPS56u7HEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PPF568C2A376
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

For ternary operators in the form of "a ? false : true", if 'a' itself
returns a boolean result, the ternary operator can be omitted. Remove
redundant ternary operators to clean up the code.

Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
---
 drivers/gpu/drm/amd/amdgpu/ih_v6_0.c | 3 +--
 drivers/gpu/drm/amd/amdgpu/ih_v6_1.c | 3 +--
 drivers/gpu/drm/amd/amdgpu/ih_v7_0.c | 3 +--
 3 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/ih_v6_0.c b/drivers/gpu/drm/amd/amdgpu/ih_v6_0.c
index 5900b560b7de..333e9c30c091 100644
--- a/drivers/gpu/drm/amd/amdgpu/ih_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/ih_v6_0.c
@@ -587,8 +587,7 @@ static int ih_v6_0_sw_init(struct amdgpu_ip_block *ip_block)
 	/* use gpu virtual address for ih ring
 	 * until ih_checken is programmed to allow
 	 * use bus address for ih ring by psp bl */
-	use_bus_addr =
-		(adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) ? false : true;
+	use_bus_addr = adev->firmware.load_type != AMDGPU_FW_LOAD_PSP;
 	r = amdgpu_ih_ring_init(adev, &adev->irq.ih, IH_RING_SIZE, use_bus_addr);
 	if (r)
 		return r;
diff --git a/drivers/gpu/drm/amd/amdgpu/ih_v6_1.c b/drivers/gpu/drm/amd/amdgpu/ih_v6_1.c
index 068ed849dbad..95b3f4e55ec3 100644
--- a/drivers/gpu/drm/amd/amdgpu/ih_v6_1.c
+++ b/drivers/gpu/drm/amd/amdgpu/ih_v6_1.c
@@ -562,8 +562,7 @@ static int ih_v6_1_sw_init(struct amdgpu_ip_block *ip_block)
 	/* use gpu virtual address for ih ring
 	 * until ih_checken is programmed to allow
 	 * use bus address for ih ring by psp bl */
-	use_bus_addr =
-		(adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) ? false : true;
+	use_bus_addr = adev->firmware.load_type != AMDGPU_FW_LOAD_PSP;
 	r = amdgpu_ih_ring_init(adev, &adev->irq.ih, 256 * 1024, use_bus_addr);
 	if (r)
 		return r;
diff --git a/drivers/gpu/drm/amd/amdgpu/ih_v7_0.c b/drivers/gpu/drm/amd/amdgpu/ih_v7_0.c
index 40a3530e0453..b32ea4129c61 100644
--- a/drivers/gpu/drm/amd/amdgpu/ih_v7_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/ih_v7_0.c
@@ -552,8 +552,7 @@ static int ih_v7_0_sw_init(struct amdgpu_ip_block *ip_block)
 	/* use gpu virtual address for ih ring
 	 * until ih_checken is programmed to allow
 	 * use bus address for ih ring by psp bl */
-	use_bus_addr =
-		(adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) ? false : true;
+	use_bus_addr = adev->firmware.load_type != AMDGPU_FW_LOAD_PSP;
 	r = amdgpu_ih_ring_init(adev, &adev->irq.ih, 256 * 1024, use_bus_addr);
 	if (r)
 		return r;
-- 
2.34.1

