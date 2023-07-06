Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A52C8749580
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jul 2023 08:21:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F6BE10E424;
	Thu,  6 Jul 2023 06:21:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2042.outbound.protection.outlook.com [40.107.220.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1752510E424
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jul 2023 06:21:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZHyzHmNe+RL1aDzqJH9jzsOpJ26q3T3vwy+ij8O+gvcPYPD5PTbJe58oeJBP6NNBioCPXR9a+59GYdjaJ5Gm/QLNqus62ZOi2qLR8R7f1Kl1XH2/GpT2YYt8WVBub9UjmldQCAMzjB84XVCNUnuk9hHJn4UfjCK9r0qMTZN9sxS816FpTPDmScIyX0pDmUAu72P4v+L/txXvQVtETFiF9rY3vmneTtN+TGcACRsPXYFu7K7+1S8KryD6/tsnwsBsoJZ6AoBcdzxjqMlxMBIWeunJXcHxrQJTQnl0VbbjlSO8/wsjC9vSOSG4NAF13uoVejfJ/3ZBkNskX0a0vzG/dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2gFAs2G7JGVGe6ritccugPKsDG6VZ1BAikQ3ax9oZ8M=;
 b=IxSPc1aKs8SZQ6cPh502w3lcdIgUvM19JsxxsQxVkGNJER6juE6lPlsJkYvGJQtO7GPDK2w97p30dit9zew7+VsXoXnZp53t+8PIma4XNKvxlIVtNHiLqN2RH+ewois3wLS7hg6PlZnLt2Ta9QvfinD0hLs01cbDAiwePaq3tGqDYF9X/2qrH/hbh3f2tJRiMA47bLLLZpECFlDXNo8vd6DqBcoNSW68dk+MO/W97wQENolxkrtz9YMcAmxjyWtSR+/3lFdqeUHVAwoctfwHa4dyoCWjNBZuomL+hVANfrcf4fXuqWZ1d02d6SkcyTBp1vTJaGvXku0CSR4B3iaIlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2gFAs2G7JGVGe6ritccugPKsDG6VZ1BAikQ3ax9oZ8M=;
 b=X9xUDHQCX9s/iB2ry+i1ulf3czom9S+xyAMSSqjpOMx9r9OiT9MvaNCkhQSX1PXpj7XIi+sGhEigSq09oi1+tJav1+iiZdel2ZEgC/0oz1iOE57LVHkLFLeIaIvhfwpejESmlARObiqXRX1d9fItjn9uW2CYqcaIBE7WqOeUmAo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SJ1PR12MB6314.namprd12.prod.outlook.com (2603:10b6:a03:457::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Thu, 6 Jul
 2023 06:21:40 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::384a:95a4:8819:ee84]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::384a:95a4:8819:ee84%7]) with mapi id 15.20.6565.016; Thu, 6 Jul 2023
 06:21:40 +0000
Message-ID: <0f52b97d-0a67-3795-c9d7-3eaac9003aa8@amd.com>
Date: Thu, 6 Jul 2023 08:21:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] dma-buf: fix an error pointer vs NULL bug
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@linaro.org>
References: <694691bf-f591-4286-a615-df91d2ebab93@moroto.mountain>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <694691bf-f591-4286-a615-df91d2ebab93@moroto.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0085.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::9) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SJ1PR12MB6314:EE_
X-MS-Office365-Filtering-Correlation-Id: b7e1289d-2e40-4f4c-bba8-08db7de941f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aLKA57bVm7o40fzSg+Cb7a109AkB7McA9LJ/g1uvrp69Zi4DHckWdM90q/cewdjlT5lSMbCvf3tQqUZYJHVg+yCYO/B6vYTzaIsOkmGSHQJaT7DEOU1/OwBnjre1m2WIzC71nj3M519LPi0HwZhCn8SXWiZ48gia3iwHFLEUih9KdjB7/JJpFtEMiJmRZOf0mc1LsfCYeTM005SBy0A7YDnZ4PWh0ZX29cDwQ3y6R2wyBzkqn77yvzBfxOk7yKovW9kkDajqr5gNR+IQtgxyboqlDOsNBOiHOnHitzAYauN5AaTZmjGzVx4akMOuV+YQJHht9OaJ9YSRmIsf57kOH7jnc+saGLLr0XjG0RXRoGCGv2N16mhtogEFIv+W+/O511X9qysMFHinAt8vUP0LoxQyZFGNMATfkC79nmlDqtC766q7j3TUdiGMvVjQRjylv4/8UqGkjHk5ohe26DPa8BM0Oln/McE6HdKHJLaVSCkrJrFTc3wZNIEP9pdkq5hq1ksT91bLV1CoH+gJPC+PC5LXgfqZODz9YcGj+gJhD3ne75VoYfWfWY9yP+/dMJyz7jAm+mEvsUNctJ3wLHABr8kGrTcbwmlsOATvNr10Hf3diIhEEqNX3j0ql+Jv87DSnUu5lk+82CvRlUvnUNmQ+Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(396003)(366004)(346002)(39860400002)(376002)(451199021)(186003)(31686004)(66556008)(6916009)(66946007)(4326008)(316002)(478600001)(66476007)(36756003)(8676002)(8936002)(5660300002)(2906002)(86362001)(41300700001)(31696002)(6486002)(6512007)(54906003)(6666004)(38100700002)(6506007)(2616005)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d29TMEZXV0VWa0w4MlhYd2tNbUdBeWgxMC9zMXB5eFFVYytIaG5ha0N3TnpI?=
 =?utf-8?B?UWtIcGdUVWlqRDgyOWhxQmZGRFNrQ0pFNkFEWmh1eTNFYURlQ1gzWUxHV2ZS?=
 =?utf-8?B?SnBKMU1qMlBOVSticDQ5M3dnRHY0U2haU0Y3NTNLZkNoQTQwa0RBdDlHaUQ4?=
 =?utf-8?B?cmhjVHI0V0lrTjRhbXVteTdZUmtaNllZaTMzRFRGMVk2VFNuRVpZcjdkWE9H?=
 =?utf-8?B?a3g5RjZmeDBIOW9xa20ydDg2ZFpac1hEaGlydHZlcElhb0hHRnZJNWtWWGFG?=
 =?utf-8?B?UFVYUm00U0hVcEh2ZmFwKzIxZitFV2pTc1l0eEFzbks3S3lYcFB4VzdjWDlm?=
 =?utf-8?B?QW9UKzcwL3Q1bDdYTXJ3VTZZM2JqS055VFNLaFVoeWFkSWd2MElZcVg3aTBp?=
 =?utf-8?B?UVIvUUpHWXRjRXRWZjBYRlUvRWZtOG9PeC9YajBnbVRld2VreHFUeTFyUHRk?=
 =?utf-8?B?RmZaTUZjNXlEUG9Yb0V2dkZkV2Y1T0dwRjBLeERQd2FpQzdGY2hIVE9uS1NB?=
 =?utf-8?B?dzMrN1k5NHpzYlArakw0MkVLcmprc2MyUjkzbGVBUVI0ckcrUkJDNEJxa2Ew?=
 =?utf-8?B?VWdQb3ZVOTFLU1lRY28rUWxRcmQzV0RDMWJNMHBJYlRBL3Y5SFRwZVZCOTVy?=
 =?utf-8?B?eVVzWkNRd1paeGpvQkFTMTUyTUdiNmF2bHRnWll1WDlkSTJFcWNicTdEdkta?=
 =?utf-8?B?Tk1QczJYVWdKYlU1dWNGdXR6MnhhUlpWdWtzU0RYWDEwWTE5S1hRUzQ5c0Ex?=
 =?utf-8?B?UmV1WC9ieDB4RzY5RjVXanJveE1WRE0vQWY0QSt6YVZIelk0WmRhcmd4SFEw?=
 =?utf-8?B?MUw4S2lWM1FZOXY2WVJKdVlISEk0Y2txc3YySUZGdE42SlZtcHZic0hna3hJ?=
 =?utf-8?B?NUhLbkthclUrdmdpclIxZkVTR0FwQmtCWktNREwyR0J1cU1UN1IveHNGVGJI?=
 =?utf-8?B?cGlkTnNOdis0aXlBRXMvOHVidVIxSHR1bHlydnVrcUdDV1IvUHJqRVFmeHBK?=
 =?utf-8?B?SmkxM2xYK0wzNkVDRVN5S0RRZHc1bkx0WlZ3RlJaZnNpczhqa20wT1NwV0Vu?=
 =?utf-8?B?cVlXUEQ0dmNleGlFanZOV1ZYblJLWEtqbmd3bDF1YnRHTWxHMXNhN0hwQzk1?=
 =?utf-8?B?OHFpcGxPTnFXeDlBNk9IZDVsZ1FxeEpNOWtFbjJHdU9PMWpSY2dMWThxRUhV?=
 =?utf-8?B?REZVY2g3S2tYcjk3V3kyT0lmNXMybGIzaEF3UEZMZ3Z6amFBTFdDYTRka28y?=
 =?utf-8?B?RUxvY3FFRHE5NUFoWGRwQjNNV3JFaEFxeFZqWWJWTkljZjN1MUt3SkVaS1dO?=
 =?utf-8?B?NUE2d29xSjhZcGJLcDFPMEdyTDREM242ZWRRelJpRGNLcWkrNnozSHFLdHEv?=
 =?utf-8?B?YkIwbGh2dnB5cmlqcVUwSnRBbkNWK0w5UnJ0eGFQOEYyYXE1czRyMFp1SlF2?=
 =?utf-8?B?cnVtay9qblhPYURtMGsveXhGeTgxdXVLbFBmWEFoV2JNWFRHM1VpampnYmhl?=
 =?utf-8?B?UGZHcE5Veit6MWNiRWUrTEtkSTZlUjF0U2gxNVM1cnhTYlIwTWZoNEtPU1FK?=
 =?utf-8?B?SjA3aThkcTdUaGN0QkRZb2UzVHhSVytJYmJIazN4L3Q5ZkwyVzJINGRWVzF4?=
 =?utf-8?B?cm5hRFNuQXVYNEl5dFZ3enlNRUhPeFRZcHYvaC9HbmpjeVgybFhIVGtnTVls?=
 =?utf-8?B?NXRsSVJKZUhScCtQS1lsVHRnd3NJWEdRVW1VMUVoQWZGVU9vVlZKa2JmNUFI?=
 =?utf-8?B?b1BDaDg0NFBqckFMRW85bW8zVDNCOHBwMi9HL1gyTVc1OEZIZ0QvVVU5M3pM?=
 =?utf-8?B?OS9wRFVFMGdLYzlZd1dUVEhUZE1PSUNyaUg2WU5jSXpLaTE2Q3hhZ1Erb01t?=
 =?utf-8?B?Q1VGU1cvcjJDOENYc29lOWtZWFlNN1NRUWVTSXNobHRFYTRYMUtiUG0ybWdL?=
 =?utf-8?B?aG9lMVU2YkxGdmRYeklMeUlOSDc4TW1jUTVYMm5RTWtPTW5YL0U2dmRQT1Na?=
 =?utf-8?B?cTdJVElPU3doQ0lWclZFVy9FUjVDREVjZ1BaNVdRckhSN01laEV3bU5rQmZP?=
 =?utf-8?B?bkVIcEc2SVp5Vmw2ZlhETW5IbzRVdkJPQ0x6Q3ZmY05kclpvNlZkMjR4aVE2?=
 =?utf-8?B?R29NZGtrODBzOVhncXpXMVpYV21mWFE4aEVlRUxUaEQ3cmxVNFdKWXp0dm9z?=
 =?utf-8?Q?nZfiUeYDpajVIVaRa/m7u8PviCVKnIMXnhBE5G2OvmE/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7e1289d-2e40-4f4c-bba8-08db7de941f4
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2023 06:21:39.3618 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uu0RwhapLOOXWL+SJUL/DscZes5mKDV9i5v3/U1ajaRhoQaNWoksDm0wxaH9+ad3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6314
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
Cc: Gustavo Padovan <gustavo@padovan.org>, kernel-janitors@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Luben Tuikov <luben.tuikov@amd.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 06.07.23 um 07:52 schrieb Dan Carpenter:
> The __dma_fence_unwrap_merge() function is supposed to return NULL on
> error.  But the dma_fence_allocate_private_stub() returns error pointers
> so check for that and covert the error pointers to NULL returns.
> Otherwise, the callers do not expect error pointers and it leads to an
> Oops.

Oh, good catch.

But I think we should probably change dma_fence_allocate_private_stub() 
instead, that this function returns an ERR_PTR doesn't seem to make to 
much sense.

Christian.

>
> Fixes: f781f661e8c9 ("dma-buf: keep the signaling time of merged fences v3")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>   drivers/dma-buf/dma-fence-unwrap.c | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-fence-unwrap.c b/drivers/dma-buf/dma-fence-unwrap.c
> index c625bb2b5d56..d183eda0db89 100644
> --- a/drivers/dma-buf/dma-fence-unwrap.c
> +++ b/drivers/dma-buf/dma-fence-unwrap.c
> @@ -94,8 +94,12 @@ struct dma_fence *__dma_fence_unwrap_merge(unsigned int num_fences,
>   	 * If we couldn't find a pending fence just return a private signaled
>   	 * fence with the timestamp of the last signaled one.
>   	 */
> -	if (count == 0)
> -		return dma_fence_allocate_private_stub(timestamp);
> +	if (count == 0) {
> +		tmp = dma_fence_allocate_private_stub(timestamp);
> +		if (IS_ERR(tmp))
> +			return NULL;
> +		return tmp;
> +	}
>   
>   	array = kmalloc_array(count, sizeof(*array), GFP_KERNEL);
>   	if (!array)
> @@ -176,6 +180,8 @@ struct dma_fence *__dma_fence_unwrap_merge(unsigned int num_fences,
>   
>   return_tmp:
>   	kfree(array);
> +	if (IS_ERR(tmp))
> +		return NULL;
>   	return tmp;
>   }
>   EXPORT_SYMBOL_GPL(__dma_fence_unwrap_merge);

