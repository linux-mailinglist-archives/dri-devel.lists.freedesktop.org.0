Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB083B2BFD
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 11:57:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5C5B6EA61;
	Thu, 24 Jun 2021 09:57:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2073.outbound.protection.outlook.com [40.107.243.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94EB26EA61
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 09:57:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AyhhX7PqlXiaqSgH/bZm49kg/znt0Wf1Kln8osTeisXor+vH4hCytqRTNNjERlUtihWAkqxdmEhn4B8jYyogw+xtgsbpZg6MytGxcZTAEsXsK5wXNxXSv0A9v3MAxNq42q/LgfPrVHuADyxxtkSNc6BCnb1rqI/kQwWTTmpnqASMnUPgFRrZY4fYFAnfzo2Qy5OxtPdJ++8J3Qy2oWoCDov8W7mfwtVR6G49c6wAsBR5+IwcwXup/DmseP8Op+ASL4I1Y1mOm3EonVEqE2r/Ir+FH6OkDIpBdq8d+EZcL9CY+0Oa0dLHBkIXZflJS+1FRALXaBTAnboLHpLyLIurTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fxPDU1eRsTFt15NTEWovmyLZKUUK0KJE0rLeVybS9Q8=;
 b=j0poWBr0vN5V6+LEY1SOk6jOdsYmNWAUfvLV+eoohYRzEJX8bZMrZ+68b1da6Ry4Y1dEHWP4noKBAedW9wmhwVUxj42BZv8UJeGt5j+XKrrDhgn+RuNbfA0CQ4yOw5RWvO8wkODBjoOW5H80HMpaWFjptk9uqAI23VJLV9VWl+EwS44kirG7N/40OvSYtitNbJ5pit/7dVwi1vBO5jvzrl8mbvY1g5ZXct9tQmEmVz1Z/+4HjS43vZYSoZmNpsr2ALy9GwhPcwjMiN5VW8vSz3Ke0BcfNtoJYf2tP0Yvp5lUJKZisTIZ2bXVp35mdrUdVbxeLd4TPML4X1fpqM7ydw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fxPDU1eRsTFt15NTEWovmyLZKUUK0KJE0rLeVybS9Q8=;
 b=16W8STdvdthF9o9atdmRrpbK0hw98cvIys5nsxia/tlWj3pKWI2+gzrAYPgvvEIKY/ufHVi/PTYdihfLmYGywBRKWqAQw3DdJ9Wwr0QfYAZP2IuHCX3lW0ouZr5WW5dth8TA1Y/Tz4u+aqKPUC+3CUJ5NxlkG+J3lFWLf2BEzEs=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2451.namprd12.prod.outlook.com (2603:10b6:207:4e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Thu, 24 Jun
 2021 09:57:14 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4264.020; Thu, 24 Jun 2021
 09:57:14 +0000
Subject: Re: [PATCH] drm/vgem: Implement mmap as GEM object function
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@linux.ie,
 daniel@ffwll.ch, melissa.srw@gmail.com, jgg@ziepe.ca, lee.jones@linaro.org,
 chris@chris-wilson.co.uk
References: <20210624095238.8804-1-tzimmermann@suse.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <ace86874-d4a1-cfcf-d47c-51e98a50ad26@amd.com>
Date: Thu, 24 Jun 2021 11:57:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210624095238.8804-1-tzimmermann@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:1b1b:b0cf:e32b:2813]
X-ClientProxiedBy: AM0PR04CA0028.eurprd04.prod.outlook.com
 (2603:10a6:208:122::41) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:1b1b:b0cf:e32b:2813]
 (2a02:908:1252:fb60:1b1b:b0cf:e32b:2813) by
 AM0PR04CA0028.eurprd04.prod.outlook.com (2603:10a6:208:122::41) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.20 via Frontend
 Transport; Thu, 24 Jun 2021 09:57:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9f8d42ec-b141-4c0f-ec07-08d936f67125
X-MS-TrafficTypeDiagnostic: BL0PR12MB2451:
X-Microsoft-Antispam-PRVS: <BL0PR12MB2451346CB75E08F88AFB6D9383079@BL0PR12MB2451.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 64sF1kfNCgavsvHdVsEs9KlBA9kblTrCj4I4RTkPA37jRp27r0lr/qvF4INXYamp3PwOmYPwesGkRgsLoEIrJdsQYYTE9apgJzKyEuvGAfyaVfxcvk7Zy1T4RZ8vjRZZpiFwXRpIfQIk3J0mlKLKmqgFsysP/5psJkXwJsfzcvZNFGVpJaSXdm2Nc0BaTPQzGQifgODzpPB1Zt/MHh8A0hcyZ7CdaSY/RnolaEQfl2PM/NWKzUcpkcZk4Q89dhu8GsxYK9mhE/u5C8tedFV5VAoVERP2IKIIV3FLB0w0GQPtKlIgNdRbRPoYnsGS8CEY5ex4glRLWkMcHN6BTN2PZ3pE+I7/fFmsm9nGnDF9vOTCnNMR5+JhTGT73VK//eRS/2uuKIyPals3RNJsjGDe+ZkzwLWjeZew2bZCIqalzdYgM/vkKFtpl5/1LC1/d3+vdnGk756Mf+yqN//s9wDXFUYgR0IN71diRIzmNd0Ea6caruOhi3u7ZEDRHODdciUQx1lyMXuYCkAgkA9lArV+yJgSz4B1EUdsNb6XBKMwl9uerJeeHpoVEgZMntueheVglVaUMbpRgOde4gsHsc9ZG2hdmlWjCzDucR5nfHU+g2xRWDJk3b7Ctv4Hco+c24MzjKlLI/cQplZNWzWCMAky0qvYmSjktO5lZLdUl52ZQGKfXjVDMQdXfMPfeTR+RAg3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(366004)(39860400002)(376002)(396003)(4326008)(2616005)(31696002)(186003)(38100700002)(2906002)(6486002)(478600001)(316002)(5660300002)(83380400001)(66946007)(86362001)(66574015)(66556008)(66476007)(8936002)(31686004)(6666004)(36756003)(8676002)(16526019)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q1NGdmNmT2MrY1JwN0tTUTdnd2F1a25VYkUrUDZWVHdzRmlSeE9OZDBvRERu?=
 =?utf-8?B?NVk4RG9qVnhxam5OOGhhNkcrUHJzRVUxZjllbGxyUzZCSjl0UURlOUxSNjh2?=
 =?utf-8?B?aG9zMG9OZEJnbXl1ZkQzRU9lMXNRcjNwT1crSThsbFYxRlMxQWNVTXNUMEsz?=
 =?utf-8?B?c3VFVHN5L0I0RWVabWNVeW9DR1JkRHc0TkRES1NFSU9QU2xWM2hDd25KWEJr?=
 =?utf-8?B?dVNZWTR2VkdvMCsxaFN2MUV6VVYwOEIvR3lYdXpVTTJGbXZlKzdHdi90RWFQ?=
 =?utf-8?B?aVc3SUZkbElZT09tWmkwRThBeE16ZjcvRFRPNmd4V0pCeHRIWDVvSXBrMFJp?=
 =?utf-8?B?ODBBd0o3WEJwWlN0RFNtcnBHcUpXbHAwYTY2UmcySmdIZ3MxMkxLdTRPNWxS?=
 =?utf-8?B?QStQUHpiUjR5dDBCSHRvWlpUdmZhZmlvVUVtalNMUjJNMEtUNUtDSEMzaE5a?=
 =?utf-8?B?ekQxbmhlZUFTOE8wNFk0cFFJVjhma2VGTUs0QVJkNjFIMjNmcHdVdGlPRWd2?=
 =?utf-8?B?VXpENVFLdWxSZkFIUGZhMVEzdTJOM1k0OHJOWVJPNGJQYnQ2VUUwb2kvZHB6?=
 =?utf-8?B?bDFjQnlGZDJBUzBFandDa2srbTBlM2hZdXFCcm1vbXMvemQyZnd3ZmF4dlJE?=
 =?utf-8?B?VzVtYlMySnJpSlFaUG5xWFlxak1obmN0RnJZWnZUcEk2SVV2NUVMUGIzK1lZ?=
 =?utf-8?B?RytvUGJrRDNIRWxlRkpvUTRHZTZhRjFuT1dVVldvWjlFV3IwMTVyWFg3aFRi?=
 =?utf-8?B?Zm52K3RjOXkyK2xzb0JsWnZwQUpMVVFQblI1TEt4V3B6SithY0lUMEE1U2RL?=
 =?utf-8?B?SzVTUEZpMlJqZmFOY0RlN051aXRyU1ZzUHJlZW00cFJHNUtTNUhWN3p4dVpP?=
 =?utf-8?B?MU54VXJtZkQ0YnA0aWl3VGEwSnp0TCsyUDExNDVTR2NVbHRTdSs3d0tXZi85?=
 =?utf-8?B?dmE3ajE0NEtGZmIvL0FYV1lTcWJFSVoxQWlWcDBnL0ltTnpvOEU3OEl5WGxy?=
 =?utf-8?B?Rm9zMDBsWnVQVlNqQWdtT0M3R0k1dmNBelFua3BsbVV0aHNpRXA5THlPVzNN?=
 =?utf-8?B?VTlGVFRvUHExdG5jbXNFYlp1OUNaV1JUYkJ4c1dTOGpJemZsemtRMDJobmR4?=
 =?utf-8?B?N2xMVjNjSXI3TUJrL283VFRtUWsrNTNueG80UXNsSzNXOGhpdlJNcVp6OHRX?=
 =?utf-8?B?T2JjeDJIUmZ2RElJUzlGOUgvTUFSd0plb1AxZURBNVpjK1BiNVRHS21DSm4r?=
 =?utf-8?B?RFd6aCt1Z1BGQWZpZU9uTWMycU90VFZ2dFdtcTlxbjhhVlRUTHVVTDJjYUNR?=
 =?utf-8?B?OFpONWNVSkU2TS9kNXJIRFBEQ0dOcDNuOGdNK1RIN3VySnpLR2NhamRaQVp1?=
 =?utf-8?B?MmI3em9uVGxSQ2kzRGV0TG9YWnF4aDR4bGhmZVArUEZjR1JsNnhuUHRYVWlB?=
 =?utf-8?B?TFZueWRCK3Q3Wkd0WjFkaGkrUnFyNUNCWTZDQWtVRkhraWZETFNnV3Exd2J5?=
 =?utf-8?B?ajE0cG9RbU5UMzZMQ3dRU3dVZnUwVW1VbkRtNkxsTDJVNHhzWlZIWUptZjl0?=
 =?utf-8?B?cEpoblRhZVVNYk1haDF6TElYQ1NSaS93U1IxcUxQV3NXcEt1WnVqQW1ZVGhl?=
 =?utf-8?B?Z2xBR0tibHVZU2x1NlRoSFpIdmZwdFkxaHFCOGt5YS9sKzZOeEdISmZxally?=
 =?utf-8?B?WlFVVndnTUo0TTg4Y1FKSXcxYmJFZnNKNGcwWHpYck9vQzRESTNabDhjUGdh?=
 =?utf-8?B?cnJYaGdFU2NaZ2VEZm9ScXYrN0VDSTRZWUVsYnU2bjBvNmpOVVJKSjEvNDMr?=
 =?utf-8?B?OFVyM01xamFVclNJQTU4eWV6VHhabnpaUCs1RmR6bm9XRVEwenhDRUVRTGM4?=
 =?utf-8?Q?RtaBMifClaK2R?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f8d42ec-b141-4c0f-ec07-08d936f67125
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2021 09:57:13.9770 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n0NZAWF4kgiBFM4LYp9KXbBI6PbcYKglVjb9XOMa8TQa/rZiF1idKE4Zi61EtGCY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2451
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 24.06.21 um 11:52 schrieb Thomas Zimmermann:
> Moving the driver-specific mmap code into a GEM object function allows
> for using DRM helpers for various mmap callbacks.
>
> The respective vgem functions are being removed. The file_operations
> structure vgem_driver_fops is now being created by the helper macro
> DEFINE_DRM_GEM_FOPS().
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Acked-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/vgem/vgem_drv.c | 46 ++++-----------------------------
>   1 file changed, 5 insertions(+), 41 deletions(-)
>
> diff --git a/drivers/gpu/drm/vgem/vgem_drv.c b/drivers/gpu/drm/vgem/vgem_drv.c
> index bf38a7e319d1..df634aa52638 100644
> --- a/drivers/gpu/drm/vgem/vgem_drv.c
> +++ b/drivers/gpu/drm/vgem/vgem_drv.c
> @@ -239,32 +239,7 @@ static struct drm_ioctl_desc vgem_ioctls[] = {
>   	DRM_IOCTL_DEF_DRV(VGEM_FENCE_SIGNAL, vgem_fence_signal_ioctl, DRM_RENDER_ALLOW),
>   };
>   
> -static int vgem_mmap(struct file *filp, struct vm_area_struct *vma)
> -{
> -	unsigned long flags = vma->vm_flags;
> -	int ret;
> -
> -	ret = drm_gem_mmap(filp, vma);
> -	if (ret)
> -		return ret;
> -
> -	/* Keep the WC mmaping set by drm_gem_mmap() but our pages
> -	 * are ordinary and not special.
> -	 */
> -	vma->vm_flags = flags | VM_DONTEXPAND | VM_DONTDUMP;
> -	return 0;
> -}
> -
> -static const struct file_operations vgem_driver_fops = {
> -	.owner		= THIS_MODULE,
> -	.open		= drm_open,
> -	.mmap		= vgem_mmap,
> -	.poll		= drm_poll,
> -	.read		= drm_read,
> -	.unlocked_ioctl = drm_ioctl,
> -	.compat_ioctl	= drm_compat_ioctl,
> -	.release	= drm_release,
> -};
> +DEFINE_DRM_GEM_FOPS(vgem_driver_fops);
>   
>   static struct page **vgem_pin_pages(struct drm_vgem_gem_object *bo)
>   {
> @@ -387,24 +362,12 @@ static void vgem_prime_vunmap(struct drm_gem_object *obj, struct dma_buf_map *ma
>   	vgem_unpin_pages(bo);
>   }
>   
> -static int vgem_prime_mmap(struct drm_gem_object *obj,
> -			   struct vm_area_struct *vma)
> +static int vgem_prime_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
>   {
> -	int ret;
> -
> -	if (obj->size < vma->vm_end - vma->vm_start)
> -		return -EINVAL;
> -
> -	if (!obj->filp)
> -		return -ENODEV;
> -
> -	ret = call_mmap(obj->filp, vma);
> -	if (ret)
> -		return ret;
> -
>   	vma_set_file(vma, obj->filp);
>   	vma->vm_flags |= VM_DONTEXPAND | VM_DONTDUMP;
>   	vma->vm_page_prot = pgprot_writecombine(vm_get_page_prot(vma->vm_flags));
> +	vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
>   
>   	return 0;
>   }
> @@ -416,6 +379,7 @@ static const struct drm_gem_object_funcs vgem_gem_object_funcs = {
>   	.get_sg_table = vgem_prime_get_sg_table,
>   	.vmap = vgem_prime_vmap,
>   	.vunmap = vgem_prime_vunmap,
> +	.mmap = vgem_prime_mmap,
>   	.vm_ops = &vgem_gem_vm_ops,
>   };
>   
> @@ -433,7 +397,7 @@ static const struct drm_driver vgem_driver = {
>   	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
>   	.gem_prime_import = vgem_prime_import,
>   	.gem_prime_import_sg_table = vgem_prime_import_sg_table,
> -	.gem_prime_mmap = vgem_prime_mmap,
> +	.gem_prime_mmap = drm_gem_prime_mmap,
>   
>   	.name	= DRIVER_NAME,
>   	.desc	= DRIVER_DESC,

