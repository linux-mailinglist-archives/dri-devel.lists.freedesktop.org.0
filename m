Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F12B41E4A
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 14:05:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBBAE10E7AC;
	Wed,  3 Sep 2025 12:05:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="gFuLAHjV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYDPR03CU002.outbound.protection.outlook.com
 (mail-japaneastazon11013010.outbound.protection.outlook.com [52.101.127.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FB4110E7B4;
 Wed,  3 Sep 2025 12:05:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=APjbv2GLbLZHrbMz7L2HG1OH58DATglcEgbRHv5N++DTKkaQZwMBL8Hq5dpgpIvJP/cKcVYEhqTPnnS1mPXIO9cCZlEWO9YSmi5ERUUFlzRtJAQtUA4n9EVLxjSxyhjsedB2N7XZpaJ9BZeO/AXfNRSdYLFZGGwDjifyfj24ZHpdU5NPB7qj0lR9+PiUr1IcaxwXfxyc+YTZ1aXRlP8OwDr/lLvQfVcCE4gjNk9QP+d3WV1Bd3K9mHDJ1ztLjCyu/i/Y8yubyu2NK/dpmi+1VMxaP/aoAQNSaF5fyYa32zA3/bfUas0qsx2kRkxuOtEEGkYQevjs1FPGzrGfH41B7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E4ZpHbdBJuEz0E/ElvdRpq3nOq1zqhyXYwGBiPkVCBo=;
 b=pWFQ7vEXmusAD9u23qZpHnTcN3O9jyfRRnuFNGdl9oufyWHZjenQNWAYDcFb0D6bXXcfFR1wjlFKi2A/D//U7gVPWJtiCP6h3o7W5RhMjOMbz9qW8ygzEQmClf8N9rrPGiNRhy7VIukdrw3ADjGwbDurfzNGu65g61e13ev1apGRqpYZmzFiYuXcFlU9OSF6TUIAAIyQXfrwN0zx2ENe7SZmtr7u9RDAoNUyDHVL42zkz2NTnb/+GZWqu6gGlLuFA7JgnObViACIL+HKmAFhBCuhKaOUC9sISkjPJccGyvC8eVAAXtLDGadauRb9+R9n7siy0B8LRiXjYnQNsM3HNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E4ZpHbdBJuEz0E/ElvdRpq3nOq1zqhyXYwGBiPkVCBo=;
 b=gFuLAHjVCt3sS9VtqJoZDFdAJDS7HisMjLnNLgjqtVPJct4TvCJcVj0Ejm+G9iWZZbX55nHKGIcWSrT6RwdtDf7eq+Aid80tLPKlGkMYmW78c62LI/syEWleQOUyncXAiNBh0Pg/2VBJDd1Cee30XdfoPW1p+nbgDaNJ2hPBw/kcZLJjXWB+lYmeNsU5j6WloRb1KfxiUw7Kh0zkrlhj9pUJ7e94bcWi/BkMHrX9rlDVNlSN+sDAq9ZHHpaqoNMydBq8OMd5nnFhYReaYl1XC7L+iMYNwao1yiTQT3tAFbATq6P7UUbcCZu4qe+PEXSMcCNHUdH6b5TJIy9aeNzMOw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
 by TY1PPF568C2A376.apcprd06.prod.outlook.com (2603:1096:408::914)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Wed, 3 Sep
 2025 12:05:25 +0000
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6]) by SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6%7]) with mapi id 15.20.9094.016; Wed, 3 Sep 2025
 12:05:25 +0000
From: Liao Yuanhong <liaoyuanhong@vivo.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Tao Zhou <tao.zhou1@amd.com>, Xiang Liu <xiang.liu@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>, Yang Wang <kevinyang.wang@amd.com>,
 Colin Ian King <colin.i.king@gmail.com>,
 Victor Skvortsov <victor.skvortsov@amd.com>,
 amd-gfx@lists.freedesktop.org (open list:RADEON and AMDGPU DRM DRIVERS),
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 linux-kernel@vger.kernel.org (open list)
Cc: Liao Yuanhong <liaoyuanhong@vivo.com>
Subject: [PATCH 1/6] drm/amdgpu/amdgpu_cper: Remove redundant ternary operators
Date: Wed,  3 Sep 2025 20:03:45 +0800
Message-Id: <20250903120449.380087-2-liaoyuanhong@vivo.com>
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
X-MS-Office365-Filtering-Correlation-Id: 7ff9a405-6eed-469b-da6d-08ddeae22a57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|52116014|376014|1800799024|366016|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VVw/9fi+49gNboq6Lp8jHJg79VryF1hcer9ij3f04hM46aAmXTKyTS8edeUh?=
 =?us-ascii?Q?uHDCFQ0IpNa4O9vAaOo5HIErx9YHipFtF0Bn8CPMurGAfBZOcGs6F5Zpalim?=
 =?us-ascii?Q?AVe061VXxVglBjU3E/2/3zMKIG5qUbmhABeN6hz+gtUGjmEBMOLYjGbIfAgX?=
 =?us-ascii?Q?EtpzVw18f12k0S2ZrtZmNQ/XxPcFbK7bAfikPnIPhxBCuNfrxiQIZ1b9qw8x?=
 =?us-ascii?Q?9xjkavu8CM0TXjeyGe1S/v0DNvUYd2WW0kFxhGVF+HFM0Uqd6fr7A/VlvkZM?=
 =?us-ascii?Q?pNEozhgBNN0+eSouV/PeaCVL9xDWosvY8G3+BWwPCHtBfpUXoNNC/UEc2QDe?=
 =?us-ascii?Q?FITJDXSTtYgXlP4mezAFHAMat8h/i/wWakMzKhLMsiX4RSQbF+6h+ztzui7t?=
 =?us-ascii?Q?ZD6v14V0JGHnZrDppUrEgrimzWziD0pw84wSVa/McOOeM34B+jJXp0uAdsTv?=
 =?us-ascii?Q?kJS2V46N4gbWUSvDJSpys6L2CGQMRlWT2mmO3wsWoMbmJ9NijWjKX6Rocyy5?=
 =?us-ascii?Q?hXTfN2wZWmY6co/cCs3BpTZsQyjjKFULgso0DsC5uoqaR/CyafNPtwFSrZBh?=
 =?us-ascii?Q?uzPG/hWiJ5jZJldiXYL/Om6PbToMdI7SCvLh6rJjZ4J2cENyBzryHVNRILz3?=
 =?us-ascii?Q?qYl91QZ99DE2W9Ev31QihUKYq9fUroZsN2pUPh0vQSTaqHfV8IT1T3JOAP7P?=
 =?us-ascii?Q?CT6jxXJdG3tQ6rQOW0K1hXXkS86cure3JKK+acJOHt20ZSEhscJAJTMwzK6s?=
 =?us-ascii?Q?/Rt9xZGUbFQNfXeBq/Xd02lO1GADZM6QOK7U1eIm9ZiJFIADpoDs0QO6TJOm?=
 =?us-ascii?Q?fKu/9HDoOVdkevZxRtZ5G6g0PAKgtxPeMS8Pfi4i9yR+Vxs2/fZ8TbR/gJf4?=
 =?us-ascii?Q?xJvyc2ATzhqOr9J6oWLx7e42DmZ9oVf75oBfQUx+aAFbjZj89K/8iWFbZ7xs?=
 =?us-ascii?Q?+L5V+KLlR7/26zCEMGWVhvCnnePBuQEvnTeroupA5OQJ/KYetKwFobfCIdpf?=
 =?us-ascii?Q?j9UdgOBL/3ubDj75wYktKaenpeTutrYxLrMAnwNRL9q8DnhVPhfSxnUzaeSY?=
 =?us-ascii?Q?TaN2IcpLVh7oMfUEPiGjcNufasD6UnDltrefxFTH8UqzOxWZF3owS4f7df8K?=
 =?us-ascii?Q?2k2LQlzrbnLzgKnhcYET0Y6RZKPn3TNr43yVWZEbOWdlfBSSnQqBle303IQ5?=
 =?us-ascii?Q?QInX2sPdsXzS0mh98ZqKrcxToG2l7/cICiZFK0l8pMQ5pqmG6+KMLYycp64w?=
 =?us-ascii?Q?/JBOSxfcJE3kTYRlCkYp623t9FPJ75b+K8zT3KLldNF4dAIVDVWCADoT7FQJ?=
 =?us-ascii?Q?IpJoVcwP7SgyHxqvx1ENo2Lwe5Rf3Z2KlwZpsTES1dzKuYadi/iF0N5ALfXZ?=
 =?us-ascii?Q?MhZafK2V+5/Yo7G8vfftaJVCOdOM5PEXGYUsfRRwnEUXxEGUAD/f48TJ2IR+?=
 =?us-ascii?Q?jGJUCueMbsKQfrIlXVa0/siehB+TOLGQzsVlc4jVdKsKIvNvXaEP0OVqTm/7?=
 =?us-ascii?Q?z5GLOmdIwoPIi2Q=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5576.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FBWv6u0almlr3Ex4hB+SIeadyQmYo/HhKBzq7Um9uj8HsXUwJ0Ns8YwYHl/0?=
 =?us-ascii?Q?trzUGDDIKcwfBFpdEuPGPkY0+cCV1dM4kxdcldrRMy2kNaJQHIeM2WLD/SCn?=
 =?us-ascii?Q?bN5/qygZBM6duiDzNUmrB8BARPpQ3AfcbFuTlFqPFe+y+oie9P3EvqHY10SY?=
 =?us-ascii?Q?aJ23HD03q3rncIYdbhXUvRbgtZSTli9yw9Lr7dzBqqvYfQJSZEkrHpaWqjft?=
 =?us-ascii?Q?AEWRUAEFIyfXXQxIda3XD69SVkQzCE4fUy8eiZX4wuXfyiygrxq32W2tZYTG?=
 =?us-ascii?Q?YSwstBm/CV/fvvQhBC3zptm7kIV4mPQxZHgQu2K9CJ8l6IS+j6w1ZQAoH/ZG?=
 =?us-ascii?Q?XW3jXQeEd8b8LCMyzLYB6OSzDbhN8iFKQE5K8JQ7of49aCKW1tMVaeWpXMS/?=
 =?us-ascii?Q?1CfNJrmZi3u55U6sZXKanwnDfF+20qLZJNm227DsCxAl200S2qZWOrwN5htQ?=
 =?us-ascii?Q?jjppqNwi+peZGxuawA6Z55BYADEKIcfGfQjpziWxq8UyLHvbJtPOK3T9bF/f?=
 =?us-ascii?Q?k1paYRZHg2sC2T9FcvybfrdeXd8HPd/Q92B+GBdiFaeSlJvlOJtCv3UYHkEW?=
 =?us-ascii?Q?vUtIHbl2uJmPBLncV52m88wOS3dpyjvpIeeZJi2nczbQ1+jdzhrcSuz9zPHf?=
 =?us-ascii?Q?4fAVHKspWfTANT3K1xUp36FJcUL9ym0m89DGRSInsSBXBiSw8r4PjewO71zP?=
 =?us-ascii?Q?RTripqvTUhqt8C+vXiURyChrNHDMwLKq3TfNyQ057Fp6eAP2I/eOgOJTUZu0?=
 =?us-ascii?Q?wQZ3ol2gcveKfuml/Zql8ULPMy6GAu1zVdFswtDcoaZe1OQxNDPGEJA2+OD9?=
 =?us-ascii?Q?Tefmja5d5+2D2iwX6EIPXVk2LrrA9vVh/3Sw6Ljp+UvZiZzjtFIUx7dgYdvn?=
 =?us-ascii?Q?imMNttSzZKKZkdVeJuuoTNH1POxkDgc8BVPsKJKQ/eLo8i1PBCiaxwYPHmu2?=
 =?us-ascii?Q?XoL9Tr5E2LrVLGFJ7PP8hyWiwSmqbxq8pautbBIcFHrgp1lkf8HkGrvs0oQp?=
 =?us-ascii?Q?i6TS87olW4w1kbm2FYaWEZfmJsWLSSaA7dIZxmZArMjSQiaHfqe84cATAz2J?=
 =?us-ascii?Q?n7XxFQFyvT7KBTnh8dNxirqrRY30kCqkNlIVmSClK9prOr2lxcSWJ3bwZFvk?=
 =?us-ascii?Q?MF2HHRt4qpWpMxFTHirdGD1Wxh7uBbPTMiXO2gyVrrfhdkcMTE5vEl09JoYH?=
 =?us-ascii?Q?PEzXpfbnZz1Jo0mW45f6I5FI6anpyXbWTg2nzENWoLJ0V9P9QaX+NDlof6PH?=
 =?us-ascii?Q?2rQLkXvKKIOL6Su0Lap1m2sYXjYsOb6ry47/Mjzyq0KVRJ/xoLlufn5Nbupj?=
 =?us-ascii?Q?JYDzlelZ/5uEYXM8gFLMX7o+cGeDUX4eJT0rLg3qPmgSgCSlZkRMW4iufkiU?=
 =?us-ascii?Q?b8n3d/61A/85EmQgT09l1HJlfI46aq8iH5nsUomCCGglWafrSlk/uSyFopnM?=
 =?us-ascii?Q?yOdbvv2FsjYgTYNRKkXSU/2pcdmPq0NMgKQjsXgxTBzlEj9M/2DcWj+9gUDu?=
 =?us-ascii?Q?rtrzLXj73aR4+VW5297WrvXQly2iZwAuu0vEOLZ45/Y2lCVAS44e3lhvAA12?=
 =?us-ascii?Q?pViYdQrXvDweDvgR7LK7l8vbJZRKedPjTofpujeu?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ff9a405-6eed-469b-da6d-08ddeae22a57
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5576.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 12:05:25.2982 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GNjMugYDoeMCQAJ+7Wyu4BuBDRdMA+/3jLo55Rq6XgfCzyOu459/v+JbGeHocSl+99A5L9rsBdUPGPH0QdK8Ng==
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
 drivers/gpu/drm/amd/amdgpu/amdgpu_cper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cper.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cper.c
index 6c266f18c598..c4590ec35cad 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cper.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cper.c
@@ -174,7 +174,7 @@ int amdgpu_cper_entry_fill_runtime_section(struct amdgpu_device *adev,
 	struct cper_sec_nonstd_err *section;
 	bool poison;
 
-	poison = (sev == CPER_SEV_NON_FATAL_CORRECTED) ? false : true;
+	poison = sev != CPER_SEV_NON_FATAL_CORRECTED;
 	section_desc = (struct cper_sec_desc *)((uint8_t *)hdr + SEC_DESC_OFFSET(idx));
 	section = (struct cper_sec_nonstd_err *)((uint8_t *)hdr +
 		   NONSTD_SEC_OFFSET(hdr->sec_cnt, idx));
-- 
2.34.1

