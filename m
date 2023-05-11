Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 120596FFBB4
	for <lists+dri-devel@lfdr.de>; Thu, 11 May 2023 23:12:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0565710E0EE;
	Thu, 11 May 2023 21:12:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2085.outbound.protection.outlook.com [40.107.244.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28E0E10E0EE;
 Thu, 11 May 2023 21:12:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ftDymdC01hrv4NPo45OfW9ZI4/qpuFtf1w+94NMovgEd1300yY1edMV4GV6CPYD7kTEf202aekFjqBVOEOEQoAdwhtcb4GkTDP7BOLwOwkrcc7MvcrsxrlEiySAL7kThBHtDZ19fGkNk6c6I8i7gkYvp6yH1xgJcCRaapsUdMvGZvDnjxjEI1EvAFAG83B7c+NtkOPR3Ph2wXD7rQeGwEMAcmnMmK+uGhhg75PbJaZK0uw6B8j7h3fTGJdB1U0+O8rnmH3PrDi/ebNCGMTA2dxCj3qsnlSqAXGcnjqsJpunV/O7pD1VR462nA9nkhuj1MRv9q6h8Z2tfO536NNgLdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lJG/Z9yl1w5kC1ssgM2AIsWhjArdmjCJZAqKELPmNiY=;
 b=SWkbD0UMU0W7dUYJTjuzpCnTCfhIToxCS29YRVz8FdBqeH0/+sZ6nIJhLVgbBZxhV+ETi6/RvzYx9BZuxaGJqCzqVgSyv0J3HWWa3grSGIvW12+5slN3UUsKNWkdAWNSNVlbmtKKh3/oHzEggFGuTUWG/6I+vgPrBcybOX7hVV4PkVBJSau2UR+F7PlQq3Z91ZIYVCe6k6OYJwxbY5BqAxe8CeHuf8UqUak4Z2HFi9I7iI1g4ebBFkb0Yp0/ScEu36dqy8olrQEP+Lq77WkpJuO0whaxYByHNGo5Vt1nGQG0Mz0xsKKuiz/SzdUp3t5Iorl1nga9o/Kdwu62QnosAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lJG/Z9yl1w5kC1ssgM2AIsWhjArdmjCJZAqKELPmNiY=;
 b=Z97WpyOF2Ncr9QMD6q3NPL/4JBPbcyeLXACYsFKNagDx8LCf8IE3XXgXOykGFfmtG16+ENdFpaCnSVXfnj64jjn0b+jvp6l8sYPcyops74NyXzXWXnPREMT1BGKzs384mT8NE5eolJ4jfPsFQN2Atpu/Qsh9GLk94FTQDwbYJws=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by SA0PR12MB4479.namprd12.prod.outlook.com (2603:10b6:806:95::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.18; Thu, 11 May
 2023 21:12:45 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::f170:8d72:ca64:bb26]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::f170:8d72:ca64:bb26%7]) with mapi id 15.20.6387.022; Thu, 11 May 2023
 21:12:45 +0000
Message-ID: <1435aa84-c45c-43ca-eac9-d9f85ebcf224@amd.com>
Date: Thu, 11 May 2023 17:12:43 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2] drm/amdkfd: Fix potential deallocation of previously
 deallocated memory.
Content-Language: en-US
To: Daniil Dulov <d.dulov@aladdin.ru>
References: <20230511112314.29322-1-d.dulov@aladdin.ru>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <20230511112314.29322-1-d.dulov@aladdin.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR01CA0130.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:1::30) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|SA0PR12MB4479:EE_
X-MS-Office365-Filtering-Correlation-Id: 9dce1869-c8b5-4b90-cfdb-08db52647720
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KRIEyLpyd7yt66u42QJC45VgkiAHRsIp9txts/5W8WUDjXgf6WXMNh2GBCAMFVObJXI7aKISFwkhJgBZyxeD5f+pBee8YV4mlcADSrOVC2VQ4g+mxA2pqO3Fv7YPNRJkCL31ReqqI6MW1ZnJ5LH5wnGGX1wBpNI9A2M1c3LrnEjCKpvmbwRS0qbdN1hApzibyxT41TJZsbtrFFX6MSMT7rSI0BJaHZr3ifSOvasR5SU8EshU9hhtYtawhuwZP3pXyzIHl0veApPoZ+4MsOZ41nBtlS5pA7EToR6CP4zHzNjaUDGDk2URa+zn+XGJ19WrMhO6UppRhQLJZ9wtH3UtXXdemcbbNV7AW6jgJSc2FzhbO7JffSJdPBZbU9WB/Vr/nrXeoMTxiAUj1v7KbwlTQor18wRH5cXQJQCD9Q6ZU03CgQDvfm+mRl5KwxMHVOTguFa0wocu6Qe/YVdwsUmmYI4DpQQ/xx1Yjf0/T9P2fLqo1/CPaUaUPGQohE8HXtD5oIB7w/xpXPUwF9CabBECoRKs8JJQHV4brBnPdphKCNlOHvWvbA5g572IqRCHKp0SRyLypOgMLHTpyn63qGQ+akf/9iQv1YjfCrgofUZxMmDUiLe22myh+2Eot9H91eBzgC98yTnG6nsQjoe0/+Gz7Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(366004)(346002)(376002)(396003)(39860400002)(451199021)(31696002)(478600001)(66476007)(36916002)(44832011)(316002)(86362001)(41300700001)(54906003)(31686004)(66946007)(66556008)(4326008)(6916009)(83380400001)(66899021)(38100700002)(2616005)(8936002)(186003)(8676002)(6512007)(6506007)(5660300002)(36756003)(53546011)(2906002)(26005)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YXhzUXE0MWltaTVnRURxZFlqa2t1clZRcHlNY2paTTZKbVdQcE0zeDJCRWwv?=
 =?utf-8?B?aEU0bmZ5RTM2NFE1Z0g3cjVEeXFVOGRSY3ZicUhKUEZMMVhhNzEwYnRwd3hl?=
 =?utf-8?B?UHo0OFVaRXNRQlBLRWViTHN1Nms5bVNlZVJRMGUxd2Q5Ym5RR3dtb3BpTk81?=
 =?utf-8?B?QmhxQnhWbjNkQXMyMlk3cUdSM0FFTHdSQWpIcFZ6R2tpTjJaeVZ5Nm52OCtH?=
 =?utf-8?B?Rm1iMmgyTGVtbmFFejhycnpNZFNaR0tiQnZCak9BUi9SRE5KQTFoYnFsdUNG?=
 =?utf-8?B?a2VteEdFZzZlQ1R4b0R2WWRTZUFCL05iWVd0NklRVXFtSWw5YStYU0R2Y2th?=
 =?utf-8?B?b2NZdWorazZjYk80YitPaTJpRlRzZnU2Vk5PYmp3WmxHWWl6RE1NTUFwSDMz?=
 =?utf-8?B?UU0vTTVyWFYweU9OMlhsRFVzeWp3ZHlPUDVWaVJITHU1YzVONkVWUUJiUVdw?=
 =?utf-8?B?MFgzSm8xTVp1KytKUXdPKzZFZUhINlpkUk40SE5BMGFHWEJBL3ErdFV2d0Nl?=
 =?utf-8?B?N3NnTmE4Z082T0dyWEdndkRnazJxNS9KalJYeGhUOHgzWnR5TnV3K0xxUktH?=
 =?utf-8?B?NVFJS3c3Uis5NzBtN09HTUxhbE9KajAyZ1IyV04zQ1ZxQWlMQXF5T2pYYUVv?=
 =?utf-8?B?T2ltU0R1ZlhETk5KV0xwcCtwbVM3LzlVODNFbkdDcTRyUGlzbWE3Y09haVBx?=
 =?utf-8?B?Nm1BS0RHY0cyYWdnRDBITFJHTGpjMjk5dWMybGdzZ2x6Qm1xN1VRVTRDWHQ0?=
 =?utf-8?B?MVhLSjFYMER6UUpudG1rVnBlbDU0U3VVODNoZFFad01GZnoyL0ZVeUNYMTlw?=
 =?utf-8?B?d1BrUERMc3Mraml3SmJzaXZRa3J3bjdBODVUSVZ0Qmg5VDhETWYrY3l0Wnl3?=
 =?utf-8?B?NUZPWG42NmVraWpaL2MzUmFHYm5KMWt2VmNWZngyaDFWcFI4YW5IaUtUMUk5?=
 =?utf-8?B?WWVhQlh1emdUSDd5ck1nQm40cjY3NC9oL3d2N0dScjlIczBQeG1tREJwMzEv?=
 =?utf-8?B?VFR5OHRmcGpOR24xZUlCNVg5Tm1hell4RFlQZk1UdGpEbTZEQVdQUE9nQXda?=
 =?utf-8?B?b0lkNmx3SU9rZEYxUUkzK3dva0d5MC9odGhlUFYydmE0MER4U0hvYVRxOTZz?=
 =?utf-8?B?VGlLSStoRWVIM05ZZXo1TWxnTzZTbGRoNnUwclJHYWl3WXNTWUdvek8zWjFO?=
 =?utf-8?B?TWxrN05HVWpiM1dOd08vVTh3T3ZGViswdnNSZ3RFMzllbTBaQkI0ZGJab0hr?=
 =?utf-8?B?UFZuKzdoV3N1TEswQU5lNHNKU0JrOTdUQ2lmalVuck5MazVjSTNrd25nSTVN?=
 =?utf-8?B?a3VTTHM1R3BRbjkxNHl3eEFGKy85cDQ3dmVEWjFYR01vb3JrNVJ6VVF2OUNU?=
 =?utf-8?B?QThRVDJpSFBNQzkyOGorZk82RFNNYjJpRkxsZ2l5RGtwaTl0aDNleVJ5ajFD?=
 =?utf-8?B?Y1pxYnZUR1BCaFd4SEpyNmhIQjdGeHBOb0FZNGp4K1dUNjhxNmVtWG45Q2hI?=
 =?utf-8?B?OTYyUzBNL0g1SlBwNUZwT3dHOXhoa3lSelVrVjJ1bnFqNUtJNWV1MEprNkdw?=
 =?utf-8?B?VTZQbC8xakIvSVZuMGM0SlJLSmxualRnN3NGU2RnUnBDTE1lVjkxQ0dFdEV0?=
 =?utf-8?B?M1l4V2htWkFTZkI1NjFJcmxXQng1VjlRbWh3RjNESGpSek50MDdvSFZNQ25E?=
 =?utf-8?B?U1VVcGVUK2VFQm8wUkxRM2ZTVTFuR1RxNEZ1WWNGRjB6RkM2cklQR1dMUzNI?=
 =?utf-8?B?TmdDdGlCaW0ycmZXaDQ0Q1VBS0NYQ2dQUXdaVUZGbHU5bTlkNWRKbFV0SC8z?=
 =?utf-8?B?RzU4QjlQSEJzSEhoQmdNUEUyTDlFOWdCR2ErVit3U0pmMGRsRi81WjhpRkcy?=
 =?utf-8?B?OVBBcFE2ci8zTEM0MzM1am9kOWZvZEpQak5JcGFQMVlHdVg4aXJoVGpJK0tJ?=
 =?utf-8?B?R3VQVnlRaHlETkdJeGJNRUJaaURZdHB3NkpTdExDSzNkelp0Y2hLZU1EYjBG?=
 =?utf-8?B?cUN2SExPeWVrQTBoQlJNeHpVV0gvMEExZW8wRHlKdFg2eDMyY2FONVJXVmpG?=
 =?utf-8?B?T3U4WnN3S003ZUNyMkpjREZxNGNLVUhvblp4N3VRZTZDNnp6M1lqcEpmcGRB?=
 =?utf-8?Q?610INuunDD4vKMVWroRDcr9Co?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dce1869-c8b5-4b90-cfdb-08db52647720
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2023 21:12:45.3423 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4v0MHHCRAfd5MLX18S3M3wxPpBt1PCGWRyFEA+pA9KKnENSLs6+jheOdlow4O4/qzYGyZy2Y9AOZDPHezmLstg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4479
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
Cc: lvc-project@linuxtesting.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Oak Zeng <oak.zeng@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, "# v5 . 3+" <stable@vger.kernel.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-05-11 07:23, Daniil Dulov wrote:
> Pointer mqd_mem_obj can be deallocated in kfd_gtt_sa_allocate().
> The function then returns non-zero value, which causes the second deallocation.
>
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>
> Fixes: d1f8f0d17d40 ("drm/amdkfd: Move non-sdma mqd allocation out of init_mqd")
> Signed-off-by: Daniil Dulov <d.dulov@aladdin.ru>

Thanks. I am applying this patch to amd-staging-drm-next.

Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>


> ---
> v2: Move if (retval) inside previous if as Andi Shyti <andi.shyti@linux.intel.com> suggested.
>   drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c | 13 +++++++------
>   1 file changed, 7 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c
> index 3b6f5963180d..dadeb2013fd9 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c
> @@ -113,18 +113,19 @@ static struct kfd_mem_obj *allocate_mqd(struct kfd_dev *kfd,
>   			&(mqd_mem_obj->gtt_mem),
>   			&(mqd_mem_obj->gpu_addr),
>   			(void *)&(mqd_mem_obj->cpu_ptr), true);
> +
> +		if (retval) {
> +			kfree(mqd_mem_obj);
> +			return NULL;
> +		}
>   	} else {
>   		retval = kfd_gtt_sa_allocate(kfd, sizeof(struct v9_mqd),
>   				&mqd_mem_obj);
> -	}
> -
> -	if (retval) {
> -		kfree(mqd_mem_obj);
> -		return NULL;
> +		if (retval)
> +			return NULL;
>   	}
>   
>   	return mqd_mem_obj;
> -
>   }
>   
>   static void init_mqd(struct mqd_manager *mm, void **mqd,
