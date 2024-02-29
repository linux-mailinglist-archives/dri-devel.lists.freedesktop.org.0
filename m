Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE50486CA30
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 14:24:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAF8210E126;
	Thu, 29 Feb 2024 13:24:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="np8w+3vm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2069.outbound.protection.outlook.com [40.107.101.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23DAE10E1C6
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 13:24:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fgxM8Std5iT23cFgg1WErU/i14XaUfrCm6cndX9KZ80Gk6RCVi7wSoCfZ32KHLqO+H+XBVDbRuaiYIB+0/XsLUso1RbEGmH+SWcxoqe2x7KKOXj4I0MNUSI5A8WkbmJItjq9NZksz/biafAcRvS7tupu7ccRGyqgRMiij2H8CviZwzhEJXlc/Fj6gGw19l8cOYEsMy6Ru9SGYni7bcJT1kRUZoBfRv1BfC6NkeR9BtYzzTTJawWtEgxFrbXQ3W8jPNZACj6aSwSzq8+9NatERQCqFjbxjPeYWNcMZ6ZAvvYeUdruevRZE6i6L6KOZ0U77Yvmz29WBnXaButAA4oIRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5EO77djUpMrVf7PdXg8aJzqT/K7DFYug83MDTR1edrw=;
 b=cxqli2z9bLsmuD13mlF3B46wKN933bFR5VTeubLcODRQp73ZQb8bPi+ff1ZiLFcvKj985nXHOho7SlExitINTS0wrWvI7bXCVd7SbhJgyq93F3NePo10b85aUykm95e8xE3RRIG+WismtYwZl36YowGyKVWKqqvBg/rKYJlwFbNy66tmfS51eU/eO/Pz20s0tvuqODzFh4egfZ3x7p5i6TXylDot/G9GmOk8P8jAgzuaoHNnTm4sdzyBwhuMYlrHsGNRQELWk/7R8rsIxCC9paPy7zRsSW+cEb9DMj1lg5lNL3soQja6vZZeT02vfMtajl0AeRLep9MuD9ZDYs/jlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5EO77djUpMrVf7PdXg8aJzqT/K7DFYug83MDTR1edrw=;
 b=np8w+3vmFrNYHslCyJqFxOO7Z95FgfhO9nzuklvUdQV7YgutgU/kr5rhgQKixp63gM1LG4NJ23z7oBPJBMrIYjMhBZhLFyFpWDDPRkti8Hf7l9ul35Awi6o9aIZDbb/a4XJkWAMiEosRoUpPnemRmAhu7SbY1GjI2rD12XTRFzA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA0PR12MB4384.namprd12.prod.outlook.com (2603:10b6:806:9f::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.39; Thu, 29 Feb
 2024 13:24:20 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a%6]) with mapi id 15.20.7316.031; Thu, 29 Feb 2024
 13:24:20 +0000
Message-ID: <0d549db9-4064-4efc-9173-527602aa51f4@amd.com>
Date: Thu, 29 Feb 2024 14:24:14 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/buddy: stop using PAGE_SIZE
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, dri-devel@lists.freedesktop.org
Cc: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 Arnd Bergmann <arnd@arndb.de>
References: <20240229105112.250077-3-matthew.auld@intel.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240229105112.250077-3-matthew.auld@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0176.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b7::7) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA0PR12MB4384:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c4ee6a0-1dc8-4a18-eb65-08dc3929bc6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QLtFdxJA0F1mJV+4PdBRLwtcKXIeoR6B4s4+r/EdowlvKmc2WEbWpcsAR136UbA7tu33AQVUKTyLYWNM62CSVy0fHSJ4WgnmL9em81PIl2Fdsjfr/uimW48h63Ia1r6HeeXxv7zmAwvHmOYT75plL38kfcTcD5fFZDR6RjI730Z2YEh3Lmz2eTb77Nhn+DXzyLbPE5eHRgOCfqtnUo6RRaMUdDAH0CoOk3q8N7uhgzwqkVZVWHoZZ5kAyO3oqBhAwu7zuYDy72DRZnwfTI92kRdbfBs4jTD7LX8wjQ9CAcoAwplJqWivuCH28EbOjEB6f0SpHinmTGf/q4jMUJu6YO2NkmpsGaXZEHpTesGQIvFGbOuxOzA2OX1KpsuF3w9/+2ykXybg2OdXWyft+nRrSNy6xHLz6aibqi1XuxaTmuG09sGytDG8/Doe5rY0uAMoW8XyqKooV8Rz2K2ZXgyMJzOX7qBFj3PmfELWURIpplJH46MoiM2wSd0jVDq7XvBxKdTmdK8+NXOYfuRpsK4Q9iqiEJZOPLPRnwjIfiV0sxENRhqrnIW3vwvRgnGH4uR2heWj2lctl9SwtDOmgNMbTSJRWeKN2M4RO8KvnIGEX3h6EkbY4WM7YzfHK1MBwbRznFQzpTJ0hDU+A6BbR2oyAw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N1ZhRFFNa2ExYXE5Q2NOTnhTbGRNMkp2akFPKzFkL0YxWHNxcW5OamF6TytH?=
 =?utf-8?B?Z2NYRnVtTVNETzBtc3daU056cGdGU2ZBZXVEOENibFJ5cGR1SDZBSmVCMllJ?=
 =?utf-8?B?em82RGo5R2E1MkxaYzJSUU5zOVFJRVRuWm90WXhEVVcwR0w5ZHVMWEF1ME9o?=
 =?utf-8?B?NzlWVC9zeWc0Slo1VWpDN2xGS083MzhHeVJBYW85TXJvaTlvcTYrc1RnMlZ5?=
 =?utf-8?B?cXBmMUhKdDU5QWc4M2JZWVU2SEN4cVo5enZWczJiSmFlekpXSjhOU0c3VnhP?=
 =?utf-8?B?YklmRk9XL09SUTFwcG9TTVZESnV5YnFTQ2JRLzBJdmJmT2R6Qmdma0NkNkhh?=
 =?utf-8?B?Vmp0TXJUMVZBU3JsYytXaVlMdkR0ajk1blhLRmRYSHkxbVdYR0tGSHRkZ1lJ?=
 =?utf-8?B?WmQrbjhpL00rRndFelQyK3BydDNNMzBDNytRdWx3cFlFVWtPNDFMQUk3SlI1?=
 =?utf-8?B?NzE1US9ycWtaU1V4Q1pmQ2ZFMndVZEhXS2cyU1lpQTZxYk1oa0lOWHZvYWx6?=
 =?utf-8?B?UXh5TE94cDdpOFpwa1JGMFZwU3FLajl5ZE0xSk10ZVVPdFFKSXR5UFNQQkJH?=
 =?utf-8?B?ejdtaFdpL3paVnZld2ZxdmFMQk9EOVZLOTBJS0xJTWxMV0hvZitSWWthOVZI?=
 =?utf-8?B?Wkg5dFhsZWxIWjFrVEljTFl2VmpxZXpKczBGeCtzb3l0TmZ2L0EzVEtiOHBW?=
 =?utf-8?B?UkxTaFRmN1AvSDh4eEJLMmZpajRkTXJSUXl5UklkdytuamJ0V2U4TFZKQmZY?=
 =?utf-8?B?Wnhnc1I4cWtMaE9WWFJpTWo1RnU4UHJOaHppS2VBd0pCeStEVXgzR2pBU2ts?=
 =?utf-8?B?eXBNOW4wdTIrd3djRzdyZTljTzNRdERFUjV5OG5NMXZCWE12TVozMlcvZHVC?=
 =?utf-8?B?bDRuRTFrUnhGd0NBY0cvOGhycjVKR1RvVkRETkZTUnVYMHN3cmVNdWpodldK?=
 =?utf-8?B?KzcwdGU1ODNlVXZVM2pMYnAxYXZKK1o2dTVVdC9WYTNlR3g5ajR5QndXQXVu?=
 =?utf-8?B?RUZzTEV3RFl4d2hON2hWSUkvOU1iVHlqTlJCckRBN011elBWQklGclB3TkR0?=
 =?utf-8?B?RkZkTUFVRUZ4NTRvMWc1a201YmhCcHdWUTdnVFVpL2hCWjlCS0I0Mjc0MW03?=
 =?utf-8?B?aDNrbWVUOHdrOU03aUEvUTNkTkd3T3NjOHVZVWlDK2VqOHZ0c29hdllObzRz?=
 =?utf-8?B?a1cybFRRUS83UW8yaWRncnhLM1dJRnAzN2lyejBSK2pPK01JdDB1ZDlpUzhs?=
 =?utf-8?B?ODgreHYxeTNvMlk4NUhiajhTQlA4L3JUaDZQU0NsS25PbnVTNW11dCtjOUxN?=
 =?utf-8?B?bmUrU25DWUppUUhKY05GdE9MTDJJQldkcHhYalU1KzFEYmFqNXU1VkRZWXEw?=
 =?utf-8?B?aXFFNGx1WVJEdVVPSGN5UUFlTElGSEpJRlhkUGhCaTVjTjJqR2YyUWFsVnpm?=
 =?utf-8?B?aHhSR1NnYnpOWkJIVy9Sam9vdkhoMmxPVldSVmNwNW1LQnpYSjc5MUVFMzNO?=
 =?utf-8?B?b1NlK2FXVm1NOVZGc0xhUytKMVNNaUpaanc5U1ppK09ES3U2cys3UmhjMk5O?=
 =?utf-8?B?WG56ZVBCaHBYYVl5L2FrSm11NWs4L3RjcmxnQXRqN21yemNHNHhmcHFVWjFl?=
 =?utf-8?B?RnFMdk9NeTVhcTNHVDJmb0ZjbU9wcG9XblFjY0xOSGZ2bi9LYmVjSHV6ajJV?=
 =?utf-8?B?Qkh3V3ZyMENrQVVnM2hMK2V1V2J6VTVocHdqbllzQlVBOCtiNXIyT1BGMk4w?=
 =?utf-8?B?OStGYWJNbGZlSWhsS3lRYVJrMFpucDV4VWxjNThKUGN3UkVWNGdkMDMydmtO?=
 =?utf-8?B?blIvdkZreStLcUFGMzN5OHJpVzlzaklhaWZZVDVWNkZPOXlDNXh2RDl4M2JH?=
 =?utf-8?B?SlZJNGtET0N2STNqWkRralBFbmhMcHYzT2VQVFdHK1ZtaUIzR0NRZndHT1BY?=
 =?utf-8?B?Ky9WcFNQQ2FkZ1NoM0dDSmVMZXZ5QWVhcW1iUjNTZ2I4b1lJNWVCS3NYdExz?=
 =?utf-8?B?ZnYxOGFzNTdyTTJ3V1ZPTFZqNmsrWjhJUGdSVjZRY2pBRHFmRWE5V1dzOHV5?=
 =?utf-8?B?MVN1M3Z4MDF1OXM1TzNIWlNDTXF2WVN3bk4yZ0c4VTgrNFErdE8rbGF5Mjcy?=
 =?utf-8?Q?sXxN2ZPFxGJmuwaZzmqt3LKEj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c4ee6a0-1dc8-4a18-eb65-08dc3929bc6b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Feb 2024 13:24:20.0230 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1wci7kyX/ZVrviXPqoXF/Y+T16mA/rXW2/SeQnRXCWOoGuYYxorcR5mo2bHJ8Xr2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4384
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

Am 29.02.24 um 11:51 schrieb Matthew Auld:
> The drm_buddy minimum page-size requirements should be distinct from the
> CPU PAGE_SIZE. Only restriction is that the minimum page-size is at
> least 4K.
>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Arnd Bergmann <arnd@arndb.de>

Acked-by: Christian König <christian.koenig@amd.com> for the series.

> ---
>   drivers/gpu/drm/drm_buddy.c | 2 +-
>   include/drm/drm_buddy.h     | 6 +++---
>   2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
> index 5ebdd6f8f36e..f999568d69c1 100644
> --- a/drivers/gpu/drm/drm_buddy.c
> +++ b/drivers/gpu/drm/drm_buddy.c
> @@ -102,7 +102,7 @@ int drm_buddy_init(struct drm_buddy *mm, u64 size, u64 chunk_size)
>   	if (size < chunk_size)
>   		return -EINVAL;
>   
> -	if (chunk_size < PAGE_SIZE)
> +	if (chunk_size < SZ_4K)
>   		return -EINVAL;
>   
>   	if (!is_power_of_2(chunk_size))
> diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
> index a5b39fc01003..19ed661a32f3 100644
> --- a/include/drm/drm_buddy.h
> +++ b/include/drm/drm_buddy.h
> @@ -53,8 +53,8 @@ struct drm_buddy_block {
>   	struct list_head tmp_link;
>   };
>   
> -/* Order-zero must be at least PAGE_SIZE */
> -#define DRM_BUDDY_MAX_ORDER (63 - PAGE_SHIFT)
> +/* Order-zero must be at least SZ_4K */
> +#define DRM_BUDDY_MAX_ORDER (63 - 12)
>   
>   /*
>    * Binary Buddy System.
> @@ -82,7 +82,7 @@ struct drm_buddy {
>   	unsigned int n_roots;
>   	unsigned int max_order;
>   
> -	/* Must be at least PAGE_SIZE */
> +	/* Must be at least SZ_4K */
>   	u64 chunk_size;
>   	u64 size;
>   	u64 avail;

