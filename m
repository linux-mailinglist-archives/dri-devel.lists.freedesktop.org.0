Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A027EC6CF88
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 07:44:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63DC310E57D;
	Wed, 19 Nov 2025 06:44:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="iaWPy0F7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012060.outbound.protection.outlook.com
 [40.107.200.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7F6610E57D
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 06:44:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FrT4Im6+hqXu2mpgEENFAFvaAJQPBzApZdbn6AbdLR5BxbDcamLuL6LmvJVXZYZbe7H1usZKQDdFolQgEbTglxJ4+Bz4Ye0FpcDmn85oTmmvdavC3OhbAvBw1vUvbFpT7G0s7wi8qj4CfNs/VSM5NmfCjYpgaOiaF9Cuc3MYxLyCLJaJAy81k0VUdY52g910WsRIYY/E9E2TcHnkg5EP5l2qFuVL7AL24xHkz5xWI8oUpp7q3hwbcBFvnv2SaJRoQ58Desah2gbGDNmjgU+5+0e4JkCgpRJJRW6QVlzt3or14E5pVi83ZWbviJ4PLMt+vPtSZvyDLfoWZxUDJkWPXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xCFOyHO3t8xQXmZ1f7gFKnLXh/ZqrpnMp/86CGhw0k4=;
 b=yo+TFFFpXY3DOpPFjidNuyMdDrt6wgOzAxFVeYOfON3YvlCwQTPOdNIkAnT7QseTrc0MJ93rRmwVeej0sYMGD84TcMN3zmW6VnadPBr+ot5RkCByVGi63avujYzNpGZKwSg1jzZSAzGZbIm6jYl++/jh4NoBzGm3nRhMd1ZsOlfuBf+cTt+PnJAYO2pbhX4QVyUTTgK9Dpq64s8w7kTrtCV0adZhZ2Z3lTkQE1aRh4hy9WkEDzid06zLAxILWupXHY4yBSDdv+QT1nxQpDkDCmcnfrbsWERDA0S3YbNPMKOf7hYfSb6buV8Zte/YmlnorHrNAx0XMfNB7gXvxZlwXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xCFOyHO3t8xQXmZ1f7gFKnLXh/ZqrpnMp/86CGhw0k4=;
 b=iaWPy0F77lpQmY7TMrm1BrbfgTv+56JQmYCx5tJTmy/WaKuiw6jMDYi+1GmZFHgbdopqxyMQnwbI6kvLeCC1dAP1vc5LDAkoT357is0x7jkSm8VasuH8f8wWBV6ZW/JwVgNKZSYrCZmtrZm4qdyV7qK78hG8lSAE/082IHEpsFtoNlt94dbrkzgdbjvj4tnbSS6vdOOBY80ZGF+Nw6ejB3Zcc0wZC9zgJ9RkHoHu80OxKJvHkKSDhG9cueKQAQ5qZq9mewxSzcPVaWNFQnA3ED/kpdZrYC8rsHO0xly7/isqyvfAvDONw3EFV2/CmvURVlw0TGAn5mLc3OjV+uLL8A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by DM4PR12MB7695.namprd12.prod.outlook.com (2603:10b6:8:101::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Wed, 19 Nov
 2025 06:44:30 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9320.021; Wed, 19 Nov 2025
 06:44:29 +0000
Message-ID: <7c88d247-e0e0-465a-a3ad-f6d641291977@nvidia.com>
Date: Wed, 19 Nov 2025 17:44:22 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mm/huge_memory: introduce folio_split_unmapped
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 dri-devel@lists.freedesktop.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>, Oscar Salvador <osalvador@suse.de>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Nico Pache <npache@redhat.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Ralph Campbell <rcampbell@nvidia.com>,
 =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
References: <20251115084041.3914728-1-balbirs@nvidia.com>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <20251115084041.3914728-1-balbirs@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR05CA0083.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::24) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|DM4PR12MB7695:EE_
X-MS-Office365-Filtering-Correlation-Id: fd46f628-f042-4dad-9e17-08de273716ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|10070799003|1800799024|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q2piUEU4c0VyQkdIUm1lSjVkUVFVR0hzRFhLajhIcVJ5VlVnaE1HQVhQdG8w?=
 =?utf-8?B?c0pCRVZFQTdneU4yQVp2N0FyWE51V09JV2I5NkNoVkVsbVZsWndWYUlKR3E5?=
 =?utf-8?B?RzF1Z2hMcUUyS3BQZWEvdTY1Z1BIR1ZHSEdlS2pCUitKbS9Sb3ZqbWNEVjNs?=
 =?utf-8?B?M0N1TUdleWJ5R2FWeXVQSitNbTlUUXlqWlJjcFI5VmZXbDUyMEd3K2ZuTk53?=
 =?utf-8?B?TDJLTjBScWJrUmNXUTduZTJjeTd2TlJKaHUvRjFwOTVtaG9uTEpmK3FwTUMv?=
 =?utf-8?B?QjEzR2dNMjFmTUlqVHJLRExOTEwyWUtiYllCcUdqTlduaWV2UjVlZEttWDJ6?=
 =?utf-8?B?N2pMdHBlbU1mWE5uSG9QcTVMMmdVK2wxQ2ZIY1NraXkwK3Z0ajJvSVdtOVg3?=
 =?utf-8?B?TXc2c3Fsc2JaWmlqL29hQ3pUUFpSc0c1RTJHN1FUak5DQTdibERXMkEyVXRO?=
 =?utf-8?B?Y2REUkJGcEhOallBZ0NsUktGaUNxeWloQk16Y1cyMmNpS3MrYmN1NDhLaFAx?=
 =?utf-8?B?U2xHc1NzTTJHRFhuVHU1YmtjTHkzMnd0YWowSFJ5ZUdWWTR3WnNJRUxXWjJD?=
 =?utf-8?B?anZwNU8wRWJ2MXZ0L2d2NU5FZFJCUDR5MjhUL1RSbXI1V1VFU3VGWWdxYmxQ?=
 =?utf-8?B?TEFIUG41TW9sVTUvY3k5WFNNaGdjMGZmS2ZOTURmZk1YM2l6bmw1aGdzUm9N?=
 =?utf-8?B?M0ZnM0pGTHBKaFZQbUcxWmptNUVWR2N1OEZYU0I2RkZhMWEvWE1OTEg2THlG?=
 =?utf-8?B?RTBicUtnSVFyTzRhaXhpcERSZ1FZTnljMlJ0SmQwY0lycXdtSEw0NEhUVlBn?=
 =?utf-8?B?U2kzeG53eFQvUXFFRHp0dW9NK0I1c3NkaytDUXh1dCtJYnpGSktJREN5K015?=
 =?utf-8?B?dUJPc3BFLzJVcUlOSlV5dmFoUEE2VExQcVhxbVRIVlhTQko3R1hsa09XdmUr?=
 =?utf-8?B?NHBLRjZLUkVhZm1JOG44bUtocGU4eGZ6Q3hrd3hreTRRTFFNZndva0pJSVpz?=
 =?utf-8?B?MDBseFduem1CNzA4dWZvMVJ3Rk8vYWZoV1dwQjhkMmpnemVTcWFVUi9SejRh?=
 =?utf-8?B?Y0R1TGFEVGh6K2ZtU2xBU1BpWDNDNEJsNEdnSXpDWm9DSnprVUM0K0tpU3ND?=
 =?utf-8?B?RjdpUldkdW11NmlqdGdDYnMvMzM0cnZ3bE1mMU9RaGNCUmVjMEd4eXloWlhS?=
 =?utf-8?B?dHJ4bDRZRXlNQUJZajNGbU50U0NYeE9yU0VXc0tuMUxpM2c2SlhkdVNvMlNJ?=
 =?utf-8?B?UnNzSjhyWXd3ZVZKRWpJeHl2T09XSGp5RldDaHdMMkZibFVTMG5kbmRyeVd3?=
 =?utf-8?B?RE1KekpkTHpMWExJVWxROE5DMWlaSzBUc04vUG14bzVGMlh6S2pHendIaVNF?=
 =?utf-8?B?OXY5OGVHT0hwMnE1N0Zoa0lMWFJmM1pTMnlHRnRYWnpMZk14eEFyWGtIYVZj?=
 =?utf-8?B?U3djWUNzMVpxUnI3UnN1NHRiUFJLYjJGRkRoYldOZ281MnZXYWNyUGl0dlRX?=
 =?utf-8?B?WVhCTHllRXZISDkwaWhpZzJTQjVxT244blliQ1RFdGZjT2VYWmJzK0owVGlB?=
 =?utf-8?B?UjhucDZpbzJ3Y3E0Wm1jWEovN1VFbENXbXV5ajlwa0Q0Vk1aa3N6T3h2TjJJ?=
 =?utf-8?B?bUVVa2czNHM4dG1FUTRTbmxwUUY3SXl6RFBiZThXY3lGQWZjUFdiREViQWZp?=
 =?utf-8?B?Z0hLdVBla084MDUraEo4NHVmMnQ5MTh5Y0hwdGZ0ZTNtK2xMRjRWWHFjSzhQ?=
 =?utf-8?B?NnBseXd0U1c5R1ZSa2dkSXI3N2xDcE9GdHNRRytpM0sweUtjWERpT2hHL2ZY?=
 =?utf-8?B?L2hRbW15VUVSV3hTK0RtU1RLL3pNaitNbnJKWDJyUjl5L1hrcittTllLYVlE?=
 =?utf-8?B?VXB3Z0xhV2FSdFl5eHZOc01YR1RZV0dIMEZ0MEI2WkVGZ0xjTEVVbXZvMXJM?=
 =?utf-8?Q?E9GOYxziSE2K+tIUmqcNuxyQs9tsZ0d7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(10070799003)(1800799024)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bEM1Wm5pZ1phVDdYWG9CVml2aFIvRDJXK3FDTkdRNEdmaFQ5ODZVKzVab1cy?=
 =?utf-8?B?OXJHczlQbkI0TmsrMVR0MldlaFZCRXpIaUxmWEtKN1JDSXprQVdqMmtCUG5K?=
 =?utf-8?B?WnVEK01RbWxad3FWVUhKcTJGSTVNZnFVOHMxbHNHbGxhR3k3eW1kR21pV0RW?=
 =?utf-8?B?UHljb1lzTm1RdVltdVJjS1JMblpJZzdMWWkzTzRUc1RVWTMwZkZTUWlLalRx?=
 =?utf-8?B?cUc0Mzh3b3h6OFdrV1hiTXFFZUttdnlXSGU1bGhBdzBqWlNBWVd6Nmp4K3RB?=
 =?utf-8?B?ODl6c0ViUjdxdENqRTNsb3NBVHBpV3FkY0VNYUZvRTl4ZXRoUUFwK0JzenVJ?=
 =?utf-8?B?WnJtbEZPY1lqTW00M0lZbjJnK3l0WGxxS1o1ZHFYNzN4TmpaQ0RlTWVLeG1G?=
 =?utf-8?B?LzVaVG1odkNYR2JhRjRnd1AwaTVYWG93MVFhYTl0TnlUK0tWS0syU0NzWnRD?=
 =?utf-8?B?dVQxZXBaVjErWWs0VjdIMTJGOXEwOXk3dHl4Q1dWTFhGVUxNeWRZSFlIV24y?=
 =?utf-8?B?L3R6NHJpdGhTUS9HKzFXU1lHOG1wejV0cU5jMUplSm43S3lzK0xUbE5kUEFZ?=
 =?utf-8?B?SUxIOWcvTVdkbWh0R2dKbjFMV0szYlgzRnBnb2pqanBHSENLQ3IrNDRyc3Nx?=
 =?utf-8?B?MzdpMDFTZWRtUXJqZUFKNmo2TWdQazBBTDlYZzk0ZVpMd2t1cGhud25mRFps?=
 =?utf-8?B?U1pXM1VIbTNBTXZnemhTYmc4aGRkbkNGYnJUU0xrNy9lMERSYnBkZm80OGNa?=
 =?utf-8?B?NUM0NVVOQmxiQlV0L1NrWEJYVlFDNWZScndPcDFpWXFSZlBxSFlySzk5ckNH?=
 =?utf-8?B?Q3h0cHlBUC9pK2owam9tOHk1ZldMYkkzYnFqVTNML1g1aEdNOVpvTkRRUmlK?=
 =?utf-8?B?R0VDWkpLOFMrVS83YmR6aXU5Szd4MFZUcVE3K0RmZE12cXRzSk9JTkJySk5o?=
 =?utf-8?B?ZmFtdDRycWF6TElucGFIS2I1b0kzcGFrbXNsQmlHR2NXNFd6RXhWVDVkZy9C?=
 =?utf-8?B?d1hWRGJicWdlajN0ZmRqK1grS0QzVjZ1MlNvZ2FpcGJ4VXhsUVJvWUtOYTg0?=
 =?utf-8?B?Ym5WTU1adlNFVUp3YmNlMEZqb2NMVUpIdUwwaVFZSmJmYUJHNjdQYURmeHdq?=
 =?utf-8?B?Sjg4QkpwWHdVdUxqR3hpMUsyM2xOaEx6ZFpoOER4akNOQjZmT3FMcDY3Qkdp?=
 =?utf-8?B?Vm5SMmhGNlhMaGNmTHhDRHl1ZHJxcEcwTkpURDA2SXExclBzRm44ZERZUDdm?=
 =?utf-8?B?aXBUQ1UvNDNOSXF3SWhNYjN1RUtCNnNvT2szMmpMUlZ4bmpIcGYyMWo1cU9G?=
 =?utf-8?B?WjgxaVdmRm5GL1hHdlBzQ1ZjMWJLR2psKzNuYllXUVRsK2RXc1lvMGVrYzFv?=
 =?utf-8?B?ZkgyTDh1ZUlEL0FQZ25wUk5GOUlzVFYyWVlwd3gxWmJyV0NmRzB3aFFuU1Bu?=
 =?utf-8?B?ZzY3ZFNjRENGSDk4dm1MR0doUVVJSWl0eEkvNzNJcGo4cFZVNVFXYm5uK2dr?=
 =?utf-8?B?anNuaXg3UDFrWjM3ZFlwTi91WEEvdHovdkZvcU1JNEFIckE2WThwZ2IyREpw?=
 =?utf-8?B?czVOeElNZHJaWSt2K2hHZFFhUytIZ2M5NWxtblQ4UnIxMmZPZXU1VlIraE1H?=
 =?utf-8?B?b2JEbWRoaytVcWNQWXdrbi9RNVYremlQSE9TSjVmOHpOZ1ZXM0tuTlFmV3pO?=
 =?utf-8?B?aHQxdU1kbHozREtYUUpQNFNCRnBJODZZMUNuSUc1SllXdjJyT1d1Q2VLSGhL?=
 =?utf-8?B?U2c2S3RMTnMrV0N6VXVPY3o3ZEJQbDdUTVhGYjRwaTBJbjNTZ0gwYXdrc0xX?=
 =?utf-8?B?a0MrYnFYM3VSMEMxcmxnbTBHVVc1ODhhcXJJZC9nSEFYT3VnTXFzZEtiU3Z4?=
 =?utf-8?B?dnVDYUpCRWNZeXI5VjEyNjRGNG50c3Z1ZVIveHpob2JEV1hJWWNuMTcxczVG?=
 =?utf-8?B?NWVaUDZia3hEN2g1MkJiZ1VqOTRQUXZ6WDFKV2FEeHRIaUxMOVRYNVZ4WEgx?=
 =?utf-8?B?Q01nTWZ3bnh1Z3NPNlBkMFFGbmJteTFhbmFQUmc1WXVVZmx1SHBlb1dWQlAx?=
 =?utf-8?B?NzkyK2QvRDRRMnNSR3dwdDlaTFVFL28rSitQODlQem5UeklCL2IwaWZaWks2?=
 =?utf-8?B?dHRXUFRKMnJEcnFpUVlkTHVOaVlyQWhwYnpvOXdLQXpoNExrbGordFprNlVw?=
 =?utf-8?Q?1qzQv8AV8yykF88YWHN01iBrkPTsqsJpNOLgi4dIrGsn?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd46f628-f042-4dad-9e17-08de273716ef
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 06:44:29.6729 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RUaC1DhcU8xDXyEMYJzLQoyGkKLfWFz7ZhwDfbIQbd19hkjYLOM+KPsRW6pFxsYVYp1e93XoC6LQEyTcStPnww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7695
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

[Reforwarding - not sure if the original response made it back]

On 11/19/25 07:36, David Hildenbrand (Red Hat) wrote:
> On 15.11.25 09:40, Balbir Singh wrote:
>> Unmapped was added as a parameter to __folio_split() and related
>> call sites to support splitting of folios already in the midst
>> of a migration. This special case arose for device private folio
>> migration since during migration there could be a disconnect between
>> source and destination on the folio size.
>>
>> Introduce folio_split_unmapped() to handle this special case. Also
>> refactor code and add __folio_freeze_and_split_unmapped() helper that
>> is common to both __folio_split() and folio_split_unmapped().
>>
>> This in turn removes the special casing introduced by the unmapped
>> parameter in __folio_split().
>>
>
> I was briefly wondering: why can't we just detect at the beginning of the __folio_split() that the folio is unmapped (!folio_mapped()) and then continue assuming the folio is unmapped?
>
> The folio is locked, so it shouldn't just become mapped again.
>
> But then I looked into the details and figured that we will also not try to remap (replace migration entries) and focus on anon folios only.
>
> I think we really have to document this properly. See below.
>
> [...]
>

Your observations are correct.

>> +/*
>
> Can we have proper kerneldoc?
>
>> + * This function is a helper for splitting folios that have already been unmapped.
>> + * The use case is that the device or the CPU can refuse to migrate THP pages in
>> + * the middle of migration, due to allocation issues on either side
>> + *
>> + * The high level code is copied from __folio_split, since the pages are anonymous
>> + * and are already isolated from the LRU, the code has been simplified to not
>> + * burden __folio_split with unmapped sprinkled into the code.
>
> Please drop the history of how this code was obtained 🙂 Focus on ducmenting what the function does, what it expects from the caller, and what the result of the operation will be.
>
>> + *
>> + * None of the split folios are unlocked
>
>
> Looking into the details, I think this function also does not
>
> (a) remap the folio
>
> (b) call things like free_folio_and_swap_cache()
>
> Which locks do have to be held by the caller? I'd assume the anon vma lock and the folio lock?
>
> Would this function currently work for anon folios that are in the swapcache?
>
> And I assume this function works for ZONE_DEVICE and !ZONE_DEVICE?
>
>
> Please carefully document all that (locks held, folio isolated, folio unmapped, will not remap the folio, anon folios only, etc).


Something like this below?

/**
 * folio_split_unmapped() - split a large anon folio that is already unmapped
 * @folio: folio to split
 * @new_order: the order of folios after split
 *
 * This function is a helper for splitting folios that have already been
 * unmapped. The use case is that the device or the CPU can refuse to migrate
 * THP pages in the middle of migration, due to allocation issues on either
 * side.
 *
 * anon_vma_lock is not required to be held, mmap_read_lock() or
 * mmap_write_lock() should be held. @folio is expected to be locked by the
 * caller. device-private and non device-private folios are supported along
 * with folios that are in the swapcache. @folio should also be unmapped and
 * isolated from LRU (if applicable)
 *
 * Upon return, the folio is not remapped, split folios are not added to LRU,
 * free_folio_and_swap_cache() is not called, and new folios remain locked.
 *
 * Return: 0 on success, -EAGAIN if the folio cannot be split (e.g., due to
 *         insufficient reference count or extra pins).
 */

>
>> + */
>> +int folio_split_unmapped(struct folio *folio, unsigned int new_order)
>> +{
>> +    int extra_pins, ret = 0;
>> +
>> +    VM_WARN_ON_ONCE_FOLIO(folio_mapped(folio), folio);
>> +    VM_WARN_ON_ONCE_FOLIO(!folio_test_locked(folio), folio);
>> +    VM_WARN_ON_ONCE_FOLIO(!folio_test_large(folio), folio);
>> +    VM_WARN_ON_ONCE_FOLIO(!folio_test_anon(folio), folio);
>> +
>> +    if (!can_split_folio(folio, 1, &extra_pins))
>> +        return -EAGAIN;
>> +
>> +    local_irq_disable();
>> +    ret = __folio_freeze_and_split_unmapped(folio, new_order, &folio->page, NULL,
>> +                        NULL, false, NULL, SPLIT_TYPE_UNIFORM,
>> +                        0, NULL, extra_pins);
>> +    local_irq_enable();
>> +    return ret;
>> +}
>> +
>>   /*
>>    * This function splits a large folio into smaller folios of order @new_order.
>>    * @page can point to any page of the large folio to split. The split operation
>> @@ -4127,12 +4171,12 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
>>    * with the folio. Splitting to order 0 is compatible with all folios.
>>    */
>>   int __split_huge_page_to_list_to_order(struct page *page, struct list_head *list,
>> -                     unsigned int new_order, bool unmapped)
>> +                     unsigned int new_order)
>>   {
>>       struct folio *folio = page_folio(page);
>>         return __folio_split(folio, new_order, &folio->page, page, list,
>> -                 SPLIT_TYPE_UNIFORM, unmapped);
>> +                 SPLIT_TYPE_UNIFORM);
>>   }
>>     /**
>> @@ -4163,7 +4207,7 @@ int folio_split(struct folio *folio, unsigned int new_order,
>>           struct page *split_at, struct list_head *list)
>>   {
>>       return __folio_split(folio, new_order, split_at, &folio->page, list,
>> -                 SPLIT_TYPE_NON_UNIFORM, false);
>> +                 SPLIT_TYPE_NON_UNIFORM);
>>   }
>>     int min_order_for_split(struct folio *folio)
>> diff --git a/mm/migrate_device.c b/mm/migrate_device.c
>> index 46dd68cfc503..05ce95f43ab9 100644
>> --- a/mm/migrate_device.c
>> +++ b/mm/migrate_device.c
>> @@ -909,8 +909,7 @@ static int migrate_vma_split_unmapped_folio(struct migrate_vma *migrate,
>>         folio_get(folio);
>>       split_huge_pmd_address(migrate->vma, addr, true);
>> -    ret = __split_huge_page_to_list_to_order(folio_page(folio, 0), NULL,
>> -                            0, true);
>> +    ret = folio_split_unmapped(folio, 0);
>>       if (ret)
>>           return ret;
>>       migrate->src[idx] &= ~MIGRATE_PFN_COMPOUND;
>
> This is clearly a win.
>

Thanks for the review!
Balbir


