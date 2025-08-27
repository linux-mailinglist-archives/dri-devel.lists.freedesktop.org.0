Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B47B378FF
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 06:19:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 947E310E082;
	Wed, 27 Aug 2025 04:19:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="X/oKPmmx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2071.outbound.protection.outlook.com [40.107.236.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9182710E082
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 04:19:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ha5yybTP1kFfzx+EN/DoD7s0cnsw3oJBoKojiYXruWuKdKmFpHE0Yeuv/GLpN3hAEJUTnL8TtzGoOadhHEyRCFobKHnSg5jR6GDhEdiw2rZtHVbC0rmiDJ46Cztaap4bwLZwUgcM9aONyY7rlEakN4Oz8rLvPjlK/zQDq6M3jz0C8kTzJ5agZEPhIMboGOjNaMdAzvohvz4MwuA5j6qWxTCPZOw+KmhOwMbCTK0kQOJnIYwAnKZt1wzjFTh7Id5ofWL8CyQ63q5LCwEf43KfjwiOYAtaqe/+aE/O6rRbnwhkbC3hbrROmq+L0MD91PotIGTTmGOp85lf1I+kOPILdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GfrWzV9L3lKJ9vbhHA3GQk8VZnKhYC4ujTnf2xTm+gg=;
 b=CdqdJGhd4reMLANC97Jb9N6TKxPtid/szx+MGxk7cKrNlubEhLr7mUZtI/eDmYWzYijY7OEnUuu8hmH9cySqTFlehVxftZ3zBSRIYELTXXYV0wJiRMCQzuDC/ZDK3Jp8tW3d77Vf7OT8AQdvvZwQ9rU75JvVNMwjJ4VytQcqoZin+aSjnhc8n2EfX+Ui4F27yO6i/rg1EQa3eUihR/xm3WpXQIoTvIfkQlHWCjp5viiTiWCA4aDUhlJYSmTtuxa+7U0jehrnZr3mKUEn6EUKCid3eUE8ccRhMZlQL7fzqd6p4C4DOl3HcpK9d+caFgRTyI28fRe9Db5gN3MhkWDENA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GfrWzV9L3lKJ9vbhHA3GQk8VZnKhYC4ujTnf2xTm+gg=;
 b=X/oKPmmx9DQnRRgvrP65h4SVzm+ZplURLqLaidYmuHpilJTQV261GdJ/cSr0Nl1/jI5HlbcFFTI12a5lq6KyD0jayTmw8A6l8BwnuqjSOpLxpRSGiJAK7kcKkT8UbrdJlJwF568HbhUZBK6hE9n8o4MNFTz90/tk9O5o60SgP7YKU1DdeHirlyaOnWiYyomP126NpxoprZTWH/Pjbaek4rRXm4FVtZyAsz6WUnzFpvqsgXPxV5ubxjmiGU2twMOV65W9/G4fVS0wwiFTLWAaNcc1+wmXclWK9Ngvcq/oGIHtXh4CSX+n3iyccsFTqKjSAd3K0rN94MYwNdIi2Ud5AA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB6494.namprd12.prod.outlook.com (2603:10b6:8:ba::19) by
 BY5PR12MB4050.namprd12.prod.outlook.com (2603:10b6:a03:207::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Wed, 27 Aug
 2025 04:19:43 +0000
Received: from DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11]) by DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11%6]) with mapi id 15.20.9052.019; Wed, 27 Aug 2025
 04:19:42 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Dmitry Osipenko <digetx@gmail.com>,
 Charan Pedumuru <charan.pedumuru@gmail.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-staging@lists.linux.dev
Subject: Re: [PATCH v1 02/19] dt-bindings: clock: tegra20: Add IDs for CSI PAD
 clocks
Date: Wed, 27 Aug 2025 13:19:39 +0900
Message-ID: <2451218.NG923GbCHz@senjougahara>
In-Reply-To: <20250819121631.84280-3-clamor95@gmail.com>
References: <20250819121631.84280-1-clamor95@gmail.com>
 <20250819121631.84280-3-clamor95@gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TYCP286CA0163.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:383::10) To DM4PR12MB6494.namprd12.prod.outlook.com
 (2603:10b6:8:ba::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6494:EE_|BY5PR12MB4050:EE_
X-MS-Office365-Filtering-Correlation-Id: 886e938b-ea68-404a-476d-08dde520f26c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|376014|366016|1800799024|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QU1Ydnhqdk5ya1B3cXZ5dHVIVUpmK1B1dWtkVFJpSGNNYUpnSjgyb1U5VXdj?=
 =?utf-8?B?ak52NGQzcjh1Ui94UmZVRktOT3lsWDEvK3RDOTFPMU51Q3drbW1Lc2RQcTg0?=
 =?utf-8?B?NHJGbVFtVWtOU2RvL1NsTElSd3AvZ0J0T243WHhiazB1ZFFSMmFRaFdYL2FI?=
 =?utf-8?B?U3c3OEFObG54Rld6N0Y2YS9iK3R4TVRpL2d5NmJrdHJSSVFuRkVXOWZTNjQv?=
 =?utf-8?B?TVI3Wm9xVi9XNmRzdGRVUTR2N3pad2dhL0U2dThQRVpZSzBKZytmcGNGUmZa?=
 =?utf-8?B?WnBkMU5zamhLbGxRVzFHQkhtNnFxbGVBMFJGbkpCUnJzNkltOXRIOENac3FE?=
 =?utf-8?B?WDlEeklmRmwwQjJxQ0pOY1c1N1JUaUNZMGxUdzY0cU9lSXh5SWt1RVI4QU9K?=
 =?utf-8?B?OE13YnBsVlJSemdjVmlSNFNNd1Z3TENndkdlVUxuSDZpT3NnVWxZTUFJWWov?=
 =?utf-8?B?TVo1V2xTMTZ3RllJKzVxVzFIZFEwMmlxcUo1T2lnUyswNFdhT0loOTArOGxy?=
 =?utf-8?B?M0Zqc2prN1JXSFYycWhwNXVXWXhCcXV6TFJqNjVQY0pxOEl0YzNiaGgzOTJr?=
 =?utf-8?B?eGdVMGxQWlJ1NzRudE1JazRybW1RZVBQS2d0Y2V2aXFOVEZicnMzcEhMajQ4?=
 =?utf-8?B?YkpSUU1mUVY4UTdtWGdLSFZTWlNIYnpEMGh2cnNtTHB3bEZCVVpmK29NTXp3?=
 =?utf-8?B?NnpQRDdVeXZhMklzOE1UTGZCZHErR29uNmR4dk5TK2JiT1p1ZkpCZ1A2eEQ2?=
 =?utf-8?B?RzNNdFZZRVJPbzVsYlpNb1FvWG1iZ1pQM3pndTFEakJkU0NXaUpCNWQ4dGsy?=
 =?utf-8?B?MXR4M1ZjdDlseTNuUW4rVElMcC9rQVJSREFYWGkwUW9TVXVFS0R2SHIzUTRk?=
 =?utf-8?B?cmlYNkN6K1N2a3RqN1VwM1ZZemlNM1FST0dXcThGYVVuaXEvampPS2srOVFU?=
 =?utf-8?B?UzJqMEVlNkNhNnVzVlk2KzBBeWxNUnUvWWNBTkIzWlBxRXczWitjbnlqRW1J?=
 =?utf-8?B?eDZ5VnZWU09PcHg5L1hjSTR1eFlxR2lXNTliWFVZZlRDK243Tm9rVTBGOThj?=
 =?utf-8?B?MWJmM2t1RS9MTGVzbzJQZ2ZVLzd5NHJkT3BFbHd0bjY3UTlIVjI3dEUvMy8w?=
 =?utf-8?B?NUVKaGJUaGVRZXBhZHNXWUlURS91K1E0dU9FRnYzalJKSWk2WTdWUEp0S21J?=
 =?utf-8?B?aFN0QTg3aEwxUlk2ejl3YzhHQVNGZWN0WFl0YktodC9qQWJiVmFLbVA5RFhH?=
 =?utf-8?B?Mjl5VGhBNThUUVdHQXB4VG1xdTZGbUdIZnNyeUFtN3dsbjU0b2xCMFhpdmtM?=
 =?utf-8?B?WnJMSm5DZHU1RUV6RlR6TS8rRy8vS0pPV3l4VG9uQVJHUDM4K2tCdWhMQTRB?=
 =?utf-8?B?OFdMNDZkQzNRME9QWU1VMklmWnNQQ3BiZ1BySmdzQnN4Tkk1NVpUbGI5SUVE?=
 =?utf-8?B?UWFBeFFCSHVGa3pvdmJzbjZZLzdQTHh0Q1QraytNS2pWU1lzU2lubUs3K3Vj?=
 =?utf-8?B?STVzbkVOeWRKWDdDSnFGZjJSckRMSFFzTkRoME51OS9GVm4yNi8zb0V4Vzd3?=
 =?utf-8?B?ajZCQndBV1RNbGw2eTJSRlJERlpzWXQ2LzdJbnRCSnpUV3BzTXBuQ3VrMXRm?=
 =?utf-8?B?VkR4cGU4RjdJWm5vc1V4STh3WlEvbHhZTlBqNjUzaVpURlJyWVlwOUcra01T?=
 =?utf-8?B?bGhKQ0x3V3RZaW13REdVbk1kNnlqWURGNFRFYVRzTDV4S2xVZ2FmYUJsUzNa?=
 =?utf-8?B?Z1hVclg3U1k0OThBb2lYZ3YyMkh3U3g4cDJVeHhJSExSME5sVlZzcmw0WHRm?=
 =?utf-8?B?akxxUmgvZFV4Q3NXYjR4cFY4bGpJdGxpMy9pbGNFbEdMdTRDOW96cUhualRa?=
 =?utf-8?B?WlNIbzVGU2VIczJKdyt2L0w5ZTE0V3RuRXYzV1N4Q2xPUmRieXg5b0ZhRWFO?=
 =?utf-8?B?Wk1oYXBYODJXankybHAyYi9KcGl5UGtXanlyT290NU9VRkF2T3F4L01jeTlF?=
 =?utf-8?B?a3NaWDB2TExnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6494.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(376014)(366016)(1800799024)(7416014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UVdFcTVqSlk1RDdZUHFhOGJUZ0lZdEtXbHA4SEtNZ3FVZ2tmZU10TXBaKy9m?=
 =?utf-8?B?alEyZ3hsbEJTVHZBUElzVUJLSU91SWpTb2s5a1YwSEV2a2xYVXBDay9wbWgv?=
 =?utf-8?B?WGJBc21jc1ZqUTNaa3R2aEVHa205WFF4MWlqeWduamRDeXhlMVBvdmhpckto?=
 =?utf-8?B?VTRxanlLNFFVejB6ZTNJdm4ySGhqRmxIN1IwejlyMSt5TTNodWRXRW5MQ2U3?=
 =?utf-8?B?dXZqdXFmMzVtN0RVNlZWamJ0SGtEUE1OVWcwYXVLMzFNVEFaR1pkVDRGQWhC?=
 =?utf-8?B?VG54MnEyeG1hUHpvc2lRZGJLMkhmeFZ1WW1JMXNDNzkzUDJJalBPSzFaRFFo?=
 =?utf-8?B?UUhhRENWcC84c2pVL0hWVUNCSTNDeGxrcGVBNHhDSFZXMDk4RlMweEZaVnEy?=
 =?utf-8?B?K3FZL3JWNkFTcnhQVGxOR3ZhTVltbG1zQU1UZnQrR2JjTUJUV1NUaHpPTEZw?=
 =?utf-8?B?L0RlYkdQbjlNZHdtaWtuWUY0Y1ZaQXNCU2IvUzNuRU8xYXpNQjFNWFVmSnRz?=
 =?utf-8?B?aHFjcXVDa3B4RjJueHRTanlISENOZ3RnMW9vbTNtMXF6V0FqcXJpRWxWRnVa?=
 =?utf-8?B?Wm5aSjZZVEZXNTJUS05raE1Nbm9FMWZVYmZXemZxVzZadVQxNHdmdVpDM0Ns?=
 =?utf-8?B?cGRTRmJOZ0hWZDhOYWdQMThJZEx6bHNrd1dWVzBQanltd0F3WGJ1QzIyWXp6?=
 =?utf-8?B?bWRSaGVlbGRuWEttMmNmbnArWWtHcGo1Q01aTXJYcWFGdjJrUjJvY0x0TmtS?=
 =?utf-8?B?MHlsc09idzlqTHljNTRERzM3THF2VmwvOE5YY0lRM05MN0xqWE9rOVFaaXF4?=
 =?utf-8?B?L291eGhOanhERXNkdVl3eFM0bUJCTmVNT3J0Smo3bDNOM2xuY05Jamc1Sndo?=
 =?utf-8?B?Q2tYMlRnVWRUWWlESmpzNG4vU2RoUnorOW8xVldaWFpkMWM0dGFoenJxNkNX?=
 =?utf-8?B?U1FEdFp3b0ZuQkVtYWt4TG52NGRVMDArSDRiM3lZSHF6VnBxM29zRDViNGcx?=
 =?utf-8?B?M3BSa2ppbjFaNXhLMW5qa0phbXVqN3A3b24ybXQ2QUgzRytVKzJjMXVhUWJJ?=
 =?utf-8?B?bVVrRXREYVJRa0p5bGo4Z2FiaWJCMldoQkNYekVySEwwN2VURCtvWG91cXd1?=
 =?utf-8?B?VDlac3NoVFpPWTQybFNDS2NYQ0lJd1VoTTVnREFSNzRKQnE4WUtzUTdsRmFC?=
 =?utf-8?B?YnVYQnExdjkvWVNvclJqMVNWWk1lbmVqVTRTLzJmaU8rOUVBYzZnZnY0SGQr?=
 =?utf-8?B?dGxCNVJDOU5tcTVkVjNGcXh6Y3NYa3pUSmdBSldyNUJvY1pFNFBjd3pybnZB?=
 =?utf-8?B?NnhqaVhsMi9qZHN6aFJ6RXB0VlNBS2haT1NIU1V6NFF2Qk1oUGJQcUs5YXg1?=
 =?utf-8?B?YUNHb1grcFdUcDRGWHprMUJFa0tGKzQwTlhzNTdwZ2o3dmI4QThmaVZwTXcy?=
 =?utf-8?B?eW5nRzRDa3BJNlRnMmh1N1NtNTFsNlJFendicjJnZGhmNXZWVDBCbmxTelBl?=
 =?utf-8?B?QnN4Y1RHOU12QUFqUDBBcFVBQTVMMXpGUFd5cU9VbllkL3hKdjZKUkY5aU5M?=
 =?utf-8?B?cElXZFFwTi9VajBzWVc5UFNDNFdsM1NzT2JMNVZwc3hwYVVWRWtmY1VKQlA1?=
 =?utf-8?B?by92ejZEelY1RzFickp4TzFzcExNVWg0aFVOb0hxclNPWjN3UmlUTmkyV0dw?=
 =?utf-8?B?ZnJZaEpTRFpxR1Y0RTFZZnNQTWdlb2F5VGdGZnY4QnRTbk1JZE9IRnVldkxV?=
 =?utf-8?B?ZlBOaVhneUFJaUErNWNZVm5Ma1FJcWZOYW9GcDhBdElRWWpyRjNnOEh6cWRP?=
 =?utf-8?B?WGRiZUFnUVJEejM1d0FDQ3FMajFwd2FEZ1dvYzJBUXdId2QvKytWYU9uRExl?=
 =?utf-8?B?NXgvYTZRZU4xcVZHRi9uTFlQUGI1MlJZSHdmWVlYQ3F0dVpqOHI4MTFoL0xO?=
 =?utf-8?B?MkdJM0lHSTkrR2MrVGxpZm1iYlVQNDhxOFNoS2JpczNaelkrWmJPblh1L0FI?=
 =?utf-8?B?Rk1TRCsxVEhWMk9vRllIK0Zpb2s3S2MyczJjS2RBbTEwREdIWmoyejNXbXhJ?=
 =?utf-8?B?aWlmbFkwVTBURHcrU3ovYVJyd0hjSHFRQU9MN2x6RmFXazV0ZUVEUVVYNXFw?=
 =?utf-8?B?S2s5Ni90M1ROaXVleENnekY0QUpBWkRsZGNQcDV2YVBaaWtqRHNyYlFTcmh3?=
 =?utf-8?B?aFZxcy9PSm5XRVFncXFZSy9ndzFmb1d4aGU4Um9XcWF3ZkJuN09kWWcxd0xs?=
 =?utf-8?B?RFl0REw0c0R6SHZwSlJVQnVob21RPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 886e938b-ea68-404a-476d-08dde520f26c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6494.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 04:19:42.7940 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IqJPIewV9aCFjj+droLTEFxlpsSKchL2XgCmf++F7nUpcDG9IZaNgZPXQov7+iORkpEhxh5BWdVJTLAh7gnzMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4050
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

On Tuesday, August 19, 2025 9:16=E2=80=AFPM Svyatoslav Ryhel wrote:
> Tegra30 has CSI PAD clock enable bits embedded into PLLD/PLLD2 registers.
> Add ids for these clocks.
>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  include/dt-bindings/clock/tegra30-car.h | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/include/dt-bindings/clock/tegra30-car.h
> b/include/dt-bindings/clock/tegra30-car.h index f193663e6f28..14b83e90a0f=
c
> 100644
> --- a/include/dt-bindings/clock/tegra30-car.h
> +++ b/include/dt-bindings/clock/tegra30-car.h
> @@ -271,6 +271,8 @@
>  #define TEGRA30_CLK_AUDIO3_MUX 306
>  #define TEGRA30_CLK_AUDIO4_MUX 307
>  #define TEGRA30_CLK_SPDIF_MUX 308
> -#define TEGRA30_CLK_CLK_MAX 309
> +#define TEGRA30_CLK_CSIA_PAD 309
> +#define TEGRA30_CLK_CSIB_PAD 310
> +#define TEGRA30_CLK_CLK_MAX 311
>=20
>  #endif	/* _DT_BINDINGS_CLOCK_TEGRA30_CAR_H */

The commit message refers to tegra20, but contents are tegra30.

Regarding the CLK_MAX define, I agree that it would be better to get rid of=
=20
it. Perhaps you can check if it would be reasonable to calculate it=20
dynamically in the driver, but a define and sanity check in the driver woul=
d=20
work too, I think.

Cheers,
Mikko


