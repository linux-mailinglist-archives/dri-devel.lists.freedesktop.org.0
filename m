Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDEB5B43A30
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 13:32:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3D6E10EA02;
	Thu,  4 Sep 2025 11:32:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="C7NJFSUv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SEYPR02CU001.outbound.protection.outlook.com
 (mail-koreacentralazon11013053.outbound.protection.outlook.com
 [40.107.44.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D148910EA02;
 Thu,  4 Sep 2025 11:32:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r1sLUjKrUbz5om5JahsCGJoHj4i7Fk4C5/2PEcqju8Spszc8iqf/wNcadxaovQxqSVvYHSXWhuctrBzhKPNtW1O946Bn2uByBkoyn6DdM0x8WUc9cbR2IRMJ5IFAGBnmcLIrBDY//xdT26r6M6LdZJ8bRl/6rRp+Qn/ZnowUbL1cPClWQZipOOb/7NuNBXmfBgmrc7Nesg9gyx3xSjBbY4RbVTiMF+8abygleiDsZ5pHPT0vC8k1WLVWsFLGWiWB74c8UBwu43GDmPU4AQ6Z7wLZYWq/65Y0z0KDPYP0ACwPh/S2GWsIwkLbE08BE0G1zHLBT0jJN+G0TA/mKh36jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BdjIH2GoPtogl4efkjZj3AE3SaCEdXIgMbtC60L1b0E=;
 b=guoWJczmvmQ1To8sbKBwrvdhtqri+3SnQeYF9U8KdtOGWNkmJdW1wBvYDOq2BgcO3HKEFuB0dttC2bSNbfYbdDLIhyEGWNNgsR47Ld0+56Z7Cb/ZC/7Wf/39fdEG1DLRroDZnyu3OCHuAgDBUlbYrJn1h0LQzxJlusguG+/O3Zz/p36zXJ6OzZ9l5RhI5LO/oFs/v2TKeA6iSu09uj6xkI1fkdvk7ebIjeIPwefQ9hxfBKzTgL6VnGVcjeCZMQ+xFFvfAjgkv+PQIMJRcDVQDnhru9g9tBJweS4OKrgPf+gAPWotqWoN6YmXmtzmF8VdnkTaJyA6oDnDX8d7UyzNyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BdjIH2GoPtogl4efkjZj3AE3SaCEdXIgMbtC60L1b0E=;
 b=C7NJFSUv0JGad4sCnXgKv0QTdST1dL2py0K4bsQ0WHL8iPytdgFWW7NRdlhWDVt5wP9cphda34lIeY9er+Lobf4IEb+CXEpbNjgwDLErkjZ20Thk8ZZ/RdQe3a7mLpAqnqwUo6lnpXR1xzx/0gxWlJuH7RN4iin/5wtURkpAT/xMnWiF/gshSQn9+JjeV1ltCUn1NBthWCvyJm7XR3Zr3u3gTp5zRQqJ5YnlR1b+Bq+pfVmXhvxriZOy3aExYq5US/f5tBAMGWbs7Vb12hx+A+Z/zT+FcG4Y+fx48u0+cF69lqRfPpMOgn7XxfmbAFNw2EBD0rTIAj2XxLFxnWbsfg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
 by KL1PR06MB6233.apcprd06.prod.outlook.com (2603:1096:820:d8::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Thu, 4 Sep
 2025 11:32:13 +0000
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6]) by SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6%7]) with mapi id 15.20.9094.016; Thu, 4 Sep 2025
 11:32:13 +0000
From: Liao Yuanhong <liaoyuanhong@vivo.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 amd-gfx@lists.freedesktop.org (open list:RADEON and AMDGPU DRM DRIVERS),
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 linux-kernel@vger.kernel.org (open list)
Cc: Liao Yuanhong <liaoyuanhong@vivo.com>
Subject: [PATCH 0/4] drm/radeon: Remove redundant ternary operators
Date: Thu,  4 Sep 2025 19:31:56 +0800
Message-Id: <20250904113201.352187-1-liaoyuanhong@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0042.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::17) To SEZPR06MB5576.apcprd06.prod.outlook.com
 (2603:1096:101:c9::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5576:EE_|KL1PR06MB6233:EE_
X-MS-Office365-Filtering-Correlation-Id: 94af3602-2d1c-40fb-8a0d-08ddeba6b176
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|52116014|1800799024|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?B1dRAWUDhZFv8mVg8xRCHUljrLfdI9JZ3FL5zmiCRcg3VTgHgxcaVgKCy8G2?=
 =?us-ascii?Q?KL8pFc2saJ4RzZcJug0M4ykr3clK44sLz3Lx9+ANEBHhIAhCqf9YEit+EeFO?=
 =?us-ascii?Q?VvcQqJsaRGabzsndgdZcBdTsQm4NjdkLGrVlfmpIi8IFbIpwgOEH1b//gKgE?=
 =?us-ascii?Q?Ez9FW3brxuB2YEUBepqdlfuixjVcAlzTKh+r7KRj9zG/2xmLtcOQaEJ6G0UH?=
 =?us-ascii?Q?yLrb+hR0AEkcrekeSEm/DCBThHi4ockNE6kT6UGgb53OhvqJpP8kJSF9PBiz?=
 =?us-ascii?Q?DUPnK36b7P/XCE+9P79D10HYyz4PDtL5cUozrkVUF4lgXVzkZcjIkEabO3se?=
 =?us-ascii?Q?4Q8sD1BKq26vm/axHYBo/G/zNBmxGQ/5gpQA1iQKNiQYk2mKUcl1+wsPNvAa?=
 =?us-ascii?Q?qU5ZwaU564FwJ2LiaN54AgM+2ldS4285YZeB1P42RCTb/XnYm+2uAq/xXSAJ?=
 =?us-ascii?Q?roNu4E0wzzGzSl4msZ0Pub3rsnMMz8Pd+JV4xkhHpdxatAw5ZM/REG8bqYyq?=
 =?us-ascii?Q?24hLKm+3DyNLW8QxW9tRPrHta+4M3eegU/3VEsd0ToaYH3ZZFw3dV38cmr0i?=
 =?us-ascii?Q?Fq9j5NRywckT4UpB4dbeh7stNfkklL27cVWHNFF7HYpjCOly1CaU8VROH4Ur?=
 =?us-ascii?Q?CM3bvknjx0XVbhNcHktv3KtENJP4tuJLCokzKOsfrTxOO7jsJb4lxcYDg45F?=
 =?us-ascii?Q?jKsIKm2DnsbEpiS4AElXDTpreeqMH/KUxiS0tQxo0qGx37dKZQlJCPiHNBJY?=
 =?us-ascii?Q?1KcAvG37/kBXVC/wl0+Zd9Wf8G2L27QYg4IivcK6TcRxMl9Q+wU2UhPHyaYF?=
 =?us-ascii?Q?N8Tgj4L6pCS7yqrKFOyWYWpT66sSYehqpf3GciPlBtJNTv2mQSl4uei3k3CE?=
 =?us-ascii?Q?cbJ+2v8SrmGanTawTRPO4kzlFXnPbpKABPwzAhTsGmUnHb9z6HctDvKR3e1s?=
 =?us-ascii?Q?mBHhoP8f9ZfjQt46stVULoVVBGWHO+R5HiTfHj+jdeWt7i+diyVg1H5enbjD?=
 =?us-ascii?Q?R/jjggVUGtSWlmptouB8MntNY/sEeHx8GaeOl4/UO+0Bw3WKp7zhvWekzisC?=
 =?us-ascii?Q?fleC9mw01wpeCFIdM8nwygd8Cyg4Dy7i+gOU5wFYt8u27C/Rbne+yA2OSbVp?=
 =?us-ascii?Q?7sgql9i97eTEOkm7565QqoUQEGAoEZ4hRTmX4MULZYDQ1k1KaPePy8CZYBeG?=
 =?us-ascii?Q?Fj+oCEJ6MMjCXqxCqK/RjbajMLjGMJJh33YVWOjhB4cFOkd8+KeNLT6x03YC?=
 =?us-ascii?Q?vzOMOKCk2NyAQtJn6M4sZXPgl6CBpbuiem478u+bMglUz0egfJwM5Cr8h4a6?=
 =?us-ascii?Q?QyNABlpis9WNp1rDVTm7yoxgBgogeOmOe9XvXaiQffpakC+5csSnSASt+Dkq?=
 =?us-ascii?Q?XC2a+OSEhsz7vGxTWF3VAVaSCEtrKDiPzU/8//n/0LNGe0kZvG9usJd5+9Xd?=
 =?us-ascii?Q?pKjijObpDSklo15gzgTF6zGgzVwVs9Ht+4dAn7zIsIaiZcR8WPK3PA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5576.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?H2xMP+kEj4eX4upxmRvaMfuXzFq2Z8bAUwdbPDNxY1mRxdOJoudcihjRiPQh?=
 =?us-ascii?Q?dfMwMC8p93JiVaiFIIWf69FyvljFYAqBGcTRRgio1FgEtu8+dZmpU7Jo0e4a?=
 =?us-ascii?Q?a/QdS39tFYfMq7iHlXb7jxvY+luMVtw5R86gnREvPbpWscOFQ7agb5CJcleW?=
 =?us-ascii?Q?oC2xLSkcL4Y69wzshNIF8plRFhI0dR2cNRUiCyWDCm7ZMEgJzQoQv6oRD1DN?=
 =?us-ascii?Q?ZHJRIC1HDsZAkPu6UeKz4XBA1l6hvveZwCBeiawV2OWIFIHNpgOLBadg6GUy?=
 =?us-ascii?Q?prhp5Wf/FUzLcin8JLg04Zyi8vEXlysbpke66clHXM9GmtjeO4TRBZZ3hnUY?=
 =?us-ascii?Q?D6yWMr0thxrM5cJxHUJ6XbEqFp/QyCyxtYNWRpxknO3Z2/OGRXT7CmGM5i+Q?=
 =?us-ascii?Q?MwdLAtWeZ2g6XF2ud6He6YXJWxkAKJUFvXR4qiqGt9f9tsubfzj78qQc2aIM?=
 =?us-ascii?Q?7x9jrsKTzymcE1nfvHm48XdD2ziytnQ3E9v6e/XbfjuPo29927KUsWwWrAGs?=
 =?us-ascii?Q?zzkCd4K92uZIZ7c26iKnsQnC8sdCwAzKPgj3JPtW9uIU21pnE4I+6anPrdTL?=
 =?us-ascii?Q?Bg7Q6+PdNod1xP5wvJLTW/rRpm5MZrtPz+FZAdw+Z61v4Mumekq1eNkGWliR?=
 =?us-ascii?Q?py6dTqLbWnuMfe77N/j8SJNJjXJfpDJ09d2k27qp78rnQESpLpDG5rjsJiCi?=
 =?us-ascii?Q?yRJ82CmGZ9vHzmWUHiQb4eCA8TPZ2w3f8ShKU8IeYaWvmDyI4fCCyQLesZV0?=
 =?us-ascii?Q?RGlksV6nf+5Zfr+gy1kvwta2km8X3OL6DvHclYbFzlomG+kwZtd5Ltpr50jr?=
 =?us-ascii?Q?3+FHls7uq7/Ge7j6+UWmtXZ7D+r2b8/Ex5GgL9kpemc2GJKknu2+n5INkhZa?=
 =?us-ascii?Q?8h2RUe809Ru1dHg2W25GXhtwjmg9K4GDqci+eNxBTadAe2liDuBQVCQT+Voy?=
 =?us-ascii?Q?3cfY01HdLMgMAMq6ffQGDXNz9pd8yw+TmvnORXHDQdCX2RQ9vnSY4bC6uIcd?=
 =?us-ascii?Q?EUluI62SWL9DKyLVeBk9PDe7CM6w9/tjbxdTXfMVd74hq0xktN+h9bSMp6vn?=
 =?us-ascii?Q?65QN0prou4kqkf0izooReHoAh0uXCG5NNIP/i/fO/KAh9IP/5tOw9Mp6D3Ha?=
 =?us-ascii?Q?X1cQM31Ow9n2OtUgnqGtAODzSq5DuLwpc8ahU68X6Z4O2fxt+oxQd8Na//xE?=
 =?us-ascii?Q?2VWVpVBDRk1xZRryjx0RQaYVBeZk5JwbGGK0K2vdSRNXlys9a3wV2rMf0g9V?=
 =?us-ascii?Q?i0FGtN59No7cMzE02THLzMFH0XnMzLRPywZSC/ME8zk9W7APqVEgxZP7OTmN?=
 =?us-ascii?Q?HKTCOP/ymDJQWqOPC5vTaZ5fj/AQMGAXFSQ0MOd5CoDMBI8gxufA6bi1qBvQ?=
 =?us-ascii?Q?4S+gbL46Vn1BikCoKsohEkeAwIjfs5Nj3Dhwl4uaT8zEbLekUga+y8Frjwsm?=
 =?us-ascii?Q?5lH+ccvzsziK4322yzwKbehs3QzM5g2tCXRYbstbF8V2wUm4GOlHdJewr6rK?=
 =?us-ascii?Q?iIT1Gq1LZPM1Vl8BLmDcaprCMa0qh8IXLKHb4qIMCqBnRnIVaiqKXJ6OkQhZ?=
 =?us-ascii?Q?MO74JpcagqVFoJv6LApi//dEBqEkIgXCGEsOrF80?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94af3602-2d1c-40fb-8a0d-08ddeba6b176
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5576.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 11:32:13.3583 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LAMTwRrQQZ1Zf9AY/DgNuMXzzAF1AY25Yu0AV/+HwisODtCGaeXPvetDrwsnnqrnQ2BVHHSL1rGbQ13IM3vxuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6233
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

Liao Yuanhong (4):
  drm/radeon/atom: Remove redundant ternary operators
  drm/radeon/dpm: Remove redundant ternary operators
  drm/radeon/radeon_legacy_encoders: Remove redundant ternary operators
  drm/radeon/pm: Remove redundant ternary operators

 drivers/gpu/drm/radeon/atombios_encoders.c    |  2 +-
 drivers/gpu/drm/radeon/ci_dpm.c               |  8 ++++----
 drivers/gpu/drm/radeon/ni_dpm.c               |  2 +-
 .../gpu/drm/radeon/radeon_legacy_encoders.c   | 20 +++++++++----------
 drivers/gpu/drm/radeon/radeon_pm.c            |  3 +--
 5 files changed, 17 insertions(+), 18 deletions(-)

-- 
2.34.1

