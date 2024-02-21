Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD90D85D577
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 11:27:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12E4610E6CE;
	Wed, 21 Feb 2024 10:27:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="OTa3AGcq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2040.outbound.protection.outlook.com [40.107.243.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE3C089870;
 Wed, 21 Feb 2024 10:27:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fc6uStw4A1DtSbwitCAwtjeKpr1SSPzmXl/97FW8FMWbrdeq4NP4Dj7g+6MHbTV8UbYmB1ZnXpqcVhYX0Et/8eLFcPtezzRHe4iUN3YopQdS2ML0f5PgB6jMqodWRhYNpCwR3D96/24yS5stiB87iCzkZr+JIS+siLpHTviruiX6rrQuo2oLxXF5jmC5OhDC4ypPfFR78tsEQsSkRKcNzxUUdSI10q+MoFCBjOWV8ftpSio2Jf2GfKdzYzo0pXHfQGqHyXprUdbWsV2pwC9uib2fOsn8S2vE6W7hMD2i3zRWD5c9JDJ5CjvtO32mPM/6ojyQbvXMW5+yBjGB3X6+NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JUwyHumVju0+AOwMwXKmVgVyCIde5vq//HvDxfd3SAY=;
 b=UrtQkIsFvxP+lTVeBX2qfVN4+V6oxInWGIOKgNe6BK51oIiPXPN2dDhVMhcxV/3NTIPYT83o4izcLwFi2DvI8jZ7ibjkL2sofnp9pVC0PWxjhhPTBYz2Ww/Ja6p6xtW1BtY+QRogJJj5EGYAOqKEyi+rIQtAkD9XnXsbbHqh9NqfByhAr8dOimXnefDKTn7/ldo3nIxQxqdd3E1UTQ+O1uPLNrDQ9Lg4hvj6TeVBuNXP3y5EKq2R2tfvxBwkU42BIdQT9VmpY4dxlU0WkbWTt8zCHxS9X1Nj7lncYd9HgrzThkNAV4Q5TarWkCJL7DjuLJOZURbyR/KwZNy524IEpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JUwyHumVju0+AOwMwXKmVgVyCIde5vq//HvDxfd3SAY=;
 b=OTa3AGcqnUxerfTVDDszPPJVGuj7mzPgv1kB8jtT5Lt6bVU4bPjTe5Whh0XCwFGaIAOENZxb1CKhq9gyPSdSaC9GEmHBadPR5tboXcWLMRD350sl/jPlfEWOQsVFV6IpPGGL1+Z211GEYU62nqiG8USVRAeJeyeFWcGVjDSq9qU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SN7PR12MB7836.namprd12.prod.outlook.com (2603:10b6:806:34e::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.19; Wed, 21 Feb
 2024 10:26:58 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653%4]) with mapi id 15.20.7316.018; Wed, 21 Feb 2024
 10:26:58 +0000
Message-ID: <6733f48a-4fb2-446c-91a8-e631937fbfcb@amd.com>
Date: Wed, 21 Feb 2024 11:26:53 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ttm: Fix an invalid freeing on already freed page in
 error path
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: Dave Airlie <airlied@redhat.com>, Huang Rui <ray.huang@amd.com>,
 dri-devel@lists.freedesktop.org, stable@vger.kernel.org
References: <20240221073324.3303-1-thomas.hellstrom@linux.intel.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240221073324.3303-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0008.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::13) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SN7PR12MB7836:EE_
X-MS-Office365-Filtering-Correlation-Id: 123ba354-4cf3-4f4c-cefc-08dc32c7a278
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wDeeK5S4a3N63AW90wFsp+PLXQzg/sbRPJOftrhQmr6L73XQqrNkoRINiwxwgZyXHd+OSeSzNcf9lTSANTxSTWDFOSTcvdtkx6aNiggFl1yuqj6qQgy8GVeEwDhBtCFMgb15JOXUYYVyDK33W2BxOJuc1iCqMMLL/Tm8Nr4KuSVNV0uu0jJHlbey9sMIjjwfoMLXxLFNuWu3CAt4/98VlWSkbMdGOJ4UrJbqaPUjU+V7ekOcQMCJ0vFGarvxzfzwL51R2/mK1fDmezWma/rEyDAGCrzaKDpUqYPnsRl6kXt7rk/WtBkp9mQl88Z10FkzuQK65l/ZuCyk+j4rTnHkOLrLKSIPyHHU8qFL7T+OV5/eiSvwBOM3uO2NGXGaBwapC0PN9bG0adNccZAUHcnHoC3r6exkB8OIko4ywOb04+CQcSaeXZ99Njl8+SP4f2pMFhHh+knHUlodjiln2O6tz3lYw34kvSdDfzXSiGlYQR8gr87dPfcPuRwRKzObPWKEaXXSvnwPGSWe6+RtiNkt/m1OIonAcFDeA4R2xAr75s8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZzhJbjlZYXdFNS9IOTNxUllpaVVuM3p5cndFZHJXamdlN1ljeVpDVFR5NHNV?=
 =?utf-8?B?b1lBR01GWmxLOGhsMVRWQkJIZ2JTd2p3VDVRSHNhTWNDK0FGNU5uWDJFTWx2?=
 =?utf-8?B?c3B3cWZBazJhTGo0VlNTL1Zwd0k4QmNMbFExdGVKUGxKdmdndGZiVlBuQzcx?=
 =?utf-8?B?SU9sZC9sRHJES3VBZVNTZ3k5VHM0SExOWkFEdXhGa3NyUVMzY2t4cUxGSFd5?=
 =?utf-8?B?T2lqMzYvLzVnT2VpQTZiVDIrc05PcHU1TkZQUkNsS0dNZ2ZVUTBZU1RjR21L?=
 =?utf-8?B?ZGdWWHpkMFFyS25keGd2R3AvMkgvMXZOaVk4SVdycUtFRjBPZjc1Mk9OR2FP?=
 =?utf-8?B?TEZXd2dkUmxpWitZRTJmQ3A5Q0orTUloZlpBdFZZQnlXRldCdWIyeVdnTDRr?=
 =?utf-8?B?cm4xQXdJVDRKb2hQazZPUDJ5OFVLR2NjbVJNWXJ0Y1ZVa2pRSUJBd2Y3cVBt?=
 =?utf-8?B?OGxCS3kxVkg5ekFQaUVVb0Z3TW5DSEt4V1FRKzYyVHlmcnNNa21NQTYyTjNu?=
 =?utf-8?B?WjBEbEpkS3gwaVdoaVg5UHhsOFZOQVRuelU0dHFUZ1RNQVl4Q204RUIxdHJv?=
 =?utf-8?B?UjUyYXJVaHM3VzM4cUUyV2FCZUxXVk5nYmMyRjlsWUZ0eGxxTVdnY05IQVZh?=
 =?utf-8?B?djE4cWpOUDg2S0svV2VSdDJoUzhIYUR0Y0FNdDI4dENMdS9iaE96OWNURmUz?=
 =?utf-8?B?UTB2NzI3V1J1VHY1Z2RHT2srRThzNUUrTE90cTZYZjR6VDloSE94bVQ3ME5i?=
 =?utf-8?B?bDdtY2lDcnpzR3lsa29vRFlPSENKL2IxUUZKWlRLdEQ4MHoyb0lhU2tTcXpi?=
 =?utf-8?B?VDV5Rk9CNHZyVy9JV3lsOU9EVnI5QXkzRkNLdXVTV0hGUENQckZTZGRSMHZS?=
 =?utf-8?B?cittVmpPcFFZV3pyTkNsRDJXY21Dd1Q3OEZqWFowTmF1OTNtOCtDa3hmWmxQ?=
 =?utf-8?B?aXlhQnljbkpFajVqNUNOZUg5SGhScEU4RTJFZTdzRXVGRFpWTXVoTnNlVFRm?=
 =?utf-8?B?eXJmSWxpNnFCejZNaXZnZVRDazhQMUxDNmF5WjQxelJiNktBZVF1OVlza05w?=
 =?utf-8?B?WmtCeTlLUENYdW15ZHFBZllNbXh4UW1pd2VOajVJRXpKbitEN04xb2lzZHd6?=
 =?utf-8?B?aVI5RHY1MHBLZlZqc2dMenJmTGJKaWx2ZkxmcXNhVU9YTnRyN2xueXB0YWVE?=
 =?utf-8?B?Y0ZGRGxaRzN3MnJqNXZjRTYwUEo3RmN3TzIzM0xxUHdiSlpsRkJ0REtKR01K?=
 =?utf-8?B?YWVZanluajlEbm9JajNDL2pWTnlub2VvUHh6RWZMbENabEJ2d2Q3Y1RIdGVr?=
 =?utf-8?B?bUR1dFNuR0RFQnVjc0NjN2JTNGZaN1BqOXB2V1NweUhzaUNhaXBEVmdIM3pJ?=
 =?utf-8?B?aStNMWJqZklON3ZodGQyTHVFdGE0Q25saS9lSzFpdS96dDVoTHpyZVE4RnQ2?=
 =?utf-8?B?TXNoUmxncTJ1ZXJ5WUp2UWJtVUJldDBuc0MwUDJDT2xPeVBBTkdzMWExaWtL?=
 =?utf-8?B?VlhqaWplTFJ5L1ZlUjJoMklzNWdCcjlmZ2ZyWldsMEQ4R1RTNlY3U0JWbklR?=
 =?utf-8?B?NDlneG5EdWhQUXg1NERCdFVxdFppSk84cEZYaDZxS3BFMEl4TlZzakZGdjFM?=
 =?utf-8?B?ZHhzaUI4Vnd4VktsS3ZFcUM0NUlxZFRMa0hLMUxMamE2R21hZUhmc1VGSUJV?=
 =?utf-8?B?U3lGbWs5YTgzZGg2T0ZvRmMxSk5UZm9jKy8rWjB2dGsrdHJkLy9ETDk4dnRM?=
 =?utf-8?B?ejE5ZSt6ZEh0YjRKMEJzemN5Ti8rK0dpYXF0bVR1T0NLZ1luN1VPaTBVSDZM?=
 =?utf-8?B?ZW51ajRKVXNIQ1E0eFRvTnFWMDJPSUhrbGJaKzZaNURVN3pGR0xFWUdBZno3?=
 =?utf-8?B?a2xnV2Nhc3RXZzlabkEyU1c0WmpsZHI3NHordVRsNm1jSE9YdjRSdEtHdUlk?=
 =?utf-8?B?Nk54UmRrbk1GVXJXY0d4dlI4T1JkeVFRcUZzSFNGc0ZlTVFCdGpCRzJHa2w4?=
 =?utf-8?B?OVpDNFk0MjhHYy9LVk1DQTQ5YkRSK0ZkRGkzN25GMC9MVEpyenlJZy9DOUF0?=
 =?utf-8?B?V1VuTVFkM3dVbDN6QmRnZjJjUWdVTmdnQlE1L3JHV3V4WjQ1MG55Z1ZCR1pW?=
 =?utf-8?Q?s4AevoyKGAK2D4LGrtlIo408Z?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 123ba354-4cf3-4f4c-cefc-08dc32c7a278
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2024 10:26:58.7754 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x5HbnPKPPhQsBGVbJLqhw/MC4D0zOaZIFd4IeXJR8dzcJI8S+LfYU0DJL2B3Lax7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7836
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

Am 21.02.24 um 08:33 schrieb Thomas Hellström:
> If caching mode change fails due to, for example, OOM we
> free the allocated pages in a two-step process. First the pages
> for which the caching change has already succeeded. Secondly
> the pages for which a caching change did not succeed.
>
> However the second step was incorrectly freeing the pages already
> freed in the first step.
>
> Fix.
>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Fixes: 379989e7cbdc ("drm/ttm/pool: Fix ttm_pool_alloc error path")
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: Huang Rui <ray.huang@amd.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: <stable@vger.kernel.org> # v6.4+

You don't know how much time I've spend staring at this line to find the 
bug in it and haven't seen it. Got bug reports about that for month as well.

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/ttm/ttm_pool.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
> index b62f420a9f96..112438d965ff 100644
> --- a/drivers/gpu/drm/ttm/ttm_pool.c
> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> @@ -387,7 +387,7 @@ static void ttm_pool_free_range(struct ttm_pool *pool, struct ttm_tt *tt,
>   				enum ttm_caching caching,
>   				pgoff_t start_page, pgoff_t end_page)
>   {
> -	struct page **pages = tt->pages;
> +	struct page **pages = &tt->pages[start_page];
>   	unsigned int order;
>   	pgoff_t i, nr;
>   

