Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40492CB6227
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 15:04:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80C6010E81F;
	Thu, 11 Dec 2025 14:04:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CXRN+6cS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 262D289C7F;
 Thu, 11 Dec 2025 14:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765461876; x=1796997876;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8rju0sIOdUgAVxzoAbCeZb5Ok9k0o3hFXh44STEZKGM=;
 b=CXRN+6cSTH1D+KJe+ukAUlH+LR9AEfhJwjGHyyZvbslibjapaPjfmAXx
 2uDhR1ANYGJv+jd04NWu8sWrIYIbJlXgPVvNRbpezgD+oIvclQhCXcpoL
 zzGBrIPRVJmvyvgz6oQpEPsEnx8RsYFpPVA1xI+4LyRo138kKGU5PFQ+/
 GUSO5/GfSCeev2YlXwY4Rs07xkt2NbSDxVvjz5sxh2zxKt5wQTDXkUywU
 x90Itwzq4utGZwg+hlqu0mS7gFCN+ocryF5SYCo4zoqm8RiH0MyoZ9GzC
 dkIiBW7cfj2GHBxBezCSnZNEf6LbEZFVLHVtZFZgqX7wcCu69UKjfRv0u w==;
X-CSE-ConnectionGUID: LzqqKQxuSqe0L3ACfCAS8Q==
X-CSE-MsgGUID: /F/7K3xOQz6D3PcIVEyugQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="67176536"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="67176536"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 06:04:35 -0800
X-CSE-ConnectionGUID: 0+WJemQkSdSqfEjt8Uhsyw==
X-CSE-MsgGUID: pK9oDWMoQViNHqcsPOBK5g==
X-ExtLoop1: 1
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.246.254])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 06:04:31 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 stable@vger.kernel.org, =?UTF-8?B?6rmA6rCV66+8?= <km.kim1503@gmail.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Subject: Re: [PATCH v3] drm/i915/gem: Zero-initialize the eb.vma array in
 i915_gem_do_execbuffer()
Date: Thu, 11 Dec 2025 15:04:29 +0100
Message-ID: <2468170.UQZUX1FTLU@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <ezfzff7burfabd2b4ofna5pmue2m64zn3gin2uyefnk7fczizk@f52nhwgfliyh>
References: <20251210165659.29349-3-krzysztof.niemiec@intel.com>
 <ezfzff7burfabd2b4ofna5pmue2m64zn3gin2uyefnk7fczizk@f52nhwgfliyh>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
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

On Thursday, 11 December 2025 12:24:31 CET Krzysztof Karas wrote:
> Hi Krzysztof,
> 
> [...]
> 
> > @@ -3375,7 +3360,9 @@ i915_gem_do_execbuffer(struct drm_device *dev,
> >  
> >  	eb.exec = exec;
> >  	eb.vma = (struct eb_vma *)(exec + args->buffer_count + 1);
> > -	eb.vma[0].vma = NULL;
> > +
> > +	memset(eb.vma, 0x00, args->buffer_count * sizeof(struct eb_vma));
> > +
> >  	eb.batch_pool = NULL;
> >  
> >  	eb.invalid_flags = __EXEC_OBJECT_UNKNOWN_FLAGS;
> > @@ -3584,7 +3571,16 @@ i915_gem_execbuffer2_ioctl(struct drm_device *dev, void *data,
> >  	if (err)
> >  		return err;
> >  
> > -	/* Allocate extra slots for use by the command parser */
> > +	/*
> > +	 * Allocate extra slots for use by the command parser.
> > +	 *
> > +	 * Note that this allocation handles two different arrays (the
> > +	 * exec2_list array, and the eventual eb.vma array introduced in
> > +	 * i915_gem_do_execubuffer()), that reside in virtually contiguous
> > +	 * memory. Also note that the allocation doesn't fill the area with
> > +	 * zeros (the first part doesn't need to be), but the second part only
> > +	 * is explicitly zeroed later in i915_gem_do_execbuffer().
> I get the gist of this comment, but I think you could reword the
> last sentence:
> "Also note that the allocation doesn't fill the area with zeros,
> because it is unnecessary for exec2_list array, and eb.vma is
> explicitly zeroed later in i915_gem_do_execbuffer()."

My preferred wording would look something like this:

Also note that the allocation intentionally doesn't fill the area with 
zeros since the exec2_list array part is then fully overwritten with a 
copy of user data before use.  However, the eb.vma array part is still 
expected to be initialized as needed by its user.

Thanks,
Janusz

> 
> > +	 */
> >  	exec2_list = kvmalloc_array(count + 2, eb_element_size(),
> >  				    __GFP_NOWARN | GFP_KERNEL);
> >  	if (exec2_list == NULL) {
> 
> 




