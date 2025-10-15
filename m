Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35EDEBE0BFA
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 23:03:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3194D10E8F7;
	Wed, 15 Oct 2025 21:02:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="DfmgHPWX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010067.outbound.protection.outlook.com [52.101.69.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA70B10E8F7
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 21:02:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vkdZeEi3cst4G8VXe82Q9OlijadWodlCLBnuUyi4G5XY/lnjJzJRzdcNYwGy8M2X4r6F1BdEjrTW71t7sC87QCghyAhEP/DVrIci9Dauw7570htYzs0JsaOgSwzkm2ZnjJQnwypOKfW1TV1sh1sMUHbjsMUqfBGTgUiN++VMk2rzuHvgCcM5nm/e2Y/V04GA8H46X0yN/sug5m/O7U/QlXAuTHgxXMLbkQxlGPcXduI+qVl9MBhIUgA3mq9+mbCde9b7r18DdaphZzJLqXRPXvNT/5qkzctxEDHEyAIggGJbYbK7WubR2VsUHVHSaXMF1GR4wUBGOIcTTUV6gbffaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H/Wl1bDVm5BELxPoJOrWgUawbgfCVH5pe2uJL3GFyOg=;
 b=PIj3xh2l4TmvdGW1wBJlYAbIganbpXCCOJ+/55i/aoaa9s7kBgwH79iihRpjCO53P0xkfSwsaAuExGI+y5fJPVatDSOASroLagHqgDDU6S4ulm575xvpm6bWC069VSl4BcmGFqFcGmRacUuKtpwOiHHr6/MYHtdH+CfqwunQNuzW+AhpkKf48ZOg5ThqmZQQ2zrZ+O3pImyI+2DgeFLBlmGY8vxubFGUX92X1S0pHvbD+eN2pdi+0E5BTfG9Quh0bKAFkk9YSQvViApcaB+OdKppp8IhDf4i8zKc8utgRvL8WpNsWqoM1+Zv9G4Brmdc5o1VINcZiE9GKFbZKqyNFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H/Wl1bDVm5BELxPoJOrWgUawbgfCVH5pe2uJL3GFyOg=;
 b=DfmgHPWXi57z2raaMvnSW8FXlnNx99U8IDkxAflPzde6OpwWzjyMLGnfEJo782bkzr+g+a+gohfeNKd41sLISZ5iNaO9z830WKz9O07352J0uoPeVomsUvPaaj01zic0w9MnOtoq+RSl5847bfirTrUBQyjbJ7JPqR8RqVS21Vhi9v5ShE0XM8vgJND46cOJbI57GfPotMlNTO8MHeLgLPtfGQYHEoOkt9QLki/23L4k78aFl2Q7Qum+NUkN55jzh694oYP3mPoKkVG5NyUwZBNU/iStxKQeUjDK9fTuAuRwEjLCAXGMbogzEJqcJ5vlr2VYJbifBtpv2LrCLNYfhw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by DU2PR04MB9052.eurprd04.prod.outlook.com (2603:10a6:10:2e7::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Wed, 15 Oct
 2025 21:02:45 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9228.010; Wed, 15 Oct 2025
 21:02:45 +0000
Date: Wed, 15 Oct 2025 17:02:35 -0400
From: Frank Li <Frank.li@nxp.com>
To: Rob Herring <robh@kernel.org>
Cc: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Robin Murphy <robin.murphy@arm.com>, Steven Price <steven.price@arm.com>,
 Daniel Stone <daniel@fooishbar.org>,
 Sui Jingfeng <sui.jingfeng@linux.dev>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v4 2/2] accel: Add Arm Ethos-U NPU driver
Message-ID: <aPAL67Oct5yJv8/d@lizhi-Precision-Tower-5810>
References: <20251015-ethos-v4-0-81025a3dcbf3@kernel.org>
 <20251015-ethos-v4-2-81025a3dcbf3@kernel.org>
 <aO/4cQ8+eLnwqFSh@lizhi-Precision-Tower-5810>
 <CAL_Jsq+L2RHgP9FaEpxzzVRybyjeNr84xgEBbU4KEyZtrz63FA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_Jsq+L2RHgP9FaEpxzzVRybyjeNr84xgEBbU4KEyZtrz63FA@mail.gmail.com>
X-ClientProxiedBy: SJ0P220CA0014.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::22) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|DU2PR04MB9052:EE_
X-MS-Office365-Filtering-Correlation-Id: 4066fe3d-75aa-4ac0-8884-08de0c2e301a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|19092799006|52116014|376014|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VVZ3TTZwREFFRkhZQWdGa2c0R3prY3ZrcTFvY0l4cm1panV4RE5iKzJQNmNB?=
 =?utf-8?B?QndNYlNaajhUWkpMKzFwNHlwTHBadFFoaXVhWGJEY1V6a0cxODFXUTAza2pu?=
 =?utf-8?B?aHI4RFRaWkUveWNBeFVFRW04YWtRUFpnZWNIVm9odXllcWJVMTJZbVpoWENy?=
 =?utf-8?B?WlRCbGVnL25IT0s2TjZ4bDUzRWNOcm1nU3pQS0ZJdVlDQXpxcnZHc1VHZzlP?=
 =?utf-8?B?VHJIZVRNbWJabWRFVkI5dVZIeDVDbE15R3F1b3pqbE5DWTdFVnVKNk9iVWh5?=
 =?utf-8?B?d2lUejN0TXphTnoyNTdpV3RldFdqS2hpc29GVDlsOEtXWnpCZ3pWRC9tTW0v?=
 =?utf-8?B?Njd0TDdMQzBoQVNMRlcyNmk5aDFneXJ4dGF4eDZZSVl5NDlKUzFNTnoycWkw?=
 =?utf-8?B?NkI3aytaWVUxdkVBWTM5TXNVYmg5YTVNUjJzQnlPRXhVc2RxbEV0Qld2ZzFB?=
 =?utf-8?B?UVJheGZ3S0hZdnRhNVZRTnMzRE8veW9GRnZVRjlSRXdRZjdFZ2J5YkIyRCs3?=
 =?utf-8?B?VUFoaVczK0Z6UXg0RlZNN1hMMkNDMVo1ZnlYMXcwS2RZOHBHTy9INmtpZUNR?=
 =?utf-8?B?NTd3NDZ2ZHZ0UTJMT2hIRmdMeG9VL2pRTlY4TFJkWmh0U0ZqRXc4c0tMZEtv?=
 =?utf-8?B?NEI0aUQ1K0pDMyt4YnFXNDEzanZobUFyOTQ2ZTh1K2llMEhCSGZIN2tKdkJI?=
 =?utf-8?B?bE82S3R0ejFJSHhhMVhKTGJ0SVd1Q29hOUdFeVFrTnFaSUpQTGVwWHBDRDZJ?=
 =?utf-8?B?UHk4MkVlSnI2UDlHZm45YmxBTUl0NDZVcTRqRkVTYlU2VDNSd09xMEFQUzlZ?=
 =?utf-8?B?azh2d2x6YjZtbGVxSkhUYU45bGZ1Wno5YXVtbFQ5ZHdjSEhlOHgzMjRJRU1M?=
 =?utf-8?B?YWNiUUJoM2lkQUpHZ0wyTEtnUGc1eW9PUDY3TkcyRjdLaXRUWHQ4UGlmbHdV?=
 =?utf-8?B?L2JzVmo5RStOZXVyOWxUNENieElUZkZRMEYrOFJKWUVHMWRYYVdyQ1NZblYv?=
 =?utf-8?B?UW9lY2Y4Vyt4YzZzaHVoRXhaTUVQaHBKcVlwYTFDNUl0SnFEWnVwTjl0MnJE?=
 =?utf-8?B?KzZ3eGlTTGJmMlYxM1Z2aHZ5aXh5U0NYOW1UWVpLcEdEQWZ5WkZaMzFpSlp1?=
 =?utf-8?B?aHFsOWo0bUIvbE5vWnFycSticTNvRXVTQzJFV2JrYjNaSGdKL1NxOWpZY0pq?=
 =?utf-8?B?UWtGYXdyNG5LenpXR25jS3RPQnhxb1J0ZTB4UTBOeUlrd0hrR0NodmxUbGk1?=
 =?utf-8?B?cjFnRUpVNXZUdnpYa0M0ekdHWDg5SzdiMkJ6cS92V2pnWmpRaEoxcm1DSVA3?=
 =?utf-8?B?YTQrOTBiWXBqTVZPUEx0UlhzMC96SU1zdmdxOTA4bFBUdks0Z3o3Y0FqY2Mv?=
 =?utf-8?B?VEhjYnZ3Njk4Q0hXQ0VwaWM3THBLakV5eXRmeWZ6VVdHNzZxb3lpNFNXOUJt?=
 =?utf-8?B?bmhmOERwY0ZKQkNFZ2svRzFHUnRuS1drbGxSb3l2UWNERFR1V3o3Q2M3S05C?=
 =?utf-8?B?YkhwYkgyREMrQ2VEUEVpM0RVRktoZXBmaFVEN2VxQVhjTnI5aWoyenhaRjJj?=
 =?utf-8?B?ZU01T0dES3ZrVnoxMkR6OUJ6WlZ6SFdDKzIzVnZPdkVKOWM4QWJEaVlTZkg1?=
 =?utf-8?B?Yy9zcXZnQ0pkUC9BZkRDL21wYnVHU3NqYXVEYUdxNVlNK3MxY1ZQL1UvTUda?=
 =?utf-8?B?bDJ2aFlSMHgwcXRCYjJYTEhuZlhCWjRGR1lpYmI0RHdXcWVqQ0MzdW01TGw1?=
 =?utf-8?B?aTMzamhFS3JwT0V5QnFvOEt0NUI4aENiY0dPUDBVRnRKSXVmRFp2Uk5DK2gr?=
 =?utf-8?B?UWh5K3RlcjRGc3NTYVdaZkR4OHdWN0kxekdUMlc3WnlmTTViSVVsTGI2blhi?=
 =?utf-8?B?Uit1TGVCUUVqdDB2a0JqNUduODhuZTlKaDExYlRyWE9haVpZeDdrSFpSVWhN?=
 =?utf-8?B?NG5ERGpEcFBqNUsxNGZOZTNRNHlPd2hid0ZweVdFTVZCdXV6YkUwWXR0Qml5?=
 =?utf-8?B?RldLcE1uMitOL0IzWUdWYXdOZ1Q0dm1GYTMxR0hIdWRaZVE2ZTE5N0FwQTdm?=
 =?utf-8?Q?hWRFBd?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXSPRMB0053.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(19092799006)(52116014)(376014)(366016)(38350700014)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VDkxKzF5cnFKTUlCTldtaGY4U3RudXhmL3hGN0pPbStSbWJhOGVNK2xMdGti?=
 =?utf-8?B?YjhPekUrOGowVktXSnFScUUyS2djY2tvSURTNUlxaXpLekdXOGZDZGp3MHRu?=
 =?utf-8?B?NXNTQng4d3Z0UzNuSHhmUThUbStrQXhBdGhnQWhxT1hxK2RWVFdxWVJxTkVt?=
 =?utf-8?B?RWYzMHlhUDFITHZJbnAxS29TUHZ2U0JXSEYxWTZWcGdHRC9md1M4aEVJWnNw?=
 =?utf-8?B?aVMzTFZ5Ym1QcVRZbkM4VjFMMlZqb2JIODdFd05aWmRxTTdkMHh3bG90eVR3?=
 =?utf-8?B?K2czbzZ2UDVEVE1mR0w5cmZGWGJwbVdQdE8ybDVOMkVQMEpOWlNBaGNFelM1?=
 =?utf-8?B?cm9XUmZ1UkVGWTRlZzNNRE41Tms3WVQ5Z0xyTUlRN1BwdDE1aG9UcTkwQU8z?=
 =?utf-8?B?Z0F5SVRVa0I0V0pENU5oTHQrck4vSk8zbGUydXhYQ2JGMEJKZG1kbWF5NUEw?=
 =?utf-8?B?L0VXYlNJSndWUWNVeEVKOUowSGJGK2V0bDZJa3JuTUdNYms2dTlNZ2pXNDJC?=
 =?utf-8?B?eTZwNEpsMFd6R1NtMXREem9WOHIxa095WnJQalF6WHd1ZEFKWlBCQjBDR0kw?=
 =?utf-8?B?VHRBTXdlYnNtOWFvd2xRZmcwSDN5WHBBa3lwQVNRUDJ4V1RjVUs4UGl2ZWhx?=
 =?utf-8?B?d09XRWx6dmYzcEszakg2eWpnRExGWWpBaVQyRHlsUlA3cHBrTDNCN2huU2hq?=
 =?utf-8?B?K3FSRHZsS2s3Wlh0dzNHamdCMStENndOclQxdHF2dC9zNGtyTm1vSzF2YnN0?=
 =?utf-8?B?V0Fva2tPc2x1b052SjBjekh0TUFRNTgzanIwa0dqdTY3bUV2NE1IWENyZ2Zk?=
 =?utf-8?B?b1hmbXBiaXZZTnVSWGtMbVYzSkFXV1FoR1VJSTBBcERKTXVuWFBGK3ZWc1Mr?=
 =?utf-8?B?N3VJb1Z4bWIwZXdSVTNqVll0Y1Z0dWpyWU5TZnEzVUVGYmhRRnpwNEYrZ0tz?=
 =?utf-8?B?ZEtjSWlKUGZJS3dHR25OT0JlVHdwK3pmSVFlUkZFbVJtYy9IOUhiQUxXaEJR?=
 =?utf-8?B?ZFlIc1ZUTWIyK0ZjdUt5aHVObHByQWpRVHdUbG5GM3VwTElFcm1saFBEb2NK?=
 =?utf-8?B?TVBjZXVCdzU1WW5zV1c5ZUpYWk5RVm1Uc00yemJNVCtRWmZQWGRURXAzQzc3?=
 =?utf-8?B?dVpaUnpmeThWK3Z3QWw2c2sxWUEwUWE5VzFhUytmV0VGT2RyZSt1WXVMNXdP?=
 =?utf-8?B?NDl4Z05nenZYa0UySUVPTDRhdFdtclppNlRXQlNrTVd3dlJRak5YbkJUM0JJ?=
 =?utf-8?B?OTRlWmxBMVlqRjZEMUhxK1BDTGhHUHhDaWJrYWMyODdGbVh1MmtMVXpENHd4?=
 =?utf-8?B?ZDh2Ym8vUGZQcUN6YUFMb2lyL1ZYbW85NEI1ZW45dzZFdUV1a292VW5vK3FV?=
 =?utf-8?B?TGZIb2t4eEJXMUZEd3FSdVJBMGprQXBJaDIzMDVqaS9VUHdQeUV0RVBtMHhD?=
 =?utf-8?B?SmhtNFlXL05XYjdQdnNLdkdrd2I3L2pSbHpQYnQrTS9DRGF1cDZDV3BpbHRK?=
 =?utf-8?B?T3pBRU84TnZZU1BoWHVGUVNVOWk5d1RsclpnZkkrTTN6dEZNU0hMazNTMWF4?=
 =?utf-8?B?SUtGenkydUw3dVRqSFFsNDR1Uk1RZG9UOVNUcE9YZ0wyU1BZcC9oUFZMZENt?=
 =?utf-8?B?RVVWalVoQVdGWHhQeGxMc1ZwdXQwZWpFSXFVK3cyZU9NK0cvcjN5WjBZY0lL?=
 =?utf-8?B?dE9ZL1ZkeWNhVFhKdk40eXJUM1V0WWJrMHo0bk5CTEczbjlSTTlpN3pyYTQ2?=
 =?utf-8?B?Ui94N1gvd1lYRTAveVFKMjkrWHRtdGJ1c0hGZkg5WlNsOUdiNEF6bnl5Tndu?=
 =?utf-8?B?MHhScFVQandrNjRXcWFBYjFPd1hIVnJGKzFYVU1sSUZnejcwa1ZSNXdoUDFn?=
 =?utf-8?B?alV5KyttTE9LRUdnWHpicTFzc0dDS2dSRXBpMFNTSE1KUkRJWEJFZXJ2UjJv?=
 =?utf-8?B?L1R5Uk8yZmpvVDlQNHg2ZDV3ZHI5SEJta2k4R2FLTC9LdVNWanhPMU1UaG9X?=
 =?utf-8?B?MHp5TEViVzlRK2FBLy9lajZlYll0RmE5MWlHRFE1WGFHMXRWRUZNVnQ4SmZC?=
 =?utf-8?B?VW9UTHE4TjY0WUJQMFRGUmNQU2llMlNLMFJTSzlHbmk3QWFxeHFqMnhCZXFG?=
 =?utf-8?Q?Es5vINSCPB16B0pPqWmq0aPXR?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4066fe3d-75aa-4ac0-8884-08de0c2e301a
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 21:02:44.9758 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yoFfea79kkdgqPfQbMgoKYQZskWLiQuPA41R9Xj5v3wh7op632fMwYXr8NOno7ZoZwWBBiU+0kXWOYG8Kexhsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9052
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

On Wed, Oct 15, 2025 at 03:36:05PM -0500, Rob Herring wrote:
> On Wed, Oct 15, 2025 at 2:39 PM Frank Li <Frank.li@nxp.com> wrote:
> >
> > On Wed, Oct 15, 2025 at 12:47:40PM -0500, Rob Herring (Arm) wrote:
> > > Add a driver for Arm Ethos-U65/U85 NPUs. The Ethos-U NPU has a
> > > relatively simple interface with single command stream to describe
> > > buffers, operation settings, and network operations. It supports up to 8
> > > memory regions (though no h/w bounds on a region). The Ethos NPUs
> > > are designed to use an SRAM for scratch memory. Region 2 is reserved
> > > for SRAM (like the downstream driver stack and compiler). Userspace
> > > doesn't need access to the SRAM.
> > >
> > > The h/w has no MMU nor external IOMMU and is a DMA engine which can
> > > read and write anywhere in memory without h/w bounds checks. The user
> > > submitted command streams must be validated against the bounds of the
> > > GEM BOs. This is similar to the VC4 design which validates shaders.
> > >
> > > The job submit is based on the rocket driver for the Rockchip NPU
> > > utilizing the GPU scheduler. It is simpler as there's only 1 core rather
> > > than 3.
> > >
> > > Tested on i.MX93 platform (U65) and FVP (U85) with WIP Mesa Teflon
> > > support.
> > >
> > > Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> > > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > > ---
> >
> > How to test this driver?
>
> You need to add the DT node to i.MX93 .dts like the example, build the
> mesa ethosu branch, and then run tflite with it pointed to the mesa
> delegate.
>
> I can send an i.MX93 dts patch after this is merged.
>
> > > v4:
> > > - Use bulk clk API
> > > - Various whitespace fixes mostly due to ethos->ethosu rename
> > > - Drop error check on dma_set_mask_and_coherent()
> > > - Drop unnecessary pm_runtime_mark_last_busy() call
> > > - Move variable declarations out of switch (a riscv/clang build failure)
> > > - Use lowercase hex in all defines
> > > - Drop unused ethosu_device.coherent member
> > > - Add comments on all locks
> > >
> > ...
> > > diff --git a/drivers/accel/ethosu/ethosu_device.h b/drivers/accel/ethosu/ethosu_device.h
> > > new file mode 100644
> > > index 000000000000..69d610c5c2d7
> > > --- /dev/null
> > > +++ b/drivers/accel/ethosu/ethosu_device.h
> > > @@ -0,0 +1,190 @@
> > > +/* SPDX-License-Identifier: GPL-2.0-only or MIT */
> > > +/* Copyright 2025 Arm, Ltd. */
> > > +
> > > +#ifndef __ETHOSU_DEVICE_H__
> > > +#define __ETHOSU_DEVICE_H__
> > > +
> > > +#include <linux/types.h>
> > > +
> > > +#include <drm/drm_device.h>
> > > +#include <drm/gpu_scheduler.h>
> > > +
> > > +#include <drm/ethosu_accel.h>
> > > +
> > > +struct clk;
> > > +struct gen_pool;
> >
> > Supposed should include clk.h instead declear a struct.
>
> Headers should only use a forward declaration if that's all they need.
> It keeps the struct opaque for starters.
>
> > ...
> > > +
> > > +static int ethosu_open(struct drm_device *ddev, struct drm_file *file)
> > > +{
> > > +     int ret = 0;
> > > +     struct ethosu_file_priv *priv;
> > > +
> > > +     if (!try_module_get(THIS_MODULE))
> > > +             return -EINVAL;
> > > +
> > > +     priv = kzalloc(sizeof(*priv), GFP_KERNEL);
> > > +     if (!priv) {
> > > +             ret = -ENOMEM;
> > > +             goto err_put_mod;
> > > +     }
> > > +     priv->edev = to_ethosu_device(ddev);
> > > +
> > > +     ret = ethosu_job_open(priv);
> > > +     if (ret)
> > > +             goto err_free;
> > > +
> > > +     file->driver_priv = priv;
> >
> > slice simple.
> >
> > struct ethosu_file_priv __free(kfree) *priv = NULL;
> > ...
> > priv = kzalloc(sizeof(*priv), GFP_KERNEL);
>
> Linus has voiced his opinion that the above should not be done. It
> should be all one line *only*. But now we allow C99 declarations, so
> we can move it down. We can't get rid of the goto for module_put(), so
> it only marginally helps here.
>
> > ...
> >
> > file->driver_priv = no_free_ptr(priv);
> >
> >
> > > +     return 0;
> > > +
> > > +err_free:
> > > +     kfree(priv);
> > > +err_put_mod:
> > > +     module_put(THIS_MODULE);
> > > +     return ret;
> > > +}
> > > +
> > ...
> > > +
> > > +
> > > +static int ethosu_init(struct ethosu_device *ethosudev)
> > > +{
> > > +     int ret;
> > > +     u32 id, config;
> > > +
> > > +     ret = devm_pm_runtime_enable(ethosudev->base.dev);
> > > +     if (ret)
> > > +             return ret;
> > > +
> > > +     ret = pm_runtime_resume_and_get(ethosudev->base.dev);
> > > +     if (ret)
> > > +             return ret;
> > > +
> > > +     pm_runtime_set_autosuspend_delay(ethosudev->base.dev, 50);
> > > +     pm_runtime_use_autosuspend(ethosudev->base.dev);
> > > +
> > > +     /* If PM is disabled, we need to call ethosu_device_resume() manually. */
> > > +     if (!IS_ENABLED(CONFIG_PM)) {
> > > +             ret = ethosu_device_resume(ethosudev->base.dev);
> > > +             if (ret)
> > > +                     return ret;
> > > +     }
> >
> > I think it should call ethosu_device_resume() unconditional before
> > devm_pm_runtime_enable();
> >
> > ethosu_device_resume();
> > pm_runtime_set_active();
> > pm_runtime_set_autosuspend_delay(ethosudev->base.dev, 50);
> > devm_pm_runtime_enable();
>
> Why do you think this? Does this do a get?
>
> I don't think it is good to call the resume hook on our own, but we
> have no choice with !CONFIG_PM. With CONFIG_PM, we should only use the
> pm_runtime API.

Enable clock and do some init work at probe() is quite common. But I never
seen IS_ENABLED(CONFIG_PM) check. It is quite weird and not necessary to
check CONFIG_PM flags. The most CONFIG_PM is enabled, so the branch !CONFIG_PM
almost never tested.

probe()
{
	devm_clk_bulk_get_all_enabled();

	... did some init work

	pm_runtime_set_active();
	devm_pm_runtime_enable();

	...
	pm_runtime_put_autosuspend(ethosudev->base.dev);
}

ethosu_init() only is called by ethosu_probe(). with above pattern,
needn't check CONFIG_PM and call resume hook ethosu_device_resume();

Frank

>
> Rob
