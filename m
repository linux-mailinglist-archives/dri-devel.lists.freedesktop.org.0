Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D38367B90C
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 19:11:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A7BC10E004;
	Wed, 25 Jan 2023 18:11:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3306010E004;
 Wed, 25 Jan 2023 18:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674670301; x=1706206301;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=JuYjKJS9gbqNnrhb2oKijdYn0zeQyxwNNDDSL14po5s=;
 b=MUzoJvJRgjC8StWM9h5gzXFN+rMqNyjVZrQ+nvIRBy+x8MzBrDdVPbq0
 dmTgjJ9LN1ACosLtt3f/Icjzi0853RZE+fhlupUhfDi5ZytyQfjcKm3Ii
 W8PdaBMCpkXtRgeVjhvAj1D/UFJJT/1BO5snjkJcR7wZV2D5+23K10QEd
 SbfGTpxuAbFwL4LlG4Xw1yF+M9vXtUDGBwnCbHykvfa1qgWgwToKnseAX
 d+IrMlQqhOl2ZHU2aPLoBrMX3RyH5+IszUJviSDPTfwfQ4UbAJ6rhnlxZ
 Ltw1u+3OtLwgsxv0iFhaQJgyuet+FosIUvpUkIoxzWiy3a0DcBB0EE2aX g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10601"; a="306291659"
X-IronPort-AV: E=Sophos;i="5.97,246,1669104000"; d="scan'208";a="306291659"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2023 10:11:40 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10601"; a="731143891"
X-IronPort-AV: E=Sophos;i="5.97,246,1669104000"; d="scan'208";a="731143891"
Received: from dodonnel-mobl.ger.corp.intel.com (HELO [10.213.233.83])
 ([10.213.233.83])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2023 10:11:36 -0800
Message-ID: <371f3ce5-3468-b91d-d688-7e89499ff347@linux.intel.com>
Date: Wed, 25 Jan 2023 18:11:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [RFC v3 00/12] DRM scheduling cgroup controller
Content-Language: en-US
To: =?UTF-8?Q?Michal_Koutn=c3=bd?= <mkoutny@suse.com>
References: <20230112165609.1083270-1-tvrtko.ursulin@linux.intel.com>
 <20230123154239.GA24348@blackbody.suse.cz>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20230123154239.GA24348@blackbody.suse.cz>
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
Cc: Rob Clark <robdclark@chromium.org>, Kenny.Ho@amd.com,
 Dave Airlie <airlied@redhat.com>,
 =?UTF-8?Q?St=c3=a9phane_Marchesin?= <marcheu@chromium.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Intel-gfx@lists.freedesktop.org,
 Brian Welty <brian.welty@intel.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, Zefan Li <lizefan.x@bytedance.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Tejun Heo <tj@kernel.org>,
 cgroups@vger.kernel.org, "T . J . Mercier" <tjmercier@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hi,

On 23/01/2023 15:42, Michal Koutný wrote:
> Hello Tvrtko.
> 
> Interesting work.

Thanks!

> On Thu, Jan 12, 2023 at 04:55:57PM +0000, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com> wrote:
>> Because of the heterogenous hardware and driver DRM capabilities, soft limits
>> are implemented as a loose co-operative (bi-directional) interface between the
>> controller and DRM core.
> 
> IIUC, this periodic scanning, calculating and applying could be partly
> implemented with userspace utilities. (As you write, these limits are
> best effort only, so it sounds to me such a total implementation is
> unnecessary.)

I don't immediately see how you envisage the half-userspace 
implementation would look like in terms of what functionality/new APIs 
would be provided by the kernel?

> I think a better approach would be to avoid the async querying and
> instead require implementing explicit foo_charge_time(client, dur) API
> (similar to how other controllers achieve this).
> Your argument is the heterogenity of devices -- does it mean there are
> devices/drivers that can't implement such a synchronous charging?

Problem there is to find a suitable point to charge at. If for a moment 
we limit the discussion to i915, out of the box we could having charging 
happening at several thousand times per second to effectively never. 
This is to illustrate the GPU context execution dynamics which range 
from many small packets of work to multi-minute, or longer. For the 
latter to be accounted for we'd still need some periodic scanning, which 
would then perhaps go per driver. For the former we'd have thousands of 
needless updates per second.

Hence my thinking was to pay both the cost of accounting and collecting 
the usage data once per actionable event, where the latter is controlled 
by some reasonable scanning period/frequency.

In addition to that, a few DRM drivers already support GPU usage 
querying via fdinfo, so that being externally triggered, it is next to 
trivial to wire all those DRM drivers into such common DRM cgroup 
controller framework. All that every driver needs to implement on top is 
the "over budget" callback.

>> DRM core provides an API to query per process GPU utilization and 2nd API to
>> receive notification from the cgroup controller when the group enters or exits
>> the over budget condition.
> 
> The return value of foo_charge_time() would substitute such a
> notification synchronously. (By extension all clients in an affected
> cgroup could be notified to achieve some broader actions.)

Right, it is doable in theory, but as mention above some rate limit 
would have to be added. And the notification would still need to have 
unused budget propagation through the tree, so it wouldn't work to 
localize the action to the single cgroup (the one getting the charge).

>> Individual DRM drivers which implement the interface are expected to act on this
>> in the best-effort manner only. There are no guarantees that the soft limits
>> will be respected.
> 
> Back to original concern -- must all code reside in the kernel when it's
> essentially advisory resource control?
> 
>>   * DRM core is required to track all DRM clients belonging to processes so it
>>     can answer when asked how much GPU time is a process using.
>>   [...]
>>   * Individual drivers need to implement two similar hooks, but which work for
>>     a single DRM client. Over budget callback and GPU utilisation query.
> 
> This information is eventually aggregated for each process in a cgroup.
> (And the action is carried on a single client, not a process.)
> The per-process tracking seems like an additional indirection.
> Could be the clients associated directly with DRM cgroup? [1]

I think you could be right here - with some deeper integration with the 
cgroup subsystem this could probably be done. It would require moving 
the list of drm clients into the cgroup css state itself. Let me try and 
sketch that out in the following weeks because it would be a nice 
simplification if it indeed worked out.

Regards,

Tvrtko

> 
> 
> Regards,
> Michal
> 
> [1] I understand the sending a fd of a client is a regular operation, so
>      I'm not sure how cross-cg migrations would have to be handled in any
>      case.
