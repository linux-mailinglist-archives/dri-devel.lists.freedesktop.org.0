Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D984F8297D5
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jan 2024 11:46:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A22AE10E599;
	Wed, 10 Jan 2024 10:46:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2053.outbound.protection.outlook.com [40.107.95.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B410410E599;
 Wed, 10 Jan 2024 10:46:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=itvEVsnlF+fX2mRQ/HfMJ9fS47oA/H87uugIGpy9tofmmi9YAWsCIJEeAi3I6u+U2kyohtkt5u5iHyItN1/jbm+1oExgU6kf8IhWSJfWRlGOcIW8PGCeAqb9xTlNOEyIoSuumdDkTSHeukKvH0Mm593y9ZYKIOqoYbqFUTtbh91y6fOMJ5kWrV47b6id6pxqEctgY8cdOs7nHozT74x58eXG05SEXmAiZIm1nlvBzaU6LKvMwaeT3qSPk2p9TvYmMC+YQIoid1I79nRadsR/l2xnlv8zvD/t6cVk7osnH/f3n8D7Kl51EFk9024wKHTFjEY2U6YXCFFN9QyWZ0fnaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1CEqOqGioKW/WkwZAZjCbplCVGJOgF9UX1vSHK3zn34=;
 b=mBe3lisYbjDHTEiRvnKs/DPtrgbgvCGbNFNZ6xNEYbWzGWgsQEOUdjzSuWuISrRJmS9yBZUqSj9u7j+VMAPJHOMpOGB6hokvwUzGUavWEbL5TrSAsG4K6fI2qetjV9VdDjfd7D7TvKob4/N/I3UHynZhDVEzrD69nM6qqI9TMe7eHC1DsjfusMRrC1GktrWa/Y+k2iy4mZDwiKDMJjBmk/ySS5RrBOLQ75AF/LxXJW02FhCcE15GkDnNwBI0vRGyfaZUUEq+m3lK0dI8p1rK0qu3QpXo6Qz+j3kZa9kdvj0Bb/UHjqKyjLReCMs58WO8vqwrc5dQBo27+Yt/UDXbXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1CEqOqGioKW/WkwZAZjCbplCVGJOgF9UX1vSHK3zn34=;
 b=uMi0c6ygQuKpmF7hAxpNBhZUgayEkxGIZgEbsf/uHB0d25LHNQM3rKMPfr6TeDmFbhsQ4C63NMVSXR1HffhwClJwuDUk38sFpMjtSbnWGtc8nyoAvPQV/CspOf5rHlqA7ehGMb8JykJ6KoJFsnxV93eJZ1C8D1N1NstrQw9a3co=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by BN9PR12MB5228.namprd12.prod.outlook.com (2603:10b6:408:101::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.18; Wed, 10 Jan
 2024 10:46:42 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653%4]) with mapi id 15.20.7159.020; Wed, 10 Jan 2024
 10:46:42 +0000
Message-ID: <12505066-eb42-4ddf-9c6d-29eca6eefdbc@amd.com>
Date: Wed, 10 Jan 2024 11:46:35 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] drm/virtio: Implement device_attach
Content-Language: en-US
To: Julia Zhang <julia.zhang@amd.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, David Airlie <airlied@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Erik Faye-Lund <kusmabite@gmail.com>, =?UTF-8?B?TWFyZWsgT2zFocOhaw==?=
 <marek.olsak@amd.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Honglei Huang <honglei1.huang@amd.com>, Chen Jiqian <Jiqian.Chen@amd.com>,
 Huang Rui <ray.huang@amd.com>
References: <20240110095627.227454-1-julia.zhang@amd.com>
 <20240110095627.227454-2-julia.zhang@amd.com>
 <8ce0d90d-c751-4250-8656-fcab27aec6c2@amd.com>
 <ZZ5v7Fm-Iccw7nJR@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <ZZ5v7Fm-Iccw7nJR@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0014.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::7) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|BN9PR12MB5228:EE_
X-MS-Office365-Filtering-Correlation-Id: d0097fbe-c177-4b0a-8953-08dc11c96e92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KdV/Jqfj5Ap2vtkx2BDaZ8mk1UTYGmzLRWe8x5k07nesFKCkQ9mTad0HoqNr/op6hVhRx7tteYwk/IeeGlGKK/19j95Wl06VdP1pKe5re9qqWXdnf0eCK/eCkletvEKouAPco/4PSgvUGkNuYK6fnmeKgkaixcrnx9ktHWnN3M3XcViB9nxXZ8mqPcaTr5ZiNFqBRqDHXTKqBrHhJRNS6JEIVPcUTU7A2HmRm5nGP1R0crCBHmLvRThi9ZCPPIegyWzUITe+dHJT313mH2TtYgG91lQnoc94EXN/m2Ud6N3gio20hISQk7fZoaXa7alFXDFhmcCeJiziRHBTylClqWZsRUQB21HlZbCvEbK+8V10XFdRD5qCp1i72t5kY6IqdHEdgrTJ+/38uY/RTN6fWxvw+AFj2JPTF5O90Uj53/rRb6dNr/mFzToQzRhSF2eKQiH9cDNMzqCOxR8jhrNrtSQyLH7DJkN29/KYlkMA4YWb1hethjfu6gk6TSUwk5fIBmBoh2gpoH59KY2dr+3G6O5eP/mqUKI+4HdCkJx5bhJ967xIF5gJh8tV0s1E0tWuUfVLSIfm/c/nuc/dT0NXNrly/6DGhhJs3n5p56SSmvs9vW9OSTlT2WeIhxchBn+/5/KOYZYme4sRefz+Bap+fOMfMVkO4GlMduPDFG2t938=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(39860400002)(376002)(346002)(396003)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(5660300002)(41300700001)(7416002)(2906002)(38100700002)(8936002)(8676002)(36756003)(31696002)(86362001)(83380400001)(478600001)(6486002)(66574015)(6512007)(2616005)(6506007)(6666004)(26005)(66476007)(316002)(6636002)(110136005)(66946007)(66556008)(921011)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L2RPbTJTNzFJaFBKZjlHcHJaU2JXNk5KeUw3RkFQNUJpVGgrVll3ME1DRWt3?=
 =?utf-8?B?RjZsUmNQSE8xMTRKZEloSkJOQzh0QjlPSFNrTnVqZUFESmFKdjRjYktKZGxM?=
 =?utf-8?B?QTBHckczR3VnaDlPalV0VGhBRHBKc3Z2R1N1NFh2ZE5YSVM5Sm9EUmVFRVJx?=
 =?utf-8?B?K1pDTlJXU3NyL3RFcnR2MzgyVkZKVVVBMFpZeXJmek13VDgvOXlaaTJMVjZN?=
 =?utf-8?B?NmYzNUdzWkVxNk5ZOXluVk51ams4c0ovWTdaRFNzK0MyOU1TUFlLYTJCUDQ4?=
 =?utf-8?B?V2MzampFSWN4Q09OSC9LZ1BlbCtJcVZHTFdoaWZ4RzE3K0orNUIyMzVxU3lB?=
 =?utf-8?B?V3lGOFJwbS9TdUZHcm9tUDNKZlVmUXZJM2FRNnk4dTBOQXFHK2wrZVhQaEd6?=
 =?utf-8?B?M05SL093c0dkbVBzdFY0eUVXdHkrdXJsOFBpN05MaEF4Tk8xR3U4ZVFVMHVq?=
 =?utf-8?B?OW4vQWRHdkxCZVg1T0xWaWEvN2tXM09oU3Y1SEd1Z2kxYy9ycHZYdVBSczRh?=
 =?utf-8?B?OGRDV3dsdXNSWFEwQjdUSzBYbzJrZjNQdlY1VWRFdkRoamZoeHMyeVI5bWYw?=
 =?utf-8?B?TWtqR3Zla3JkckdDdm43akNhUFJtWlJmNElIT1dtU3hFN3RoZHp1bkFmS3BU?=
 =?utf-8?B?elI0azZHSlI4a0p5RWY1Q3c3M2ZiSEpEYTJsclBQdmZxdXN6MzZ3aWNKV0tS?=
 =?utf-8?B?eVFvcmwyQlErZlZoQ2djTEVxZGc0WTdabktaYkorUVBZRE5JdElyU2xsSmhh?=
 =?utf-8?B?dk1VeTRqU3ZHeVR1UlZ5VkRrdkorU2thak5xYTFaNFdmcWVnTDFIQTJyM1lQ?=
 =?utf-8?B?VEgzcmIwZ0tSQjkzUnFjaWoxOFdLMG5xT0dVQlNyY1JUQk9WeVZyNnBCQ0p1?=
 =?utf-8?B?MDBnSHY4QXdLSGRTTjZrZFVOOHZmOGI5S1ZPUjU4RXIwYnU2eXkza21MSTN6?=
 =?utf-8?B?bTc1YlRWRGU3WU1hYXNzTENIbEZkeks2cGZEWUJHM012eGdxb3k2SVNTOXVN?=
 =?utf-8?B?cWJlbThoaDllS3F1eHN0RTMzYk9LbWhTVTRuOW53Z0VRdEZHNGJCL0hmMnJI?=
 =?utf-8?B?bnJHL2F4eXJjRlA2ZlpoS3BxbVlycXo2TjdSWlQzRk54Y3pzaG43bFJySlZ0?=
 =?utf-8?B?amJJQjV2bHp6RjFzS0tSSHBSamNPOUp5TEZmYjZzbnlmbEplTDUzN0dLWXBq?=
 =?utf-8?B?cVI0S1BFR0ZXYzNGelBTUVBHOVN4WWo2bTdHSldTWDVaaDhlRUZPZmVKRVJQ?=
 =?utf-8?B?VnZBbitGTElSNkRleWF3K1JsWktzU243M2ZIaWJpbzd3YkZ3ZWtWd1hEdXFT?=
 =?utf-8?B?Q3FEaVZHWE1EZ2RyY29ZZUY1SmN0S1p3azlidk12MDFQUWdkUFd1TkR5TzNU?=
 =?utf-8?B?OWg0VVE0bjRXYTZhbFJDNDlyclprRmIvTTRVUTNSWFE3M0VSbkJYNmFueTFu?=
 =?utf-8?B?N0JSanF5ZVgyb3RQVmpITk1aRjljMnpaVzNXdzJmOVpKbWxycmVwallHQTBP?=
 =?utf-8?B?OTVkdmpRemg5R01pYldDWWlZVVBVdHphcEhscUdxd3dBZlVBT2F2bXhCZGla?=
 =?utf-8?B?OW9CMWJZb3BxbGxqVHFhcTcwck00KzFBdjNGSGFiSE8rMERueHlhdzVhTkg1?=
 =?utf-8?B?RitidU9LWDQwaHgyUC9hTGgzTUtXK2N4TWVLemw2d3ZOblVMVkxPdFRndFNV?=
 =?utf-8?B?cmlESzlzdEczbksxYVoyYnZMOXZWanpxZ2R1MVhyUDhHM2ROYS9iRXB5TVgy?=
 =?utf-8?B?OGY3dFJGdVVwYlB3K2JGZ1ZXemtKWHhDZ0NHcDk3SjI0bzk1cjJmc0ZEVkpE?=
 =?utf-8?B?RUVaVzJVSlM0U0grUW1BRHdpOU5xTE1OM3RvaXNjU1VLZVpPdmlRSjhQUGlP?=
 =?utf-8?B?QVRlM0l5TVZseDVwem1lMnlZZVhnZGo2MHZEWFlZcG5aZ21DbHRzNW1wdVJC?=
 =?utf-8?B?VERWQm1OcFJuVllwUlQybFVzK3VXazAwdklQWVBDOThMQzE0Z2ZnTVdrT2Vj?=
 =?utf-8?B?Y1V3TndValEzWk9GRFFrd1VEbkFncEhHcXpDbitlWjNRcVdzUnYyUGRTTkZZ?=
 =?utf-8?B?TGwzekwwNlRzMlpHd1JQNDRiOXpVMkFkREVkVXFQcGhpMnlhQjk1bk1KZUR5?=
 =?utf-8?Q?xNg7093WFXl5x8ijwR1Mqa1a6?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0097fbe-c177-4b0a-8953-08dc11c96e92
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2024 10:46:42.3757 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J7rr9lxjO5TgksCcbmHoms1Qs+QOhVeAVlFTlv1wQqzkg3EYC9Dy1MnFJCN99iE9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5228
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

Am 10.01.24 um 11:22 schrieb Daniel Vetter:
> On Wed, Jan 10, 2024 at 11:19:37AM +0100, Christian König wrote:
>> Am 10.01.24 um 10:56 schrieb Julia Zhang:
>>> drm_gem_map_attach() requires drm_gem_object_funcs.get_sg_table to be
>>> implemented, or else return ENOSYS. Virtio has no get_sg_table
>>> implemented for vram object. To fix this, add a new device_attach to
>>> call drm_gem_map_attach() for shmem object and return 0 for vram object
>>> instead of calling drm_gem_map_attach for both of these two kinds of
>>> object.
>> Well as far as I can see this is nonsense from the DMA-buf side of things.
>>
>> SG tables are always needed as long as you don't re-import the same object
>> into your driver and then you shouldn't end up in this function in the first
>> place.
>>
>> So that drm_gem_map_attach() requires get_sg_table to be implemented is
>> intentional and should never be overridden like this.
> See my reply, tldr; you're allowed to reject ->attach with -EBUSY to
> handle exactly this case of non-shareable buffer types. But definitely
> don't silently fail, that's a "we'll oops on map_attachment" kind of bug
> :-)

Ah, yes that makes much more sense!

So basically just the "return 0;" needs to be "return -EBUSY;".

Regards,
Christian.

> -Sima
>
>> Regards,
>> Christian.
>>
>>> Signed-off-by: Julia Zhang <julia.zhang@amd.com>
>>> ---
>>>    drivers/gpu/drm/virtio/virtgpu_prime.c | 14 +++++++++++++-
>>>    1 file changed, 13 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/virtio/virtgpu_prime.c b/drivers/gpu/drm/virtio/virtgpu_prime.c
>>> index 44425f20d91a..f0b0ff6f3813 100644
>>> --- a/drivers/gpu/drm/virtio/virtgpu_prime.c
>>> +++ b/drivers/gpu/drm/virtio/virtgpu_prime.c
>>> @@ -71,6 +71,18 @@ static void virtgpu_gem_unmap_dma_buf(struct dma_buf_attachment *attach,
>>>    	drm_gem_unmap_dma_buf(attach, sgt, dir);
>>>    }
>>> +static int virtgpu_gem_device_attach(struct dma_buf *dma_buf,
>>> +				     struct dma_buf_attachment *attach)
>>> +{
>>> +	struct drm_gem_object *obj = attach->dmabuf->priv;
>>> +	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(obj);
>>> +
>>> +	if (virtio_gpu_is_vram(bo))
>>> +		return 0;
>>> +
>>> +	return drm_gem_map_attach(dma_buf, attach);
>>> +}
>>> +
>>>    static const struct virtio_dma_buf_ops virtgpu_dmabuf_ops =  {
>>>    	.ops = {
>>>    		.cache_sgt_mapping = true,
>>> @@ -83,7 +95,7 @@ static const struct virtio_dma_buf_ops virtgpu_dmabuf_ops =  {
>>>    		.vmap = drm_gem_dmabuf_vmap,
>>>    		.vunmap = drm_gem_dmabuf_vunmap,
>>>    	},
>>> -	.device_attach = drm_gem_map_attach,
>>> +	.device_attach = virtgpu_gem_device_attach,
>>>    	.get_uuid = virtgpu_virtio_get_uuid,
>>>    };

