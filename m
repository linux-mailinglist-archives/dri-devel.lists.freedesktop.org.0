Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E5C67D3E9
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 19:16:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A98D210E96D;
	Thu, 26 Jan 2023 18:16:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CB4510E969;
 Thu, 26 Jan 2023 18:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674756984; x=1706292984;
 h=message-id:date:mime-version:subject:from:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=fR8V4aQuW/ZVKBC+MbolGNbeqVBRPpZSaKYM1TDnfic=;
 b=hButNLzdVYQAzhOBJxi/+34liyGebvcPW8oIunwyZGLr9D/cVl/Blgux
 EM5qq0w+2UZv0XVja909bb2oBRCsP1GRXxNgQ3J81QtVPbuWBQmZOlRxp
 DhMOtBdUNNIo0Law9QYfh4GOhMJhK+Hl8koa1DJh5AAv7BQXl2JgmsPrb
 UxWVu9gQdEit91NFQ8W1vaJxEu9rzRxKTa2qpAgYskgPMCeO5zrUFR7Pn
 UXSRUozSnt3p30jfY7UzIqT2vd4LgvQK4K4PnjXCqZWTXGcFDK+FtiN02
 W7Tq7/nj40osRofc5R4fU6xERn2KMvObDFs4WPyYD//bIo0bDnXeYbbAr w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="413119265"
X-IronPort-AV: E=Sophos;i="5.97,249,1669104000"; d="scan'208";a="413119265"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2023 10:14:53 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="695207731"
X-IronPort-AV: E=Sophos;i="5.97,249,1669104000"; d="scan'208";a="695207731"
Received: from kbrennan-mobl.ger.corp.intel.com (HELO [10.213.233.58])
 ([10.213.233.58])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2023 10:14:49 -0800
Message-ID: <2c14b00c-c3bc-75dd-361b-54c6846fc59a@linux.intel.com>
Date: Thu, 26 Jan 2023 18:14:46 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [RFC v3 00/12] DRM scheduling cgroup controller
Content-Language: en-US
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Tejun Heo <tj@kernel.org>, =?UTF-8?Q?Michal_Koutn=c3=bd?=
 <mkoutny@suse.com>
References: <20230112165609.1083270-1-tvrtko.ursulin@linux.intel.com>
 <20230123154239.GA24348@blackbody.suse.cz>
 <371f3ce5-3468-b91d-d688-7e89499ff347@linux.intel.com>
 <20230126130050.GA22442@blackbody.suse.cz> <Y9KyiCPYj2Mzym3Z@slm.duckdns.org>
 <b8a0872c-fe86-b174-ca3b-0fc04a98e224@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <b8a0872c-fe86-b174-ca3b-0fc04a98e224@linux.intel.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Kenny.Ho@amd.com,
 Dave Airlie <airlied@redhat.com>,
 =?UTF-8?Q?St=c3=a9phane_Marchesin?= <marcheu@chromium.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Intel-gfx@lists.freedesktop.org,
 Brian Welty <brian.welty@intel.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, Zefan Li <lizefan.x@bytedance.com>,
 Johannes Weiner <hannes@cmpxchg.org>, cgroups@vger.kernel.org,
 "T . J . Mercier" <tjmercier@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 26/01/2023 17:57, Tvrtko Ursulin wrote:
> On 26/01/2023 17:04, Tejun Heo wrote:

>> driver folks think about the current RFC tho. Is at least AMD on board 
>> with
>> the approach?
> 
> Yes I am keenly awaiting comments from the DRM colleagues as well.

Forgot to mention one thing on this point which may interest AMD.

Some time ago I tested the super primitive "throttling via lowering the 
scheduling priority" on a GuC based i915 GPU, so only three supported 
priority levels, and FWIW it can be somewhat effective.

It certainly was effective for my main use case which is "run this GPU 
workload in the background while I use the GPU for something else".

The actual test was along the lines of running a GPU hog in parallel to 
an interactive client which can measure dropped frames.

With equal drm.weights the interactive client was seeing ~10 (i915 
pre-GuC) or ~27 (i915 GuC) dropped frames per second (60 fps target). 
With the GPU hog drm.weight lowered to 1:10 that dropped to ~3 dropped 
frames per second (all 3 before the over budget condition was noticed by 
the controller).

Main take here is that improved user experience is possible even with 
this primitive throttling method and even on GPUs which support only 
three scheduling priority levels.

Although main thing still is that individual drivers are completely free 
to improve their method of handling to the over budget signal. Nothing 
in the controller itself should be precluding that.

Regards,

Tvrtko
