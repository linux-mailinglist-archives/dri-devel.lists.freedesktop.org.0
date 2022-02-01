Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 390694A58F4
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 10:09:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9CAA10E5F5;
	Tue,  1 Feb 2022 09:09:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DF4210E5F5;
 Tue,  1 Feb 2022 09:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643706544; x=1675242544;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=nhJLTuyBB3KiQVqGcKTS+5p6NB5lOpznI/LO6Fl/2Hs=;
 b=iJbet41tRxchHc9brAWjBJ6shL33Hyb0e5PY7W6Y+dlamxtpf0AdS9SU
 Xs7dPPZc3cwMu7CTMqQHRRgMVtoZvzEsm9d4flxafyFS+VNx2R+HAJalx
 Yf1M9D1zUA6rxF6C2ARr4IUDJm2oyZ8SU6dmL4UcjJ7fVFosARCWP0Zn9
 hn7DSchYaN+JlE580iWC1iK3reresCNXn+pkQRA7Oys8eoZRVe4Ar+nn/
 KxTCGoGToZPvZBQ0Hno5qvphilzZUoJfPn5lCudgu1QbfQfVaknVmNp7g
 Ft/iynjIPwcBWWXk4kVpeebGpHLOowf2hKwz8/W7K6FyB821EbfYjnc84 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10244"; a="228308977"
X-IronPort-AV: E=Sophos;i="5.88,333,1635231600"; d="scan'208";a="228308977"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2022 01:09:03 -0800
X-IronPort-AV: E=Sophos;i="5.88,333,1635231600"; d="scan'208";a="698339217"
Received: from bconlan-mobl1.ger.corp.intel.com (HELO [10.213.212.46])
 ([10.213.212.46])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2022 01:09:01 -0800
Message-ID: <c2e873de-9031-ea80-acd6-45ef53000635@linux.intel.com>
Date: Tue, 1 Feb 2022 09:08:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [Intel-gfx] linux-next: build failure after merge of the
 drm-intel-fixes tree
Content-Language: en-US
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>
References: <20220201092735.1d5b38d3@canb.auug.org.au>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20220201092735.1d5b38d3@canb.auug.org.au>
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 31/01/2022 22:27, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the drm-intel-fixes tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> drivers/gpu/drm/i915/i915_vma.c: In function 'i915_vma_bind':
> drivers/gpu/drm/i915/i915_vma.c:451:25: error: 'ret' undeclared (first use in this function); did you mean 'net'?
>    451 |                         ret = i915_gem_object_wait_moving_fence(vma->obj, true);
>        |                         ^~~
>        |                         net
> 
> Caused by commit
> 
>    2e872d87cbf2 ("drm/i915: delete shadow "ret" variable")
> 
> I have reverted that commit for today.

Dropping was the right call - I have since removed it from 
drm-intel-fixes as well.

Root cause was a bad Fixes: tag in that patch which caused it to be 
wrongly cherry-picked and I did not build test before pushing.

We can't edit the wrong Fixes: tag now, so for future reference only, 
2e872d87cbf2 ("drm/i915: delete shadow "ret" variable") should not be 
backported to 5.17 by anyone.

Wrong tag:
Fixes: f6c466b84cfa ("drm/i915: Add support for moving fence waiting")

Correct tag should have been:
Fixes: 2f6b90da9192 ("drm/i915: Use vma resources for async unbinding")

Regards,

Tvrtko
