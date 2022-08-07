Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B21E458BBE5
	for <lists+dri-devel@lfdr.de>; Sun,  7 Aug 2022 18:53:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E85410EF57;
	Sun,  7 Aug 2022 16:53:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2058.outbound.protection.outlook.com [40.107.212.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 148A110EF57
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Aug 2022 16:53:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=epafqHjY6JIidHyJ9vxARqcnhsFK7TO2llMJqiuFJj+QzuqkXpkXGV8SOLrs5sap0OzcfwLlcApX0tW8iBn+VxQ7EIr9J1p+JRt8HnzFnicSre9p2HWzhulqLyxm4ddVe/P9hewQzM6exM/DCNXIHD30hs767MAqomJdTn+0kTTHIiZionwH+nQLJ1HpexOj9bCzjwpAoyM4fJ8Ye+XIquxCPn8ZbjTXI6mvDY9UX2lrMBWcm5yGfT4o62cK4Kh9HrtnkIm0rpat7ClSK5KDOJ0zfwSC2ktdcBhLQ/IpoYrIRlhvu4VUprWhxgNsP/ZeKUF4ZTS0uY+doL1FZ/3D3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FTAnNSC7aa8xhLV/vDwSlSyLG5tCJ0hF90bXdNP/k/4=;
 b=GLayaGoVbIPbs1Eayw+y9TEY5HSXjL/3IsanLl78Azz71J+Bt8kNVzuQuisQVk1s0QaSumbshYy3EFqNAv8tYzm67XivcUPuwBHmPsCvohEVJKaGI2bZo6xlZk4z+KnvaX0Ly7O9QS0uooKl08niuEQALYJDQKh3z8XG/Pb3jdaI6nd0/L8KLPWt4p3RTD52q4p8My0/gnjJs18wAKKQxhYb1HnKK4lfD50T32nKYRjzXFMDF+LFHbM4SqVBxF2bTgq6vKIEEkJTpusWr54LPVuUNyG4kupKXZXIoFAynVznixop9oeyByqHXnWEpvcsq3V63ex7V5Ff4SNXuif/XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FTAnNSC7aa8xhLV/vDwSlSyLG5tCJ0hF90bXdNP/k/4=;
 b=fHL/+xq6f2tr13tinvwKnAZrjCq219jEkqyBaT8R3akzzRdTT6y2PFmXdj7Yi/Y14SRslDedVSPyHgGYcbdDajLyTmmWJ+0m7B3c1brolMG1FrH1yv8FJU2pyHrkgMNK2lP+PZw8uc0y4soKVGYxvw2S3W86lYlidVPUJZkoMwo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BN6PR12MB1729.namprd12.prod.outlook.com (2603:10b6:404:108::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Sun, 7 Aug
 2022 16:52:58 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39%2]) with mapi id 15.20.5504.019; Sun, 7 Aug 2022
 16:52:58 +0000
Message-ID: <c7cb225b-7f21-8d9a-773b-efc655e6332c@amd.com>
Date: Sun, 7 Aug 2022 18:52:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] drm/gem: Fix GEM handle release errors
Content-Language: en-US
To: Jeffy Chen <jeffy.chen@rock-chips.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
References: <20220803083237.3701-1-jeffy.chen@rock-chips.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220803083237.3701-1-jeffy.chen@rock-chips.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0117.eurprd06.prod.outlook.com
 (2603:10a6:20b:465::32) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 32287421-1f99-4e15-7908-08da78954820
X-MS-TrafficTypeDiagnostic: BN6PR12MB1729:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tAqpQpr7GbrnAGDyDlLAnk7niUttxRzIv3r5o3CF6zom1wU6VZ1bjghq7UOJTS5A/rkXgB/B1zbrUCWXEY6l9txzUMPkq0UpcYGROpydD+PEBSuQdDbGz3fYWYlQ4FwSSOQq/bG6BFydw9vVY+PdKrnwMt9eylCHWwu2wgn9nCOAyJbqe0n8GZq168sz72onn6KACyvjJRzLSLmPVPMZMa8y9D9xOigPqd5Dt7LKyoHqUJM2K+6qT+Ak8Sc0aT6Re8nnJRPAacqenBp+9p424z0QLq3NuXegy1vvzmcXaclm9KfxcunA7ei4vvDuEiIGrublYCJS4NGtK1O4z0B4mDO5El1/SL0ob7ZzX8LD0J98Qk1XPqfjLTlG5DOcxuqF8QDBye7cVCa0j6sPTvu1SepVSnBkdMMK7mWEcx4x5iqpqgCBW9szsz3UL+5qK3XKX1EJ3kn6a0LAglUQQf8XpjSqZ5V9jxO0xzmARBQrpjgzpIa62nzF/Ja95oUW4JkcpiiisISG9mp6FbaOzuc2Vt4Y0Xqo979OER6OmKqSkOlI25dCMwhuZtNcVXuH47geun+VccTsJzqwdTDxg1B4KtMe5OJb3GcKrIk1jsedgeNxV57ejkqOVUw34RKQv/jkTZ+S8+cQeiJImH5wEATcMgBxYv27QWlm/XSXVvZ3cjVFgjSfIF7JGG4n05QxgXXd4xf57Y0X3W7hh0oR+qQPKW2seQMpRanx2G9PbHei5otytt5c3/HFkFumyfuJLEg1nsVNXDqdJdxvMRHlMEqQ4OS2OKfi5RV8sCQlHW1CefA9Mjp8bpe+GDRMlRn1wIciA93nxTTvN+r6fXgUES7Bn8+C6UFGZXE7or5bCMPshYU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(366004)(136003)(376002)(346002)(39860400002)(86362001)(31696002)(2616005)(186003)(6506007)(6666004)(2906002)(6512007)(38100700002)(83380400001)(316002)(4326008)(7416002)(8936002)(8676002)(36756003)(31686004)(66946007)(66556008)(66476007)(41300700001)(6486002)(966005)(5660300002)(478600001)(54906003)(110136005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SmF5UFhVazd5UGhxOXRsZDhxRXVTU2xpbGtCcm5hR1YxZTNiOGdkaXBFcThn?=
 =?utf-8?B?bUJrSHN1UWVRTkVVWlJSMURKNm8xdGJPck9uY2Jzd3BpQk1pclRlRGJ1bnA1?=
 =?utf-8?B?N1ZQNElZWkNJaVVqNDFCdU1yTVVqb09ocm05U0VQNFdhR2hLZGpJNThYMzNo?=
 =?utf-8?B?a0lOUXh6L0xITGFKQlVQQU10d29Rd3lGZWFOSTVsRjRrZ2xQUThFVmtWUHNx?=
 =?utf-8?B?TEVYRzFoSzludWFpdFhjUkphbVFQczY1RVBDcGhBUjJFdCtzemYyUE81M1Np?=
 =?utf-8?B?bkg5MngwVXpLSFhIOFcwOUd1STJ6d1l1RFJNcU53eEFFUXlXeVNTbDAwRmZK?=
 =?utf-8?B?Rll6U2Q5ZVZnaTFJVElrNUVVd0d5eHIxbUpDNS90WDNLMkhCc1MwL0xrblJG?=
 =?utf-8?B?a2grOEF4eS9rWkhTS1p0ampNNVJ6cDlJMENkU1pGSWVWVkRCUUdyby9mZzBn?=
 =?utf-8?B?Z0pKSDBNS0NJQXozak5DV1RBWFhjWlZjaElEc0ZKUjZrRkhPc3hzZzFETDBw?=
 =?utf-8?B?bWdjU2g3MjAxK0FxeDFEVXhuZjN4bmRsTldoNzdMNDBOd2JLWi9TUzI0d3ZN?=
 =?utf-8?B?VHh0MmtwcGd6ckVFY2hyVTRLanZRTG54VnNMcjVrNVdkYlRNTFcrM2RTbnVq?=
 =?utf-8?B?T2VlYXNITmhIU2ZBZUtuZGFlZCtEcjNoQkVJL3YxOXRoR0lTVmd5bHFTVzBn?=
 =?utf-8?B?bzJpc3diWGxhT2VXSGZyQ1hoNXMrQko0RDhFSjFYaUJrKzluRUV5b3hDZy9D?=
 =?utf-8?B?RHk5Uno1bDRVUnNsQlZSUWdPenJUR2lsRTMvMU9sUDZOM2dYL0M0T2FnMnQw?=
 =?utf-8?B?NzQxVVBlMGZNT1E4V1lCclAxY0x5YWEwY1ZlVC9FdHJxUXVXQUM0M0pTaDNm?=
 =?utf-8?B?d1BNS2pKYVE5eWtvdFNuMXA3VVp5Q215NmNXRFgycEpuaFFxTmRQUENCSlgz?=
 =?utf-8?B?T09HR3I0bU5ySTBhZHlzWlVCWkZNcWFXMUYzdVQrV0U5L3dCa2xrUmxpaVdn?=
 =?utf-8?B?clJmSVRzMUtYNTFDSi9tZHRiWFpxak5ucFJSbkhlZmlpRWpoTUtpRVN5ZUJi?=
 =?utf-8?B?OTVwQmdLWlUxbUlxdENQSHBqWGdvcTc1eVRJdTNyTXQ2dkJyQTgyNDdzU1Vy?=
 =?utf-8?B?MjM3WFZoVnk5L2RGUDBEMjI3Rkt3aWdYYjVDa1d6UVNIc3FpeDllNkxRaW5v?=
 =?utf-8?B?Q2dyMmhsaGt5R2xsUkJFcFk5cWRWckl6em9ySWFHdWU2Mjgzckg0T1h6TWJX?=
 =?utf-8?B?cE5MRVN5cEI5M1lQdWp4RFFYdWlIYTh5T25qN2NpekgzVlFmSEVNVmdzaTJ3?=
 =?utf-8?B?bWord3ZhUnFaSVhQRGVvYXoyNHIvQnlHZnE0Q2JrSUNISU1RNzVaYlAzbFZa?=
 =?utf-8?B?SkJoMDM0R1phU1Y3b1dYY20xc1FXbjh5NlZTRytHVmYrSWVMYnA5Mi9NNVo1?=
 =?utf-8?B?OCtTQTJMSXFaenpoOXZOM3lhOGlKQzk0NkpZT1A0dzdHQ3RvUXc3aFJvOUVX?=
 =?utf-8?B?TExqcldWeUJtaDNaNm5Yby9ja0tvR2g4Uzl1OEtYcUpEd0Q1RjdUU2ZkSm1X?=
 =?utf-8?B?aGU4Z2M5TjM3YzJUSnFuU0tXWHlTSlhGNGpudkhvVkw0RlJHQzBZbVZuMy9r?=
 =?utf-8?B?dWVNTm5zTXBmTVZXNENqZGkrR01vdG9JdDNmWkc5bjdHeUNtNU1pVkUwdVpD?=
 =?utf-8?B?VFh4aXp6b0ZvdFpWRDdXSEhhdlh1bjdUYWdtbCtWWkpDVG8rVEQxeTNycU9n?=
 =?utf-8?B?VkEwdy9EQXRHQlFDTE16QzAwK3VIY2V3aGRSbjkwNUhQTTBXTTRsN0Y0b2Iy?=
 =?utf-8?B?ZUI0cWtNK3FTZEV2THFrSjRKV3FPV09nMmVPdXUzajIrSjBvOXNWWU9rSzJk?=
 =?utf-8?B?bmZZbXE4ZGRlcXh2YUppWnB6UmJUTDRIOGtUYkd5SGJVK0tRTEcxZUhBRUlL?=
 =?utf-8?B?WkV2dkdicjUyZTlVaTBQR1EwbGdic2g5S2RuVG5LVmZIM29VdHlRODVLZlBZ?=
 =?utf-8?B?VGprT2U5bFFueTJnUEhuV05XR0MzbjBzcUFhQ21laFVrbHh2YzdBaGFBUFN4?=
 =?utf-8?B?L3o1QmV2cVJxMnh5V3lVckF2M2RNZFFXNzRNL3ovODZta2NSclVlOVA2aXha?=
 =?utf-8?B?YkhId251ZEdlMmxkZGZ6R29QTXJXRFlmUU5lSEtjWEVwOVBFTkR3SjZselZC?=
 =?utf-8?Q?Zf7rDunt/qWzAxeL2eKeLNdoQKpGqN0HZJ1tcCZi85pC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32287421-1f99-4e15-7908-08da78954820
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2022 16:52:58.3300 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0C8F1VPpx3DZXr8u+a5Zz2V7xffO0ILYHH+fKRpUf4BnPrnlpCJSESV4vpqbyw3b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1729
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

Am 03.08.22 um 10:32 schrieb Jeffy Chen:
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

Well we are clearly something missing here. As far as I can see the 
current code is correct.

Creating multiple GEM handles for the same DMA-buf is possible, but illegal.

In other words when a GEM handle is exported as DMA-buf and imported 
again you should intentionally always get the same handle.

So this is pretty much a clear NAK to this patch since it shouldn't be 
necessary or something is seriously broken somewhere else.

Regards,
Christian.

>
> Signed-off-by: Jeffy Chen <jeffy.chen@rock-chips.com>
> ---
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

