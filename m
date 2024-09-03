Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EFA896A1CB
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 17:14:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BA5A10E5DF;
	Tue,  3 Sep 2024 15:14:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="LP06qZlg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2058.outbound.protection.outlook.com [40.107.243.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2B2A10E5D4;
 Tue,  3 Sep 2024 15:14:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ob3PNQK5WbDCgvqw4CN6BuaN39D7z04urvMyuPG6mfhiydnm//5UMekl56VHpHjsyvhvRj0j5RiBnrrIbJwVyBow3FJZfdEFd3WhRNRbGgvTQ5dtC19AWgcxTwXOqWPO1TMwrKs6zt4WYFARAonAfOOenr0CLEhfaD9A+1lwbTn85g2bVRhy+kuzWAN6SrSHELHpaFELbcxq70qAbKChnpVrJ1WjkQenWRG7Z8bF38k3qXYpeS/eyjHd7MpTEZf9yvVplabDRwIsPI1pO8pfhbIPcCwwV9QNlHycW5u8qT2ALv3eSaCGUuR4+s/NIIAU+k4X1OwW8/KIajWBgXBAsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gdpHPytcGODVpJvHQhcv1Pz6NxDUL2oxtjx6PAEkUCM=;
 b=MUXOIOtHz0rJvDByhtQbqsc/5UxxfYKGPyciJz/URFvUXjU132BXJM+8HgODj2ZRqkZkICXFNlUdhgCp4iZi+MZH8aKqoeUa2b70/A5snG4tm1DfqQrtaHRV0kHiarDh9180YHL5M5R6SNSMQTqJ5WLeM1vVKt3A3ZD7ce8oAGv3EmrzZjMCpaVZrSnwmsfVNSNz4SgJ+NqYYe40BOedD/yctIdEhLdkwW1qSExQx2l7mycFFeYpv50Y5KticgfKrnLPXkByqf56IlBBGQUfzCRM5JJ3Maoh3tbHDkHEfwuwaLsOr7ILSzeZ44ABrJ+RveJ/Fm3shWKy8vqzCrgFOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gdpHPytcGODVpJvHQhcv1Pz6NxDUL2oxtjx6PAEkUCM=;
 b=LP06qZlgdyp+KttsEHLrW0ppa8Yg2X6UN3+oiIeBHYnp02883fqhG48GQwaAMfeUR0ir+0YdDPud6ii0qRj/dWtvLg32dnsNm3doYm9WtNSOeeu0LQC2RGHNhDTF9ojVJvWT1ww9xrLQB4qus/oPkwXdHWB75vdpuAYzpfZ8ZIk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MN2PR12MB4376.namprd12.prod.outlook.com (2603:10b6:208:26c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Tue, 3 Sep
 2024 15:14:19 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.7918.024; Tue, 3 Sep 2024
 15:14:19 +0000
Message-ID: <60e8310d-5f8d-41d9-b889-58bc7cbaa395@amd.com>
Date: Tue, 3 Sep 2024 17:14:14 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] drm/ttm: Forward -ENOSPC to drivers requesting it
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org
References: <20240903133849.17119-1-thomas.hellstrom@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240903133849.17119-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0439.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c6::20) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MN2PR12MB4376:EE_
X-MS-Office365-Filtering-Correlation-Id: ffbfd6bf-4b98-4524-20a6-08dccc2b1546
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eFV1elpFbmx1T01IQmVlNlZCUmljRVd0N2RZRFRNSUtGUTlOSU9ZQUVURkNI?=
 =?utf-8?B?N2EzalhiM0Q5OTNkRFg3ZE5td1pSaEsxd3puYlJrd0dpSWcxL2hqR1BmN2tm?=
 =?utf-8?B?aU1WUHVXWVA4SHd5VUNBRWxPREgxcmNkWkdiTXU3djl6SjU3V2dHTHZVWjho?=
 =?utf-8?B?LzBiWVhBUGRPeEhxS2lTMDN1d3FJeTZYcWtFY1NvemNBcFBmWmcyNnVlSE1W?=
 =?utf-8?B?azlIKzJ1TlVjdFF6TFlKZTFmNTRZUGJlVkhjemxySmhTWkp3d3VkYzdscUFt?=
 =?utf-8?B?cURlMUU2cjcxMFc1VHNWeDNoU1RLNW94eWhGM2M1NkFsbng1WXFLMHNWYnVP?=
 =?utf-8?B?VjRha1lwaUthUm5FK3hyZ3ovNGtDUjZaTER2OWNhMTE4VG5YTFZqZGQwOTZY?=
 =?utf-8?B?M1NYVFBxSmJkTnozSnhpQ3BqNXVLTXFVRkFYMHFyZHhLY3psZkJjTzFrK0RD?=
 =?utf-8?B?WmtVQlB4aVFOaHZJNjlUbm55UndYdlZFMTFqVEw0VjE3ZXBqODk3NFFTdW5u?=
 =?utf-8?B?T3VyMGlGNEhiVG1qdVUrdG9vNHFhVFdCamJYU1JaS2Z5WERMZ2ZNVG1OUW9Q?=
 =?utf-8?B?TWh3bzVxTXlxcENYWDY5cUdUODNWaU5JdVhHNUhLV1pWMi9HSVlxbTBmRkIz?=
 =?utf-8?B?K3FKbnQ3TFpNU2lCY0w2UU51QUltTHd4amxZaWJQWjNDK0RhOXpzRFgvalQr?=
 =?utf-8?B?SENEMzBwc2RDSE1BYS9XbUFYNXM0dzNwZVo0c2N3R1pTUE0xb3NrNE1sTDBM?=
 =?utf-8?B?N2dtZUF5REp4Tit3Q3lQNXg4Qm5tK2tIZG50MktxRzMyQ2x0QUpyOEs1OGNP?=
 =?utf-8?B?R0FVMkhZL3NkeUNydlBpUDN1aDN0RGk4VGp4c1NLK2w3czg2NGZoekFkS3F3?=
 =?utf-8?B?SmdROTdkOEw0VEhWcXVBT2w2UXRxSzFXYUZ6MzJRZW5WTXJpcGNvZnovNFBh?=
 =?utf-8?B?VkhDempkVGpCTjRWWDJkWkRZWS8zc1dib3FiQXVFOFZXT2crWjJOZUwwTmZ6?=
 =?utf-8?B?TnJ0WGdmS1VoQWEzRFNUQ2lRc3dBMEZFM0hQak1MZDRSNGI2ODJ0QnQ2TUIz?=
 =?utf-8?B?UzVEdHRpQTZxMW1nUTZyZTNNRXNQbmJucWU5UnNGcFhQZ1U1aGpkWStoMkw2?=
 =?utf-8?B?ODk0TnpkcWVvN2xhOUhWbUpmVVk0QU8xd2ZoekU1SWx5Sjg1cis0QVNydC9x?=
 =?utf-8?B?MzhDcXhMM2ZBOEFOY2JqUmR4emdrQzVVTHZNL3IzS2hqSGlqeDQ2Y0RnU0JD?=
 =?utf-8?B?eHpKWlhhNzk0d0dQQTFadUErSUVGRktnVmtQY29uSWNybDJrSXFYQk9lSDRM?=
 =?utf-8?B?YkZLRWZjaDBLNGdjZjBzdWtkV3U2Y24xMzVneXpOeGtDWGZhb0l0TFM4SXBk?=
 =?utf-8?B?aHhESGE4WmtndG1Ta3BjSS9rK1pJUG5JbTdxMm1mQngyd0JZOEY3SWp0K0Ra?=
 =?utf-8?B?WmJSdnBOTWJEOUxic1JtNDhHWG5vVmdCK3RJWkJpelVXcHVOWmw4czVUYmhT?=
 =?utf-8?B?YzdUTDhtZGtyaDY0U2Rud3hma3A0S1U4ZmpsV2svcElkcHBhUXkxdHFoWFhs?=
 =?utf-8?B?U0xOVlBpT0x4RXlZS0xqeTNtVlIvTHQ2cGlmOVZ5dm5laWYwbUZRV1VScitu?=
 =?utf-8?B?ejJVdzV1YjljYzl1L3ZZeWNHdzZCQmZ5bkhlU0gxZUxzZVZoaEREOWJQUVdz?=
 =?utf-8?B?ZTVobXZTNWxOQ1h0RDhuL3UyUHVaOGFSQ1dTTkpjbmsyWnRBZjc2TVN5RXRO?=
 =?utf-8?B?bUVOTUlrbHdLbXRTekpCUWFUcXM3ckU5ZG9SUUJOUEZoK1V5dmhlTndHM08r?=
 =?utf-8?B?R2toUHBvYVZzSkoxbE1GUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S2MzV2F0cGRPNmVBUDlKQTRTUyt5YmFHTWxtd0VMR0ROYlluRWF1OTR0Y3FN?=
 =?utf-8?B?S1lMNDY1Tk5ML0pxbHZkZW1DV29nR1FFajRZZWFUVHA4WlpWT0NsRFhpc0ZG?=
 =?utf-8?B?QjRMdnc4WS9SVHByb0pyN2VsR3pMWG5PNElwbUV6SEJwMlNpcHZ4T0RTNC9h?=
 =?utf-8?B?SVdoR3NSOHMvbDR3aTlhQ0U3VG55QmYyaW9MaEI4KytjL3hDSnVCWUgwTWtD?=
 =?utf-8?B?R1grR0o1T0ZLQ3RxY3g2cUdvZFZlVmFYRkoweDRaQktyaS90WTdEeHJiZzk5?=
 =?utf-8?B?WGUxRy96ZkpQUFZZeGpLS1dybGxpdUhBaEIvU0ljRWZuVFJINDdsUDRpSzNF?=
 =?utf-8?B?L21nSEdRb0xwM3RGbFF1akFqbGxBWGw4NjhjVEtxcEpmdVlTdVE2R2g2MkR4?=
 =?utf-8?B?NnNUYW4yMjIydjFjZERNdkJpWlB5VlplK3pFUEZtQUtPR3MzUXgxRnlKaFVG?=
 =?utf-8?B?c1BpbVU1eFBxbEl5VDlOM0JpQzEwbUJDSmYrNWZyUzJZVTd4bkxwNlJyazNy?=
 =?utf-8?B?Vy9BYStCWVZPV1Z2Nk1zS3psQ3ZOazVLa1N5bFhRZURPcnV1WmFMd2dqTCsw?=
 =?utf-8?B?MzRVTWdhYkVmaEZzbGJqZDY2N0QxQlNURWl0NnZQNytydU9KUEJ2d29GVU5k?=
 =?utf-8?B?TVo1T3ZPcFIyMnBreHdhUjBKZWdGdHFsTzhrcURVUE9NWEZXL2ZuKzhsMkZo?=
 =?utf-8?B?ZjhjYU4wdHl1WDI2Y2dUc1M0eHpOelRKVWF3S3NSMnhCRlQ2dkM0T25vTWxr?=
 =?utf-8?B?dmhiWlhZN3hsT2FUWnFzYmptQ2VrMnZ5aUtaU25PUVdUUFZxdjBiay9MdDN5?=
 =?utf-8?B?bkxLWmNncHN3NW9qUzMzUm5xWndxRHJzL0txUXlzOHQ2SmlSbWFCdGxYOStk?=
 =?utf-8?B?MVJVbXZsc3Bsb3pLVkxSclVzcEdNdm9ST21Da3R2WWdsY0t5Si9ZQUJIODdx?=
 =?utf-8?B?SDEwZUQwOU5ubU5VdkZaTXJRc000NWF2bFR1Q0NsaUFiSy9yKy95REorcXZ3?=
 =?utf-8?B?Qktrck5Qd1N1RWVWTGZVSDhDd3EycFdkWGdNV051VXBZSURocEoxY2pJeTFQ?=
 =?utf-8?B?UkhuV1phSGlPTkx1SkhualRub3NnVFhvOHpsL3ZWY0ZnUjVHUzI1UWl1SE1N?=
 =?utf-8?B?aE1tVTlyN1hUT2E3c0g5bC91RGh6TkxvQnpCV3hGbVFnRXRZV201cjU2Slp5?=
 =?utf-8?B?ak9JWnF4QnlyN2FETm1mYjdNK0pyTTR0VGd0dlJjWEJmS25Jb3JoeVJTYVlX?=
 =?utf-8?B?MGNuZHRIMzV5TVdEQ1FXeUNFSmNMb0xyemRWNEtmVXZiaXpTaGxUdzF0WFVy?=
 =?utf-8?B?MThMRzJqYVFpTC9UZzdyM29rVTVGeXg0YkFrVnBOQjJOWCthWkUzOVhYRytL?=
 =?utf-8?B?bjJvSUtkTlNFKzBjaTlIZDRTYVBUVWNvanJQbFlad2hwS3ZpUUhhUDU0WXov?=
 =?utf-8?B?cXo2SkZGWHRWck5udGRCVVNnU050Qm94QnRHNHZJNVMvWDBQMk5oaU11cnNQ?=
 =?utf-8?B?R1IwdmhLVldYdVhjN013a1FiZ3hwUnFjaGVBN2plZytLdjJVdDNDdXpUNDkx?=
 =?utf-8?B?eGRWL0NkL21QRFV2bGxidFFsckJLcEIzc3dyWldzNG9nUVhGS3hHQllPNUJ5?=
 =?utf-8?B?S2Yyb0doZ0I1ZXVWWk9kRFFxam00MTB1Y0tIRmdLSUptWXZNVUtnSVE4ZlNw?=
 =?utf-8?B?QzhvVUZueGxFSVRDMUNBTWw4SlI0Z1FsNCt0RFQwcWlSRU5NVUJiWTdxMVVh?=
 =?utf-8?B?cWFIeXY0WjVGRytQSVQxZlp1QWliNDBIR0RkQU8rM3hPMGZ3c3lIN3BGY0JB?=
 =?utf-8?B?QlpWTUgvMllpMXIxa3JxSTRsUTJ2MFhMZjRJcUxkMnZQMVVBMTFMQ3RrMWxz?=
 =?utf-8?B?aHBoZVduVjBoWHltZ3RNRG5EdnoxVXZMcHdoVzZlalgwbGRCT3hBQ0hhazZ0?=
 =?utf-8?B?MG5iWi9vV3Q0eG0rQzRCZllrSlc0SGxGYnNCNm03bFRKYlhva213SUR5OGpt?=
 =?utf-8?B?aXZkeDVOaVFJK0J3R2ROTmc4aC9PZUJUTWdvcVJRRWtzUFFaUWdSeE5TUlB3?=
 =?utf-8?B?VWVNWTRTeGw0NWRVajBieG40NUNIT3NWNUUxWUVrSGZUWm9GcFdtL1FOUXBC?=
 =?utf-8?Q?hOtU=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffbfd6bf-4b98-4524-20a6-08dccc2b1546
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 15:14:19.4341 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G7aDK5fQGGKgdmzDsDlWPtCNLHYKzRrScizYeKgau4MuhP3cGnqfKyNQPnWOEakL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4376
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

Am 03.09.24 um 15:38 schrieb Thomas Hellström:
> Some user-space APIs distinguison between graphics memory OOMs and
> system (host) memory OOMs. To aid UMDs in determining the type of
> OOM, allow forwarding the ENOSPC from resource managers to drivers
> on calls to ttm_bo_validate().
>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Ah yes that was on my TODO list as well.

> ---
>   drivers/gpu/drm/ttm/ttm_bo.c | 2 +-
>   include/drm/ttm/ttm_bo.h     | 3 +++
>   2 files changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index dd867b5e744c..d9a320dc8130 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -836,7 +836,7 @@ int ttm_bo_validate(struct ttm_buffer_object *bo,
>   	} while (ret && force_space);
>   
>   	/* For backward compatibility with userspace */
> -	if (ret == -ENOSPC)
> +	if (ret == -ENOSPC && !ctx->forward_enospc)

Mhm, couldn't we put that into the bdev? I would rather like to keep the 
UAPI consistent at least per driver.

Christian.

>   		return -ENOMEM;
>   
>   	/*
> diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
> index 5804408815be..d3e12318d336 100644
> --- a/include/drm/ttm/ttm_bo.h
> +++ b/include/drm/ttm/ttm_bo.h
> @@ -174,6 +174,8 @@ struct ttm_bo_kmap_obj {
>    * BOs share the same reservation object.
>    * @force_alloc: Don't check the memory account during suspend or CPU page
>    * faults. Should only be used by TTM internally.
> + * @forward_enospc: Don't translate -ENOSPC errors from resource managers to
> + * -ENOMEM, but forward them to the driver.
>    * @resv: Reservation object to allow reserved evictions with.
>    * @bytes_moved: Statistics on how many bytes have been moved.
>    *
> @@ -185,6 +187,7 @@ struct ttm_operation_ctx {
>   	bool no_wait_gpu;
>   	bool gfp_retry_mayfail;
>   	bool allow_res_evict;
> +	bool forward_enospc;
>   	bool force_alloc;
>   	struct dma_resv *resv;
>   	uint64_t bytes_moved;

