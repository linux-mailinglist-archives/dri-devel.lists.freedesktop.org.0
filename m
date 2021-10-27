Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9FF543CF83
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 19:16:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8E236E8D2;
	Wed, 27 Oct 2021 17:16:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05E5F6E8D2;
 Wed, 27 Oct 2021 17:16:37 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10150"; a="217127000"
X-IronPort-AV: E=Sophos;i="5.87,187,1631602800"; d="scan'208";a="217127000"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 10:16:37 -0700
X-IronPort-AV: E=Sophos;i="5.87,187,1631602800"; d="scan'208";a="555456684"
Received: from nsundare-mobl.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.255.84.29])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 10:16:36 -0700
Date: Wed, 27 Oct 2021 10:16:34 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Auld <matthew.william.auld@gmail.com>
Cc: Matthew Auld <matthew.auld@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 kernel test robot <lkp@intel.com>,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH 1/2] drm/i915/dmabuf: fix broken build
Message-ID: <20211027171634.5appoo2aclwssvpz@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20211021125332.2455288-1-matthew.auld@intel.com>
 <CAM0jSHNig=n9cw0CCNhWHnLn5hLPYFFQR4D9OgZ-QavgyJGJpg@mail.gmail.com>
 <20211027145414.mrpikqvdmg7qsb7g@ldmartin-desk2>
 <CAM0jSHMcnRCbXRud3K5wJERcww8urk7g1EDpMOEw7RW4LYPqMw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAM0jSHMcnRCbXRud3K5wJERcww8urk7g1EDpMOEw7RW4LYPqMw@mail.gmail.com>
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

On Wed, Oct 27, 2021 at 05:23:59PM +0100, Matthew Auld wrote:
>On Wed, 27 Oct 2021 at 15:54, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>>
>> On Wed, Oct 27, 2021 at 08:57:48AM +0100, Matthew Auld wrote:
>> >On Thu, 21 Oct 2021 at 13:54, Matthew Auld <matthew.auld@intel.com> wrote:
>> >>
>> >> wbinvd_on_all_cpus() is only defined on x86 it seems, plus we need to
>> >> include asm/smp.h here.
>> >>
>> >> Reported-by: kernel test robot <lkp@intel.com>
>> >> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> >> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> >
>> >Jani, would it make sense to cherry-pick this to -fixes? The offending
>> >commit is in drm-next, and there have been a few reports around this.
>> >
>> >Fixes: a035154da45d ("drm/i915/dmabuf: add paranoid flush-on-acquire")
>> >
>> >
>> >> ---
>> >>  drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c | 7 +++++++
>> >>  1 file changed, 7 insertions(+)
>> >>
>> >> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
>> >> index 1adcd8e02d29..a45d0ec2c5b6 100644
>> >> --- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
>> >> +++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
>> >> @@ -12,6 +12,13 @@
>> >>  #include "i915_gem_object.h"
>> >>  #include "i915_scatterlist.h"
>> >>
>> >> +#if defined(CONFIG_X86)
>> >> +#include <asm/smp.h>
>> >> +#else
>> >> +#define wbinvd_on_all_cpus() \
>> >> +       pr_warn(DRIVER_NAME ": Missing cache flush in %s\n", __func__)
>>
>>
>> not sure I understand why this is a fix. Sure, it's true, but right now
>> this file can't be built on any other arch.
>>
>> For clflush, wbind, etc, I'd rather change the code to use things from
>> drm_cache rather than ifdef it out locally. This is
>> "Reported-by: kernel test robot <lkp@intel.com>", but what's the error?
>
>I guess it depends on the kernel config, but it reported:
>error: implicit declaration of function 'wbinvd_on_all_cpus'

oh, ok. The commit message was not very clear. Just checked and this also matches what is done
in gem/i915_gem_pm.c  (although gt/intel_ggtt.c just includes it
unconditionally)

>
>AFAIK it's the missing <asm/smp.h>, the CONFIG_X86 thing is just for
>good measure.
>
>I didn't spot anything in drm_cache which just offers a simple wrapper
>for wbinvd?

there isn't yet, but it's something we are adding as we add suppport for
other archs.

thanks
Lucas De Marchi

>
>>
>> Lucas De Marchi
>>
>> >> +#endif
>> >> +
>> >>  I915_SELFTEST_DECLARE(static bool force_different_devices;)
>> >>
>> >>  static struct drm_i915_gem_object *dma_buf_to_obj(struct dma_buf *buf)
>> >> --
>> >> 2.26.3
>> >>
