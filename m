Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7AEB49BCE
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 23:25:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E209810E5DF;
	Mon,  8 Sep 2025 21:25:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="HVf7xM0J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2041.outbound.protection.outlook.com [40.107.92.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E766510E5DF;
 Mon,  8 Sep 2025 21:24:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bcwf8o9gHgIER899Zr61YjLRcxgcrY7ujPNW/o3zVV+XpNW2bLrA3N9aZGHzodEPXbdxUiX95RRJUjwhDZ0n45lVoqAQ+cYA2xN8QCuVNuOAQqBR09TmFrcO4lkXD1j7NCI8+GMyMDOsKs7P2mxT52EpDp79fFckeCfWa6h5O+XXokVwA8ph/sP/zqmvFTZ15UIi+sFWYGBmCkW2poplxAIJMMAwWCGVMypJ6/K3JVJtjxIXtPekPpiDseSoZvNGy/Ju+h3D+j6z6n/sn0PIm3j+yiPAhcAYE254U/OrL4MlK/qfuSjHbFFxOWiIkuGkQXg0UMy4+3OGgpydX5TKlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tYccAM5ba/lkZIT5MZNL8/Onyhe6ak8JnThCGtoKuW0=;
 b=E+A9FVIjLmV6GsCTdiKZuFjHvoQqDct4TpeVWWyOkfIeKCPPaVwaBCBJMb7CTimx9aajYLiic2ps8uqlRl5GWTGXf29l/x6NCDMT1rggrh6RlotZRugnT/9i+ihOdCwx6QQ4xvkVvgjDEPTxpTFq1Hjz05I9tm7UN8rvE9IKcsXhRzjLju+rcOBWcwsbGhNrARfqeCNWi+yLMAvW+F0oSWKMEIxFEA1b2FA9HahsxxY3mKdjmK1fbKfmBaaELdCrigFdaGt+ZrROlK4yWzb6RLQeHwMu5HHXsoSFTwx2HkSX5p0sioM9AomYHdpzZ328yJYa23Ggok13omHz6xWl2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tYccAM5ba/lkZIT5MZNL8/Onyhe6ak8JnThCGtoKuW0=;
 b=HVf7xM0J6rFVJDcvoDREZGU7ZSPLik3UAMsG1QM5Xcr3LiwxZ3DT1OXbxLvlLYT5+lqMLlvYtJOZg1iGEoO6GzTLVyHsh3UrRF50nc7f6EFL7RYNWC8WKdrypAbJzkuiYr3eqSZPM/jdB9Cst1rJgs9k7EYZWJw6596QwgcGYUN40zXw9smysB3FC/2rbsgVg5XNUydj5RIjH5QIN5zpKwZgbrY2eMBYn1PV7cJdWW51gfNnCZWV+mQuS2WThyagctPDXheFamv5hMgCmg0+zvZ8NGYF37Uq1bHeM0Ow1hCE1algluAdxmvP9J0AU1QuATPeMno/g7kBF0NzHtAQAA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7SPRMB0080.namprd12.prod.outlook.com (2603:10b6:510:271::6)
 by CH3PR12MB8283.namprd12.prod.outlook.com (2603:10b6:610:12a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Mon, 8 Sep
 2025 21:24:53 +0000
Received: from PH7SPRMB0080.namprd12.prod.outlook.com
 ([fe80::b6c2:2d58:b9c4:8a3a]) by PH7SPRMB0080.namprd12.prod.outlook.com
 ([fe80::b6c2:2d58:b9c4:8a3a%2]) with mapi id 15.20.9094.021; Mon, 8 Sep 2025
 21:24:53 +0000
Date: Mon, 8 Sep 2025 17:24:51 -0400
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dakr@kernel.org, acourbot@nvidia.com, Alistair Popple <apopple@nvidia.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 bjorn3_gh@protonmail.com, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 joel@joelfernandes.org, Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 4/4] rust: Move register and bitstruct macros out of
 Nova
Message-ID: <20250908212451.GA3923672@joelbox2>
References: <20250903215428.1296517-1-joelagnelf@nvidia.com>
 <20250903215428.1296517-5-joelagnelf@nvidia.com>
 <CANiq72mx7NA1KD5fw98kba+3oENHW44QXVGO1VmvPPUKin2LPg@mail.gmail.com>
 <a2c990ff-e05c-4d09-aaeb-5a2fc16ecb77@nvidia.com>
 <CANiq72=S-HnREWAK+8kcJkPabPHSzuKD4k7251+Zw-b9==0-zA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72=S-HnREWAK+8kcJkPabPHSzuKD4k7251+Zw-b9==0-zA@mail.gmail.com>
X-ClientProxiedBy: BN0PR03CA0022.namprd03.prod.outlook.com
 (2603:10b6:408:e6::27) To PH7SPRMB0080.namprd12.prod.outlook.com
 (2603:10b6:510:271::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7SPRMB0080:EE_|CH3PR12MB8283:EE_
X-MS-Office365-Filtering-Correlation-Id: 55321acf-daaf-4ac9-ce62-08ddef1e2683
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bGJHSnhCcG9UdkJFa25iVWhkRUsvWXRhaVcxWDNuSm1yNy9KTE1LdUpxLzFZ?=
 =?utf-8?B?L1lndWo1ZUZxTDhSZEhoMW80N25SamYxb2p0VjhqRDl1cTUvaTZtTTZPVW5F?=
 =?utf-8?B?UkhHN0NZSWJydDJMaUNERFNQU1RJWDVxNWh5MjBHQm9ncnQvT25DS1N4K2hD?=
 =?utf-8?B?UE94dUcwZVJpSS9LUGhWSGhUQWVuOTlrMVRSYXgzRVZMek0rNWJBRE8vbFhW?=
 =?utf-8?B?UTRuNjBIQ2hJYjVsT251SWQ2bW9PK2dtTHRPT0lNREl0ZW93TUZNM1pKUHZH?=
 =?utf-8?B?aW85ZnorblBaVFM5MDFxMXBHUU1mWTRhdTVsVStjQS9EUjVsZHRjK0NLakhy?=
 =?utf-8?B?NFh2bGg1YmQva2t4YVBhVDdncjhadnVyUDhHdmRFTW5WU2Z4MHZTOXhRZGdX?=
 =?utf-8?B?UDh4M3JwZmFmMkMraVZpMFVYSDRJdmRxN3JzK09NcStrNXVLWVZpQmcvc1F5?=
 =?utf-8?B?MUc1MnMzOGF5YkcxNGFncGpxRWQzd0ZNWkU5a2o4MnZOb3p4S1dXekxXNHAw?=
 =?utf-8?B?NEVsNHhCSlFlUXgvbW54ejZVazlyQUdtY0VhWW01V0V4dkhsVURoblpIZEhN?=
 =?utf-8?B?cXRrNGNyTXc4NWR3WTVMU0NVVDUzR0ZVZmZENjlCMU45OS8rOTJQa05rcEk3?=
 =?utf-8?B?amdCQUt3ZUdiV3hTU1ZoNEY4QWNBRjFleWpZWXM4QUhpZTY4NHF5MDFydE9F?=
 =?utf-8?B?dUlBQ2R4OUdHWlZpS0hUbnpJNXBESEJCTE5WWkNJYXB1RW5zNlIyeHF4K21N?=
 =?utf-8?B?Y3ZWYk5VNkpnaUhrT3JhQ1czd0JySkJMZk1BcGVMbnRHUEI1cDdNNkcxRDgz?=
 =?utf-8?B?aWxUVjZUVGJNVjQ2WjFFSDd1UXprQUpiY3NwUVQrS0E3YW5LSVZGOFEzRTVL?=
 =?utf-8?B?S3pHOExnRVBzcjg4c0VoVlgvdFc0OEdaU3BvaHArUU9ydWVQd0RaVlUvSXUv?=
 =?utf-8?B?dCtSNWtQYklEb3dtZDMydHZ3amZ5VFNsTUZmTkNoamJVQjQ4K1hEVnpuWFBz?=
 =?utf-8?B?by9JZkM5QXJ3MWt5clo5SnpVOHhpcVVjNEpkQmRLS0M5Tk1zemRLOVhXL0dV?=
 =?utf-8?B?YWNESXd0dGNkUFZ2aWVnQUdvM2ZEclhqT0FBcHpweCtiS0lxV2d3N1ZHdHdU?=
 =?utf-8?B?dWVrVG13VDJrVDB3YS94aVZ0aGFVSnprWU1kYjlVSFB6WFY0RmRJUEIrc2po?=
 =?utf-8?B?ak9VV2RBZmJDOGZRbXNKMmRQd21pNTFnWU5QVVc2amRsWTZqeHRLQjZGbDhq?=
 =?utf-8?B?dGtyNklPdnNZTGh6cDMvTmgrb2ovYmFZVTJ2THYxdU5OeUpERlpzZExtSmFv?=
 =?utf-8?B?ZlFJSjFBenBEZnlsMUpXNVJ3aFRJd0pXd1VzVmpRWHAvOGFjbGpuRW9ZSnpK?=
 =?utf-8?B?SnNWdGdqSzQ1bXd6NWUySTEwRDlWWFlnYUI0ZnQ3a2lBVi9jMm5mME0vYk5s?=
 =?utf-8?B?TDJmQ1A2ZmVJUnN3Mk1qM2Z0R0k3WVl1cVZ0clM0eWpTaXBYR0xlUTNKNExq?=
 =?utf-8?B?R0tpcDI3RFpESmcrN2t3ZmtXZGwxVUdwMTVYUmd3NHV2TUlpUTZ1WVhlNHBK?=
 =?utf-8?B?MmtZYXF3NnRDSXZSMjJBVDNhWTlFdWFGazcyMVNSVWVEWjEwcGgyWUEvWTk0?=
 =?utf-8?B?c0xiUzcyU0FTMGkvZ2gyQXhIWDErUVI5U2lReHBreXRtblZEKzdLekxhenY0?=
 =?utf-8?B?emNocnlIUXdJcytNTHIwYXA2RWExY2VOeEgxMndxeXpRZ1hWTEtuTEJURVp5?=
 =?utf-8?B?a3ZGeUNJbUhtSmUwZ1MwbTVJSGFiRDRBdEVyVUpiVkNIeU5vakpMMjdxenhD?=
 =?utf-8?B?YnAvbm1HSGRDOGZWZVJ2cFpnV2JJczYxK21JSWlaaDVoVlBJL3pueXFEb3BR?=
 =?utf-8?B?QWNvNlJLZ29laGhjT2dMSEVmbk5SK2JrS2toVTBVWjFGcjJHOEF2OTIyTkFN?=
 =?utf-8?Q?Fig7mIdXOks=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7SPRMB0080.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SmFZeGxxdUEwcWl0aVV1ZUFIT1Y0VEN6U1YxMUdtbVVPVzZza2o5ZlhjVUw0?=
 =?utf-8?B?Nll1U1B2K3ArMElVU2tjQlpoNTVJcjcxL21aQUJWNStnL0drZmhkS25WK0Nz?=
 =?utf-8?B?ckVNMWFheHV6MzJvTEwzOVBjbFRQN24wY1h3TUl6WkdTVUliSHlNbmZiV3Ju?=
 =?utf-8?B?TG4vOU5iaXZGTy9BWTBMYkg2ZExYVm1DUDdxU20xY2pCeE9jSWNseE1qUlJR?=
 =?utf-8?B?ODhsRVFVeE55QU5kcEdLQU4yYzRDNU5JdXIrNnhZU3ArRWU0T1N4d04wdEU4?=
 =?utf-8?B?RkxSSEJMeVJaaXU2eVJpemRpM1BhdG1VdThPdVB4R3RHaHRTYzUydUNYbmVO?=
 =?utf-8?B?aTRmUFJDYnhYL3ErcGU5UjBhNzE5ZEE2ZmlaREIvblNTK3lEL29ZMXRwQ0x5?=
 =?utf-8?B?K0MyYjg4RFJOMTVjZ1V3VzBDek1jU3ZydG91SzRZcGVwaklkTWhhZEg0TFdM?=
 =?utf-8?B?NWJ5R0tlY1BZb0JGUk84ZFk5UlZleVRkYWo2dzBuUng2bHJHVDYrWkEyM1lL?=
 =?utf-8?B?TWF5YXZieTdURkpKcTdmbGVZd2NPTEpudWVaRERTVitVTmlxQ2k1c0QvM3RK?=
 =?utf-8?B?UHNwQmpqRUVheFZsKys5S1VRekZ2Y0t5c093eVJQaTJYRXJsOWNmMzJCWjJZ?=
 =?utf-8?B?Y0JZUDdvbnJNcFhrYWo5d20wNThQR3c2WkZiaHFVSUgxMFljT3dQb0Y5MStr?=
 =?utf-8?B?aFBPZlNCRno5QktwQjJCUHlrUWRjdHRWN1hYRUcyd3pTbFE1R2IxMExzZ2ND?=
 =?utf-8?B?Yzc5VU9EYUVLWW1HUGIvVkg0eGU0azQ2Mm5ONUlSeTNDcW9yNEx6YzB1Q0FF?=
 =?utf-8?B?OU44L0R1UHRsTU9LdVNibEVYMGJ3UUI1anJaOFlNT3Z3YlhtTUFFbTJYL2VI?=
 =?utf-8?B?RjNQWDR3V1FFaVZIaDYyVEZnSmF3amYweUd1SFdxbmRJNDN5elVyRlRCdjUr?=
 =?utf-8?B?b21ZdjdCTXVTbE5BeWFRdFlrQlN4b1NNclVpcjdqT3Y5WEpKMGZhSzhlaVJw?=
 =?utf-8?B?R3RScG1CREYxRU9IYWJtNjByT043a2U2ZEdENm1ObkE3VGVoYm9QQy81ZXpG?=
 =?utf-8?B?cWp2TnM3UnBobXBwUTFOTjBVdEhUSzM0MGRsaGlIWXNOaHJ4SUhyMHhSa0Vl?=
 =?utf-8?B?ZkYzcUg3N3VMbHA2RU1uUFdVOG5SN2ZXYVBWZ0Z5Z2ZRWDlLU28xWW9GUTFI?=
 =?utf-8?B?S0kwU2ZmMHFrbUxLeVg0YjJJQXd4K0FDWFZkVkZCYUlqbXI2NnkwMUIzS0xH?=
 =?utf-8?B?MzM4UmRralk1QWd0QUhCVGtjMVVRWTNuT1BMMzUveXU5bE9ZRVVIN1BEUG9s?=
 =?utf-8?B?cFBqSFlUSU83Z0RJVXV6WjE4OTgzWFlFVnpzUGljMWNxdTZrZGErY25sa2hK?=
 =?utf-8?B?WGdzZEY1dTN5TmFTeTdmWThnZ3Q0MGpCVlMwNGpCZkg0a3pwSW5HeTBpbTVN?=
 =?utf-8?B?UU1VbTc5clJzWHphMWowSEw4aWROYnB3V0FZaEsxTmFLQmJJSElPbVlaZVBz?=
 =?utf-8?B?OXhPTDRxTjFOa0Y4V0hNSEtKS2VvOC84SDhkNlNOSE9NQ3dRVVpTeThNakVI?=
 =?utf-8?B?TXgrVDZBbGlTZ1dscVhCUFAvQ1BvalFCdmkwWUU3TnBhbnREVlZaamNEN29B?=
 =?utf-8?B?dzIyWG9sWVRWd3E4dDVrd1FHSDRJbVNCYzVCY09pT21uQ0RWTmR4a1VNZlo3?=
 =?utf-8?B?NTc3QTFCcVpsaXk4dUdCYzZhTHdXZFhmdjQwVTdUclEyMWtCQURQdTVRYVpS?=
 =?utf-8?B?UXgyUzVieVpGa21VWGxQK290aHJqU1dNK2psZlV4bzBZOHYvcUVEbzhaeFQz?=
 =?utf-8?B?TnhFQXlJWU02VEtjWkg3dmhrZzAwTFRHMXpwSmt6SERNMjNjOENKMmM2UGJ5?=
 =?utf-8?B?V3dkWVREczQ4V3NSMytDSkhYUkZwUFA2MXc4b1h1dXQzdEdyTDkwb2lNMjdC?=
 =?utf-8?B?eEdJODhrL0ZGMjVUYSsxVUZFdDF3YkNtNUZpMnFlVzJnNGNRZy9LaEl4OEEv?=
 =?utf-8?B?eXE4U3I2WTkwRFlUb0oyMW5YaHlXaVZBQXZlc2pMaThBZUFYUHlHQUtsS3ll?=
 =?utf-8?B?eDBRRGxlSzQ3MHVIdWdHUERwUmY1VkJuTUFJTnM5MHhPQmRPWWx1dVJ6V0sx?=
 =?utf-8?Q?8Zx18gRajcHSSW5UbPaIP8w93?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55321acf-daaf-4ac9-ce62-08ddef1e2683
X-MS-Exchange-CrossTenant-AuthSource: PH7SPRMB0080.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 21:24:53.2528 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IfS+7fcXK137Q9m/0DvIneCI9E9XGqUjgALKeqjcIO+YRmOKFfSAqoWDHlLm8eP7qKruGRPrknUOkxy3gQd8vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8283
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

On Mon, Sep 08, 2025 at 08:39:19PM +0200, Miguel Ojeda wrote:
> On Mon, Sep 8, 2025 at 7:06 PM Joel Fernandes <joelagnelf@nvidia.com> wrote:
> >
> > The issue I ran into is, without adding it to prelude, the users of register!
> > macro will have to import both bitfield! and register! macros explictly, even
> > though they're only using register!. I tried to make it work without adding to
> > prelude, but couldn't:
> >
> >   use kernel::{bitfield, register};
> >
> > Also not adding it to prelude, means register! macro has to invoke bitfield with
> > $crate prefixed  ($crate::bitfield).
> 
> I am not sure I follow -- macros should use qualified paths in general
> so that they assume as little as possible from the calling
> environment.

It works! Can you look if the below looks good to you now? No more prelude. Thanks!

---8<----

From: Joel Fernandes <joelagnelf@nvidia.com>
Subject: [PATCH] rust: Move register and bitfield macros out of Nova

Out of broad need for these macros in Rust, move them out. Several folks
have shown interest (Nova, Tyr GPU drivers).

bitfield moved into bits modules - defines bitfields in Rust structs similar to C.
register moved into io module - defines hardware registers and accessors.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs               |  2 +-
 drivers/gpu/nova-core/falcon/gsp.rs           |  3 +-
 drivers/gpu/nova-core/falcon/sec2.rs          |  2 +-
 drivers/gpu/nova-core/nova_core.rs            |  3 --
 drivers/gpu/nova-core/regs.rs                 |  6 +--
 rust/kernel/bits.rs                           |  2 +
 .../kernel/bits}/bitfield.rs                  | 27 ++++++-----
 rust/kernel/io.rs                             |  1 +
 .../macros.rs => rust/kernel/io/register.rs   | 48 ++++++++++---------
 9 files changed, 50 insertions(+), 44 deletions(-)
 rename {drivers/gpu/nova-core => rust/kernel/bits}/bitfield.rs (90%)
 rename drivers/gpu/nova-core/regs/macros.rs => rust/kernel/io/register.rs (93%)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 938f25b556a8..c69bc2adb33c 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -7,6 +7,7 @@
 use kernel::device;
 use kernel::dma::DmaAddress;
 use kernel::prelude::*;
+use kernel::io::register::RegisterBase;
 use kernel::sync::aref::ARef;
 use kernel::time::Delta;
 
@@ -14,7 +15,6 @@
 use crate::driver::Bar0;
 use crate::gpu::Chipset;
 use crate::regs;
-use crate::regs::macros::RegisterBase;
 use crate::util;
 
 pub(crate) mod gsp;
diff --git a/drivers/gpu/nova-core/falcon/gsp.rs b/drivers/gpu/nova-core/falcon/gsp.rs
index c9ab375fd8a1..f315344b4256 100644
--- a/drivers/gpu/nova-core/falcon/gsp.rs
+++ b/drivers/gpu/nova-core/falcon/gsp.rs
@@ -1,12 +1,13 @@
 // SPDX-License-Identifier: GPL-2.0
 
 use kernel::prelude::*;
+use kernel::io::register::RegisterBase;
 use kernel::time::Delta;
 
 use crate::{
     driver::Bar0,
     falcon::{Falcon, FalconEngine, PFalcon2Base, PFalconBase},
-    regs::{self, macros::RegisterBase},
+    regs,
     util::wait_on,
 };
 
diff --git a/drivers/gpu/nova-core/falcon/sec2.rs b/drivers/gpu/nova-core/falcon/sec2.rs
index 815786c8480d..81717868a8a8 100644
--- a/drivers/gpu/nova-core/falcon/sec2.rs
+++ b/drivers/gpu/nova-core/falcon/sec2.rs
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 
 use crate::falcon::{FalconEngine, PFalcon2Base, PFalconBase};
-use crate::regs::macros::RegisterBase;
+use kernel::io::register::RegisterBase;
 
 /// Type specifying the `Sec2` falcon engine. Cannot be instantiated.
 pub(crate) struct Sec2(());
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index eaba6ad22f7a..4dbc7e5daae3 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -2,9 +2,6 @@
 
 //! Nova Core GPU Driver
 
-#[macro_use]
-mod bitfield;
-
 mod dma;
 mod driver;
 mod falcon;
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index c214f8056d6e..07533eb6f64e 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -4,15 +4,13 @@
 // but are mapped to types.
 #![allow(non_camel_case_types)]
 
-#[macro_use]
-pub(crate) mod macros;
-
 use crate::falcon::{
     DmaTrfCmdSize, FalconCoreRev, FalconCoreRevSubversion, FalconFbifMemType, FalconFbifTarget,
     FalconModSelAlgo, FalconSecurityModel, PFalcon2Base, PFalconBase, PeregrineCoreSelect,
 };
 use crate::gpu::{Architecture, Chipset};
 use kernel::prelude::*;
+use kernel::register;
 
 // PMC
 
@@ -352,6 +350,7 @@ pub(crate) fn mem_scrubbing_done(self) -> bool {
 
 pub(crate) mod gm107 {
     // FUSE
+    use kernel::register;
 
     register!(NV_FUSE_STATUS_OPT_DISPLAY @ 0x00021c04 {
         0:0     display_disabled as bool;
@@ -360,6 +359,7 @@ pub(crate) mod gm107 {
 
 pub(crate) mod ga100 {
     // FUSE
+    use kernel::register;
 
     register!(NV_FUSE_STATUS_OPT_DISPLAY @ 0x00820c04 {
         0:0     display_disabled as bool;
diff --git a/rust/kernel/bits.rs b/rust/kernel/bits.rs
index 553d50265883..590a77d99ad7 100644
--- a/rust/kernel/bits.rs
+++ b/rust/kernel/bits.rs
@@ -201,3 +201,5 @@ pub const fn [<genmask_ $ty>](range: RangeInclusive<u32>) -> $ty {
     /// assert_eq!(genmask_u8(0..=7), u8::MAX);
     /// ```
 );
+
+pub mod bitfield;
diff --git a/drivers/gpu/nova-core/bitfield.rs b/rust/kernel/bits/bitfield.rs
similarity index 90%
rename from drivers/gpu/nova-core/bitfield.rs
rename to rust/kernel/bits/bitfield.rs
index 2ca5f3725246..b49bfc1abcd5 100644
--- a/drivers/gpu/nova-core/bitfield.rs
+++ b/rust/kernel/bits/bitfield.rs
@@ -33,10 +33,13 @@
 //! - `as <type> ?=> <try_into_type>` calls `<try_into_type>`'s `TryFrom::<<type>>` implementation
 //!   and returns the result. This is useful with fields for which not all values are valid.
 //!
+
+/// bitfield macro definition
+#[macro_export]
 macro_rules! bitfield {
     // Main entry point - defines the bitfield struct with fields
     ($vis:vis struct $name:ident : $storage:ty $(, $comment:literal)? { $($fields:tt)* }) => {
-        bitfield!(@core $name $vis $storage $(, $comment)? { $($fields)* });
+        ::kernel::bitfield!(@core $name $vis $storage $(, $comment)? { $($fields)* });
     };
 
     // All rules below are helpers.
@@ -71,7 +74,7 @@ fn from(val: $storage) -> Self {
             }
         }
 
-        bitfield!(@fields_dispatcher $name $vis $storage { $($fields)* });
+        ::kernel::bitfield!(@fields_dispatcher $name $vis $storage { $($fields)* });
     };
 
     // Captures the fields and passes them to all the implementers that require field information.
@@ -87,7 +90,7 @@ fn from(val: $storage) -> Self {
         )*
     }
     ) => {
-        bitfield!(@field_accessors $name $vis $storage {
+        ::kernel::bitfield!(@field_accessors $name $vis $storage {
             $(
                 $hi:$lo $field as $type
                 $(?=> $try_into_type)?
@@ -96,8 +99,8 @@ fn from(val: $storage) -> Self {
             ;
             )*
         });
-        bitfield!(@debug $name $storage { $($field;)* });
-        bitfield!(@default $name $storage { $($field;)* });
+        ::kernel::bitfield!(@debug $name $storage { $($field;)* });
+        ::kernel::bitfield!(@default $name $storage { $($field;)* });
     };
 
     // Defines all the field getter/setter methods for `$name`.
@@ -112,7 +115,7 @@ fn from(val: $storage) -> Self {
         }
     ) => {
         $(
-            bitfield!(@check_field_bounds $hi:$lo $field as $type);
+            ::kernel::bitfield!(@check_field_bounds $hi:$lo $field as $type);
         )*
 
         #[allow(dead_code)]
@@ -124,7 +127,7 @@ impl $name {
             }
 
             $(
-            bitfield!(@field_accessor $name $vis $storage, $hi:$lo $field as $type
+            ::kernel::bitfield!(@field_accessor $name $vis $storage, $hi:$lo $field as $type
                 $(?=> $try_into_type)?
                 $(=> $into_type)?
                 $(, $comment)?
@@ -161,7 +164,7 @@ impl $name {
         @field_accessor $name:ident $vis:vis $storage:ty, $hi:tt:$lo:tt $field:ident as bool => $into_type:ty
             $(, $comment:literal)?;
     ) => {
-        bitfield!(
+        ::kernel::bitfield!(
             @leaf_accessor $name $vis $storage, $hi:$lo $field
             { |f| <$into_type>::from(if f != 0 { true } else { false }) }
             $into_type => $into_type $(, $comment)?;
@@ -172,7 +175,7 @@ impl $name {
     (
         @field_accessor $name:ident $vis:vis $storage:ty, $hi:tt:$lo:tt $field:ident as bool $(, $comment:literal)?;
     ) => {
-        bitfield!(@field_accessor $name $vis $storage, $hi:$lo $field as bool => bool $(, $comment)?;);
+        ::kernel::bitfield!(@field_accessor $name $vis $storage, $hi:$lo $field as bool => bool $(, $comment)?;);
     };
 
     // Catches the `?=>` syntax for non-boolean fields.
@@ -180,7 +183,7 @@ impl $name {
         @field_accessor $name:ident $vis:vis $storage:ty, $hi:tt:$lo:tt $field:ident as $type:tt ?=> $try_into_type:ty
             $(, $comment:literal)?;
     ) => {
-        bitfield!(@leaf_accessor $name $vis $storage, $hi:$lo $field
+        ::kernel::bitfield!(@leaf_accessor $name $vis $storage, $hi:$lo $field
             { |f| <$try_into_type>::try_from(f as $type) } $try_into_type =>
             ::core::result::Result<
                 $try_into_type,
@@ -194,7 +197,7 @@ impl $name {
         @field_accessor $name:ident $vis:vis $storage:ty, $hi:tt:$lo:tt $field:ident as $type:tt => $into_type:ty
             $(, $comment:literal)?;
     ) => {
-        bitfield!(@leaf_accessor $name $vis $storage, $hi:$lo $field
+        ::kernel::bitfield!(@leaf_accessor $name $vis $storage, $hi:$lo $field
             { |f| <$into_type>::from(f as $type) } $into_type => $into_type $(, $comment)?;);
     };
 
@@ -203,7 +206,7 @@ impl $name {
         @field_accessor $name:ident $vis:vis $storage:ty, $hi:tt:$lo:tt $field:ident as $type:tt
             $(, $comment:literal)?;
     ) => {
-        bitfield!(@field_accessor $name $vis $storage, $hi:$lo $field as $type => $type $(, $comment)?;);
+        ::kernel::bitfield!(@field_accessor $name $vis $storage, $hi:$lo $field as $type => $type $(, $comment)?;);
     };
 
     // Generates the accessor methods for a single field.
diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
index 03b467722b86..a79b603604b1 100644
--- a/rust/kernel/io.rs
+++ b/rust/kernel/io.rs
@@ -8,6 +8,7 @@
 use crate::{bindings, build_assert, ffi::c_void};
 
 pub mod mem;
+pub mod register;
 pub mod resource;
 
 pub use resource::Resource;
diff --git a/drivers/gpu/nova-core/regs/macros.rs b/rust/kernel/io/register.rs
similarity index 93%
rename from drivers/gpu/nova-core/regs/macros.rs
rename to rust/kernel/io/register.rs
index fab407c50668..a212b12de0f1 100644
--- a/drivers/gpu/nova-core/regs/macros.rs
+++ b/rust/kernel/io/register.rs
@@ -16,7 +16,8 @@
 /// The `T` generic argument is used to distinguish which base to use, in case a type provides
 /// several bases. It is given to the `register!` macro to restrict the use of the register to
 /// implementors of this particular variant.
-pub(crate) trait RegisterBase<T> {
+pub trait RegisterBase<T> {
+    /// The base address for the register.
     const BASE: usize;
 }
 
@@ -55,7 +56,7 @@ pub(crate) trait RegisterBase<T> {
 /// ```
 ///
 ///
-/// Please look at the [`bitfield`] macro for the complete syntax of fields definitions.
+/// Please look at the [`bitfield`][crate::bits::bitfield::bitfield] macro for the complete syntax of fields definitions.
 ///
 /// The documentation strings are optional. If present, they will be added to the type's
 /// definition, or the field getter and setter methods they are attached to.
@@ -275,28 +276,29 @@ pub(crate) trait RegisterBase<T> {
 /// # Ok(())
 /// # }
 /// ```
+#[macro_export]
 macro_rules! register {
     // Creates a register at a fixed offset of the MMIO space.
     ($name:ident @ $offset:literal $(, $comment:literal)? { $($fields:tt)* } ) => {
-        bitfield!(pub(crate) struct $name: u32 $(, $comment)? { $($fields)* } );
+        ::kernel::bitfield!(pub(crate) struct $name: u32 $(, $comment)? { $($fields)* } );
         register!(@io_fixed $name @ $offset);
     };
 
     // Creates an alias register of fixed offset register `alias` with its own fields.
     ($name:ident => $alias:ident $(, $comment:literal)? { $($fields:tt)* } ) => {
-        bitfield!(pub(crate) struct $name: u32 $(, $comment)? { $($fields)* } );
+        ::kernel::bitfield!(pub(crate) struct $name: u32 $(, $comment)? { $($fields)* } );
         register!(@io_fixed $name @ $alias::OFFSET);
     };
 
     // Creates a register at a relative offset from a base address provider.
     ($name:ident @ $base:ty [ $offset:literal ] $(, $comment:literal)? { $($fields:tt)* } ) => {
-        bitfield!(pub(crate) struct $name: u32 $(, $comment)? { $($fields)* } );
+        ::kernel::bitfield!(pub(crate) struct $name: u32 $(, $comment)? { $($fields)* } );
         register!(@io_relative $name @ $base [ $offset ]);
     };
 
     // Creates an alias register of relative offset register `alias` with its own fields.
     ($name:ident => $base:ty [ $alias:ident ] $(, $comment:literal)? { $($fields:tt)* }) => {
-        bitfield!(pub(crate) struct $name: u32 $(, $comment)? { $($fields)* } );
+        ::kernel::bitfield!(pub(crate) struct $name: u32 $(, $comment)? { $($fields)* } );
         register!(@io_relative $name @ $base [ $alias::OFFSET ]);
     };
 
@@ -307,7 +309,7 @@ macro_rules! register {
         }
     ) => {
         static_assert!(::core::mem::size_of::<u32>() <= $stride);
-        bitfield!(pub(crate) struct $name: u32 $(, $comment)? { $($fields)* } );
+        ::kernel::bitfield!(pub(crate) struct $name: u32 $(, $comment)? { $($fields)* } );
         register!(@io_array $name @ $offset [ $size ; $stride ]);
     };
 
@@ -328,7 +330,7 @@ macro_rules! register {
             $(, $comment:literal)? { $($fields:tt)* }
     ) => {
         static_assert!(::core::mem::size_of::<u32>() <= $stride);
-        bitfield!(pub(crate) struct $name: u32 $(, $comment)? { $($fields)* } );
+        ::kernel::bitfield!(pub(crate) struct $name: u32 $(, $comment)? { $($fields)* } );
         register!(@io_relative_array $name @ $base [ $offset [ $size ; $stride ] ]);
     };
 
@@ -350,7 +352,7 @@ macro_rules! register {
         }
     ) => {
         static_assert!($idx < $alias::SIZE);
-        bitfield!(pub(crate) struct $name: u32 $(, $comment)? { $($fields)* } );
+        ::kernel::bitfield!(pub(crate) struct $name: u32 $(, $comment)? { $($fields)* } );
         register!(@io_relative $name @ $base [ $alias::OFFSET + $idx * $alias::STRIDE ] );
     };
 
@@ -359,7 +361,7 @@ macro_rules! register {
     // to avoid it being interpreted in place of the relative register array alias rule.
     ($name:ident => $alias:ident [ $idx:expr ] $(, $comment:literal)? { $($fields:tt)* }) => {
         static_assert!($idx < $alias::SIZE);
-        bitfield!(pub(crate) struct $name: u32 $(, $comment)? { $($fields)* } );
+        ::kernel::bitfield!(pub(crate) struct $name: u32 $(, $comment)? { $($fields)* } );
         register!(@io_fixed $name @ $alias::OFFSET + $idx * $alias::STRIDE );
     };
 
@@ -416,12 +418,12 @@ pub(crate) fn read<const SIZE: usize, T, B>(
                 base: &B,
             ) -> Self where
                 T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
-                B: crate::regs::macros::RegisterBase<$base>,
+                B: ::kernel::io::register::RegisterBase<$base>,
             {
                 const OFFSET: usize = $name::OFFSET;
 
                 let value = io.read32(
-                    <B as crate::regs::macros::RegisterBase<$base>>::BASE + OFFSET
+                    <B as ::kernel::io::register::RegisterBase<$base>>::BASE + OFFSET
                 );
 
                 Self(value)
@@ -437,13 +439,13 @@ pub(crate) fn write<const SIZE: usize, T, B>(
                 base: &B,
             ) where
                 T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
-                B: crate::regs::macros::RegisterBase<$base>,
+                B: ::kernel::io::register::RegisterBase<$base>,
             {
                 const OFFSET: usize = $name::OFFSET;
 
                 io.write32(
                     self.0,
-                    <B as crate::regs::macros::RegisterBase<$base>>::BASE + OFFSET
+                    <B as ::kernel::io::register::RegisterBase<$base>>::BASE + OFFSET
                 );
             }
 
@@ -457,7 +459,7 @@ pub(crate) fn alter<const SIZE: usize, T, B, F>(
                 f: F,
             ) where
                 T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
-                B: crate::regs::macros::RegisterBase<$base>,
+                B: ::kernel::io::register::RegisterBase<$base>,
                 F: ::core::ops::FnOnce(Self) -> Self,
             {
                 let reg = f(Self::read(io, base));
@@ -602,11 +604,11 @@ pub(crate) fn read<const SIZE: usize, T, B>(
                 idx: usize,
             ) -> Self where
                 T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
-                B: crate::regs::macros::RegisterBase<$base>,
+                B: ::kernel::io::register::RegisterBase<$base>,
             {
                 build_assert!(idx < Self::SIZE);
 
-                let offset = <B as crate::regs::macros::RegisterBase<$base>>::BASE +
+                let offset = <B as ::kernel::io::register::RegisterBase<$base>>::BASE +
                     Self::OFFSET + (idx * Self::STRIDE);
                 let value = io.read32(offset);
 
@@ -624,11 +626,11 @@ pub(crate) fn write<const SIZE: usize, T, B>(
                 idx: usize
             ) where
                 T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
-                B: crate::regs::macros::RegisterBase<$base>,
+                B: ::kernel::io::register::RegisterBase<$base>,
             {
                 build_assert!(idx < Self::SIZE);
 
-                let offset = <B as crate::regs::macros::RegisterBase<$base>>::BASE +
+                let offset = <B as ::kernel::io::register::RegisterBase<$base>>::BASE +
                     Self::OFFSET + (idx * Self::STRIDE);
 
                 io.write32(self.0, offset);
@@ -645,7 +647,7 @@ pub(crate) fn alter<const SIZE: usize, T, B, F>(
                 f: F,
             ) where
                 T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
-                B: crate::regs::macros::RegisterBase<$base>,
+                B: ::kernel::io::register::RegisterBase<$base>,
                 F: ::core::ops::FnOnce(Self) -> Self,
             {
                 let reg = f(Self::read(io, base, idx));
@@ -664,7 +666,7 @@ pub(crate) fn try_read<const SIZE: usize, T, B>(
                 idx: usize,
             ) -> ::kernel::error::Result<Self> where
                 T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
-                B: crate::regs::macros::RegisterBase<$base>,
+                B: ::kernel::io::register::RegisterBase<$base>,
             {
                 if idx < Self::SIZE {
                     Ok(Self::read(io, base, idx))
@@ -686,7 +688,7 @@ pub(crate) fn try_write<const SIZE: usize, T, B>(
                 idx: usize,
             ) -> ::kernel::error::Result where
                 T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
-                B: crate::regs::macros::RegisterBase<$base>,
+                B: ::kernel::io::register::RegisterBase<$base>,
             {
                 if idx < Self::SIZE {
                     Ok(self.write(io, base, idx))
@@ -709,7 +711,7 @@ pub(crate) fn try_alter<const SIZE: usize, T, B, F>(
                 f: F,
             ) -> ::kernel::error::Result where
                 T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
-                B: crate::regs::macros::RegisterBase<$base>,
+                B: ::kernel::io::register::RegisterBase<$base>,
                 F: ::core::ops::FnOnce(Self) -> Self,
             {
                 if idx < Self::SIZE {
-- 
2.34.1

