Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED826B165B1
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jul 2025 19:44:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2316510E22A;
	Wed, 30 Jul 2025 17:44:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="bwFXq8wL";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="bwFXq8wL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010068.outbound.protection.outlook.com [52.101.84.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8BCE10E222
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 17:44:37 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=TRui+J9X6UGH2WcBPSEeLYKIxGysoC4eOTHPuT4nnWSDq5CvuwBUC/JQZjeupdZt0TS97CyznpQ+loZfoNx/0eDSHdOWdug9klXfRRL598tKgBHuzruPXrZxCqfFW/1yciOlTwn08snAPm2v3oz2OcvAr6APTTIbg5bMGVqIcVBvMAw+fIgnk3cSRf9Tj94IUVGS1eQT0aY/p1Yhd+S+Fp2PFnr3WJFjDCJACyAAenWW5nwGiyByeIRMHjIwL3J2Nb1ubgKVjLxi5Oq66hC4YGnJC83NK8xRmw6v+vgKCLT3P4/0tLk/R2qDsPNEj/LSM6X/cYs2mCmJgo/BIk3JDg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=69YVguywP5AU9QJY7JtfCkBSc51jGCMRZur/+Z8fi+A=;
 b=xzzhkflPEDZRWygwIM7k8z489ITzlp5p3/JWEwR3FIhWR4mDEHevYlsLo0hjmkenakj82PaR/jrUF6+nSSGp9ZGX6ao5Aoz/46aKh1JlQ4IuVTCQ9ElVeJup2gg7F7ToFZzUdfg5IKYx5+wn1ioHfXczJjFi5yOpWKII+Z/NVSsLdswEt6nS7+qK+AJ0+MTpLvXGLI1Zo8TU+9LYyO7jP7CDf8w/ySdlqPgnsaxYq5En7AT/NnHRbKk5NabOsAkQYGPbxGEANYvbZpe3MKTz+MS4xIUU8yvB/r83SFRLpPlmvzag1wa31IAuAaSpXMjbaPSXlAEzaPT2WCd7PUNknQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=69YVguywP5AU9QJY7JtfCkBSc51jGCMRZur/+Z8fi+A=;
 b=bwFXq8wLOAHWmhoDOQCgrtYyCOuhwrf1xFMDfExHqVT98c/oo1NAq/5Um/t9AXqKGmii91arMiZae/ehQ8L3CuRt77sLWs6FflCfdHaeIidBa9ekF853TJiwlUzA/qV73TwZiqAiigRyDbXChJzHwpgWtEc0miSLmw5LNcf4nps=
Received: from CWLP123CA0177.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:19b::14)
 by GV1PR08MB8571.eurprd08.prod.outlook.com (2603:10a6:150:83::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.25; Wed, 30 Jul
 2025 17:44:30 +0000
Received: from AM3PEPF0000A791.eurprd04.prod.outlook.com
 (2603:10a6:400:19b:cafe::bb) by CWLP123CA0177.outlook.office365.com
 (2603:10a6:400:19b::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.26 via Frontend Transport; Wed,
 30 Jul 2025 17:44:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF0000A791.mail.protection.outlook.com (10.167.16.120) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.10
 via Frontend Transport; Wed, 30 Jul 2025 17:44:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ENTbcHNFD82tzAhnRWcwEb6yBif+adoKokDsKSpQTRdrjkWYT4F/Le2L6LF/z3jwyHj4U9h5zSZlDN0zzyTc422v9qTTIeYV+zeKqQz8+r0i7qx3kHbWQcLCkK42mCcCa0d6Cc2BM6TdgYxHv2zjINkZMemNjK02rc7JXFQquHzYkbKtHwHaNHEiOYzwtHUSXW5dupJ8ELM/wNFMBQHdpj2oMu+yV7B9wvsXnai6AThBSb5omq2x0ueSZVduJzQvYaSJkPTedZcTxeY6V5vltZmJ2j9lBhGzz394NNUMo8N8J8aJdy9QhX6fey6V81JBiSqhj+wMvVDfbo9pRatjRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=69YVguywP5AU9QJY7JtfCkBSc51jGCMRZur/+Z8fi+A=;
 b=WOntSTOQy50WtHQwyo6N/a3Z0BD65sUwNvz5l5KilJ8TAb6TDd3hCnqnSZrAy8jKlMmITpEW66VGKdIxZFYrAHKDxZUm3h9loRLV91FQGG8GswtAP6cgJlJ0wedlewGFrPhBMUNpEm0DpZw5OcNYD3B/gqQnd+MScJVm4/OjSJ2rZsm5iP/xekT5rLNJqpxzzkKzsyUr9k89ONekF8x9AV7C1FKP7638ARQufHqEAVAkZAvsmCbyKA+mlpncHqv6s+G8Zbo5eiuEty5oRvxxzwXae8Yel//PlhvPLZSx6c8rgrVrCXC9VRQftmnSDXSTC9Qxlat+4c3G3woN1olgAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=69YVguywP5AU9QJY7JtfCkBSc51jGCMRZur/+Z8fi+A=;
 b=bwFXq8wLOAHWmhoDOQCgrtYyCOuhwrf1xFMDfExHqVT98c/oo1NAq/5Um/t9AXqKGmii91arMiZae/ehQ8L3CuRt77sLWs6FflCfdHaeIidBa9ekF853TJiwlUzA/qV73TwZiqAiigRyDbXChJzHwpgWtEc0miSLmw5LNcf4nps=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by GV1PR08MB10856.eurprd08.prod.outlook.com
 (2603:10a6:150:161::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.11; Wed, 30 Jul
 2025 17:43:53 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%5]) with mapi id 15.20.8964.025; Wed, 30 Jul 2025
 17:43:52 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org,
 Dennis Tsiang <dennis.tsiang@arm.com>
Subject: [PATCH v1] drm/panthor: Serialize GPU cache flush operations
Date: Wed, 30 Jul 2025 18:43:38 +0100
Message-ID: <20250730174338.1650212-1-karunika.choo@arm.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0429.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::33) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|GV1PR08MB10856:EE_|AM3PEPF0000A791:EE_|GV1PR08MB8571:EE_
X-MS-Office365-Filtering-Correlation-Id: c6bd4e9c-f67f-465c-f168-08ddcf90bbc8
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?2wLY6MSCtNAGtQxccjqwtO9iDJXb9tWjLgrFBiSBnYuSGddOwc80dWiOeFJC?=
 =?us-ascii?Q?BzOzNB+g34wFL44U+UPP209OAE7ugOmc+O5ZMGMh+9VZbctEG9cy9GBsp8Xd?=
 =?us-ascii?Q?3fFh+bGy38Qtv40CT9JGje8KouOz2M94pBIqU7DjqPi1l6Vhfj2BDFn9BJQ+?=
 =?us-ascii?Q?fhKhuzx55XeUoKRM1s9d5ajMo1mHUvnNgPSWHPs0Hqm1BVuKG0T7//E63IpW?=
 =?us-ascii?Q?jQSJ0Z1/Kv05ThU9CCvlO9IaJxdeE2eytInGPLC6fCzCQZH7yMCcqTYRKDUg?=
 =?us-ascii?Q?DOKtHDcWopuImyBOCTt/xG2XHgY8y+8XQctMTsyBeTlPJtwgt3mu6foxaJ3u?=
 =?us-ascii?Q?+ewUkV6OKXLodwwX06p48WUnc+ysoMPucSnNrhdX+aF2+++OTBbim9uAJEXB?=
 =?us-ascii?Q?GZwqO2gcw2BIAIm2NMs3pQ8fh9GYFoGyeK4PUBXgD+OdMKwhPE3rZ7KC/5/l?=
 =?us-ascii?Q?rqkvmOZmGVc+oRQ7ZjIOF0ArFurPgxhTtpWpD8L9EziVrRHxZR/3Q4Mj5/PF?=
 =?us-ascii?Q?0taw2B4CAw9b6qlaYGLrNfKuuhOXuzg/5CBkxkzKxa3OTks8Owc3hKfwwXfN?=
 =?us-ascii?Q?0P+uF3lWIxM2eoXaEDOOpZvd1VEvTIPXJ1pNzgo+RptEFIFFjBjqxF79wLsH?=
 =?us-ascii?Q?QCfgrlyQxSo9hKU5z82RAZGEPZB6RbGhFwleb+PSs1CT+hpslyLUONI6+ZBn?=
 =?us-ascii?Q?bRhHTBGeZuznUdzIwbqLd94tbrBa/9Ugarwvmw+uW4CVUtczTgH/hNhSoV/j?=
 =?us-ascii?Q?uAzhe+tKMe/mHf8veErDoDp3z5ellfoR+1b3wg6ayDcXFNHmVAZqw8Tgn1Co?=
 =?us-ascii?Q?QIXhYDwMYMuijio82aQDDIufvQD662WyxvLHDmto71lwi15+QLabeW9NhKO4?=
 =?us-ascii?Q?vGdVXm9x6lHCiUaJvFIys89pZDBx8VmE2a6kX2ZUd23Z8Oz73g5Cy4GucXVx?=
 =?us-ascii?Q?WKnYWQgRG9kNC+8Aa7Jvf43wWSGHwwGxQ8fiRjZpELrhpB3MDGEzBHLXjY8S?=
 =?us-ascii?Q?ZmWNUmcYNN4ExoaL98auS1Zr0xWXFkA3j/26WkqxUHDZwDnneP8t44bE5xfd?=
 =?us-ascii?Q?BXXCjYAx5oXMSKtU65N7FT4unBd7a111ZksKmRtKmkTPiND/eYO6xBOxSVbo?=
 =?us-ascii?Q?wE2kmdZeTbETda8xdTJSZilAytJdnDIMyA4yEkN8WGcLBlbfrgvhHljbMfLd?=
 =?us-ascii?Q?sDrv8EYmtGVxSdgwdlXGejcZvQIpIzlrweJXo2PSZy4xqA2mM0mnu8VZak2l?=
 =?us-ascii?Q?UG08idJ/BWtC7QfnVaqeIJFITfd4jwDEGedvlBMUwYXul6dR1Dxnj2fWO4Lr?=
 =?us-ascii?Q?xoRnTBFvRvLhl0O65xo6/3Hj6klCWq+ghaUz7+K6AEeOAW6vm5l0ufxgMKnf?=
 =?us-ascii?Q?0xh2LVXKWJdmvxbGJ83vQrM2ahg7tKd9O6ltqPzLVvh7r5pPWCRHLtMoVkT/?=
 =?us-ascii?Q?g6symrL0iZQ=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10856
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM3PEPF0000A791.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: aa057d70-80c5-4e6e-dcd3-08ddcf90a5ff
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|35042699022|36860700013|376014|82310400026|14060799003;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KMb16anaB7RdL8wxnzFlVLbE2j1C1KX1vtaFu32DCaXtdbpQFkr6E7ko2USJ?=
 =?us-ascii?Q?V/RJki+AaZ2fe06Pa+ktcf55Ts+tVIjKaF4kLKJ59+5NxsBrbgrG2CrzGu4Q?=
 =?us-ascii?Q?raDTbSIAagX7jF6GLDEotYCX6B3LGRLcmU0tehayZVK9fjzy76/ghdXTCY25?=
 =?us-ascii?Q?3TWJk2WdUcVIeUlsQTVia0/jWWYRccGItLnPSQPNJRM8NDK5QcLF3chATory?=
 =?us-ascii?Q?N2drD3lgLDmboS2Qq9Fz8E/j1VCJA14alm+2+XMuVt4y7+hdIOltkLmAZNHB?=
 =?us-ascii?Q?/m3l4l+FonYHvTeaqAXkZERIFU4XwcKll0/dWJpzQ6Jjcri2Wl1DR3bIZcaV?=
 =?us-ascii?Q?4nA9u7Ctq0e1g3Udbf2+Cf+z3g/XCbtK+omvBhqS3oTV2n+x6826gMp35RdJ?=
 =?us-ascii?Q?WS5dAnWcpfEC6YzM/RutEPQQCoFokoeSumA+wbclV4etpTfBODCI6GT65llm?=
 =?us-ascii?Q?9JktzAj6I5f0jxzh3DXBStWkGtmEMnRQQrf8qEYNxEgCW0YxsLjIFUKss6VW?=
 =?us-ascii?Q?JZiBZMrcl0Nbict+iPC8+Vc4t9oC/Yk4/uyGUuv3UlcYQShKgQURg8IYir52?=
 =?us-ascii?Q?ORv4rXmInb880b9ZpJHy6u+rsHJuV8I9boUjcq9xY/ttv0HmMxvd4gdP2Ppa?=
 =?us-ascii?Q?bt+E+6/0SLJ5NgTT9c8jREU2AVeFLrswy3fjXcSdoXIAUjwJn+Hw1CPKrQn+?=
 =?us-ascii?Q?VcCUH8dEuxhQw3ZhwvaimxVex2zKV4FPZNVDZe4o2CUXq1itHjsKD/D2gBlp?=
 =?us-ascii?Q?alR4UDHfJ7zKhHwk1HtEOBMxGmO77PIJBnRJE4z570RXzTfSS9p3mHmqNuQv?=
 =?us-ascii?Q?r1XBbQFqGNlD4V4T1vHABWlyCciEVpdXlNyX1QgfiHHAvM4YYZerYxuR8utL?=
 =?us-ascii?Q?70gWALU1scvPpn/Y7NgSAbZZuHjQIBMUfYYKNyeI5VmhG2dbcd6MATZGR5SL?=
 =?us-ascii?Q?j3cYxvfuiatlvhzkuMAabpvtq9fDcuL/raGb6qNx+LYM2Mr4bOHYHP7cDawf?=
 =?us-ascii?Q?DsBCTA2iwT21ipX40PVfnDiCTPqxm89gapUM6Uw/lHQVwqsjzSkDD5TLODoP?=
 =?us-ascii?Q?rBz7qc23Ya3uBbq6mrkbw+MrGkiygs4A6kciFPc+Xhi3y4XqEpox36Vss755?=
 =?us-ascii?Q?PYBXQx9xjvaLqIFAD2iMz98Uhc1gGhbYOx4L9DKprn9b0T+ycwmU6ege/Noy?=
 =?us-ascii?Q?Qu0uXxyTyQykNjCBH036+s+zGqVRpuAQlJMgSMnXSDVlF+mpCGjbCZYfTq9h?=
 =?us-ascii?Q?rNIgqdxVuWWK/UP+J50vsbxHpJcjphdGQ1AshzkjRqTlp2GAQowmy57Q8W+G?=
 =?us-ascii?Q?8OtJcNwqN7BRYu9dGWxaBY8rw0XDpSg2n+OwC1WeoZRg68Ab1z9aiFmHqnEu?=
 =?us-ascii?Q?/iHBmL1Db3l34DDsfJi0qmjMG7dSJTNZVkJ+a53y0R1prCPcPA8rKcwlBTYS?=
 =?us-ascii?Q?HzUErwTROCWdFwAtz5ZdechnA9Ignhv4x8X8pldcMNXuS4erKhZU2uL3R4iz?=
 =?us-ascii?Q?NaJNLWaWLR8r5MGC3RYJKGctuaRfWi/pfkgb?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(35042699022)(36860700013)(376014)(82310400026)(14060799003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2025 17:44:28.8272 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c6bd4e9c-f67f-465c-f168-08ddcf90bbc8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF0000A791.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8571
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

In certain scenarios, it is possible for multiple cache flushes to be
requested before the previous one completes. This patch introduces the
cache_flush_lock mutex to serialize these operations and ensure that
any requested cache flushes are completed instead of dropped.

Signed-off-by: Karunika Choo <karunika.choo@arm.com>
Co-developed-by: Dennis Tsiang <dennis.tsiang@arm.com>
---
 drivers/gpu/drm/panthor/panthor_gpu.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
index cb7a335e07d7..030409371037 100644
--- a/drivers/gpu/drm/panthor/panthor_gpu.c
+++ b/drivers/gpu/drm/panthor/panthor_gpu.c
@@ -35,6 +35,9 @@ struct panthor_gpu {
 
 	/** @reqs_acked: GPU request wait queue. */
 	wait_queue_head_t reqs_acked;
+
+	/** @cache_flush_lock: Lock to serialize cache flushes */
+	struct mutex cache_flush_lock;
 };
 
 /**
@@ -204,6 +207,7 @@ int panthor_gpu_init(struct panthor_device *ptdev)
 
 	spin_lock_init(&gpu->reqs_lock);
 	init_waitqueue_head(&gpu->reqs_acked);
+	mutex_init(&gpu->cache_flush_lock);
 	ptdev->gpu = gpu;
 	panthor_gpu_init_info(ptdev);
 
@@ -353,6 +357,9 @@ int panthor_gpu_flush_caches(struct panthor_device *ptdev,
 	bool timedout = false;
 	unsigned long flags;
 
+	/* Serialize cache flush operations. */
+	guard(mutex)(&ptdev->gpu->cache_flush_lock);
+
 	spin_lock_irqsave(&ptdev->gpu->reqs_lock, flags);
 	if (!drm_WARN_ON(&ptdev->base,
 			 ptdev->gpu->pending_reqs & GPU_IRQ_CLEAN_CACHES_COMPLETED)) {
-- 
2.49.0

