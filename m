Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E7FA3B2A0
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 08:39:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7AED10E1CF;
	Wed, 19 Feb 2025 07:39:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fnOQK2ht";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 984B810E1CF
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 07:39:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id A0B5FA41F5B;
 Wed, 19 Feb 2025 07:37:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CF18C4CEE6;
 Wed, 19 Feb 2025 07:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739950774;
 bh=pgRTuJF/vNg0LY60My1QaeV54AWgu4FtzhhiAB7jQW8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fnOQK2htDKmKHRx1o0+IqenQIMCVQSiPzU9HaylAnvHg9pEe00ExQPRm01E1dyQZf
 s9Ms2/G897XOehsQxE9WaP0cena8BsQ0S1IaHn9xJNbesO8K+/pXEjvM5f3fsUrv9Z
 5ycNGNN6st4CXcTpCkrPCByvKxDUgu+OMtNFhMNn8tHvgQsrkgGHZciNl42EU0927I
 9AAKiAeTDiFOlIwsL6JfDvjorp7nxfWM+RyQcQ1EInyrmx7rdYrgE31qgmTOcAKMwQ
 ytABuUhY6fju2EYnexU4EGE/KO7+OO3EMp+5Wi3PirMSZnaWXgDzYUg9sUJgAC9AqD
 P6hiJXeQj6W/w==
Date: Tue, 18 Feb 2025 23:39:32 -0800
From: Namhyung Kim <namhyung@kernel.org>
To: Ian Rogers <irogers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 Kan Liang <kan.liang@linux.intel.com>,
 James Clark <james.clark@linaro.org>, Weilin Wang <weilin.wang@intel.com>,
 Jean-Philippe Romain <jean-philippe.romain@foss.st.com>,
 Junhao He <hejunhao3@huawei.com>, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v1] perf drm_pmu: Add a tool like PMU to expose DRM
 information
Message-ID: <Z7WKtI6lwvAZPb1y@google.com>
References: <20250211071727.364389-1-irogers@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250211071727.364389-1-irogers@google.com>
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

Hi Ian,

On Mon, Feb 10, 2025 at 11:17:27PM -0800, Ian Rogers wrote:
> DRM clients expose information through usage stats as documented in
> Documentation/gpu/drm-usage-stats.rst (available online at
> https://docs.kernel.org/gpu/drm-usage-stats.html). Add a tool like
> PMU, similar to the hwmon PMU, that exposes DRM information.

Probably better to put this link in a file header comment.


> For example on a tigerlake laptop:
> ```
> $ perf list drm
> 
> List of pre-defined events (to be used in -e or -M):
> 
> drm:
>   drm-active-stolen-system0
>        [Total memory active in one or more engines. Unit: drm_i915]
>   drm-active-system0
>        [Total memory active in one or more engines. Unit: drm_i915]
>   drm-engine-capacity-video
>        [Engine capacity. Unit: drm_i915]
>   drm-engine-copy
>        [Utilization in ns. Unit: drm_i915]
>   drm-engine-render
>        [Utilization in ns. Unit: drm_i915]
>   drm-engine-video
>        [Utilization in ns. Unit: drm_i915]
>   drm-engine-video-enhance
>        [Utilization in ns. Unit: drm_i915]
>   drm-purgeable-stolen-system0
>        [Size of resident and purgeable memory bufers. Unit: drm_i915]
>   drm-purgeable-system0
>        [Size of resident and purgeable memory bufers. Unit: drm_i915]
>   drm-resident-stolen-system0
>        [Size of resident memory bufers. Unit: drm_i915]
>   drm-resident-system0
>        [Size of resident memory bufers. Unit: drm_i915]
>   drm-shared-stolen-system0
>        [Size of shared memory bufers. Unit: drm_i915]
>   drm-shared-system0
>        [Size of shared memory bufers. Unit: drm_i915]
>   drm-total-stolen-system0
>        [Size of shared and private memory. Unit: drm_i915]
>   drm-total-system0
>        [Size of shared and private memory. Unit: drm_i915]
> ```
> 
> System wide data can be gathered:
> ```
> $ perf stat -x, -I 1000 -e drm-active-stolen-system0,drm-active-system0,drm-engine-capacity-video,drm-engine-copy,drm-engine-render,drm-engine-video,drm-engine-video-enhance,drm-purgeable-stolen-system0,drm-purgeable-system0,drm-resident-stolen-system0,drm-resident-system0,drm-shared-stolen-system0,drm-shared-system0,drm-total-stolen-system0,drm-total-system0
> 1.000904910,0,bytes,drm-active-stolen-system0,1,100.00,,
> 1.000904910,0,bytes,drm-active-system0,1,100.00,,
> 1.000904910,36,capacity,drm-engine-capacity-video,1,100.00,,
> 1.000904910,0,ns,drm-engine-copy,1,100.00,,
> 1.000904910,1472970566175,ns,drm-engine-render,1,100.00,,
> 1.000904910,0,ns,drm-engine-video,1,100.00,,
> 1.000904910,0,ns,drm-engine-video-enhance,1,100.00,,
> 1.000904910,0,bytes,drm-purgeable-stolen-system0,1,100.00,,
> 1.000904910,38199296,bytes,drm-purgeable-system0,1,100.00,,
> 1.000904910,0,bytes,drm-resident-stolen-system0,1,100.00,,
> 1.000904910,4643196928,bytes,drm-resident-system0,1,100.00,,
> 1.000904910,0,bytes,drm-shared-stolen-system0,1,100.00,,
> 1.000904910,1886871552,bytes,drm-shared-system0,1,100.00,,
> 1.000904910,0,bytes,drm-total-stolen-system0,1,100.00,,
> 1.000904910,4643196928,bytes,drm-total-system0,1,100.00,,
> 2.264426839,0,bytes,drm-active-stolen-system0,1,100.00,,
> ```
> 
> Or for a particular process:
> ```
> $ perf stat -x, -I 1000 -e drm-active-stolen-system0,drm-active-system0,drm-engine-capacity-video,drm-engine-copy,drm-engine-render,drm-engine-video,drm-engine-video-enhance,drm-purgeable-stolen-system0,drm-purgeable-system0,drm-resident-stolen-system0,drm-resident-system0,drm-shared-stolen-system0,drm-shared-system0,drm-total-stolen-system0,drm-total-system0 -p 200027
> 1.001040274,0,bytes,drm-active-stolen-system0,6,100.00,,
> 1.001040274,0,bytes,drm-active-system0,6,100.00,,
> 1.001040274,12,capacity,drm-engine-capacity-video,6,100.00,,
> 1.001040274,0,ns,drm-engine-copy,6,100.00,,
> 1.001040274,1542300,ns,drm-engine-render,6,100.00,,
> 1.001040274,0,ns,drm-engine-video,6,100.00,,
> 1.001040274,0,ns,drm-engine-video-enhance,6,100.00,,
> 1.001040274,0,bytes,drm-purgeable-stolen-system0,6,100.00,,
> 1.001040274,13516800,bytes,drm-purgeable-system0,6,100.00,,
> 1.001040274,0,bytes,drm-resident-stolen-system0,6,100.00,,
> 1.001040274,27746304,bytes,drm-resident-system0,6,100.00,,
> 1.001040274,0,bytes,drm-shared-stolen-system0,6,100.00,,
> 1.001040274,0,bytes,drm-shared-system0,6,100.00,,
> 1.001040274,0,bytes,drm-total-stolen-system0,6,100.00,,
> 1.001040274,27746304,bytes,drm-total-system0,6,100.00,,
> 2.016629075,0,bytes,drm-active-stolen-system0,6,100.00,,
> ```

I've tested it briefly.

  $ ./perf stat -e drm-engine-render,drm-total-system0 -a sleep 1
  
   Performance counter stats for 'system wide':
  
   2,869,492,628,815 ns    drm-engine-render                                                     
       2,777,497,600 bytes drm-total-system0                                                     
  
         1.004182447 seconds time elapsed

It seems the numbers are quite big.

  $ ./perf stat -e drm-engine-render,drm-total-system0 -aA sleep 1
  
   Performance counter stats for 'system wide':
  
  CPU0    2,870,871,280,238 ns    drm_i915/drm-engine-render/                                           
  CPU1        <not counted> ns    drm_i915/drm-engine-render/                                           
  CPU2        <not counted> ns    drm_i915/drm-engine-render/                                           
  CPU3        <not counted> ns    drm_i915/drm-engine-render/                                           
  CPU0        2,750,578,688 bytes drm_i915/drm-total-system0/                                           
  CPU1        <not counted> bytes drm_i915/drm-total-system0/                                           
  CPU2        <not counted> bytes drm_i915/drm-total-system0/                                           
  CPU3        <not counted> bytes drm_i915/drm-total-system0/                                           
  
         1.001678363 seconds time elapsed

Ok, it only reads from the CPU0.  But I guess there are some
duplications.  Have you checked drm-client-id?

  $ ./perf stat -e drm-engine-render -a --per-thread sleep 1
  
   Performance counter stats for 'system wide':
  
              Xorg-6900       852,545,872,646 ns    drm-engine-render                                                     
       Xorg:disk$0-6901       852,545,872,646 ns    drm-engine-render                                                     
          Xorg:sh0-6902       852,545,872,646 ns    drm-engine-render                                                     
      Xorg:traceq0-6904       852,545,872,646 ns    drm-engine-render                                                     
        Xorg:gdrv0-6906       852,545,872,646 ns    drm-engine-render                                                     
       InputThread-6946       852,545,872,646 ns    drm-engine-render                                                     
       gnome-shell-7127       808,521,145,191 ns    drm-engine-render                                                     
      pool-spawner-7146       808,521,145,191 ns    drm-engine-render                                                     
             gmain-7147       808,521,145,191 ns    drm-engine-render                                                     
             gdbus-7149       808,521,145,191 ns    drm-engine-render                                                     
      dconf worker-7150       808,521,145,191 ns    drm-engine-render                                                     
         JS Helper-7151       808,521,145,191 ns    drm-engine-render                                                     
         JS Helper-7152       808,521,145,191 ns    drm-engine-render                                                     
      ...

Trying record..

  $ ./perf record -e drm-engine-render sleep 1
  failed to mmap with 9 (Bad file descriptor)

I think you can fail evsel__open() if attr.sample_period != 0.

> 
> As with the hwmon PMU, high numbered PMU types are used to encode
> multiple possible "DRM" PMUs. The appropriate fdinfo is found by
> scanning /proc and filtering which fdinfos to read with stat. To avoid
> some unneeding scanning, events not starting with "drm-" are ignored.

It's sad that it should scan /proc whenever it reads the event but I
don't think we have other options.


> The patch builds on commit 57e13264dcea ("perf pmus:
> Restructure pmu_read_sysfs to scan fewer PMUs") so that only if full
> wild carding is being done, that the drm PMUs will be read.

Can you please add a test case?

Thanks,
Namhyung
