Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D179F05C7
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 08:50:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A175B10EF24;
	Fri, 13 Dec 2024 07:50:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="J3p27Gib";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20605.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2416::605])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D548F10EF24
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 07:50:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HBzgaIvnPV50GFpc3CivtUb8ffyZ3CtuBH/0k1t4PMYoynTxgEEvO3wTp2/5TRlxHSgsgxIfmMV15QEdKZ8OwUNfGIln4qS3N7VnwVd/BRSiAHuAHIAue+xwASOI+Lq6UjLnWyIAwmOUoa3a0ViOc8C1QFSnm+8Cab72uDgPgzQYzoxY3hLXXMgt4ad42kDAA2jKGpIWpDuheO9XLSee6PZSDam8oS0qWZOw2m6NVPRsnYfHWCUeUKQ7IJp7bPrgjSmtWuS6DdFrE/Yn+MCnTeTgKQYK35M0a4rGWrBM/K2bIwc3zJWLhTmjMdps4dg3EDNAQumF2AHpDmv3oSa3aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ux3DoWPohy048Dx7PrQRG+sJwCqcDmWvsdhL8eXGGI0=;
 b=fJqk4l9D+fqEHypbCSmkasdaUEGLDHarQHQh8As6vBXgYgY0lt+iVULpnaFb4ccfZQYUhNgG1b52o7i3+B7lvFRhUVNDPxc1BKC76oud/qh76oW+cZECnlPA/P3ldcQmZJP5BvMYbhx01wLmpGKnrGrROFffvmzKYFneJoJuYoDJvyzQlKQJ1I9CgcGEX/LLCdZR5mq/4Hr/RxGzqN83VO5k3skXf5OBI8K+MYa60g8sg9MclxzAV+Ig1MvffBwvBE+42/g7wacPtBwTohqBeU9xHCYpUBp707tdkhXs8cHPij3sXDn3oLXUEUfjCy9SxLkwibdgyZxYgwbGjdlr2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ux3DoWPohy048Dx7PrQRG+sJwCqcDmWvsdhL8eXGGI0=;
 b=J3p27GibzH2sbrK+27J7ETiSQpue8d6GqhaDD3NjNFu8Txbc5XpIOVVeCQMX9Mijg6XeMGWNCCj7gM2BrHG9gtXkuELf53/aD1WOkcYb4t3JrD6iLUCzcmCi3nQXpFYW+/yxMk/uaepLzPKf6U9/3OHt7IBmSCGg7YuNLwaz/n8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY5PR12MB6108.namprd12.prod.outlook.com (2603:10b6:930:27::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.18; Fri, 13 Dec
 2024 07:50:35 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8251.015; Fri, 13 Dec 2024
 07:50:35 +0000
Message-ID: <acd82bd1-4d75-42dc-b5bc-1e7fd18c8a5b@amd.com>
Date: Fri, 13 Dec 2024 08:50:29 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] drm/vc4: Use DRM Execution Contexts
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Melissa Wen <mwen@igalia.com>, Maxime Ripard <mripard@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Tvrtko Ursulin <tursulin@igalia.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
References: <20241212202337.381614-1-mcanal@igalia.com>
 <20241212202337.381614-2-mcanal@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20241212202337.381614-2-mcanal@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0240.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b2::15) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY5PR12MB6108:EE_
X-MS-Office365-Filtering-Correlation-Id: 130edfdd-3972-4052-9337-08dd1b4ad3c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VzdIV1NWTTNRSGJQSk9EcjZEVUovRHhqT1JKeWdjdHhIU0E4VEs4azViUklW?=
 =?utf-8?B?S3JvVVIyVWFieUFaSFo4SncvWnNRR1lpZGZRbFVGbjcrK3ZUaWViSWNYN0Nh?=
 =?utf-8?B?K2kyc2FRTU9UdjdWRituejVKcjFtN0pRQU9KREJlbVo2am5QU2JENThjSlZo?=
 =?utf-8?B?RVN0cVBNVHdjRHNnWlNLbWwxZUhENllvcTRrM2hsQU5qVCtQRGNkVkhkMlZV?=
 =?utf-8?B?bnhtVnZxNGJuWnZDRzh0Q3J0TTRKVURXaGl5VnNscUpTK0hnbXdyWHdzMnVN?=
 =?utf-8?B?Ylg0Rk9UNEowUHR2TUJDeld0ZlZUVHhBdG4zNzhVZkg1YkpINFhBZy95clVH?=
 =?utf-8?B?K29pbkUvNHVORm42blNuRjdhelVMczdBM3FiQkYrSmxCSGc2Q1JkQVMxWFF6?=
 =?utf-8?B?dW1CZmFWMWs1ckQ2V3FVUDREUUJYcXMzVnYwbFhidG55VEtsdlkrdG4vRGNI?=
 =?utf-8?B?M3JHcktJSGQ0UG44bUoraXdrS29wYTRIZHc0MGpLZjRLZXRMUHFvR3hjSXpa?=
 =?utf-8?B?d252TlhKRnlwUXoxQVUzd2JneFFMZGNWcGl0WGlhZU0xWklRTnc2ZVdwVy9J?=
 =?utf-8?B?a0hFbURvS3dkbitySzhzckhhbExwZTRQaU4yZWt1eHhLQVB4WXFtVXFITVpN?=
 =?utf-8?B?ajdXRHRqQW92UEd1aFlJakUwdE9Ua0pPQ2FrVzU5cGlzQUpYRjVGVFJxN09z?=
 =?utf-8?B?aGpUUkViL2JDeFNGNC8reUlsUlB0RFo1MnZ2cFJEZ2tnN3A5ci83N0lrNXFm?=
 =?utf-8?B?MldQeDlBdVM5aks4VGdpZ0JtR2JQbUZINHQxRzgrcURDOGJKeVo3S3NvdVA3?=
 =?utf-8?B?TDErQ0hjY2tXUEpEUXhWeWVBSkJEemJoTThqR1doWjQzQ1lJc1NzTUFyNk1y?=
 =?utf-8?B?WmhuU1c3Q0g1ZGR6SHRDcUxLTXBnUWh2bHNvREVpdnNUWnVHdjNsN3pjRUtX?=
 =?utf-8?B?czVXMjdhKzBwaEhDUkFOd3IxcE1iTUNNUHBnYVIzMjE0ZWV3UWtnYmlzc2hi?=
 =?utf-8?B?Y3RXUk9ZZEZ6aWNUYTFVY1c0Z0dyVFlhZ251bWRCTTRMUEt1U1BSRXNQTWN1?=
 =?utf-8?B?aEM2YnVTNEhPRWl2d0Z2L2FzdTlOcXlxYjJjcXNRL0NSUksrYmdaMVhHRFEw?=
 =?utf-8?B?eXYyejlENFBnZkdsNm9LbzQ5NlF0UThobzdoWVJUbWhiNngwVzBjQlpxTEhv?=
 =?utf-8?B?aUpRc1ZHdFY5c0xaTnRqY3kzZTU3SjFicFVXNnVVc25vQjJJYXdvZzdmSGlw?=
 =?utf-8?B?cjQ0ZjVPcy9mRW5rWmF1czdVQjdJUDNCV0UxTGtwRlVQVTdtNUJwZ24yYUNv?=
 =?utf-8?B?THZvN2RaY2E1TUxOdHFqeXdNUEJXNXJhaEhvbmNyRDhzRkNqS1ZlajgxRzBu?=
 =?utf-8?B?L05EYUFSSlhNSk9hZlI3RzRoL0FHbTZIRlpwcDRzOFdJQmJOZmp3VUlFL0c3?=
 =?utf-8?B?dTdtWmR2dmpxL0JGdVlEOXI2RG5ObktPVWwwTUhFbE9wS05tSzJ3aEpoVzlh?=
 =?utf-8?B?aTIzY2xzSFBxZVNpcUU0cFo1b3ZmWWJvWUR4SktHaGpHc0JnSkJkNUhpNXYz?=
 =?utf-8?B?THRlUXlrKzdxTW4xSkdrUEtFQmdyVVZCVTNGQUgzcS9FYzZHcUFGWjVZL0Vv?=
 =?utf-8?B?bm5HdkVjZE5kMS9URXZ4dGVnMXhWRE4yenY5RDYxVEd4SERQbytXSnZ6SW9H?=
 =?utf-8?B?YWdCT0IvWE5MM0VlWnQ3d1pTOCtnQUxDbmY0ZXAwQmNHSGd5bTFXQlVIK3h0?=
 =?utf-8?B?RUZ6VXkrdktEeWFFWk85Tkg4bjBiUDg3MXZkN1k2dVh6dmtKeHMrVkhTcElX?=
 =?utf-8?B?eUpwS2FnUVJ0M2hhSVVyZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eVdzWDZCRXJVVndGeVlUS2FLTkI0U1c4MnNlK0QwK3pYRGloMmVkWXQxQjUv?=
 =?utf-8?B?ZWIvbDhmb21XU0ZxSDFIU05EZWp0SktmQ0IrWmVCYzFEUUF0TkpHUTlFb2VV?=
 =?utf-8?B?OXVFSFZldTFLV2FJRWs2aGZqemFEUk5KbmJmUUtwS0xEczhnUFdoQkZISW56?=
 =?utf-8?B?K1IvVUJiRmpQaExpaStrSTV1dDNMY3Z2OHV6NXFJVG9UMjIrWHBLQ1ZjRDhs?=
 =?utf-8?B?N3RBdDlDRDVzN0Z2ZHlPRk93ZEJPQ2p4b0swdTRmTlUrcEIzelc2N3dCdzZV?=
 =?utf-8?B?d0lYOVVVUkE4VHNvSnFMTFBHLzYwaDl4MjZpQ1IyUVVVN29TamtEcDZnenFp?=
 =?utf-8?B?cDJSOGRVODJSSzdXSlNFNWp4RDBHY3F3QTVLa0F4VlU2WHJXY1FXOUdYRWNL?=
 =?utf-8?B?OGFTcER1a1dMQjJCeW45eUlHbzJMWWRNT1lXMmFPRTFUTFJvVThIQ1pMM0VW?=
 =?utf-8?B?Y0hqbjk5Q2ZFb0NpMjN3cE1ZK2ljYjJUcmpzT25YRm8zN25kQkhQUWFjWUFX?=
 =?utf-8?B?cXpuREcrYk5DRHVPNWFUR2hpZXZFcStkdWg0WUxDQllubFNpM0l0K1lRYUlh?=
 =?utf-8?B?aUJENVd4OURWbU9wTnBNc0ZZdkpqQ2hQbk5XYitwQmVUdzFTQk40SjEwLzNQ?=
 =?utf-8?B?N09PUzNOdVBZSUNxNCt2dE45M2dtTlNtUHV0SmpPN2tSNlE2dzRIMmZSdUVE?=
 =?utf-8?B?bEJObVRxNnhYMGdnSmlFbk80Mno3dStZai9TeW1zV0VFZFp1S1oySmNpYXU2?=
 =?utf-8?B?TmNwTW9Qa0VHZW9MUk9jNXlITDU4aHR6OHVuSGI5c29teTdYRDVqaGd6aGpX?=
 =?utf-8?B?cHZ2WGdJaHQ0eS9UNVFvKy9VRFk3elB6NnpmYmZ3KzFkejJBbytFdWY3b1c1?=
 =?utf-8?B?b3g3Y1Rudk9UNVhlRVlXK2QzVEp4ZDJqSnFTWSsxNXV2ekZKQXMvaTcxMEFT?=
 =?utf-8?B?dHhLVVFEUFBnMnR5SnZ1MnVDZ09XeGNyUnUvUXpUNEthZFRIazdTakt0emRh?=
 =?utf-8?B?L3NxWXFHWnMyQlkxeUZVNmt2VXFrcER1TnVVbW1td0NqOHA2YndvUVJFeXZU?=
 =?utf-8?B?aVFKRDRvZmxTUGt4ZVhmZmtsTDdhSFN0dTlWSG40d0dSODJwWU1QRGw0NVdQ?=
 =?utf-8?B?SXpvSWVCSy9nZTFhaWFyYkhVa1lQMHdaaEcyRUZTWFg3ZFNCUHFLQXlhVmNi?=
 =?utf-8?B?WGc5SkRsTjFXZmF3MVpXU2lzRnQxU1h5TWZ3NEpzZjJYbVhYejFNY0ZVWTBx?=
 =?utf-8?B?eDJic1FtU2pZOGErSXVoK1d5MEhyZVRNckhkTndzaDlsTzdJR3NmN1B6T3hD?=
 =?utf-8?B?UDJ4MzVwMTcxblA2RU56cmxtOUJubzFXVEhYdkNDNjY0YjdGb0QyT3d3d3lZ?=
 =?utf-8?B?bFBMcmw5MTQzM1hGVnpWVGFLM3N1dXpUUVJDeXhyZmRiRG8vZUVUSVlrMUFk?=
 =?utf-8?B?WTREOHJGRnJyK2lMQlN6OTBMajRmZmlyYzFTSTd3SlkrS1h5R08zSGNrWWhm?=
 =?utf-8?B?eHlONW9tRlpydXhBK3FlTnZIZlFxc1VVQ3hYRHErb1psblY1TkIwSHhDOW85?=
 =?utf-8?B?MVNBOFEweEZNM3hlN1FJd3ZudUNCM0ZmZ1p1L3p2Lzl2eFlmdkRZMllEejFT?=
 =?utf-8?B?MzlwN0dnRGg2c3BXc2o3VVBJajN6Rm1CWjdESWIvbDlPYWVUQXR5UHVFbGwr?=
 =?utf-8?B?WUhKa055SE4ySXUwS0VmelNucGlNQ0NjU0EzbmYxc1FzR1hGVXhKaXBEMzEv?=
 =?utf-8?B?RmVUUGNQL05RS05nbkNzNG5kWDExQ1BnbFkzUC9EZk9jcmNicVRabUl6akhM?=
 =?utf-8?B?SkRKVW5tUUZubVloaVdGajFEd21xTWVsclJvNlpOZmk1STQxRXZjVkpWYzBx?=
 =?utf-8?B?WmJZSVR4SzBMYWxyU2ZPUjZLTjRCcWUvUnBVdHB3dVdPdDFEQTQ3dzg4OVN6?=
 =?utf-8?B?TWU1UTZqdk1OZGNiUk1yQ0ptZnFDTUJQTEhVcllDY0lDWE14SFpYSFZhNDR3?=
 =?utf-8?B?djA0Q2RUL2g1ZHpscHllelpxS1R5QVpMZHkwRHJpdnA2dmZ5aEdzWE5hb2tE?=
 =?utf-8?B?d2xWSFVlcFN5ZkNha1FNMVlRZk15M0MxbUFUYlM1S2ZNYThnWUVDbFFlanhO?=
 =?utf-8?Q?jkhjqPTP2z4F3i1eKZbYEgI1k?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 130edfdd-3972-4052-9337-08dd1b4ad3c0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2024 07:50:35.3350 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A44Z/UJKrJrMcWGz5t6qjbM1xbGisU9IsHlh6g5mMhUO6GZ6kM2MeNUVFXC7rS0X
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6108
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

Am 12.12.24 um 21:20 schrieb Maíra Canal:
> VC4 has internal copies of `drm_gem_lock_reservations()` and
> `drm_gem_unlock_reservations()` inside the driver and ideally, we should
> move those hard-coded functions to the generic functions provided by DRM.
> But, instead of using the DRM GEM functions to (un)lock reservations, move
> the new DRM Execution Contexts API.
>
> Signed-off-by: Maíra Canal <mcanal@igalia.com>

Oh, that looks really straight forward and clean. But I can only give an

Acked-by: Christian König <christian.koenig@amd.com>

since I don't know the VC4 code at all.

Regards,
Christian.

> ---
>   drivers/gpu/drm/vc4/Kconfig   |  1 +
>   drivers/gpu/drm/vc4/vc4_gem.c | 99 ++++++++---------------------------
>   2 files changed, 22 insertions(+), 78 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/Kconfig b/drivers/gpu/drm/vc4/Kconfig
> index c5f30b317698..0627e826fda4 100644
> --- a/drivers/gpu/drm/vc4/Kconfig
> +++ b/drivers/gpu/drm/vc4/Kconfig
> @@ -13,6 +13,7 @@ config DRM_VC4
>   	select DRM_DISPLAY_HDMI_HELPER
>   	select DRM_DISPLAY_HDMI_STATE_HELPER
>   	select DRM_DISPLAY_HELPER
> +	select DRM_EXEC
>   	select DRM_KMS_HELPER
>   	select DRM_GEM_DMA_HELPER
>   	select DRM_PANEL_BRIDGE
> diff --git a/drivers/gpu/drm/vc4/vc4_gem.c b/drivers/gpu/drm/vc4/vc4_gem.c
> index 22bccd69eb62..1021f45cb53c 100644
> --- a/drivers/gpu/drm/vc4/vc4_gem.c
> +++ b/drivers/gpu/drm/vc4/vc4_gem.c
> @@ -29,6 +29,7 @@
>   #include <linux/sched/signal.h>
>   #include <linux/dma-fence-array.h>
>   
> +#include <drm/drm_exec.h>
>   #include <drm/drm_syncobj.h>
>   
>   #include "uapi/drm/vc4_drm.h"
> @@ -578,19 +579,6 @@ vc4_update_bo_seqnos(struct vc4_exec_info *exec, uint64_t seqno)
>   	}
>   }
>   
> -static void
> -vc4_unlock_bo_reservations(struct drm_device *dev,
> -			   struct vc4_exec_info *exec,
> -			   struct ww_acquire_ctx *acquire_ctx)
> -{
> -	int i;
> -
> -	for (i = 0; i < exec->bo_count; i++)
> -		dma_resv_unlock(exec->bo[i]->resv);
> -
> -	ww_acquire_fini(acquire_ctx);
> -}
> -
>   /* Takes the reservation lock on all the BOs being referenced, so that
>    * at queue submit time we can update the reservations.
>    *
> @@ -599,70 +587,23 @@ vc4_unlock_bo_reservations(struct drm_device *dev,
>    * to vc4, so we don't attach dma-buf fences to them.
>    */
>   static int
> -vc4_lock_bo_reservations(struct drm_device *dev,
> -			 struct vc4_exec_info *exec,
> -			 struct ww_acquire_ctx *acquire_ctx)
> +vc4_lock_bo_reservations(struct vc4_exec_info *exec,
> +			 struct drm_exec *exec_ctx)
>   {
> -	int contended_lock = -1;
> -	int i, ret;
> -	struct drm_gem_object *bo;
> -
> -	ww_acquire_init(acquire_ctx, &reservation_ww_class);
> -
> -retry:
> -	if (contended_lock != -1) {
> -		bo = exec->bo[contended_lock];
> -		ret = dma_resv_lock_slow_interruptible(bo->resv, acquire_ctx);
> -		if (ret) {
> -			ww_acquire_done(acquire_ctx);
> -			return ret;
> -		}
> -	}
> -
> -	for (i = 0; i < exec->bo_count; i++) {
> -		if (i == contended_lock)
> -			continue;
> -
> -		bo = exec->bo[i];
> -
> -		ret = dma_resv_lock_interruptible(bo->resv, acquire_ctx);
> -		if (ret) {
> -			int j;
> -
> -			for (j = 0; j < i; j++) {
> -				bo = exec->bo[j];
> -				dma_resv_unlock(bo->resv);
> -			}
> -
> -			if (contended_lock != -1 && contended_lock >= i) {
> -				bo = exec->bo[contended_lock];
> -
> -				dma_resv_unlock(bo->resv);
> -			}
> -
> -			if (ret == -EDEADLK) {
> -				contended_lock = i;
> -				goto retry;
> -			}
> -
> -			ww_acquire_done(acquire_ctx);
> -			return ret;
> -		}
> -	}
> -
> -	ww_acquire_done(acquire_ctx);
> +	int ret;
>   
>   	/* Reserve space for our shared (read-only) fence references,
>   	 * before we commit the CL to the hardware.
>   	 */
> -	for (i = 0; i < exec->bo_count; i++) {
> -		bo = exec->bo[i];
> +	drm_exec_init(exec_ctx, DRM_EXEC_INTERRUPTIBLE_WAIT, exec->bo_count);
> +	drm_exec_until_all_locked(exec_ctx) {
> +		ret = drm_exec_prepare_array(exec_ctx, exec->bo,
> +					     exec->bo_count, 1);
> +	}
>   
> -		ret = dma_resv_reserve_fences(bo->resv, 1);
> -		if (ret) {
> -			vc4_unlock_bo_reservations(dev, exec, acquire_ctx);
> -			return ret;
> -		}
> +	if (ret) {
> +		drm_exec_fini(exec_ctx);
> +		return ret;
>   	}
>   
>   	return 0;
> @@ -679,7 +620,7 @@ vc4_lock_bo_reservations(struct drm_device *dev,
>    */
>   static int
>   vc4_queue_submit(struct drm_device *dev, struct vc4_exec_info *exec,
> -		 struct ww_acquire_ctx *acquire_ctx,
> +		 struct drm_exec *exec_ctx,
>   		 struct drm_syncobj *out_sync)
>   {
>   	struct vc4_dev *vc4 = to_vc4_dev(dev);
> @@ -708,7 +649,7 @@ vc4_queue_submit(struct drm_device *dev, struct vc4_exec_info *exec,
>   
>   	vc4_update_bo_seqnos(exec, seqno);
>   
> -	vc4_unlock_bo_reservations(dev, exec, acquire_ctx);
> +	drm_exec_fini(exec_ctx);
>   
>   	list_add_tail(&exec->head, &vc4->bin_job_list);
>   
> @@ -1123,7 +1064,7 @@ vc4_submit_cl_ioctl(struct drm_device *dev, void *data,
>   	struct drm_vc4_submit_cl *args = data;
>   	struct drm_syncobj *out_sync = NULL;
>   	struct vc4_exec_info *exec;
> -	struct ww_acquire_ctx acquire_ctx;
> +	struct drm_exec exec_ctx;
>   	struct dma_fence *in_fence;
>   	int ret = 0;
>   
> @@ -1216,7 +1157,7 @@ vc4_submit_cl_ioctl(struct drm_device *dev, void *data,
>   	if (ret)
>   		goto fail;
>   
> -	ret = vc4_lock_bo_reservations(dev, exec, &acquire_ctx);
> +	ret = vc4_lock_bo_reservations(exec, &exec_ctx);
>   	if (ret)
>   		goto fail;
>   
> @@ -1224,7 +1165,7 @@ vc4_submit_cl_ioctl(struct drm_device *dev, void *data,
>   		out_sync = drm_syncobj_find(file_priv, args->out_sync);
>   		if (!out_sync) {
>   			ret = -EINVAL;
> -			goto fail;
> +			goto fail_unreserve;
>   		}
>   
>   		/* We replace the fence in out_sync in vc4_queue_submit since
> @@ -1239,7 +1180,7 @@ vc4_submit_cl_ioctl(struct drm_device *dev, void *data,
>   	 */
>   	exec->args = NULL;
>   
> -	ret = vc4_queue_submit(dev, exec, &acquire_ctx, out_sync);
> +	ret = vc4_queue_submit(dev, exec, &exec_ctx, out_sync);
>   
>   	/* The syncobj isn't part of the exec data and we need to free our
>   	 * reference even if job submission failed.
> @@ -1248,13 +1189,15 @@ vc4_submit_cl_ioctl(struct drm_device *dev, void *data,
>   		drm_syncobj_put(out_sync);
>   
>   	if (ret)
> -		goto fail;
> +		goto fail_unreserve;
>   
>   	/* Return the seqno for our job. */
>   	args->seqno = vc4->emit_seqno;
>   
>   	return 0;
>   
> +fail_unreserve:
> +	drm_exec_fini(&exec_ctx);
>   fail:
>   	vc4_complete_exec(&vc4->base, exec);
>   

