Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1195DB41E55
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 14:07:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE45310E7BE;
	Wed,  3 Sep 2025 12:06:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="rDKkK4fl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYDPR03CU002.outbound.protection.outlook.com
 (mail-japaneastazon11013060.outbound.protection.outlook.com [52.101.127.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE50010E7BE;
 Wed,  3 Sep 2025 12:06:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CDlIvrqLYRlIMz0LJxz2bmfAzSFz1M3b3RhaPS6MTsxdH/j5bh4O3jjQzIMX7XNCP5kvWsctVqpMwgwxoxsnpVB69hksZ7WFROcknF+Jpwhr7VG4TcnHHN+Gz4ptbO++gHLvPW7DwyiiVEC2Y9Zq+BkOfCSAGTw6FKFaGkfGiJrJ19K1U8I4098J3siLnZmfFJEv3hQbjb6ouRkVaazIvj7lauXSyIShPdGHDZDGPGcvI3N3PeULNQqptfB3SrHguye77bOHGWWB1pcqefZ183EAhZOJJQIbr4JMsKmobrm84QtA9sot//Gyq71XiQ6ZKwlC5AImK6S8UUCiZNfddA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=igYfgTsZpIufJE6VjW0GOI7kI8upEVeT3ZMnx517XQY=;
 b=VO9JuNHZmQ9WlDljLysvGzpxOSa3OhCk6ecluN3WIaqlbuI6/rqW85ZlJqSNFTnUK+vYz4e4Iqw69II8ikWmJmox11cbKjDME55nXNXPx61+KWdxAwS1RyqR7B8qhcui6jw1BGbv5HhsTHetSWusBbmEgHD1VOENO2UuKOuU9/h4ljD8e/ps+UvQ9ClSjzKh3p4T7ITZia3IiaXXJr5SeGhZ9cKkOE5yc46jETQz1uQKV/N+8QGpJgCa7mSFHfnFgdE6E1Cbyy/YFVwbWGKLbybAxUfMJVvQGjmSFHktkFPFrUMrPJAMPUQGYCvxa7biOOh1qW2aC1pcCZFn72OSgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=igYfgTsZpIufJE6VjW0GOI7kI8upEVeT3ZMnx517XQY=;
 b=rDKkK4flTpB2ibOgO4vKakrWMQhiwXg0E5/mZRxbM4zmucmvczGnAzYvr6qjlUu4+WJfyRKEumuljuy2Y78MpAr5fWMlDIyDvO1NVgnAVSkK1N38bQvRld/CfEA+B8v6upWRM4oFGbFp5PBSeEIrAygtFLLeHMjyFBpU1r6Yeyjc+TP6USDWnXLCJ6h7mQvrfQ6lgAZWbPcscUl2Ko73y1fmYFa81m3ejbvWZzmLEjPAEjhzuSOC70XO3/UiqS6vi/9QoE0eBY0rK2lPsZbktJUhIBp4Q37wHvXuIqmr1T8RkS6r5ZzfQRrUpTaAFZTR2/Oit40oGSAYttGNGdkjiA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
 by KL1PR06MB7318.apcprd06.prod.outlook.com (2603:1096:820:144::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Wed, 3 Sep
 2025 12:06:40 +0000
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6]) by SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6%7]) with mapi id 15.20.9094.016; Wed, 3 Sep 2025
 12:06:40 +0000
From: Liao Yuanhong <liaoyuanhong@vivo.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Boyuan Zhang <boyuan.zhang@amd.com>, Sunil Khatri <sunil.khatri@amd.com>,
 Leo Liu <leo.liu@amd.com>, "David (Ming Qiang) Wu" <David.Wu3@amd.com>,
 Saleemkhan Jamadar <saleemkhan.jamadar@amd.com>,
 Sathishkumar S <sathishkumar.sundararaju@amd.com>,
 amd-gfx@lists.freedesktop.org (open list:RADEON and AMDGPU DRM DRIVERS),
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 linux-kernel@vger.kernel.org (open list)
Cc: Liao Yuanhong <liaoyuanhong@vivo.com>
Subject: [PATCH 6/6] drm/amdgpu/vcn: Remove redundant ternary operators
Date: Wed,  3 Sep 2025 20:03:50 +0800
Message-Id: <20250903120449.380087-7-liaoyuanhong@vivo.com>
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
X-MS-TrafficTypeDiagnostic: SEZPR06MB5576:EE_|KL1PR06MB7318:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c92bbb2-ab1e-4b5b-13c1-08ddeae256f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|52116014|366016|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NuAaE8fWpi1iOdglFF/Fhm11CFbBRdcKRNqi82R++iJVCikh9C31qH0QgJX4?=
 =?us-ascii?Q?wjQJkUcCGubYK0vEToUHULhZHZk8FGx6QI+7ehLmmnbQRRUrWgDZrrSDDVKb?=
 =?us-ascii?Q?3j+syEGnMd968kBPTj/5rfgwxPvk0XnHk6iNin5IeGs2eR3uJpBqMBbMZ9pj?=
 =?us-ascii?Q?cy/vGRpPXZAG6aZz7uL9HpvXkejY6Wfyh6kl1SfnARcQT6yN8a3e6J72AU76?=
 =?us-ascii?Q?o9gTBuLRvRAA0GLF5nEjjn8ysUhoCcUaKieWQnW3yh4UNV4ruYlX8T/Cc0qF?=
 =?us-ascii?Q?WD4GpFKYP9q5/uCbwMIzUEfVzq3jJpJnG/Y/Zejn6Sm4QlXC4rX+DQxPQrMX?=
 =?us-ascii?Q?Y8MQCZz9BfKf2a7yfdoD2Mnmqr32q16jB9t14mVlGoQDK9KLH4ofpjZLLcNV?=
 =?us-ascii?Q?WEwleQo/fXPCyRPLUeZAMtE37av++abW52cMnUeINBEWbvBuHnGVCP37TwmV?=
 =?us-ascii?Q?uoZiN8vuW+bykDAjmxp5w/srnkkLCx4H8yUA7iaNokqswoMLDpTOu917xiIq?=
 =?us-ascii?Q?EcaK9NrtyeEWhL6W1EuvpKQnYfaHD8LPeJPgu1MjIm7txkB3nSejh9eUlFlz?=
 =?us-ascii?Q?1sotqjLsxNtrhOKR6nZs3a0M9NLyuyeP5WUaDBkhbxyuJhd3gqQ5V4vCSUha?=
 =?us-ascii?Q?eyzr52XY/iOY0Pj/FXZdNXR5aexhWrv3q46jp/4sdoSYF3toQjnHIFuhv3xm?=
 =?us-ascii?Q?vHJpILKFoLKWUl5VzKuUZnTV7RVa3au9o0bCP4DRuG5Rm7CvevPvSxPuMIMB?=
 =?us-ascii?Q?w5zb2D9YZ74TQsgEG8X5CruqY8WS3vjv3zpv6vfzhRtO6x2bxQ9zFXhqlWfa?=
 =?us-ascii?Q?0MhDXg7J9Q76Pa6C1lGc2glvpdtZAbC+EbNbwaCH86CTpm2JuxQQ2naEsz1j?=
 =?us-ascii?Q?RRfXcXpLnqVUl8x1TQrKita25eXCXgVaURS7Imv+jIplal9n2XeQi+LGav6o?=
 =?us-ascii?Q?ZzS9LrxqSE+IxUuT/l09WZfMciScVKG1G6JcSGpucKq+m5tPIIzdV5ytRNEV?=
 =?us-ascii?Q?WMaPnfi+hMhVA9YwnEeeUQGxsoIX13ZUcKvq/ZAH+faCPSlbXTaHqV8snFKI?=
 =?us-ascii?Q?GvLPLc3D/0T8MBzc6D8gDAL5goIcbMxf0vMuGFYeGtgO4MkIB62wNVAgSan5?=
 =?us-ascii?Q?J7956ju4temO+KWYpQAGCdLDPAPFYJkAdmjwuIECMFtKbzph1cIyt9hoGxdK?=
 =?us-ascii?Q?MPsMrAJD1w+Do1lg3FLxeUpiM2Do15RrvBpf9Un5ch1Q/HUQ0HuK/hm/tisa?=
 =?us-ascii?Q?+X6JCfxOXeJ/P4Fh3WtOuZkKwNDhQVQWEIH62Nh53VSyjwtPnftW4L6OBBJa?=
 =?us-ascii?Q?eLcQJ6mh8o+MVCxhMxjE0H+eGbs7C7UC0jgoEFCzQ0n3lJB1ueaNFOUhboyH?=
 =?us-ascii?Q?0Z+i61InZLLm5eWJNYsnwOOCvdyE2yak+Hj65+Qj2xP5Kd0+vKgNcfvee7OX?=
 =?us-ascii?Q?AiTiswvTh1PrJW2RwJ2w3MAyqoju7VLZR6/C4KQe3L2kK+HjY0aL7GyFSq7T?=
 =?us-ascii?Q?FfGo8rWJmZCBfRg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5576.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(52116014)(366016)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?COlhmnLBHqN5WGDcDdUW+JViM6oBTQYjMewzgq25Qcc4fjeOvxOxHCaesyj3?=
 =?us-ascii?Q?hgjwnAHVSYj7aMmPtqKJUbIOjF8E4/rtW2U8aJA7AAdemzRMfzZhyiuLWDr5?=
 =?us-ascii?Q?DP6K3SSJt3xW7WnE09XfWXnswFUsumvmmbEw4yYD0N48STwmRkFQlkolx5T9?=
 =?us-ascii?Q?1HM7RWXiFdXYmHRnfbayxr4Nn+Mk0qXqunm1p8qbB74g/iIBF5qkTn0lc+2H?=
 =?us-ascii?Q?mlqk5cl6idJF+rExGLCMpJzWtzx9oeDAiiAVP1de08v2Vrd3jMkpnbcOlBh+?=
 =?us-ascii?Q?/R1uRk0d+h+8B/XMvMMgGj58nJLKD5XWtU0cwE3Vw2c/Se/J+YaQ8yFtL8tt?=
 =?us-ascii?Q?R7ByZSiaDGPMzvkuNyyqIWFmqruhTU/gg9AdrIb/BAIMXSiOC61YTX2cQfon?=
 =?us-ascii?Q?Xa2fnDvRKVowbOCciYFQ6AkGHDuD+ulUeSlfX+Bi9g/8XUaaAvQNKzFudTuS?=
 =?us-ascii?Q?nT0zR9NBIVSJgks0OKPDENVlNDfIbx/lNLuV4GI1qHxx4VgW+QFLUOpKW+o6?=
 =?us-ascii?Q?KDkrfeQ8tx4dTK9gVi/IDZUpzep6gpSJJODzWp5luv6pbZuxCI7RVynl+woK?=
 =?us-ascii?Q?B48jUuZRzcTRs/nOPokxPSove1WUdzs4unHO7oF+05faIiY7xLI9bfAkVeVJ?=
 =?us-ascii?Q?Px6qwsPYYnLYKpN9Ek3kKyZvCAn9VpcEl0JTzvMbgROAjGeAxZrobQZ+fZ5Y?=
 =?us-ascii?Q?VteADwtYP74+OZi8o/xxlYL84feeWTgSfTjhHUlD0pYnq7lOJ123tODxcYP+?=
 =?us-ascii?Q?jqWv5wdfo2mMVvPU8m/icqAqK2Hy7gkFBtIXPtqt89TNeSKnMUIOyxHG/S/p?=
 =?us-ascii?Q?ILxhK7Epq5asXgtBItxxZYIH1Quvic7QNlh2GyMmR6jHIjwkv6P3/VNgMhIt?=
 =?us-ascii?Q?CDE6cOtXfj+COcMHmO28NorOabQmvvN6+E1pdPSvs6T5bdZKDHg/t6sm3bBE?=
 =?us-ascii?Q?UU/BaELKam3O2Wvbyb5sFe68ZQhjlQSI0fs7kAyd6yZqvuFDqmzl+prMdLME?=
 =?us-ascii?Q?S8Xhcn8bcjI8/2s34lmAdPyYzg3OPHhn1wpop+Uk51Fp5SsXvV46RZ16tmk0?=
 =?us-ascii?Q?vC9lCCChrzSMlw+gKAiB6Yv5UQ9rvBk/TyTr8v7seqIlrHTAdWmSxOuO1YXZ?=
 =?us-ascii?Q?DJOxYZlGD/QigV2PWspHyL24yO5qqtGNyoZuq5Bd6VhNsvBNNWOSX5aN/ucU?=
 =?us-ascii?Q?l/l829FHR0jnBLiJP6msYKiT2fhtXu5EU8xJ6Egj+5vgUJuoHwiJzNPbA/hb?=
 =?us-ascii?Q?FlooI/4kjMG9zh9/J7oU2o2FIed31LqRJf9t6rshovelc8PGW0XJQiFopyfT?=
 =?us-ascii?Q?WjpZniPEheFmBsaNVgnkTzPferYc60OmZwgoDwTYJVP73A2Gu5qswbR0MzMC?=
 =?us-ascii?Q?7yBLEdMif4SdjtS+bcqNkudQv/etCoxal9Gg31v7MGzvBk9I3aHhBqxe4RXi?=
 =?us-ascii?Q?Rqpfrw5X9/oOffvndfd2RfxqGSsFs2qU/yx6a6wSnu0z1Vdr1/+I+nz4lJAt?=
 =?us-ascii?Q?+63nm0Bq6DGmCfxpNMWHP11SxiR1itAIMnHWN58buvCp5bMGz4mh5ZV+jg+o?=
 =?us-ascii?Q?04379M3o0mQbhNs3UMrwoDCfcDUt4VnIyLF1Ffxu?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c92bbb2-ab1e-4b5b-13c1-08ddeae256f8
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5576.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 12:06:40.1350 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YkZ86qb89DSO9ahNm6mkeUqDEXyfDCwF+MWt9GiV2wgcesY+JT5zLJEkJvdAIuVpt7FitzIh5Sw1F8i7uYtEmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB7318
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

For ternary operators in the form of "a ? true : false", if 'a' itself
returns a boolean result, the ternary operator can be omitted. Remove
redundant ternary operators to clean up the code.

Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
---
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c | 2 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c
index 75c884a8f556..6dbf33b26ee2 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c
@@ -1591,7 +1591,7 @@ static int vcn_v4_0_5_set_clockgating_state(struct amdgpu_ip_block *ip_block,
 					  enum amd_clockgating_state state)
 {
 	struct amdgpu_device *adev = ip_block->adev;
-	bool enable = (state == AMD_CG_STATE_GATE) ? true : false;
+	bool enable = state == AMD_CG_STATE_GATE;
 	int i;
 
 	for (i = 0; i < adev->vcn.num_vcn_inst; ++i) {
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c
index 455f829b8bb9..536f06b81706 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c
@@ -1311,7 +1311,7 @@ static int vcn_v5_0_0_set_clockgating_state(struct amdgpu_ip_block *ip_block,
 					  enum amd_clockgating_state state)
 {
 	struct amdgpu_device *adev = ip_block->adev;
-	bool enable = (state == AMD_CG_STATE_GATE) ? true : false;
+	bool enable = state == AMD_CG_STATE_GATE;
 	int i;
 
 	for (i = 0; i < adev->vcn.num_vcn_inst; ++i) {
-- 
2.34.1

