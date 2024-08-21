Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D00B695A618
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2024 22:51:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1811210E24A;
	Wed, 21 Aug 2024 20:51:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="g4JpQUo5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2053.outbound.protection.outlook.com [40.107.101.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B20E110E24A;
 Wed, 21 Aug 2024 20:51:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SuSjfuR8ppB2Tg8BogyDvDV1bGjd6dJdw9ZXPs2LvRzoQMavRB03Jd8qvbaD+6D33Yduf8wtZKI1Ve+gX/z5Z8x8ktaGnyknsWOjh6gWPi/DWK37+2upvKuD10I6njWTGECtS3uO66t+l4NBJNuzzcR64YppLJtEvUmeW17LKJRE8Ar8KI/98cltZU8MO8QooIXdCTN2gzIGV9HKt44JDX5Ci2irKnbmn5OOjVO93SHujE/v2qobLxsNgqGvNhQ8aVYZ3auXvssCFPBSVUOfrl9sezs1zo13SW+PwqTYt9P0LqnSgc1QKv4EiLM7b0QK4iPTBHWSFiyRKnIFIHqb+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9z066Ecjzq6i1CHfFY7bsRR+tQGPbhVmzK3xvGAX5Cg=;
 b=aoPHRCnHsxPnKZ2R61Q5rfs44HQq15XStFN7z8vJttv5SH9Oz27eLq12MBFIDSQCFRUlEoXat/Px09324Oeq0cfiuELVhoy9edoo0WsdSqA5fgDB2dJ2CbqQRkSzVX7KKc4CYGX6DlA5cn4BlARcUKzbe8it5daWX/JHGWHQVFt3dZogFNv3MHLtKJr3mDSbdjeMiI+FPzFtMZZDYViajY2jSEIKpTs3pM63DvkuNa8gz5XRyItWOpR+ynt3XGRLbGUgHyGYO/O4rJ51WGIPfKgURBxwCoMWbg39vvEC63siqf4ym3bKUbsnDtIBNByE/PEtI6dmhGIlBqHdetNBXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9z066Ecjzq6i1CHfFY7bsRR+tQGPbhVmzK3xvGAX5Cg=;
 b=g4JpQUo5blPB7TiAFFhLTtPES/kUFY0ZLzpLL5JqPUZcoRA9INDbR8ONL5ov05PObsXhFT5fC0jeyNdDrq0Tjd3BM12gsCVSN6NlikzDEWVfKDfJOwe6uMgUO8whzsoXxnTUX2TwIy5ElyDPFEHf993ucYb8isTQLTY+VtuxAZk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DM6PR12MB4060.namprd12.prod.outlook.com (2603:10b6:5:216::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Wed, 21 Aug
 2024 20:51:10 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.7875.016; Wed, 21 Aug 2024
 20:51:10 +0000
Message-ID: <5363536d-0f96-4e96-8f1f-c8e1799b6421@amd.com>
Date: Wed, 21 Aug 2024 15:51:17 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/4] drm: Add panel backlight quirks
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Matt Hartley <matt.hartley@gmail.com>, Kieran Levin <ktl@framework.net>,
 Hans de Goede <hdegoede@redhat.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Xinhui Pan <Xinhui.Pan@amd.com>,
 Jonathan Corbet <corbet@lwn.net>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Dustin Howett <dustin@howett.net>,
 linux-doc@vger.kernel.org
References: <20240818-amdgpu-min-backlight-quirk-v5-0-b6c0ead0c73d@weissschuh.net>
 <20240818-amdgpu-min-backlight-quirk-v5-1-b6c0ead0c73d@weissschuh.net>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20240818-amdgpu-min-backlight-quirk-v5-1-b6c0ead0c73d@weissschuh.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA9PR13CA0076.namprd13.prod.outlook.com
 (2603:10b6:806:23::21) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|DM6PR12MB4060:EE_
X-MS-Office365-Filtering-Correlation-Id: d82f47d5-d78d-463e-5a1f-08dcc222fc93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WndodDBmVHdnMDFES3NhM2J3czNvWVI4QVBUOVhjbnFONmVqRXR0ZFBWdGhO?=
 =?utf-8?B?K25DMnNTZGY0V2RGQ1Zoa1RIaElnd01QYXpnTXdHMkdITlpSQWVoUGtETHRI?=
 =?utf-8?B?NndnYnE4NGlKVVo2L2dZUUt2ZXlqMDMxeCtnZ2QwZ3hMYjhLL1hjZVB3MXlM?=
 =?utf-8?B?UTYwa0RVRENqcExieDBpSWkyajJHeWpFRjdscUcyNVRhUWRLMnEyY0U5QUVH?=
 =?utf-8?B?YmNuRDdQQjdmN252RFJTd2x6ZmhYQU9ubTNnTVFrZU5DQ2VwRFFkV1FhMWQy?=
 =?utf-8?B?d2tJWDNPZ2U4Yll2dFllODd4MzZlQ0Iwc1RBV1I4OWR1UmR5YmpjRHBoQVJp?=
 =?utf-8?B?endwS3FVVWE4RmlNem80ZjBYMy92WWdyRytNTDRpRFZoTWRaQUV6WWFHdU42?=
 =?utf-8?B?N0tjMkJNMk91YW1laGxLTU9FdWZwajdrYllqUzhDNnlqbk1xQ1NNMzJpLzEx?=
 =?utf-8?B?WC9ndVZkbFdXekUvWEJrTEZUKzhKTzZWa2sveEFCdXd5c0tuUVV0eUhBNlN6?=
 =?utf-8?B?ajJLQzFsYUtVVVJGcVVwaGtmWXhvTmpzWDRTdUlPRFA2b3dQTjB3azJwS3RP?=
 =?utf-8?B?UGNoZU5yNnpPaEtOeGhYd0w5N2RUZHNpRlJmM2E1a1o3VGNhc0UrRGdkczg3?=
 =?utf-8?B?NTdZelNuU1VuQytuYW96T0RpbW5KU3lVT3B4VjA4LzJ2ck9VTzZFRkd2S2pp?=
 =?utf-8?B?YUw5b3V1NlBicCtYUHBCYURZNmxGRk5qN1BhZHZLMCt1RFM3QTRaci96Qyty?=
 =?utf-8?B?aDZYeFdOR05KdmMycXkra2FYSU91RVlsMmhhRmN0NzFGL2ZZck9wTkJDZHV3?=
 =?utf-8?B?OENtZ05oc3E3Z3dBeDgzVU9vdStwbldqTVhXMXY4VEtScTMvVlV4QTVlN1N4?=
 =?utf-8?B?Z1FIa3BxWjFoY3A3VFd0d1lOOGN5TWsvQXVhZHlFZC9lcWlpdVdEWUdlQUtM?=
 =?utf-8?B?RkQ2OVpCWWZ4SEYva3NNUUZXZjNObzdBZXJzVFBEM2tHbEpBZEFMWDl5d3RI?=
 =?utf-8?B?c3pQMHQwSE5vTGdnd0x0dXJyb29ETjg0RjZrdzBZYWhtQVNiaWhRMUxqNXJ5?=
 =?utf-8?B?Z0RQY2RVYklTdXl2WDVISWc4WE1vRm01czk1ZWNHWS9uTFNtY01qRUYwNE5n?=
 =?utf-8?B?a2cwTGxiQVE2eDMzMndxZVh1WGUyenlHOW83YjdWNFdBNWJrYW5VQ3UwN3J3?=
 =?utf-8?B?UWpadnEzSk80aE5NVUF5R29Xd2dYQ2tlYXI0cHd4bm4vUHpZSDNoZXFaMHlW?=
 =?utf-8?B?SCt6Zm5kRE9xR2Z4Wk5kY2JKNWdLYkh0RU5jdTJwSk4zSDhESnpwNmNUckxU?=
 =?utf-8?B?cWtuVU1SOEdPYWJSeTFWQ2EvSVhRUzh2eGROZGhpa1BEbllpYzhoQUwvd1Bq?=
 =?utf-8?B?S1lGcEEwbWJLN2Qxbm9sY3FQUm9WZU52TVVWVjhvNFk5SHFXYWl6SnVnU1Fr?=
 =?utf-8?B?VE55MFBlSFBEVWU1ZlI1Ymd2MWpIQmNYRnZ2MGlzZHNVUGJSUWY3S0VWZXNN?=
 =?utf-8?B?WkRoakVrQncyN20vM2VXTWROZUR0QzhnbHY3b3hLYWx2ZWx0S1lwb2s3d3Y4?=
 =?utf-8?B?ZUE1VVBGNDlwU3FMNDFpN0JhQ2xpQjBMUXdhT1BqNXY1Snpib3NzS0NHbDVP?=
 =?utf-8?B?VWRiNkVmUjQxQjBOMDgwKzEvMm9nZ2ZjYVNLbyt3VVRtdzIyRURxN210TVZx?=
 =?utf-8?B?c3pWd0dzZXVkOVcxWkp2NDZUbFgzb2ZaYkN6MGZ4MnhLWFh3elkxSTU3YVZJ?=
 =?utf-8?B?UE5QV2pDdzJUNFAweGlXTFFlS0MzbjAwOENKdy96SW50R2tkdVNveFJmelRL?=
 =?utf-8?B?cjRTQ002QjRaU3RmNW85VnduTXBtUFhSYWZXYjRKUElSb0RkYXRBM2RtZk54?=
 =?utf-8?Q?ffFBEf8FmvbqI?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a2UzWlAxQjhBVlVEVDVHZGNGQ3FMZ3p4cnJ4V25rb3VJZ3V4S2RHZElYVWRK?=
 =?utf-8?B?NGZiMFY1UFNLekxJVDMxUmkyOFhDTWpqN3VlTmVPUjM3b0xCVC8rZkRIZlht?=
 =?utf-8?B?TllKb3VjRWhwZ3lzRHN1eStPTC9rbUQrY2kvQWtQR3ppTUtqMXN5b3BNWVNn?=
 =?utf-8?B?dmh1R0psVWtucGhjZnVZd29EbSs4dTFxZW1KcVZUYlVKYkhaUXg2dU5qYWNY?=
 =?utf-8?B?bnppQkNEdFA5MldBVjRtaWN3Um85OGVNS0p1QWRRZWN2MjZZZzhuSU50NWto?=
 =?utf-8?B?MGIrTUJ1dlRseFluaWdiTUlEWTJ1TWp3SW5NZUd3aGR2TVNGbnR6MkVrNnZB?=
 =?utf-8?B?cnRtUk95amF0UXJtbXRqMnhzSlhIUVArN1hOZzJiWDMwRGFBZnFoMFF5REM2?=
 =?utf-8?B?eExqZnFPcEVKdVVpZXVmRFdrKzYzTmFxWkN4OW9OamtVOGdxa0dXYkc1RSsv?=
 =?utf-8?B?SDRpMW9UZFQ3M1lwYVYzcHB4dzZYdFV4ZjV2ZXJ6ejlnam1NdkFCYUV6Uk4y?=
 =?utf-8?B?eHRWdjByUjZQb2lTSC8yQ0o3ekM3Z3E4M21sbkZKbkJFVG5vbUhKb1U4MTFM?=
 =?utf-8?B?cEFaY3Uxb3pNenFpbFNlaXdUWmxhMjhPcldveEY0VFFQcmJyMGdXT2dnNFlp?=
 =?utf-8?B?cmY0QWhuSGZpVTZZVUVqYktpdzBibTMyMzloYWwzU0xja3hlbnpubDhPV0Rm?=
 =?utf-8?B?WlVoaTl0bTdMNFpDYzlpdTFwTWVMUnVCTjZyQWtNbXFoWTIxMXhuQzNlUU42?=
 =?utf-8?B?OElEWWRQWnk1NE0zQ3BkZFMyTllRNjNOUGltRExjeUdVVXpqUnJqWlJQbnYw?=
 =?utf-8?B?bWxzSDFiTlltbkVvSFJqV0Y2T2pWR2tpZHY1MUFKYmJPdkI1ZzNyNHhuWTRr?=
 =?utf-8?B?ZlpKR1RpMEtqdGozWmczNlJBbEo1b2dYdWZBQm5YamZ3N25POUpHUUlFWWxN?=
 =?utf-8?B?OVdQUUJDN3dEcTYvU3l2VUJqb3hPSit2N2szVTR1NGg2c3c0M3QwVjVXVUVM?=
 =?utf-8?B?Z3locXJPOEhJZlFVL1VqMWx2c2tiWTY3QU9SRGdHeGxWeThQR3p5Yk5ST252?=
 =?utf-8?B?aERIK0daNnlFN2grQ1lyWkJaUFpoaStId1NWVDRaNjdjL3NIODZzSzFNcGVt?=
 =?utf-8?B?UGVBaHcrbTVZdTVaNHRqN1NsbUtWblY0ZkhtT0lhVGxRZGlVZW1hODBQa2hO?=
 =?utf-8?B?NG5zUldHdDlRNjRsZjhUUW1ieEk5eFBVZDBLUzdhTkhGRlFPMFV4VUlTYmhs?=
 =?utf-8?B?bGJma1JZR0kwL2FPbjdTOEQzdFIvQUNsQTJTbkN2a05UeWNlcXlVRHNML0wv?=
 =?utf-8?B?VUlrRjh5dlhTaDFjc2R6Q3IwMldsNGwxTm5NVVpGNWF3ZWgzMWdvV3NmdUIz?=
 =?utf-8?B?bXZnM2ZkNlBBOGorYkJ2ZGZhSTZFN09YS2xHRWFQQTIwRDZLRGI4MVppSXZZ?=
 =?utf-8?B?bHN2bjBaOUdiRk4wai96ZnduU1l6Tjh3c0M5Tjg4WGUvYTNRSUhoTWNBOE1n?=
 =?utf-8?B?ZGVTWHFMdHE3N2R3M0dmdE1yWHUvQmsvYXVvd2VlWnNRdmVHRWgxQ1RqYk8v?=
 =?utf-8?B?OFFLSXl1RWE4ZjRhNERwcGxxeUZJeFJwMll6VE91cGtvdTJvemdnZ05NYzlU?=
 =?utf-8?B?eTFkS3REdVprOUozaHk4Q3ZGNm5NM052cFZwYnhkOGo0VDR6Z3NudWhGY3U5?=
 =?utf-8?B?NzQxK1JIcXRTMStyeUQvYXVWUHRYZ05aSlpNd09lQTlCeVM0TzZDZkJCbVFY?=
 =?utf-8?B?d3cxUlNxOGlZUVZqSEhEM1hTcysrRW1uaXJJelVLek1GWWp6ME5XdHRHV3d1?=
 =?utf-8?B?aWsvTmxMQTNpMlBiNDJzQ0lkdFkrbWg0SjQ2WCtBYm9odnpmK2FEdFdXak5N?=
 =?utf-8?B?NFN4YzRyL2U5cVg2MkpMK25QSmNzcnZWWUtqbTh6ZFVxV0Rsbzh6OFY5TEVT?=
 =?utf-8?B?UXBGZzZUQk9tNnhEd01EbUtyRXNNR3ZBd3Z6bmUzajdySEI5VFN2YXg4enl3?=
 =?utf-8?B?TDdIMm41ZkwvZC9VMFVNSXpaU0JvQ3FFT05MNytXcW1DTlJYby9iaGx5Qmxh?=
 =?utf-8?B?M1laWHpWQkprMTFxNDFuTXNVbFdjNnAvYmRFVTgxdUhES2t4TXFXUXJBaEVR?=
 =?utf-8?Q?O1mo8OLpPcHnvaQLLCEbsEH+d?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d82f47d5-d78d-463e-5a1f-08dcc222fc93
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 20:51:10.3259 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MASocD2PqAIpe0bVb03cbxcetJa5wCB4WxUB0pIEQqyKkgp2EAKDEMDwc6CE2ENxycgU2+vCLMzCg/r1agoyrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4060
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

On 8/18/2024 01:56, Thomas Weißschuh wrote:
> Panels using a PWM-controlled backlight source do not have a standard
> way to communicate their valid PWM ranges.
> On x86 the ranges are read from ACPI through driver-specific tables.
> The built-in ranges are not necessarily correct, or may grow stale if an
> older device can be retrofitted with newer panels.
> 
> Add a quirk infrastructure with which the minimum valid backlight value
> can be maintained as part of the kernel.
> 
> Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> Tested-by: Dustin L. Howett <dustin@howett.net>

One small nit below but otherwise this patch is fine to me.

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>

> ---
>   Documentation/gpu/drm-kms-helpers.rst        |  3 ++
>   drivers/gpu/drm/Kconfig                      |  4 ++
>   drivers/gpu/drm/Makefile                     |  1 +
>   drivers/gpu/drm/drm_panel_backlight_quirks.c | 70 ++++++++++++++++++++++++++++
>   include/drm/drm_utils.h                      |  4 ++
>   5 files changed, 82 insertions(+)
> 
> diff --git a/Documentation/gpu/drm-kms-helpers.rst b/Documentation/gpu/drm-kms-helpers.rst
> index 8435e8621cc0..a26989500129 100644
> --- a/Documentation/gpu/drm-kms-helpers.rst
> +++ b/Documentation/gpu/drm-kms-helpers.rst
> @@ -230,6 +230,9 @@ Panel Helper Reference
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
> index 6b2c6b91f962..9ebb8cdb535e 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -454,6 +454,10 @@ config DRM_HYPERV
>   config DRM_EXPORT_FOR_TESTS
>   	bool
>   
> +# Separate option as not all DRM drivers use it
> +config DRM_PANEL_BACKLIGHT_QUIRKS
> +	tristate
> +
>   config DRM_LIB_RANDOM
>   	bool
>   	default n
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index 68cc9258ffc4..adf85999aee2 100644
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
> index 000000000000..6b8bbed77c7f
> --- /dev/null
> +++ b/drivers/gpu/drm/drm_panel_backlight_quirks.c
> @@ -0,0 +1,70 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/array_size.h>
> +#include <linux/dmi.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <drm/drm_edid.h>
> +#include <drm/drm_utils.h>
> +
> +struct drm_panel_min_backlight_quirk {
> +	struct {
> +		enum dmi_field field;
> +		const char * const value;
> +	} dmi_match;
> +	struct drm_edid_ident ident;
> +	u8 min_brightness;
> +};
> +
> +static const struct drm_panel_min_backlight_quirk drm_panel_min_backlight_quirks[] = {
> +};
> +
> +static bool drm_panel_min_backlight_quirk_matches(const struct drm_panel_min_backlight_quirk *quirk,
> +						  const struct drm_edid *edid)
> +{
> +	if (!dmi_match(quirk->dmi_match.field, quirk->dmi_match.value))
> +		return false;
> +
> +	if (!drm_edid_match(edid, &quirk->ident))
> +		return false;
> +
> +	return true;
> +}
> +
> +/**
> + * drm_get_panel_min_brightness_quirk - Get minimum supported brightness level for a panel.
> + * @edid: EDID of the panel to check
> + *
> + * This function checks for platform specific (e.g. DMI based) quirks
> + * providing info on the minimum backlight brightness for systems where this
> + * cannot be probed correctly from the hard-/firm-ware.
> + *
> + * Returns:
> + * A negative error value or
> + * an override value in the range [0, 255] representing 0-100% to be scaled to
> + * the drivers target range.
> + */
> +int drm_get_panel_min_brightness_quirk(const struct drm_edid *edid)
> +{
> +	const struct drm_panel_min_backlight_quirk *quirk;
> +	size_t i;

Nit: this doesn't really seem like it needs to be size_t.  Shouldn't it 
just be an unsigned int?

> +
> +	if (!IS_ENABLED(CONFIG_DMI))
> +		return -ENODATA;
> +
> +	if (!edid)
> +		return -EINVAL;
> +
> +	for (i = 0; i < ARRAY_SIZE(drm_panel_min_backlight_quirks); i++) {
> +		quirk = &drm_panel_min_backlight_quirks[i];
> +
> +		if (drm_panel_min_backlight_quirk_matches(quirk, edid))
> +			return quirk->min_brightness;
> +	}
> +
> +	return -ENODATA;
> +}
> +EXPORT_SYMBOL(drm_get_panel_min_brightness_quirk);
> +
> +MODULE_DESCRIPTION("Quirks for panel backlight overrides");
> +MODULE_LICENSE("GPL");
> diff --git a/include/drm/drm_utils.h b/include/drm/drm_utils.h
> index 70775748d243..15fa9b6865f4 100644
> --- a/include/drm/drm_utils.h
> +++ b/include/drm/drm_utils.h
> @@ -12,8 +12,12 @@
>   
>   #include <linux/types.h>
>   
> +struct drm_edid;
> +
>   int drm_get_panel_orientation_quirk(int width, int height);
>   
> +int drm_get_panel_min_brightness_quirk(const struct drm_edid *edid);
> +
>   signed long drm_timeout_abs_to_jiffies(int64_t timeout_nsec);
>   
>   #endif
> 

