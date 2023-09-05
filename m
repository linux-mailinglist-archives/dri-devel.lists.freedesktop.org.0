Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8506792203
	for <lists+dri-devel@lfdr.de>; Tue,  5 Sep 2023 12:59:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16CE710E4B0;
	Tue,  5 Sep 2023 10:59:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E90A710E4AF
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Sep 2023 10:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1693911589;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7iBpgfm+C9weL01umlHsYnfkc7J7aGl9MICIpLEHOqo=;
 b=SVEQRRTPB1Z5bArSpk1lijt6sUOek+JT0zK/AK3RxPgeThytzNqF5K7QszzO7o6EAWap88
 eOasClykdVqeLwU9TY4uIVIrb6Zv7+2BuLm1TLqTiaE0OsKJNUAEdUS1uYcFtCBFpElRG8
 F5S0006O3NLmOyS1nIeoUxMHU94U3SQ=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-460-ackhDKIBMAm_2dh4B1CGrw-1; Tue, 05 Sep 2023 06:59:48 -0400
X-MC-Unique: ackhDKIBMAm_2dh4B1CGrw-1
Received: by mail-ed1-f69.google.com with SMTP id
 4fb4d7f45d1cf-51a5296eb8eso1699708a12.2
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Sep 2023 03:59:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693911588; x=1694516388;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7iBpgfm+C9weL01umlHsYnfkc7J7aGl9MICIpLEHOqo=;
 b=T5YMrupAL2oYfASbLE+B7UDizDluZaQO4XZDsVqP4Tlmord7W3z7jUAFpsSr1IvlCV
 DyWHJPdDynU+4S48o5o9+83FuZqRZF3R3p/tiYIMatkswwpQl6rRsPaNgr7wuXpf4+lT
 sEgmbY34oHuLy9xqGjYf1wxiaWhn067K2CJxXYsQH4pZOPK5Ybk9F2MrpbmLGh1H0pZI
 ADhkBZQHY4vFekC4ayUypfq7dpZqxvgOKrBqJRGD43LgWRI3yd3+sThNwp0VbnXRPoCa
 C+OZu/2FZcOqhppKnKidQWHQnZY9mSf3VRnMzq07M2GA9MBVa+Yxxs8QlqHEB5KjnJ07
 4mag==
X-Gm-Message-State: AOJu0Yz89aO9GwasEYyfItNCYRQPlB0DNlYsU/ugX4PNe/H2oA0MDbqr
 NQYICeAyvumwQ+xy2a78Nz9TMhwb9GGao5vn0RFMPZEbGuPtSqFSB1fy2rRlH+F1jLBIYKPZ9tr
 6fCVMz0LQCb8l3jZk2IUiaz9EcDYi
X-Received: by 2002:aa7:c155:0:b0:523:b225:701a with SMTP id
 r21-20020aa7c155000000b00523b225701amr9290405edp.11.1693911587866; 
 Tue, 05 Sep 2023 03:59:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGq1wI1gVIChbfPr11BxRu2iM0hvXopO96caHzmRiGOtHRAHQ32PGJJXhkIpAsdjbSlUxZsZQ==
X-Received: by 2002:aa7:c155:0:b0:523:b225:701a with SMTP id
 r21-20020aa7c155000000b00523b225701amr9290397edp.11.1693911587460; 
 Tue, 05 Sep 2023 03:59:47 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 a9-20020aa7d749000000b005257da6be23sm7055479eds.75.2023.09.05.03.59.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Sep 2023 03:59:47 -0700 (PDT)
Message-ID: <6643ca62-1462-0d33-3edb-1330a714bfac@redhat.com>
Date: Tue, 5 Sep 2023 12:59:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 3/3] drm/drm_exec: Work around a WW mutex lockdep oddity
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20230905085832.2103-1-thomas.hellstrom@linux.intel.com>
 <20230905085832.2103-4-thomas.hellstrom@linux.intel.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20230905085832.2103-4-thomas.hellstrom@linux.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/5/23 10:58, Thomas Hellström wrote:
> If *any* object of a certain WW mutex class is locked, lockdep will
> consider *all* mutexes of that class as locked. Also the lock allocation
> tracking code will apparently register only the address of the first
> mutex locked in a sequence.
> This has the odd consequence that if that first mutex is unlocked and
> its memory then freed, the lock alloc tracking code will assume that memory
> is freed with a held lock in there.
> 
> For now, work around that for drm_exec by releasing the first grabbed
> object lock last.
> 
> Related lock alloc tracking warning:
> [  322.660067] =========================
> [  322.660070] WARNING: held lock freed!
> [  322.660074] 6.5.0-rc7+ #155 Tainted: G     U           N
> [  322.660078] -------------------------
> [  322.660081] kunit_try_catch/4981 is freeing memory ffff888112adc000-ffff888112adc3ff, with a lock still held there!
> [  322.660089] ffff888112adc1a0 (reservation_ww_class_mutex){+.+.}-{3:3}, at: drm_exec_lock_obj+0x11a/0x600 [drm_exec]
> [  322.660104] 2 locks held by kunit_try_catch/4981:
> [  322.660108]  #0: ffffc9000343fe18 (reservation_ww_class_acquire){+.+.}-{0:0}, at: test_early_put+0x22f/0x490 [drm_exec_test]
> [  322.660123]  #1: ffff888112adc1a0 (reservation_ww_class_mutex){+.+.}-{3:3}, at: drm_exec_lock_obj+0x11a/0x600 [drm_exec]
> [  322.660135]
>                 stack backtrace:
> [  322.660139] CPU: 7 PID: 4981 Comm: kunit_try_catch Tainted: G     U           N 6.5.0-rc7+ #155
> [  322.660146] Hardware name: ASUS System Product Name/PRIME B560M-A AC, BIOS 0403 01/26/2021
> [  322.660152] Call Trace:
> [  322.660155]  <TASK>
> [  322.660158]  dump_stack_lvl+0x57/0x90
> [  322.660164]  debug_check_no_locks_freed+0x20b/0x2b0
> [  322.660172]  slab_free_freelist_hook+0xa1/0x160
> [  322.660179]  ? drm_exec_unlock_all+0x168/0x2a0 [drm_exec]
> [  322.660186]  __kmem_cache_free+0xb2/0x290
> [  322.660192]  drm_exec_unlock_all+0x168/0x2a0 [drm_exec]
> [  322.660200]  drm_exec_fini+0xf/0x1c0 [drm_exec]
> [  322.660206]  test_early_put+0x289/0x490 [drm_exec_test]
> [  322.660215]  ? __pfx_test_early_put+0x10/0x10 [drm_exec_test]
> [  322.660222]  ? __kasan_check_byte+0xf/0x40
> [  322.660227]  ? __ksize+0x63/0x140
> [  322.660233]  ? drmm_add_final_kfree+0x3e/0xa0 [drm]
> [  322.660289]  ? _raw_spin_unlock_irqrestore+0x30/0x60
> [  322.660294]  ? lockdep_hardirqs_on+0x7d/0x100
> [  322.660301]  ? __pfx_kunit_try_run_case+0x10/0x10 [kunit]
> [  322.660310]  ? __pfx_kunit_generic_run_threadfn_adapter+0x10/0x10 [kunit]
> [  322.660319]  kunit_generic_run_threadfn_adapter+0x4a/0x90 [kunit]
> [  322.660328]  kthread+0x2e7/0x3c0
> [  322.660334]  ? __pfx_kthread+0x10/0x10
> [  322.660339]  ret_from_fork+0x2d/0x70
> [  322.660345]  ? __pfx_kthread+0x10/0x10
> [  322.660349]  ret_from_fork_asm+0x1b/0x30
> [  322.660358]  </TASK>
> [  322.660818]     ok 8 test_early_put
> 
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> Cc: Danilo Krummrich <dakr@redhat.com>
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Danilo Krummrich <dakr@redhat.com>

One typo below.

> ---
>   drivers/gpu/drm/drm_exec.c |  2 +-
>   include/drm/drm_exec.h     | 35 +++++++++++++++++++++++++++++++----
>   2 files changed, 32 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_exec.c b/drivers/gpu/drm/drm_exec.c
> index ff69cf0fb42a..5d2809de4517 100644
> --- a/drivers/gpu/drm/drm_exec.c
> +++ b/drivers/gpu/drm/drm_exec.c
> @@ -56,7 +56,7 @@ static void drm_exec_unlock_all(struct drm_exec *exec)
>   	struct drm_gem_object *obj;
>   	unsigned long index;
>   
> -	drm_exec_for_each_locked_object(exec, index, obj) {
> +	drm_exec_for_each_locked_object_reverse(exec, index, obj) {
>   		dma_resv_unlock(obj->resv);
>   		drm_gem_object_put(obj);
>   	}
> diff --git a/include/drm/drm_exec.h b/include/drm/drm_exec.h
> index e0462361adf9..55764cf7c374 100644
> --- a/include/drm/drm_exec.h
> +++ b/include/drm/drm_exec.h
> @@ -51,6 +51,20 @@ struct drm_exec {
>   	struct drm_gem_object *prelocked;
>   };
>   
> +/**
> + * drm_exec_obj() - Return the object for a give drm_exec index
> + * @exec: Pointer to the drm_exec context
> + * @index: The index.
> + *
> + * Return: Pointer to the locked object corresponding to @index if
> + * index is within the number of locked objects. NULL otherwise.
> + */
> +static inline struct drm_gem_object *
> +drm_exec_obj(struct drm_exec *exec, unsigned long index)
> +{
> +	return index < exec->num_objects ? exec->objects[index] : NULL;
> +}
> +
>   /**
>    * drm_exec_for_each_locked_object - iterate over all the locked objects
>    * @exec: drm_exec object
> @@ -59,10 +73,23 @@ struct drm_exec {
>    *
>    * Iterate over all the locked GEM objects inside the drm_exec object.
>    */
> -#define drm_exec_for_each_locked_object(exec, index, obj)	\
> -	for (index = 0, obj = (exec)->objects[0];		\
> -	     index < (exec)->num_objects;			\
> -	     ++index, obj = (exec)->objects[index])
> +#define drm_exec_for_each_locked_object(exec, index, obj)		\
> +	for ((index) = 0; ((obj) = drm_exec_obj(exec, index)); ++(index))
> +
> +/**
> + * drm_exec_for_each_locked_object_reverse - iterate over all the locked
> + * objects in reverse locking order
> + * @exec: drm_exec object
> + * @index: unsigned long index for the iteration
> + * @obj: the current GEM object
> + *
> + * Iterate over all the locked GEM objects inside the drm_exec object in
> + * reverse locking order. Note that @index may go below zero and wrap,
> + * but that will be caught by drm_exec_object(), returning a NULL object.

drm_exec_obj()

> + */
> +#define drm_exec_for_each_locked_object_reverse(exec, index, obj)	\
> +	for ((index) = (exec)->num_objects - 1;				\
> +	     ((obj) = drm_exec_obj(exec, index)); --(index))
>   
>   /**
>    * drm_exec_until_all_locked - loop until all GEM objects are locked

