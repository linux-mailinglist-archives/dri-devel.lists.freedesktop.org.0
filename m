Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A74F667DDC
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 19:21:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47A4C10E326;
	Thu, 12 Jan 2023 18:21:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DADF10E325;
 Thu, 12 Jan 2023 18:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673547683; x=1705083683;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=AB4nJsn8mcD2iWQBmhkKcjpcdLbjn4wx/PjfJRNydZg=;
 b=Jovf3BDhFaPXYICTLmlCcf4GVcBRbvQDSHpHrgq00GA0WU1734/+ts31
 VXd6nEVpiXA0+B8NfjrM0j8QYoJYGsJLf3JKpGKMQ1/kdHv7KaQNcnTvL
 tCjm/eA1qx3YfSe59KSGSPZ7tsQgOAnbhl8+jBgwIYTqbNIvL81FUMZ0Z
 3Y+Lmx1ZGJI1yV4jsmAPHQswoVDY1cQ8uCtHoELfZe8W+Lne1h/QoGFZt
 ac2Ab3jVuMSXJ0PfukjDON2v/3i+cXO4Jwz+HJxviOoDxe7MCcFmINA1u
 PlhEhX+Sc3wGS35SieM8rmVb+MK4jcqTwykYuls3ezLGs/v+TAIJ2COfw A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="325836387"
X-IronPort-AV: E=Sophos;i="5.97,211,1669104000"; d="scan'208";a="325836387"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2023 10:21:22 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="986692121"
X-IronPort-AV: E=Sophos;i="5.97,211,1669104000"; d="scan'208";a="986692121"
Received: from jacton-mobl.ger.corp.intel.com (HELO [10.213.195.171])
 ([10.213.195.171])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2023 10:21:21 -0800
Message-ID: <eae6ff8d-1b95-6cc9-db91-7b30cc1b7e8a@linux.intel.com>
Date: Thu, 12 Jan 2023 18:21:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [Intel-gfx] [RFC PATCH 04/20] drm/sched: Convert drm scheduler to
 use a work queue rather than kthread
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>
References: <20230102083019.24b99647@collabora.com>
 <7d6df13c-6c2e-d713-edc8-128d6e19f187@linux.intel.com>
 <Y7dEjcuc1arHBTGu@DUT025-TGLU.fm.intel.com>
 <Y7i0J3uQ+izOJcEb@DUT025-TGLU.fm.intel.com>
 <e8c301cb-c7d4-ed54-f3ab-61a5fcc7f940@linux.intel.com>
 <CAOFGe96yeF4SWxvHC5pxyggf=655q7+ZrFS+Zab42F-RE7UK1w@mail.gmail.com>
 <e6512993-5247-a577-abf4-97cdb21358a0@linux.intel.com>
 <Y72UpKPX6lr/ea7R@DUT025-TGLU.fm.intel.com>
 <Y74NSVeWdiKxdYci@DUT025-TGLU.fm.intel.com>
 <a443495f-5d1b-52e1-9b2f-80167deb6d57@linux.intel.com>
 <Y773Y0Q+dekoLqd5@DUT025-TGLU.fm.intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <Y773Y0Q+dekoLqd5@DUT025-TGLU.fm.intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, Jason Ekstrand <jason@jlekstrand.net>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 11/01/2023 17:52, Matthew Brost wrote:
> On Wed, Jan 11, 2023 at 09:09:45AM +0000, Tvrtko Ursulin wrote:

[snip]

>> Anyway, since you are not buying any arguments on paper perhaps you are more
>> open towards testing. If you would adapt gem_wsim for Xe you would be able
>> to spawn N simulated transcode sessions on any Gen11+ machine and try it
>> out.
>>
>> For example:
>>
>> gem_wsim -w benchmarks/wsim/media_load_balance_fhd26u7.wsim -c 36 -r 600
>>
>> That will run you 36 parallel transcoding sessions streams for 600 frames
>> each. No client setup needed whatsoever apart from compiling IGT.
>>
>> In the past that was quite a handy tool to identify scheduling issues, or
>> validate changes against. All workloads with the media prefix have actually
>> been hand crafted by looking at what real media pipelines do with real data.
>> Few years back at least.
>>
> 
> Porting this is non-trivial as this is 2.5k. Also in Xe we are trending
> to use UMD benchmarks to determine if there are performance problems as
> in the i915 we had tons microbenchmarks / IGT benchmarks that we found
> meant absolutely nothing. Can't say if this benchmark falls into that
> category.

I explained what it does so it was supposed to be obvious it is not a 
micro benchmark.

2.5k what, lines of code? Difficulty of adding Xe support does not scale 
with LOC but with how much it uses the kernel API. You'd essentially 
need to handle context/engine creation and different execbuf.

It's not trivial no, but it would save you downloading gigabytes of test 
streams, building a bunch of tools and libraries etc, and so overall in 
my experience it *significantly* improves the driver development 
turn-around time.

> We VK and compute benchmarks running and haven't found any major issues
> yet. The media UMD hasn't been ported because of the VM bind dependency
> so I can't say if there are any issues with the media UMD + Xe.
> 
> What I can do hack up xe_exec_threads to really hammer Xe - change it to
> 128x xe_engines + 8k execs per thread. Each exec is super simple, it
> just stores a dword. It creates a thread per hardware engine, so on TGL
> this is 5x threads.
> 
> Results below:
> root@DUT025-TGLU:mbrost# xe_exec_threads --r threads-basic
> IGT-Version: 1.26-ge26de4b2 (x86_64) (Linux: 6.1.0-rc1-xe+ x86_64)
> Starting subtest: threads-basic
> Subtest threads-basic: SUCCESS (1.215s)
> root@DUT025-TGLU:mbrost# dumptrace | grep job | wc
>    40960  491520 7401728
> root@DUT025-TGLU:mbrost# dumptrace | grep engine | wc
>      645    7095   82457
> 
> So with 640 xe_engines (5x are VM engines) it takes 1.215 seconds test
> time to run 40960 execs. That seems to indicate we do not have a
> scheduling problem.
> 
> This is 8 core (or at least 8 threads) TGL:
> 
> root@DUT025-TGLU:mbrost# cat /proc/cpuinfo
> ...
> processor       : 7
> vendor_id       : GenuineIntel
> cpu family      : 6
> model           : 140
> model name      : 11th Gen Intel(R) Core(TM) i7-1165G7 @ 2.80GHz
> stepping        : 1
> microcode       : 0x3a
> cpu MHz         : 2344.098
> cache size      : 12288 KB
> physical id     : 0
> siblings        : 8
> core id         : 3
> cpu cores       : 4
> ...
> 
> Enough data to be convinced there is not issue with this design? I can
> also hack up Xe to use less GPU schedulers /w a kthreads but again that
> isn't trivial and doesn't seem necessary based on these results.

Not yet. It's not only about how many somethings per second you can do. 
It is also about what effect to the rest of the system it creates.

Anyway I think you said in different sub-thread you will move away from 
system_wq, so we can close this one. With that plan at least I don't 
have to worry my mouse will stutter and audio glitch while Xe is 
churning away.

Regards,

Tvrtko
