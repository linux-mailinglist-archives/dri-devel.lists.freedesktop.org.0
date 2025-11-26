Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 441B3C8BEF7
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 21:57:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FE6010E68E;
	Wed, 26 Nov 2025 20:57:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="GQ0AawDy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012012.outbound.protection.outlook.com [52.101.43.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73D4210E61E;
 Wed, 26 Nov 2025 20:57:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FvZw4c9yk/0P2FXcR2g07vmnDXPuJZjB2hpD40bd5u3Gz6Yr3o2Fd6SFZQ5a/z194iafX1AB+H7IffrjmsRQdL0tWbKpMxu0/A8yCvLioyIys3bgxDoVqK+HlJT2zIXsUxQdmtJ7MMIqOaKIkee4izd73CqH7QNov1doLk7ImbaRQNsmaZiw4vlyLlpb2jbwkjjzpS6euOYilgrS3SfTHRun48dVAKHa9MlhbBN3V6CPRjIB8K1+eSpygjARoaV8xvfh+2o/+/DclyHS3XJeyd1J7Q/H3CMUDkdGvL+zahCc0Zo4nl7TNVIwW+bx5/MwOltzWNfFSgdqhF13suHA1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UlZr6fAnZt3nLSRj/m86gbvOdh28OOhoQD2EGfsoNbM=;
 b=J/qUNiRLQeVpW7f9iV6UPiUvv77/TtlMa5NqDhHUMDxpwjt8Pk/x+NqGMqYxqFX6wXsum5ImFn4nCgp363/pvSP3mm32jgqzjn9c2R5zxGrEKRfaFNeD4ERMbwc7t9wNDcLoaHocCWfD5GeeH/DHj8GAIkoj2uZi6bbzqoTF5hv9Zs0ASwDWnr2pZaubfL3SrewMvNQRGQ+MudMC6x1XE9IiuPRBILUVqS6ZtIEBUVeN1yhUzfvqdLciLWeTLZ1O4XSCX34j9GYhPhYAfTKatg5iOIkRMGG2btZKXDZpqIPdnAUpqOH4wI9aGPNho/nnDW+VdQxbjFD7eP/edEHCZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UlZr6fAnZt3nLSRj/m86gbvOdh28OOhoQD2EGfsoNbM=;
 b=GQ0AawDyJgm5M5BDTaM6/H9FFFiXfPHCkbjfNNMsKc3gSyH2Zg5UQOndvBt6iB6Hmcf/0QGn5WUyyelgx28gdEGMSDsGINUFlS7NsILbeX65kyic+dtcI384gASckARuGCRGTg8swS/OiGru0McxGuFlvM2wIzf1bsqXlomzmc49ISg6qzFjaUgFLOXPubTVFo0ROcwgwEyGZmkJNXzTCBlL72zR4BsBcqe//He2M/thaN+lhveMgCdmN1nhKmc94CUp74bkcx3oacbWFPBMttnMC1t7uyQsdCsCj4qX5CAfLuQ12ElP9EFUDE7w+8YZuTw/MzlUdVFKe/N7KwmILQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH0PR12MB7814.namprd12.prod.outlook.com (2603:10b6:510:288::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Wed, 26 Nov
 2025 20:57:30 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9366.009; Wed, 26 Nov 2025
 20:57:30 +0000
Message-ID: <03003f10-00c0-44dd-b9df-5763cc1e715f@nvidia.com>
Date: Wed, 26 Nov 2025 12:57:22 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] rust: helpers: Add list helpers for C linked list
 operations
To: Joel Fernandes <joelagnelf@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "dakr@kernel.org" <dakr@kernel.org>, "airlied@gmail.com"
 <airlied@gmail.com>, Alistair Popple <apopple@nvidia.com>,
 "ojeda@kernel.org" <ojeda@kernel.org>,
 "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>,
 "boqun.feng@gmail.com" <boqun.feng@gmail.com>,
 "gary@garyguo.net" <gary@garyguo.net>,
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>,
 "lossin@kernel.org" <lossin@kernel.org>,
 "a.hindborg@kernel.org" <a.hindborg@kernel.org>,
 "aliceryhl@google.com" <aliceryhl@google.com>,
 "tmgross@umich.edu" <tmgross@umich.edu>, "simona@ffwll.ch"
 <simona@ffwll.ch>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>, Timur Tabi <ttabi@nvidia.com>,
 "joel@joelfernandes.org" <joel@joelfernandes.org>,
 "elle@weathered-steel.dev" <elle@weathered-steel.dev>,
 "daniel.almeida@collabora.com" <daniel.almeida@collabora.com>,
 Andrea Righi <arighi@nvidia.com>, "phasta@kernel.org" <phasta@kernel.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Nouveau <nouveau-bounces@lists.freedesktop.org>
References: <20251111171315.2196103-1-joelagnelf@nvidia.com>
 <DEHV08MPF9CH.1GZAWEGC4AVF3@nvidia.com>
 <095D38BD-A8AA-4BC3-8C24-9454964EB8F8@nvidia.com>
 <DEI89VUEYXAJ.1IQQPC3QRLITP@nvidia.com>
 <F3A7E1BB-883C-4EF4-B245-8E9DD329131F@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <F3A7E1BB-883C-4EF4-B245-8E9DD329131F@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR11CA0108.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::49) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH0PR12MB7814:EE_
X-MS-Office365-Filtering-Correlation-Id: eeb0c523-76a3-456a-91d4-08de2d2e69b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S1ZSdjlaazNoY3MvUGNaemhNSERMdnNFSkNXL2R5M1Z3cXQxT2F5L24xUmFm?=
 =?utf-8?B?cTdwVjlQaW5LYU1WOGJWMldxRjZtS2E5d25MQkpYSGxBekE0ZjQzd1BMZFZL?=
 =?utf-8?B?ZC9TZ3ZtdWxob3ZaRkVMVVZoQ0hSTmN4YW5NZ0U3aytKTytmQ3YrdDNFSmFj?=
 =?utf-8?B?Vk1WUnI1RnBHRXMzcnNCc2M3UGUrbXRXTjZDbzNicmxGSTNMNHR4c1U4ZFpG?=
 =?utf-8?B?S0NaWVVKR1VYVVZEYVo5ZVpUVTQ3OUZUU1BPSVBPY2Z1VGtyOGZCeTh6dld5?=
 =?utf-8?B?SDE5eG5wejg1QU1oTXJYZGZ3ejVRN0FZZVl3cStaUjZybmNHTlRPUVViUWRl?=
 =?utf-8?B?SWswdTZ2ZENlUDVLTnNDbjNHZytuM1dBVktPVGRjL0hBTXFIVVpHRjVXOVFq?=
 =?utf-8?B?T0lPTGF6OFBneFB6eTVoeTc3RjJYd1k3a1BoQTVlWDFMU0hXN1VlU2crNTg4?=
 =?utf-8?B?Ny9NWG9Ma0RiOXoyRndPTUxJTlE2cE9QYTdoV0VsQWdUbDlzSEFhYWVxcXNa?=
 =?utf-8?B?NHFFeStMUnZkTWs1eEk5OGM5K0Jvd3RMN25KRndwbnlHMHgxdU16MlNhemQ3?=
 =?utf-8?B?cjJURk9GQ2VtZG5yRC9zU2xNd3liNHVoYUcyS0g0Q3FtblJjb0gxUFJMWGZV?=
 =?utf-8?B?ZkUvbGdVRnVIbExEY0M3RTRvdzk4NTdFZUhzd05MalVvaUgyMjJ6VFhmWnZJ?=
 =?utf-8?B?Uzl6cTdhT2VEYVNOM25NZ3FseXEyMVBGTGN5RDZsMzlRUFgrUDhJOFV1ZlhR?=
 =?utf-8?B?b3QxcndPKzJzWlJ6akJJUXRVeloxTzVPSXFoci8wUzduSUtuUXdkaGVXV1gy?=
 =?utf-8?B?YUk3QVVyNGJhdVdIZ3dWZTFOd0ZNcVhoUWFsMmZ3MkFQUEh6Z21uMGw1Y2la?=
 =?utf-8?B?KzVUR0FZU2lLWEdxanJWRGRwYmRSMzAyVXpxdld6c3YyaWJtTUlzSTV4TENF?=
 =?utf-8?B?YkNGN0dYRlcwNUhVZFpBSFBoV3AwbXAwV1FIdnhxVythS3BzWjVoWHdmV05s?=
 =?utf-8?B?M2FxRmpqTDRWVVNVcFpKUFNqK0ZTdUhPSGNxUzR6RzlZMGlYVFYvRFR6ZUlD?=
 =?utf-8?B?YjJ3TXBYN2JPTUJxMi80N1VSSytEcU03SHNCR1VGeWQ3UElib3BJZjdzNGkw?=
 =?utf-8?B?RVRONTh3QUFtYzNETFVIN2ZlNU5nZkRSMnNyNUlPNkUvbmllMkU4QjduMEdC?=
 =?utf-8?B?WDZlVjFSa3ZheXJBVGYyZW9Md0x5c25zZUZXZEN5MWNYTVBiUGE0ajZvQncr?=
 =?utf-8?B?QmJnVUZoVC9paWNWVjZhRFZuVTZMUzdyeDFYWG1CL2lqZkRDbW5vSlVraTF5?=
 =?utf-8?B?SHJ5bDUwSTBMdTNBUUZNaytMa3BRakhpQzJKVmQrbXB1d3V0T21SZ0p1dVBD?=
 =?utf-8?B?RzNrMU12bzBUYmxUbXA1VTZwWDU1ZjYvNDUwZURYNXA2WDJFZzFXa1NaUFhU?=
 =?utf-8?B?NDZxdVBtK245UThlVzQrZnBScjdpK1ZVdWZXL3JxWHV1TGdBRHR0QVpOT1lp?=
 =?utf-8?B?aWVob2lZeWJEQWphS2hUYVptVmVEYzFmSEZsZ2FnNHF5N2hwZ0NwYVhEQWJG?=
 =?utf-8?B?TndSVCt4L25xV1dHdkcwUCtLNHFNRjhkOCtRd3JTekRzd2tJRE9Ob3BYUTFz?=
 =?utf-8?B?VHpxbkZzS3c0bjZhbW5xZGJYYWYzRzhNSjFKeE1RdWgwTnF1Tm1iOEROcksv?=
 =?utf-8?B?QllVazRqem93ZnRabDU0WWp2a0R3MTlIS2lDWHVwTjRmQTVDejU0a1NDZzJj?=
 =?utf-8?B?M1hpenpOUktyMVBPZjk0bUZEWWZlUmR1R2ZHM25oQ0doNmI0YkZVWThVbGVt?=
 =?utf-8?B?VmNiN1kxaDBRL3NJQ28xY0xxZXNHd1NCRmNLcGJ5dnNYcmUwKyt1dEpZSW00?=
 =?utf-8?B?cEl1RzVISDYwY1VHdVhYa1ZPVVJYNjE3M21LOWVYZUpqK3E4bUhFdzlWS1hN?=
 =?utf-8?Q?Ngng7dFSTaUIMWkpZAwriMUI5xNfAFEF?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SU9DYXRSc2tpNGUyUHdOeXlJVU5sdDFWMmQzNXgxcTA3NEJ1T2lhTnBmMFp3?=
 =?utf-8?B?TTdCOUJJWlhBRUN1aGFrVzlHWEVBdllFckZYRFVTYlcyQnducTk0UGZoZldN?=
 =?utf-8?B?WEpwL2VkY25pTGZranJoWkwxSkJ1ZDdMOUxjdDRRL3hLSjFXSXpENWpRZnBm?=
 =?utf-8?B?TlVZNmF5SGN0ZEp3YzZuY0trN2VCR2ZzalpBQXgvS0hOVnJUYnpNczBVTmlz?=
 =?utf-8?B?RitoemErTmNtd2tuZElQc3oyME5aNW15OTI0dVh2c0xqaUFxWWRBRkdMRUk2?=
 =?utf-8?B?MGw0SXN1dUFxd2tHWnoycndjOExmczNtSUpUSzUwbmpiWFpNNjFMSTRCQ2I2?=
 =?utf-8?B?VjVoYjE5N1A4ZmtESGtZcThmK3dvajFDNGtDV1dCbE15bFMrZWh6d3RLOXZT?=
 =?utf-8?B?dlJKYXlBem1hWUhOdzVLV0V2S3JObHlCTjlma1Fqc0Q4WXphWlBLNTRaN0xT?=
 =?utf-8?B?QmJpeW5sZFJPY3VKSUhPVlZ3dmRmcnJyQm5DN2orcG9yYjEwSkg3bHViellU?=
 =?utf-8?B?dURjeFk1ZDlEalpHd2VBRElGdkRRWnNGSHBLSEdoQVdLZXBNOTZ3NGpXZDZn?=
 =?utf-8?B?eHo4Tzh2QzllVGI1Z01VNmszdVFlZFVVMjhKeU5VcXUzeGcwM2ZrNEJmdDhp?=
 =?utf-8?B?OGdpdXh4aEJtYi8zWGNHa3ltZEJ2cVUxbUJDdXhDYzBrcHdNc0Uwd2M2NkNa?=
 =?utf-8?B?Z0Y4bUdIVU50b1FpeFkwWUQzWFFRSnptcmwwdGFHSlBybWVYamhXVEM5L0Z5?=
 =?utf-8?B?VlVxMnBLMFpkbHRwcEgyQUdnQ3BqbmM0UFhsQ1dCMGVPK3ovRjAxN0JRVnRU?=
 =?utf-8?B?b1AxbUx4dGFtUXFSQnNFL1pkZUlyMkl3VHNaeWxlU1B0cnhLNTZBeGpyYTI1?=
 =?utf-8?B?K3hEWFRjb1krNGNpRmtGOVFlcndaclkyUURVQUZ6RTc0WENQZk1HeFlObENH?=
 =?utf-8?B?c1FmT3lMcXJrT3RoQnlscHhSRC9BL05IbHo0OHlSMDh2RkhVN3oreC85WjRF?=
 =?utf-8?B?bFEybzd6bCtQTHJYY1loc1YzR3gzMDFKWmljWkx0T0hDdHNXUzhSQktuMCs5?=
 =?utf-8?B?WUp2WjMvK0tjVFZRYVpIZ3V4SkZRUmNpWXozaHlVVE5ud24vMGNFcUhyZVhn?=
 =?utf-8?B?TExyelgzUjVWR2tJYVY0b3FXTldvQzFpUm42aXNHQ1c3TnZJU0ZDNmVDeXRw?=
 =?utf-8?B?OTI5c0RSZGhuUzRXejJOUnRBUitwMXgyTVRuT3pwUWZPSHhaS2NmTGlkN1gx?=
 =?utf-8?B?V2xmV2tHdWw0TS8zV3RGSmwyZ0VONHVmYjc1anJkUjIzZUF0dE9uQm9pempM?=
 =?utf-8?B?WjRScFd6RnBtMzRrM20vWk0rQ05sSUNydmNrTGpVcVp2MExGcGNENUFEbXJw?=
 =?utf-8?B?b3ZyOTBNRWFoTFhrQnBoVWliaWVORTJWV0FFV1hwbjlhelQ1dWZjbHY0a1Vs?=
 =?utf-8?B?aXdOQVRKMklwQkxVRnFnV2IxbTE0MFk5MStWdUNjZ3lYQWJqeG9rai9ubzA0?=
 =?utf-8?B?a2E2QVpHSENjUjRRVVRaQkVKcVp4MWhYZmRzQ0RORE8vYXdlL1k3Qmx6WTJC?=
 =?utf-8?B?OFpOSGw3TUJHUElxL1dtSTIrVW8vOCtWNEc4TEVPSHp0OTg1bFNpMzFPRnJU?=
 =?utf-8?B?L0k0VDRYZUpWaGlyeVVJbW9qQlF1QjhQWWtWcmlJYXJ6UzRPZmZpY2xqNzk5?=
 =?utf-8?B?SGZmQTc3RU83NEh6T1NOV0J1VDhOQlVXWmZvenFKaTJRVVdrMGhTaXdFcmVV?=
 =?utf-8?B?cm9PSSs3NHhSY01UOU00aS80NlRWTHNrVzN4Zzd4Tk5VR2tDdEI0VUluaUM1?=
 =?utf-8?B?eWJudnMwa0NidTlVL1JWbFZrZHB6VjFjRDhPalNXazBsS2hCdEZSYVErcTU1?=
 =?utf-8?B?QlhVdFpYYjdES2w5WnljRWc0Z2xxd1lEWDlMRE9KTWhMME1LaEFNNzJQMzBS?=
 =?utf-8?B?L0VTN0NEelI5b0JhMFJFdHVRTVRUZGY1UXNnUXVvLzVjNkRxM2s1a1NxZmdB?=
 =?utf-8?B?a1lWakk3OHlSQnB2Zmd5SmVNcmdha3YzVGh4TG5iT0wzRmMrY3Bsa0wvT3V1?=
 =?utf-8?B?NWpnakhybHEyMWZSbWlsNlNHMmtKQjhZaDZoWXFCS0g0OEs2QXhjUGFGTjhQ?=
 =?utf-8?Q?JgsFm1Ty+M3idwUYSQY9tcOdl?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eeb0c523-76a3-456a-91d4-08de2d2e69b5
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 20:57:30.0422 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9h3YU6dEOtTMqiyI3R2T7gGib1rcsWNT5R+r50c6uUpmey79R14lCudjDPmE6UTuEKrr1pRe0VJp0CDBj+PcKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7814
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

On 11/26/25 10:50 AM, Joel Fernandes wrote:
>> On Nov 25, 2025, at 8:16 PM, Alexandre Courbot <acourbot@nvidia.com> wrote:
>> ﻿On Wed Nov 26, 2025 at 3:16 AM JST, Joel Fernandes wrote:
>>>>> On Nov 25, 2025, at 9:52 AM, Alexandre Courbot <acourbot@nvidia.com> wrote:
>>>> ﻿On Wed Nov 12, 2025 at 2:13 AM JST, Joel Fernandes wrote:
...
> You do have a point that we have an abstraction leak anyway, so the question is do we need helpers at all.
>

I'm writing this in order to suggest a stance in this area, for future
feature tradeoffs. If this is somehow "off", I'll upgrade my thinking,
but at the moment I'm very comfortable making the following claims:

 
> I am torn on this. On the one hand, if someone changes how list_head api works, then the rust side breaks 

OK, this is not going to happen, at list not without a truly epic, long-term
effort, accompanied by *lots* of publicity. The list_head API is just too
foundational to change easily.

It's been stable since *at least* 2006. The only change since then has been
to add WRITE_ONCE() wrappers to the INIT_LIST_HEAD implementation--and that
is not an API change.

Anything is possible, but this is sufficiently far out there that it should
not count for much here.

(though that is easy to flag though via doc tests). On the other hand, we have the function call overhead you pointed and we are dealing with the pointers in rust directly anyway in some cases.

Whereas this is very significant! We really, really do not want to accept
a performance loss vs. C, without an excellent justification.

So I think you've made the right decision. The above is just to help
solidify the reasons why.


thanks,
-- 
John Hubbard

