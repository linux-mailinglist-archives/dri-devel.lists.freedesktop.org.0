Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 806A285F4F4
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 10:48:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AC5B10E8E4;
	Thu, 22 Feb 2024 09:48:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="haE6fdb2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2086.outbound.protection.outlook.com [40.107.237.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE77110E8DE;
 Thu, 22 Feb 2024 09:48:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IjdPGvrM++vEQsSkA7GYOZnvJRiKKw464uSc43v1tQYn0Gwxj6WTo6N0PsjI1nghSpi+hGEWFowyu5Lw8TMsqkyrhmAFiqCx4h68b+vJJQ4k+nOZkQwoxv5W4W0YAEV1f87zqU9ctvZJs6CCC8YGDpcCP3kINyiE6nj4iGqDssLNLAerOrmfzWSGFpvowCx/L992Rj0nhu7tDBSCze3TduQbiSjS4cfpWnxcekbf2Yzw4A0tisYxCaDDYDmZceqrEmzFk9u7HFfa0IQx2u3L685YbtS5+sWSH7hZq09YTqgraCuMJQV6phn8ykg/N46dZCvXiBYbQ+GftEb9Mzyu3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sTaksguILrCfb0x6X7sSKa4T3tk18eElChVGROQd4CA=;
 b=nzd6aOfgghXoKUatlAKPvx60c7PZ9WNBqm/nx1U2+OHjLIDZPbL+VFl938vbBi3J8q9CxNN5NHtja5hZoXr5J1iezwTaM+kTvBZSm1ySn4X6mGOngyhirYeqxq/hom0PHcRw5M0MMvJc47htjxE7Og0hVOQzowZZMETwXTt6bwuY5ghKZuMPMReNiavitGGxo0UNzRbWXcLkP6forpMQe+8pioxKdNVLL3OOaw7CUcjrqkrki/At/TLZ/R44HuQCf2V33Q3+gLvZtj0c7q86aU3Lf66iQK4JxgaEfcg4KilUEgC7g3BDJngDYR7pzCfF7uC/cSi284dYUzTGxb6JfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sTaksguILrCfb0x6X7sSKa4T3tk18eElChVGROQd4CA=;
 b=haE6fdb2F9BWAslO4a2a1PPKZhllaBn4GDW+RhPnRR/D9PPvH3NoJ3JRoUSARQ+2cEB2goU2V4f2BB8xd8djAgbCU/mVlJIkTfGW5koaPWOZwX/+tJA02bnRJAYzPiDgpifCSmkyXUw1ApoJieSawR4LxlpB0cAdm7NQzwUHAD4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH0PR12MB8550.namprd12.prod.outlook.com (2603:10b6:610:192::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.21; Thu, 22 Feb
 2024 09:47:55 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653%4]) with mapi id 15.20.7316.018; Thu, 22 Feb 2024
 09:47:55 +0000
Message-ID: <e943173e-7b3a-4619-a1fd-7a2db5c91f4e@amd.com>
Date: Thu, 22 Feb 2024 10:47:50 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ttm: Fix an invalid freeing on already freed page in
 error path
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: Dave Airlie <airlied@redhat.com>, Huang Rui <ray.huang@amd.com>,
 dri-devel@lists.freedesktop.org, stable@vger.kernel.org
References: <20240221073324.3303-1-thomas.hellstrom@linux.intel.com>
 <6733f48a-4fb2-446c-91a8-e631937fbfcb@amd.com>
 <12471d185a3c90e53d665878db321c36e3fd2e53.camel@linux.intel.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <12471d185a3c90e53d665878db321c36e3fd2e53.camel@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0238.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b2::13) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH0PR12MB8550:EE_
X-MS-Office365-Filtering-Correlation-Id: fd4f733b-f35b-456d-4e05-08dc338b5858
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XYMEqb0H5Li1FvGRhv/qaEdZIG+zZoGLE/j8pUpttIzAh/YAaNDSQv9IJ2iiBFnWM0zikytp+pUISiZk6mj+PfFqeZuyp1IGFPPaVxa6k81EaauXLCfLSmoZ9MUvKpT2bmDujna656q4SOBsmu+NbNqhIMlaxFTW7pT7C3ICHpxdzR0UwF4DHrUVd81MCmCxys8fR4FRFzbAp5mjCURUv+rYlmPtrGAACAYWq/YGwog5rTMzGUnIBpvSppQNBdA5wEcjEfJu/qSFTKe97mq04nmVCzbW09RXMATdEA8oV8g+5JIqkjtI5CA7WRqAoL0PZUhZf2FoZw8uW2FXI9FCiwMgnRFYYn7NCw4SdYV36YssYLjXXjU+PgIOO8vzD5U0oKijqNWY4VYjvjzXZcG4Fvv3j8kOfeFXhffWFNfPNGefLkfAmiid/v/pSt6AmoRbCoE7pVuOTtizcfNsqhnDFbQG8TBXL6/2dMRE7JRdV7rLcQ7gSbbZLF2SMub+3fn3sQ9Fo6t1cZtgK31gAk+XvR+6sYvpMCQ2rf6+OUcZni0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SUdST3hWTGw5c2tuTnB2Vzd2OGtXdUJEejYzNmJDWVpQWTI5SUQ3MHVKOFZP?=
 =?utf-8?B?RVFxdGlRaWFZRGNJL3pSUWs4ZUJwR3p1VzlEaXBUSTAwcjZGYUs1d3pWUGU5?=
 =?utf-8?B?MUdKZnVvTHNmZjJoRVJiMGwrQ01KbVMyc0R3WFBVeXdaYlJRNmZrRHZ2ZDZp?=
 =?utf-8?B?VVRsS0llNHpZSVROR3ZPOVVLSStFZzFHNlYrcVpjTXdQc2hPSEVNYmIvMkRp?=
 =?utf-8?B?QzExMm92TCtYQ0NBWkFZNTVtMmoyMHFFQ1ZjYmJZeU9abG84THdyWVBUQnpn?=
 =?utf-8?B?VmpMNjl6bkxOVUU0NWlxbWlzSCtibzYwZ0lpbVlOQzVUS0Q0T0g3MWpnamla?=
 =?utf-8?B?M2QxblZwVG1ZTWlBTFN1OFkwWmd4dS9JNGhhTU9wYUxFRi9HckM2Q1hoVDl0?=
 =?utf-8?B?QVQ4bG4yMXliWW44U0RGYVVIYXg3STJVemJ1UjRrUWVFZ2xSWTdGa2lvT1hM?=
 =?utf-8?B?TjZCNzNuMlRwNHdkL05JUlBaQVk3OGZMSlFtOXU5cmt1T1c1UGJwcUlleEVE?=
 =?utf-8?B?SWdIazl6M1o5SnQwSFVQZlZlVnhLdU4ybXN4MTk2VXh2UWhsbUl6Uk50Tnlq?=
 =?utf-8?B?UnM5S0RUK2gyWHpJZ1I2ZXBObnYzUXIyN0t6aWRKWHRldWMzOVU0QU44b2RF?=
 =?utf-8?B?Nnk2TDBRZHJCWVZwYkZ1MnpoS3FaUEM0L3ZvN2tPZjhXMkVJekVmWDk4Wmo2?=
 =?utf-8?B?aFFJOHA4OVBwWDhiTXN0M3NuYmRiRm9iaTNhbXNKRHZ1a1d6NUJtWkZ5b0JU?=
 =?utf-8?B?WmNqN0JnMDFCSHVaMHh0Zzhyd05OQ1g0NjFrTFBFUWkvcmErdGtTUWk0d29k?=
 =?utf-8?B?MStSYnpXNmdEb1FoZ0pXRiswVlZsR2hIN1hpNVFKbmlhU2llRTBRVHlHT2I0?=
 =?utf-8?B?OWdFbzVrRG9Ob1gwYXdBdVhpdjBBbWNEOTFZMFFzK1ltV01RaDVoc3c2aWgv?=
 =?utf-8?B?Nkt6VnVKekx2a3lTdWRRV1NScmRybVowTHZ0STRHM293TEIrY2hzTHlWL0dy?=
 =?utf-8?B?VkZlSEswUmJ3UWY0UUdEWkVMWUpRVVVvMkV0cmJLMk91Uks1NnRqTFBLN2M3?=
 =?utf-8?B?dzZYQlIrbkthc3RtNEwzT2dOUDJEWUhodk91SjRRQml3emxVSVVScW1SU1Z0?=
 =?utf-8?B?ZUlkcFJlM0k1Z1ZVNEpZRWlBaUx0UklJU2c2QzlOdXp5SlEyYXUzc1E0NGpr?=
 =?utf-8?B?ZkRTdmIwYUpMaFk0a3R4M1ZLeVlKeU5Vc3FtSjl3ME01QmF4ZVNxRjRmaTQy?=
 =?utf-8?B?dlowR1dsdDQ3bnE2NXl0VmtuT0xZOEtmdWRSYlBUVW9tUDl1WVY3VlFJUExu?=
 =?utf-8?B?REtSTFo1K0Y4SktpZzRmajFqVnNlcXltNEhRK1IydWx3TzBCWE1pSnhFZklK?=
 =?utf-8?B?eUhadGFxSS9laWFtSGoyRlpoNllIVUdCTGJ2RXJySXl5UG0xR0VqdlcrMUJE?=
 =?utf-8?B?QUpnMzl1d29OOTdVd2xFOTVuWitvNi9tUE9acXAraXh1cGV1YnlMMzBNV2dL?=
 =?utf-8?B?Y2NYcWo5aTc3b3FNTnRVV3Z3K3NyNWRyWUVoSFR0UGhQNFZoc1VqKzZ3WSsv?=
 =?utf-8?B?djFBMXhuZk9mcTE1cUl1cFRFNWVDU2JtUnB3MEpNV2VkSTFSVXhtaEU1N3or?=
 =?utf-8?B?Z2t5WlBnRnZpcDZQZW5VZ0RiR1d3dmNxY09PbG9lYmVzeFBIT0pObmo5M00x?=
 =?utf-8?B?TWQ1S3JXVmpWRTRUYjZYTS9KTm5KdGRKRTc0NXBHRnFuSFJyU2Y4TUtTUXpX?=
 =?utf-8?B?Zzh0UHdxMVBKeVpJS2lTWHNybWJOdWVMQUtBdjZrbEtHcFVvNGovTC9Sbk9U?=
 =?utf-8?B?bU5yK29hZ1lBbE90bjBQWUJuandNYlpSUFl3ZlJXTGhYOUo1T2pSd1Z2SmJu?=
 =?utf-8?B?YTVNVThBdUE3ZzBxNkxPdkZzcVQ0bGNkYlJIbjEvME9FQ0ZsNFBPL3h6Vzhv?=
 =?utf-8?B?bkZEZVlNZzNBRkhBTWpkTGIzT3lQQ3lxY01NYnpXS0k0L1VONWozWkhxOGZ1?=
 =?utf-8?B?eTAwclRTSzR1Q3o1S3c5Zm00TXMxODZqNzE1UEg0Ync1QWxMVUVGcTJjeVht?=
 =?utf-8?B?Vk5XdVlwRGdzQS92QTNOd1FZOUVNbnJxYmtQQVhSZTVRKy9oOTgwMVVvWGJ4?=
 =?utf-8?Q?kqpInnPNK7IESbfVugko+Z5K/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd4f733b-f35b-456d-4e05-08dc338b5858
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2024 09:47:55.6978 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PaPv07ltJuf6AX9I/ARmaAfqXhY9ARc2Wc2HYy2skIcbYDJm5aFxZ8O8d7br5M6P
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8550
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

Am 22.02.24 um 08:34 schrieb Thomas Hellström:
> On Wed, 2024-02-21 at 11:26 +0100, Christian König wrote:
>> Am 21.02.24 um 08:33 schrieb Thomas Hellström:
>>> If caching mode change fails due to, for example, OOM we
>>> free the allocated pages in a two-step process. First the pages
>>> for which the caching change has already succeeded. Secondly
>>> the pages for which a caching change did not succeed.
>>>
>>> However the second step was incorrectly freeing the pages already
>>> freed in the first step.
>>>
>>> Fix.
>>>
>>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>> Fixes: 379989e7cbdc ("drm/ttm/pool: Fix ttm_pool_alloc error path")
>>> Cc: Christian König <christian.koenig@amd.com>
>>> Cc: Dave Airlie <airlied@redhat.com>
>>> Cc: Christian Koenig <christian.koenig@amd.com>
>>> Cc: Huang Rui <ray.huang@amd.com>
>>> Cc: dri-devel@lists.freedesktop.org
>>> Cc: <stable@vger.kernel.org> # v6.4+
>> You don't know how much time I've spend staring at this line to find
>> the
>> bug in it and haven't seen it. Got bug reports about that for month
>> as well.
>
> Yeah, sorry about that. We should probably have Kunit tests exercising
> OOM in the pool code involving WC pages.
>
> I'll push this to drm-misc-next.

drm-misc-fixes please! That needs to be backported ASAP.

Need to dig up the bug report for this again.

Thanks,
Christian.

>
> /Thomas
>
>> Reviewed-by: Christian König <christian.koenig@amd.com>
>>
>>> ---
>>>    drivers/gpu/drm/ttm/ttm_pool.c | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c
>>> b/drivers/gpu/drm/ttm/ttm_pool.c
>>> index b62f420a9f96..112438d965ff 100644
>>> --- a/drivers/gpu/drm/ttm/ttm_pool.c
>>> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
>>> @@ -387,7 +387,7 @@ static void ttm_pool_free_range(struct ttm_pool
>>> *pool, struct ttm_tt *tt,
>>>    				enum ttm_caching caching,
>>>    				pgoff_t start_page, pgoff_t
>>> end_page)
>>>    {
>>> -	struct page **pages = tt->pages;
>>> +	struct page **pages = &tt->pages[start_page];
>>>    	unsigned int order;
>>>    	pgoff_t i, nr;
>>>    

