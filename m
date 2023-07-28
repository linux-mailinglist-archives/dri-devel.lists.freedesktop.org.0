Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B57A176675E
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 10:36:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A8AB10E69C;
	Fri, 28 Jul 2023 08:36:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (unknown [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F20F910E69C
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 08:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690533395; x=1722069395;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=nrP+VOULuhjb3nIHnfKJL8kLB8eWi4wGZ7YD/WQUXB4=;
 b=mdzzs83NFQ8EPqwjtClPi35a0TPWHbXY/MrhkqWmDFKGkfTLF3X3R7eg
 L4eP2QFzQsHnQSLooIwCQsrjsrxJvyPBUO4yO/M/Pcbc0w8BVEFL8y5Hg
 8CNZlI6dqrPJkRsbsYOupOxzCTVvlvEQ8kuVvhwPQdrVBH1GIb4S3MIL4
 1D+oP9JlCmPDyZc51pmmvYC9vxIQAcIxHQFOs+1XlQn9QGwPcuF+uzZPs
 VZVIC9qxptj6TVXa4kz0RGyn4CVLIU9T6tIoiWlMvsIbuplYYxpYbrT3q
 QZK6SwiDr/FXVrwsLwM9Rl4vSXiJ/IzLe/hz5AEiDANYmUmsEGy3OJZry w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="371243060"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; d="scan'208";a="371243060"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2023 01:36:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="727392299"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; d="scan'208";a="727392299"
Received: from atoomey-mobl.amr.corp.intel.com (HELO [10.213.197.30])
 ([10.213.197.30])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2023 01:36:29 -0700
Message-ID: <9b86526b-7afd-6335-e68f-3f390f1c3266@linux.intel.com>
Date: Fri, 28 Jul 2023 09:36:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: CPU overhead for drm fdinfo stats
Content-Language: en-US
To: Alex Deucher <alexdeucher@gmail.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 "Ursulin, Tvrtko" <tvrtko.ursulin@intel.com>, Rob Clark
 <robdclark@gmail.com>, Christian Koenig <christian.koenig@amd.com>
References: <CADnq5_Pr8Z=vNO3iEpHNqkV0mb8gNzN7Zvf9HSW0Sf3Q0yy=Pw@mail.gmail.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <CADnq5_Pr8Z=vNO3iEpHNqkV0mb8gNzN7Zvf9HSW0Sf3Q0yy=Pw@mail.gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 27/07/2023 21:58, Alex Deucher wrote:
> We have a number of customers using these stats, but the issue that
> keeps coming up is the CPU overhead to gather them, particularly on
> systems with hundreds of processes using the GPU.  Has anyone given
> any thought to having a single interface to get this information for
> the entire GPU in one place?

Could I have a framed told you so certificate please? :D

Well at least it depends on how much CPU overhead would your users be 
happy to eliminate and how much to keep. So maybe no need for that 
certificate just yet.

I was raising the issue of exponential complexity of walking "total 
number of processes" x "total number of file descriptors" on a system 
from the inception of fdinfo.

So for that issue the idea was to perhaps expose a list of pids with DRM 
fds open somewhere, maybe sysfs.

That would eliminate walking _all_ processes and trying to parse any 
their file descriptor.

But it would still require walking all file descriptors belonging to 
processes with DRM fds open.

If that wouldn't be enough of a saving for your users then no, I am not 
aware it was discussed. Assuming at least you were suggesting something 
like "read all fdinfo for all clients" in one blob. Also in sysfs? I 
think it would be doable by walking the dev->filelist and invoking 
drm_show_fdinfo() on them.

Out of curiosity are they using the fdinfo parsing code from IGT or 
something of their own?

Regards,

Tvrtko
