Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E287C58CD50
	for <lists+dri-devel@lfdr.de>; Mon,  8 Aug 2022 20:05:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 537B810E613;
	Mon,  8 Aug 2022 18:05:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2040.outbound.protection.outlook.com [40.107.96.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09CA110F41F
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Aug 2022 18:05:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SBEZt6nn4cpTE3+AGm+pprExTK2F0Z+HTGWRwEwYJgUBV4/sW2i/fiYqI6rXe8ghhtT5AX9mw2QBL5NWPWwdOuXh7g+3QFYWVufYkPm0di8JqnYvxYKr4KKGzrHTubNhIeI4gt6pffnuyjQ/Es8x37WHbO67C1KTywv2mfH8UCyU1q+Ac2MfP+DE5ny7SYZgJitGR4ejfjdvCLnOIP87mcm+HVE/lMRp0Lpr7LnLsALo0nxf7/d07W5O1hdmdE5Dx6GhGsHCrg++Q+i1Zpgk1PQ7zNT8UnnjiG4JZ+dq46WCWt0LseEEoLChOZoW8SkIOPDqcR9zyfMvujJ3aOsgGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R6FkB9ekmUfKCREGZhpTKoByUPpPg5vjq1ioCPwv05o=;
 b=BbPv7DyQ70wF1bzbnz5aOHgUhGlXzgBaOvwCO2DVqr1pAQqOJIRB5RzqwZcU5GWGpbL1mtEbR0uDSdnDQ6l07cdHiqELRFB9Ha/VH0F5Qw4ewYbfanrHKFuxW2VTs2d8BBBVDHh6Bb9iWs7ocIzK+qMtnqkjj2ee/LAvqLb7oCc0ucG+5aqlbrsEULzBLjtrBL6rLL3Ew8ptzw4HiqpSncJhjr1Tlanc1hZxccFNyM1OnMSvcc2jzJpSw+G1tAZPcnSgsI3RSopj0PEQSWbmj0DOJWvByu3WPJCJrJxWc+Nt2jHZhj/apa+YQqVLeeArNNDccIiU5ShYbpnYTkLPBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R6FkB9ekmUfKCREGZhpTKoByUPpPg5vjq1ioCPwv05o=;
 b=o94sPc+LW3WPm+eWVYBB55HisY4ZNn84z9boO084xD3ZcySAr0znrJX35CKwIh5EqhzBKRqy3xNEhTaKz5W9aQTVVMlGra7WF8nIOuJTVGEWIxIYO/jgYUSBYRmyBvl5OWCrgopL3J/dapy/2VfOo/WQ7BXrgUFSBVlv4ksUk2M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MN2PR12MB2878.namprd12.prod.outlook.com (2603:10b6:208:aa::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Mon, 8 Aug
 2022 18:05:10 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39%2]) with mapi id 15.20.5504.020; Mon, 8 Aug 2022
 18:05:10 +0000
Message-ID: <61e6fd7e-fde7-19ae-0e31-0ad8013d0e48@amd.com>
Date: Mon, 8 Aug 2022 20:05:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] drm/gem: Fix GEM handle release errors
Content-Language: en-US
To: Jeffy Chen <jeffy.chen@rock-chips.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
References: <20220802113316.18340-1-jeffy.chen@rock-chips.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220802113316.18340-1-jeffy.chen@rock-chips.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0144.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::19) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5d959739-3d0a-468c-9b05-08da7968884b
X-MS-TrafficTypeDiagnostic: MN2PR12MB2878:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GtDPoEEtW237/k6IZOf3HUbz+2tno+U73L2IDT7Ewf+yC4MyTp2au+qlIu+VP2ok9iI9tRoGr0Av35FN7CjkDsnIBKBDmedWZ2UyRFVsA4f/SyfMR/XINpEnRUDxeDUiDE+EDl3Zni3fJpbg9AKCYULWEkjDGKEbQz5Ry0sht93I/nBzQT7wSKYs1LAZnF91iGgPK/ULvQ4c30nb5goOOXAFYeJq3Lxwdr1CNHEm0TfTyTgXOfnvzlesAT60KHzlxOQbLIEIIEQ0YJcHewDzGVm9Uat0Fv1vXJnTxNQBYFPk+EMsTBdHG1CkXJ2AE9fgLFqISv8I8GouOrwWhviNKNFM+kgmOUi4r+Me5eVbyKvNhRAnqYfeU6bExWJ390o0skf4Cd/wYBJP3iZjkJ2G+NllYU02iAC5nPnsKwDDA75fPKWpQUoKKYjaX4aqCLm6ewAQlDEb3iQdfgQ0TISr4tHlU9yYcMoXHPm0RROYnJ7W5d4/z4etH6rglw2g9f2D7tr7BGc67cRuXQJthfOYhI7Z1Qf7CxHm/wmaOrI8JBKEEE8K4fUm3z6JzOjTW6BV+Fb72Dfu4N1g7j9hSl7UxsfeBQp72haMfSijs9zbGbrlclEkIfenKiZMfMynVwBEmgYkRnktD/TwtdinoDzcZICysZlcbfXDiX0Qb/DEBtvz9Lv36GPhjwTJnHScmcPanUCyPU+XEUcQLLsiJV4ijLI8fd6IsUX/Z1ip2x1u0KL7SMAvckoqOc1H1RMxdZt6k5MvsGSCho1LaP95FfUuebU5unzuDw7I/QH21XoIwOVl8nD+RHzUMQYiUy5UOvuN13BXc/QdanSt3tmMDwLZ/fW2kvOarTOlc6OslYJDupIJuJ3ky0V5yAdpGqsVaM/h
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(39860400002)(366004)(376002)(396003)(136003)(110136005)(54906003)(8676002)(5660300002)(41300700001)(2616005)(66476007)(478600001)(86362001)(31696002)(36756003)(31686004)(186003)(316002)(4326008)(7416002)(8936002)(6506007)(6666004)(6512007)(66556008)(66946007)(2906002)(38100700002)(83380400001)(6486002)(966005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dEtKWWlZRFhPQmJtdG04NjRKS3pMdUo1OWFuNmFwdFM2QW9XT0FGb1oxYngy?=
 =?utf-8?B?a0ttd3owdFJ0cVlOSVVmYlNrVWJ5ayt0OFVzelFNeHp1OFRSd0tJT1BrL3NI?=
 =?utf-8?B?dm1GZ1l3V3VHc3FDR0kxa0xtbUh3WjFDcmJSbC9nbEtoMVlBOTZldW5oamcz?=
 =?utf-8?B?cEExMER4bVlhbHp0QXBqSGY5MU44VTMzUFlGUDU1SWYzbmVXdDAvS1Z2d0xz?=
 =?utf-8?B?ODN1NUtnMFR1aWg4b3BPQVdVMnRUQjhEdndDanMxcldCVWVNTUdHUjR3N1hl?=
 =?utf-8?B?dHBUczlUUDdDNFIrNEFpNlI2RDJsUGwvRXZndHdoTEpXWGE0Y0NNaVhuNlVs?=
 =?utf-8?B?TmhXVlFXejVUYkE0eXQvVzZYLzdTbFhlRlJRcUxXUEtkM1hZU0hZWEJnS2NS?=
 =?utf-8?B?SWhjaCsxZ0xFeXBId3pKOXhoTmJCMFZ5Tnh1Ui9NM1FFVWRmWFBwUzA4ZFN4?=
 =?utf-8?B?b3kvdEl4QXVmb2NMc1dWM245YXBWdjRDbXZPZ0ZCVTRSZDR5WWw2d0Q4Y09N?=
 =?utf-8?B?VXFFMDU5SVJSdDlBYWFKM0Jld1IyQjNWTXlmOG9vYUVmY2wveEhJbFRUbDhV?=
 =?utf-8?B?N3NjWkdySjl2TFI4SWZxd1BGYmVoYUJHTDYyRW1UZkZoSDk3ZE1hdVg0ZitU?=
 =?utf-8?B?cFV1ek9DbE1laWUxdXJnU000d3pWYzViNUk4bjI3NlBCVmtWSjNUeFZDdVJG?=
 =?utf-8?B?eHJQYkNSdk16TURMSGViQlgxckgzSjNRcm82VkJnSnRCbU82TjczWnFrZTIz?=
 =?utf-8?B?STJ1VEJhRnZadzhMWVJ4amltL0hOZWo5UFFUMjhhbW5CbEh4N29EbTFSZlNI?=
 =?utf-8?B?QkllaG5kODhDQm1pWFU0TzJjYk1nVlgzeGtIb0ZYRnZQdXZjTTBzdkJtUEVY?=
 =?utf-8?B?U0NxWEN6czcwSnRYS0gxczY1bGhGdkF1UzUwTldUeFZ1N1E1c0p6TUt1aWpo?=
 =?utf-8?B?WVlCK282c0pabHJqVjlhTFVXRDVibTc3TWxxVEYxYkMxWXAycUc5OTlLb24x?=
 =?utf-8?B?ZjZZM2UzTVkwSkhNMVgzQzBlZy9YNkpJSXRtZ0dpa2pvTjRLa3F3UVQrY2d4?=
 =?utf-8?B?OXVlZmVVMUNHY0xVWUltTjlJeFN4dUwvYUJQSUZzYW4waWM5UUFpUmZZcHRR?=
 =?utf-8?B?VTFpM3B0K090eVMwWkRmbjZlRU11Y2FucnZIQVVDR1ZJSStOdE9yQ09aeTNR?=
 =?utf-8?B?RVRZMVI2TzMyL3ZqeWh6T3JROENsU0psa1FXY2RXWkV3VWpnVC9zWDBsdUhz?=
 =?utf-8?B?U3J6VTgzWm5udTlPN0F0OVhYK3R3dTZ1WXFLYmkxRmlweDhRKzRpUlUydG40?=
 =?utf-8?B?dWVTNWZUQTFhT05HODlJczBjVVByYXoxc1Z6UXo0NkExQS9zT1Y4enZyaUhp?=
 =?utf-8?B?a281aTBHeUNKaVFSM3FXeW1SdFkrdk5Ua2s5bnNJVUE5TXBKR0RCbnFKSi9Q?=
 =?utf-8?B?a3lyTjlDcjBzdmE1T01SSVJtSVV3d3RMNFZPUmVRNk02cWp6bGNjYis5Yzdx?=
 =?utf-8?B?UnpXNnR0c1VKOXlpaGN0V21IOXFCYWNuVEE1bElTcGNRdmFGVTdqRG0yMThi?=
 =?utf-8?B?QzU2c0ZHbm8rQ3hOK2k5TzUyUmxSWW4rZG9aTzBmRm90eEhRc3RpOEtuQURp?=
 =?utf-8?B?alZhZTA5eUFVSzFzZ3RYbWlsSVFneE1hWmpReUxJUkxnd3ZVaXJ0cjZkVzdO?=
 =?utf-8?B?RFVmb1p0TVZ1Uk9uVWRaSlFMTDJNSUN2Y1QxbHRPUUtVcll2dnhJdmN6OVFO?=
 =?utf-8?B?T1ZlM0krbitpRk1rTUxSVzRwYXhucVZsR3FZMEFad25neU83bmhsVm04aDlZ?=
 =?utf-8?B?ZHVxUlo1YW14MzFXZk5IUUY4WXBrbk15bmJZNzU4Zzl4cGVvNUtrN1RYU0xh?=
 =?utf-8?B?MHk1ZVJ4RE9NWVg1STZQZTRqTFU0QkFpUXBNSUxiN2J5S01VZnNyYTkvMDNq?=
 =?utf-8?B?OHcvQndLVFVkTndERUdoc1JIaUd4VVphcC96UUJLcy9IK3RrSWhxRk1ZZ3Za?=
 =?utf-8?B?cmZ6aERKckQ5SzJQcXl2L1FuQlB5WVkyNHRzVVNkSzl3a2doLzlVVzNZbkpk?=
 =?utf-8?B?NjUwclNSVUNrK29rZUU2NzZRQXJmNXdFbTNCYjEwelQxbytKTlFkaHF3QWFS?=
 =?utf-8?B?ZmtrWHdqd3dYZlI1MWxtSjZka2tuRGtKeDRNUzM5b29NT1oxbFBXeEpjWlpE?=
 =?utf-8?Q?eQMs95v1MRcomIGDcCzcORKMjGU7682pBVL12i8fCwz5?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d959739-3d0a-468c-9b05-08da7968884b
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2022 18:05:10.3124 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iF5VRBMAofhUvc9hmYaYdPXyHYuEixaVMuBWIGlVlpKUVvGkH3spYLuuHYuKQEGu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2878
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Andy Yan <andy.yan@rock-chips.com>,
 Jianqun Xu <jay.xu@rock-chips.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 02.08.22 um 13:33 schrieb Jeffy Chen:
> Currently we are assuming a one to one mapping between dmabuf and handle
> when releasing GEM handles.
>
> But that is not always true, since we would create extra handles for the
> GEM obj in cases like gem_open() and getfb{,2}().
>
> A similar issue was reported at:
> https://lore.kernel.org/all/20211105083308.392156-1-jay.xu@rock-chips.com/
>
> Another problem is that the drm_gem_remove_prime_handles() now only
> remove handle to the exported dmabuf (gem_obj->dma_buf), so the imported
> ones would leak:
> WARNING: CPU: 2 PID: 236 at drivers/gpu/drm/drm_prime.c:228 drm_prime_destroy_file_private+0x18/0x24
>
> Let's fix these by using handle to find the exact map to remove.
>
> Signed-off-by: Jeffy Chen <jeffy.chen@rock-chips.com>
> ---
>
>   drivers/gpu/drm/drm_gem.c      | 17 +----------------
>   drivers/gpu/drm/drm_internal.h |  4 ++--
>   drivers/gpu/drm/drm_prime.c    | 16 ++++++++++------
>   3 files changed, 13 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index eb0c2d041f13..ed39da383570 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -168,21 +168,6 @@ void drm_gem_private_object_init(struct drm_device *dev,
>   }
>   EXPORT_SYMBOL(drm_gem_private_object_init);
>   
> -static void
> -drm_gem_remove_prime_handles(struct drm_gem_object *obj, struct drm_file *filp)
> -{
> -	/*
> -	 * Note: obj->dma_buf can't disappear as long as we still hold a
> -	 * handle reference in obj->handle_count.
> -	 */
> -	mutex_lock(&filp->prime.lock);
> -	if (obj->dma_buf) {
> -		drm_prime_remove_buf_handle_locked(&filp->prime,
> -						   obj->dma_buf);
> -	}
> -	mutex_unlock(&filp->prime.lock);
> -}
> -
>   /**
>    * drm_gem_object_handle_free - release resources bound to userspace handles
>    * @obj: GEM object to clean up.
> @@ -253,7 +238,7 @@ drm_gem_object_release_handle(int id, void *ptr, void *data)
>   	if (obj->funcs->close)
>   		obj->funcs->close(obj, file_priv);
>   
> -	drm_gem_remove_prime_handles(obj, file_priv);
> +	drm_prime_remove_buf_handle(&file_priv->prime, id);
>   	drm_vma_node_revoke(&obj->vma_node, file_priv);
>   
>   	drm_gem_object_handle_put_unlocked(obj);
> diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
> index 1fbbc19f1ac0..7bb98e6a446d 100644
> --- a/drivers/gpu/drm/drm_internal.h
> +++ b/drivers/gpu/drm/drm_internal.h
> @@ -74,8 +74,8 @@ int drm_prime_fd_to_handle_ioctl(struct drm_device *dev, void *data,
>   
>   void drm_prime_init_file_private(struct drm_prime_file_private *prime_fpriv);
>   void drm_prime_destroy_file_private(struct drm_prime_file_private *prime_fpriv);
> -void drm_prime_remove_buf_handle_locked(struct drm_prime_file_private *prime_fpriv,
> -					struct dma_buf *dma_buf);
> +void drm_prime_remove_buf_handle(struct drm_prime_file_private *prime_fpriv,
> +				 uint32_t handle);
>   
>   /* drm_drv.c */
>   struct drm_minor *drm_minor_acquire(unsigned int minor_id);
> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
> index e3f09f18110c..c28518ab62d0 100644
> --- a/drivers/gpu/drm/drm_prime.c
> +++ b/drivers/gpu/drm/drm_prime.c
> @@ -190,29 +190,33 @@ static int drm_prime_lookup_buf_handle(struct drm_prime_file_private *prime_fpri
>   	return -ENOENT;
>   }
>   
> -void drm_prime_remove_buf_handle_locked(struct drm_prime_file_private *prime_fpriv,
> -					struct dma_buf *dma_buf)
> +void drm_prime_remove_buf_handle(struct drm_prime_file_private *prime_fpriv,
> +				 uint32_t handle)
>   {
>   	struct rb_node *rb;
>   
> +	mutex_lock(&prime_fpriv->lock);
> +
>   	rb = prime_fpriv->dmabufs.rb_node;
>   	while (rb) {
>   		struct drm_prime_member *member;
>   
>   		member = rb_entry(rb, struct drm_prime_member, dmabuf_rb);
> -		if (member->dma_buf == dma_buf) {
> +		if (member->handle == handle) {
>   			rb_erase(&member->handle_rb, &prime_fpriv->handles);
>   			rb_erase(&member->dmabuf_rb, &prime_fpriv->dmabufs);
>   
> -			dma_buf_put(dma_buf);
> +			dma_buf_put(member->dma_buf);
>   			kfree(member);
> -			return;
> -		} else if (member->dma_buf < dma_buf) {
> +			break;
> +		} else if (member->handle < handle) {

Just to make it clear once more. That change here is completely broken.

The rb is indexed by the dma_buf object, not the handle.

Regards,
Christian.

>   			rb = rb->rb_right;
>   		} else {
>   			rb = rb->rb_left;
>   		}
>   	}
> +
> +	mutex_unlock(&prime_fpriv->lock);
>   }
>   
>   void drm_prime_init_file_private(struct drm_prime_file_private *prime_fpriv)

