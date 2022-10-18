Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA90602637
	for <lists+dri-devel@lfdr.de>; Tue, 18 Oct 2022 09:54:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A211E10E547;
	Tue, 18 Oct 2022 07:54:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11F0D10E547
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Oct 2022 07:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666079644;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2F+GJ1yS9I/3gQmwXrWo3ysZ03ASLb2Zkeo7BUrp7yI=;
 b=bVROH39l5JhV2GYE38FUOEi+oZdJAFWdxI+6x9K12VbwN+19ENy8uS3g6Sx/ix+nPDj7KT
 HlKzE4D71DYRb7RtHqxTvz2wvOrhCYPgaNI9SaNVxR2p9FFZ9EJT/GNfhyKKPnk4sEmJOi
 8kX7q6S5wp9umby+5qM+kmdMFRSe7hc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-638-LNRpFR4-M7OZQDsrwTuCww-1; Tue, 18 Oct 2022 03:54:02 -0400
X-MC-Unique: LNRpFR4-M7OZQDsrwTuCww-1
Received: by mail-wr1-f70.google.com with SMTP id
 p7-20020adfba87000000b0022cc6f805b1so4337571wrg.21
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Oct 2022 00:54:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2F+GJ1yS9I/3gQmwXrWo3ysZ03ASLb2Zkeo7BUrp7yI=;
 b=xlBfvyUpsHsss23Q91WA2BEJzpPJrcTPDGVIxBqrQPEG3VaU7exAjy/Xu1GD3GJeUD
 VK1wn3lOJs9yK3o/WolTQH/NC86Usc4ZQnwnSqwI2T+EDJG8F48fqpzYrLzVeiXooSGD
 /YaH624yfeu5JeeI/M9KoajpT6w5vcUTjUAWa9bcdtWqgq2u9EF+r4nMayEAEoDTgIdk
 8oGxxUUjH2u8HmY9diXnp4Ghe1fovhpIK60Vwx9Od6WtAsDuWoef4QUxYZ45i7URt2fa
 b+SBMRIw2zdPyukgB24ub2hh8x3xSYLK7Xl7wic1XGDm55uMPDAZ+mk5TfJql+o5Litj
 I4UQ==
X-Gm-Message-State: ACrzQf0VHb1TvcbphsBpyz3c+300rjh28XL6H6fmGTfshx401dJ1X//U
 RNF1cToBUX/L5HBOqY8l6BmkCE+I/CsZZBFwW55/ShnSL5HUkjPCiue7PkYWT8ZzhW7wHzjhaXM
 g/bu8W5Da3cE4+1ZF6T/1yitrXJrg
X-Received: by 2002:a05:6000:1786:b0:22e:41c0:cb0e with SMTP id
 e6-20020a056000178600b0022e41c0cb0emr974670wrg.93.1666079641576; 
 Tue, 18 Oct 2022 00:54:01 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4zbEN1VWW5iyDyFlTL54Vj/S6lme9Dhmd2db+wdC7mCyjq8sDbKAtOPQjqQ/X/o6d2/KTT9g==
X-Received: by 2002:a05:6000:1786:b0:22e:41c0:cb0e with SMTP id
 e6-20020a056000178600b0022e41c0cb0emr974652wrg.93.1666079641211; 
 Tue, 18 Oct 2022 00:54:01 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 z10-20020a05600c0a0a00b003a2f2bb72d5sm25026573wmp.45.2022.10.18.00.53.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Oct 2022 00:54:00 -0700 (PDT)
Message-ID: <7f576eb4-f8a6-53e0-17e9-285ecf03418c@redhat.com>
Date: Tue, 18 Oct 2022 09:53:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: not ok 1 - single_pixel_source_buffer: The buggy address belongs
 to the physical page
To: Naresh Kamboju <naresh.kamboju@linaro.org>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 kunit-dev@googlegroups.com, =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?=
 <jose.exposito89@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Ma=c3=adra_Canal?= <maira.canal@usp.br>,
 Isabella Basso <isabbasso@riseup.net>
References: <CA+G9fYsuc9G+RO81E=vHMqxYStsmLURLdOB0NF26kJ1=K8pRZA@mail.gmail.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <CA+G9fYsuc9G+RO81E=vHMqxYStsmLURLdOB0NF26kJ1=K8pRZA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[adding a few folks to Cc list that might help with this issue]

Hello Naresh,

Thanks a lot for your report.

On 10/18/22 08:40, Naresh Kamboju wrote:
> Following kunit tests started failing on Linux mainline.
>  - drm_format_helper_test — FAIL
>  - drm_test_fb_xrgb8888_to_xrgb2101010 — FAIL
>  - single_pixel_source_buffer — FAIL
> 
> Good: v6.0-3015-g2bca25eaeba6
> Bad: v6.0-5118-g833477fce7a1
>

Could you please let me know how you are running this? I tried to reproduce it
on v6.1-rc1 with the following command but all tests passed:

./tools/testing/kunit/kunit.py run --kunitconfig=drivers/gpu/drm/tests/.kunitconfig --arch=x86_64
[09:41:53] Configuring KUnit Kernel ...                                                                                
[09:41:53] Building KUnit Kernel ...                                                                                   
Populating config with:                                                                                                
$ make ARCH=x86_64 O=.kunit olddefconfig                                                                               
Building with:                                                                                                         
$ make ARCH=x86_64 O=.kunit --jobs=8                                                                                   
[09:45:51] Starting KUnit Kernel (1/1)...                                                                              
[09:45:51] ============================================================                                                
Running tests with:                                                                                                    
$ qemu-system-x86_64 -nodefaults -m 1024 -kernel .kunit/arch/x86/boot/bzImage -append 'kunit.enable=1 console=ttyS0 kunit_shutdown=reboot' -no-reboot -nographic -serial stdio
...
[09:47:40] Testing complete. Ran 195 tests: passed: 195                                                                
[09:47:40] Elapsed time: 347.817s total, 0.003s configuring, 238.009s building, 109.771s running
 
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> 
> [   50.320990]         # Subtest: drm_test_fb_xrgb8888_to_xrgb2101010
> [   50.322059] ==================================================================
> [   50.326436] BUG: KASAN: slab-out-of-bounds in
> drm_test_fb_xrgb8888_to_xrgb2101010+0x2dd/0x520
> [   50.329249] Read of size 4 at addr ffff888104d7a5cc by task
> kunit_try_catch/619
> [   50.331596]
> [   50.332135] CPU: 1 PID: 619 Comm: kunit_try_catch Tainted: G    B
>          N 6.0.0 #1
> [   50.333876] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996),
> BIOS 1.12.0-1 04/01/2014
> [   50.335138] Call Trace:
> [   50.335531]  <TASK>
> [   50.335879]  dump_stack_lvl+0x49/0x62
> [   50.336462]  print_report.cold+0x5e/0x5d9
> [   50.337069]  ? _raw_spin_unlock_irqrestore+0x33/0x60
> [   50.337820]  ? update_kunit_status+0xee/0x160
> [   50.338494]  ? drm_test_fb_xrgb8888_to_xrgb2101010+0x2dd/0x520
> [   50.339354]  kasan_report+0xaa/0x130
> [   50.339905]  ? drm_fb_xrgb8888_to_xrgb2101010+0xa0/0xd0
> [   50.340680]  ? drm_test_fb_xrgb8888_to_xrgb2101010+0x2dd/0x520
> [   50.341576]  __asan_load4+0x80/0xa0
> [   50.342112]  drm_test_fb_xrgb8888_to_xrgb2101010+0x2dd/0x520
> [   50.342958]  ? drm_test_fb_xrgb8888_to_gray8+0x470/0x470
> [   50.343778]  ? update_load_avg+0x80/0xb80
> [   50.344407]  ? update_cfs_group+0x22/0x160
> [   50.345036]  ? load_balance+0x14d0/0x14d0
> [   50.345652]  ? dequeue_entity+0x1f2/0x6a0
> [   50.346263]  ? rcu_qs+0x1c/0x120
> [   50.346773]  ? finish_task_switch.isra.0+0xe0/0x410
> [   50.347532]  ? __kasan_check_write+0x14/0x20
> [   50.348192]  ? _raw_spin_lock_irqsave+0x9e/0x100
> [   50.348891]  ? _raw_spin_unlock_irqrestore+0x28/0x60
> [   50.349625]  ? trace_preempt_on+0x2a/0xf0
> [   50.350242]  ? __kthread_parkme+0x4f/0xd0
> [   50.350857]  kunit_try_run_case+0x91/0xd0
> [   50.351479]  ? kunit_catch_run_case+0x80/0x80
> [   50.352151]  ? kunit_try_catch_throw+0x40/0x40
> [   50.352897]  kunit_generic_run_threadfn_adapter+0x2f/0x50
> [   50.353890]  kthread+0x179/0x1b0
> [   50.354410]  ? kthread_complete_and_exit+0x30/0x30
> [   50.355126]  ret_from_fork+0x22/0x30
> [   50.355708]  </TASK>
> [   50.356047]
> [   50.356284] Allocated by task 619:
> [   50.356817]  kasan_save_stack+0x26/0x50
> [   50.357410]  __kasan_kmalloc+0xae/0xe0
> [   50.357980]  __kmalloc+0x1cf/0x390
> [   50.358501]  kunit_kmalloc_array_init+0x4b/0x80
> [   50.359189]  __kunit_add_resource+0x67/0x100
> [   50.359859]  kunit_kmalloc_array+0xf8/0x170
> [   50.360490]  drm_test_fb_xrgb8888_to_xrgb2101010+0x19f/0x520
> [   50.361341]  kunit_try_run_case+0x91/0xd0
> [   50.361948]  kunit_generic_run_threadfn_adapter+0x2f/0x50
> [   50.362747]  kthread+0x179/0x1b0
> [   50.363230]  ret_from_fork+0x22/0x30
> [   50.363779]
> [   50.364015] The buggy address belongs to the object at ffff888104d7a5c8
> [   50.364015]  which belongs to the cache kmalloc-8 of size 8
> [   50.365824] The buggy address is located 4 bytes inside of
> [   50.365824]  8-byte region [ffff888104d7a5c8, ffff888104d7a5d0)
> [   50.367485]
> [   50.367736] The buggy address belongs to the physical page:
> [   50.368579] page:000000003c09c153 refcount:1 mapcount:0
> mapping:0000000000000000 index:0x0 pfn:0x104d7a
> [   50.369991] flags: 0x200000000000200(slab|node=0|zone=2)
> [   50.370804] raw: 0200000000000200 0000000000000000 dead000000000122
> ffff888100042280
> [   50.371933] raw: 0000000000000000 0000000080660066 00000001ffffffff
> 0000000000000000
> [   50.373021] page dumped because: kasan: bad access detected
> [   50.373958]
> [   50.374202] Memory state around the buggy address:
> [   50.374935]  ffff888104d7a480: fc fb fc fc fc fc fb fc fc fc fc fb
> fc fc fc fc
> [   50.376019]  ffff888104d7a500: fb fc fc fc fc fb fc fc fc fc fb fc
> fc fc fc fb
> [   50.377098] >ffff888104d7a580: fc fc fc fc fa fc fc fc fc 04 fc fc
> fc fc fa fc
> [   50.378174]                                               ^
> [   50.379025]  ffff888104d7a600: fc fc fc fa fc fc fc fc fa fc fc fc
> fc fa fc fc
> [   50.380123]  ffff888104d7a680: fc fc 00 fc fc fc fc fa fc fc fc fc
> fa fc fc fc
> [   50.381191] ==================================================================
> [   50.382461]         not ok 1 - single_pixel_source_buffer
> [   50.382909]         ok 2 - single_pixel_clip_rectangle
> [   50.384319]         ok 3 - well_known_colors
> [   50.385393]         ok 4 - destination_pitch
> [   50.386029]     # drm_test_fb_xrgb8888_to_xrgb2101010: pass:3
> fail:1 skip:0 total:4
> [   50.386657]     not ok 5 - drm_test_fb_xrgb8888_to_xrgb2101010
> [   50.387762] # drm_format_helper_test: pass:4 fail:1 skip:0 total:5
> [   50.388598] # Totals: pass:19 fail:1 skip:0 total:20
> [   50.389467] not ok 33 - drm_format_helper_test
> 
> Test log link,
> https://lkft.validation.linaro.org/scheduler/job/5633513#L7056
> https://qa-reports.linaro.org/lkft/linux-mainline-master/build/v6.0-5118-g833477fce7a1/testrun/12273332/suite/kunit/tests/
> 
> Test results comparison:
> https://qa-reports.linaro.org/lkft/linux-mainline-master/build/v6.1-rc1/testrun/12468488/suite/kunit/test/drm_format_helper_test/history/?page=2
> 
> For your reference:
> https://qa-reports.linaro.org/lkft/linux-mainline-master/build/v6.0-3015-g2bca25eaeba6/testrun/12237941/suite/kunit/tests/
> 
> metadata:
>   git_ref: master
>   git_repo: https://gitlab.com/Linaro/lkft/mirrors/torvalds/linux-mainline
>   git_sha: 833477fce7a14d43ae4c07f8ddc32fa5119471a2
>   git_describe: v6.0-5118-g833477fce7a1
>   kernel_version: 6.0.0
>   kernel-config: https://builds.tuxbuild.com/2FjJ6bdUwO43y6QWMJyjklBN9Ji/config
>   build-url: https://gitlab.com/Linaro/lkft/mirrors/torvalds/linux-mainline/-/pipelines/659360852
>   artifact-location: https://builds.tuxbuild.com/2FjJ6bdUwO43y6QWMJyjklBN9Ji
>   toolchain: gcc-11
> 
> --
> Linaro LKFT
> https://lkft.linaro.org
> 

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

