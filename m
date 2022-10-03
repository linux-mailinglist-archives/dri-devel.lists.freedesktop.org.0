Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 392D75F39DB
	for <lists+dri-devel@lfdr.de>; Tue,  4 Oct 2022 01:31:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F8DE10E060;
	Mon,  3 Oct 2022 23:30:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42DD610E050;
 Mon,  3 Oct 2022 23:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664839848; x=1696375848;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=T09wrqbT5S1//ztH/0kzIiCfX8Q5DcPTfBDoHr0ph1c=;
 b=ZR2kalHgha426WRvlRPw/ArB9Utgmt53vLQn0Gca6yqam9sXdVBBpmKE
 obgrFe9ecP1HtOkyNB6V11t5cHAxfq28SVsFQAp/GA9mSrTczPTPMcvkK
 pncvLSP3guXnr46fo3UV0S1mmNZfXQaQHvrmiMTU6caQO+XPH2ZnLc3cA
 20TUoFyo+9pdWu0HqV1LnKXsM5iE52sUSfDye9zG6tDJEse+hdKP8psee
 sX+0e3uyZJPpdIyqSAIbZQvHbjuEdCE216sUZwXItcAd/tkgdOFnnh8VN
 1bLEaWiLJ98esRAeMSkYfumXef1Z3uEKVdkCYyl1ObtQw3hnAdbR4vkV7 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10489"; a="285977426"
X-IronPort-AV: E=Sophos;i="5.93,366,1654585200"; d="scan'208";a="285977426"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2022 16:30:47 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10489"; a="868802849"
X-IronPort-AV: E=Sophos;i="5.93,366,1654585200"; d="scan'208";a="868802849"
Received: from kbalinsk-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.213.7.91])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2022 16:30:43 -0700
Date: Tue, 4 Oct 2022 01:30:40 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Subject: Re: [PATCH v2 10/17] drm/i915/vm_bind: Abstract out common execbuf
 functions
Message-ID: <YztwoF//RAkN9b8z@ashyti-mobl2.lan>
References: <20221003061245.12716-1-niranjana.vishwanathapura@intel.com>
 <20221003061245.12716-11-niranjana.vishwanathapura@intel.com>
 <YzsFgcxgwHGgqvW0@ashyti-mobl2.lan>
 <20221003210617.GT22224@nvishwa1-DESK>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221003210617.GT22224@nvishwa1-DESK>
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
Cc: matthew.brost@intel.com, Andi Shyti <andi.shyti@linux.intel.com>,
 lionel.g.landwerlin@intel.com, tvrtko.ursulin@intel.com, jani.nikula@intel.com,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 thomas.hellstrom@intel.com, matthew.auld@intel.com, jason@jlekstrand.net,
 daniel.vetter@intel.com, christian.koenig@amd.com, paulo.r.zanoni@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Niranjana,

On Mon, Oct 03, 2022 at 02:06:18PM -0700, Niranjana Vishwanathapura wrote:
> On Mon, Oct 03, 2022 at 05:53:37PM +0200, Andi Shyti wrote:
> > Hi Niranjana,
> > 
> > [...]
> > 
> > > +	for_each_child(ce, child) {
> > > +		err = intel_context_pin_ww(child, ww);
> > > +		GEM_BUG_ON(err);	/* perma-pinned should incr a counter */
> > > +	}
> > > +
> > > +	for_each_child(ce, child) {
> > > +		err = eb_pin_timeline(child, throttle, nonblock);
> > > +		if (err)
> > > +			goto unwind;
> > > +		++i;
> > > +	}
> > 
> > any reason for having two separate for_each_child here?
> > 
> 
> This part is ported as is from i915_gem_execbuffer.c.
> Probably the author found it easy to unwind in case of error.

yes... yes... I know... but these hard copies are also a good
occasion to do some refactoring on the original code... but
anyway, let's keep this simple...

I forgot earlier:

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Andi
