Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74918B347E0
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 18:45:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC66610E50B;
	Mon, 25 Aug 2025 16:45:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ufErNscx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2084.outbound.protection.outlook.com [40.107.102.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6916510E50B;
 Mon, 25 Aug 2025 16:45:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HJZKJeplvdeuCyCu09k+LDKXcH9DEF1KmrVcz+DGQvy3Y/ned11/kAQnkMF3Ii900s0gNL+0a2P7mdnkM8n8A1P6OZl25QnpwItGd6C4A3fLhjJLZQfnn5P5OY+EP9w/BJojDsUoJG0NSh+pWm+opebefJX/nz63xvN/x+/y/mEAZJCMPIsEYA+kC9zeDnpCiBlljiCVx01JEw8sQuhTmIkUOviEmAxRdEv7FdtPNDEAbax2drxUIZUKg9f1XiFUUU1vyelzE+51MjAM7Krg0P9laVtYTBrDTk1RuiFleUH86YYjH2P6p7BXUyP87Wg32CwkjwtC+e275+yFCS6e8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MVt5Ftq9InXzl51JXjAhwheYcznIKudIcznmiD2i8vE=;
 b=hj04TY54TIV097K2+0B8SPaWVSeL9FotgrC/35CrHSHLKBwLlj5wlt8M/EOzvun488A77Ll+Q8U2fEUSb8i2gzPx5PQqLQm+41HLyxmRd0OMbj6YTxVyJngn9XPUNxL4RUI/2ZDIM6BIvTNosecu8/6tWKp7y6kB7yZgKYmZ9oXKAnPT9YJg/YSagtzg6/P4uQDFG769cPcC6zQJePRPilzbxYGPFmkrmdsp+NtL+W7MSmdUON5akt+PWCdVddbfv+hfgO4nj35tVzSoxif/kRXT9oCG6GyEIvNBDwySmUhZ6tj2RfJ4UlBtVgcIbu2/5BgMGDXDRvFRpG6MW/K/Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MVt5Ftq9InXzl51JXjAhwheYcznIKudIcznmiD2i8vE=;
 b=ufErNscxEoRzjAuz1gfUqNEAutDZ7cvH6K5b8NN+Ib4ZseRD77LiLE1aqzQ7RDxFzK1tGKgyVyL7fSDIs9QQuNCFQwDr6u5CPxBJqTWWaWynTGwfafLtOw6p8OOLm1jJ6RcuJen4kav283HTUN/pmEEFp0QAF4JuZ+4pUu/ezLs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SA1PR12MB8844.namprd12.prod.outlook.com (2603:10b6:806:378::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Mon, 25 Aug
 2025 16:45:22 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.9052.017; Mon, 25 Aug 2025
 16:45:22 +0000
Message-ID: <a24a7cd1-2281-4d98-8b68-a75e85c22dd5@amd.com>
Date: Mon, 25 Aug 2025 11:45:19 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/5] drm: panel-backlight-quirks: Do partial refactor
 and apply OLED fix
To: Antheas Kapenekakis <lkml@antheas.dev>, amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 philm@manjaro.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
References: <20250824200202.1744335-1-lkml@antheas.dev>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20250824200202.1744335-1-lkml@antheas.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1P222CA0051.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:2d0::24) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|SA1PR12MB8844:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c400dae-5215-4ec9-7c2d-08dde3f6c86b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cFFnOUZmak82OENFWTZSZ2lybzdLOC9sNWljbzcwTlBKUklkNHhsNmxhWVFv?=
 =?utf-8?B?bkV3RTVlSE1EMXJVcjYwSGRtM2xVY28xcWlFdjNzSlJDOWdlbHQrSm1kd3RQ?=
 =?utf-8?B?ZnZKWktlYmY2ZTFXc1VSYWFyZWNCVzN4SUNIcjZlMTE5U0FraTNqUkx2d2Jo?=
 =?utf-8?B?R0tYZlJ4V3BZMjF5OUFvN3NZckVSLysrcTkxbWZaMEFUd2xIemxpeW51Nktk?=
 =?utf-8?B?dXBoSCs0YU05N3F6MmNGRVJyNE50SllMbHhLbzVCK0RwdTN4eFNrUWw1MUh3?=
 =?utf-8?B?NVR4NE5rZlIzZzJpSE01SHA3anVtMktFcGd0dFhiOE9aWnlycEQ0VE9aeUNs?=
 =?utf-8?B?TWt1Q1p5ekdQZ09ZbGVLZUFxRVVxR25IczBTRVdWZUZpZmF6cUNnYjZLZlE2?=
 =?utf-8?B?Mlp5V1FhdnZoWVVRZk5pcEtZTmxIUHVZeHE3eFJmeGJuSkVQeXkxR050d3A4?=
 =?utf-8?B?bUJKQ00zdVRURERXdkJheWdOZGk3N2R1cHFtMFFGMnU1Y0RkY3A5RC9zV1Mv?=
 =?utf-8?B?ZHl5QjlFei80RkZJRGVPOUZxcnd4Z1BJQlFyNGdUMmRMcVJGWWpWMURRUmFq?=
 =?utf-8?B?MEYyVUJBNS8xZlRTSnlESkV3VG9jazlMRWdQcVVlUnRlUnhDOXhOM1BnT0hC?=
 =?utf-8?B?R2taeWM3MFFwVkRXSnRtUDVad3VpWmxtc2JPMU4zZkdnbEhZazdXVGNQbUVy?=
 =?utf-8?B?ZXJucXl2QlRWWVhmQjgxK1p6a2JKazFTM2hPTjllbWduTEFwWGZ3cFpMTG5J?=
 =?utf-8?B?QVF6QlA0SDhTS2FVRkpER25STm1mVUpZVHFRdEo2Njc5blpZVHM2R1l5TUpM?=
 =?utf-8?B?RlJpV3hDMEFIcGNtbnpnSUJLbGl4UzUvTmx2VVZMUFA3R1Q2b3ZaNlhma3FL?=
 =?utf-8?B?Nys0MmxvS0NZM1pTaGZmSjQ2VlVxbjY3MmpzdDFzRUEwTE8wS0pOMTluU0NP?=
 =?utf-8?B?eWxxVUtnYTdmYWhYS2VrUld4LzRxK3Uxd3dDTXEzakVlaGhrRE52S282TXQ0?=
 =?utf-8?B?dE83elQ4Tml1SnpaMHd6WFNrKzdPd2tBL0RUbG9vdlJvaTNQZHdpcWIrNVd1?=
 =?utf-8?B?bWg2UkZpWkVaNHZlRjY0MlJNd0FITGs3WW1Ucnc3VHhCbHBVd0dYWmFmZXg3?=
 =?utf-8?B?b1BjTVlRSzFEV2dmMFpkZGRWc3h0Y0wvclRTNU1YaENLQVlsWlZDVVIxQ2g2?=
 =?utf-8?B?YWQvZWlyYjNNY0hOQmVDdnVhRHE5OGNuVHhvTjloRlNBbWNMVzNUbFdWNmJS?=
 =?utf-8?B?VHAvVElOMjI2N3VFMWZhN3FzVFlmUXVoZjg5bjJkV1daNUtMdXNxQ1craERG?=
 =?utf-8?B?emsxcFV1dVlvNmVETEMzV25CcURScFVQbGFiVGx4WnVlNVJwUlltd3V3OE9l?=
 =?utf-8?B?YjUvRjdoVlhmTnk5eG4zVHRZTGV2TmxFcTg5bEhmZ2JaN1NKRm9nQ0JKQ2Jp?=
 =?utf-8?B?QTg4RFh6bC9jUkMwVmVjRGtTaC81NDkyQnJhQVJNNndFRTZsZ01NSlBVcWRO?=
 =?utf-8?B?RlFYeEpkNlBPUUdsSVNya3lBaU4rS3dOZXlZcTFvMForaUYzRXF2ZDIvcUF5?=
 =?utf-8?B?QkY5Wk5ENkZYbjVISFQrYVBYb1BmZis4MElGc0oyblZVMVlRciswbi9VR0VK?=
 =?utf-8?B?bktycGRRc3M0UVh5NGpwTXBKOEwzRXhXaitaTVFuQlRuRU5QRUJhWmliZXdM?=
 =?utf-8?B?Z3hLV1NScE54QUtVWCtqWVZkVG45RGNPUFJlT3hlNy9aWFJTVnNBTlhpRm15?=
 =?utf-8?B?bldtc0M4bEhNL04yWmdkK0pwb0taMUpPYnZGN0tVb1dOMUwrZ3owZWYvUWVo?=
 =?utf-8?Q?hA2WoaA7y7Tc/5E1J5SJpgz51BpbyB3TBnYbc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WnJJQUdhTTJtTmNZN3BQWTlvd1Bsd3VkNVpDa0NBVXd1WlM5ck56YzJDRlBD?=
 =?utf-8?B?ZUN5RDNMNmgrUmhSM25qc2VTVmRXdXRXUnFYUURKdlJCTmthR1lVZjZCaFd1?=
 =?utf-8?B?ay9KNEZ3LzREazE1Rk9vQUJ5OFFtQTlnMUNadDIvZTlVdVBaVk5qamxXSUNN?=
 =?utf-8?B?MXVQdVJ6a05lT09BNzJVQ0NFeVRlSHgreXVFc2VRZ1doZGNGMTRuWFplaE5v?=
 =?utf-8?B?SFg2OFdiRVRkZWFPTVovTUZvU1FVTGY1UDBGQzBWRVJpMVZUa0o4Z2dsODY0?=
 =?utf-8?B?OTJEZjQzTUJqajRuMDhkelZQTHdtaG1KU1krQW1lNUErRFNCa0ZaMnR1bndz?=
 =?utf-8?B?SEU2S0ZtMzZhaG84Rm5FNVViNkFmZ1BaTzQ5Ry93K251eFpYMDQ3bVhHREU4?=
 =?utf-8?B?WVVTc3grZ2VHRFJTUmR3ZCtxV2FMNHcydGJzZTlBNlN4MkMxejcwcXBTWjJi?=
 =?utf-8?B?VkdMaStQNkRUaWh1aURXUmYzQW9kZG51UUpuUjlYK1o3L2dJbkMvbnZnbWRP?=
 =?utf-8?B?NHFjbUdFNFVHRUpXcG9WRGdZVUVFcWdockVHNXVrZ0NaYkl0b0JQSmpaeHlX?=
 =?utf-8?B?RDhqMnVDZTRxa0hSdkROVExKS2c0ZXEybE1wMmhmb2p2Y0doc09tYldNRm1v?=
 =?utf-8?B?OXd2WXBFb2w4RzJKQ0MrYkVXR3VMd2VrekNoeTlFMXZPc3BZZllIeUtpS3NZ?=
 =?utf-8?B?VW9jbEFLSWM1a3NrdWhySktGeUJGZjgxNWFmV25pdTk3VFhzN1p2SC9jWEpj?=
 =?utf-8?B?TVhCSmpKWXdJVG05ejdzZTE0M1YvSkxER2RSOGlvaWlZbmI0REQzMVNVYURF?=
 =?utf-8?B?U25kWjJSY0ZEbmd4YUxRdHVhdDRDV1ZWY1ZLUWJYODJpbUp4ZDZUVHJHZHdP?=
 =?utf-8?B?aU9uUVJaeFB0ZlNxRGpvOHAxR3JpWFp6a0tVa0Nmb1YrTlFmSnpldTlQRmZ4?=
 =?utf-8?B?STNTaEJvbGdTdmxJbWViZ3kxaGdxajVsempOQmNoN3EyRUNmVEFFZ3JKTW00?=
 =?utf-8?B?MHlLVWNuVXd1QUVacTYyaDdFU2tGM2FVTHJwUHZXQ1hzbVBOL2p5MldubXQy?=
 =?utf-8?B?SnFNd0VyekEvcWpRdE5rOXJtY3VkZy9wbXA5WFJIaUM5Zld6WWRWTStsVzJU?=
 =?utf-8?B?M1pzWjZzTVY1VGIwV1cvUGduVzBRamFxYkNnSTNHL1VBNExvUW1DOXI5TzVx?=
 =?utf-8?B?ZGExOUhTWkFVZktaeWVRcnc1amNkNytjSUxPUitjV2g4bWxLV1ZGOVNPSVUw?=
 =?utf-8?B?Y1NNcWZoQmN5ZzI2N2VjeCt6U0I5V1prR3JkUk9EZHA4OGJ0MWhCYnR2NlFm?=
 =?utf-8?B?ZHdVaGNRNEpRajg5dGNuejkyRytKNUpHc2NENHVEakhFWXB0SE9GM05sSUN0?=
 =?utf-8?B?S3FoWGFtTE0yQUE5ZkpBSlpiL20zcnVQUlBBS0JURDU4Mk5KSGt1SVFwMlQx?=
 =?utf-8?B?b055R01MalRzRkJoWmxUczYxaG9nbkw4YjhscjRjZGlSNjdteW5GOXJqanJn?=
 =?utf-8?B?cVhpUnh2dnpPS1p4VnhHSFhPN2c0UWxqbUdVcS9tYWxqVFBBa2F0QzlvcE5h?=
 =?utf-8?B?VzFYZWlIemI2Z0gySitlN2FybjBjUHM0TDFmc21RUFV0QnFheEtQMEF1Z0s3?=
 =?utf-8?B?WCs0NjJCY3R5MUJ3KzZGWnZZem12SDN0WXBLb1VyUVpPRTlNelB3ZXFYTW1N?=
 =?utf-8?B?eVprWDNKTGtUbUxVL1pQbW84NGJZSkplZlUvOXROREczeWFwTWZpMjcrazBh?=
 =?utf-8?B?SUhWTEc4WTZCTWEzN2lYTEhUVE0xaExZcHo5NkwzZSsvQUdoQ29Ddm40QUc5?=
 =?utf-8?B?VmpkTXBsa0dvU1ljRWlOZHlwZC9rV2RQMklGSVRKb01DODZZZnlZb0ZXcWZO?=
 =?utf-8?B?Q3hiaXRHZ2RtRWZmSDhwNXJmY2xxNmdyVzRWbnNqaGF6V2RHOG4zcHg0OUx0?=
 =?utf-8?B?SEw1aVQ2RTNyNGxrWnY2WmorMjZGYzUrR28xMFJCS2VXM1drb0V5bERDY1ND?=
 =?utf-8?B?RXdqcXlSWWZuWmVOcDlqc1BWOElZSXRoNWV3YTRaYW5rSzUxWkJkOGhlYU5X?=
 =?utf-8?B?OStnVTRsZDVpNzUvSUJCdFpKNFBtTnRFK2lObmJ3bVIwQmFpNUZTNWZzUnVa?=
 =?utf-8?Q?G5rYkPZuGxTcgzfR2Vimg90pM?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c400dae-5215-4ec9-7c2d-08dde3f6c86b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2025 16:45:22.2736 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /76dxXJSL5O6kBuTzMQF2gTlYyucU4YGvDtjQCt/zIexLovN5AQ34363z/JSl7H8zVcsjBNC0AF9MoJgRdKcSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8844
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

On 8/24/2025 3:01 PM, Antheas Kapenekakis wrote:
> This is an alternative to [1], since Phil found out there are still invalid
> values. I made this series before the one I sent today, and I have to say
> I tested it much less. Because I did not think it was very viable to
> upstream. 

I'll look through and may leave some comments on individual patches.

But I do want to say because platforms can share panels or can have 
multiple sources we very likely should be keeping matching that does 
SMBIOS data and panel data together.

It's also completely feasible to launch another second source or third 
source panel later on which might not require the same quirks as the first.

Then lastly there are companies (IE Framework) that actively let people 
change out their panel for another.

>  I was also not aware of [2] and [3] since they are not in a
> public bug tracker such as amddrm and my issue there [4] remains closed.
> 
> I lower the cc'd here since this is a draft. 

You should make it "RFC".

> But this could have some
> viability. Especially since I can stop carrying the dodgy patches from
> SteamOS so that the SD OLED has a 0 brightness min.
> 
> [1] https://lore.kernel.org/all/20250824085351.454619-2-lkml@antheas.dev/
> [2] https://gitlab.manjaro.org/packages/core/linux616/-/blob/master/0001-drm-amd-display-Add-a-quirk-for-the-Zotac-Zone.patch
> [3] https://gitlab.manjaro.org/packages/core/linux616/-/blob/master/0004-TEMPORARY-terrible-hack-for-zotac-screen-while-debug.patch
> [4] https://gitlab.freedesktop.org/drm/amd/-/issues/3803
> 
> Antheas Kapenekakis (5):
>    drm: panel-backlight-quirks: Make ident optional
>    drm: panel-backlight-quirks: Convert brightness quirk to generic
>      structure
>    drm: panel-backlight-quirks: Add secondary DMI match
>    drm: panel-backlight-quirks: Add brightness mask quirk
>    drm: panel-backlight-quirks: Add Steam Decks
> 
>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  19 +++-
>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |   6 +
>   .../link/protocols/link_edp_panel_control.c   |   2 +-
>   drivers/gpu/drm/drm_panel_backlight_quirks.c  | 106 +++++++++++++-----
>   include/drm/drm_utils.h                       |   8 +-
>   5 files changed, 109 insertions(+), 32 deletions(-)
> 
> 
> base-commit: c17b750b3ad9f45f2b6f7e6f7f4679844244f0b9

