Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E157D764E92
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 11:07:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15F0110E1CB;
	Thu, 27 Jul 2023 09:07:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 770FD10E1CB
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 09:07:13 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-2680edb9767so148623a91.0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 02:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1690448833; x=1691053633;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UKiGuCYavgdrONYSlKU+hjlx/AzCB2LKMORbFgw7HEo=;
 b=DjrROq91sf6Va+7++jhnZLLfMfZ3NpR+vs103Gffs3+O08HW6byjEgnIqMIjx7XVVU
 6Esw8LCCRNx5FIzgZD2yLlNtiJ3fWUXbMzLdc62rKZLebfjHSG7L7jgEMl0D1hE7ZoNg
 HZ2c9Q9i+LL0tt0iImhvHFOK+Hduw2G0dP+6wK+guSG8W2Nz3BegBODQY1lmNQJ14Dz4
 uuXi2h/k5/64PvGOHou6Defqpklm1cGUHs8RqpArf+xI1YmvbpRswY34ry3JAORO90Jx
 4NSzh0j5w+vqWxK/Ia35MiibA4wNxyya8QHOgB3QIdRRJ50Wt48gZu09EVgownqRkh1E
 f6DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690448833; x=1691053633;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UKiGuCYavgdrONYSlKU+hjlx/AzCB2LKMORbFgw7HEo=;
 b=ko/enWRoA2JhJMW0pfD/yIypoJf+M8JAYUIJOqVlv3jK5PnQR+Jx2KhLy93cwrNckz
 sFf3isQIAsWDsjG2VsT16dp8sC+7iL6x07Nycs1UxGHm0lPcbs2lYp3T2Vc+JRYto7lE
 FQWr8maNZP7MTbYVySSRMVUzn6YjXd3jtT3BzjFlJtnYzChGDSdxSkwWekMGDBPxmlGr
 tGnMDauAe01BuF2457x6m+8yuc0nGP1FKFOjXrk9QCAZGRgb6rwtuG5QmteZ1SDDT0z+
 B4AVuYK1Sj1jCiivgWNFTBZaYsSG32XysjFjuazICgegynTG7CXjIZfVHmSyII1Caf4r
 kfjA==
X-Gm-Message-State: ABy/qLYUQLcenL8G/UXiDoX/BK84gfRYC7lSVerYpDgV1HIuTqAwq/N6
 FCKH+gcAt52t0izF3ydsnBFOQQ==
X-Google-Smtp-Source: APBJJlEquEzidizjgrmS1e55j2UU3CMKKyxPnlaVqAXQYQ+ePfvdxx8A4f9JU/BbmCjGKzVhoGuchQ==
X-Received: by 2002:a17:90a:128e:b0:263:25f9:65b2 with SMTP id
 g14-20020a17090a128e00b0026325f965b2mr4139877pja.4.1690448832920; 
 Thu, 27 Jul 2023 02:07:12 -0700 (PDT)
Received: from [10.70.252.135] ([203.208.167.147])
 by smtp.gmail.com with ESMTPSA id
 a11-20020a170902ee8b00b001b7e63cfa19sm1063627pld.234.2023.07.27.02.07.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jul 2023 02:07:12 -0700 (PDT)
Message-ID: <19461737-db63-2ab5-110b-e65035881ae2@bytedance.com>
Date: Thu, 27 Jul 2023 17:06:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 15/49] nfs: dynamically allocate the nfs-acl shrinker
Content-Language: en-US
To: akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
 vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
 brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu, steven.price@arm.com,
 cel@kernel.org, senozhatsky@chromium.org, yujie.liu@intel.com,
 gregkh@linuxfoundation.org, muchun.song@linux.dev
References: <20230727080502.77895-1-zhengqi.arch@bytedance.com>
 <20230727080502.77895-16-zhengqi.arch@bytedance.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <20230727080502.77895-16-zhengqi.arch@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: kvm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 dm-devel@redhat.com, linux-mtd@lists.infradead.org, x86@kernel.org,
 cluster-devel@redhat.com, xen-devel@lists.xenproject.org,
 linux-ext4@vger.kernel.org, linux-arm-msm@vger.kernel.org, rcu@vger.kernel.org,
 linux-bcache@vger.kernel.org, Muchun Song <songmuchun@bytedance.com>,
 linux-raid@vger.kernel.org, linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2023/7/27 16:04, Qi Zheng wrote:
> Use new APIs to dynamically allocate the nfs-acl shrinker.
> 
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> Reviewed-by: Muchun Song <songmuchun@bytedance.com>
> ---
>   fs/nfs/super.c | 20 ++++++++++++--------
>   1 file changed, 12 insertions(+), 8 deletions(-)
> 
> diff --git a/fs/nfs/super.c b/fs/nfs/super.c
> index 2284f749d892..072d82e1be06 100644
> --- a/fs/nfs/super.c
> +++ b/fs/nfs/super.c
> @@ -129,11 +129,7 @@ static void nfs_ssc_unregister_ops(void)
>   }
>   #endif /* CONFIG_NFS_V4_2 */
>   
> -static struct shrinker acl_shrinker = {
> -	.count_objects	= nfs_access_cache_count,
> -	.scan_objects	= nfs_access_cache_scan,
> -	.seeks		= DEFAULT_SEEKS,
> -};
> +static struct shrinker *acl_shrinker;
>   
>   /*
>    * Register the NFS filesystems
> @@ -153,9 +149,17 @@ int __init register_nfs_fs(void)
>   	ret = nfs_register_sysctl();
>   	if (ret < 0)
>   		goto error_2;
> -	ret = register_shrinker(&acl_shrinker, "nfs-acl");
> -	if (ret < 0)
> +
> +	acl_shrinker = shrinker_alloc(0, "nfs-acl");
> +	if (!acl_shrinker)
>   		goto error_3;

Here should set ret to -ENOMEM, will fix.

> +
> +	acl_shrinker->count_objects = nfs_access_cache_count;
> +	acl_shrinker->scan_objects = nfs_access_cache_scan;
> +	acl_shrinker->seeks = DEFAULT_SEEKS;
> +
> +	shrinker_register(acl_shrinker);
> +
>   #ifdef CONFIG_NFS_V4_2
>   	nfs_ssc_register_ops();
>   #endif
> @@ -175,7 +179,7 @@ int __init register_nfs_fs(void)
>    */
>   void __exit unregister_nfs_fs(void)
>   {
> -	unregister_shrinker(&acl_shrinker);
> +	shrinker_free(acl_shrinker);
>   	nfs_unregister_sysctl();
>   	unregister_nfs4_fs();
>   #ifdef CONFIG_NFS_V4_2
