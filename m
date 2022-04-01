Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A984EE9AC
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 10:21:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE7F51120B3;
	Fri,  1 Apr 2022 08:21:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2085.outbound.protection.outlook.com [40.107.93.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 232231120B3
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Apr 2022 08:21:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lE87Pz0bZcbRDSz4YAZpLDbzPFDRAECCCzhVwEXqGHa2qc3CjMyeGfQWx/CIFdog98yeGHhMmaKj7oMPvju9yVe44Lxae26EQm/yxUKPjVGlw53zFrC+R7CQEvcGpDziCHuG3Y9PUJmfDCX81j8csFBfd1/DS5VL4E7Cfmme9sSbPOR/uXOX8Nf9bzrRAMnGFpIM3zlXVwnXM7qmfSJ+qUAgapC5CnKVm0nguwQQFQvg+DnCOVLDyq8oJq6EfnGXgRIJoD2plady44+aQ4VImPDryvEzVwswwk1YJKlvQBM49ANspT9visB8xSYY2yoMOaUsUyNk8TVqs3c2enhOGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k9kpWoMW3TFUyQLFCtdck8SS+8uFyXeFjtNrVNPIuO8=;
 b=JiADHfRvXUHgfwH6uvfa8y/y6U2zqZL3XIQMvUdHJ6rTNkebLLtOZsWTuPPTgsWMJuocvRjColZ51rODNIVpO1yci5QGIyetfFwQ4lPfkDxvW2TO4w2Md1GVgPir9NRyCKgsUN5n9gMmxacZi3x+ucD2bW4MA3Ztl01URBGxVBBGosuvRVuUsMkw63GUBYqZuyoo0MyiNN4GjLavyrqvD61Jm6TRNXGzvZCfB9b6n92vOu7sGT+02SiIrJXJGGsbuQLnJHU80coa8sWOSY3IYLv3VHJLITz/GKt70ktCl9C1ikbdtowKXUIEFz4KM5EM848pSbtwiao3ej3IlcuXDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k9kpWoMW3TFUyQLFCtdck8SS+8uFyXeFjtNrVNPIuO8=;
 b=aIPOTOXSM5jHRh6c8dBk0QBP3ipHlJBJOQwLDnu7hS19JwfOcqOgZgQWRol8ZqBwHB+ezY9+Zj7/vz9n+bexxi9/zTfNbzWVptZMjDUtMF9DIapzX93c0HHS9+IllURsFqUS+ODmZQfCxqHWaOfSbgv0FT5OsvtYJkmFm1r2ONA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BL0PR12MB5524.namprd12.prod.outlook.com (2603:10b6:208:1cd::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.26; Fri, 1 Apr
 2022 08:21:29 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185%6]) with mapi id 15.20.5102.023; Fri, 1 Apr 2022
 08:21:29 +0000
Message-ID: <8e12de76-5206-81f8-0b8e-1c31865a7633@amd.com>
Date: Fri, 1 Apr 2022 10:21:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 03/23] dma-buf: add dma_resv_get_singleton v2
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org
References: <20220321135856.1331-1-christian.koenig@amd.com>
 <20220321135856.1331-3-christian.koenig@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220321135856.1331-3-christian.koenig@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6P194CA0073.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:8f::14) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 41db64ed-7a68-4c8f-2e2e-08da13b89eea
X-MS-TrafficTypeDiagnostic: BL0PR12MB5524:EE_
X-Microsoft-Antispam-PRVS: <BL0PR12MB552438944069C33DF9008E2F83E09@BL0PR12MB5524.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iL/MKYnhWwyI0jDNV6HskctihVhy4l60Imeol2liWMlQKIOxj+z5T2o6HSPIzKHYbW7In+qlZ80XFskveZnmvCaC0YpPJI/u5fpevVeYrpIZiL35/mdvINbaTE0Mzb0S40nyJBwMq8rl/vY+/6eRai/OCuu7+wnkAhsL5y7DdYuUNz6BbHsu6S8jFNpe8fH1FJZY+bzQ17VLaSFi3ssrnw2cIP08XjxOGJqdeKTZvcB0cn0Z9U29CPcSw24wGStJ/eqoPGXgfE7pCDs8b8mjjOKvLCvZStJ9iwaWQlGCNYxHhDUd1CJ13kGF3aazA5w9kRH67sL024oqBrtaOyBpJhZ8cIqbN7Uxv6b1/fhkwrQ1ACZ5Alhg1mSw0nFval4EDiaP6ww7ERpfocJNUukLISILxwe2XBcp2MYsAtWBQ4Nsd0qwqaDqdL10WLhKGaJ+tTLo2l8P0LkQeefQnmXAOjXZaozrldEqDM7/58WRPLvmQbIVg1Labm9mxJsw4sH3xVwweA02asqvJ3rEzxz0nIgAUVyEYkORz6hYraznIe9pxGu/vcbEenm3cKt3zW3oqFQ1AfR1b1jhjDwklxAq8i+3zZ5S+XXJ1ihlJtjKqGJp/JuoWCfHI/cjIDDJ24XH08TMxzOPetieKhIF0MKgUUHdgeG6msV4oPZXo/d5DR/Htok68+nZt7SV2Y+ug86jErTdDPRK/IoVLyZsZJAqatn/bejfSBKhQjqAk//ciChiyAf8BPXw0KPfNuYhtEcG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6512007)(2906002)(31696002)(6666004)(316002)(83380400001)(508600001)(5660300002)(66556008)(8676002)(66946007)(66476007)(8936002)(6486002)(6506007)(86362001)(26005)(186003)(36756003)(31686004)(38100700002)(66574015)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Skh1dWxkMytDY2k3Y3cvYVFoTVpJNVVLTWJWVGx1RmVTTjZNQUsyNytraEZk?=
 =?utf-8?B?aHRYOExXaXJoY0graExad3BxUUNERGFjTklabWVlUjFNYVRhUVd0c1o1U2VJ?=
 =?utf-8?B?blhmbGpLdW9IUloxc2diL0tJaENRQ2ZWZEpjd2gwcTdXdktLWUlyS054Uzli?=
 =?utf-8?B?VDZ4aWZOb2VhTEd0azUrUnlZR09PSkVZVTNuTlJzZmtsbm9iaHBNMjl2YjBr?=
 =?utf-8?B?SHlZN3l3OUNiT28vMXVoT2oyVVEyT1ViRDNlU2FvbUdyWnNwa0ljTGIxWGE0?=
 =?utf-8?B?RkVJVnEvZWZxbVhKQ3BCUHlFMDVkUmxIa0xrQ29TaHZ4ODFHRmxyOWZmbnNV?=
 =?utf-8?B?N2dzTThwalRDeDR1SVFvWHpqaG1ZMU1nRXFLajF4eWRtYnM1b1NtNzUweTVF?=
 =?utf-8?B?blVPQTRlN3pZbCtKOVFraEtKRjZQbS9BZlk2MmEwbTZyajgxU203U1NhSVpD?=
 =?utf-8?B?Wk5yZUxlWGc1WHovT0ViL29CM21QRUd3aU9GcjFFTWRHU3hXREpSVGZKUk9P?=
 =?utf-8?B?bkpvV3J0QmxNNUphOGphWThTTjVHd0hoQWFVVThSZ1lweDFvVWpYMWFHM0tW?=
 =?utf-8?B?M1kyNzZoR2dXS1pxdFVmR2tibDVRZjNVL0cwWDQvTFZvd3FnUlgvcGdUVG95?=
 =?utf-8?B?RDArdU11dkRMYmFQeFlQWHRyQnU5UUdWYmhkc2JBcit5dzlWcDloNHJaNWEr?=
 =?utf-8?B?bnJvNGFuN1A4d1d2QlMvZy9SM0padisvU24xS1laY0RoalVmMlBwWWZTWGtR?=
 =?utf-8?B?bm5pZTRnWkoxM3BzVjVHWlFXOEpKVVp3NWNmc1RtTnJqMGRDK2x2clY0aW4v?=
 =?utf-8?B?amxocFBUUjZHeDFheGx1K2ZlUHo3SmdTdkwxTHlVb2pPYTZaZXVIZ2cvTnZ6?=
 =?utf-8?B?VDVJT01yTlNJN1paUllsc2g3MWRmVXp1YmYxNUoxUnhmUUJHSmpoZW1nanRp?=
 =?utf-8?B?QjhCTWdCSk54Q1Nva291YmdaOUl0MnJmU09KUnBzcC9GRDFEMjlsamN6ODNK?=
 =?utf-8?B?OXBKeHZiWW4wc3c3QW96Yy9lbEpoQzJiUTRMendPYUxIb25QUUlLVWZBTXNC?=
 =?utf-8?B?Y1E0WVVDME81eWxOS25nL1NGWjBNU0N1NXRwL3JvM2ZVbE02SUZOSmZveE45?=
 =?utf-8?B?bU9KQklaRUZTSjRGK2pPNURRQlFEMzV0WG9wNlUralI4RFVIK2Ntd3czSThk?=
 =?utf-8?B?MXhQMFo5OGw2aFRuSWQ5TGQ3WHp1aUh4azlRUThMeXlpeHRzYUw4UWlVOFRx?=
 =?utf-8?B?RkRRWm9hSHpxTDRPMjhWcFdFdDdhclRFalpRcFUvRXpscDBPL0V1d0xYVldl?=
 =?utf-8?B?OHpjYkNqNGVJSm1tcXp0S1F6dnpneDh3TGpxTmpzLytkMS9ZTmhGR1VSZUN1?=
 =?utf-8?B?YlJBMHJ2TldMRWZMOENnMnFycGpvVlZwS1p6VVB4TWRkWStnR3V0dXlidlVL?=
 =?utf-8?B?VWNNeDNXb3ZVQlUwUUI0djRadXBoaTJhNTg4WmVvU2hvTHFxREl5SlZ6U2Yx?=
 =?utf-8?B?MkNLWUk4Vlp2M0RROGpXcEp0aE11UEN5cmNRM3RFMDYyS05VWnFtcjlDM1c5?=
 =?utf-8?B?NjRsUlozbHZ3ajY3Rkx1eWQxbUxUQnJCUGlWNXRTVHorUFFSVnRuMkh0cjJJ?=
 =?utf-8?B?MDRDOS8wRU1IMzlFdGg1QjRCYkF5eFVuZUVwMUlza3B0MlVSZCtrTmtlVCtV?=
 =?utf-8?B?amYwOGZPSE9WZjQ2V01LUnh3alpBeUtPYm1yNUxLbWw3eVYwQnUzWjRNNFpr?=
 =?utf-8?B?dmtHY1ZYNlJPbUpwUFVRSks2b05PemxBV2ExTmNhRHdxTmdiUHJzQmhZNnBK?=
 =?utf-8?B?NmNkKzJZVWZ1bXRyUmhudFBqWUZxbVhPNkxlUjlWcXRpQWRtZjZsYnBoNmNR?=
 =?utf-8?B?WTRFNkxldzhNNHhsNGdEei9TdHJNVnNmR0ovWW5tUEJzTTBKempSWHJPT0lB?=
 =?utf-8?B?enltUWZJTSt2NlJ2dkR6UlM2THpDWHVKZGNVQVFyN21nN2xnZnJsRFJSalBz?=
 =?utf-8?B?WU5sVC9oSGNHbEw0WW4za3JjUXJyNEFNZ2ErWVcrTTdnaEZQRGFZVDVMZ3Qz?=
 =?utf-8?B?c3gyUm5SU09xUHlzUCtHRnA1cjVPMVJlQTE0NGdWcGRmeUNoR0xRSVRFRUds?=
 =?utf-8?B?Qmw5clQ1QWpnOEpXMU0yQjVyOWN3R0JZQnlPbld1ckVoVERxYlZCeTl5Mkw4?=
 =?utf-8?B?c0dzTEJJVkQzeWEwV1RWWEphME9jWGhscUJNdEZrUytpL1hhenJXYWkxY29v?=
 =?utf-8?B?Rm5ONHFQemhqRzkxdVNWVmw4QTNjNGRMdGF3U0tuVjlzRUNndytyTkhVZk9T?=
 =?utf-8?B?UUJoc1NpTWJoOExrNDhOTHlCYmpDM2RLT21FVktQckh0TnFZQVczQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41db64ed-7a68-4c8f-2e2e-08da13b89eea
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2022 08:21:29.0060 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zmjZ80YCWQS72/Fyyx6nacvwvDuEBBje0d4kFhdZp9ClPdTrJv/+EWG5W8ydN226
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB5524
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

Daniel any more comments on this one here?

It's the prerequisite to a bunch of other patches and I would like to 
get it out of my feet.

Thanks,
Christian.

Am 21.03.22 um 14:58 schrieb Christian König:
> Add a function to simplify getting a single fence for all the fences in
> the dma_resv object.
>
> v2: fix ref leak in error handling
>
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/dma-buf/dma-resv.c | 52 ++++++++++++++++++++++++++++++++++++++
>   include/linux/dma-resv.h   |  2 ++
>   2 files changed, 54 insertions(+)
>
> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> index 5001e9b4420a..c09fd8da0c85 100644
> --- a/drivers/dma-buf/dma-resv.c
> +++ b/drivers/dma-buf/dma-resv.c
> @@ -34,6 +34,7 @@
>    */
>   
>   #include <linux/dma-resv.h>
> +#include <linux/dma-fence-array.h>
>   #include <linux/export.h>
>   #include <linux/mm.h>
>   #include <linux/sched/mm.h>
> @@ -650,6 +651,57 @@ int dma_resv_get_fences(struct dma_resv *obj, bool write,
>   }
>   EXPORT_SYMBOL_GPL(dma_resv_get_fences);
>   
> +/**
> + * dma_resv_get_singleton - Get a single fence for all the fences
> + * @obj: the reservation object
> + * @write: true if we should return all fences
> + * @fence: the resulting fence
> + *
> + * Get a single fence representing all the fences inside the resv object.
> + * Returns either 0 for success or -ENOMEM.
> + *
> + * Warning: This can't be used like this when adding the fence back to the resv
> + * object since that can lead to stack corruption when finalizing the
> + * dma_fence_array.
> + */
> +int dma_resv_get_singleton(struct dma_resv *obj, bool write,
> +			   struct dma_fence **fence)
> +{
> +	struct dma_fence_array *array;
> +	struct dma_fence **fences;
> +	unsigned count;
> +	int r;
> +
> +	r = dma_resv_get_fences(obj, write, &count, &fences);
> +        if (r)
> +		return r;
> +
> +	if (count == 0) {
> +		*fence = NULL;
> +		return 0;
> +	}
> +
> +	if (count == 1) {
> +		*fence = fences[0];
> +		kfree(fences);
> +		return 0;
> +	}
> +
> +	array = dma_fence_array_create(count, fences,
> +				       dma_fence_context_alloc(1),
> +				       1, false);
> +	if (!array) {
> +		while (count--)
> +			dma_fence_put(fences[count]);
> +		kfree(fences);
> +		return -ENOMEM;
> +	}
> +
> +	*fence = &array->base;
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(dma_resv_get_singleton);
> +
>   /**
>    * dma_resv_wait_timeout - Wait on reservation's objects
>    * shared and/or exclusive fences.
> diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
> index 202cc65d0621..08512c1e215d 100644
> --- a/include/linux/dma-resv.h
> +++ b/include/linux/dma-resv.h
> @@ -449,6 +449,8 @@ void dma_resv_replace_fences(struct dma_resv *obj, uint64_t context,
>   void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence);
>   int dma_resv_get_fences(struct dma_resv *obj, bool write,
>   			unsigned int *num_fences, struct dma_fence ***fences);
> +int dma_resv_get_singleton(struct dma_resv *obj, bool write,
> +			   struct dma_fence **fence);
>   int dma_resv_copy_fences(struct dma_resv *dst, struct dma_resv *src);
>   long dma_resv_wait_timeout(struct dma_resv *obj, bool wait_all, bool intr,
>   			   unsigned long timeout);

