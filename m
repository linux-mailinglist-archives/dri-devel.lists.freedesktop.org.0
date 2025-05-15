Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A79AB8051
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 10:23:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0CCC10E7BD;
	Thu, 15 May 2025 08:23:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="lI5IGlY2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2074.outbound.protection.outlook.com [40.107.223.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 236ED10E7BD;
 Thu, 15 May 2025 08:23:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D43uah66pbWqLrM1qHR/1Lv3hu8n3yjg5bqhBAzf/aMgqpHbKGFBG2O3KOoe+mdohz2sgup9bkVsRKWR31Vmgdknl+rb/NwFrkItO3d2fWJV84K4BlRTdt3XBTDFNJ2oeMIDzzygEI2mZr69BZxYSJT+CCdASglLyQhfPB8/vJ3WKRbWU1Va4o+r3C6bzlUFh/YS9YUnNkNGkIGRouEaGRHggNRZHtcO+yC8hIA1r5ceOLcq+OeedKHv1oCrm5xMN1SR8JjFfCpeGLp2ZJEo/QSNkFFPc9WTbJocYgDcVWlCESn9sD5MuQX4EqEMC08EV+IEsIpDXHxHf0iApCPEcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P/ktpRdJC/aEmmSiLTVFgzhs7nF8lOHeQqb/gxWUdd8=;
 b=n7Op+I3mLhVG9TzP4xewHdVoiu0Vt4C7FdrOt7auSmpPewghRQaU4gs4ZFgfBmvltLmQBy4tWfS0V3riCcgQxhNW9zHZQ4EsbZoHn4i1xhYV/w/UHZDU/iw44S8PTppZZfSJidLXBZmOigtIlPeqgwRLMBinXwa8ytwqcbBbR3N2sZd4UNisNUiggouDF4LtRKnFzNLhtXv9C8D1wTgk2AIIZg0p2E1yRYE31shFrNwAniS70zCSmXlRg9s0StC0Gmj/VnicG2715prVDfw/fyoY3G+JK8H2+CkETxDHQMl/9iLkarU0gS7YOuHdGCdfJtJUSIeDnLErUFeypOpbSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P/ktpRdJC/aEmmSiLTVFgzhs7nF8lOHeQqb/gxWUdd8=;
 b=lI5IGlY2LNOqAUIxEqF/K4I5t91crfYVEDVhDj81FN+w4B1z8clwtvf3jkrAgHLbwwylsedMfcWlA41p8P6xIZZGYqfo/if/Rnkk1Oi1e5ebh8wRiY/Y0FuZivFYqLa0gCgF2UlDh6UKAbNHYNx99woP+QdTBkcqBdXFVveP3yOSNTtjPuuTW90iSsjMxh9uBrIUAUV4HWFH5pMkylIs3SquXqNXb3W/uQA/pY+6ofbXHlPRTtWyygajoEly4j19ya/grEfXVwJa++47xDilpXjxIPqnl7Q7qWfmOCxHBXMWft4FwoTovbwfmH80T3oB1d+KZvUnF095qzxmUK7SuQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CYYPR12MB8962.namprd12.prod.outlook.com (2603:10b6:930:c4::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Thu, 15 May
 2025 08:23:29 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%5]) with mapi id 15.20.8722.027; Thu, 15 May 2025
 08:23:29 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 15 May 2025 17:23:18 +0900
Subject: [PATCH v2 1/3] samples: rust: select AUXILIARY_BUS instead of
 depending on it
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250515-aux_bus-v2-1-47c70f96ae9b@nvidia.com>
References: <20250515-aux_bus-v2-0-47c70f96ae9b@nvidia.com>
In-Reply-To: <20250515-aux_bus-v2-0-47c70f96ae9b@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYAPR01CA0209.jpnprd01.prod.outlook.com
 (2603:1096:404:29::29) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CYYPR12MB8962:EE_
X-MS-Office365-Filtering-Correlation-Id: 0473ffc1-a0f1-4d39-3363-08dd9389c5ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|10070799003|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NWVUcTRUSldNV05hTE1RdFAza0wzT0JDcjlEQXZmV1lVTW9rc1lKeVpROUY1?=
 =?utf-8?B?R1BibWdMcWgycUtLeklPMTBacTdRNlZKWklaWGdqVTM1SDJmdmpUQ1RFek1O?=
 =?utf-8?B?MnR6UTh6WGJxb0xTa3A1UTNhWVc4UnEza1cvVGpPa2pRWXpLZkt6dGlhd3lu?=
 =?utf-8?B?V2pVbHUvUWJHOWM0ZDN6R0U1MnFZTnZZMWFidElxWmRiWWVtdkdwQUNlRDlk?=
 =?utf-8?B?enhaaTluM0tYZnhwUDdSdXRCa2oyci9LblRFRUpuZXNVcENHM3IyeVNIQWJ4?=
 =?utf-8?B?eHp5aGxPbzhGRUxZOUllZXBlSDRHSlVrN3hIZjY0NVk3OCsyZWdwM1VBM1Bj?=
 =?utf-8?B?bmQ1R2RZSG82em8xSndoNGh1MDhUYjl6SHNENWsxQWZJMUw1bWI4QmJEaGNL?=
 =?utf-8?B?MnNiUE8venNVYzJ4NTBMTS9GNHE4VmNiUzlxYnN5SjlaN1FBaElTYXdPNTA1?=
 =?utf-8?B?ZmlJNDNNc3UxbUFLcTd2cGZYd3YvZEFwWjNFNWRJMERtVHFoSncvd1RXOTJk?=
 =?utf-8?B?UmhudGhRQW9DczBxNkpyall1MnJxbUpzVHlUQjZGZGIzWFlaM0hnY2tGSU82?=
 =?utf-8?B?eXFlM3BmR1cvU0dUdWZCcy8zYm84ZERKVzcvU1QySXNtSG9jNUtTMk5KZTNu?=
 =?utf-8?B?VitkcXR3ZWhCQTJEaE5kcjJMSU56QlYvNEduZk5KV1pySTdBYzNIWHpSR2c0?=
 =?utf-8?B?bW83amVPTjEzNXd4QmUzdkRKMWhiUCtpazZSbmpxTnpUcUdmYzFXaWJDQlVJ?=
 =?utf-8?B?dkdFclF5c3dWWHZmRGZiTDF4UE4vYVQzN2RwSEJwVE5sVWFVOGhzZS9FMWNu?=
 =?utf-8?B?L1JZUUFVdUFMcVkxaVhENTZwY01GeGgzRTNzKzZjbjVKZGc3R08vS1Y2NVQx?=
 =?utf-8?B?ckNQdU45S1lNUDRCUzd3eTBPRlNITXc4VmRVejZneWgwaFF4Q0tybXNmZk5q?=
 =?utf-8?B?bTM4MHVrQjJCWTRmNUhLb1dubmlCeWdGdy9Ub0trb3NzanZNL3VxdWxlcnBt?=
 =?utf-8?B?NWg5dzNqdEhScVZ4N3QwTitMSlZIZndSVkRBNnZ3ejk0OWxUdko4NEpCanpK?=
 =?utf-8?B?VExsM1IrQTNWQWRzb0tLSm96VzBKU3k1OXRuVEFCT0R3b1dQS2RMSU43dDdM?=
 =?utf-8?B?QnM4cGRBM2Zqa2g1SkRIbzFUTGloVTNXN3ZQd3ZPMGkvQUZIVVhGbVVoVWRu?=
 =?utf-8?B?R1RFamhaV1lVRVl2dnYyWVdGMzFNbFl4SFFkYXlDTmhGTHhTeHFyOUUxZHFu?=
 =?utf-8?B?QlIzeHQwRG5VM0N0SmpoL1ZXVUNLa0JPWkZrR240ZnJXNEUwNmY2RUh6TjBz?=
 =?utf-8?B?SmVNdVNDNzlDVCtCN0RPNlhJYVovS2hldlpiU1lSTGF0L1Q2a2JSUXdtcU5i?=
 =?utf-8?B?T3k2ZkdJZmllT1BuUldHR29XOERIUzlDdExIaDdtaWJTdFRWUlY1aFlHNXJJ?=
 =?utf-8?B?SmJzTjV5MlBSdEo2ajVodklzSWYvdis2LzZpMzFSUTIrL1ZPL3o2Qng3ZE0w?=
 =?utf-8?B?S2tPRnM0ZFMwQ1ZZMG9qTnNGeTlKNTVsc25GL0VaUUJJWi9POEd3Q3FyZzN3?=
 =?utf-8?B?d1diWjZlbk04RE5kYjZDb215cXVzMm9vc0JBV2krVGRmd1R1enZaUGRUenhY?=
 =?utf-8?B?V0U0dDE3aFBxZU1BRWN0N2VuKzlESHpPN1o4UVVjRkU0ZE91YWVhWDF3MURJ?=
 =?utf-8?B?OGJ3WndxN3pncGx1bnllL0hkcVA3VDFSK29sVFdnOFpmZmF0bHMwYm1ZdVo1?=
 =?utf-8?B?RnNLOFBWN1Y4bGRNM2srWnFHT0s0QWFvN2l2d0xGL1JKdXF5SGgwQ05SWmgz?=
 =?utf-8?B?aXp2NUE4SFk2aE5jT1B3QlNvUXd2clVnYUd0ekFsOFQyekxtcTdER2M0YXh6?=
 =?utf-8?B?dS9UQXlKVnp6bTg4YWsxbjBJckJxMnl6SzUrcjY4WTZ3UXVmTjdZcFVhU2lQ?=
 =?utf-8?B?cm9MbWZDNnNEV0hYOHZHdTNzclpoRkNlTmg1ckNueXU0aVpydXpJZXIxWkVj?=
 =?utf-8?B?UE9HcmpMMm5nPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(10070799003)(1800799024)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NS83NzIrV0RTRjNwWmJFQ3VkcW5ZdmN5UG8wSUhseFVQWlQ5NmtYblRLWjFW?=
 =?utf-8?B?cHpjT01WdkpMNkc2Ri9lVURpMC9JY0RCa0NETFJZWFdYdURiY091UTZwblZw?=
 =?utf-8?B?TVhWUjMraUR0dkFsTE5EODF5azFRM3k1OXhMciszeklFUW16ZnB1elIrY0Jo?=
 =?utf-8?B?akVwTzIwdUdRYlBDaXBBV2FSWko5UHNjRGNUQUNnWjI5U0JLTkJ2Qk5ZUnR1?=
 =?utf-8?B?UjNmWVhrMFJmYXk1Zm92UVN6M2JTcEJnSklCak9WOXozdlhyc3ZJTEhTYzFR?=
 =?utf-8?B?UENBNjZYSGltaVU0VWxUblRhM1RZM1JXbTJnaHpmdXNwTkpyWnN6SmlMeHRM?=
 =?utf-8?B?dmYvSDZDRmEvcG5FN3NsMFBGUk5ha1lYQ0NldkhWM3QwcmNtNDQ0MUtrR2t3?=
 =?utf-8?B?d1hpVW5RNVNvZHYxcnB2SG9ObmlCbFlDeEFrb1Q3YkRJT3puc05aQjRNSG9l?=
 =?utf-8?B?VVRLYzNWS2h5Y2EwYlAwU3pxb3FQeUkzdFJQZmFuMkZvaEdNZFVETHdNQW43?=
 =?utf-8?B?WnR4Nm1zMmEvRTVnWjdmWXl2Q2FYS3htNFVlQlpCbGxHeGhoVll3NnRTVldh?=
 =?utf-8?B?ZnV6dGlvbzJCYTM5LzN6NENKSlRZUHZHYlJJamRiYzlUcTk4RlBweWVGRUt1?=
 =?utf-8?B?YXl3QWRObmRMTkxWSFJLYnI5MGlwMmdXRFcrTTJ5Tkt5d0pzdHVxMUExVkJL?=
 =?utf-8?B?ZHJQUDNyL1R3anlDUGtwNEJ0UElIUWNLTEtTUmFtSnhGcGhoVEVOZzdiMUJS?=
 =?utf-8?B?cWx6VUJiNVBjd3R5V1BtVkgySkI3Uy9reEpvem9ZaEFEUGlOcHIyYk01Q1h4?=
 =?utf-8?B?ZlpxbzM0M240R3ZlZldPYkpZVlJSTXU5dkdNV1pjOXR4bHlOY0ZhQ0QvcWdq?=
 =?utf-8?B?T0hXeWZJeDR6N2FnS2x3aSs5R1FHZUZGZWtCN0tiUHNFdmN6a2hLems0cm11?=
 =?utf-8?B?M2RVc0NkK3psdVhmbFlNTTE4NmJRTlpXVjMxTVYxQ3IwSlQxa1NpeUNFNXVY?=
 =?utf-8?B?RjJwN2IzdGhnKzBHc2RQejhHWmxEWEwvcUhpK0VzVm5Pb1lnMEEwZit4S1Zo?=
 =?utf-8?B?SUNJOVFSblhSZlp5QllQNGJvY0dPSm1UOFYzN2xHOUswQXVaQWhnWFpmWFFW?=
 =?utf-8?B?OVRsZ3p5cFlPVkR3M094dEw5bEdpVkY4cmpIQy9KQ2Q5MURnK3VISGVGYXZY?=
 =?utf-8?B?M3pUbzJML3J1S2VJRFpwKzVTWlUrbGNhM1hzNWN2VXEralBaU01KM3V0bXRm?=
 =?utf-8?B?eWwzbkxZQVkyOG1MVXlGU241VHdHL21sbkp3bVV0cUl4a3BnTGI0QWlpS1hx?=
 =?utf-8?B?V2tjUGVFL0FrL1NQQzFzcG1lNzFvd05yU05EV1N3azRvN2x5K2xXcHNHaUtF?=
 =?utf-8?B?akZ0OFE0RFZRV1dUTUpBeDE5RUZxS0pYdE9oZHlVOHFGbmJnV3Y3cStJTUJQ?=
 =?utf-8?B?aVd4b1FCbVE2Mk9JclFualFxeUMrQnRtb3c0YkxtS1poRUpGa3lEUmJDVE5P?=
 =?utf-8?B?bzhJK1ozZXE3ZU5zRTFXYXJIWmF3R2crSEE4NlBBc1NDcURZbitBdmVYZldm?=
 =?utf-8?B?MkV4NXV5YXdsTzFOa1I5SFNmTnRFS2hJUHl4QkY3NmZUaVdmNkQyK3h2WkFB?=
 =?utf-8?B?TEUwVGthZEt2eXBrclVTTzF2T21BdjI2ZFl1SGx0UXhXeTZkLzNGdkNsNnpq?=
 =?utf-8?B?OWFCdVhwZ0pYTEw0aTNNQm81YXFsb2ZXaHRvaGRIeFVWVlRVZW8ydUY0MCs2?=
 =?utf-8?B?QThsbG1wVEo4TVUrOUZmcTJ0UlVpT1A5S2lWMndQRGszako3c3FzaGY3aFZB?=
 =?utf-8?B?V0VldDE5ajZBdWhKMlROY0pTVDNGZzlSQThyMS9RZGtMeGFoV3lLbGljSnJ1?=
 =?utf-8?B?eFRnWWFWcWF2blRXN2FIb3lDNmRJY1d1ZlR6U0J0dEZ5NHN1dTdJZ3NIQVBl?=
 =?utf-8?B?ckxORHdCQnpDbDBZaTBnbkh6L3E0dVZLcDBXaVZlTHJ3OHhlelBqeFRmbUhS?=
 =?utf-8?B?SS83WmtXS2FZQ1MyTnJHMEJ0Rloxdzd0Tmx3SDl4RklsMktqSDFEQzgzQkx6?=
 =?utf-8?B?Vmpxb2hpNDRDKzNFMFlreTNJdlhZaUFRL29Bam1YaEE2VE5yajJJUzZPYjc4?=
 =?utf-8?B?MXZFaUN3L1lHTHJ5eTNyV0haOXVNSUtsTkxtZ055THdRNVRKYmlPcjZ1MWJl?=
 =?utf-8?Q?3MeANoyh5ft/E/5hWSiQZZc3RviUba6C7FPRNyvsZ41X?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0473ffc1-a0f1-4d39-3363-08dd9389c5ea
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 08:23:29.8246 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kXp/I/yE3Rmut9PmUItd9lbqbmC884g6k8rMfm9gzxJ3zMNJg+ute4Y5WnmK6rwK0cMXeOxcAYKNbiotc1E2UA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8962
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

CONFIG_AUXILIARY_BUS cannot be enabled explicitly, and unless we select
it we have no way to include it (and thus to enable the auxiliary driver
sample) unless a driver happens to do it for us.

Fixes: 96609a1969f4 ("samples: rust: add Rust auxiliary driver sample")
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 samples/rust/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/samples/rust/Kconfig b/samples/rust/Kconfig
index 43cb72d72631bb2d6e06185e1d88778edff6ee13..b1006ab4bc3c341ef8e25c9b8e865ccf23983a6e 100644
--- a/samples/rust/Kconfig
+++ b/samples/rust/Kconfig
@@ -84,8 +84,8 @@ config SAMPLE_RUST_DRIVER_FAUX
 
 config SAMPLE_RUST_DRIVER_AUXILIARY
 	tristate "Auxiliary Driver"
-	depends on AUXILIARY_BUS
 	depends on PCI
+	select AUXILIARY_BUS
 	help
 	  This option builds the Rust auxiliary driver sample.
 

-- 
2.49.0

