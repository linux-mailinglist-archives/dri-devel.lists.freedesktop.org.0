Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F34AED9BB
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 12:23:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFF0610E3F6;
	Mon, 30 Jun 2025 10:23:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="G03pMFMQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2047.outbound.protection.outlook.com [40.107.244.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2780D10E3F6
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 10:23:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lIfYuFKEnozSAs682i43uK8UmoBPIKob3L+bVymuxAoJALKW1xcfYlAq6fZaUOGNajE/GK7zoMhWqMNsFlEiSx4RSPMpiIOMFdMVFyuvrQKbTPYY2NyrcVCARMKe5fypKISQXDkhDTSNX4+tRMCMe+93POlW7K1xQ3QOqLrZ/QDGiTyjSda52a9TgUy2EQLN0YKD+a44Dq4QdNBFZMVHBIqqvUcdxJ4smIrLh4tI0ruqc45sl0vKLOrIr6THbLc/y1C+biEmJxOq2mxTPMgw4Sh6y3UZS7Oo24HfrcEiG1uMz2HdQNwvHe0xNI4y/9LwaLfk/bC/+FuyYefydgY8dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6/edVV5f7vKeIg/6Mg7G9WsfvRVY4DXE+eVJvDHagLg=;
 b=orDng1Nr4KDrqOMo4zLqh9fyLhjXQgBOa17CZit6K86R7GH4r3mfjiMvyUtGtslF3nMLCDjbQqck5v1Hu9p/f8l65UFQ7SJuQD7fKLe9AV3LU/ZA7kPryX5PnJ0zxBnfqxQyzIiESxtuZaDmEVKrfFFZ12GmBrJGiJeXyrYYGm+FsgWheytP14EqmPUmLHqphNXpDEu3e7hhyqZb65VaonMM1sk6DTPitLv0uhyLlMuxmoj+PEGbDr4XZteivK7f9SeX4fZzCjTNf5eRKuQaZ0AfYwPFAuCnxeleXaphW4/z6ZY/hlUIDQNedqpjeRYJCoYiuQRNVTWxL7DX7/g+6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6/edVV5f7vKeIg/6Mg7G9WsfvRVY4DXE+eVJvDHagLg=;
 b=G03pMFMQD1XmRne2l8MfOI5hpkyrPdLbSQ2yA/dp2wPaXMtMNeOxgumCd+FVA1hQzxyqfmUu6aeb8Xp8HU/fT8e+hiIOEq22A3xXQjjnxSvbV+Ai9Vb/e9McsjzyP+9quH2qcfHt9o4Pvw2p8ArEYajNL88iyxDWal+zx1k9VX8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MN2PR12MB4390.namprd12.prod.outlook.com (2603:10b6:208:26e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.30; Mon, 30 Jun
 2025 10:23:08 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8880.027; Mon, 30 Jun 2025
 10:23:08 +0000
Message-ID: <3a5bf0b0-7d45-445f-b9aa-d1a884634275@amd.com>
Date: Mon, 30 Jun 2025 12:23:02 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/17] ttm/pool: enable memcg tracking and shrinker.
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, Johannes Weiner <hannes@cmpxchg.org>
Cc: Dave Chinner <david@fromorbit.com>, Kairui Song <kasong@tencent.com>,
 Dave Airlie <airlied@redhat.com>
References: <20250630045005.1337339-1-airlied@gmail.com>
 <20250630045005.1337339-14-airlied@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250630045005.1337339-14-airlied@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR19CA0018.namprd19.prod.outlook.com
 (2603:10b6:208:178::31) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MN2PR12MB4390:EE_
X-MS-Office365-Filtering-Correlation-Id: 6618f9c7-07e6-4942-34bd-08ddb7c01b9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RjNlYVZROGY4dDRCWnlhSUtLM2xvWW1oYlpmYmFCNFYvbjBJanhCcDVhRW03?=
 =?utf-8?B?Qm1rZVlQd0xSNjkwcmN1ODNHSkprR3JLQ1FSRFVSdzBQT1pvWmI5cWZDcEVT?=
 =?utf-8?B?Y2h4UVB4eXRCRC9jbUZQR2RGSmhOY1pZUGloNWd4dmlLdTBldzIvZ25JMy9S?=
 =?utf-8?B?NFhobTk0WEpwWFRqTFllQWtxSnNweWQ3VUNiSEwwcUVtTG1wOUdEMU9ScGJW?=
 =?utf-8?B?M0EyS3RsQTdhM2lEWjNYSDlJZk9UM2QxMGwzTmp5UmduMWZsZFV6UVYvM29B?=
 =?utf-8?B?VzBqRlBBRm9tYnVNM1dnZFhaeFpiWUtiY202SDF2M1MrSVVyRzRKbFQ1L3F5?=
 =?utf-8?B?cWZQY1pXTUVuVi9oV1lMakFvV2RRamhFR3p4L0RLM0dyaFQrcG1JNVo2Z1pY?=
 =?utf-8?B?SkFHQU4zc2lmN2h5dUdremxjTUsrc1hDcWN4cFZ2Z1JmZks3amxoMXB1bDA4?=
 =?utf-8?B?clNYbURpYXd0S2xpMmxFUWpHVDB4YXJEd3I4RlpxY2VzSXg4NkVQdmVHRUtz?=
 =?utf-8?B?MGU1cnp0a0ZQaHlpN1NRMm5LSGIxdUgrOVljUEh1eU8vVjRlNkt4Y3RET0Fu?=
 =?utf-8?B?RjJhV0pqNlA3RmpXVThzNVE3UDJIeUhYdVlGTEJDNlZpckdWRHVKSVhZQ3c3?=
 =?utf-8?B?ajlOZDV0bDg0UFZGSVZNZTVqRjAwOUJ0N1ZYMWJJUnZDdVRabHBrV1ZTZDFM?=
 =?utf-8?B?NkZYNkh3Z2JUMkJQZVJWUy8vSW8zYzNCdktzV240NzJ5NCtqbklPeEVURUty?=
 =?utf-8?B?Ymxxd0pkWkdWc0M1dHQ1aTkxczdFVURjL081UFJGZEswSjhSZ3RzemJkSTls?=
 =?utf-8?B?ODB5aDZZSWtTNjlJcyt2czFiUkNGNkxpZmZWN0c2K2pJQ1gyZUNnUUcxVWZj?=
 =?utf-8?B?MWk5Nk53akNkT05ZMEZLKzdEUXhvREgwTVhCRXpNMElKN0dZS0J3ZUFBN2Vx?=
 =?utf-8?B?OG9zaUpCd0o5aEFoMmQzd3NOTFBZRENGVGlXL0w4UFdwSERLNnNUcHR2RlhV?=
 =?utf-8?B?OVdudENJZlVGVno0bzc5QnVmUzRsaGFPTHRpZEo5aGF4dzlJMHFCSEVoR0J1?=
 =?utf-8?B?cWdtOGF1VlRqMjl6SWt1ajhNQjIzdWFIQU5vY0diSk5PTHZ0YjloM0U5eVlK?=
 =?utf-8?B?bEJ1SmhobmdaeDlqOGFxbTVRdzIwdnhReUcvTm0zVUxreWVQdzVlUGdBa0Vx?=
 =?utf-8?B?dm45cmlaa1JyaGJHbTJYQzIya1RubWk4Nk9UcXJ6anVwSWVFb3lRanZSMUFI?=
 =?utf-8?B?bTVteVlJVWxJRWlOYW90bWxXdWVZVW9kcG1saExqVk9KK1dmMXlCdmlxT3Z6?=
 =?utf-8?B?NDhud1dYTzJNMXhkcmVXRlB3VFlBdWlBaitLTGFac3NJSGJRNlNVVUE2UWlB?=
 =?utf-8?B?dGFkZTZHS0x2dXRHY3R1RCtuR1JTZzIzajc2MU9ETlQyU2JGSnBFNURydkRq?=
 =?utf-8?B?aWJ4RDNWY0E2c0NEQTM1UElsaGxLR2NCOGtLNlkzQUtIaU9Td3kwcTZpRUJi?=
 =?utf-8?B?WEdKdnNmYXdlOW1XV25tMUR4T0ZvVnNpRTNqWjQ2SmtVQ21UMFFQQU9NRTVX?=
 =?utf-8?B?UHBnNHJaV3JHcEhtQllpRjU0Z1F0dDluZnhESW0wSTYxTXJrVmljeWZEQllX?=
 =?utf-8?B?MlFHTTc2Ny9CL21xUDVnYmlLUzhyS3kzVHdDNlNaMHpRalQvWVJ5M0FkUXVw?=
 =?utf-8?B?UmJ2ZUdncHV5Y1BzQld0WURNc0tGLzJ0TlRMbW9FOWhWUlppLzZ4OFRSdGpX?=
 =?utf-8?B?MlZlcm9TTHp3emo5M2NqRlZaQWwvcnJkQzFmMVlHVlNwQzZUUXJVVEE2Qk5k?=
 =?utf-8?B?RnFZRXV1dURxT05XOTIveURBUzdkNW5HM2J4eldKT1hWa0lqL25tS2lZd1FN?=
 =?utf-8?B?djVzWUMvWjAxc1Vib20rU2kxWE9lWmtnZ1R5cFJiWkRUM3c9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V0JjZGQ0b1A4QVpwRTZPT2VvdmhtdkUxb2lJWmNTemJCK09Ceno3WWdkU25s?=
 =?utf-8?B?U3JkZVppaWE0dUdkNmpOVEttQmNhbEhJU3M1VmVrR2pFT0Y1VGFNeGVMTVpY?=
 =?utf-8?B?WE5xbE5LMFRkd0FKWUlQMzJ5eHFaNlh6SmdjZjgzSGRKZkRFVjFndmc4eGJC?=
 =?utf-8?B?WXorZWNGL2pnOTQ4Um1WWUNnMWJETmxaOU4wQWF5NFFkQzRoR1BlNkdXRHA4?=
 =?utf-8?B?bzFFd2JQR0ExZHZnTVh2anYxZDAwTlcyaEgraWViTlhDM1BwNVJ2aHM2N2l5?=
 =?utf-8?B?SGNlNFgyYXl4N1ROTVdkV2V4T09CWmFCeWVYYjlKWm1MdVZnMUZnS3JQd3kw?=
 =?utf-8?B?UlNUdFV6WHhaVUZWSHRSbEcrdjdSYnNiVEYrQ3YzRysxcENqRkR1Z0hleDNp?=
 =?utf-8?B?NVJnQWMvUlFBYm1sUk1BSkVIeUJvM2VqZk9WNnB5SE4yVGUrOU9XLzRYVmdW?=
 =?utf-8?B?M1VqNEYybWppUjlzT3k4bFdLR0VMSVc0UDRvWDFReCtWS1kzUnZweHlsS2Zy?=
 =?utf-8?B?VXdORkhWZEg1OFJQdmh4d0dPYW05TUZLUjh6VG5mT0FNUzhvYUhGcXZNUUxF?=
 =?utf-8?B?TDc0NU5oVlRRK2hmYVlkRGI2cHBOY0N4STJUcStxTEg3YVRCU1ZOSXl4cUo5?=
 =?utf-8?B?MWNZUTE5RXRvdGVpOHh3MVBDdWtQaXhsOGljZGJscHpDRzc1ZWROVnpNdEFr?=
 =?utf-8?B?RDRaTUZJQXhSQ2lYckxUVUw0ekFUMjhaMTR1S09OU0U5eGp3WkZRYTAyRFRi?=
 =?utf-8?B?VkdkODJlRmY1NjJ2QjRvN1ZTY3RWMmpRd3ZlWTBRS3dQUys3dG1admZtWXM5?=
 =?utf-8?B?dUd6SHNMR2RNdFY3cWtxYkdhZkRDK1lqOFZUOU9abmt0MmpsQ1B1QkZ3T2tH?=
 =?utf-8?B?ZnhnSmdqR0pKcG1OWmJsSFBmYnlCOGs3dmJMMURLbm5aZFpRMEo4OXh6KzUv?=
 =?utf-8?B?TE5Da2p6U3ltU1NWMTcvYmpiQ28ycFl0M1o1QWszZzJGc1pkbnBCZzd2VnBG?=
 =?utf-8?B?ZE9GaGZtSVVnMmVHdmc5UDAyKzNNMHVuSWFTOGh1SFZaYW11MVp4WndQZmli?=
 =?utf-8?B?VDA4SVpLMDJBL1FvSmRXYVV4NGwxZm9oY3dzT1VJWnUxd2lRNVgzZ0V2NkJi?=
 =?utf-8?B?Ym1nK0RsdjBQUk1kZUlMVUNSdjA2ajVSaGZwWG1ra0k0NkxZMkIzUTk3Q0Zi?=
 =?utf-8?B?WUtGSmMxRnMzWGxWVGtrN3oxaFFqb3pvVXBZV2hhQjd1SklQYmdZSjZwYmJx?=
 =?utf-8?B?U2oxaTdKTDAvMjU2Rjg4SUkrRlhwNXlNbFEyL3NET2VVSkpjY0ZLdUdHTlpK?=
 =?utf-8?B?VVR1L2xRTnRSeWM2ekJVc3hyVVpYeThqcHdXT0ZBVDVFdzVIMXdyWHpSU2M3?=
 =?utf-8?B?U3NZQlhTN0x4MkFZTWRQWnJuMTZQdnlndGc2KzNrS3dXY0lrZ2NHL3p4YlBD?=
 =?utf-8?B?bXpraEpkRTV2N1A2Q0t5WnVLVlB6SXNKOCtEY2NzclpsYzBEbHVIYmdkd3NN?=
 =?utf-8?B?cFhKQzMySWVOR3pncDJqVWVwTkNYeUFkZ1l5ZkFQekVhTnRKVTZQMlVPVXdt?=
 =?utf-8?B?ZlQ0Sk9UUkJZeXJnVVc3TnhPS3NYeFlHWmVpa1Y4djEvSEZHb3FZdzJhQ2l2?=
 =?utf-8?B?Qm9uN1pEcVhCZ0VteVlhUW9URTJjWTR4cXcxVXpkaXdEMm4yaG1lNDhnQzgy?=
 =?utf-8?B?UFJsd1c5dWJVOGc3YUJoSkdENlVCbjVrSFEwdXRDenA1YWFGR1dVQnIvRUg5?=
 =?utf-8?B?Y2xzbUwvOCt6WHNUY3FmRjRVK0MwblJKUWdub2VRZ1dqSUI2S3FYWlBySmpV?=
 =?utf-8?B?MXpOTUYwMC84NEJjakpPd0pTVzhyR3BOUEVZUTlkU1pGbnVtcElpa0dOcW9H?=
 =?utf-8?B?SE82Ymw3MXhwS1NEWWxqU0RMVUNYNTFCOXRHNzBjMVMxSzVReDBRTyt0eFk0?=
 =?utf-8?B?SXZlMk5qckZzdXlIL25oZVEvWk1zSDR4SzlkSFE4OFhlbVYyK0c3MmJIZWdi?=
 =?utf-8?B?S0JEODB0N2w0S3p1bmVJOXNMQTl5aTBpN2hWVWtCV1Z0VjFtelZhUW5UMTNT?=
 =?utf-8?B?NVZDT0p1WTZTbzlzeUhKc00xWktPSDVoRE14UDhoT2JRMmNwMmhlTHJ4Rm9s?=
 =?utf-8?Q?kxDF7+ZeJCQ/Jox/9NzxA3Xk5?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6618f9c7-07e6-4942-34bd-08ddb7c01b9e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 10:23:08.4513 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ih8WRp09BOdaHlSlhG6ZSDnKolnECGzs4DeHkYvPiyC5gPIhGBkja1xARCtNEmv4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4390
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

On 30.06.25 06:49, Dave Airlie wrote:
> From: Dave Airlie <airlied@redhat.com>
> 
> This enables all the backend code to use the list lru in memcg mode,
> and set the shrinker to be memcg aware.
> 
> It adds the loop case for when pooled pages end up being reparented
> to a higher memcg group, that newer memcg can search for them there
> and take them back.

Again, this makes no sense at all and will break existing use cases.

Regards,
Christian.

> 
> Signed-off-by: Dave Airlie <airlied@redhat.com>
> ---
>  drivers/gpu/drm/ttm/ttm_pool.c | 123 ++++++++++++++++++++++++++++-----
>  1 file changed, 105 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
> index 210f4ac4de67..49e92f40ab23 100644
> --- a/drivers/gpu/drm/ttm/ttm_pool.c
> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> @@ -143,7 +143,9 @@ static int ttm_pool_nid(struct ttm_pool *pool) {
>  }
>  
>  /* Allocate pages of size 1 << order with the given gfp_flags */
> -static struct page *ttm_pool_alloc_page(struct ttm_pool *pool, gfp_t gfp_flags,
> +static struct page *ttm_pool_alloc_page(struct ttm_pool *pool,
> +					struct obj_cgroup *objcg,
> +					gfp_t gfp_flags,
>  					unsigned int order)
>  {
>  	unsigned long attr = DMA_ATTR_FORCE_CONTIGUOUS;
> @@ -163,6 +165,10 @@ static struct page *ttm_pool_alloc_page(struct ttm_pool *pool, gfp_t gfp_flags,
>  		p = alloc_pages_node(pool->nid, gfp_flags, order);
>  		if (p) {
>  			p->private = order;
> +			if (!mem_cgroup_charge_gpu_page(objcg, p, order, gfp_flags, false)) {
> +				__free_pages(p, order);
> +				return NULL;
> +			}
>  			mod_node_page_state(NODE_DATA(ttm_pool_nid(pool)), NR_GPU_ACTIVE, (1 << order));
>  		}
>  		return p;
> @@ -214,6 +220,7 @@ static void ttm_pool_free_page(struct ttm_pool *pool, enum ttm_caching caching,
>  #endif
>  
>  	if (!pool || !pool->use_dma_alloc) {
> +		mem_cgroup_uncharge_gpu_page(p, order, reclaim);
>  		mod_node_page_state(NODE_DATA(ttm_pool_nid(pool)),
>  				    reclaim ? NR_GPU_RECLAIM : NR_GPU_ACTIVE,
>  				    -(1 << order));
> @@ -303,12 +310,13 @@ static void ttm_pool_type_give(struct ttm_pool_type *pt, struct page *p)
>  
>  	INIT_LIST_HEAD(&p->lru);
>  	rcu_read_lock();
> -	list_lru_add(&pt->pages, &p->lru, nid, NULL);
> +	list_lru_add(&pt->pages, &p->lru, nid, page_memcg_check(p));
>  	rcu_read_unlock();
>  
>  	atomic_long_add(num_pages, &allocated_pages[nid]);
>  	mod_node_page_state(NODE_DATA(nid), NR_GPU_ACTIVE, -num_pages);
>  	mod_node_page_state(NODE_DATA(nid), NR_GPU_RECLAIM, num_pages);
> +	mem_cgroup_move_gpu_page_reclaim(NULL, p, pt->order, true);
>  }
>  
>  static enum lru_status take_one_from_lru(struct list_head *item,
> @@ -323,20 +331,59 @@ static enum lru_status take_one_from_lru(struct list_head *item,
>  	return LRU_REMOVED;
>  }
>  
> -/* Take pages from a specific pool_type, return NULL when nothing available */
> -static struct page *ttm_pool_type_take(struct ttm_pool_type *pt, int nid)
> +static int pool_lru_get_page(struct ttm_pool_type *pt, int nid,
> +			     struct page **page_out,
> +			     struct obj_cgroup *objcg,
> +			     struct mem_cgroup *memcg)
>  {
>  	int ret;
>  	struct page *p = NULL;
>  	unsigned long nr_to_walk = 1;
> +	unsigned int num_pages = 1 << pt->order;
>  
> -	ret = list_lru_walk_node(&pt->pages, nid, take_one_from_lru, (void *)&p, &nr_to_walk);
> +	ret = list_lru_walk_one(&pt->pages, nid, memcg, take_one_from_lru, (void *)&p, &nr_to_walk);
>  	if (ret == 1 && p) {
> -		atomic_long_sub(1 << pt->order, &allocated_pages[nid]);
> -		mod_node_page_state(NODE_DATA(nid), NR_GPU_ACTIVE, (1 << pt->order));
> -		mod_node_page_state(NODE_DATA(nid), NR_GPU_RECLAIM, -(1 << pt->order));
> +		atomic_long_sub(num_pages, &allocated_pages[nid]);
> +		mod_node_page_state(NODE_DATA(nid), NR_GPU_RECLAIM, -num_pages);
> +
> +		if (!mem_cgroup_move_gpu_page_reclaim(objcg, p, pt->order, false)) {
> +			__free_pages(p, pt->order);
> +			p = NULL;
> +		}
> +		if (p)
> +			mod_node_page_state(NODE_DATA(nid), NR_GPU_ACTIVE, num_pages);
>  	}
> -	return p;
> +	*page_out = p;
> +	return ret;
> +}
> +
> +/* Take pages from a specific pool_type, return NULL when nothing available */
> +static struct page *ttm_pool_type_take(struct ttm_pool_type *pt, int nid,
> +				       struct obj_cgroup *orig_objcg)
> +{
> +	struct page *page_out = NULL;
> +	int ret;
> +	struct mem_cgroup *orig_memcg = orig_objcg ? get_mem_cgroup_from_objcg(orig_objcg) : NULL;
> +	struct mem_cgroup *memcg = orig_memcg;
> +
> +	/*
> +	 * Attempt to get a page from the current memcg, but if it hasn't got any in it's level,
> +	 * go up to the parent and check there. This helps the scenario where multiple apps get
> +	 * started into their own cgroup from a common parent and want to reuse the pools.
> +	 */
> +	while (!page_out) {
> +		ret = pool_lru_get_page(pt, nid, &page_out, orig_objcg, memcg);
> +		if (ret == 1)
> +			break;
> +		if (!memcg)
> +			break;
> +		memcg = parent_mem_cgroup(memcg);
> +		if (!memcg)
> +			break;
> +	}
> +
> +	mem_cgroup_put(orig_memcg);
> +	return page_out;
>  }
>  
>  /* Initialize and add a pool type to the global shrinker list */
> @@ -346,7 +393,7 @@ static void ttm_pool_type_init(struct ttm_pool_type *pt, struct ttm_pool *pool,
>  	pt->pool = pool;
>  	pt->caching = caching;
>  	pt->order = order;
> -	list_lru_init(&pt->pages);
> +	list_lru_init_memcg(&pt->pages, mm_shrinker);
>  
>  	spin_lock(&shrinker_lock);
>  	list_add_tail(&pt->shrinker_list, &shrinker_list);
> @@ -389,6 +436,30 @@ static void ttm_pool_type_fini(struct ttm_pool_type *pt)
>  	ttm_pool_dispose_list(pt, &dispose);
>  }
>  
> +static int ttm_pool_check_objcg(struct obj_cgroup *objcg)
> +{
> +#ifdef CONFIG_MEMCG
> +	int r = 0;
> +	struct mem_cgroup *memcg;
> +	if (!objcg)
> +		return 0;
> +
> +	memcg = get_mem_cgroup_from_objcg(objcg);
> +	for (unsigned i = 0; i < NR_PAGE_ORDERS; i++) {
> +		r = memcg_list_lru_alloc(memcg, &global_write_combined[i].pages, GFP_KERNEL);
> +		if (r) {
> +			break;
> +		}
> +		r = memcg_list_lru_alloc(memcg, &global_uncached[i].pages, GFP_KERNEL);
> +		if (r) {
> +			break;
> +		}
> +	}
> +	css_put(&memcg->css);
> +#endif
> +	return 0;
> +}
> +
>  /* Return the pool_type to use for the given caching and order */
>  static struct ttm_pool_type *ttm_pool_select_type(struct ttm_pool *pool,
>  						  enum ttm_caching caching,
> @@ -418,7 +489,9 @@ static struct ttm_pool_type *ttm_pool_select_type(struct ttm_pool *pool,
>  }
>  
>  /* Free pages using the per-node shrinker list */
> -static unsigned int ttm_pool_shrink(int nid, unsigned long num_to_free)
> +static unsigned int ttm_pool_shrink(int nid,
> +				    struct mem_cgroup *memcg,
> +				    unsigned long num_to_free)
>  {
>  	LIST_HEAD(dispose);
>  	struct ttm_pool_type *pt;
> @@ -430,7 +503,11 @@ static unsigned int ttm_pool_shrink(int nid, unsigned long num_to_free)
>  	list_move_tail(&pt->shrinker_list, &shrinker_list);
>  	spin_unlock(&shrinker_lock);
>  
> -	num_pages = list_lru_walk_node(&pt->pages, nid, pool_move_to_dispose_list, &dispose, &num_to_free);
> +	if (!memcg) {
> +		num_pages = list_lru_walk_node(&pt->pages, nid, pool_move_to_dispose_list, &dispose, &num_to_free);
> +	} else {
> +		num_pages = list_lru_walk_one(&pt->pages, nid, memcg, pool_move_to_dispose_list, &dispose, &num_to_free);
> +	}
>  	num_pages *= 1 << pt->order;
>  
>  	ttm_pool_dispose_list(pt, &dispose);
> @@ -595,6 +672,7 @@ static int ttm_pool_restore_commit(struct ttm_pool_tt_restore *restore,
>  			 */
>  			ttm_pool_split_for_swap(restore->pool, p);
>  			copy_highpage(restore->alloced_page + i, p);
> +			p->memcg_data = 0;
>  			__free_pages(p, 0);
>  		}
>  
> @@ -756,6 +834,7 @@ static int __ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
>  	bool allow_pools;
>  	struct page *p;
>  	int r;
> +	struct obj_cgroup *objcg = memcg_account ? tt->objcg : NULL;
>  
>  	WARN_ON(!alloc->remaining_pages || ttm_tt_is_populated(tt));
>  	WARN_ON(alloc->dma_addr && !pool->dev);
> @@ -773,6 +852,9 @@ static int __ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
>  
>  	page_caching = tt->caching;
>  	allow_pools = true;
> +
> +	ttm_pool_check_objcg(objcg);
> +
>  	for (order = ttm_pool_alloc_find_order(MAX_PAGE_ORDER, alloc);
>  	     alloc->remaining_pages;
>  	     order = ttm_pool_alloc_find_order(order, alloc)) {
> @@ -782,7 +864,7 @@ static int __ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
>  		p = NULL;
>  		pt = ttm_pool_select_type(pool, page_caching, order);
>  		if (pt && allow_pools)
> -			p = ttm_pool_type_take(pt, ttm_pool_nid(pool));
> +			p = ttm_pool_type_take(pt, ttm_pool_nid(pool), objcg);
>  
>  		/*
>  		 * If that fails or previously failed, allocate from system.
> @@ -793,7 +875,7 @@ static int __ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
>  		if (!p) {
>  			page_caching = ttm_cached;
>  			allow_pools = false;
> -			p = ttm_pool_alloc_page(pool, gfp_flags, order);
> +			p = ttm_pool_alloc_page(pool, objcg, gfp_flags, order);
>  		}
>  		/* If that fails, lower the order if possible and retry. */
>  		if (!p) {
> @@ -937,7 +1019,7 @@ void ttm_pool_free(struct ttm_pool *pool, struct ttm_tt *tt)
>  
>  	while (atomic_long_read(&allocated_pages[nid]) > pool_node_limit[nid]) {
>  		unsigned long diff = pool_node_limit[nid] - atomic_long_read(&allocated_pages[nid]);
> -		ttm_pool_shrink(nid, diff);
> +		ttm_pool_shrink(nid, NULL, diff);
>  	}
>  }
>  EXPORT_SYMBOL(ttm_pool_free);
> @@ -1057,6 +1139,7 @@ long ttm_pool_backup(struct ttm_pool *pool, struct ttm_tt *tt,
>  			if (flags->purge) {
>  				shrunken += num_pages;
>  				page->private = 0;
> +				page->memcg_data = 0;
>  				__free_pages(page, order);
>  				memset(tt->pages + i, 0,
>  				       num_pages * sizeof(*tt->pages));
> @@ -1193,10 +1276,14 @@ static unsigned long ttm_pool_shrinker_scan(struct shrinker *shrink,
>  					    struct shrink_control *sc)
>  {
>  	unsigned long num_freed = 0;
> +	int num_pools;
> +	spin_lock(&shrinker_lock);
> +	num_pools = list_count_nodes(&shrinker_list);
> +	spin_unlock(&shrinker_lock);
>  
>  	do
> -		num_freed += ttm_pool_shrink(sc->nid, sc->nr_to_scan);
> -	while (num_freed < sc->nr_to_scan &&
> +		num_freed += ttm_pool_shrink(sc->nid, sc->memcg, sc->nr_to_scan);
> +	while (num_pools-- >= 0 && num_freed < sc->nr_to_scan &&
>  	       atomic_long_read(&allocated_pages[sc->nid]));
>  
>  	sc->nr_scanned = num_freed;
> @@ -1388,7 +1475,7 @@ int ttm_pool_mgr_init(unsigned long num_pages)
>  	spin_lock_init(&shrinker_lock);
>  	INIT_LIST_HEAD(&shrinker_list);
>  
> -	mm_shrinker = shrinker_alloc(SHRINKER_NUMA_AWARE, "drm-ttm_pool");
> +	mm_shrinker = shrinker_alloc(SHRINKER_MEMCG_AWARE | SHRINKER_NUMA_AWARE, "drm-ttm_pool");
>  	if (!mm_shrinker)
>  		return -ENOMEM;
>  

