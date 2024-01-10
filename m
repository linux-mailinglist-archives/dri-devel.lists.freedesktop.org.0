Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B49829729
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jan 2024 11:19:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E25310E5BB;
	Wed, 10 Jan 2024 10:19:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2060a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::60a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11E7210E592;
 Wed, 10 Jan 2024 10:19:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hi5G4FybTxxZ3Y4YPJE95xgfYmYqU4b0C/O9Y/KshX/ZpwI+n8pQHTFvGs+d24u3U/yhiMmRl5izzuDQhscmGXFBTCIQPF1+ENNdGpQh1pz8zV8TWErqp0wnZUxKfFkSGhxPyJMjBr34UggpFVWQPd6ceZkR7o49xMXeLh6BoYmgtGvOqmPaAVPm+RSKaPg3mMpiH+SQ1uDoDleQu4Fkc96Zi6I3396a81c9lKcwMbSJQYXD5XRGmVmt8Jzhoso39tLmBNIShkXybUDMQNn8EIueCDbBOhbj0eEXw9KqMMJov6CkLjvLF/56KIOCKQ89oUatK312heBwNVT11GlqEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KSe33ReXy2QZfZWV/vxe3fJmKOevSrdGX86ju4zIdd4=;
 b=GBsPnDp4EOKLNpVpxBaxHBR8RIT/TDwvL2znC0kKMZxJOZbd7a0s6CREJAb0TXIMD6oYMF/ag6b78QuTMOhAQugAyItie82+w9TSqZL1YEpIVg2HoZ1lAy21lQNKcJx1uO8VIZMj0plMwaiv8XvwvAsPigaa2izNnGQnE8Jsh/XvUSlssIQwOSn17IUeso1d2WdS3r7FH5CCfyuNiLCmBZUxmcQWCOiwuyhs0s4TegZwFmxonGQwTKM2FuP+ggaCbd6Vt3ROhDCoqBp6lwyH/KdwNg3bZ6ygF5SF+/fss4M9Zom21cI31WPkPrfJxhSk/lGBq4nl1R6jC/pLep41hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KSe33ReXy2QZfZWV/vxe3fJmKOevSrdGX86ju4zIdd4=;
 b=2b4krAvhdzlV9ouHN9MX4e4B3l8rQ6M/kEzY5B+rD+0PJEhqNsXD5V2jnhXd9Q76gKKvQ6L/DvGIXKMuAuFq3xs42AbecCPfglNgpn6AdZfQoMVFsdT3KvZ3aEPpt16Tq92Sieh7JJbrfhkOel3WXf+jWQvQZjcGjwEraGgnAHo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA1PR12MB8263.namprd12.prod.outlook.com (2603:10b6:208:3f8::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Wed, 10 Jan
 2024 10:19:45 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653%4]) with mapi id 15.20.7159.020; Wed, 10 Jan 2024
 10:19:45 +0000
Message-ID: <8ce0d90d-c751-4250-8656-fcab27aec6c2@amd.com>
Date: Wed, 10 Jan 2024 11:19:37 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] drm/virtio: Implement device_attach
Content-Language: en-US
To: Julia Zhang <julia.zhang@amd.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, David Airlie <airlied@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
References: <20240110095627.227454-1-julia.zhang@amd.com>
 <20240110095627.227454-2-julia.zhang@amd.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240110095627.227454-2-julia.zhang@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0009.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::14) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA1PR12MB8263:EE_
X-MS-Office365-Filtering-Correlation-Id: 769097ee-2eb6-4e11-559a-08dc11c5aaf8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Pfy0H+112ihqgJrzcx7isRvnbs6+fyW2nhYpTkdzqv08zeUFNMDs3ItnRjmhBgAM/DRkzMtBvnrKR8m5WVwo6E8bqwRn0KmH6df0XOownGKTdtE1gdhZEk7BN8N7bLJ+LKyOeuy8o0O3XbUnx4h7Ts/MZUot9JMkIdbr4q9OZjTVfgeesDZaF0jLHyMQu1PpB5J4znMR+45TcSHOBs6gidqVvXV71+sbgpJt8l4sJg6wk3xluqHe8PQHbq/PtwSvzuVzT1ptQ8bOumsBFtnhgxRNeQQGhwbvgkky100CtH56N5NK6bfTnqNKoh7SFHZfNcVjmJ6MttftGLcTPGUIHKfUkrq2cslo4dc+qONdspveND9ZtvGb75dU9Yeze0DICu3VhLBw0F1qWLG0c0SDBZMRr9kXOweJ1xcp8IQzW6KxdcA1P6YjtR0cyTiQ87kcfvjdNE/fGBq/w0273LdN9VlPgz9u0RKGWb2tfbYZgAynoVQIny+O4iIxL0AqnhXqDp9S+3+6CWYPcZ3NPJbLJ+m6eXaia7MStpG+fsCcgt4q3G4xmTzeYF6qFZ7SOH1uIbZEnmcKEruRNI1arp/Tz9XBHUrKmBis7gXl3annXSYV5I4sNU/yUerHOGFJsDf6debwDosyWApM0KrrWnmRLQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(396003)(136003)(376002)(39860400002)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(41300700001)(86362001)(8676002)(6486002)(31686004)(8936002)(31696002)(6506007)(5660300002)(7416002)(2906002)(6666004)(2616005)(26005)(66476007)(66556008)(36756003)(110136005)(66946007)(6512007)(478600001)(54906003)(83380400001)(316002)(38100700002)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aXcrQ2FuRVVJMTJNRmFzVDdDQWU4WU5Obk9wRkJadkRXWGdocmRONGRyNGJD?=
 =?utf-8?B?RWVhUEFHeFFVVkRLd3BVSkpGc05uZnBhci9vUHM2Y3NETWNtUVpWUVErbG81?=
 =?utf-8?B?Y0piTzlCSVZBTUJTYmQ3OUFlZUkxaUFPOEh3ZUo0eWc4dTFobWM3LzhLSDdR?=
 =?utf-8?B?MHUwWHVveWtPTG5xeXFsRyt6RDd1YkpiWVRaTnI3cHNvTWdaa1lzVDNoZTFq?=
 =?utf-8?B?MGhwbmdwRVNlcHBXQ25sZmdNd056czREOW9pM1RtaThhMURraUNtT3F3b01x?=
 =?utf-8?B?Sm1nZjllM0YwRXd2RTJDRXBoclhSTFRUZ1RGMnRYZHlReWRDVndJaVlYL0o5?=
 =?utf-8?B?SnlEQU9pSlBpeDZ3Wi81UVpacjNXayt6cGNqRTNybDEzRlJ3ODRYRnpBUUhN?=
 =?utf-8?B?dEN1dkw0M3NlajRBRkt6dlVVUnZ4ejhmL0tzNXk4cktNMjdBYS96amVtRlcx?=
 =?utf-8?B?VGVWZUxydGlxRkcvUmdzeGdad0gvZmZlVWhJekFhQlBmeXVXNWl0NlRLYi82?=
 =?utf-8?B?TFAyQ0ZmVTMrVHQzckQzbFR2MTE0Wi9adFMyZzlmbndBbHQ2YlpMYU1YNjg4?=
 =?utf-8?B?WGcwNUVrVjJud096R1h4bWdpaXhoRmpEeEp1VjN5QU4wSFlFU040THNsbzhp?=
 =?utf-8?B?NTEvbDlFUzl4czVBaDRZQVRVNjJpSGxNR3ppcGVpOC9lbnZCRk91Z0VmbkF2?=
 =?utf-8?B?czA1NVB2OG5YQjI1WHRUMGFRMm9FanpJWGM0ZlN6YWwvMnZMdGwwY2ZYOGpq?=
 =?utf-8?B?VW1iWEhJTzBjVUtpVTRjOTQ2a2NnNDc3MlFGUVY5TEM0eVZ5eXZxOWJtWVJh?=
 =?utf-8?B?UUZFU2FqdXdQQzFSYUZMcG5kamIxc2FrZ0JkT2JNVFdkYmRMT3o5cDJnRjhV?=
 =?utf-8?B?bTRtY3RQMWk2M3ZtRm4rRGpsZHRKSEswckkyU1UycGFsbXJJN3dzOUl3dXk1?=
 =?utf-8?B?V1Nvb2dVZ1pwdUpLZ0I5eUdBbDFLc2pQeFhUYVo1N1QydzhIVUgzUFN2UmRn?=
 =?utf-8?B?MTI5MksrTHNWSkg4OXZYanIwQzdzYjlLa0h5bGQwODB3OUxpekVFZFMyRVhM?=
 =?utf-8?B?SklURjV4Z3FhNjlMZ0ZRVml1Ty9pZDBJV1NQV0pRQmdxaElLaFQzL3hiL3Mv?=
 =?utf-8?B?Y3hUa3RGWTVpMXpRdEx0Uk5nbGdpTldGcENnbFc3Y05QQkxROVBkaVlCR0lO?=
 =?utf-8?B?UTJtMWxESW93aFFFa3I2UzdVUU1keWN5MnBYMi92YmtUYURmc0dGOG9XcHB3?=
 =?utf-8?B?bUNnb3F5V0dqSXZIU3BUNFJsZEdkUWpzdUtOdjNGUTBzTXRkZVI5d1FiNVFt?=
 =?utf-8?B?L1JyWldFdUJoZ045ZVc2MmpSVUN1NkNXRCs5NEFDbmc5bnVXZGNiQ3ZGc1VM?=
 =?utf-8?B?RUtkQWk1RjJUWE9EYjZ0Ui85YWZNc3doSy8zMzFZdmRXa2tCTkJMU2UxSVdn?=
 =?utf-8?B?K2VKMkZ2ZHBFZVF3OWE1dWZMY0tRK25nYnpTckdFNldjNmE5SFAxWmc3UVNw?=
 =?utf-8?B?d25VWFdoajk3RktCSFoxSVZEUzFQcCt4RlN6bHdTeGFiY2FyL0l0d2tzS2U2?=
 =?utf-8?B?TzlxU2ltSmwwdUNDVDNKRjhISHZLNm45Nmo5cDVtR2Q5cEFnbmN0YjkwbUJt?=
 =?utf-8?B?QjZOc0dESTdsWUF6TmNwSnZMcTE1eE5GbDIreGdUakk5OGJkUTJIVXQ0Q2pV?=
 =?utf-8?B?dk8xQlE0YjdCTElIcnhlRzZRTUhDNnBSc1ZXSjZLTE5DZ1c5R2F6U000aVdC?=
 =?utf-8?B?eGtNaDZOLyszeFhXdWhwQ09aM2lVWFFGaUprbW9KTER2ZnlyeWZNa3F1OE5i?=
 =?utf-8?B?SElXZDV0ZzE0aHpDY242b05xUDNHdFlNajdLQjl1a21KM1pFTEgyRFhFc3BY?=
 =?utf-8?B?anhUMUQ0Nm9kYk1JNko3c3d3a0lVZVdaekRoMXlpYXE0Y29hNmxmM1k4UU1t?=
 =?utf-8?B?M21Id3FpY0VlNXNOTWlkQWxmaTBRQUZOVmxJa3pUV1pQV1pPZ25xcXowbTZq?=
 =?utf-8?B?NFN4RGJzdHlVemNSSUxMb2xqaHFrTWttWXVoNHNBVjYrQWd6QUdabVVLUk1N?=
 =?utf-8?B?ZDlFVElaZ05mVldOdStZMzcwMEgrWkNkSU1xRnA4WlJwbU4wOEFuaTU0QzlH?=
 =?utf-8?Q?2qe7TfjRAZwErJhjq7aa74ZjU?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 769097ee-2eb6-4e11-559a-08dc11c5aaf8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2024 10:19:45.5885 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L/beyhPHjmUj0RRVGCtxaMrq6lEGlJ9Cb1HDUhg5rkqbSQUteIAoVKqeKju1xU26
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8263
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
Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Erik Faye-Lund <kusmabite@gmail.com>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <marek.olsak@amd.com>,
 Chen Jiqian <Jiqian.Chen@amd.com>, Huang Rui <ray.huang@amd.com>,
 Honglei Huang <honglei1.huang@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 10.01.24 um 10:56 schrieb Julia Zhang:
> drm_gem_map_attach() requires drm_gem_object_funcs.get_sg_table to be
> implemented, or else return ENOSYS. Virtio has no get_sg_table
> implemented for vram object. To fix this, add a new device_attach to
> call drm_gem_map_attach() for shmem object and return 0 for vram object
> instead of calling drm_gem_map_attach for both of these two kinds of
> object.

Well as far as I can see this is nonsense from the DMA-buf side of things.

SG tables are always needed as long as you don't re-import the same 
object into your driver and then you shouldn't end up in this function 
in the first place.

So that drm_gem_map_attach() requires get_sg_table to be implemented is 
intentional and should never be overridden like this.

Regards,
Christian.

>
> Signed-off-by: Julia Zhang <julia.zhang@amd.com>
> ---
>   drivers/gpu/drm/virtio/virtgpu_prime.c | 14 +++++++++++++-
>   1 file changed, 13 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/virtio/virtgpu_prime.c b/drivers/gpu/drm/virtio/virtgpu_prime.c
> index 44425f20d91a..f0b0ff6f3813 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_prime.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_prime.c
> @@ -71,6 +71,18 @@ static void virtgpu_gem_unmap_dma_buf(struct dma_buf_attachment *attach,
>   	drm_gem_unmap_dma_buf(attach, sgt, dir);
>   }
>   
> +static int virtgpu_gem_device_attach(struct dma_buf *dma_buf,
> +				     struct dma_buf_attachment *attach)
> +{
> +	struct drm_gem_object *obj = attach->dmabuf->priv;
> +	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(obj);
> +
> +	if (virtio_gpu_is_vram(bo))
> +		return 0;
> +
> +	return drm_gem_map_attach(dma_buf, attach);
> +}
> +
>   static const struct virtio_dma_buf_ops virtgpu_dmabuf_ops =  {
>   	.ops = {
>   		.cache_sgt_mapping = true,
> @@ -83,7 +95,7 @@ static const struct virtio_dma_buf_ops virtgpu_dmabuf_ops =  {
>   		.vmap = drm_gem_dmabuf_vmap,
>   		.vunmap = drm_gem_dmabuf_vunmap,
>   	},
> -	.device_attach = drm_gem_map_attach,
> +	.device_attach = virtgpu_gem_device_attach,
>   	.get_uuid = virtgpu_virtio_get_uuid,
>   };
>   

