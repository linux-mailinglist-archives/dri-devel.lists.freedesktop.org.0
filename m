Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A6B696591
	for <lists+dri-devel@lfdr.de>; Tue, 14 Feb 2023 14:59:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F88810E227;
	Tue, 14 Feb 2023 13:59:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2060.outbound.protection.outlook.com [40.107.223.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E425C10E1CE;
 Tue, 14 Feb 2023 13:59:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n0vuYf8UOaJ1hsTXinVLDnk7BpyFeAO3h0A+iDuVzCO2q8DG4WuwhkqMMJTjseQv7q0EMv6FZx65wne6HTsK3PnbgbT77mmrdMOze2o6TsaPs8S3y61N0hdC3q0qPXXY1/o7+eM48riYNwPnPuOhj7dZSlGb2IYNoIH9774fsWFbFzrIWRJoPnr2mucRIEiPpXUTvFi1S8Hvy/OZ9pp3SNqitPwUeFHXjFR72asMWQMgruvqlAjUNhHtPMCqEhmo07ew4v3qBwm6m0WG4xUJMcThnFen/vl/O0sXYUT7IjauH0gm32ESHaQJJJlAUn3t69YyYMdq6be9AyE+PYvd+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5J3EwnAfqcroXmVU+6Cy2FNea1vMFGSWLx6pXlj8fPc=;
 b=Ju8JxyqlxQqwYCTlQm/xC8eM3bMOmpr//U0ybnkKtLZRD87B401egog/lNXKe9np0NTH3/xczf1+u6Ji+Lg2frkbYNf9GYmP4Tw01J7h15CxaO7DcriWnmAI8Mn0RZevCV5h28e2GYlfFs/60FHMhv/OF8RL4uSJX4t2Ikr7cUHOrMHsAjdQbUyka/meDm5ZcMB8/yH2+0lJ4LxRSOmEJyGNREgaKXoyMG3Pue7aIHKXuqYhylfP8D3Y8oiH7lTEAZAzGMcMrNwH+t36DS/7Zpda4oIoEoFGK6Vz5XxFRbcgGawNgoKsVfNqlE14cyqlefLLOg5LU00ny39HeocxKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5J3EwnAfqcroXmVU+6Cy2FNea1vMFGSWLx6pXlj8fPc=;
 b=a9hxGbNmSW7MJaTKEuPBpcmw9mut/QbttnqJve0NugeGhnEmSVeP4BSRhiZC3W4jgnz59jvxavUpBZNfcP1iJXvJiujW5iiB1Md2X8x6n9Dj+FIYDzKmYh/DoHw9QH8qwOtOLBkkRFhzdRuBNVx296UzOdWX0GAG0Is9ZBqScvU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BL1PR12MB5189.namprd12.prod.outlook.com (2603:10b6:208:308::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.24; Tue, 14 Feb
 2023 13:59:45 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a%6]) with mapi id 15.20.6086.026; Tue, 14 Feb 2023
 13:59:45 +0000
Message-ID: <f1256a51-5c4d-ab44-3867-931f7d2c0695@amd.com>
Date: Tue, 14 Feb 2023 14:59:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] drm/gem: Expose the buffer object handle to userspace last
Content-Language: en-US
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dri-devel@lists.freedesktop.org
References: <20230214125050.1205394-1-tvrtko.ursulin@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230214125050.1205394-1-tvrtko.ursulin@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0172.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::10) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|BL1PR12MB5189:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ec58fab-f6c1-4ac4-6a38-08db0e93ba60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8OEbT8BHCKauSFGaRyjwXGMvv8hd2oEXpw7iWfZwFq8PLwJ+gU1DCU5azbPGWht56jn6GMGzmxLIRbxTRQ/IwiEMVsfHKyv8JMaJhqHlMddMjULfrgsKVj2wS6yU9Hn3tn1D2P1CvxhPwxiZPwQ0dSQB2CIlEbk8OyEPiRAHd3FCiZBLAqo8ttAFakW58bUuCDILT2oBfwP0YoHOyR1QBaIBK+B06YQ2slWCKwL+tDzWl8tk4Xtx44boc9i/y48Qp/wGqb0Qr1iGZ+FjDcjVB5eBurpCvW+P3YOGlxIkUqxyzQrc8W6qJomMjKY/5TW//A2shN1DrlEjYooJDCwxkrN/piuq7812Xcl+rpEhy7um9WZR5pi1OimX+QFYzl6tIV4CpvYTAUJ6MQceX5PksBYqa0oG8jJRxD5aVgudLScKBbfjyED2jV+t0tH0nUc/OHGbjvoW8BGiOYnZq4Sv1/hITII8ZCPUy/ZIGP8j82ssPjCzcQ3QHHqSXE34pCy7nOu0AV0W9ZEJiDvvzyPE475wGMwBpZaD7Yyy/exDZySADKpcZWANRDcrwXMvkZRoWgB9j1abhAXyBKVYorj5fk8Mo0P+hwlmIMaxxOoMZEBula/+cky0L7Ya0+2CdKM7Lb+WlvBeVE6m5jDY3XluIJX9F9lDxMwDD3oEyT2Rk6AJ0jz0yww4qBgw1QBhWyAKY689Cg1k2gAhKz9bps9fFugDqCqeJlHRRXEJg/iLiWA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(346002)(396003)(376002)(366004)(39860400002)(451199018)(2616005)(86362001)(31696002)(26005)(5660300002)(54906003)(6512007)(316002)(36756003)(6666004)(6486002)(478600001)(6506007)(7416002)(186003)(31686004)(38100700002)(66574015)(41300700001)(2906002)(83380400001)(66476007)(66946007)(8936002)(8676002)(4326008)(66556008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RVdPSkpRM2s4MEg4dGJRRG5URGdUZkI2RldsOWFvVStpVTV1bjI2ZUtzbmZ5?=
 =?utf-8?B?T3h2aUI3QU1sb0g3cTl1ZnpJWVNKMWNOT0tyZTJvQVp3WFl2YlM0cTRPVUJ2?=
 =?utf-8?B?cTZoRDQyQ0x1U3RPSWF6K09rdm0rR1hZNkpFS3RBQUV2Mm40SnloN0ZhbDZr?=
 =?utf-8?B?aDAwRGE1Z1IyQlB2NXVIU2dWZFkyTE4rMGZGVmhCZ3FzN0gzSStsRHVscFFP?=
 =?utf-8?B?OFgrVnpZSHFOYjdDSE16N2IzZHp4SWF6OUozQk9lMzJqdHdtYjhoVTVUdk1v?=
 =?utf-8?B?UnIxc1ljTEM5dk5ibFpTaXR5WGIwb01RWTBGYW9oSUJ3UTQ4Sm9HR3hMUytr?=
 =?utf-8?B?d0VxeS9MUnlwZjhqSkNCNGFWbUhtcW1OOXNjVGc5VkdvelJEdnhkSWtqUEJa?=
 =?utf-8?B?YncycXU1ejNGRTUvVDlZYmxXbTE5Z0RRMEVSVzFMRktKU21Lbk9haHNjWVdz?=
 =?utf-8?B?SEw3RHgySWgzVFZpb3BjZjhXTHdHUjM0VEtyRXdZbkVWeUhYVDdVdXVPQW40?=
 =?utf-8?B?QVpOUTRQL0FTR1lJSWNBK1BxOFZUVkprQW1ZaXh1NzNkZXJCTm1zblFzRm1l?=
 =?utf-8?B?M0JFdmlIeDFlcWdKSGdaZUxndzdmSVlkamd5YThGVzl5MzJYSFhORjRTbTNY?=
 =?utf-8?B?Y0Vnd1c5SysvMjJLZHRrWE54blhEYmwvaVhRbkpkOUxRTFRibmxyUkpYd1k0?=
 =?utf-8?B?RCszR2pKdzdHcEJWRWlqYzVaNVNjTVBGK05OMkZSNU9TeDdyUDlONTFneFBN?=
 =?utf-8?B?VnFSVjNUTEVWT0VXa2doNmJsOVFENXJ1WFo5dkkvS3NlYTNhUkpTeStYR09o?=
 =?utf-8?B?ODNsTDREKzA4VFB0d3NVdkVGRnJvWnN3RjViaDk1aTd2VEhtMlQ3RCtvUTlt?=
 =?utf-8?B?bTNObEgrUHN0TTE4R1k5N2h2YlV0SkxvRnRYUGVOcDcvVzJHQVg1WUZwR09q?=
 =?utf-8?B?SWIwM0Q0TUwydCs5d1psaGZVYXNqNzZDSzQrem1GdDJhQ2hrNUg1cW5NaFhv?=
 =?utf-8?B?ZFlpYTgvdjM1ME1iaGRVYlZxUWs4ZnhoYS9IWkZtb0hva0VJeW1BV3ZTUXJt?=
 =?utf-8?B?MEV5VGpiVDQzM05lbjRXOERyakRpRnYreE1OaXNOdGlyMy9Qc0UxM0NQS1BD?=
 =?utf-8?B?TUNsQTdSVGdUWlBBQkh6WE12SGtWLzRsSEI4YkJHNVVRMDgwWmdrdEVJU1d2?=
 =?utf-8?B?ZmUzOTVRQnpUMGg1dVU0dFUvWW5UeWE3U0tHWXNWWFIwN1pBZEZvcTFuR0Rj?=
 =?utf-8?B?b0NhMkNtWmlqaFg5RXg4K0VsUDBYb0tJUGVlbFM0NlNZaTJzTitxdXpWaWxr?=
 =?utf-8?B?OWJWckJrMUoxNHlJdzhxZlhqdW1xZDBIYjY3TjZJMThEMHN0bmd3aVh2aklz?=
 =?utf-8?B?WkhKTHc1bXpmcm4rRHR3QTdoSnN4bTVlVkNtekVCYm9kREpDNi9kSUdEZnhF?=
 =?utf-8?B?ZWZPdzhoLzB4YXdVSE84Ukx5R3dCVWhCQzlwS3h5eVlMd3RjbWE4S3dXanNM?=
 =?utf-8?B?QlZ1aitjRVM1SmtFNmVWcFcyc1VYQTk4ei9DTWhJeTFLdnVQOWZCVmxYY2w0?=
 =?utf-8?B?bVp6M1puMDlLWkN1UmVnVjdwUUZxb09qOGhzYTJ2bkVXMjdGejVybENZNHVv?=
 =?utf-8?B?cllZMDhSSmRaOWluRU5rdVlKTnFSQ3ROUzFidFg0ZDdrT0U2bUM1bTVackR0?=
 =?utf-8?B?U010UFc4ZVFaY29hM2xjK3ZDaWtJeEc0ZFpjcVFYYmk3S2dVZmNxOTFnS3V5?=
 =?utf-8?B?QXdFc0kvQUdqNjcrK3lnOXYzUVpJQ1lLTHVYWEVaNUwwc3ZyVXVZSks2QW54?=
 =?utf-8?B?SVFmZlJ3RER6dEFUL0xrZ3NMby9ST3llWk03Nlh5alNmWk93WGttUFRKMFpO?=
 =?utf-8?B?dnlBZEpIcURvWGQyMTc3RjYvN0pyQk5xeExmU1ZTYWJmTVlJdjFmUnBoQUJH?=
 =?utf-8?B?T0Iyb0Y0aXVJUFpzdWI1MmFuRmdUOVNacEk4SUFQSGhUcS9pNFlma0lweVBI?=
 =?utf-8?B?N2pORkJxV1lmeWtYT0xzbWwvekVSNGdpM1hubnJHSUdpZk5qc01KUCttc1Q5?=
 =?utf-8?B?WXlKRnIvSUxod0ZVWXIrS1hocFFIVXhhMmlSYmdOdjJReDJaK1hJVDd6QW5s?=
 =?utf-8?Q?XCeZjHTjvI3gnSOZtY0ChEkIF?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ec58fab-f6c1-4ac4-6a38-08db0e93ba60
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2023 13:59:45.5731 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9BDvXdpGLdBK4tCURmduEUW8POFINqmtP3AnU+MMfMCWn/PecwPi+OVI4URtQHZl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5189
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
Cc: Rob Clark <robdclark@chromium.org>, lima@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, nouveau@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Ben Skeggs <bskeggs@redhat.com>, David Herrmann <dh.herrmann@gmail.com>,
 spice-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 14.02.23 um 13:50 schrieb Tvrtko Ursulin:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>
> Currently drm_gem_handle_create_tail exposes the handle to userspace
> before the buffer object constructions is complete. This allowing
> of working against a partially constructed object, which may also be in
> the process of having its creation fail, can have a range of negative
> outcomes.
>
> A lot of those will depend on what the individual drivers are doing in
> their obj->funcs->open() callbacks, and also with a common failure mode
> being -ENOMEM from drm_vma_node_allow.
>
> We can make sure none of this can happen by allocating a handle last,
> although with a downside that more of the function now runs under the
> dev->object_name_lock.
>
> Looking into the individual drivers open() hooks, we have
> amdgpu_gem_object_open which seems like it could have a potential security
> issue without this change.
>
> A couple drivers like qxl_gem_object_open and vmw_gem_object_open
> implement no-op hooks so no impact for them.
>
> A bunch of other require a deeper look by individual owners to asses for
> impact. Those are lima_gem_object_open, nouveau_gem_object_open,
> panfrost_gem_open, radeon_gem_object_open and virtio_gpu_gem_object_open.
>
> Putting aside the risk assesment of the above, some common scenarios to
> think about are along these lines:
>
> 1)
> Userspace closes a handle by speculatively "guessing" it from a second
> thread.
>
> This results in an unreachable buffer object so, a memory leak.
>
> 2)
> Same as 1), but object is in the process of getting closed (failed
> creation).
>
> The second thread is then able to re-cycle the handle and idr_remove would
> in the first thread would then remove the handle it does not own from the
> idr.
>
> 3)
> Going back to the earlier per driver problem space - individual impact
> assesment of allowing a second thread to access and operate on a partially
> constructed handle / object. (Can something crash? Leak information?)
>
> In terms of identifying when the problem started I will tag some patches
> as references, but not all, if even any, of them actually point to a
> broken state. I am just identifying points at which more opportunity for
> issues to arise was added.

Yes I've looked into this once as well, but couldn't completely solve it 
for some reason.

Give me a day or two to get this tested and all the logic swapped back 
into my head again.

Christian.

>
> References: 304eda32920b ("drm/gem: add hooks to notify driver when object handle is created/destroyed")
> References: ca481c9b2a3a ("drm/gem: implement vma access management")
> References: b39b5394fabc ("drm/gem: Add drm_gem_object_funcs")
> Cc: dri-devel@lists.freedesktop.org
> Cc: Rob Clark <robdclark@chromium.org>
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: David Herrmann <dh.herrmann@gmail.com>
> Cc: Noralf Trønnes <noralf@tronnes.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: lima@lists.freedesktop.org
> Cc: nouveau@lists.freedesktop.org
> Cc: Steven Price <steven.price@arm.com>
> Cc: virtualization@lists.linux-foundation.org
> Cc: spice-devel@lists.freedesktop.org
> Cc: Zack Rusin <zackr@vmware.com>
> ---
>   drivers/gpu/drm/drm_gem.c | 48 +++++++++++++++++++--------------------
>   1 file changed, 24 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index aa15c52ae182..e3d897bca0f2 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -356,52 +356,52 @@ drm_gem_handle_create_tail(struct drm_file *file_priv,
>   			   u32 *handlep)
>   {
>   	struct drm_device *dev = obj->dev;
> -	u32 handle;
>   	int ret;
>   
>   	WARN_ON(!mutex_is_locked(&dev->object_name_lock));
>   	if (obj->handle_count++ == 0)
>   		drm_gem_object_get(obj);
>   
> +	ret = drm_vma_node_allow(&obj->vma_node, file_priv);
> +	if (ret)
> +		goto err_put;
> +
> +	if (obj->funcs->open) {
> +		ret = obj->funcs->open(obj, file_priv);
> +		if (ret)
> +			goto err_revoke;
> +	}
> +
>   	/*
> -	 * Get the user-visible handle using idr.  Preload and perform
> -	 * allocation under our spinlock.
> +	 * Get the user-visible handle using idr as the _last_ step.
> +	 * Preload and perform allocation under our spinlock.
>   	 */
>   	idr_preload(GFP_KERNEL);
>   	spin_lock(&file_priv->table_lock);
> -
>   	ret = idr_alloc(&file_priv->object_idr, obj, 1, 0, GFP_NOWAIT);
> -
>   	spin_unlock(&file_priv->table_lock);
>   	idr_preload_end();
>   
> -	mutex_unlock(&dev->object_name_lock);
>   	if (ret < 0)
> -		goto err_unref;
> -
> -	handle = ret;
> +		goto err_close;
>   
> -	ret = drm_vma_node_allow(&obj->vma_node, file_priv);
> -	if (ret)
> -		goto err_remove;
> +	mutex_unlock(&dev->object_name_lock);
>   
> -	if (obj->funcs->open) {
> -		ret = obj->funcs->open(obj, file_priv);
> -		if (ret)
> -			goto err_revoke;
> -	}
> +	*handlep = ret;
>   
> -	*handlep = handle;
>   	return 0;
>   
> +err_close:
> +	if (obj->funcs->close)
> +		obj->funcs->close(obj, file_priv);
>   err_revoke:
>   	drm_vma_node_revoke(&obj->vma_node, file_priv);
> -err_remove:
> -	spin_lock(&file_priv->table_lock);
> -	idr_remove(&file_priv->object_idr, handle);
> -	spin_unlock(&file_priv->table_lock);
> -err_unref:
> -	drm_gem_object_handle_put_unlocked(obj);
> +err_put:
> +	if (--obj->handle_count == 0)
> +		drm_gem_object_put(obj);
> +
> +	mutex_unlock(&dev->object_name_lock);
> +
>   	return ret;
>   }
>   

