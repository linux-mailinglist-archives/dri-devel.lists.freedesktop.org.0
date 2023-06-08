Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7150F7282B2
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 16:26:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4032610E5CB;
	Thu,  8 Jun 2023 14:26:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0307310E196;
 Thu,  8 Jun 2023 14:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686234394; x=1717770394;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=AOHF8Rb86ntesAI/yE6eOPe27CYMX9ghGd4LAdbYQLs=;
 b=BcwFml25Sr/dOSSPU1y6ThQrGTqKryVTHvrp3UCfNDOTkmtXwwBToeof
 vLfpHhjembt8qs82bnG8wJlJxDnMIZ0G+3udb9/oI++//U9+8us+Ujd4Z
 Z3W2r9xW2xZSqk7tMEpEFJDoY8ErkaiCyumpVEPnT7oTpN31jqHdghP9d
 SnF60o0pY+vetnr2JBQPq9hdqNinHABDP2WN5zZmqfoeVg2sHK7QczMwV
 gkK358S/QlrbwXLKsovyoi64iKOofvTH+f33KeYzFi2ZSmfo9geszQDzS
 vsPJw14j2JWEdFjyTmvnGgFjPFh6NP0JtTcbqDRbZjWX3Ko17TLI2LLgH Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="356177432"
X-IronPort-AV: E=Sophos;i="6.00,227,1681196400"; d="scan'208";a="356177432"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2023 07:26:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="956736343"
X-IronPort-AV: E=Sophos;i="6.00,227,1681196400"; d="scan'208";a="956736343"
Received: from rirwin-mobl3.ger.corp.intel.com (HELO [10.213.239.227])
 ([10.213.239.227])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2023 07:26:28 -0700
Message-ID: <77587046-aede-f625-6a35-55bf9c5f1179@linux.intel.com>
Date: Thu, 8 Jun 2023 15:26:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RFC 02/10] drm: Update file owner during use
Content-Language: en-US
To: Emil Velikov <emil.l.velikov@gmail.com>
References: <20230314141904.1210824-1-tvrtko.ursulin@linux.intel.com>
 <20230314141904.1210824-3-tvrtko.ursulin@linux.intel.com>
 <CACvgo52Bb3kBua8dh+eac6dhSwiJLMGAdGDAa+LQYoOwCLPLNA@mail.gmail.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <CACvgo52Bb3kBua8dh+eac6dhSwiJLMGAdGDAa+LQYoOwCLPLNA@mail.gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, cgroups@vger.kernel.org,
 Dave Airlie <airlied@redhat.com>, Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Kenny.Ho@amd.com, Intel-gfx@lists.freedesktop.org,
 Brian Welty <brian.welty@intel.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, "T . J . Mercier" <tjmercier@google.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Zefan Li <lizefan.x@bytedance.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Tejun Heo <tj@kernel.org>,
 =?UTF-8?Q?St=c3=a9phane_Marchesin?= <marcheu@chromium.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 21/04/2023 13:13, Emil Velikov wrote:
> Greetings everyone,
> 
> Above all - hell yeah. Thank you Tvrtko, this has been annoying the
> hell out of me for ages.

Yay!

> On Tue, 14 Mar 2023 at 14:19, Tvrtko Ursulin
> <tvrtko.ursulin@linux.intel.com> wrote:
>>
>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>
>> With the typical model where the display server opends the file descriptor
>> and then hands it over to the client we were showing stale data in
>> debugfs.
> 
> s/opends/opens/

Thanks!

> But as a whole the sentence is fairly misleading. Story time:
> 
> The traditional model, the server was the orchestrator managing the
> primary device node. From the fd, to the master status and
> authentication. But looking at the fd alone, this has varied across
> the years.
> 
> IIRC in the DRI1 days, Xorg (libdrm really) would have a list of open
> fd(s) and reuse those whenever needed, DRI2 the client was responsible
> for open() themselves and with DRI3 the fd was passed to the client.
> 
> Around the inception of DRI3 and systemd-logind, the latter became
> another possible orchestrator. Whereby Xorg and Wayland compositors
> could ask it for the fd. For various reasons (hysterical and genuine
> ones) Xorg has a fallback path going the open(), whereas Wayland
> compositors are moving to solely relying on logind... some never had
> fallback even.
> 
> Over the past few years, more projects have emerged which provide
> functionality similar (be that on API level, Dbus, or otherwise) to
> systemd-logind.
> 
> 
> Apart from that, the commit is spot on. I like the use of rcu and the
> was_master handling is correct. With some message polish this commit
> is:
> Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>

Are you okay if I just paste your very fine explanation verbatim, with 
credits?

> I also had a brief look at 01/10, although I cannot find many
> references for the pid <> tguid mappings. Be that on the kernel side
> or userspace - do you have any links that I can educate myself?

TGID or thread group leader. For single threaded userspace TGID equals 
to PID, while for multi-threaded first thread TGID equals PID/TID, while 
additional threads PID/TID does not equal TGID. Clear, as mud? :) My 
POSIX book is misplaced somewhere having not consulted it years... :)

Regards,

Tvrtko

