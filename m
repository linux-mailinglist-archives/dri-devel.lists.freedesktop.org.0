Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A11609A10
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 07:51:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C39610E256;
	Mon, 24 Oct 2022 05:50:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2084.outbound.protection.outlook.com [40.107.237.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CCE510E250;
 Mon, 24 Oct 2022 05:50:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CZp7GSpDn7HHhFikGzTk0lgPzwyjpxMGKWqPDAvN323hjMTCZZziXppSzBaJwFgw1TgyRfaebQvyFBYO6pux71MifOtoNdKOpzwpZkCabW0aNb8SJo8QIWE/FwP1ole/dkhZshTg3xpzqFhkzFKbHe5u7UfLchsK8rb3asSyDvHsYUjPy0jpYZbahBFO0f6tqXe39tzt+EEcnm0sCxSPN27uyxmqDl15IkwZAkvBaMp1ionQm7/bKUMPeg350KDuPYftbOPtP0PGGOUXRC+GjBfkbNbFwUdvo9fOHop+8DnL1AiUjUA2KjVA6bHeInFwOEC9rVaFeiYPwV78koLuLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=65IB5sNGNsnVx7iFymh7mX92xrgtpEB5BDk+d/6nMGc=;
 b=aBNQwQO8lOsnyEdGQ8lrih3aeIFbt6HdX88w0ra2Luo4O4mmGpG2hbeZf/p3HM1w1eCPt9z6W/nYFlHWumLfRej+xyoPKLtyTGVJtwxk9kEf2XMYiq8D53hEK1qXqPW1iHW4gD8JSPb6DAbw+VpbZiNVD1wMcjsEHNOvHCrtLu8VBWq+toZo0QU2ufkTIMg8cPAWrdMPDyBfkixxYDbyfnck+hGcaoPeJbASCsr2JtUXgUqtpdTZNntSyNHY20pI3hWVbk6mq0S8BLQaneU+/Fidvpw8tlfnz88Eh9iSDe7YMv5fNnYD8Vx06YKX0NbhZAAURjDhZ+d1Jj/YrJSAPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=65IB5sNGNsnVx7iFymh7mX92xrgtpEB5BDk+d/6nMGc=;
 b=OUjW1/SmRsNziC/8o3SWq9PxO9NaKqZTUcv2sNrWMAdId3G4ViKODluvlawQPAl3jRggP+FtsmovdVaEx4g+imTYnqOE9DR7HDkbU6umWpjAqrxW8CWzgzQp4cIMESZlsxcvjdelF/P9VfAye0KaUf4TzqloubxkJfvrKREwjU8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 MN2PR12MB4143.namprd12.prod.outlook.com (2603:10b6:208:1d0::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34; Mon, 24 Oct
 2022 05:50:47 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::d309:77d2:93d8:2425]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::d309:77d2:93d8:2425%7]) with mapi id 15.20.5746.026; Mon, 24 Oct 2022
 05:50:47 +0000
Message-ID: <200e5ee6-52e4-e3eb-6ac3-74134b60ee0c@amd.com>
Date: Mon, 24 Oct 2022 01:50:44 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 08/13] drm/amdgpu: use scheduler depenencies for VM updates
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20221014084641.128280-1-christian.koenig@amd.com>
 <20221014084641.128280-9-christian.koenig@amd.com>
Content-Language: en-CA
From: Luben Tuikov <luben.tuikov@amd.com>
In-Reply-To: <20221014084641.128280-9-christian.koenig@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT1PR01CA0128.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::7) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|MN2PR12MB4143:EE_
X-MS-Office365-Filtering-Correlation-Id: 41e05ce8-85c4-4b61-07f8-08dab583b280
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mQtaPIhUMgT7GdfnSlNcqYfwsMK7fVcalaSqAwQU6mwxZva9hwCPHbITaS0Xxvt1HDaU2CfbCCM59RCJDEDcE9GlUgHh8R+FaSKaYgtm4LKrT+CFOjmrODwBNSwPPZVU8tEjdSJ1hOv3Wd/U9igBF/9qXMdST8xMXuPr2n5yNwYeZp9RSSixKwr5GJJr1H51q9lx8ro0VyfA9XRmEipHqrnrpUVzpiOTBxM9w2V/3VnoOM5SNQeGxVi7DurFFPLN+EHX4TaIkrKhjjF8xpyMHabErOYlKh5tHIVQtTTRlSgbJz/h3KRVjV9k6ufrJKIUBY8I7KcM8cSzlgEB/O7QWnaTK1J/yI66XV/LV1w1HzLwDy0lAOby1k5Cu87iy1exsEHpXf/GaYe1ZdeHRsaOGgaur4zWoj3yDf4L3zlCtT1rFDzfvj4htVJ7ysbVSOsxMjhfZ9J2Hvuf8hTrtpQnDp4O0KwDBR1wzx5XYXS8ohqidWp1P5ajh8r+ybUc8NN7AeBPgCGgLP8BB9xtv8nScS0IPQYa//kt27FFHXc/Zm8ua2DFVHz1Nwg14d69oYpFgvQwuvhJEd3if6vl3lSjzWMaoncluj5nT+244pFFUTUYonuUAaGDACA5iWNHpDpmZuihqBHUVY0+BeWmHYYKHL7f5iJnnGppAsus1u0ktTaAxoPZJz1N7kGbehw6KE8aoSOpnNowZGTrTAJ+vCl8I4/XnoPi4xUT155ZPGhq7yahatTyPo4Y/uoJTKY+VgUpnKG27ZblLbRdDmJKWWbxKh4GMcTIXXJ4lt/A7YvpKCo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(346002)(376002)(39860400002)(136003)(366004)(451199015)(5660300002)(4001150100001)(2616005)(86362001)(83380400001)(66574015)(41300700001)(38100700002)(66946007)(53546011)(31696002)(66476007)(66556008)(44832011)(4326008)(8676002)(6512007)(186003)(8936002)(6486002)(316002)(6506007)(2906002)(26005)(478600001)(6666004)(31686004)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?akY2VWVSSlU4TzBsWGJvUkZ6SXhrOWRUUEd4WG9uWTd2ZXk5N0x4NFFST2c1?=
 =?utf-8?B?QXJTek9QSTM3ZCtneDFFRGJHZ2pCMWk2Mi9rV0J3eUdaSk5UZGtaZlNxd041?=
 =?utf-8?B?ZEM0TVVrRW1uZkNvdURZcjNrSjBFVnl4ckNieGgzb2M1dGpmKytxK1JncFJ1?=
 =?utf-8?B?c3hLaFkveXF0cDRnOS93N0xCZ0V3bVppbHdDdUgwQjJuck4raUtDQkdQUGI0?=
 =?utf-8?B?REl1R1FvalhLWEtRa1ltcmhHbFlkWmtjMHMwdGc1cC9laG9TcWJaNHdzMjRL?=
 =?utf-8?B?YnhkN0xHWnllMGxwVWRjWFNvZDQ4TDVXdmNObmRjZ1ZsVFRJN1FINjZaZGpt?=
 =?utf-8?B?VmNnWmc1cWdWSFpiQTBJNHMzb3NZMmc2enFzNzZIRDAxSlo5NEM0ZFIvYUR6?=
 =?utf-8?B?NGlRQWZFZjQvMXZPaWhpbzhFZ2EyZyszeDJQZWNUSDczeTk3UEwvd1ZsRUlk?=
 =?utf-8?B?RjdlRzVVWDVrNmFRTnJwUXhFNmU2cUdkZkdYUUN5QmQrOHJ5TWZocE1Qbmhw?=
 =?utf-8?B?UEgyOXhEYVhqVEMvZXMyMnRnV1o4S0FtZEpZM0k5dGRRU2pVL2E5UE1HWU1X?=
 =?utf-8?B?ZmlGc21sYUNsUmwwOFd1TVlSODBjRXdIRmw1Z0tFRDFYd2xCL3IrUWN1NTdZ?=
 =?utf-8?B?VmEvMUJNMlptMHI2NDAvUGlUSi9Gbkw3eSs2dnRHSkx5MTFzc2J1MWRpNkNs?=
 =?utf-8?B?MEdZa1V3OXlYV09saGE3aEVqTFphdG4xRERWMGkySzdsbnVPTWQ1TmNOREE2?=
 =?utf-8?B?bVNkcS9XY3JSVDVnSkdHTnYvc2dvRDE2b2xLV1B0MHZZSHU5cWo2OGExMDdK?=
 =?utf-8?B?WGtaSC9tNXJjcy9WNzNxcTFCbmQ1TUszNVVoTzlBRmdqVlhxS2QrOXFtQk9F?=
 =?utf-8?B?UFZyS3lITEFFeldrekhVdEh2N0l6UzViWWgwY2dCc3RtT054RVE1dDJmWEhj?=
 =?utf-8?B?a1RkUTFRMkpNcjRvTGxtZkpWQnNIbTdBdVRoaFZXQ080WnZ6U3pRYmNSOWRN?=
 =?utf-8?B?SnhXdk5jWVAydy9CWHBNdW9DRnlVdmJGRlUxWS9sd1V4dlV3eUczOXEzY24z?=
 =?utf-8?B?elM3a1QrdG5JQnN2ZjRraTVxZkFtWWV3WVZLZTNJaVovKzVSaWNLZ1pPYS9t?=
 =?utf-8?B?VkR6L3h4alpsM1NURjZwTWJZOU9YdGl3ZUExa2dHS1J5SVZCZWNrNjU3Uzkw?=
 =?utf-8?B?bU1aWWVsdzdpL3RqMmEveThCWkFobmVWZGdNZlliZVhuaWZ5L2VXTzBKd1pq?=
 =?utf-8?B?bTRDbUQvOTZUY21iNEMwSDIvb0pzSmJEZnhhd0wxNmwxUDNjdktpSFJSeC9n?=
 =?utf-8?B?UUpteHBVenNJQS90RzBjaW9pUXJ4NjErckR0ZmRtKzN1RVhyVWZZT0RneHRM?=
 =?utf-8?B?em5IOHlpbEJFMkJqWXpvdkR5STlOcFlMOE1TeHAvZElyOHZqRG0xTlQwR2tI?=
 =?utf-8?B?V1dpall0QlZlRFZiSHZpQjNuWGZ1WFR1bmJSTU5KMEgveDZnVmMwVjRKRWlu?=
 =?utf-8?B?MDhTVktEK0RyWThzNzVUN2VUanVrc0ZsVHVWQ1pIRVJsRWNuUU1uU1ZYeUYy?=
 =?utf-8?B?STdCODRWbXVZSW5LbTJRZU1LOGk3UjZnWUd1R0Qxb1NsN1JzNFhDQk0vbXNB?=
 =?utf-8?B?bFJveGx2biswS1ZhNVNieHUrdVBFekppYWorNlZDVjJKQU5ZUUkyYWVXMzNa?=
 =?utf-8?B?M0pnd1VjblNXc2Y0TlZUYWx3aElkUzdTRlExUk9LS3E3TmptRUNHemt4bGNm?=
 =?utf-8?B?MkVrL2RTVGM5Q2s4V0VUNHJXeFB5R25RVXN5TVhCQnlCQzk1R2g5WmpNMHNK?=
 =?utf-8?B?d0J1ZDUyMDU1WERsclhOdFE0enM0Zk11SElQQlliZWRlckg1SzRHL3RDVnBG?=
 =?utf-8?B?RTJqRUZJWlY0YlVnZWRyamxtNVg1aUY3QVU1c0VvRGJvVnJJQkVJMk0xdDdW?=
 =?utf-8?B?M2lBdnIrOXQ5RVYxakZzRFRhck1oQkdwU0ZBVVFRUVEvazYrQ3pMdU9GQUVS?=
 =?utf-8?B?ZGR0YnY0TXR2d2pTNnE1WDByWGZvRi8yelJpUzc2WkNyTUlMUXN0ZG9WS2Jx?=
 =?utf-8?B?RlhCMEVQQmwwUWpoMkJOa3pQdGtIOWV1bFRKRWlrZUl4OVBZT3pwVnVZK2lY?=
 =?utf-8?Q?XZBXiUH2AtK+M/uLmQ7GXMs1b?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41e05ce8-85c4-4b61-07f8-08dab583b280
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 05:50:46.9549 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gcqhyvNe/NRCjD5FGOI0DOXAzw3fEk+qAKkHaAEZkF7+IL7LrH1oVwa2EBlLZNrn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4143
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
Cc: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

"dependencies" in the title.

The rest looks good. I like pulling that sync free code into its own function.

Regards,
Luben

On 2022-10-14 04:46, Christian König wrote:
> Instead of putting that into the job sync object.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c    | 56 +++++++++++++++------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_sync.h    |  2 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c | 10 +++-
>  3 files changed, 52 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
> index 090e66a1b284..bac7976975bd 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
> @@ -259,6 +259,14 @@ int amdgpu_sync_resv(struct amdgpu_device *adev, struct amdgpu_sync *sync,
>  	return 0;
>  }
>  
> +/* Free the entry back to the slab */
> +static void amdgpu_sync_entry_free(struct amdgpu_sync_entry *e)
> +{
> +	hash_del(&e->node);
> +	dma_fence_put(e->fence);
> +	kmem_cache_free(amdgpu_sync_slab, e);
> +}
> +
>  /**
>   * amdgpu_sync_peek_fence - get the next fence not signaled yet
>   *
> @@ -280,9 +288,7 @@ struct dma_fence *amdgpu_sync_peek_fence(struct amdgpu_sync *sync,
>  		struct drm_sched_fence *s_fence = to_drm_sched_fence(f);
>  
>  		if (dma_fence_is_signaled(f)) {
> -			hash_del(&e->node);
> -			dma_fence_put(f);
> -			kmem_cache_free(amdgpu_sync_slab, e);
> +			amdgpu_sync_entry_free(e);
>  			continue;
>  		}
>  		if (ring && s_fence) {
> @@ -355,15 +361,42 @@ int amdgpu_sync_clone(struct amdgpu_sync *source, struct amdgpu_sync *clone)
>  			if (r)
>  				return r;
>  		} else {
> -			hash_del(&e->node);
> -			dma_fence_put(f);
> -			kmem_cache_free(amdgpu_sync_slab, e);
> +			amdgpu_sync_entry_free(e);
>  		}
>  	}
>  
>  	return 0;
>  }
>  
> +/**
> + * amdgpu_sync_push_to_job - push fences into job
> + * @sync: sync object to get the fences from
> + * @job: job to push the fences into
> + *
> + * Add all unsignaled fences from sync to job.
> + */
> +int amdgpu_sync_push_to_job(struct amdgpu_sync *sync, struct amdgpu_job *job)
> +{
> +	struct amdgpu_sync_entry *e;
> +	struct hlist_node *tmp;
> +	struct dma_fence *f;
> +	int i, r;
> +
> +	hash_for_each_safe(sync->fences, i, tmp, e, node) {
> +		f = e->fence;
> +		if (dma_fence_is_signaled(f)) {
> +			amdgpu_sync_entry_free(e);
> +			continue;
> +		}
> +
> +		dma_fence_get(f);
> +		r = drm_sched_job_add_dependency(&job->base, f);
> +		if (r)
> +			return r;
> +	}
> +	return 0;
> +}
> +
>  int amdgpu_sync_wait(struct amdgpu_sync *sync, bool intr)
>  {
>  	struct amdgpu_sync_entry *e;
> @@ -375,9 +408,7 @@ int amdgpu_sync_wait(struct amdgpu_sync *sync, bool intr)
>  		if (r)
>  			return r;
>  
> -		hash_del(&e->node);
> -		dma_fence_put(e->fence);
> -		kmem_cache_free(amdgpu_sync_slab, e);
> +		amdgpu_sync_entry_free(e);
>  	}
>  
>  	return 0;
> @@ -396,11 +427,8 @@ void amdgpu_sync_free(struct amdgpu_sync *sync)
>  	struct hlist_node *tmp;
>  	unsigned int i;
>  
> -	hash_for_each_safe(sync->fences, i, tmp, e, node) {
> -		hash_del(&e->node);
> -		dma_fence_put(e->fence);
> -		kmem_cache_free(amdgpu_sync_slab, e);
> -	}
> +	hash_for_each_safe(sync->fences, i, tmp, e, node)
> +		amdgpu_sync_entry_free(e);
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.h
> index 2d5c613cda10..cf1e9e858efd 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.h
> @@ -30,6 +30,7 @@ struct dma_fence;
>  struct dma_resv;
>  struct amdgpu_device;
>  struct amdgpu_ring;
> +struct amdgpu_job;
>  
>  enum amdgpu_sync_mode {
>  	AMDGPU_SYNC_ALWAYS,
> @@ -54,6 +55,7 @@ struct dma_fence *amdgpu_sync_peek_fence(struct amdgpu_sync *sync,
>  				     struct amdgpu_ring *ring);
>  struct dma_fence *amdgpu_sync_get_fence(struct amdgpu_sync *sync);
>  int amdgpu_sync_clone(struct amdgpu_sync *source, struct amdgpu_sync *clone);
> +int amdgpu_sync_push_to_job(struct amdgpu_sync *sync, struct amdgpu_job *job);
>  int amdgpu_sync_wait(struct amdgpu_sync *sync, bool intr);
>  void amdgpu_sync_free(struct amdgpu_sync *sync);
>  int amdgpu_sync_init(void);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
> index 126364882d09..59cf64216fbb 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
> @@ -87,6 +87,7 @@ static int amdgpu_vm_sdma_prepare(struct amdgpu_vm_update_params *p,
>  				  struct dma_resv *resv,
>  				  enum amdgpu_sync_mode sync_mode)
>  {
> +	struct amdgpu_sync sync;
>  	int r;
>  
>  	r = amdgpu_vm_sdma_alloc_job(p, 0);
> @@ -96,7 +97,12 @@ static int amdgpu_vm_sdma_prepare(struct amdgpu_vm_update_params *p,
>  	if (!resv)
>  		return 0;
>  
> -	return amdgpu_sync_resv(p->adev, &p->job->sync, resv, sync_mode, p->vm);
> +	amdgpu_sync_create(&sync);
> +	r = amdgpu_sync_resv(p->adev, &sync, resv, sync_mode, p->vm);
> +	if (!r)
> +		r = amdgpu_sync_push_to_job(&sync, p->job);
> +	amdgpu_sync_free(&sync);
> +	return r;
>  }
>  
>  /**
> @@ -232,7 +238,7 @@ static int amdgpu_vm_sdma_update(struct amdgpu_vm_update_params *p,
>  	/* Wait for PD/PT moves to be completed */
>  	dma_resv_iter_begin(&cursor, bo->tbo.base.resv, DMA_RESV_USAGE_KERNEL);
>  	dma_resv_for_each_fence_unlocked(&cursor, fence) {
> -		r = amdgpu_sync_fence(&p->job->sync, fence);
> +		r = drm_sched_job_add_dependency(&p->job->base, fence);
>  		if (r) {
>  			dma_resv_iter_end(&cursor);
>  			return r;

