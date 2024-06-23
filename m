Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72517913E05
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jun 2024 22:20:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A6CE10E0BB;
	Sun, 23 Jun 2024 20:20:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Adx9tk2w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2060.outbound.protection.outlook.com [40.107.237.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AD9510E0BB;
 Sun, 23 Jun 2024 20:20:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gEn33H5dhVbX00B37F6NEjUaiFRg3UvEPWfCSatN+d9I5/uOMgUYUwgFmED4/qKtO6PnZM52wbKUei2VX+e/bWMAH92ZDXQ65z5tTwGwsk9WkT/bisZVEJtG+LC4AgnByceIsIdaflUtSQiCiIWhxXZShGhsEC8cX3EvDRCCPK9REJaD2QJEl6nN7LCTcoxnoU9HebGWWSqPTDOO+WHTESMSvpraKZm/nc+X8LURnP/0MplDv06LuiecWmDA6l+3ywz5L5XoEX7xZKQicAQu6VRhFDdX/HKwwb2lPqMBmthAQNqHFVINGXVufFXkZDq6OiXDRT6ALa5P7GqS4sg5fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+xueVwbkm/ZM+k5DyGO1NVwXirQ4y8mcVbsBNDM8DM0=;
 b=DzGaP16q+voBfE6SlWYK1s0DznRXR/ZjPmdGNKvxca2hKK6i2MvXKcbM7mR6NMImDSuxLYL9rgOXM9bC+60vSz9mtpE6hnhokixLZwneVDqSOlIc2AWnZQC0ht+b2IS7udxwQgiCsD2G1avRGjUxvFwao06DqUynm6VyY/401odnNAHRYQY/fTTB4+4+/qg/2IsbIXMefZgMJjJeRsuZdijxnVSYGq5zDgLsbJon9QwNq56xMGw+A0rnJn5XmErRdYFF7lnEPjWqPqnvjx5u3Tc2GHr75AuNVDAZ4nr8Ozy5+gKT7c7QYlQPXYjaK5KkRMPwDPMaPsGu9Nyb5VimoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+xueVwbkm/ZM+k5DyGO1NVwXirQ4y8mcVbsBNDM8DM0=;
 b=Adx9tk2weRZ9WL1YVIaYpvUDFHI8CQmkBRLdKDagqcYwz0JD20MZO9IzzkubjJ6EUhRfRMYoZ/+8MUckCXVDZxCQTxAybUr2ak13TDmqw6eHXmAXyTtXTjrzLEE1cwv2IgBR4goyIlxcgD1DidG8KZciN3NaBNXBLlBtJ+pwetE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SA0PR12MB4350.namprd12.prod.outlook.com (2603:10b6:806:92::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.21; Sun, 23 Jun
 2024 20:20:25 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%5]) with mapi id 15.20.7698.025; Sun, 23 Jun 2024
 20:20:25 +0000
Message-ID: <efc9165d-856a-44a1-a93f-e7467cd2cceb@amd.com>
Date: Sun, 23 Jun 2024 15:20:21 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] drm: Add panel backlight quirks
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Matt Hartley <matt.hartley@gmail.com>, Kieran Levin <ktl@framework.net>,
 Hans de Goede <hdegoede@redhat.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Dustin Howett <dustin@howett.net>,
 Matthew Anderson <ruinairas1992@gmail.com>,
 "Derek J. Clark" <derkejohn.clark@gmail.com>
References: <20240623-amdgpu-min-backlight-quirk-v2-0-cecf7f49da9b@weissschuh.net>
 <20240623-amdgpu-min-backlight-quirk-v2-1-cecf7f49da9b@weissschuh.net>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20240623-amdgpu-min-backlight-quirk-v2-1-cecf7f49da9b@weissschuh.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA9PR13CA0014.namprd13.prod.outlook.com
 (2603:10b6:806:21::19) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|SA0PR12MB4350:EE_
X-MS-Office365-Filtering-Correlation-Id: 27df4c6c-72d7-418c-6513-08dc93c1eabd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230037|366013|1800799021|7416011|376011|921017; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z2Rxei94U0pLQ2pCZEpMem9jSGtiVUhpZ1Vsd00yMG9ZcHk2N0NONWp2RU1W?=
 =?utf-8?B?V2UzYURGQVg5M3h3dDliOE1HS2F1dXRVaXh2Uk9QNHRRdzNWY1RkQ0x1QXN5?=
 =?utf-8?B?TWtaUHpvN01nNHhtTXYwc1VRNFFDZHdaUWFtTzlyLzFCdllxclQrZTN4QTE1?=
 =?utf-8?B?Z2ZEK1MyU2g0REhURUlSU2xES2JoaW0yUUFpblRnYy9SUmJaaGVRQ2h5bXhG?=
 =?utf-8?B?cVBlaFJHNnI1dXpQQ1M2dWJ5QmQ4Unh2aFhxcWdWUHJjUkozdnV0TGVNcERi?=
 =?utf-8?B?aHRFOHNIbjNGKzFudHU0WUFEa051bVlLR2ZkL0kzTHRLTmpTYUZJY1hkcHJp?=
 =?utf-8?B?RHhEcGl6aVlyNURkbmpGSlZ4b1k3Zys4VDlrME1xWUFpZGpucW1LekxIcG5m?=
 =?utf-8?B?Z0pUcytpd09xQ3lzaGE1eVRBYkRBVXAyYjlwUmNqcENpcFJsbWRaT1FZQVQw?=
 =?utf-8?B?ZENmNEt4TzhBOTUzRWJEMUZucDl6R0VDSndFSWxpMkJFY0VFRDVPTElMcUhJ?=
 =?utf-8?B?aXBmZUJhQjB5TEFaTFpHK1FHVFRTSWEwNHN1OU8vNDBjdi9IQnp0YVAxTEdZ?=
 =?utf-8?B?V0FMR1hjZEIzT2YyVDg5OEpoNklkU1YwK3doalZIN0VWQzBZVldoWENZSHhs?=
 =?utf-8?B?YW13b3pqb01QUjBmVDRiK2hOTm9PMzVnZTVJdGN4bzgyMGFVdkhVQnN0SHhr?=
 =?utf-8?B?K25zblNvU1FPaFF0dFl1a3ovWHVOdWNrM2p2OWw5NUlFK09FdFJEWHRxQldT?=
 =?utf-8?B?TFovc1NkRmtBTTlaZnBVNldmSHE4QURWN0tuU05CdVJKSEVJenpUaWVuQjRq?=
 =?utf-8?B?R0Q2SUVybEx3eFh6RXJ5K1l3WkpMdG9QR0xMTEpteUEzWGh3TU9xSjQwSTBp?=
 =?utf-8?B?aHN6WVpMTW9HWmZIZUpkS2FacW5uVk1CWlh4YnFkdEwzZW9qSzhEU29uelkx?=
 =?utf-8?B?ZjI4ZjQwODd4U1RKTU03Tm10cXBmM3NYL0hvU3NFL0VTVkh3NzBMRmhQN3Rs?=
 =?utf-8?B?QlRFQXM4T3BNVVI4Ri9TSDdoLzM3M2VFZzg3cStEd3JNVFdoNzJrbys3YTFv?=
 =?utf-8?B?RC9uL3Q3djVVWUdvbXhGellyeURWSEhpVW9FckxFOVg1SzRXdjRyODVTeUhk?=
 =?utf-8?B?T1czdEsrNGRtQ25Oc29DVnR2MnN6QVVuUzBwbVJCUlBURWppOGZDeHVvUzFY?=
 =?utf-8?B?aVFIQmRmdDc5TGgrckRGa0JoTXRCMzlPdW1GUUhBcC91N3NOODc5MFAzVmZC?=
 =?utf-8?B?ajBSamZLcXJxTFNEdkNVVld2U1dUSVBnZTFKMUFQUHFvOTB5UUFISFRQSDVO?=
 =?utf-8?B?aFdtaHNjYW9GSUlkTjA2RCtOT21XS1htbDVHYnA1Mjd2WXBHWmxKbDFveG50?=
 =?utf-8?B?VjNOREdXY0FYOTNEMTAvYjQ4UU1qSUU2dUpoTDBKb0VmZnRBaGFmUm9uVVY1?=
 =?utf-8?B?WTEzanpFdnFsMTZTVE9CdW9FOVVUbWd5cFNrNGtYZ2loWnRJOGlUUWd2QnF2?=
 =?utf-8?B?S1BPNk53VDcrUEZYaVVSc0RheUJrNzFmUzFkc3VrSDc4dFdUd3FjOGlqNi92?=
 =?utf-8?B?QjFPQTEvNm93ZU5YVnc1ZFlIR3NITk0yNmg5bDc2REN6Z24yYVNKRUlYU3pX?=
 =?utf-8?B?RFRkT0Fja01BbldRZ2Z6RzBlRU5ub0NIczI5MFh4alhoZ0NidXVLeEIvNkpQ?=
 =?utf-8?B?NkhLTHZVMDlCUkRwMXFtSjMxc003LzBTelNMTm9IVzhnK05xWkFiM0ZDb09F?=
 =?utf-8?B?aUJHT0MvZHZya0pSL09ESjBkY2Ivc3R4a2RQV205bVhuUFRraDR1WmJEVktM?=
 =?utf-8?Q?20MIYgXk+iOoc2NALPCeYQKrruLnt84XdQmbU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(1800799021)(7416011)(376011)(921017); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?LzArR0xWYXprSitHNG1CdE5RNitIcXJ3K1h3RXZwUWN1bGhvYzhpR0Nqa2Q2?=
 =?utf-8?B?K3QrTE42VUhSbGVLdlFoenpXakhmRlNxVkRSVG03RTdjaHpsZHV2K21zRjFx?=
 =?utf-8?B?WUJTS0VPVzZXcW5FRDZTMTFVd2dPbXBmaGE4SEVnOEZPNURFRGtBUVdCZTFR?=
 =?utf-8?B?V2RlTHZJTUcweWNQdjZtaDdJQ2NpU1NMTUswRCsyNk1zMFk4NUNpa3kzWlV5?=
 =?utf-8?B?a2dEeVVObjNPai9mb0FPVFkxbGpGMjhvQk9Cc3gxeVNMREdEaGNIa25SNlI4?=
 =?utf-8?B?RnRXVkRNZVQwQlo5cStTZ28zd1Y5VGdDZ1lGd0J3NTA4azhYTmdaTmZPVVlU?=
 =?utf-8?B?QnBJQnRMRXh4ZE0xSVZQdVdldkMzMzRQVU1VemxTTnBjTm00SjVIMkJ4VVZo?=
 =?utf-8?B?MU0waHV5ZE5hRWdBV1FWcHU0MEU2bXROQUFWdDNnSE9DSHphakN6MXRrZ2hk?=
 =?utf-8?B?Wmg3cVloVk9RL25LampNL2w4NFdVSFFtNitmSE1MZ1RKY0JqOEtPUnV3cXEx?=
 =?utf-8?B?UWR4aGQ5eHArNTNFUDdvYTNXZTRPbWNxT0lHdXZGS3JPcFFNeDNDZjFQWUk4?=
 =?utf-8?B?RWNyL0ZMTDh5T3NjK0RTRHg4QTdGYWpCUnpRSEdycHRqMVhCK1psbUJQQTY3?=
 =?utf-8?B?ZDhuYmxNKzcxYzV4ZXlGZVI2dFFTazhmKzN2ODBxVDk5Unp2WnJ4NkM0Uy9B?=
 =?utf-8?B?S3g3TlV4V0MvL2lJMHQzWmVzYzRMT0s3QituSE1hZTF0V1hSWDVxd3M2TXhj?=
 =?utf-8?B?eHBTYzlRa0hMR2EyaTF4a05XanVTOVBxOE45WE5Vcko1UFBtLytTRDRsM0tX?=
 =?utf-8?B?aDFTN3BSS0piSC9kb1dVaDJCdzYvcmVkcno5Wlh3dVdUMmhCREsySjhIK3JF?=
 =?utf-8?B?Rmh6TitUcGhhbDM2RHQ3dXJMNG5BdlRVdFd0WDdpWmtOV0Y2dGZFTWpuRGVk?=
 =?utf-8?B?NEc0UjhUR2c0UUdkbGhiays0TzcxNWVzUWYwZTM3dk1nZDFlQXVhUGtQSklh?=
 =?utf-8?B?RzFiQytoeG1uT3BKNGVXeStsWEE4aE5kdDByS1dRSWNKSFVteVkvZ2ZuK2ky?=
 =?utf-8?B?aFlWRS9zQ3BPZnV4OHlNMjdSUnlzOCs0RmNiNnhpVmVuY3kvbVZRQm1XVzdV?=
 =?utf-8?B?OGlKODhlVTIvb3l4Y2FWdWJjbGIvdlRCcDRBUW1nblpDUzdJd2Z4WHBKNE5y?=
 =?utf-8?B?N1lSTG5oZVQ1dWlKbXhjcUtFMzRwak5LMTF0Mm5XOW85bTA5OFhIbEU4T2tW?=
 =?utf-8?B?OTdqa2xiMm5EVGpQK1pSZDUzTm8rOHlhdm9ZcVFXZC9zM0xTcUFxL2NCaEZ4?=
 =?utf-8?B?cjZqZnl6eUZGZXZKT3dVK050MEs1by85N2NrRmVlU1c2NWUvZDZZS3RMWHp0?=
 =?utf-8?B?QkR2YVZmYWdNZEFMTXdXUTJENVcveFpheDFnVmY2ckNUS2RZaW9aNkZXYVhp?=
 =?utf-8?B?ZUdLbytEa29ETWVhcUxDV1c4RVk3QU5iUk1PMmRUSEhkV1NndDRRc0hSTElx?=
 =?utf-8?B?OVlUTmd2c29EcC9aL1l5bFhwVWwrVkJBRzE1WTNNQjM4WVVnZHJhWUp4a1Jp?=
 =?utf-8?B?ZVFScVd5eU1nRjU2L0xiUXhGdVJSWURZc2llQUQ1bFFZVTg2MGEwSFZvUC8v?=
 =?utf-8?B?Zm1OK0JPNlhYWlB1Ky9rK1gwSEJDb3JaaE55VTNjdjNDeGdDQ1AyM1REUytt?=
 =?utf-8?B?RXZCYUxBVmdZMnNDQ1FlR2JPdURoV0hxdTZtdHhhbVFLbkNkYm1Gb2g1QnRZ?=
 =?utf-8?B?dnhya01RcTA1QUNvWndZTzlVajdXVDJHTnFqUys3ZEZHczY5cHlLdWJRWGE4?=
 =?utf-8?B?UGhodTEvTHdGSVlqUlBuRFlDUW12dzBhNXRxVitXMUpMTnh3V2NVU3N5VmJE?=
 =?utf-8?B?Y2JKMi9oS1hzbGZ3OFI0RkFHWm5TdGZRZDVacC8yai9oSjlDZmVmVjAzdDkz?=
 =?utf-8?B?UFJlTmJTalhtVHFPRTkrZ2cwZkR1Y0Y1Z0lnM0RsODNHNVZ3NlNXWXhUZGVa?=
 =?utf-8?B?OThpeHVFYzRLUnh4aWtoalFyeVhnT0R5TlFXVE4zelhLYXlacnRXcUZTcmk2?=
 =?utf-8?B?YUxJdzZQeW9rQXdaZnBrVm9lZVkvS0FtSXBNSkcvMTZXZEorKzFRUWdxc3Np?=
 =?utf-8?Q?XCF4FNIyFqSUTJQZFxYd+mMRu?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27df4c6c-72d7-418c-6513-08dc93c1eabd
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2024 20:20:25.7167 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6vIBhCxaCOHDmaN+ltugrNah39XYuaG2zNisleoiGhswRCfa4GYriMSPtubqelk3wcdhBJGMJ2vvv3XHhc42LA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4350
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

On 6/23/2024 03:51, Thomas Weißschuh wrote:
> Panels using a PWM-controlled backlight source without an do not have a
> standard way to communicate their valid PWM ranges.
> On x86 the ranges are read from ACPI through driver-specific tables.
> The built-in ranges are not necessarily correct, or may grow stale if an
> older device can be retrofitted with newer panels.
> 
> Add a quirk infrastructure with which the valid backlight ranges can be
> maintained as part of the kernel.
> 

So I was just talking to some folks in the Linux handheld gaming 
community (added to CC) about an issue they have where they need to know 
the correct panel orientation.  Due to reuse of panels across vendors 
the orientation on one might not be appropriate on another.  The trick 
is then to detect the combo of both the panel and the DMI data.

It's the same "kind" of problem where something advertised in the 
firmware should be ignored but only on a panel + SMBIOS combination.

So I am wondering if what you're proposing here could be more 
generalized.  IE "drm_panel_quirks.c" instead?

Thoughts?

> Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> ---
>   Documentation/gpu/drm-kms-helpers.rst        |  3 ++
>   drivers/gpu/drm/Kconfig                      |  4 ++
>   drivers/gpu/drm/Makefile                     |  1 +
>   drivers/gpu/drm/drm_panel_backlight_quirks.c | 67 ++++++++++++++++++++++++++++
>   include/drm/drm_utils.h                      | 11 +++++
>   5 files changed, 86 insertions(+)
> 
> diff --git a/Documentation/gpu/drm-kms-helpers.rst b/Documentation/gpu/drm-kms-helpers.rst
> index 59cfe8a7a8ba..1998a2675210 100644
> --- a/Documentation/gpu/drm-kms-helpers.rst
> +++ b/Documentation/gpu/drm-kms-helpers.rst
> @@ -224,6 +224,9 @@ Panel Helper Reference
>   .. kernel-doc:: drivers/gpu/drm/drm_panel_orientation_quirks.c
>      :export:
>   
> +.. kernel-doc:: drivers/gpu/drm/drm_panel_backlight_quirks.c
> +   :export:
> +
>   Panel Self Refresh Helper Reference
>   ===================================
>   
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 959b19a04101..50ccb43315bf 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -443,6 +443,10 @@ config DRM_EXPORT_FOR_TESTS
>   config DRM_PANEL_ORIENTATION_QUIRKS
>   	tristate
>   
> +# Separate option as not all DRM drivers use it
> +config DRM_PANEL_BACKLIGHT_QUIRKS
> +	tristate
> +
>   config DRM_LIB_RANDOM
>   	bool
>   	default n
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index f9ca4f8fa6c5..6669913b907e 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -92,6 +92,7 @@ drm-$(CONFIG_DRM_PANIC) += drm_panic.o
>   obj-$(CONFIG_DRM)	+= drm.o
>   
>   obj-$(CONFIG_DRM_PANEL_ORIENTATION_QUIRKS) += drm_panel_orientation_quirks.o
> +obj-$(CONFIG_DRM_PANEL_BACKLIGHT_QUIRKS) += drm_panel_backlight_quirks.o
>   
>   #
>   # Memory-management helpers
> diff --git a/drivers/gpu/drm/drm_panel_backlight_quirks.c b/drivers/gpu/drm/drm_panel_backlight_quirks.c
> new file mode 100644
> index 000000000000..a89b5fd1940e
> --- /dev/null
> +++ b/drivers/gpu/drm/drm_panel_backlight_quirks.c
> @@ -0,0 +1,67 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/array_size.h>
> +#include <linux/dmi.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <drm/drm_connector.h>
> +#include <drm/drm_utils.h>
> +
> +struct drm_panel_backlight_entry {
> +	struct {
> +		enum dmi_field field;
> +		const char * const value;
> +	} dmi_match;
> +	struct drm_edid_ident ident;
> +	struct drm_panel_backlight_quirk quirk;
> +};
> +
> +static const struct drm_panel_backlight_entry drm_panel_backlight_entries[] = {
> +};
> +
> +static bool drm_panel_backlight_entry_matches(const struct drm_panel_backlight_entry *entry,
> +					      const struct drm_edid *edid)
> +{
> +	if (!dmi_match(entry->dmi_match.field, entry->dmi_match.value))
> +		return false;
> +
> +	if (!drm_edid_match(edid, &entry->ident))
> +		return false;
> +
> +	return true;
> +}
> +
> +/**
> + * drm_get_panel_panel_quirk - Check for panel backlight quirks
> + * @edid: EDID of the panel to check
> + *
> + * This function checks for platform specific (e.g. DMI based) quirks
> + * providing info on backlight control for systems where this cannot be
> + * probed from the hard-/firm-ware.
> + *
> + * Returns:
> + * A struct drm_panel_backlight_quirk if a quirk is found or NULL otherwise.
> + */
> +const struct drm_panel_backlight_quirk *drm_get_panel_backlight_quirk(const struct drm_edid *edid)
> +{
> +	const struct drm_panel_backlight_entry *entry;
> +	size_t i;
> +
> +	if (!IS_ENABLED(CONFIG_DMI))
> +		return NULL;
> +
> +	if (!edid)
> +		return NULL;
> +
> +	for (i = 0; i < ARRAY_SIZE(drm_panel_backlight_entries); i++) {
> +		entry = &drm_panel_backlight_entries[i];
> +
> +		if (drm_panel_backlight_entry_matches(entry, edid))
> +			return &entry->quirk;
> +	}
> +
> +	return NULL;
> +}
> +EXPORT_SYMBOL(drm_get_panel_backlight_quirk);
> +
> +MODULE_LICENSE("GPL");
> diff --git a/include/drm/drm_utils.h b/include/drm/drm_utils.h
> index 70775748d243..37cc6de1a01a 100644
> --- a/include/drm/drm_utils.h
> +++ b/include/drm/drm_utils.h
> @@ -11,9 +11,20 @@
>   #define __DRM_UTILS_H__
>   
>   #include <linux/types.h>
> +#include <drm/drm_edid.h>
> +
> +struct drm_panel_backlight_quirk {
> +	struct {
> +		bool pwm_min_brightness:1;
> +	} overrides;
> +
> +	u8 pwm_min_brightness; /* min_brightness/255 of max */
> +};
>   
>   int drm_get_panel_orientation_quirk(int width, int height);
>   
> +const struct drm_panel_backlight_quirk *drm_get_panel_backlight_quirk(const struct drm_edid *edid);
> +
>   signed long drm_timeout_abs_to_jiffies(int64_t timeout_nsec);
>   
>   #endif
> 

