Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3043D9C8DA6
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2024 16:12:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C06310E7F4;
	Thu, 14 Nov 2024 15:12:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MA0PR01CU009.outbound.protection.outlook.com
 (mail-southindiaazon11020128.outbound.protection.outlook.com
 [52.101.227.128])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 954D010E7F4;
 Thu, 14 Nov 2024 15:12:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bFAWZmT4owL7OwcpOOcfJ7p8mI6CI3xGHw54zeOCGHqq8EQTK+hxw2+j6Jkl5FwgpBJKHVTp37H5DRhhWfB1UgaRtc4OrcsRvOveJibA6XYuhAm1jlSKsmWCT82WCU3UT/3DotKpp9fcJZc5GQ8w7pOhEGblNym7AyKc1t3Vik/0XKsO9ky0yyNoC0GKDMiAZ/LoFA8EEMgqyzBrUsvAp90vkvTxaBq+qvoc6UettGSjUrybf57NB7VmmKImfyBV+6RvRRX1jB0VptAoR9S+4JXL/TUzL7fwIFaxtXH9ywrb0h+TPN27vg2Z+Fgl6W0k4dYdSmeSk+pwGWsxtOnyIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bw0cIZJ64UmjbmmNvP66gFrQvqnsPHnKXxghmuvnpPM=;
 b=Q03ReuyWR4emWnd5wZp34XLINcGF2cLRhjlKTPYp5YDhyrTXexFV+cqZl6eq0zhnrsUMt5a9YyGNkWypr4SIClh4Sp9O5s+t2yVRpkK07mll/Sdt7wgMptRk9w+bu0AB5SDayaaxjgKf3jiSIK98U70d09p4hIO8y0Ez/PmX0cGDtCSyILFI28+2wMywUHiqOQHwCPvKYbyL6PLHNaPCsp10W/yKGPESijSofuC5+oOVAKFlb5AIjI06ACh8Wccuz7jusf6uY6px/F6d2N1dcOKchRrf5ewtdM1vXobiVdRZb0aMZJw3WtrQ/TXkbPfPDzffdv7N/j6nr8keOGQuBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1171.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1a1::5)
 by PN3P287MB1340.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1a0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Thu, 14 Nov
 2024 15:12:46 +0000
Received: from PN3P287MB1171.INDP287.PROD.OUTLOOK.COM
 ([fe80::c75a:632:1645:5db]) by PN3P287MB1171.INDP287.PROD.OUTLOOK.COM
 ([fe80::c75a:632:1645:5db%4]) with mapi id 15.20.8158.017; Thu, 14 Nov 2024
 15:12:46 +0000
From: Bhavin Sharma <bhavin.sharma@siliconsignals.io>
To: alexander.deucher@amd.com,
	alex.hung@amd.com
Cc: Bhavin Sharma <bhavin.sharma@siliconsignals.io>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Kenneth Feng <kenneth.feng@amd.com>,
 Wenjing Liu <wenjing.liu@amd.com>, Leo Ma <hanghong.ma@amd.com>,
 Ryan Seto <ryanseto@amd.com>, Jose Fernandez <josef@netflix.com>,
 Ilya Bakoulin <ilya.bakoulin@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] drm/amd/pm: remove redundant tools_size check
Date: Thu, 14 Nov 2024 20:41:12 +0530
Message-ID: <20241114151150.19576-3-bhavin.sharma@siliconsignals.io>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241114151150.19576-1-bhavin.sharma@siliconsignals.io>
References: <20241114151150.19576-1-bhavin.sharma@siliconsignals.io>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN3PR01CA0092.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9b::10) To PN3P287MB1171.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:1a1::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3P287MB1171:EE_|PN3P287MB1340:EE_
X-MS-Office365-Filtering-Correlation-Id: 344fe975-d6b9-4676-3c60-08dd04becbe5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|52116014|376014|366016|7416014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cMwzViqPSo3Y0qBrKorLlq8RSdpiPOlR/07xmxXGLiXVlj/5Fw7L7SY33IQp?=
 =?us-ascii?Q?CNduHWYM6hUOe8jgMrzQx4oq5PdQa5ernSZW3RHgRrX5nk+yd5K7Ddhd5U2Y?=
 =?us-ascii?Q?OJYdF+O1OdbLukGCA9M35E3IFj/i7vQtju2wKNsBpwlcjWi8DEQ0laXryldZ?=
 =?us-ascii?Q?rZjQIvX2pU1vQPpjha9hs/++Im2UFYga1xb/XHCxIcnzHY8BAWsgV8BDeKA3?=
 =?us-ascii?Q?sJXjqmTYky1sUPsC6w3cLP7JR6PaEufkHeEXYHEXHv48K6Ew2IBRGB77Dxjp?=
 =?us-ascii?Q?WSuqAhMjwUYsfH7qq3ljVvVrZb7isr3KcYF0NPGMJQfuiIbmhNhCBQ4bz2ey?=
 =?us-ascii?Q?t3FnS8SKMQjj17y/YzZ8nm+qfYHWStn51ejsnAUTvL/LFPURktXqnqdViU09?=
 =?us-ascii?Q?+mvWHc975HEsWWafsE56NsxTZpV/0EavpAOy8wfPDWD8c3w+4UzQaEh9rGRI?=
 =?us-ascii?Q?N71TPNWUx+pyRh+nZT32suOaYyMpFYjDVX2AFr0iARbKhfwE7ptvAH0gTeYr?=
 =?us-ascii?Q?iUrmUtpoBrwopoVIYty4Rx/eCIGDzkSdVGlh8vVeEBo64VwKyHlPn7c7DCIR?=
 =?us-ascii?Q?EcY25cH6UYtX5JMeUNUSGilO9hDT1dAc9KzOqlhFSLzz9kqf4cxPkXRn1ARp?=
 =?us-ascii?Q?70F0atsKkh9D9CG1jFjQZTJqSungd+WHKh08zIYco+um957uNiOce+204B2T?=
 =?us-ascii?Q?v5hlzhOZ9eyJEcPDRAkqcQ0vcE7jBOMxsovB7YIhNCP32ly4YN/IVsu9OXUV?=
 =?us-ascii?Q?zu5YPM9xqyFMXErhYTMiU9yBOhZKZfW9day2goPj+oZV4s8xRX8moekROvXH?=
 =?us-ascii?Q?KD+pE+kLhB7aSALrj82QSk2M78VbSzv3RokHY4EiuVKsO1OnWOUf+7muHzkZ?=
 =?us-ascii?Q?9tVuBVnFH6o6SBosNJ3XUskny38iKz8t+z06yilt1Qdho846OochSfyNys1Y?=
 =?us-ascii?Q?L5sutY+ZCanPMbWVho0hVxlSr3/JnVI7Ba+GuHXXVObeCAuKkKEJ2x76Ca3T?=
 =?us-ascii?Q?Sw9IvjnCXcocC37E2B3NQDmd+6cYvKtK7yW6dYsJyo66L4KLXyZUMMJVtIK5?=
 =?us-ascii?Q?2QphnCoAb6z28f9p9ON0io5unLyqSFcc068IoLCi9WqSGBuw2O6fN93rl9Wd?=
 =?us-ascii?Q?WgTKYsh2vHPC3H0cQRj1fluQmvFAIjFYexKGyassh6cuKYX7mJwQ9YKUloC/?=
 =?us-ascii?Q?wXRRqOWF2Y3URgGi2+yFGn350dHsLLPqAP9H5KtyxZ2LpfNASgGlGFFzFDwO?=
 =?us-ascii?Q?ffURog9dYl9Ao/J18zOD5YxCgmfJZhk5HhKRXOoEhgC/ml0XzfuGmZeysufN?=
 =?us-ascii?Q?lQPfSHGWq85nH6f3vICBEYYmsYlL/SMWsIlcyYdDhQhOtJJ/XuGtlVqw1NHs?=
 =?us-ascii?Q?T+gd6/Y=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PN3P287MB1171.INDP287.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(52116014)(376014)(366016)(7416014)(38350700014);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2DtPh/ARynGUt7/3nOIvT7uy1TA4nQy/bQgNqdsaz3wAlYO9/h4NBYU6ZQln?=
 =?us-ascii?Q?eZiV+5FrZZ4uwdszDaCOIq4dcCGprs1r2NxE2IVNit00FfN9R2xRTqTQjIH2?=
 =?us-ascii?Q?Ct2g4h2ZuftaAm1kRDLQg5jUNP7SQaTYTMYw518dgBv0MxtVl2UhNflaVob7?=
 =?us-ascii?Q?rsQnP/nkIpJUJXlZMenhuFbCouZkoMxSQZwtuTHr7O8zIn043RFIwhPYy3B4?=
 =?us-ascii?Q?Y92rxONM5lEFLMgkqNPRZ2dqE9SUsDx7F8MPNSu7yLhVBxdT7QUW+4dTg9nw?=
 =?us-ascii?Q?sgCCmC7rteH3oxkGXnotQqbwLBciAI86L15OSbIIHyF4ubBaKQO0VyVkXeHE?=
 =?us-ascii?Q?q2eP6FygAWz4kW7lX20M56n01i9ut3jHhhZxBsfkwWSTWEh01rPaK/p+WeBM?=
 =?us-ascii?Q?QIo54jZ7Crj+HlapPSLVAueGjA+bqeK2vG2/e8rqqlRVLgeZ3/GgEf/rsZ4i?=
 =?us-ascii?Q?7ZQ1iP0xJFP8nmpLchiJjb/tLsF/0VQat4JWFWfAoaKyc3xBzJdixZZiIXwz?=
 =?us-ascii?Q?Awwc3qs2m/J8GlQJyuxqf+jX4Du4mqYT2dTjL2hFNQvR9uk+x0V5GEiP/17j?=
 =?us-ascii?Q?xXxBsmlajABneOwSREr9LPh11hIB8fQHJGbJ9MQI9Mef920QYL7Mwbx2S1ZT?=
 =?us-ascii?Q?mYZ4MdnNzN+8xUHcK3k1um4ErSEJ4UT6gjh3Ui5Nd7BuCc7d9KzLFa2Dw3Da?=
 =?us-ascii?Q?gRmRm7kyMqLvSue2hFXDC20C+KiUCi7K9mFaR8VH0lfPxy+Of6M8Yi8qXsXn?=
 =?us-ascii?Q?2s4JahQINLB8GHusuuD6fTXO2EQ//9IC+4FOZYFFQtgeC4/0sRgwEXiTEOVH?=
 =?us-ascii?Q?9YA7OP9AfLvKWioy1gup05O3T26pwn+adQ26FEqAOQw71W83C7Qa1YlZKOkW?=
 =?us-ascii?Q?H7LxkKtkT4GiN8tkQVW29GHr2zGwGaHs0VPrq99jMLSo5HjLzizj8b7B0zUV?=
 =?us-ascii?Q?NcrgptmPir5uUlHJVVDWUgApts4NA/n+ULhISJdEc1ZQIflMeWnhlpj3xxJv?=
 =?us-ascii?Q?+E1iexIufUpg5k5k1ov3VvM19Mw1jwABIhuzcwiohkmr+3pouqd4g9qq3ku/?=
 =?us-ascii?Q?QclnqRop2wUrIi4TGP+GjuDcw0wjdyXkM18FEXFA6rfiyrJQdX/QJhYKbQKz?=
 =?us-ascii?Q?8Yg2vTZzAbXg6+i8MohbqznpJLSTF0dBaFEUjzKVzKJ4SZwJmxRl/3fT9RtV?=
 =?us-ascii?Q?/rAW8bH43cj3PE6oDKhpM55Gbd6P6yOQtiymKWOcGK183+DfXdu+HGWd2bz/?=
 =?us-ascii?Q?KKE053HLdoYJOSzEPABQznjr1Stu1P8jqRnMhSY67V5JluuJc4rIvaf+titM?=
 =?us-ascii?Q?CLnP4iJOJw4DXPqVmRx5aQ3TKWAepNzLq3PWR7G9JFpBTHWtRiQqf1ZdQ0JC?=
 =?us-ascii?Q?qfmdYyYKaKuVvVc3S+NW9XyM9uxzqVWleyqnvx+uDlf64PsWLVf5orLBY8H2?=
 =?us-ascii?Q?GSLmZdeRRf2idupVHfbjp1H7MjZ6RV8dz2awdTm/jGbh/6uqW9aQOYqnpjcd?=
 =?us-ascii?Q?yEhe/qKvGhQ55bZM9RWJ/1AwHQZulMLg2eVRY3W11nJUjg223uUFGIz4cJpB?=
 =?us-ascii?Q?eVV29oaMwFM4zb6xUrWtohlLNKbiZrzsZ2nMZ4F2TRIRfSIebCrujYQNFmRA?=
 =?us-ascii?Q?P4K/Wfs7rVFVxVIRXG3Vr8k=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 344fe975-d6b9-4676-3c60-08dd04becbe5
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1171.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2024 15:12:46.8336 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oAW90gYzvK5FSXt4wFBYym7HUjjyZi6q16yiqWNrARcf8bxNpg5yvmPDLtDbN2CWj+AlVGkfPnwK35OU1UaAAvS2a3AoQYj3MvwzVSKGoL4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB1340
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

The check for tools_size being non-zero is redundant as tools_size is
explicitly set to a non-zero value (0x19000). Removing the if condition
simplifies the code without altering functionality.

Signed-off-by: Bhavin Sharma <bhavin.sharma@siliconsignals.io>
---
 .../amd/pm/powerplay/smumgr/vega12_smumgr.c   | 24 +++++++++----------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/powerplay/smumgr/vega12_smumgr.c b/drivers/gpu/drm/amd/pm/powerplay/smumgr/vega12_smumgr.c
index b52ce135d84d..d3ff6a831ed5 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/smumgr/vega12_smumgr.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/smumgr/vega12_smumgr.c
@@ -257,20 +257,18 @@ static int vega12_smu_init(struct pp_hwmgr *hwmgr)
 	priv->smu_tables.entry[TABLE_WATERMARKS].size = sizeof(Watermarks_t);
 
 	tools_size = 0x19000;
-	if (tools_size) {
-		ret = amdgpu_bo_create_kernel((struct amdgpu_device *)hwmgr->adev,
-					      tools_size,
-					      PAGE_SIZE,
-					      AMDGPU_GEM_DOMAIN_VRAM,
-					      &priv->smu_tables.entry[TABLE_PMSTATUSLOG].handle,
-					      &priv->smu_tables.entry[TABLE_PMSTATUSLOG].mc_addr,
-					      &priv->smu_tables.entry[TABLE_PMSTATUSLOG].table);
-		if (ret)
-			goto err1;
+	ret = amdgpu_bo_create_kernel((struct amdgpu_device *)hwmgr->adev,
+				      tools_size,
+				      PAGE_SIZE,
+				      AMDGPU_GEM_DOMAIN_VRAM,
+				      &priv->smu_tables.entry[TABLE_PMSTATUSLOG].handle,
+				      &priv->smu_tables.entry[TABLE_PMSTATUSLOG].mc_addr,
+				      &priv->smu_tables.entry[TABLE_PMSTATUSLOG].table);
+	if (ret)
+		goto err1;
 
-		priv->smu_tables.entry[TABLE_PMSTATUSLOG].version = 0x01;
-		priv->smu_tables.entry[TABLE_PMSTATUSLOG].size = tools_size;
-	}
+	priv->smu_tables.entry[TABLE_PMSTATUSLOG].version = 0x01;
+	priv->smu_tables.entry[TABLE_PMSTATUSLOG].size = tools_size;
 
 	/* allocate space for AVFS Fuse table */
 	ret = amdgpu_bo_create_kernel((struct amdgpu_device *)hwmgr->adev,
-- 
2.43.0

