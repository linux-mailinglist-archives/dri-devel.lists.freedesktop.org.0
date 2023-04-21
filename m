Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C37CD6EA90D
	for <lists+dri-devel@lfdr.de>; Fri, 21 Apr 2023 13:23:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E8CD10E08B;
	Fri, 21 Apr 2023 11:23:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9F7610E08B;
 Fri, 21 Apr 2023 11:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682076203; x=1713612203;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=74+qAqIgYF47Iz1gO9HKLYWhwUWDspIE8Lqjj6JQMno=;
 b=hL7DENgiIFf+BqHX6EiXIJ1HxRH+00Oe11R0OZQT1lqy9sHxDP8LotET
 fJ1QS7nTO0IYyBhWFFrp2rAQcqlTSOaj5HJIZ6THwIvHHDEf79a/Z46ac
 WpxWLkcvhW8fbB1/G9ksA1c79Vxf8Fc5Y0SMTdLzMrDk5N1bZZsK9YYnw
 KVdK+4+LVx0iL/I8DmBtzRw+FRv5SKY9YpnvkyhSjX5X4dt0MRTJrQb54
 uEuUi3DXrYICrxJK1P6zec7mZBgwPzVnageQQO8X4VTCH+vzfce9YJF3m
 YU6AFCpMWw0OGQo+Rmi/eT9eVUaPkx1qZ917LLd9ADVtI4eUBGBnLVHNM A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="344726470"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="344726470"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2023 04:23:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="781575235"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="781575235"
Received: from vhavelx-mobl2.ger.corp.intel.com (HELO [10.213.192.37])
 ([10.213.192.37])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2023 04:23:19 -0700
Message-ID: <f2a423c2-302a-024a-cf65-199f4be6caec@linux.intel.com>
Date: Fri, 21 Apr 2023 12:23:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v4 5/6] drm: Add fdinfo memory stats
Content-Language: en-US
To: Emil Velikov <emil.l.velikov@gmail.com>, Rob Clark <robdclark@gmail.com>
References: <20230412224311.23511-1-robdclark@gmail.com>
 <20230412224311.23511-6-robdclark@gmail.com>
 <CACvgo525ogS4LSZDUyaqjSqjJWj=qLRkphji5469=3obFXoMrQ@mail.gmail.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <CACvgo525ogS4LSZDUyaqjSqjJWj=qLRkphji5469=3obFXoMrQ@mail.gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>, linux-arm-msm@vger.kernel.org,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Christopher Healy <healych@amazon.com>, dri-devel@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, freedreno@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 21/04/2023 11:26, Emil Velikov wrote:
> On Wed, 12 Apr 2023 at 23:43, Rob Clark <robdclark@gmail.com> wrote:
> 
>> +/**
>> + * enum drm_gem_object_status - bitmask of object state for fdinfo reporting
>> + * @DRM_GEM_OBJECT_RESIDENT: object is resident in memory (ie. not unpinned)
>> + * @DRM_GEM_OBJECT_PURGEABLE: object marked as purgeable by userspace
>> + *
>> + * Bitmask of status used for fdinfo memory stats, see &drm_gem_object_funcs.status
>> + * and drm_show_fdinfo().  Note that an object can DRM_GEM_OBJECT_PURGEABLE if
>> + * it still active or not resident, in which case drm_show_fdinfo() will not
> 
> nit: s/can/can be/;s/if it still/if it is still/
> 
>> + * account for it as purgeable.  So drivers do not need to check if the buffer
>> + * is idle and resident to return this bit.  (Ie. userspace can mark a buffer
>> + * as purgeable even while it is still busy on the GPU.. it does not _actually_
>> + * become puregeable until it becomes idle.  The status gem object func does
> 
> nit: s/puregeable/purgeable/
> 
> 
> I think we want a similar note in the drm-usage-stats.rst file.
> 
> With the above the whole series is:
> Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>

Have you maybe noticed my slightly alternative proposal? (*) I am not a 
fan of putting this flavour of accounting into the core with no way to 
opt out. I think it leaves no option but to add more keys in the future 
for any driver which will not be happy with the core accounting.

*) https://patchwork.freedesktop.org/series/116581/

> Fwiw: Keeping the i915 patch as part of this series would be great.
> Sure i915_drm_client->id becomes dead code, but it's a piece one can
> live with for a release or two. Then again it's not my call to make.

Rob can take the i915 patch from my RFC too.

Regards,

Tvrtko
