Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 967E1C07095
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 17:43:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83A6910E200;
	Fri, 24 Oct 2025 15:43:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="p5z+oZlg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010026.outbound.protection.outlook.com
 [40.93.198.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0948610E1AA;
 Fri, 24 Oct 2025 15:43:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AW8tFmWy3Sd2fpqra/WaN7fsNem079cKsymdIp1zF1l4v05fsyoaYhxz4A2V1YSURY6zNgD6TUGKgkVK7LzYbxY33f7zhBG6jimHqGOvLDefhVytdqFLJjdTmqgzKkCyV7azkAK2rjQ+8hcihHdYN6rOQ+j1+f2K/G5vy2tsd37P64sneuYJx0SX2flEtcEVGrRwL6jn24BCBfQ66ZEK/8ESAXnAWAspJTUT0XBxLySgGVeziZyn+Tk21sZsgTEgO1DeInSy4SOd/hzd5BDJL4+JpugXrfkQIx3YiVivy2hOO4oqxAOnexFJgHf01xa2q299lepXOCYKpW8HgfCF+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZabFzHQas5aDmfF6QrnKGxtEbsrQepISnJ5+lfknszw=;
 b=fmzf6UIfyPdV5+zq7FjswTidiqXGS9QYM63wrthiSdnuugd6EUobGqE0iLCupM35TBd9o7f5uZU/7y8YN7JwENoHLkD9d1ODbTfsnSl1zFcGWRsS2MlKfkBZxSQQdj+v4EuB5AKaUCsfKBe8bMaVdIrbY7Gu5zB8FhF2FQdkMZuv0VGjs4U1PEC/SDtSkP7br3fMzYy4X3us7foV9rZjWl03EE+kK+ZnAou/F/ABvJD6nBl7+P1oNoY9VqQvXBCox1mIquRbnsV3d1lHpmV1PvSkMByKwl0IrEvJ/TWxokEwAZUD1ltlQ66DiFKY9fSb7I3+CMRwSF04WvlbottRtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZabFzHQas5aDmfF6QrnKGxtEbsrQepISnJ5+lfknszw=;
 b=p5z+oZlgJATGaMc4FIE83L+NQ11vJC9MLyYulY0u/UxjqfXW8H8fwj/nDLT3De6kWo+UitoKskvblVqsiPjEaT+/dheu8i1DGu41731JarqmNRrPQKPEIEmHhhywamOcMuOP+HdvbALsAitnlQECZufPpt5/LjrC+a8Jom16tR0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by LV2PR12MB5727.namprd12.prod.outlook.com (2603:10b6:408:17d::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 15:43:52 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 15:43:52 +0000
Message-ID: <3792db59-7dc1-4e34-9436-84df4b6c3e10@amd.com>
Date: Fri, 24 Oct 2025 10:43:50 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] platform/x86/amd/pmc: Add support for Van Gogh SoC
To: Antheas Kapenekakis <lkml@antheas.dev>,
 Alex Deucher <alexander.deucher@amd.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Perry Yuan <perry.yuan@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20251024152152.3981721-1-lkml@antheas.dev>
 <20251024152152.3981721-2-lkml@antheas.dev>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20251024152152.3981721-2-lkml@antheas.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9PR13CA0126.namprd13.prod.outlook.com
 (2603:10b6:806:27::11) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|LV2PR12MB5727:EE_
X-MS-Office365-Filtering-Correlation-Id: cc9783f4-2851-4248-2932-08de13142219
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MDVaYmx6STlTSVRGTlQ3bUljbjlRNVNjWkNMZHQ5Qk9pNXVqd0c0VWxiRFJh?=
 =?utf-8?B?ZkVmWXlyYnRpQ2RHVy9zVFNtYUprYS8vOHJvMDZqYk1lajVLRFN4bEdSTk5V?=
 =?utf-8?B?UmZ3ME4yTGVPVndFU3o4MEpKb3dNcEVwNGtDMkw1eUgxTjNYUUtYVHJPTGpN?=
 =?utf-8?B?ZEdUYlViQW51cytPTUpSVmFaQ2h5OWFKS01BU2J3VW1FcVp1dzBSQ2w5SC9p?=
 =?utf-8?B?cDVGNWVrWU8rd05sN0FJZW1nckFCb1NTSUhwN0I3WmRFYzJoakZ2YUZBcWRT?=
 =?utf-8?B?OGFxSFY3OEhQaG1OUnc1S2hqYndyNnFxdnRMSXB1RW5QUjNpRWVqTEtVTFAw?=
 =?utf-8?B?R2tpL09KaGM3aENwQjFrN3hNVXR1TTQxOGpPS2lDMXJIbHRsK1JmVmhRR2to?=
 =?utf-8?B?dkd6bFFEVzFEZXlDUEZ5b1FwUlpZTUJyMUMwVUpkODJEMUVhOVdnWmRzajRy?=
 =?utf-8?B?TnBac1BqS2wvYVI5cEhjTjhCdjlIdXQzT2pSTjV1WjNpYUR1NjF3TTVQeHRV?=
 =?utf-8?B?R0tmSzlUc05vS3pXalkvNlgyK2xpUjh3VWVTd3ZBMm5oQU1DQTdJcEVzVzJH?=
 =?utf-8?B?U0JZYUsvZ2tBWC83VFdiT05RS0VRY2MxSi9sWXJ2aTR4S1NUN2p5SnMvTk16?=
 =?utf-8?B?Z1JCUnZhWUVXVjYwNUxtaGZoZGFLREVIb2NhRUt6YlBsbmY3M1ZkOHlmSTRE?=
 =?utf-8?B?SVJ4U1MwcmE3dWVhQVBOWjFiMHZ4VmFRSGRrNXlHWWRvTG56MFVnUE1jQlRl?=
 =?utf-8?B?VEJhNWRFMEk4aVpxNzVPdFlXMytqUEt2eGgvakNTUk96RWsxUXlrWVNPK3ND?=
 =?utf-8?B?eTltSytYVGhtZmtVYi9BNWZUY3VsNmZNOUFKRy9ObHY5OEZNOElKa0NpaGcv?=
 =?utf-8?B?WG9sY2FoRnQxTjdQWDF3Y1BBckhuRkcwM1hQWlQ0Y0VKazNlOVBqM3RmVHVL?=
 =?utf-8?B?N2NYaHpuU0RzRTZ3eTMzeWN0ZEJVeXRXUDdoTkVFMzRTb2tabXJNUEFxZ1JN?=
 =?utf-8?B?V1VQUzVDQmpRV2I5cFBRMkNqVTc2a1JKS3QvQzBXMmVZVzR4RFhQL1pvcFlC?=
 =?utf-8?B?QVN0UkR5Sk9yTm0wYU5LNEt0ZVZ4eU1remVNdy9nQnBqUkw5azk1M1RBUGI1?=
 =?utf-8?B?RWk5WFNSbjRVYUJ0clZBRWV1ejJWR1RzTGtKR2VkYlkrNlQ3VGRGUkpSTU9u?=
 =?utf-8?B?T0hqNzZjTy9LajV5bG5LMWx3SmJoeTEzNktCSUIrMWRCVFBNK2luVWVieFB6?=
 =?utf-8?B?QWFoOUptWFZKdUNFOWVhZDJ1UzRBb1hpL1BlVTEydkl2SmxSNklKK0hZL0gw?=
 =?utf-8?B?eG5vVllDSjZPbTBmQTJlWHNhUTR6Q2xscmlvbzRFT2U5OHdWQkQ1L2hEM25h?=
 =?utf-8?B?SWZqYnlrc1RlT0pVUzZFQjVYQlVydHAzSlFQNC9IR2ZIQlRQdXFCWVhrWksx?=
 =?utf-8?B?QlZiSm9HUDFKRitOZjk2T1JrQiszdkR2amJMbnY5TmZSdjZ1d1diUkd0d1Bi?=
 =?utf-8?B?bXdGWm1NcVR0MlpJK1hkaThGMEJDY0tWNWJpM085MzBLQnpuZlJqbU9RL3Y5?=
 =?utf-8?B?K2NlOTR2OFYyZXhKeUJwSlFQZlkxdXd3QUVyOFdSbnBoekV6WmZ0dDVBWlpD?=
 =?utf-8?B?UVRzVXBTUk1HNURtY01qeHlmZzNidVZkQjRTYnpmOHZZZlBTK0NBeHU3R0tu?=
 =?utf-8?B?SENKK2VWb0tzOFBtdDk5c3N5WHVFRVJxaUlUc0hOdEVyMDhsbXg5WnBHMWln?=
 =?utf-8?B?QmlybzJiNTJNN05UdXlZblJhZUJJTWdEcTNmNjRld1QrK1RuNU5ydjJNY0Iz?=
 =?utf-8?B?UDZFY20yRUVPUEZmUXpGc0twMjZGaUFPRmZ2aDBQSU11S3FZa3E5RjFucS9G?=
 =?utf-8?B?N3dOd1IyeEM5UUtsRGkyZFlhOVQyc3hPSFBHQ2xhaEorWFE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S1Y5ZWh4QjVORDIzN01aSi9kTHJuNFdWOEJiT3A1Zy9YTWwzN1VkUVF1Vkxh?=
 =?utf-8?B?b01jSk5McjUvellVeUVkU3NuQzFBd1hoUi9EeEN5ejNVWVZ2Q2N6TVFWWHQ1?=
 =?utf-8?B?dE01YVh3ckVZQ21HVThnWTFYTnY3Qi8rUzY3cTRYVUFoSWVrdjhXV0R6MEdQ?=
 =?utf-8?B?cVlKQStXQnNaak9UaG1pNW1vVHRFeGtkK3pxVDFVc1czZVI0RWJIRmNiUXNM?=
 =?utf-8?B?K1BaY1d4d1IyWDJMZUdxNm5kUVBNQVN3VzlFVVAwQm55S3lIY1BqOXlhdjBJ?=
 =?utf-8?B?dHhMVmNsUjJVbFFKV21QczVUcWl5ZGJOamZ5dXZWT1RhL3JDWnVqbTJsV2NF?=
 =?utf-8?B?TWZiWVNnblM2UDhZZFRWcnc4eGhDWmFmMFhjZ0xSWnR4dmdjVVRqK3FSdDlE?=
 =?utf-8?B?UmdYU0tEM0lQNmVJOHhYeHRKVDFKN0Rqc0RFb1BMaVliQ2RrcGJHd2s4NVln?=
 =?utf-8?B?R1lXbXR1NU1ZUDN1ZU93Y3ZaaUJ0YTBmRTJleG90UjR4WU5yc2hua3BYVjlL?=
 =?utf-8?B?aHhvZ3licFZIZG9RQ3FqZTNaUiswSVhDb3JsN3J0bmQrZDBxQWZvTEJZc0x4?=
 =?utf-8?B?WXNHRGoxeHdEMXluZUJlU0JtUkhlQ2ZJQlIyU1k5STdxMlV6L21peEtsWDNG?=
 =?utf-8?B?TFRweXFyWW54TVE1MGpUZ21RTlg3R2F2d3VhUjJMNXZjODJZV1g5MlZKTmZy?=
 =?utf-8?B?T05aLzIrQnd2VUkrUkxjQUFiSzNON3FtcVI1bW9zMU1yZ2F6LzVCb1F6eXJl?=
 =?utf-8?B?SkZWZVJIOEpJNkN6bmVHdnY2RTYyeUlJdEZsS1VxcUJLRENKampkWUwzVFc4?=
 =?utf-8?B?WjlseHBSZmhjN1VzanRIazZhK3laV1VXMmtDek9QcmNWQTFRUXhhelBmN3Az?=
 =?utf-8?B?RVZ5TjBkZW5oQXR0L2lybnpSRXJsYTVDb0dGZ2NFZDV5cUR3dFBQaW5kaDF5?=
 =?utf-8?B?a2lVbTYraFFBd1lVVkh0eTRTRGgyWEhsbzd4cTZrZDVGSzFwd2tmbFpIdUhr?=
 =?utf-8?B?TEtRU3VOSDZ3QWVicEZIcit0Z0dVM1NqUThMVVBTS0JjbnEyTFhtVm5DY2hm?=
 =?utf-8?B?ZWp4VlRSQ0xJNEZwRGFqSUJDMHlMeUgzVFRVdVdZb21adnFtRkdDdjl5OU5s?=
 =?utf-8?B?QlZlTk9sUkZQT1E2dXZleEVQN0RQSGEwc2RCRVIzM05qblUxTS8vblIvV1Av?=
 =?utf-8?B?UU04bnV1dDVaeFh3bFZwUFFVcThuK0o2T1hITTI3ZEFvd1drYzd6NENCVFMy?=
 =?utf-8?B?RWJlUk1wRFFBOUMzOXV5cys3dGhyTy9uSmxQNXRGakR4b29WSCtMTVpjREZ2?=
 =?utf-8?B?aWJ4ektMWWhnY0hPVjJ1SkJ5M2FJZmtxeVYwTldYb0NkZStUcEVxTFhHdWRm?=
 =?utf-8?B?YXpMYmROWjNvOTFHQ3F1T1pPTVZKVmZ2Z1g5MzBibW90YlN0VFBSVllqMkV3?=
 =?utf-8?B?cElLVzJDcXpVYm9zd0l1YlFhazRwK0FPb0U0bHBsYmtjYWpsTkE3UmN4M1Fs?=
 =?utf-8?B?VWtzWVpSSjZBaVVPOXA4TUMxbXFSZFA2QU9HZm9TSWJWblNjN2t6Mk94dlUx?=
 =?utf-8?B?dFB1MWdaZ09mL2RhQ080aCtGNnQ5Q256dmdhSWY0TEo2TGVFbHBDZGk2Uzdh?=
 =?utf-8?B?dFdkT1NjdkJ5bWprZWk5TzAxNFQyZHdBWUtHY3Joc2lwY2VaVzRJUERUclZY?=
 =?utf-8?B?T3EwbkE2MThpRXlXTDcxUnNIWDJhbWlvcXl5Yk93MFdodXFjK3JSR05PRE1V?=
 =?utf-8?B?cUpYT0xHaXlmSUtncXNxaENhTC8zb2NJeXVKSjc2SWxaY2hwR0prbnRlREZV?=
 =?utf-8?B?ZWtvL0R3ZXozM0tiYjBEK2ZDNnpqWTF6TDFDZTNpNHFDSU03amdMQWp1cUhw?=
 =?utf-8?B?Z3AyNVVkNUZNSHlJdzNCRC9wandsS2RtU05jL1RuT3ZnczhWYTR3VFowb1dk?=
 =?utf-8?B?SGphc3VRVTltaENEWUNrWit0Y3lpbDV2UW1MZzlJaXZpdDc0MzF3Ui9iVTdY?=
 =?utf-8?B?M0wybmN3ZHpHOXFMSm1GM0p0YytkeFVqR1Jnbk90WlFUUEFER1BCNzJveEFD?=
 =?utf-8?B?R084dmRYN3hKUHRVU2lrdW1CeUl6L2hrWGNCcERMNnJrT3NEalExbURTMFdS?=
 =?utf-8?Q?APugZNl9y1yN8N9Y6CsVgIBDd?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc9783f4-2851-4248-2932-08de13142219
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 15:43:52.8104 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zKr8nkhy18MP1WLvThOfSrWZaAQZIJGY4UW/e1f7EreIh8voVfn8AmekV4IQYn85JN0XOYxFpto4kqeCnhXD4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5727
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



On 10/24/2025 10:21 AM, Antheas Kapenekakis wrote:
> The ROG Xbox Ally (non-X) SoC features a similar architecture to the
> Steam Deck. While the Steam Deck supports S3 (s2idle causes a crash),
> this support was dropped by the Xbox Ally which only S0ix suspend.
> 
> Since the handler is missing here, this causes the device to not suspend
> and the AMD GPU driver to crash while trying to resume afterwards due to
> a power hang.
> 
> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/4659
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> ---
>   drivers/platform/x86/amd/pmc/pmc.c | 3 +++
>   drivers/platform/x86/amd/pmc/pmc.h | 1 +
>   2 files changed, 4 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
> index bd318fd02ccf..cae3fcafd4d7 100644
> --- a/drivers/platform/x86/amd/pmc/pmc.c
> +++ b/drivers/platform/x86/amd/pmc/pmc.c
> @@ -106,6 +106,7 @@ static void amd_pmc_get_ip_info(struct amd_pmc_dev *dev)
>   	switch (dev->cpu_id) {
>   	case AMD_CPU_ID_PCO:
>   	case AMD_CPU_ID_RN:
> +	case AMD_CPU_ID_VG:
>   	case AMD_CPU_ID_YC:
>   	case AMD_CPU_ID_CB:
>   		dev->num_ips = 12;
> @@ -517,6 +518,7 @@ static int amd_pmc_get_os_hint(struct amd_pmc_dev *dev)
>   	case AMD_CPU_ID_PCO:
>   		return MSG_OS_HINT_PCO;
>   	case AMD_CPU_ID_RN:
> +	case AMD_CPU_ID_VG:
>   	case AMD_CPU_ID_YC:
>   	case AMD_CPU_ID_CB:
>   	case AMD_CPU_ID_PS:
> @@ -717,6 +719,7 @@ static const struct pci_device_id pmc_pci_ids[] = {
>   	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_RV) },
>   	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_SP) },
>   	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_SHP) },
> +	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_VG) },
>   	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_1AH_M20H_ROOT) },
>   	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_1AH_M60H_ROOT) },
>   	{ }
> diff --git a/drivers/platform/x86/amd/pmc/pmc.h b/drivers/platform/x86/amd/pmc/pmc.h
> index 62f3e51020fd..fe3f53eb5955 100644
> --- a/drivers/platform/x86/amd/pmc/pmc.h
> +++ b/drivers/platform/x86/amd/pmc/pmc.h
> @@ -156,6 +156,7 @@ void amd_mp2_stb_deinit(struct amd_pmc_dev *dev);
>   #define AMD_CPU_ID_RN			0x1630
>   #define AMD_CPU_ID_PCO			AMD_CPU_ID_RV
>   #define AMD_CPU_ID_CZN			AMD_CPU_ID_RN
> +#define AMD_CPU_ID_VG			0x1645

Can you see if 0xF14 gives you a reasonable value for the idle mask if 
you add it to amd_pmc_idlemask_read()?  Make a new define for it though, 
it shouldn't use the same define as 0x1a platforms.

>   #define AMD_CPU_ID_YC			0x14B5
>   #define AMD_CPU_ID_CB			0x14D8
>   #define AMD_CPU_ID_PS			0x14E8

