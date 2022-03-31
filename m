Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C93A4ED581
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 10:25:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A10B10F672;
	Thu, 31 Mar 2022 08:25:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D017B10F670;
 Thu, 31 Mar 2022 08:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648715131; x=1680251131;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=KCSXDm3RC4aQp01a11FrJWqsx450JrWrRKmLFEH0CtQ=;
 b=OPE5H/W3jyGGQFvUYE0lUohQH8EaZ6qrW5N25yY39rAc52KqJBP8gicr
 jYcaooiMsI/729GrD46flnM5F5zXU4SGcLmQCeB1MyI2mEZia4VEBDrJl
 X30rk9bZm/vdUbmqvT/y8SmWcZAx9f6xQu2fkrvlSVog5OAyyFt4fnmD7
 dZC6SZBcaSRmHc2dm8mz+K4oN1Q7/AXtQ3t/3X/yr4FkG3E2zaK6LnmBI
 OXegOScptBOFYhGvDm/tRsCRuvtMxwWjUtglAx5SIvksEcyzqYfIFnSTn
 4ouaVI3J/sINl99DR1W12kXh6gKVF/b0hd6GLvxWxPBoP5wHK6wvRZZBe g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="259937577"
X-IronPort-AV: E=Sophos;i="5.90,224,1643702400"; d="scan'208";a="259937577"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 01:25:31 -0700
X-IronPort-AV: E=Sophos;i="5.90,224,1643702400"; d="scan'208";a="566269025"
Received: from cgarnier-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.62.224])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 01:25:27 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Wang, Zhi A" <zhi.a.wang@intel.com>, Christoph Hellwig <hch@lst.de>,
 Zhi Wang <zhi.wang.linux@gmail.com>
Subject: Re: [PATCH v7 1/3] i915/gvt: Separate the MMIO tracking table from
 GVT-g
In-Reply-To: <4af59d97-b583-4022-3ec3-360e7df43689@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220325175251.167164-1-zhi.a.wang@intel.com>
 <20220328065008.GA29798@lst.de>
 <4af59d97-b583-4022-3ec3-360e7df43689@intel.com>
Date: Thu, 31 Mar 2022 11:25:25 +0300
Message-ID: <871qyibkay.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Zhi Wang <zhi.a.wang@gmail.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Jason Gunthorpe <jgg@nvidia.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 31 Mar 2022, "Wang, Zhi A" <zhi.a.wang@intel.com> wrote:
> Hi Jani and Joonas:
>
> Are you OK with these patches? I noticed I need to change the license
> of the new file. Will do that when check-in if you are OK with these.

Use SPDX license header instead of the full text?

I don't know much about the actual contents, I'll leave that part to
others.

Seems that you are dropping const in a number of places where I thought
you could perhaps retain it.

Also in drivers/gpu/drm/i915/intel_gvt_mmio_table.c:

#include "gvt.h" 

looks bad. It should be "gvt/gvt.h". I realize you can do that because
gvt/Makefile has:

ccflags-y += -I $(srctree)/$(src) -I $(srctree)/$(src)/$(GVT_DIR)/

which I think should be removed.

I sent patches fixing this to give you an idea. No need to queue them
first, I can rebase them later. But please make sure this builds without
the ccflags.


BR,
Jani.


>
> Thanks,
> Zhi.
>
> On 3/28/22 6:50 AM, Christoph Hellwig wrote:
>> On Fri, Mar 25, 2022 at 01:52:49PM -0400, Zhi Wang wrote:
>>>
>>> v7:
>>>
>>> - Keep the marcos of device generation in GVT-g. (Christoph, Jani)
>> 
>> The changelog go under the "---" line (also for the other patches).
>> 
>> Otherwise looks good:
>> 
>> Reviewed-by: Christoph Hellwig <hch@lst.de>
>> 
>

-- 
Jani Nikula, Intel Open Source Graphics Center
