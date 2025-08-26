Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C9CB3527F
	for <lists+dri-devel@lfdr.de>; Tue, 26 Aug 2025 06:07:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2739410E145;
	Tue, 26 Aug 2025 04:07:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="UBQejHNO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2052.outbound.protection.outlook.com [40.107.94.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C982A10E2C6;
 Tue, 26 Aug 2025 04:07:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JOT5kz/zH+HTyIcXEeWHLEwBe1OGqflicbh4UnZISHaRlyxbY/6UE0rWGpVFQmrtldjBnPNWXZHW7QCgmNRZ1noOwK1WdgcaVTSE7VSXine3NM7pAmoS6V3RZrVac2t20DDaQoF5DR5lnW4hPLkLAOnDHmofvGPsbTVn8XeVxsQwrdaRbGpQZZ1D+qWDn4q+r6sHCAgQ8I74z0GwOgB1it9cs0CgqCbq+omGd4YOm9LVAmofrCyTArvgAs/B088ZrnYM+Bq2jv9hIhCoHhQ6yNzFOH1TLeSOINzzv1ceAV+dpHB2vjZIRPAvA7h67415VCnbQtlJleMdh/JJCSG1JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7YtMuEZXzYI3NcSFaqDpin5dfMWApImszw/XtzrsDmI=;
 b=MeBROw/3FfyUw7TxRv/Uox765WdsvRRtstmOhUlPLv0BfnOJpdsmE9VaJ+okEMSAYirwPrGpEHPAHxFJ7H4aF3mrxIM/lEQXnKSmB5Df5IjvooQ9A7RYQ/QE/BtKCQNMmecdMpaJQl80ai6mmCaMDjR3c3h4a2D/qDeHi/aukqg9GOcW/OtroAGTRAQBDK1rA6TWC9V2dgpHfg4iyqDJ8UPe6SMfDeYeJtK6XHhQshQER7JR5YX86ZdEGvqs2yDIKwvVP38hz+52M4EG3vthQ8yao9KfqPjxdRo4dlFaycGt8q+mEC6EokeyU4DcOhS8jbeMf3jbS4YyK6ifdmZt4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7YtMuEZXzYI3NcSFaqDpin5dfMWApImszw/XtzrsDmI=;
 b=UBQejHNOun3wLtsz/Fay6zHwFGlgFVrZokt1/GXRQstDk8y6so+5R1cEXmcTKX2eqac39Tj/7Z0vSXv0Ou+nVoTpmF8VELi2C9OnL7lzIGKBV8mkfIyd1Vmd3uYjbPLpxb8rGR0TB2QXwHj3/+pkPvXUregRyCrOzI2TrylEgCPhDjFMz0bKDJ/P07UVtdcPy628IvsUDyAzqbhirbDX/p0CfRlJYYtuvqgZQa8J6++VAA83MqkVmJLWNzr6e8P4/z+ShdZp2d9ktfuNRo5wgaQY/CHP4WLgLX1IbSWUqf7AX67AWYfCHQFmj/iKUDZ8nlhAtxjhhu++Y/6fW7s/aQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB7925.namprd12.prod.outlook.com (2603:10b6:8:14b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Tue, 26 Aug
 2025 04:07:51 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%3]) with mapi id 15.20.9052.019; Tue, 26 Aug 2025
 04:07:51 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 26 Aug 2025 13:07:37 +0900
Subject: [PATCH v2 1/8] rust: transmute: add `from_bytes_copy` method to
 `FromBytes` trait
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250826-nova_firmware-v2-1-93566252fe3a@nvidia.com>
References: <20250826-nova_firmware-v2-0-93566252fe3a@nvidia.com>
In-Reply-To: <20250826-nova_firmware-v2-0-93566252fe3a@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TY2PR06CA0028.apcprd06.prod.outlook.com
 (2603:1096:404:2e::16) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB7925:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d3a0bb1-1798-4e45-cc02-08dde4562001
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|10070799003|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NUNsSGRjbzVMVVlEZkwxWVVXKzVCUk9UMW9hRkRleXRDZ1hndm9Id0l3amY4?=
 =?utf-8?B?Ni83TFlVVjE2ellSYUVucGJkZndOWFg3OFB1MmpOa3ZLTkp6TjQwcWFFUDFN?=
 =?utf-8?B?SzRIT2o4Z2ZBcEs3SGEvUkU3M0RFNmExWGtZTTV1RmwrWTVBSTdONTJ2MzFC?=
 =?utf-8?B?VHVveEs3Y2xtQkl5bGpGbm9lb200RzRzTURvbUszSnZzNy9obTZRSXdMOFY1?=
 =?utf-8?B?OWRKajU3WWR5RjdmMjI5VTJQZldXKzVRalJRL2ZOMEVZUmxOVzBCVlBJSjl0?=
 =?utf-8?B?dVl4ck55S0s5d3RvZk5CNFkvRktnbXZYMi9GM09UVThJd0N1WDJKQVAzYWk1?=
 =?utf-8?B?OVNISnE3UkVXQjVUTE0rbG9qOS9sNGI3eG5jRFN0NDMrZW9IeXd1dXZVb3Y1?=
 =?utf-8?B?ZGJwWnpyaVY2eHZLUHdWc1kxQzhFVXUyUmhYS0p4TGJuTmtveWtLV2pvTXdT?=
 =?utf-8?B?VVZ6VWppSG5BWjB6MHh6Y0EwSXdXSXgyY2ZQTWtjNGR1U2VWWXV3VzREVEg1?=
 =?utf-8?B?cmhSVGdYWjhYc2dOcUNmRUNqK3ZxeEhDa25XZHgrZjNpRk1OQ1R3ekNGSXFi?=
 =?utf-8?B?d1dQeTdFZjlRb3Z1U1pienFTcjJ4UFdTbFJRY1lnQ2MxcDYwSXJ0Rm9zMWFw?=
 =?utf-8?B?NlVxZTl6a3dhY0VUMWQxR05ZYkFSelk0MWpMeWEvVmI4R3JNM2lNSWYrWWs2?=
 =?utf-8?B?UXlNb2MzenkxMHVWeEcvMDNVNENMd29ObjZkWk1zOFVpWEpVMGoyY3dvZlh4?=
 =?utf-8?B?RURsRVNhVEc5anpNTHZtbDJXVjcxRk1wQmV0cmlzbUt3N2VIb0YyZHBrcnd4?=
 =?utf-8?B?SE5XUlAvQlhwZjM1TzJsN1ZtSk9UcnllbSttYVc4KzlZeklLdXhITHZuSVBr?=
 =?utf-8?B?Q3JaUnNwSkpibGJ0TkZpeWZMQzVjSG4zblpyRG81aitZV1huaTFlN2lNV3JN?=
 =?utf-8?B?TVJEWk5mUjVidWZOdlNocDRJNFdZT09ramQvQ0lDUlNWNEcrS0Y4VHBQY3Zp?=
 =?utf-8?B?V3pKeGZPTURSSjcxZ0NRTmdXbjZyUHIvNC9jSlA2TE5DM1FQSjAyWm8vYnl2?=
 =?utf-8?B?OUVDV3lqOWUrL2J3VDVBN0tQVXlidEpoTGhUUkJmbFkyZ1FUWGQzOXF0ajlP?=
 =?utf-8?B?MEtVb2puQVRyQ3B6L0hhb2tadVFYRlR6QTdFYUNtWG1hcnk0OHVjZU5wbXc0?=
 =?utf-8?B?V3d0VGdUWkVIYjVZeDRXWC85azE0cDlPaDd2QThvbTFPemFSRjB4cEZuZ1lK?=
 =?utf-8?B?YmJiZ2ZxVEJ3c1BuMVpWSzRaNVRoZFc0YjFPVE9YQ0ZUeEhVaFc3SjI1c1Jn?=
 =?utf-8?B?SUIvR3plZGhJend5dUZFNXJUaC84R2Z3ekgxMTlRWWc1VVhLUVZBd2d5bjRo?=
 =?utf-8?B?eFFhWGJUZWhxTU1IWittd2t6QUY0QjBIcUJReE1jUWpkaFhHdzRLcnhkcmlz?=
 =?utf-8?B?N0NtTUF2cW93OUJGbXh2ZlVOZUxNK2hnZWVodGs5QTBoN0J3TDR1Z1RSamk2?=
 =?utf-8?B?N0pUQXROY3l2UldyRWJkL3BwTkc1UHIycEY3NVBZNlUrOEpRb0pvZTI4dC9O?=
 =?utf-8?B?dnVvMlhaaTZ2MmMzVFNvU05kemt4MTAvWFJpdmw3RlBISkN0RFhQbWc4OHFM?=
 =?utf-8?B?TTlXeTBxZ1FrUFFuU0RoTUk2Sm5xQnZvZzVqSjVQYTZ6RUQ0eWhLb1Q5WnJK?=
 =?utf-8?B?N1YwWm5VbjNWTCs3eFp6YVJxVU8vRWxOU051Wmp0RStiYjdEcTYrT29BM1Ba?=
 =?utf-8?B?MFMzcGc2clVScm9BSkhNQ0s2Mkt4c1BTK0RYa0dNcy9HcU1TMHlZSVpLcDhw?=
 =?utf-8?B?U3VFZVRydVVFOFVkemRBY09ETjhMU0ZmSkUwbmp2ZEdHTGJyb3ZOK1pyUWF1?=
 =?utf-8?B?VXg3TmZhdEh3ejQ4WHI3bW5RdEV6K2piZWhCZ3dFQVAzbldqTCtxRlFna1gr?=
 =?utf-8?B?aEg4ZG55c2RFRndDYVk5L2lVN0owMVJUdnlyTm5VUGRoRExMcUlpd3VtN0px?=
 =?utf-8?B?VnFSZVR4d01BPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(10070799003)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cXMzaUo2ZEpyY3JaZTl2QVEwOGJaK3NSWi9iSUZJZ0NtQ2h1VUQ4ajZpREtI?=
 =?utf-8?B?TTFuWndHeDg4SnRyQU5iSWl6RXVOOFdtcHI5TGVRWjQyaUdHcE9URndIb0kr?=
 =?utf-8?B?YjhJTjVlR1VJd0pnQkx6SFBOUFA2SVgwSkVqUGJsam41QTZjc01GV2p5Z1NO?=
 =?utf-8?B?SlY3Q0gzTU94bTZUTEc2MXFydWNTczg0aU1PY0hQSHhOb2NLbmh2bStaMDla?=
 =?utf-8?B?aHl0ZHV1OTFva1Y1ZDNFVkp1Y0FjMVRhdWJFMStOSkVYVkhGVzBjcGVWT0pj?=
 =?utf-8?B?b3loUmZoM0pCMzNQMUlCYU5qSzM3SVNmdmlTWldzZ2xKbGRJTGpRSEFFNDB5?=
 =?utf-8?B?Y2Qzb3JIV3J4ZVNwVkd2MDgwY1VJcTNCYkRPWEowd1FpR3ZVbFNMSHhLMWJS?=
 =?utf-8?B?RmdMeDBzUFBTcnN1WGQ1MjVrUzllbEM1ZExPVENVWmdtQldkM2RUQnpiZEEx?=
 =?utf-8?B?SHRHMnNjMGNHc09tUlVhcTRLN0VkRHRaMEMrUDRpdDR5dXMxYmRubTNlMXNW?=
 =?utf-8?B?Y2VwUDRyUW1ub2tnYWVCSjVnZHhrTDF0djdMZnVhVGZCV2tPbTREemlMOVo2?=
 =?utf-8?B?VktDUlIzdXpBV0hVWDVwWjJPRXVMR241dTVhT2hNczE4elBVR0pPR0FVL1Aw?=
 =?utf-8?B?VkZoeGxFODUrUE9zNm1WSE9uL1N4Rzl6OFk1SDA1enB6QUlXZFpvbzY3WVRj?=
 =?utf-8?B?TmNDTi9HS3ZMNGhmUURyalM3RWZmREk5VUtVbnV3ajhiNEJ5Qlhsa05VUnNu?=
 =?utf-8?B?V0ZtYTdoMEZFT3I0Q2FjY09JM1YyZS9xL0o5bm5ra3RKVnliUi95SFc4NitQ?=
 =?utf-8?B?eFlWd0VyWFUxLytNUjZPV29RQVJLcU5YS09nMFplTGgwZGl0L1c1R0tiVC9Z?=
 =?utf-8?B?T3JqK3RVYmhTMUNkZG5UMGZDNDVpbkY1T3RUajYyZXl1Ky9zTVY0K1FRcVZE?=
 =?utf-8?B?SGkyb3RiWUcyZjVnYjNsTlpvUVBaaHNtOGQrNCtBandqWTRJeVk4V04yMFpQ?=
 =?utf-8?B?ZmNZVWdXZXJmdVQ1THZmNHJNcFlEM3d1N2ZZenQyWStPQit4cXpqVHUzTUF6?=
 =?utf-8?B?Mzc0ZVJjME5QWTRXdWoxbEpKd3dKTmIreGJ3QjhmS2EwTFRUTnQxZzFHd2xn?=
 =?utf-8?B?QlB5ZlEyUFRZWHZranpaWURaY1hyUEwxbCtzc2Z3SnZSV2hXajJXUXlMRmR5?=
 =?utf-8?B?SlE4ZzVLcHM4bXBYR2JEcWZBVFcxdHlzMWhFdDZxOHRaMEZUemxaOTB2TSs2?=
 =?utf-8?B?RFg4Sm9UdDlPL0Rqd2ttWlFCRHRpWVZRbnBTbEZjeG4rYlNpbytpYUh6d0Uz?=
 =?utf-8?B?VEFoWlJZWUxSRUdrT3NSVUVwNUNMOU5FNkhDa1BhYVdtcDRCV3NsdFFWTmFK?=
 =?utf-8?B?K09oNWhVMng1ejFSaWdpdWRyZWZ0eFRTNmhqcWdycjZ0UEhIUGs4NUFFUkFM?=
 =?utf-8?B?bVZsZDRFMUM5c1c2VksyMUdaUlVoMU9za1hVSXRvTEk0UXJ3dEtZS1RCSkNh?=
 =?utf-8?B?NXNkbW5COTdIRHUwMFplNHBVaXVQamJxcW9qUS9GQWVtRHF2SzJ1aHdiWnps?=
 =?utf-8?B?enhWQjhtcSswY1hVL1R2MjlsM29tTGxnRE4xZ3ozUVdCRGlRUmtWK0o2ekN2?=
 =?utf-8?B?N0tvM0RKT0JOeFJ5eUNJVDFjYmw5RjkrTkxQdGtRc3AvbENzQ0VIZ3R1WkMv?=
 =?utf-8?B?eXQxWjV4eWxPU0VyVWNhSmJJeWJDSFlPakpVS3pCWDREbGtBQmR4bHQ2bUdQ?=
 =?utf-8?B?RUhxc1NTUXFDRVdua0dOM3pScUdzZUJhdUVoU0x6OVBvbmR6alRYdk0vRXVX?=
 =?utf-8?B?U3FpWXVZTEVmK2VmTlA0L2hMTXM5VVJBYThvUG13a1JrS2NFeWZOVzZ6M0Z2?=
 =?utf-8?B?T1dpVjN0UEdseHdtVFNqbExLK1VXTVRtb3hnSTA2R2VlWUVXTjB0Wm5sZ1ds?=
 =?utf-8?B?TW9qTHltVkIrUzJVU0lETE9aVXcrWHJORUd1Z2JEakl6YjY1eFdCQXFUWk5h?=
 =?utf-8?B?UVNpOTZWWUlaWmI1R202Ni9MRVlCcXRacTZpM05vWmpXQ3NGNGpzVzd6c3Bs?=
 =?utf-8?B?MkpWcmF4aTVXU25ZR0lRSGpIRnA1NFA4aTVPbTZnNkpkRklUbUZEc3F4WFdW?=
 =?utf-8?B?cU9YTDhxa2p5OFFvRnNtc2l6VExxNEJxRkFXcXNRUENRM3ZQdml5SEFYWkcv?=
 =?utf-8?Q?tOB+mFh+ITFFdBXGwPqhEx6yvCVuMi/luqHgYr1mhn0g?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d3a0bb1-1798-4e45-cc02-08dde4562001
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 04:07:51.4734 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ki3C84GIyfcDs0xdSufSjM3m/CZhNVcrHOAQIQo6ySWuX8Km9swOrkRFbkFc986zjpq597AJhno/hllsMjx/4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7925
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

`FromBytes::from_bytes` comes with a few practical limitations:

- It requires the bytes slice to have the same alignment as the returned
  type, which might not be guaranteed in the case of a byte stream,
- It returns a reference, requiring the returned type to implement
  `Clone` if one wants to keep the value for longer than the lifetime of
  the slice.

To overcome these when needed, add a `from_bytes_copy` with a default
implementation in the trait. `from_bytes_copy` returns an owned value
that is populated using an unaligned read, removing the lifetime
constraint and making it usable even on non-aligned byte slices.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/transmute.rs | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/rust/kernel/transmute.rs b/rust/kernel/transmute.rs
index 494bb3b1d059337520efef694fc8952972d44fbf..721dd8254dcedd71ed7c1fc0ee9292950c16c89e 100644
--- a/rust/kernel/transmute.rs
+++ b/rust/kernel/transmute.rs
@@ -78,6 +78,23 @@ fn from_bytes_mut(bytes: &mut [u8]) -> Option<&mut Self>
             None
         }
     }
+
+    /// Creates an owned instance of `Self` by copying `bytes`.
+    ///
+    /// As the data is copied into a properly-aligned location, this method can be used even if
+    /// [`FromBytes::from_bytes`] would return `None` due to incompatible alignment.
+    fn from_bytes_copy(bytes: &[u8]) -> Option<Self>
+    where
+        Self: Sized,
+    {
+        if bytes.len() == size_of::<Self>() {
+            // SAFETY: `bytes` has the same size as `Self`, and per the invariants of `FromBytes`,
+            // any byte sequence is a valid value for `Self`.
+            Some(unsafe { core::ptr::read_unaligned(bytes.as_ptr().cast::<Self>()) })
+        } else {
+            None
+        }
+    }
 }
 
 macro_rules! impl_frombytes {

-- 
2.50.1

