Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12559355000
	for <lists+dri-devel@lfdr.de>; Tue,  6 Apr 2021 11:35:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B05666E372;
	Tue,  6 Apr 2021 09:35:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2080.outbound.protection.outlook.com [40.107.92.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1619589DC7;
 Tue,  6 Apr 2021 09:35:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q1UKIKClD5y5UIM1XQLAhkHeSKNy+Bw2pSPexAebNrHmQvkZNb6MFkk8vnfZEzCaAjS8i1P+vxla5qEqlQz6mpLAjFaftaqz2RPR0HMhPoRs6w67lWhtU7hsVGSfjqDWNb5PwOYSp0TjII2CwqgAyTeJFepTbbYpq/hTPhidOukGkGFtO9oKnQAlTeUmV1t5sLMfX+1gqb78hVG/rR+uM+zIrvqC4YBy1CiRCT0X2/YacR1PMLECJkHwe3w7RvgSsuNq8pwDjd3eKQ1yfkZDWIzJlqMab0toiwt+cCh4eqCvsN5QgEUlOzZnfL7D2jfYWTylISX1l0KRjkw9qyyF7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tZLsd2eitUDnKju24vij6WSjZrsYWvcNQmSK1cddmGw=;
 b=L/sqGPfHonApYa7tDSv+NZMZ7lUsWMRmDnvvx8njrryI7adYOmYiO+x/OGo6ihD5cJYidyrvmTvz+2wyHzDFv0Ilzjdz+RbNH1Byye4Z17VFU/gW7F7Y2zeac8d/HUveKAEahjU49DeiyyRfUkV0SGJ0zSKlAeuxQKXPftmHuUsVGeI3j/0pETuvBeCF4uDoXT1wRfbJ4fb9mKrCgTWIJO+8YpNJLFsSU3GA5JSMm7pu77dTp+vqhEmYysej08Y8wykGz5aGh43m6L0SkEE8dyS7Nyf/ujBDHCp3rc4+rmFeVNAe/lGlHoXJShFKqq+udIgx/29ng8x42DB8cAfxTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tZLsd2eitUDnKju24vij6WSjZrsYWvcNQmSK1cddmGw=;
 b=AoyZvHDmhpNzJsR/G0s0wL7MxXIR1Qpwqo60Y/sLqPKtPw3wNRCUBSjv8m+9mbzZD9YUJiIYdwYtSEleAzMRyRTynxX4FUvyV6kzF3/oCnEJFZgZl0HlUYOtcVHRB435JO23sO9RhOEJh7HTcc70KWuWkir4ILp2EwNOdiy7PPg=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2355.namprd12.prod.outlook.com (2603:10b6:207:3f::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.26; Tue, 6 Apr
 2021 09:35:09 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2%2]) with mapi id 15.20.3999.032; Tue, 6 Apr 2021
 09:35:09 +0000
Subject: Re: [PATCH 3/8] drm/amdgpu: Implement mmap as GEM object function
To: Thomas Zimmermann <tzimmermann@suse.de>, alexander.deucher@amd.com,
 airlied@linux.ie, daniel@ffwll.ch, bskeggs@redhat.com, ray.huang@amd.com,
 linux-graphics-maintainer@vmware.com, sroland@vmware.com, zackr@vmware.com,
 shashank.sharma@amd.com, sam@ravnborg.org, emil.velikov@collabora.com,
 Felix.Kuehling@amd.com, nirmoy.das@amd.com
References: <20210406090903.7019-1-tzimmermann@suse.de>
 <20210406090903.7019-4-tzimmermann@suse.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <6b261dab-4a4d-f0c6-95c0-f720c7df12c1@amd.com>
Date: Tue, 6 Apr 2021 11:35:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210406090903.7019-4-tzimmermann@suse.de>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:8475:9991:cfb3:4162]
X-ClientProxiedBy: FR2P281CA0008.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::18) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:8475:9991:cfb3:4162]
 (2a02:908:1252:fb60:8475:9991:cfb3:4162) by
 FR2P281CA0008.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.8 via Frontend Transport; Tue, 6 Apr 2021 09:35:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 34421ed5-85b5-4fd3-0146-08d8f8df44bb
X-MS-TrafficTypeDiagnostic: BL0PR12MB2355:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB23550A88AEE8BE2116A8C62D83769@BL0PR12MB2355.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N7E3R8SyiPpWlAWAyx4XgkHjDA9l4w5geSmnk7Ryp85Ip0CLz/ZR96xsc8c8RMSpYx4EKlsBNHDftjzbx0e20fvuGG5/bYf9ao66TQ8KjIjtrmwFxzYQx1VCyQiQo/0v1s0/zBtTaAV8Q8q/AVulTbDUTlnFUUgSecIeyTzbJ6Sy9T252BSbx8uJk1ggcRWPMmtLqeiqgTUuJTPsrOKwkmwwZ2q+de1h+n14W10J7W9B8IeoX1KIkle+w7x7eHqxyZZUeqQXVCLX+nSx3JweUrAKmff634xcc5hMWsit3U6x8zN5bmAePhjYxZpC7Cv/Y0e/yUx+dgQ8BvZesp5EQdnyinejeKkrezu1CRPHdhCDhsCDaRYGaUOOCcJwLWTsH7q9D35VmZm8mYcO6Q579MpLMRB/RqW+rhEdKSjK9LeU/uDJulx/H8q/Cf3G8DAY9645j2fkrHmPHfDxg8qDk7BvS6mzQ+sSKQbhNxe4z1TmKtCYrOXs+2KneEYWlQ6jcjenEjrQWTo6CguMyHb2tnpEnXABfch52LLXh7o1bgbRelmjCcKlJzQzXD2GfzT5QPpuInqSI3lRxVHhp9gpWzsKiGlXZP3OqKlgnQTkPPKPzO9jauYslgqOW5+ZQiWtOd+0pfu0Tj2BN+vrWOpmnASiRKCyqbasxqFBqpz0Jj4zS7BpApW1h75Tt0kzd+R850ojYufYAB9O9Qymk7rHLnh2v/uKg+mC9KreQEV+UvS6j3YJaudXykzwvkV9+ZmH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(376002)(396003)(366004)(39860400002)(86362001)(316002)(2616005)(6636002)(66476007)(5660300002)(31686004)(30864003)(478600001)(66556008)(66946007)(2906002)(6666004)(38100700001)(36756003)(8676002)(186003)(7416002)(16526019)(921005)(4326008)(31696002)(52116002)(8936002)(83380400001)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?am1SMUJhb2ZTOElOQ1lNUmRlTy9ENjJjckdJTmxmczlpb2VwSC81M0RPRU01?=
 =?utf-8?B?K3JQQ1FZNW1NZGs3V2dVRGI0dVExV2JxVWd1SDAxcGh2Q2xqUkNvdC84R3Nj?=
 =?utf-8?B?Sm9zcWgwSUdxWUVMQ0hFL0NaNkhsK0hYb3JqSktGUytLcy9xRW5xSzBTY2xG?=
 =?utf-8?B?ekIvTnBTbkc3cFFCWlArYjBoUktINVVLMHNmeW1Vc3NKSXZTZ2JmSjM3QVB4?=
 =?utf-8?B?ZUhEQkh4T1FmSWptUnFOOEptR3FqczdEZXlkU1NMNXNxMjVJcTQ0S3VVM2dK?=
 =?utf-8?B?L3pSSDdHVnVydWtMUGN6RVgrR3VLMXF4V0s2VSs0U2J0VDY0eTN1YkJsT0hu?=
 =?utf-8?B?UXdidGxQZ1hYcXlKQTVXeXd1WjFRVnpTNmR0N2t2dkpWQjhrVGxiQkV4RkIr?=
 =?utf-8?B?SHQrRFJDQTJxeVY5TjgzU041NHJCOUx6OWhGYUZVZHp6UHl0eXlHeThHQXZ2?=
 =?utf-8?B?VXltM3dRWWc4azlpT2RFOGRLU0lTNzIwT0pTdCtxVGROakRsWStOSWJYUExH?=
 =?utf-8?B?em1tc2VFcnNUVGNKeG1QeUVBcW83bCtieVlFZTJlMXQ2M0lvODNHSFFlV2pH?=
 =?utf-8?B?ZTF1UmpTeUVESzZuTmovRGhIbjBDTUJ3bjdvUGJmV1UzKzR0Q01VaXQ5QjJO?=
 =?utf-8?B?ZzNOd3pNN2d5VmRnSjVLSW1ObGVKUklGa0tuLzllempSN1RqQk1lKzIwTzNL?=
 =?utf-8?B?Z1FkZm4yT29tUkFNd2lpVU1IRytJNkkyNitxTk0vazMxYnlBN2tPY2d2aXB1?=
 =?utf-8?B?WE93OTVHL3l6cGxCdG9zM0N6bXdtaE16VEY2R2JZZWdBT1N6WUpWY08zTmI1?=
 =?utf-8?B?MjZCdkVvY2wzN1NuTHAyZzlrUDJYMWJvdGJSY3dsc1hMZUhLek1wWUl2Q09W?=
 =?utf-8?B?bEVLeGxPb09FQUIvZ3BneFR2bUN2NCt5NXkwVmFYVTd6UWVTTXlGRHp0eTdU?=
 =?utf-8?B?TjdnRExweTlTWmF4ODZzbDVkS3gwNVdTK0pHTVlqNlBnYXF2cW1sY2V2VTd5?=
 =?utf-8?B?dlpGZTFSbmJYYzU0Rk1MMjlJRnF1RmxkNTgxcWlvaTlnQ1RaSHllNlJGU000?=
 =?utf-8?B?azB0bW9wV1BQK2xRV0IzOFdwNUp3Y3BLNmhTMVN3Y3dzajRvenBXd25TQ2Vs?=
 =?utf-8?B?QlRaRE1qbksvMXZUSkNkaWdrRmxYajdraDlzYVlxVnhoMFJDdTEvY0tPdmdx?=
 =?utf-8?B?dHhnWXdMNVE1R3ZWS2laVU5UNVY3NWlhU3ZKVUtGdVgzc2txMWhYU0tPTURx?=
 =?utf-8?B?N0dvdVdGZVR6YmFSNmtOVzh2b0VzYzF1TnVPTUZIaDM2NW9IQVdCVUliVTZS?=
 =?utf-8?B?TU1nejFZSWxVakFBZlZlbG1GQUJUem9UVnBOMTNmaDB6dlJuNmswRDRUTGZK?=
 =?utf-8?B?SDZoaGh4b1lzTU1HRmZ3dW1zZHh2OEw2R3Jqa0pPL0M0M0pkUEJLTkczKytL?=
 =?utf-8?B?WGFXc2tUeENQU3d0QW9xWHRFWXpOSnJ6ek15UHJzdTk1U2I5emtrMTdZMXhM?=
 =?utf-8?B?NFZjWkRoNXZua2F2TGhhTGdpQ0V4WTVnOFh1VzlSRmxtZ2pORmRhQU8rU2l0?=
 =?utf-8?B?WUVVejJhZ0lQRkFLVkhNQWswdGVhWWpZL1Fzbm03Zzg3ZGlwUGlFeXZQSVR6?=
 =?utf-8?B?NlNTUVlsSUxJNTFpZ0xQUXdlWExVUEpBSjBJVE16bnBJTFlod24zUFFVeU16?=
 =?utf-8?B?TldpZ0VlWDQ1WU5qNysyaXZoRmJYaFFhVGhiMnB1RE5GaDBsUWhSSDNGV1Y0?=
 =?utf-8?B?WldEdG5pZE0rbjEyaE1zeDFQaUh2c3cyNXArQkN5eEp4YmxnQ0dtaFMxbDlv?=
 =?utf-8?B?bWU3VW9JNUFiVnJ4MjNFUmtTRWd1bVJpTTNOZTVyRDYyNGRQNU5UbDY3NldB?=
 =?utf-8?Q?Qzz0lTOCobogN?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34421ed5-85b5-4fd3-0146-08d8f8df44bb
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2021 09:35:09.2344 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L7E2a+bFTOjuBLCd8YLcx6MXUeHkk439SzdYA4Zoa/GeJNBxUEWIPQ/pyyNWeaE4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2355
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
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 06.04.21 um 11:08 schrieb Thomas Zimmermann:
> Moving the driver-specific mmap code into a GEM object function allows
> for using DRM helpers for various mmap callbacks.
>
> This change resolves several inconsistencies between regular mmap and
> prime-based mmap. The vm_ops field in vma is now set for all mmap'ed
> areas. Previously it way only set for regular mmap calls, prime-based
> mmap used TTM's default vm_ops. The check for kfd_bo has been taken
> from amdgpu_verify_access(), which is not called any longer and has
> been removed.
>
> As a side effect, amdgpu_ttm_vm_ops and amdgpu_ttm_fault() are now
> implemented in amdgpu's GEM code.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c | 46 -------------
>   drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.h |  2 -
>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c     |  4 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c     | 64 +++++++++++++++++++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c     | 71 ---------------------
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h     |  1 -
>   6 files changed, 66 insertions(+), 122 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> index e0c4f7c7f1b9..19c5ab08d9ec 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> @@ -42,52 +42,6 @@
>   #include <linux/pci-p2pdma.h>
>   #include <linux/pm_runtime.h>
>   
> -/**
> - * amdgpu_gem_prime_mmap - &drm_driver.gem_prime_mmap implementation
> - * @obj: GEM BO
> - * @vma: Virtual memory area
> - *
> - * Sets up a userspace mapping of the BO's memory in the given
> - * virtual memory area.
> - *
> - * Returns:
> - * 0 on success or a negative error code on failure.
> - */
> -int amdgpu_gem_prime_mmap(struct drm_gem_object *obj,
> -			  struct vm_area_struct *vma)
> -{
> -	struct amdgpu_bo *bo = gem_to_amdgpu_bo(obj);
> -	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
> -	unsigned asize = amdgpu_bo_size(bo);
> -	int ret;
> -
> -	if (!vma->vm_file)
> -		return -ENODEV;
> -
> -	if (adev == NULL)
> -		return -ENODEV;
> -
> -	/* Check for valid size. */
> -	if (asize < vma->vm_end - vma->vm_start)
> -		return -EINVAL;
> -
> -	if (amdgpu_ttm_tt_get_usermm(bo->tbo.ttm) ||
> -	    (bo->flags & AMDGPU_GEM_CREATE_NO_CPU_ACCESS)) {
> -		return -EPERM;
> -	}
> -	vma->vm_pgoff += amdgpu_bo_mmap_offset(bo) >> PAGE_SHIFT;
> -
> -	/* prime mmap does not need to check access, so allow here */
> -	ret = drm_vma_node_allow(&obj->vma_node, vma->vm_file->private_data);
> -	if (ret)
> -		return ret;
> -
> -	ret = ttm_bo_mmap(vma->vm_file, vma, &adev->mman.bdev);
> -	drm_vma_node_revoke(&obj->vma_node, vma->vm_file->private_data);
> -
> -	return ret;
> -}
> -
>   static int
>   __dma_resv_make_exclusive(struct dma_resv *obj)
>   {
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.h
> index 39b5b9616fd8..3e93b9b407a9 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.h
> @@ -31,8 +31,6 @@ struct drm_gem_object *amdgpu_gem_prime_import(struct drm_device *dev,
>   					    struct dma_buf *dma_buf);
>   bool amdgpu_dmabuf_is_xgmi_accessible(struct amdgpu_device *adev,
>   				      struct amdgpu_bo *bo);
> -int amdgpu_gem_prime_mmap(struct drm_gem_object *obj,
> -			  struct vm_area_struct *vma);
>   
>   extern const struct dma_buf_ops amdgpu_dmabuf_ops;
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> index 76f48f79c70b..e96d2758f4bb 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -1656,7 +1656,7 @@ static const struct file_operations amdgpu_driver_kms_fops = {
>   	.flush = amdgpu_flush,
>   	.release = drm_release,
>   	.unlocked_ioctl = amdgpu_drm_ioctl,
> -	.mmap = amdgpu_mmap,
> +	.mmap = drm_gem_mmap,
>   	.poll = drm_poll,
>   	.read = drm_read,
>   #ifdef CONFIG_COMPAT
> @@ -1719,7 +1719,7 @@ static const struct drm_driver amdgpu_kms_driver = {
>   	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
>   	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
>   	.gem_prime_import = amdgpu_gem_prime_import,
> -	.gem_prime_mmap = amdgpu_gem_prime_mmap,
> +	.gem_prime_mmap = drm_gem_prime_mmap,
>   
>   	.name = DRIVER_NAME,
>   	.desc = DRIVER_DESC,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> index fb7171e5507c..fe93faad05f2 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> @@ -41,6 +41,36 @@
>   
>   static const struct drm_gem_object_funcs amdgpu_gem_object_funcs;
>   
> +static vm_fault_t amdgpu_ttm_fault(struct vm_fault *vmf)

Please name that function amdgpu_gem_fault or amdgpu_gem_object_fault

> +{
> +	struct ttm_buffer_object *bo = vmf->vma->vm_private_data;
> +	vm_fault_t ret;
> +
> +	ret = ttm_bo_vm_reserve(bo, vmf);
> +	if (ret)
> +		return ret;
> +
> +	ret = amdgpu_bo_fault_reserve_notify(bo);
> +	if (ret)
> +		goto unlock;
> +
> +	ret = ttm_bo_vm_fault_reserved(vmf, vmf->vma->vm_page_prot,
> +				       TTM_BO_VM_NUM_PREFAULT, 1);
> +	if (ret == VM_FAULT_RETRY && !(vmf->flags & FAULT_FLAG_RETRY_NOWAIT))
> +		return ret;
> +
> +unlock:
> +	dma_resv_unlock(bo->base.resv);
> +	return ret;
> +}
> +
> +static const struct vm_operations_struct amdgpu_ttm_vm_ops = {
> +	.fault = amdgpu_ttm_fault,
> +	.open = ttm_bo_vm_open,
> +	.close = ttm_bo_vm_close,
> +	.access = ttm_bo_vm_access
> +};
> +
>   static void amdgpu_gem_object_free(struct drm_gem_object *gobj)
>   {
>   	struct amdgpu_bo *robj = gem_to_amdgpu_bo(gobj);
> @@ -201,6 +231,38 @@ static void amdgpu_gem_object_close(struct drm_gem_object *obj,
>   	ttm_eu_backoff_reservation(&ticket, &list);
>   }
>   
> +static int amdgpu_gem_prime_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
> +{
> +	struct amdgpu_bo *bo = gem_to_amdgpu_bo(obj);
> +	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
> +	unsigned long asize = amdgpu_bo_size(bo);
> +
> +	if (!vma->vm_file)
> +		return -ENODEV;
> +
> +	if (!adev)
> +		return -ENODEV;
> +
> +	/* Check for valid size. */
> +	if (asize < vma->vm_end - vma->vm_start)
> +		return -EINVAL;

> +
> +	/*
> +	 * Don't verify access for KFD BOs. They don't have a GEM
> +	 * object associated with them.
> +	 */
> +	if (bo->kfd_bo)
> +		goto out;

Who does the access verification now?

Christian.

> +
> +	if (amdgpu_ttm_tt_get_usermm(bo->tbo.ttm) ||
> +	    (bo->flags & AMDGPU_GEM_CREATE_NO_CPU_ACCESS)) {
> +		return -EPERM;
> +	}
> +
> +out:
> +	return drm_gem_ttm_mmap(obj, vma);
> +}
> +
>   static const struct drm_gem_object_funcs amdgpu_gem_object_funcs = {
>   	.free = amdgpu_gem_object_free,
>   	.open = amdgpu_gem_object_open,
> @@ -208,6 +270,8 @@ static const struct drm_gem_object_funcs amdgpu_gem_object_funcs = {
>   	.export = amdgpu_gem_prime_export,
>   	.vmap = drm_gem_ttm_vmap,
>   	.vunmap = drm_gem_ttm_vunmap,
> +	.mmap = amdgpu_gem_prime_mmap,
> +	.vm_ops = &amdgpu_ttm_vm_ops,
>   };
>   
>   /*
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index 1c6131489a85..d9de91a517c6 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -152,32 +152,6 @@ static void amdgpu_evict_flags(struct ttm_buffer_object *bo,
>   	*placement = abo->placement;
>   }
>   
> -/**
> - * amdgpu_verify_access - Verify access for a mmap call
> - *
> - * @bo:	The buffer object to map
> - * @filp: The file pointer from the process performing the mmap
> - *
> - * This is called by ttm_bo_mmap() to verify whether a process
> - * has the right to mmap a BO to their process space.
> - */
> -static int amdgpu_verify_access(struct ttm_buffer_object *bo, struct file *filp)
> -{
> -	struct amdgpu_bo *abo = ttm_to_amdgpu_bo(bo);
> -
> -	/*
> -	 * Don't verify access for KFD BOs. They don't have a GEM
> -	 * object associated with them.
> -	 */
> -	if (abo->kfd_bo)
> -		return 0;
> -
> -	if (amdgpu_ttm_tt_get_usermm(bo->ttm))
> -		return -EPERM;
> -	return drm_vma_node_verify_access(&abo->tbo.base.vma_node,
> -					  filp->private_data);
> -}
> -
>   /**
>    * amdgpu_ttm_map_buffer - Map memory into the GART windows
>    * @bo: buffer object to map
> @@ -1531,7 +1505,6 @@ static struct ttm_device_funcs amdgpu_bo_driver = {
>   	.eviction_valuable = amdgpu_ttm_bo_eviction_valuable,
>   	.evict_flags = &amdgpu_evict_flags,
>   	.move = &amdgpu_bo_move,
> -	.verify_access = &amdgpu_verify_access,
>   	.delete_mem_notify = &amdgpu_bo_delete_mem_notify,
>   	.release_notify = &amdgpu_bo_release_notify,
>   	.io_mem_reserve = &amdgpu_ttm_io_mem_reserve,
> @@ -1906,50 +1879,6 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
>   	adev->mman.buffer_funcs_enabled = enable;
>   }
>   
> -static vm_fault_t amdgpu_ttm_fault(struct vm_fault *vmf)
> -{
> -	struct ttm_buffer_object *bo = vmf->vma->vm_private_data;
> -	vm_fault_t ret;
> -
> -	ret = ttm_bo_vm_reserve(bo, vmf);
> -	if (ret)
> -		return ret;
> -
> -	ret = amdgpu_bo_fault_reserve_notify(bo);
> -	if (ret)
> -		goto unlock;
> -
> -	ret = ttm_bo_vm_fault_reserved(vmf, vmf->vma->vm_page_prot,
> -				       TTM_BO_VM_NUM_PREFAULT, 1);
> -	if (ret == VM_FAULT_RETRY && !(vmf->flags & FAULT_FLAG_RETRY_NOWAIT))
> -		return ret;
> -
> -unlock:
> -	dma_resv_unlock(bo->base.resv);
> -	return ret;
> -}
> -
> -static const struct vm_operations_struct amdgpu_ttm_vm_ops = {
> -	.fault = amdgpu_ttm_fault,
> -	.open = ttm_bo_vm_open,
> -	.close = ttm_bo_vm_close,
> -	.access = ttm_bo_vm_access
> -};
> -
> -int amdgpu_mmap(struct file *filp, struct vm_area_struct *vma)
> -{
> -	struct drm_file *file_priv = filp->private_data;
> -	struct amdgpu_device *adev = drm_to_adev(file_priv->minor->dev);
> -	int r;
> -
> -	r = ttm_bo_mmap(filp, vma, &adev->mman.bdev);
> -	if (unlikely(r != 0))
> -		return r;
> -
> -	vma->vm_ops = &amdgpu_ttm_vm_ops;
> -	return 0;
> -}
> -
>   int amdgpu_copy_buffer(struct amdgpu_ring *ring, uint64_t src_offset,
>   		       uint64_t dst_offset, uint32_t byte_count,
>   		       struct dma_resv *resv,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> index dec0db8b0b13..6e51faad7371 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> @@ -146,7 +146,6 @@ int amdgpu_fill_buffer(struct amdgpu_bo *bo,
>   			struct dma_resv *resv,
>   			struct dma_fence **fence);
>   
> -int amdgpu_mmap(struct file *filp, struct vm_area_struct *vma);
>   int amdgpu_ttm_alloc_gart(struct ttm_buffer_object *bo);
>   int amdgpu_ttm_recover_gart(struct ttm_buffer_object *tbo);
>   uint64_t amdgpu_ttm_domain_start(struct amdgpu_device *adev, uint32_t type);

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
