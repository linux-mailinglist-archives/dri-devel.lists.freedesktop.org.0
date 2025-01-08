Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 671A3A064C0
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 19:40:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D4C810E272;
	Wed,  8 Jan 2025 18:40:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="VFVLplgn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2042.outbound.protection.outlook.com [40.107.96.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 089E410E914;
 Wed,  8 Jan 2025 18:40:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YbkrKQz6q1jMLVdPKoE7HsOTiL6E4gC9qd6YrVthXVih4QCJM3x9vcXqTDoD0Sm+e1P5P/RTcP09ubTGX0E/Wi8yOxw8Gc0UbJg8Fc+jxn5Vt9H8vVlA6HPGyjlspPzTEemPcXCvdc/K1B8ErxPOqfvZy4KBJkCmnL5PdiYSZmCLt8rbSKLDprOtlM/WWsUGehcLcy1dsGrcanrZbhRHvcWpiriH06D3ZGI3uB9WL7F1RcSISrVSSl3BKv1B79o4t+zBJcaJapHpyrcaqZqm9P2z9vFO89UOluvCf2qEfrob1UEybOOHiKVcEYhQH840a3ZJE8s692lAeC8dwkry4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qq5kIxMKNEECjPfLupgIMfeE+s1kGUe5D+DVTGnLVNU=;
 b=XA1/8PZCfrunsjVMANICts/HcqV8RRw7NPnlbaOib7EAJqgN2TddxZ2c7zqOmEIMF71S5zLKWTQ23n5tiKoC/k65zMFaFiYAYRlyc3BEY76IJFAcFE3re8m/dTs1v8t3pomujNf/yupTMA9LWWhi9GIS7JAxUWixYYPE1fHO4Hog+5Zt1UpqPx7ZzIpYfmH0aAWdQDPy7uJgrTd2JzHfUvkooXZL0k+AjB/GiMdDPhf2Q+hDkz9EW4WvX5c3IKj85NrQpvSsYVDTcsIM+3vegmmfXpYMQfafD34lVD1NFAF3+BgtcXGlfLqxq1a6Vx1oXxUp8aDdwrU/tCxl8zjJAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qq5kIxMKNEECjPfLupgIMfeE+s1kGUe5D+DVTGnLVNU=;
 b=VFVLplgnOU13f0YHgOjwk0+rro6m9TRuVPqwnJVqdC/uix8DgIFXnINb/pbOmI5LVGrM0AVqCD3oQeAjsp3DdOdzLV/1htHgdBaosz98dHkbaDmiK9Z+HmptHUE7tRzut7dQNuCs+UuYRarGH9fi83tgn83lkQWJ8yEZIody6dA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6108.namprd12.prod.outlook.com (2603:10b6:930:27::15)
 by SN7PR12MB7884.namprd12.prod.outlook.com (2603:10b6:806:343::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.16; Wed, 8 Jan
 2025 18:39:40 +0000
Received: from CY5PR12MB6108.namprd12.prod.outlook.com
 ([fe80::46e5:5b51:72c3:3754]) by CY5PR12MB6108.namprd12.prod.outlook.com
 ([fe80::46e5:5b51:72c3:3754%6]) with mapi id 15.20.8293.000; Wed, 8 Jan 2025
 18:39:40 +0000
Message-ID: <4372d931-865f-4b91-8122-fa5cd1b554f2@amd.com>
Date: Wed, 8 Jan 2025 12:39:38 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: Fix shift type in
 amdgpu_debugfs_sdma_sched_mask_set()
To: Dan Carpenter <dan.carpenter@linaro.org>, Jesse Zhang <jesse.zhang@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Hawking Zhang <Hawking.Zhang@amd.com>,
 Tim Huang <tim.huang@amd.com>, Likun Gao <Likun.Gao@amd.com>,
 Yang Wang <kevinyang.wang@amd.com>, Le Ma <le.ma@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <d39a9325-87a4-4543-b6ec-1c61fca3a6fc@stanley.mountain>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <d39a9325-87a4-4543-b6ec-1c61fca3a6fc@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN6PR16CA0045.namprd16.prod.outlook.com
 (2603:10b6:805:ca::22) To CY5PR12MB6108.namprd12.prod.outlook.com
 (2603:10b6:930:27::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6108:EE_|SN7PR12MB7884:EE_
X-MS-Office365-Filtering-Correlation-Id: b313bde0-517e-40d6-937a-08dd3013cfb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MDQvbEtWVS9XMnFLdmNIZEh5bzlpWFRyUmJSZXRhQnpmSURUdGFKeXJHbmhR?=
 =?utf-8?B?ZlVWSGZuZmkzMGxmSXd0TEV6UHlBR2EwNUhEZTB3Sk5idytDaWxyeUVzVTUy?=
 =?utf-8?B?S3h2b2ZsL09xcGJxaTJRRjRYRGdiQXRsSzgyS0d5M1NDdkppYUZCV1N1bG9i?=
 =?utf-8?B?YStpOHdFbFQ5NkpJWUlWVHFIUllZTHhkb1FyVGNsaExSUHJoUkZVcTMvRTFB?=
 =?utf-8?B?L3JxSVZrMHhJbkw4U2lhWll1V2JFNU4wejJ5UzJmMTg5RXJ4L2dQYUc5dHZV?=
 =?utf-8?B?Y2RNTEFVYkZkbDdyWmlrOHVFVHVGMGpiUjcyUkpDaGhuck8xVEhjcC93Q0Ft?=
 =?utf-8?B?THJsNHlhL2syUkxGUTdDa2dtYnZ3RXMyV2pMNkRTRWRYVXdaQitPV0ZQVHow?=
 =?utf-8?B?andBdzhvYll5TDlzS3c4ZFlMUTNKS0ZFOE40bkI1b1o2NjFRdk8wMDAybENM?=
 =?utf-8?B?T21tbFFXVXZGajFHTFA1Q3VSUzRBaDFocXdoYmNrdHExaE1ycUlaalQ1Tzcx?=
 =?utf-8?B?YTdmKzFBczNxMnVERmFVRG5Xa2tuU1o3ak5sUXNnSTY2dER4SWExaEJuTlhl?=
 =?utf-8?B?T2Mwd0RzZWRJS0ZCOGV6U3k0R2pMTjF2Z0VWdldPWWlhay9aR3plcWxQRnI2?=
 =?utf-8?B?UGFwQ1pxTE9pVXozRDcrMnkrWXUzMUZjRFJNYVRNYXdJUU15UW9RRWVDQXMr?=
 =?utf-8?B?SklMUFdaVC9JdUNwaUtISzE1TGdsUGdsU2tDdHJFWWgwZW9ubE5mQmJ3MHY1?=
 =?utf-8?B?NWtQUjRrWUhxUXUvL215eGFEcGZpRSs2bEd2SmlpaEZLQ1pkUWY3VWpoWlEr?=
 =?utf-8?B?bkc4Sm1LSFFhT1lyenNLZ3pNOXhPL3N6dXJLUFVFVHQ2THJwU3JXZHY5dHRR?=
 =?utf-8?B?RFdUSk1INTc2bGxvLzVkZXhUQjAxUXREcnBXTjJQNnhkSkNoV2VBaTY4dXdT?=
 =?utf-8?B?MUN0MGlDTmZvS3haLzk0WkJlK082ZjA2KzFrTkxwR1dCZ1pxbWgzT3Q1NFc4?=
 =?utf-8?B?eVdRSjNZYjk0cGRrdk1oUEtuZGxHM1hnMUtBZTArdFIvUkVrclMxWmFwYVlp?=
 =?utf-8?B?Y2xEREdJbjF6Ykhpb0VPM0ZNZnNoSExLQ2NYLzBYK1dPanJGMjRNalZERUFz?=
 =?utf-8?B?RTIrRkJScEliTDNTMEhjc1dITVI4T3oxMUxQVllHWW9rNjBnRG5YbDRLanhi?=
 =?utf-8?B?NUtxTGFBTUlTbkRVdWVaUGVxUldiUyszVkIxYWdRNTdlWmN3NFovdzlCTmo1?=
 =?utf-8?B?Nkk4MDlVTTNwUWI2bUQ2OSt1S281RW15dDQxcTlGSEY3OEM0VXpBREpKalAz?=
 =?utf-8?B?N29VMWhwUmRIVHFPU2tHSitnUW1LWDBjbzFQT3dEc3p2NldaS2pORUZDcWhl?=
 =?utf-8?B?eVNDZkE0NDlaTkVOMzlVUk5RUWlUZVJrMUE4MGwvK1p5bzFXQ3N6WjdOWjV4?=
 =?utf-8?B?bmxQbVBUYkMvT0JDaHR5aVBKWENpOVpCamE1dmZ0S2x5amNDeVJvUDlEakFI?=
 =?utf-8?B?R0M2cmNaODJHbFhFSEMyWCtxdkFYbmFJbHRwUWVYSStkbVFMZWpJNFhHZzFT?=
 =?utf-8?B?c0pzV205MmVJUGpuNUhVYlg5NUowbHNlWENrYVhmYUhGVFFMR3BDMnUxN1Zy?=
 =?utf-8?B?SXB1bHlZdVVmYmVhS2lpdlQ4N0xqQWhqRm5CdHFnQnEyb2MxbFpaQjlpZFF3?=
 =?utf-8?B?UXpCaE81WGZtbDFXUXp4a2QzbWNqdWY4cWt0eVZnRHZhQ2M1WUI2M0xjaHVQ?=
 =?utf-8?B?a2FZRTBvc0RBWjViL085YkpVd0pxbDM2WW5LbER6cWJYUVpzdlYwdlRlTGFp?=
 =?utf-8?B?ZlVRTVlMSzlwY0IzQkxWc053UTBZUlhINitJRjJyZitmL2wxa2Vqc2srY1py?=
 =?utf-8?Q?jomJAmZ1GV3O3?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR12MB6108.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UEVWTE9wODJaWUZoL0Npc1VxV3NnMy91NUY1OVJsNmpFcVd1S2w2dVArdEFu?=
 =?utf-8?B?QU9JaXpUTitNVC82NjZLMlhrbEJlRmNRaHEwUStlMUt5SzlEbjdnOGFnZlNm?=
 =?utf-8?B?Y04vcStwNmZKTGljVHpSK0t3a255K210c25QOWQzcG5pelNqSkZjOUh4bTQz?=
 =?utf-8?B?TGpIV2p2NU53Wm5FOUNnVk85SGpKTlZRWDRHR2d3OG1nQzhxSzlLTFhheGdm?=
 =?utf-8?B?OHVMMWQwL0RVZUpCREtsTzlsZ25KSFFmU0c4V1pHcTlSL2svUlQ1TWNMeFNV?=
 =?utf-8?B?ZUsxQUNDcWpYYjR4emdKVllvZ280b1dlZFRZSFNDRmgzU3Urd05zazJHcmsz?=
 =?utf-8?B?Z2tYTU9hMDg5NFZzSmF0b1YwOVhEMWc2ZWh4eVl3VTR2OFYzSGZXZDlrb3cv?=
 =?utf-8?B?cGsxUy8zSkd0Z0NJWStXNExxVE04MENqNlZDUTJoMEYxeWl6QytwNWNTMUtB?=
 =?utf-8?B?Y0NabXhaN2QwTGN3SjFObnZ0T0VhMmhjVzRCU0NxUWxKYW5Fc1lqQkcwSVVT?=
 =?utf-8?B?MThhYjRYd3dYTVo3NitPRVU1VnRNc0dYYjhBL0N5SDVMNTVjTWp3czFHelRI?=
 =?utf-8?B?YldxTXRzRWxwTS8yMHB5dkVMbUhjT0QvUk5pcGUzQUVGdyt4WjdDMDBBc09X?=
 =?utf-8?B?cFdyQklTeWhTWkw4VzhiU2JkY0lDNHFBT2d6VXI1RHZrcmRqbEQzOFQ3OFFY?=
 =?utf-8?B?YVRjREc2Ty9SbjA1WGRWazlWM3lHZkowV2VVcTFPWHJvQnlPNXpuTVBNSHZl?=
 =?utf-8?B?ay8xMkd6UmllbFBmVjljcHo2N1NScllpY21JMUpEbys3d3kxMy93dFg2b1BH?=
 =?utf-8?B?Z1E0NmZ6VGFzdHI1MUNsSVNTZTdiSmRYa01wQ2xJYzJnNTd0L1hFOHNQWTFs?=
 =?utf-8?B?aENHcFdOZTFsbjIyR0d1SXdJWTBtSEhDUE1tSG9KYm5RSVJyMDd5VTA2RS9V?=
 =?utf-8?B?Z24vaWlkYUpEbU1MY0pUUmFkem9qcXlHV1Y4b1NLNUJRQ1A5M256UWNabENq?=
 =?utf-8?B?YkVqR2VaYjRXbUlhN2pET0REa3AxdlRudStxSTRkNTJSRGlFc1ZSbmVnbmN3?=
 =?utf-8?B?ZEFVdVZYM2lOZjQzeEIva2F1S0VFb1dpQzI1M29Va0NRcTRZUGdPTFNOL3hs?=
 =?utf-8?B?QVcwejFwVXZMZ1lsSDUwY0VkSmJBWHoyQUR3ODlVemJVVTVkNy92b2tzQmt5?=
 =?utf-8?B?ZjFzalJES2plQ0NUeVF1VzdoYkFwQ1R0OWxHd1ozM3RGdUhULzRCYnluNHJO?=
 =?utf-8?B?WFUwZlhlV0RyNFdrc1pPbDNwY0Z0TXoreEpPMFdXU0FURnYrd0dzdU56Z1B2?=
 =?utf-8?B?UVhEWEdrK3ZITUtZc3daRS8waEJ6Y2wyMzFDbXk2ckdEbTJiaEJ6bTYxS1NU?=
 =?utf-8?B?cUZEeEF5d3ZjRUF3M2M1UFNXMG9nZi9pNWN0NUVQbTZUamlheHI4OHdMU1hm?=
 =?utf-8?B?N0hXV1ZVNTByQ2QvM281TEJoZ1RsNkxWZ3RzckpmK093SGF1N1dDNjFVQUZq?=
 =?utf-8?B?YmM4WGoyaUpSQkVGVHJSZzlSeGR3WXhSZW0vUXloOHArS2xtZWdvdVZmS3cz?=
 =?utf-8?B?cms0YWtmeGI5dWxJYmhhbi8zbEZJWkRjSjZjMGtzdWg2N0tXNWp6WDRBYUc3?=
 =?utf-8?B?M3lYYWU2YUxZNmR5bTRlV1dPekRtWEJUQmtZNXI0M20zWTBOb2ZJZm5qTWVp?=
 =?utf-8?B?L0o5dGdEM1l4cUpXd2Y0NjVvMDVuTzgzbW9uWnJ0UndkaGV5emtsRHRKVGlU?=
 =?utf-8?B?R1FPajRPSXoyVWhraVd5M1JWUDlOR0E0V2x6NXg4Y1lqVzVjcXdUOUV1TDl0?=
 =?utf-8?B?T1BNbnhkSlZrMzNiS29COVoxZTdCN1U2eENLWGVoaXhFczM3WDErRlFBYWNN?=
 =?utf-8?B?bEdyQVVVYXpNRXBlUktvTkg2NWJ3cU1xTTZuUDlkOGtDVWtzbGVCa0RlQ0Ev?=
 =?utf-8?B?S0ZBQ3hFTTlhUko3Z3VVME5Hc1RjY2hJU1d6ZTY1VDBYWXpDU1RnSU5VSkFo?=
 =?utf-8?B?L1NCWGFUbWpiaHdlZndJc1FPcHdkUk5EbTR1cldMMk1NRjlucjRZajFwRGlz?=
 =?utf-8?B?M0twczFSTzd1bEpaSWhBaG4zWURKekh5MXBPQ0k3RVFibnVDRlJ3dnl1TW1J?=
 =?utf-8?Q?RNelkU7oLUBQaXXTYmQM7X6FZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b313bde0-517e-40d6-937a-08dd3013cfb2
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6108.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2025 18:39:40.5011 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bRyqeaYUiXl4bNAnzqw1NqDSc6xtffenNTBQ55ehl/7toikMy9xrRwqnWoLgJgDI7xwRJvctqHSfUScu3UJRmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7884
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

On 1/8/2025 03:41, Dan Carpenter wrote:
> The "mask" and "val" variables are type u64.  The problem is that the
> BIT() macros are type unsigned long which is just 32 bits on 32bit
> systems.
> 
> It's unlikely that people will be using this driver on 32bit kernels
> and even if they did we only use the lower AMDGPU_MAX_SDMA_INSTANCES (16)
> bits.  So this bug does not affect anything in real life.
> 
> Still, for correctness sake, u64 bit masks should use BIT_ULL().
> 
> Fixes: d2e3961ae371 ("drm/amdgpu: add amdgpu_sdma_sched_mask debugfs")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---

Applied, thanks!

>   drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c
> index 632295bf3875..174badca27e7 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c
> @@ -362,13 +362,13 @@ static int amdgpu_debugfs_sdma_sched_mask_set(void *data, u64 val)
>   	if (!adev)
>   		return -ENODEV;
>   
> -	mask = (1 << adev->sdma.num_instances) - 1;
> +	mask = BIT_ULL(adev->sdma.num_instances) - 1;
>   	if ((val & mask) == 0)
>   		return -EINVAL;
>   
>   	for (i = 0; i < adev->sdma.num_instances; ++i) {
>   		ring = &adev->sdma.instance[i].ring;
> -		if (val & (1 << i))
> +		if (val & BIT_ULL(i))
>   			ring->sched.ready = true;
>   		else
>   			ring->sched.ready = false;

