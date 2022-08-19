Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD69599CAD
	for <lists+dri-devel@lfdr.de>; Fri, 19 Aug 2022 15:12:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CD4310ED32;
	Fri, 19 Aug 2022 13:11:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2042.outbound.protection.outlook.com [40.107.92.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C36BA10ED74
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Aug 2022 13:11:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DsVgXS5xzAb7yQKftDaIzT+UJR1kSiFx/2k9XXlUJsSGsJ+mv7kMShu89ZOtJnZHaso11tSLXcLpNYNStvWxGjNPffeLrfp6H3rSV6PcSwe1XqatPfxGpXKcR6wlWIawLNTzp2i8V8tJZcpJeGIbuU36SD/xYplyFtgjOLv+6ZQhVU8aMBzXlz7VpiRRqblQZQiBHZEKGihBo+9ebWmWNCJLR/dEPWkJLZ6qT97hpsC8zzaMKXBtQ+vTWavh5TMBhJDkHWHj+LhhEzFtkKYe1Ytfbb+D7e54pGtmOsyQJcXP2cRBG+vrMi0FPj0QzzGOuOWMj3AksyJ0Ot2ycucIIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K4sE+hR1hmQzL5Z180IgRUAwJU2pdygDjEazCAFWhAY=;
 b=T9N3D1XYyffY9wUK6W3snb4pYz9+OO/R8YAvbWLdMScrDj6DsIGFWEldNjrO1SeXI2SkZpzq24Ey/vo67jbfvNo6SxfKuYWL0o3Dq/YgXb29QQv6qjti1OBOswubzBop6DtgmHNCUQh9fj9gQOjoxh7wuV565+EFX1x+Trp0xeJ328A7r9deZ7de8aGhg+wUbz62qg/Mqj5tfjwGn9easNWKVc3LL+udYrSRvOYJAc4wyRRniuKoHKGo9bvnQJ8sXur6TIZCwhXc1k5GdvbOi7/oCoNcOn9fe1VPX0MXMfn4pPVfAAFgn5Og3/jyXPRxlk8crSjCGKchykq5OrYSyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K4sE+hR1hmQzL5Z180IgRUAwJU2pdygDjEazCAFWhAY=;
 b=lT3WM8uvZtTGJ2TlDXx6rVk4r8fNGgEN45dFtWQ84dR2eF8LfftGPTpddXuoJ+6wbaiGBQoHMVvC57jkaGbzRWh1TSMwJag4qeiTRKj1gqmhT1/p2Age67sU94Kv9HR8AM1U3H5L1aCszHvIzSMvjL2/w/bBLGGjJjAd148kNz0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BN6PR12MB1923.namprd12.prod.outlook.com (2603:10b6:404:107::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.19; Fri, 19 Aug
 2022 13:11:42 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39%2]) with mapi id 15.20.5504.020; Fri, 19 Aug 2022
 13:11:42 +0000
Message-ID: <1d598742-5014-4b63-a2c7-aeacce8448f0@amd.com>
Date: Fri, 19 Aug 2022 15:11:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3] drm/gem: Fix GEM handle release errors
Content-Language: en-US
To: Jeffy Chen <jeffy.chen@rock-chips.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
References: <20220819072834.17888-1-jeffy.chen@rock-chips.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220819072834.17888-1-jeffy.chen@rock-chips.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0094.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::14) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6b6756c3-3cef-4063-14de-08da81e45c2d
X-MS-TrafficTypeDiagnostic: BN6PR12MB1923:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: G6V4/vOkw3d/AYMyDsS3Qmltv+CyVu5vmYGKtr26Keb1Cfl7geIXotvybmOIxo5ZDyw37JGEgbozVeWUV0E4xpYWqjTIE4+XYsJQCjfhr4k/mkOhB47pDqs23EgBh7If48lP6OdjL+KlwXAj/L/dfrMm8jP9817aP2kYxtiKl7XjZEWDywuaPj7zIwXlVW7YKsJBBH9Eww5GXJdjZC2HkUGtWJ89IR9f6rMOwxtSNt/q/f96YkOxq6jwCz95JlwFNwe9XwIkI9UBxYxgVcbJxUR/wwNOF1X0DolvP3SalGzs5a+HtNfrLa2NsEB++bghH0pC9n9T250kaEERSxDAQ+LL4hbXEWdYv6/tDS1bgazs0hZXrsQ6Sj+cSeg+n5v0hMtx9kV8opjCY5kdaymRJgFWBWAWDi8rc3nlIQDFNUt7TNVwIKeDrAonMm3TB7KKrw9Rm3Wde/rIegpDcHzifboASCr2iTXfMTiBwb2/+zGV74ZhDjTZTvcMMjGkcA8vHjiqWwkAxvY6MlS/ryr4FfpueSq9+qj535YdrWu2jCCTH8Zh1qzFtZqXm1u4ee9ZhifK8L333oMVEBu5Xfpeq/Aa+g5eRuyKSV1HbWU1GphyA1j0enYXoHkxZt1YR/S/BgXJmuWswi1nvzRiikWryIpDp8qp4wAVIHjUlXjCrj9Q3y/2T4wgKwgYFJIX+TbiRO+AV97yy7F9idmBDbF44UINpldtEAVmrxtkKdbVYG6nXRjHhV7vL9XQOEFStY5gRI7ookzfLtS0U3C0y19npvvls6H1/DTC+O6zTTgXkULv05zX0FUR6My4ebVkWM6U9pz5XrEdgrNhJ+Uqc25Ajg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(346002)(366004)(376002)(39860400002)(136003)(38100700002)(6512007)(6506007)(6666004)(2906002)(66574015)(83380400001)(186003)(66556008)(66946007)(4326008)(66476007)(31686004)(8676002)(478600001)(6486002)(54906003)(966005)(36756003)(45080400002)(110136005)(31696002)(316002)(86362001)(5660300002)(41300700001)(8936002)(7416002)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L09yT3lCbjVab2R0WVlSWmQ0anBqN3ZWTVFhNE02akNQc050Vzg0OUJ3TDBo?=
 =?utf-8?B?dHVZMUN5TDlJOG5zMTU2ODFJVGsyempNdU84aTFjaUx5K2thUVAzeTEzUkh4?=
 =?utf-8?B?L0hITUhkaGQ3WkpKTUpOdDZ3dVExdXZoRklzL3hMZXVweTJrSjFtbmlqdFdn?=
 =?utf-8?B?aEZSY3NIdDBiQWZWbEtzSmVCSVE4Y3RPeGtvY21FaWVDSTdIT3lPMFJuWFFi?=
 =?utf-8?B?c3RCcVBUc2VZY0kvREI3RTgzdmhpMzdjNVlMcStVVTFRc3N5NDQrai83Z3VE?=
 =?utf-8?B?QTdyMVJXeXpIZmIyNVloc2FZMFFlRklGRmlxZjY5UXFHdlFDN0dtSzBOT3gx?=
 =?utf-8?B?NlRHdTJZUmZkalRlTEFoYkdZWjVlQmFjTnpDbCs2RENncnpPbFhjdWJkNHlx?=
 =?utf-8?B?UkNyeEhXSU8xZ21GT2t2SktYTEI1NjA3d1ZkS1ZySHZOeUdLVVltS05vc3h2?=
 =?utf-8?B?QzVEUEp3QjNvS2V5Zk5JTGZ6TWxOS2p1VjAxaWFuL3N3ekh6THhOcU53dVB6?=
 =?utf-8?B?azNRSlBoU3d5U1haY2FzaWxESXJoQTdMWlpRaDh0djFkWXRERHlNTTI2Vk9D?=
 =?utf-8?B?NU9YVmZKMmZMNlNaRGRLRm8xTS90czdmOTVSci9EOTM5Smt0c1FMSWp1VlhD?=
 =?utf-8?B?V2VWSHZrYzhOc2ZWSUNKcDJyNTE3TGJIQjNTTTVaN2E2R1ZYVmlCSW1tblZV?=
 =?utf-8?B?UFA2ZjNtem5lWTRSbjVoRGlodUFQT1dxMjkwYmI3enE0UGdZclo3L2E5WnZj?=
 =?utf-8?B?WVNLSW8raXdnOEduOS9aWk16aWhjbWxiV24ra2Zkai9hRVE1ZWpvc1llbm1x?=
 =?utf-8?B?ZFVRNnMzSXRFMHZwTk80YUNqVGV6WFJCeEU4ditkUzUwekhQK3hZeTNQV3pp?=
 =?utf-8?B?Q3Q3NWRubWZxa0duV1FoN2lvTjVFQzJGSm55eGRoeTlqY29tSWZrdlJGQVR2?=
 =?utf-8?B?RjdpNXNnWjZhaHJHMFRCYWNZOUNveithRisxRVZnY2N1YjZTVDdyTzJFVTMz?=
 =?utf-8?B?MFYyVlpEVy9lc1p4QUJXbzAzc2VNcVNtb0M5TURRK1kvWkZoS1l4bG1hK2lI?=
 =?utf-8?B?UGxCMit2TXk0N1BVeERsS2ZCc3hnOGF2ZDJvUmZrU1hUekgzc3ZvUUhBQVIy?=
 =?utf-8?B?d0lrS1ZPc1crMmRrc2M1WlFPeDhEQTN6Vnk3R2loOVpuZlE2enZ5Ly9FMzNL?=
 =?utf-8?B?dU9oMmZvQjFUamxmNXV2UG9va1NSVndCY2VQeHl0bWlqS3dTWC96dFRFMUEw?=
 =?utf-8?B?Z1c3WXNvRXNZMGhaQS9vWVF6Sk9kaWdrSkltSm5xeFE5dnNMNi91ejljRE9Q?=
 =?utf-8?B?SEFLVVNFRzQ3U1A0UzZoNkk4S2pNQnF6cWtHQmpHM2dzUkU2MUtSazF3MXc4?=
 =?utf-8?B?V2ppYVpYRGFqeXVxR3NLQ1kvSGI2T3RIMDlhakd5TkRaWVZUSTVqQ2ltMkd3?=
 =?utf-8?B?bDE3TDBKeUVwRUdXUGtCbXprU05hclZLVXZEZzhreGJxVklwa0gvcFBEei9P?=
 =?utf-8?B?TkxRSm1xWjZESDh0d3QwaVM5dlRpZSt2ODUzbDJia29HOUJJRjVhQ0FhOXdQ?=
 =?utf-8?B?Z3ZQOUZsNmwyOVRKUGVERU5FbmVXYlQ3MDE3K041eWdrN25GdUxJOUdYUW9n?=
 =?utf-8?B?OEFrOExzaTRDbUJNRDk3dVg1a2F5ZWNKdjNNekV2UzhJaVp1UkEvYXluTWls?=
 =?utf-8?B?aVNqK3hSeXVtRDI4amJ2UzJKempLMUJtSVdDU0lrZ3BtUEtLVGdMYVMwTzY3?=
 =?utf-8?B?VjltdWF1NWEvMjZUeUNnamVOSGkwV2VHQkp6cFpSYXdUZ0lHMDM1ZWpKOFVF?=
 =?utf-8?B?b1BZS3BneFFGUU5SWE1paGkrV0U1M1dzTVFndk9aNzJlN2VGVUdTWXgyZ3F3?=
 =?utf-8?B?ZXZsbVB5S2c1eDNnVkw1VE1CRjVOcU1ZblplZWJ0Q2J2bFVqWEtCTktTS25O?=
 =?utf-8?B?M2RYZFlMaVhabis0QWpUU2ZKL2djRGlxMTZlMnY1UTRaOUlKZno3b2d2dkw1?=
 =?utf-8?B?ZUpxdTdwaTNScE1DbzJzeUl3RWtYNWhqTkxBL0FFdHE1cDNhMFhibUxsdU5R?=
 =?utf-8?B?d2JMQ0hpZVAvWlcxb2dsUkMybkFRZjZHTU51K0FKK2RVWGNvZVdsZ2w5L2ha?=
 =?utf-8?B?K1pRL2ZnVVl4QURORzB0Zy9YQUFpZzYxejRPV3hxMTgvbHgrKzdEYlZhZ1hN?=
 =?utf-8?Q?CvUcVcgNczR8p4iaa37lBN5oTbX0QMdsyzp+01UpNZDO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b6756c3-3cef-4063-14de-08da81e45c2d
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2022 13:11:42.8456 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q1RE5lki43b0VrXjTwOchfmaP37LaTPGjjRXF5bEMq6MCP3IaBvPtKC6dJnE0JSg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1923
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

Am 19.08.22 um 09:28 schrieb Jeffy Chen:
> Currently we are assuming a one to one mapping between dmabuf and
> GEM handle when releasing GEM handles.
>
> But that is not always true, since we would create extra handles for the
> GEM obj in cases like gem_open() and getfb{,2}().
>
> A similar issue was reported at:
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fall%2F20211105083308.392156-1-jay.xu%40rock-chips.com%2F&amp;data=05%7C01%7Cchristian.koenig%40amd.com%7Cd1716ddbdbea410a724408da81b52ba2%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637964912375829248%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=uNdN7MgujJMgBMISdZowKDh1PFZ2sqsueCvn%2BX1hYuc%3D&amp;reserved=0
>
> Another problem is that the imported dmabuf might not always have
> gem_obj->dma_buf set, which would cause leaks in
> drm_gem_remove_prime_handles().
>
> Let's fix these for now by using handle to find the exact map to remove.
>
> Signed-off-by: Jeffy Chen <jeffy.chen@rock-chips.com>
> Reviewed-by: Christian König <christian.koenig@amd.com>

I've just pushed this one to drm-misc-fixes.

Thanks,
Christian.

>
> ---
>
> Changes in v3:
> Rewrite commit message a bit.
>
> Changes in v2:
> Fix a typo of rbtree.
>
>   drivers/gpu/drm/drm_gem.c      | 17 +----------------
>   drivers/gpu/drm/drm_internal.h |  4 ++--
>   drivers/gpu/drm/drm_prime.c    | 20 ++++++++++++--------
>   3 files changed, 15 insertions(+), 26 deletions(-)
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
> index e3f09f18110c..bd5366b16381 100644
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
> -	rb = prime_fpriv->dmabufs.rb_node;
> +	mutex_lock(&prime_fpriv->lock);
> +
> +	rb = prime_fpriv->handles.rb_node;
>   	while (rb) {
>   		struct drm_prime_member *member;
>   
> -		member = rb_entry(rb, struct drm_prime_member, dmabuf_rb);
> -		if (member->dma_buf == dma_buf) {
> +		member = rb_entry(rb, struct drm_prime_member, handle_rb);
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

