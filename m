Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC56E9148F1
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 13:39:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7838710E401;
	Mon, 24 Jun 2024 11:39:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="YUyr5Cw0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2068.outbound.protection.outlook.com [40.107.237.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04E5510E3FC;
 Mon, 24 Jun 2024 11:39:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=duPiCLmSct8Wc3fqH6SFetmqpBd3LEx1Jsm682l12E+VRKEnEpAeF1ecY0zFa0ODRnNukzgTR0rBuZ+IWXTZIgkr8QK1Govhem1aYa7MrwCXyx2qlzjwJEJf02t2vTAjTH0TTUTgb5et6Vbg6DlB8ZhwU1vCzp9A9xPu6OEoyDb3ux+MBACTrFI3954FLnJr/jwWMhjKY2z0+dbpIpklydB0u2mf7XjVDbcoa7xmInT1yrIpk3Tn++FGQ8+t4IFPfAkCDNpClw+KrQOPY7Kne4Eq3YbF5701ufkzhywhjpTktmhNxrOwBBgeG2V4V7cNj13BKt4CDVMZtrptuc+A6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XtHpDNq1k8ex6zyWRObp3krSwk2E5vCZHSW94yAF08w=;
 b=iIP74cOzNHmvZ2bUUu8bbftQv2kTOWPxDwk3VFEdQMR1rS8QEimY56ZjzNewu5V3yPQy71drcuvw3lz+G73LcE0QjXZeD3OuYJfYr+7EZs7k+Xn5G9P8yVLseDn8SlQd58PQaNzQHJESXXTzLgbArHGPK9ox4xwWqarsMiSTsmZtKrnFerS0+PznqjRiOsh1sYmNepJUkV+tdeqAZP8kKkRNQZEbh3NMbC2bggaZ7T95IEGBbUrRFm08FeueT4ZVepZJSdKf/TBkk3aEl3COfS2i8QVqDslLjjYlqDApffLbzRwpq6rCy5X8qcpUkEeY5EEjhczosLLe15TTL09CrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XtHpDNq1k8ex6zyWRObp3krSwk2E5vCZHSW94yAF08w=;
 b=YUyr5Cw0vLBUBXm3NnY22nWMvCi0051+f6hC/JKr8YXHQVGSAowsx1LZpg5G3qeA/aBs+LfS3Yr4frbzuYpF61xeM9pzmH40UiyHgFljpo8ax+Rqw3Mf7iJfbSzLhS95U0KMtS/zme8pHrIWKEmYvNVD8d9eUlH/p/wLnAFKw50=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA0PR12MB4350.namprd12.prod.outlook.com (2603:10b6:806:92::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.21; Mon, 24 Jun
 2024 11:39:30 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.7698.025; Mon, 24 Jun 2024
 11:39:30 +0000
Message-ID: <7d576b58-81f7-4f2c-8932-70b96764c634@amd.com>
Date: Mon, 24 Jun 2024 13:39:24 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ttm: Add a flag to allow drivers to skip clear-on-free
To: Nirmoy Das <nirmoy.das@intel.com>, dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
References: <20240624100721.24331-1-nirmoy.das@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240624100721.24331-1-nirmoy.das@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0009.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::19) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA0PR12MB4350:EE_
X-MS-Office365-Filtering-Correlation-Id: c87ca098-20f4-4e78-b6a8-08dc94424fa8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|1800799021|376011;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V3B5akc2L09zczZ1cE10NUVGU1RET0NreGdPREFKVVJYc0tuK2pjd1JuRjBO?=
 =?utf-8?B?L0drc0hTRDZsVW1Ja2dncEZ1UEQveTl4MGl6VjhVOGJscXRrWjRDc0I3WXBy?=
 =?utf-8?B?c3JrTE92K1JIZnFRRy9ESzR2QlBFUC9xeXRwMWFZN2pYdWx6SlliU0E3WDl0?=
 =?utf-8?B?VUxFVHhLTFdxVTFBZCtwbkVHbUxJcGpvK3lRdlR1NXpBTitLNTVGOUl2U1gr?=
 =?utf-8?B?VXI2SkRWRkNxOUZrUWpIa29teWxkQWNFMUZnWU1pZHQ1VGRJZy9SY0dUc1lS?=
 =?utf-8?B?cXVRTmxkUEFLTmFMRWpTd2tzTFVDZThaOHJuNUlMbElxemhMalQya3hpZjdM?=
 =?utf-8?B?S3NrcHBNODBQOEl3QzRRWi81bXFueEJJOGJ1SzB5MURkbGU3MWJYN1NSYWRu?=
 =?utf-8?B?TElpWndxUVc2bmhINFp2emtMQnNjSzM1bXNadWVCNHRrSUx3aWdodndQTCsv?=
 =?utf-8?B?cTJMYjBjT0tNYjhIQTNLVjFmemNGOGhnMFFha0YzYXB1U2ZYL2t4b2xXZ0ls?=
 =?utf-8?B?MlRMNkdBMzcrUnF2S0RyNVNzeTdpUmRQNEhFRFMyRnVqSGE0M0pjM1I2SDVm?=
 =?utf-8?B?RmZvVm1RRFpkOGM4Z29Nc0lhVWRwYXl4VHJvVVZsYlFwdm9LQzlYN0NTckVZ?=
 =?utf-8?B?bHBZOTRvZXN4L2pCaHJSaW0rb1BZWVdPa3dPUFdsbnMxQURwbUpRNVNDdmtR?=
 =?utf-8?B?aEZFTW82L1o2RHZmcHJ5MDJKQTBWemVONnhFS3MwR2crZFVjcDRrT2RlNi9C?=
 =?utf-8?B?SFFkMmJHSENvbE80WEpuTm9zOXlIMitXWXVxelpYN0tDOVRIc0htOHZNRmFG?=
 =?utf-8?B?RXE3dkxlSnBSRFgyaEQ0MkZ3Yy8vbERqbzhaUnNHNzl0T0U0NkxIRFVRVWpn?=
 =?utf-8?B?YUg1U1hWVkpNL1dKT280N3A0TlZxMk9LVW8xL2pxampaeWVGZFoxc2JrV0Ji?=
 =?utf-8?B?UlZKZzMvNFRRN1ROSCt5Y0s3RXdmWE5OMGYzUndpM2xPRzBMdCtzR0ZkajVi?=
 =?utf-8?B?YXdOZkVHVjVmb05KcGNNazNkK0lCNWFwVjcxVGVnL0RiZTVERXZ0Q3dBRDJk?=
 =?utf-8?B?TzFWa01zSkpxVHlGK1FObG13YVVhS3FIMHZDS2cwL0tuRllmYjlJQ0FMQkJ3?=
 =?utf-8?B?OUxsck9BTXVXeGdReFhXb3dIVmNCMFlMN2JPMkl0VW8wWWJGbjVLWU40L2VK?=
 =?utf-8?B?NEZpSkpTSk5BcnV0M1FiUkxLbEoxbGsrcWwvUWN6M2ZxMkc2M0tlRld3YXVl?=
 =?utf-8?B?akNOd1lqYWpDUEtwVFVOT1BzS2dyUnNSay9hWkRoelhKZlBIaFpEZU4xVlRt?=
 =?utf-8?B?UjNrRDRyVWVwd0UzME1IeHVqOXFSNElJcXJDVXhaUkRnUHZQV2sxS21pRTdQ?=
 =?utf-8?B?V29JYU5hQThvc1BIWERWWXJKcHFtQ3JiOGZNdXd0M28zbGdQdUhQMEZLeG9W?=
 =?utf-8?B?anVhMGplSGhQWXZ2S2JKWVc2dTBVVXNoQWJPc2FzR1RUUnBybjVmRmh0WHpB?=
 =?utf-8?B?WlhBRnFRekJmK2V3ZFU3bDcwUVd2ak1IcXFlNHc1YnhCaFJDTlhrdkpZRyth?=
 =?utf-8?B?MWJKQ1liVFFmWDA4dzZFci8wU2xFUzRqbkdDRGdFRS9xWDN2M3k1aURjdVRu?=
 =?utf-8?B?d0YzMStkY3U0TUkrQkFUZkJHL1B5YmZUNlZ5YXNnNGFTdEdLU2pJRDFuWDBC?=
 =?utf-8?B?NFFWQjZ3bk01Ujd5TkVJNlZqdSthVXRVdXNnRXVyMGRNWEtHU2haMVcxVlRD?=
 =?utf-8?Q?zhuEC2V/mkrzeW2H0Tmw80AUj6PCkJXM1e3U4pV?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(1800799021)(376011); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QVZ2V3E3eTRGeTlZMTkwUnQzaE1GU2Z6NUlLdHZaUmRpUTJmMlNnY0R5emZ6?=
 =?utf-8?B?UlpBalNGTzIvakwzZU9SRk9IaUY3d21vWXNYaUxMV3dyY2RGdEdWNkdHMmhR?=
 =?utf-8?B?SVpDWnhvMGwzSlNUNkc0WTM5d1NIUENrMHIxOHdiMjlEcDdRb25VYmFwUTRj?=
 =?utf-8?B?TnFSQVR3MkpBSnQ5ZHQ5clFWdHk1ZzRYcHpXWFAvSjByUVVvclBJQ1JOdGFR?=
 =?utf-8?B?aHBYcU9EVzdja2ltVlRzaURIWHpkaWdLWnQvVTR0blVyWnpEOGkrOXh6SmtB?=
 =?utf-8?B?bWNuc21ubEk1Y0MxdXFWYXNndVN6WjFvKzdVSDZQdnZlYVU3eU1neGMyYno0?=
 =?utf-8?B?Y2FpTElZVnZyYkhKRUpzdzllR2Y1SEw3Q01TL3FmN1IzdkNsTlF2N01jdU92?=
 =?utf-8?B?RlUxc2twM2wwaFVua2Znb0FFNEtlZUpkdjZtVmZDUnBGL25jZkkvZjQxN0No?=
 =?utf-8?B?alVRZWt3V09HTjlrejR6UFhKRkZPT3lYQXhlQ1N0Y3BBUnRGY20vUVJYdW9w?=
 =?utf-8?B?ZmR1bEg2TmdwMTU2WlJucUJNem84V3U1TzBmQytmbGJ0MnV0SE9EUU8xcWFI?=
 =?utf-8?B?ZVhyR284T1VlTkNGRW13cHBRSWRCNjViUG5Pc21SU082Z0lpNXBra0kyamhL?=
 =?utf-8?B?SnI1Q0FyYW5ZYjNoTWlaNy9sb1MwcDdGRzAzR28vV1E2R2Rtd2VwODBDVnlL?=
 =?utf-8?B?RDFFWnV3aDhvNG4zN1d4ZW1WTlB1VkJQbnh6TDNnRzdWdENvKzh4RVVxMGFh?=
 =?utf-8?B?Z2lwZ1FUWEpFbG1zeW9IQWt1S3NnVE4wTmdUMUhmT3FxM2JLMGdrOWk5dVFa?=
 =?utf-8?B?Zjd6V0dsdnhJTFFaVHdmakdJUWdUbE1iVjM0M0xXcVg1NllQZlJyc2J2aXN6?=
 =?utf-8?B?MGlVSFlPTUUwR1pqcllseXpKdjUxcUI2TWJ6MEVncXp2R2VYMjFxWkVXQ2E4?=
 =?utf-8?B?Z0NsSmhSQllUb1UrdjYweU9taCthQXNKeEpkdVBzbFFXekNtR09adzRqODM1?=
 =?utf-8?B?WGhqTjZHak1ZQUhqKzJOajN3NGdGVnZKTHk1Y0dWZDZ4aUFOUjhDYkc5a0xH?=
 =?utf-8?B?MUt6ZVd6alZnWXFiV2lPMnNvZnFQMmNGdjJmWWd1UkprektvUkJITXAraCtP?=
 =?utf-8?B?ZU5YTEJtWis4NzBuYzNoRllFQUtkOWJoYzFCdjZMbjduYkVVTHhYNEhpd2Zh?=
 =?utf-8?B?OXc2K251WkRRMlRORnUwVzRLcjVRVkFKekZDTUJ4Ky9EOHJ0V0lPRUxuMERH?=
 =?utf-8?B?b2xXbm1jdXlzTVRsQ2lDUmZaMWZLWko2YWR4endYQ1FMbjhGWmZBOWI2KzlE?=
 =?utf-8?B?UWQ0UFN4c0hoZTlUU2pRa2dPZnNFMXEybDc5SEJXTUFuZlUzNThtN3FoNlFw?=
 =?utf-8?B?elpyNUZIYllDVm8rSmpkS3VZVzYveTRER0tGdXBmd3NST2V2MTZXSjJHR0Nj?=
 =?utf-8?B?M3hRK3hoSXhpa3ZoeDRPNXJweXpVSlVZcmdhNllsZmVDd0gyNW55SjdwS1hX?=
 =?utf-8?B?R3lNY0MwcTQxOGRWODFLMkNLY3BuR29IbmYwa2o3NFFSSlBOck9QMTZZTDgz?=
 =?utf-8?B?elB0RXFBTzZKVWZwaVFudFJXRzhNMkhMNmwweXkxVXVKMytnaWQxT2J0RFAr?=
 =?utf-8?B?cXVVK2tTYVZvOGYxd0hIdERJcWJteURWS3o4ZEQzRXNVdG1TTFFOclA5RWJ0?=
 =?utf-8?B?NFl3MnBoQVJhN2MwUmhYVEhwb2NvdzhtY0tVbm4xSXVXWkVRbll6ejR6RW52?=
 =?utf-8?B?a0hoR1lvN3JDanFBVk0rdmRQTklMSEM2NE5tamI3aFdvN08xemxreUFtM0hy?=
 =?utf-8?B?bktldlIzZE1rcGtDYkRQdzFGb3dVSkJVQmErcGNZeDlRM1lBVDJtSTlvZDZB?=
 =?utf-8?B?TXozQVJid2JhN3BEMEU4NWVLckFmZlJFWHQzVmlsbGZhRS9oZ2x6SHRxR3pj?=
 =?utf-8?B?RnMxZVMxMTdwMkNzRzNoSHA1TEdhZXhmclE3V1EyYlY4K0M5RFRkQzJrTFJ3?=
 =?utf-8?B?azY2eHdmcHJCL2VIRVJTblJmN3ZyVkNiZGxyVk5VdDhJNW1UZnQ3NThpV2Jh?=
 =?utf-8?B?SFNUWFlOd0FtMnY2Vm5JR1JsSlNWU2xPQ3ZuWmxhd1h5USs4RmFBK1lSOVJp?=
 =?utf-8?Q?rC5u/Ayt9NU199eRvM/x8VoHj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c87ca098-20f4-4e78-b6a8-08dc94424fa8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2024 11:39:30.6395 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SCCjRUyTjYQV/SF0/rAE/gNkagw/Selh6FesL/WW4g/TaEkOup0UXyeYuNBQF4IW
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

Am 24.06.24 um 12:07 schrieb Nirmoy Das:
> Add TTM_TT_FLAG_CLEARED_ON_FREE, which DRM drivers can set before
> releasing backing stores if they want to skip clear-on-free.
>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Suggested-by: Christian König <christian.koenig@amd.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/ttm/ttm_pool.c | 18 +++++++++++-------
>   include/drm/ttm/ttm_tt.h       |  6 +++++-
>   2 files changed, 16 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
> index 6e1fd6985ffc..b78ee7524bcf 100644
> --- a/drivers/gpu/drm/ttm/ttm_pool.c
> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> @@ -222,15 +222,18 @@ static void ttm_pool_unmap(struct ttm_pool *pool, dma_addr_t dma_addr,
>   }
>   
>   /* Give pages into a specific pool_type */
> -static void ttm_pool_type_give(struct ttm_pool_type *pt, struct page *p)
> +static void ttm_pool_type_give(struct ttm_pool_type *pt, struct page *p,
> +			       bool cleared)
>   {
>   	unsigned int i, num_pages = 1 << pt->order;
>   
> -	for (i = 0; i < num_pages; ++i) {
> -		if (PageHighMem(p))
> -			clear_highpage(p + i);
> -		else
> -			clear_page(page_address(p + i));
> +	if (!cleared) {
> +		for (i = 0; i < num_pages; ++i) {
> +			if (PageHighMem(p))
> +				clear_highpage(p + i);
> +			else
> +				clear_page(page_address(p + i));
> +		}
>   	}
>   
>   	spin_lock(&pt->lock);
> @@ -394,6 +397,7 @@ static void ttm_pool_free_range(struct ttm_pool *pool, struct ttm_tt *tt,
>   				pgoff_t start_page, pgoff_t end_page)
>   {
>   	struct page **pages = &tt->pages[start_page];
> +	bool cleared = tt->page_flags & TTM_TT_FLAG_CLEARED_ON_FREE;
>   	unsigned int order;
>   	pgoff_t i, nr;
>   
> @@ -407,7 +411,7 @@ static void ttm_pool_free_range(struct ttm_pool *pool, struct ttm_tt *tt,
>   
>   		pt = ttm_pool_select_type(pool, caching, order);
>   		if (pt)
> -			ttm_pool_type_give(pt, *pages);
> +			ttm_pool_type_give(pt, *pages, cleared);
>   		else
>   			ttm_pool_free_page(pool, caching, order, *pages);
>   	}
> diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
> index 2b9d856ff388..cfaf49de2419 100644
> --- a/include/drm/ttm/ttm_tt.h
> +++ b/include/drm/ttm/ttm_tt.h
> @@ -85,6 +85,9 @@ struct ttm_tt {
>   	 * fault handling abuses the DMA api a bit and dma_map_attrs can't be
>   	 * used to assure pgprot always matches.
>   	 *
> +	 * TTM_TT_FLAG_CLEARED_ON_FREE: Set this if a drm driver handles
> +	 * clearing backing store
> +	 *
>   	 * TTM_TT_FLAG_PRIV_POPULATED: TTM internal only. DO NOT USE. This is
>   	 * set by TTM after ttm_tt_populate() has successfully returned, and is
>   	 * then unset when TTM calls ttm_tt_unpopulate().
> @@ -94,8 +97,9 @@ struct ttm_tt {
>   #define TTM_TT_FLAG_EXTERNAL		BIT(2)
>   #define TTM_TT_FLAG_EXTERNAL_MAPPABLE	BIT(3)
>   #define TTM_TT_FLAG_DECRYPTED		BIT(4)
> +#define TTM_TT_FLAG_CLEARED_ON_FREE	BIT(5)
>   
> -#define TTM_TT_FLAG_PRIV_POPULATED	BIT(5)
> +#define TTM_TT_FLAG_PRIV_POPULATED	BIT(6)
>   	uint32_t page_flags;
>   	/** @num_pages: Number of pages in the page array. */
>   	uint32_t num_pages;

