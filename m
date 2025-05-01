Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 711F7AA5ED7
	for <lists+dri-devel@lfdr.de>; Thu,  1 May 2025 14:59:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93F9410E84D;
	Thu,  1 May 2025 12:59:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="WaG8ldnG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2047.outbound.protection.outlook.com [40.107.93.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFAFF10E849;
 Thu,  1 May 2025 12:59:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZD05ItVu0gk7eH1ksD8C785UrbD7lYPfhQHS81sC/fKmzCumSZ5xfrbCETdcHf633mbQ6P+nEGVW+o7CfWuSoqjdmYMVlakL2VMKOYtojHlH6sEUiXRayRwsdD6kVBQLck+tIIKJsYNCOh4BfWc9OSSAwWXmV6bEQ82w2/t+dT8GzA38zhV+f3HeUz2k2U3JC9wCnt8GaPqrUFQqg3++ZGJKZ3V53Ttxd6c9msWH3+wu34pAugWnzdbKEtrV35r2JJf9rAKMEyuhf7X7iu60UKn2ogA2Qwnjm5gXxGl3pD0XOOYb/ndDVEFoo6LH0Gplc45xiwYs4I92frKV9yORlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Eh7t4GdyGJXxG82f9XB/JLT0Q//muxw6XlkPAaVdQ/I=;
 b=IgC8/VXqaaYyRLICxZDi9ZrmtjyvbIw41Z6cl6rr1wyuu0FW1Pcwqv6SMWf/AtXwvw4JHVBb4TQXHYqZnr+/Q78kxknsBKPHILrWHSQk31PKY8+HF/Zq4G2EqS9KNhyVKYPBVHEwd4DnP+ts0QS9X8RwYML9tP5dziByH8QbDhGhf3r7iZwVu+l/t7p5AqN79N34RxOpX62odPp8Qb8LKSFEd5WxCaT5bjfW1kVT1hBPRhKpaL6zuk1RAIj47VklBegu8d8eYeZchPFU7OxvijGyrlyPhbZtI0buqt7eFNtY/t6ea1XWkK2SsCoyi3UiAS1JIx3TovdL1SgD9RaxxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Eh7t4GdyGJXxG82f9XB/JLT0Q//muxw6XlkPAaVdQ/I=;
 b=WaG8ldnGjvbZ2vg2GtAYg1PRgYGfC+sDQKk4kfr1NUxSyK97KtSJogLCnLeB/tNLvagfCJUDnemtoXMCP/efoGyOuMQtXLD0agSdh4XF/A+xU0xDR8QJhnUpo2s3qizij51WmG6b2Frqx5tn7FGn+sQ7D4S92yBJ3oMi4es5hKFSxBBXbfq+omTOVpTmLwQV/HiSx4A6XUfOn2fGqo5EdT7geM9kVT8c3j0YKbUYr2/OPGKFN/lQuOjypxO1FWvL7yhN7CjxwCv+GPQaVTuYZbxn7ZrboqMaF0/gqT5pnSsgnJoJxwMn5PbqtNDc4miccHxelSyNVdof6v9gFKftGQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by LV2PR12MB5919.namprd12.prod.outlook.com (2603:10b6:408:173::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Thu, 1 May
 2025 12:59:52 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8699.012; Thu, 1 May 2025
 12:59:52 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 01 May 2025 21:58:37 +0900
Subject: [PATCH v2 19/21] gpu: nova-core: compute layout of the FRTS region
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250501-nova-frts-v2-19-b4a137175337@nvidia.com>
References: <20250501-nova-frts-v2-0-b4a137175337@nvidia.com>
In-Reply-To: <20250501-nova-frts-v2-0-b4a137175337@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TY4PR01CA0015.jpnprd01.prod.outlook.com
 (2603:1096:405:2bf::10) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|LV2PR12MB5919:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ebf2a29-1fa3-4854-5ec2-08dd88b01037
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|10070799003|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Tm5iampvZ0pGeGV5SXZFK21LSnVZdHNMOHNndUl0aXQ2YlFqci9MWVltL1JX?=
 =?utf-8?B?STg1VWpwWEJGKzJHS1NJNjVvNTFac2ZoOWVuWUVUWkdCMzMwZWgxdnBCS3dK?=
 =?utf-8?B?Tis3dnRrY1JQMDZtelpzQkt3MFJkUWE2ckQ2T2I3YTNLL2hOb1B5aGVUdTR1?=
 =?utf-8?B?c1JlM2lmK0txNU5zUnh6aVNZSnVPRzhFMFdmNHVQanhoMDdtNlRMRzR5aHl5?=
 =?utf-8?B?bXZ2Wnl4VXl2eW41eHNxNUM5ZHdVZFZ2a3grbmFMcnR1VUdadm94YlNBVytS?=
 =?utf-8?B?YW1ybmFMT215UDNPcjA3SWY5ODE1ay81Mml4b29xYjJTOFhWOHcwc3N2VE40?=
 =?utf-8?B?OVJCT1FkZXlvbzZ5bDl2UnBFbGdRdXFFU0gvbTRRb3lpM29SNGhIV1ZLUFpj?=
 =?utf-8?B?Y2psNUZhck5oQXhNRTFVWlVhNkdlRlFNaEh5UTdZd2F5N0FqY1NlYzQrWm9k?=
 =?utf-8?B?NXZzTWwzblFHZmR3NGZFK0hCZFJ3NFJPOGk3bU9FallMMVV1MTdjRDV3SzBp?=
 =?utf-8?B?L3FJMUpQOE9lSUY1UDN4MnpEcjc3azB5RWxGSlR3R0J1MURSeVJCdDlsZXF0?=
 =?utf-8?B?NmgyU0gydkk5cDk0OVZ4ZCtaYXVScFlvajROb3owWEo1L3JZTjBrQmJpekNz?=
 =?utf-8?B?bUIxdXF0QlBpVnBvOFhTRmRFejlMWGRXOVFISFdtUWNvY2NCWnBQVlZqREEr?=
 =?utf-8?B?S0k2djUrRTVQazF0WmZHZmJNdDJYaHJieHJ4SUd3NGFNTTlxSTZqUHVNdzJk?=
 =?utf-8?B?OWVNV3FtNmZXSUlEaWs0RVZNVitDMXVyYUxuWVhLZ3paNzJSbnVvMERsa1hp?=
 =?utf-8?B?aVgvSGFYV3ErVTYvKzJPYzJ5cUd5NmxFMXhkTWs5bGJMalJYNUJVKzNYL1d3?=
 =?utf-8?B?L2piNnlEMGwwQ3ZiaFBXdk9aVkI1SDVnb2t4QkZKNnpkaVJHLzJOdTFDM2dI?=
 =?utf-8?B?aEJOK09ZWUJDQmxBZ3MxYXBoVVFwWE5CeEh3QTFGSjVoM2Q2dEdaNmM5Nm9O?=
 =?utf-8?B?R3J5VDdBQk94b1hObG9BN3ZQZnpEU1lOblc1TzBNcEZ2M3RGTXJrNHllWmpS?=
 =?utf-8?B?WFVrVmFHR1NBWmlTajl4SjNTSzJ1RUQvZUpyMlFLM3J4MUpnWXIwNTZ3Skpa?=
 =?utf-8?B?blRPdWY5b0g2ckdaTEoyeGNSY1BHK0RJVkxmcFNQYkg4eFVXSG56ZUZuaU5G?=
 =?utf-8?B?NVJXdEorR0N2bHN6cFZSMFVsSzZUd251NmNLWnNjVWJwYWV4d2xRTXpHYVNJ?=
 =?utf-8?B?UFhKeldYcTVBQThqaDVtaWVQNE9LeFNZdFVMK0hKWlgydXMxOTNBc3k1aEsv?=
 =?utf-8?B?ZUtYUGtkc00rdUU2OTFCOExrSnpKT0w5dStoTnlOUFRQaklFU3VKMVd3SVRq?=
 =?utf-8?B?ZVpFaHVWTHhIb2tFd2VlODNUaUVJWWFzUHp0K0hTZU43Z1JuWHNNYXhZTzdD?=
 =?utf-8?B?ODk3VVoyL0hZQ0kzMUxIdmw1SzcyZWt6MGNRR3ZxZXZucEFFZGh3L01GU2Zl?=
 =?utf-8?B?aXAvTUFKZW9JdCs3NXl6ZG85K3MzQTIrOUtwLzRuRmI0QXR2RThDN2o0QjNk?=
 =?utf-8?B?bDAwYzVQWWRwTWQrSXRvUkFVQzdLeTc4RHl6ZDFBUEQvVE92RW44ZE5FRG5X?=
 =?utf-8?B?YzVZdXF3em1Vd1BFbWYxcjNEemgwUDlSSjY3UWpzbnJjZlF1SlpLd1dQU0g1?=
 =?utf-8?B?YUowOUR2N1ZFaDF4UWFEUEtReUw3aEJXUWd2WVJ0SHd4QU05RGF0cGZNWWVE?=
 =?utf-8?B?UWk4SmRoVzRzbmNMZ1d3K1UvWUZSV2VXWFVGUzJLU0J4SEFqSGMzNUQ4a2Ro?=
 =?utf-8?B?ekp6cTgzeTNUODZnOS9uTTNWVzdsNEhhQUVFTGZoVE80SnN4QlN4b3M0cHlY?=
 =?utf-8?B?ekU3UUtUUmpmdVhkVU1JUVVSTDIxNDZqcDlEd1YyMDJXblYwK25RZEFCeUJL?=
 =?utf-8?B?dmRjNlRQOHh0UDA1VVZKUjJsU1FJa1NEd2Eya2g4UXNQWndBMlJ3ckR3Q09I?=
 =?utf-8?B?SjB0cFMzTmpnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(10070799003)(366016)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bjkwTmZaTXpzZ2RmQ1gwUDdiQnd1d0ZLYW1hRC9YU0xNcFJkejBERVdIVW9Y?=
 =?utf-8?B?cUdtamFhUXpvL0xQQzBNc3N2YW9uNzQvMTJPMGgwR0tUVzI0SlhZb3hGb3RC?=
 =?utf-8?B?TzZBdXowZDNqT0l6cHlNRnRIZjQwbWNQbXpqaG1tNFRLL1ZrWEN1NWdrbXpr?=
 =?utf-8?B?NGQwQXRVU2hPeVdLUHVmdHBuZ0NWWDQxYU5MUVIxNVVUWHQ0Ky9zcUVwaGlx?=
 =?utf-8?B?MEFuR3R2M3ZsNWdJVHc5UUZWd0tJWW9pV0hWaysvWkEyTEVlRXJJSmpvT2s2?=
 =?utf-8?B?RTMzcVkzNE5XVldud3gxUDNZWExtZlo3bFpNc3VnOWhiRU0vMFhsVzRpTGtx?=
 =?utf-8?B?RmNRdy83LzJrVVQ4ZjB1TE13SHhodkp0NjlSeHc5dFZzSHdQc0JnRU1ydC84?=
 =?utf-8?B?TG40dHlLcTE1YnZHWXVBK0FJKzh5YmdBOEZhRE5Rb0YxZk53b1Yva2RDVXM2?=
 =?utf-8?B?aTB2U29lbWRqSXJGWVZGN21CNTNpTmM1a0FlTGRhMTFjQ2orQktocWcrUzZy?=
 =?utf-8?B?UkNaSzZ5cHlXQ3pwRG5qMysrVm1EUG9pT2FBY1ZtSEk4R2hiUSs4Q2tNcG9E?=
 =?utf-8?B?dEYyOXRWdVF2SkRQaTVrdTdlaTlaRndnbVVhbm93ZTdyK3NXWjNNQk91VC91?=
 =?utf-8?B?NFNXRFZXbjgvMi80TUxicm1BVDFmQmtpdUErY1JhaWJpazFVc01yWWJLQjdi?=
 =?utf-8?B?V1RxbXhsMkZGN2NhR3oxL0wwbklnRzVUZ3lnTlZKYytvUEE4U25renNxd3Uy?=
 =?utf-8?B?MEVjSVl1R0ZjYk9NZytuUU5uQUVFOW40Vi9CdnVUbjJwMExvNlAzaUEydGI2?=
 =?utf-8?B?Q3ZWQWk3QUFPRXd0ZzdPdnRFT1NGdmV0U0Y1RzhSVnkwMmdZc0s0djk5T2VF?=
 =?utf-8?B?R2ZlL1BVbjBlTklhdlpJS05PSDc4Z2phTGxaL0o4WXVHSTNDdjlNRUpwZ2g4?=
 =?utf-8?B?WUFKek1WQnpPTFNrdHMxM3JaRUNDeEZJVEc2TVBOWlEvZXV2NjByaVZsYWtl?=
 =?utf-8?B?TDJzWnE1UE5YZW1rY3loTnJjSm9WRVo0bDRtY1QwV0RzQ1dra1BCNkdWQ09j?=
 =?utf-8?B?emx0ZFZpZlVQb2hzdm9RcTFVY1dCTzlXMm1jeHZmOVhDaHQxNmhDSU1kU3BC?=
 =?utf-8?B?cW5uc2JlSVhrSXZCQTBQSTRmTjlGQk9EeHNER3JHZGxMaVl1SWkyQVY4U0xi?=
 =?utf-8?B?VHFkQlE0ZWJtU1VTSTkwdTBnL0tPb0dZMEhkVFMzM2gvQ00rUlErMDlFSXEw?=
 =?utf-8?B?bXYyWVpxRE4wemtnZTd1eUN0Zlo2Q0RhTktyY0tQVTZYb3RvOCtGdzJXOVNl?=
 =?utf-8?B?a0lLVGhOMVRSNThVOFNUR3lVNGdzV2lSdjlaaXR6NkQ3enpoNUJyRGpud28w?=
 =?utf-8?B?RmdaZVh6Qk5yTFgzU2hWQ0hvLzJOd3NybXFWTDEzNXpQei9PSURaVTJmRjdF?=
 =?utf-8?B?YTFVUW1uY1E3eVRWZFc4ZWc2V3JocVo0dnMrbFR3THg2TlozWFFpeVRzVEdS?=
 =?utf-8?B?TjlTcGJUWndPK1lMNGRnZTd4OWhoYzVFMUNabXRZS29qL0lxV0U3VUM4ZXQy?=
 =?utf-8?B?aXJWQ2dCRjJid0ZDY1QrdjBvSmdlMk1tRllRK1hTMmtLRXAyU0RVSFFHWG1O?=
 =?utf-8?B?YTdqQTJrbVYrR2lVMUlhU3Fpc2xCb1Vwc21Pd1pPUzlZaG9IMXk4UkhQMGgx?=
 =?utf-8?B?d3pONDcrRWpvS1dPOUREUWtsd1hRVVBpZUlLdXNaQzRXYkV2WVpvZWt3TWJo?=
 =?utf-8?B?VnhENVJwVzhsMzdOYWc4Q0wrUW5OR0NXN1RHa2F3M1JVa25lbmR4U01DUnVa?=
 =?utf-8?B?SmZvVno3bU8zcUxuRGUvWkZVdmpOWGVta1VSbUtEaXF2OEMycGZzNFF1MHBG?=
 =?utf-8?B?T0lNVWNibUNiYlZWK3J0QUgrak1hbHVOSlN2Q1BRQzh5VHVqM2Vub0hBZUo4?=
 =?utf-8?B?NDRuMXVKR0hlSE9LcEQ1UDZWUy9paWN0RWhzcHVrRTMyeDRyc3JpVkZLNm5G?=
 =?utf-8?B?OXo0RGhRV2M5alg0VXF0QnVicWxOditmZ3Y2UHozY0xiUmQ0b0UzaWRDMEdh?=
 =?utf-8?B?ZE9DNmxlT3ZwUWY0TUVxQk44WEN0UHJWMTU3ejdPNDF1cTRlSG9yQ24rSGlo?=
 =?utf-8?B?T3pmV3h6NFRMbm1BTmFjMS9QNFQxeHpvcHNFNnk1WVRFaGluZkNZVHpkb0Z6?=
 =?utf-8?Q?dRjVYK+S3ktyPKWUo0jor6oUALBxAFTeo/SXpgiOloeU?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ebf2a29-1fa3-4854-5ec2-08dd88b01037
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2025 12:59:52.5289 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RdJAWl9lHFIKz+wZDvVBJtH9UQa3ugoFtedvBpuOa6ShGUQ67V98p56/8UYKeumr1O1dk/Z29FDAMcqu8AyKkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5919
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

FWSEC-FRTS is run with the desired address of the FRTS region as
parameter, which we need to compute depending on some hardware
parameters.

Do this in a `FbLayout` structure, that will be later extended to
describe more memory regions used to boot the GSP.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs       |   4 ++
 drivers/gpu/nova-core/gsp.rs       |   3 +
 drivers/gpu/nova-core/gsp/fb.rs    | 109 +++++++++++++++++++++++++++++++++++++
 drivers/gpu/nova-core/nova_core.rs |   1 +
 drivers/gpu/nova-core/regs.rs      |  27 +++++++++
 5 files changed, 144 insertions(+)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 2adef119618b05ef7e397e10dfeda1228f4521c2..8d470a810ec7a04cbee1645fc9c32607d2ad8b8c 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -7,6 +7,7 @@
 use crate::driver::Bar0;
 use crate::falcon::{gsp::Gsp, sec2::Sec2, Falcon};
 use crate::firmware::Firmware;
+use crate::gsp::fb::FbLayout;
 use crate::regs;
 use crate::util;
 use crate::vbios::Vbios;
@@ -240,6 +241,9 @@ pub(crate) fn new(
 
         let _sec2_falcon = Falcon::<Sec2>::new(pdev.as_ref(), spec.chipset, &bar, true)?;
 
+        let fb_layout = FbLayout::new(spec.chipset, &bar)?;
+        dev_dbg!(pdev.as_ref(), "{:#x?}\n", fb_layout);
+
         let _bios = Vbios::new(pdev, &bar)?;
 
         Ok(pin_init!(Self {
diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
new file mode 100644
index 0000000000000000000000000000000000000000..27616a9d2b7069b18661fc97811fa1cac285b8f8
--- /dev/null
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -0,0 +1,3 @@
+// SPDX-License-Identifier: GPL-2.0
+
+pub(crate) mod fb;
diff --git a/drivers/gpu/nova-core/gsp/fb.rs b/drivers/gpu/nova-core/gsp/fb.rs
new file mode 100644
index 0000000000000000000000000000000000000000..c4f5f36e143e698843d15510b95a8abd80550c0c
--- /dev/null
+++ b/drivers/gpu/nova-core/gsp/fb.rs
@@ -0,0 +1,109 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use core::ops::Range;
+
+use kernel::devres::Devres;
+use kernel::prelude::*;
+
+use crate::driver::Bar0;
+use crate::gpu::Chipset;
+use crate::regs;
+
+fn align_down(value: u64, align: u64) -> u64 {
+    value & !(align - 1)
+}
+
+/// Layout of the GPU framebuffer memory.
+///
+/// Contains ranges of GPU memory reserved for a given purpose during the GSP bootup process.
+#[derive(Debug)]
+#[expect(dead_code)]
+pub(crate) struct FbLayout {
+    pub fb: Range<u64>,
+
+    pub vga_workspace: Range<u64>,
+    pub bios: Range<u64>,
+
+    pub frts: Range<u64>,
+}
+
+impl FbLayout {
+    pub(crate) fn new(chipset: Chipset, bar: &Devres<Bar0>) -> Result<Self> {
+        let fb = {
+            let fb_size = with_bar!(bar, |b| vidmem_size(b, chipset))?;
+
+            0..fb_size
+        };
+        let fb_len = fb.end - fb.start;
+
+        let vga_workspace = {
+            let vga_base = with_bar!(bar, |b| vga_workspace_addr(b, fb_len, chipset,))?;
+
+            vga_base..fb.end
+        };
+
+        let bios = vga_workspace.clone();
+
+        let frts = {
+            const FRTS_DOWN_ALIGN: u64 = 0x20000;
+            const FRTS_SIZE: u64 = 0x100000;
+            let frts_base = align_down(vga_workspace.start, FRTS_DOWN_ALIGN) - FRTS_SIZE;
+
+            frts_base..frts_base + FRTS_SIZE
+        };
+
+        Ok(Self {
+            fb,
+            vga_workspace,
+            bios,
+            frts,
+        })
+    }
+}
+
+/// Returns `true` if the display is disabled.
+fn display_disabled(bar: &Bar0, chipset: Chipset) -> bool {
+    if chipset >= Chipset::GA100 {
+        regs::NV_FUSE_STATUS_OPT_DISPLAY_MAXWELL::read(bar).display_disabled()
+    } else {
+        regs::NV_FUSE_STATUS_OPT_DISPLAY_AMPERE::read(bar).display_disabled()
+    }
+}
+
+/// Returns the video memory size in bytes.
+fn vidmem_size(bar: &Bar0, chipset: Chipset) -> u64 {
+    if chipset >= Chipset::GA102 {
+        (regs::NV_PGC6_AON_SECURE_SCRATCH_GROUP_42::read(bar).value() as u64) << 20
+    } else {
+        let local_mem_range = regs::NV_PFB_PRI_MMU_LOCAL_MEMORY_RANGE::read(bar);
+        let size =
+            (local_mem_range.lower_mag() as u64) << ((local_mem_range.lower_scale() as u64) + 20);
+
+        if local_mem_range.ecc_mode_enabled() {
+            size / 16 * 15
+        } else {
+            size
+        }
+    }
+}
+
+/// Returns the vga workspace address.
+fn vga_workspace_addr(bar: &Bar0, fb_size: u64, chipset: Chipset) -> u64 {
+    let base = fb_size - 0x100000;
+    let vga_workspace_base = if display_disabled(bar, chipset) {
+        regs::NV_PDISP_VGA_WORKSPACE_BASE::read(bar)
+    } else {
+        return base;
+    };
+
+    if !vga_workspace_base.status_valid() {
+        return base;
+    }
+
+    let addr = (vga_workspace_base.addr() as u64) << 16;
+    if addr < base {
+        fb_size - 0x20000
+    } else {
+        addr
+    }
+}
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index dc5da9409477c62b1d466ed00c17baf3677a6a53..e48e9757e54b3b05adcfa05fdc9d2c34c789e950 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -26,6 +26,7 @@ macro_rules! with_bar {
 mod falcon;
 mod firmware;
 mod gpu;
+mod gsp;
 mod regs;
 mod util;
 mod vbios;
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index b5c6eeb6ed873a06b4aefcb375f4944eb0b20597..15ec9b7e69694ff198b5353d562fc1aff5eefd3f 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -53,6 +53,12 @@ pub(crate) fn chipset(self) -> Result<Chipset, Error> {
     23:0    adr_63_40 as u32;
 });
 
+register!(NV_PFB_PRI_MMU_LOCAL_MEMORY_RANGE @ 0x00100ce0 {
+    3:0     lower_scale as u8;
+    9:4     lower_mag as u8;
+    30:30   ecc_mode_enabled as bool;
+});
+
 /* PGC6 */
 
 register!(NV_PGC6_AON_SECURE_SCRATCH_GROUP_05_PRIV_LEVEL_MASK @ 0x00118128 {
@@ -64,6 +70,27 @@ pub(crate) fn chipset(self) -> Result<Chipset, Error> {
     31:0    value as u32;
 });
 
+register!(NV_PGC6_AON_SECURE_SCRATCH_GROUP_42 @ 0x001183a4 {
+    31:0    value as u32;
+});
+
+/* PDISP */
+
+register!(NV_PDISP_VGA_WORKSPACE_BASE @ 0x00625f04 {
+    3:3     status_valid as bool;
+    31:8    addr as u32;
+});
+
+/* FUSE */
+
+register!(NV_FUSE_STATUS_OPT_DISPLAY_MAXWELL @ 0x00021c04 {
+    0:0     display_disabled as bool;
+});
+
+register!(NV_FUSE_STATUS_OPT_DISPLAY_AMPERE @ 0x00820c04 {
+    0:0     display_disabled as bool;
+});
+
 /* PFALCON */
 
 register!(NV_PFALCON_FALCON_IRQSCLR @ +0x00000004 {

-- 
2.49.0

