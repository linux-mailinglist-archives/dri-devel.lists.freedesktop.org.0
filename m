Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0AE4730CB
	for <lists+dri-devel@lfdr.de>; Mon, 13 Dec 2021 16:45:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FF0210E85F;
	Mon, 13 Dec 2021 15:45:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD3C610E852;
 Mon, 13 Dec 2021 15:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639410344; x=1670946344;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=21nKNVcV8KSqzdESBthYUCCZKtWtFQyHDWyeHHzae70=;
 b=PlLPB4TJAQfDwbFZuwNDCA7uFA9LMFXmZ2QbUbch5Hex20UFGEHGYaMK
 z4/hVvnd8evUSftdZOafrw0a25FFEXxEVOZxxno8KXK6+rjf49ilvFtke
 klll0zGNhxP3SCW7LlVHPEmfEf/zxBCOjsWcA8mPwRyadlsqwZd8pg4d2
 B3Sp5G9OkszuBOLEX5K1C7WuvtyQZJh3SCHlv5xgPFm6itY5wM3Ban6yY
 lH0j8zXnOwxpdn+IQw97tlNbDS2A0GAZMjig079OtoiiotvDyEuCW2RnE
 gdBZFYYcTZnjbCiydpkyhTD/1mT3bVkZXMHwMOHPWGz7F10/59cTe6Yz/ A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10196"; a="218773197"
X-IronPort-AV: E=Sophos;i="5.88,202,1635231600"; d="scan'208";a="218773197"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2021 07:45:44 -0800
X-IronPort-AV: E=Sophos;i="5.88,202,1635231600"; d="scan'208";a="463418510"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2021 07:45:43 -0800
Date: Mon, 13 Dec 2021 07:45:43 -0800
From: Ira Weiny <ira.weiny@intel.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH 1/7] drm/i915: Replace kmap() with kmap_local_page()
Message-ID: <20211213154543.GM3538886@iweiny-DESK2.sc.intel.com>
References: <20211210232404.4098157-1-ira.weiny@intel.com>
 <20211210232404.4098157-2-ira.weiny@intel.com>
 <Ybc/HwaG2vgbdkQr@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Ybc/HwaG2vgbdkQr@intel.com>
User-Agent: Mutt/1.11.1 (2018-12-01)
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
Cc: amd-gfx@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 13, 2021 at 02:39:59PM +0200, Ville Syrjälä wrote:
> On Fri, Dec 10, 2021 at 03:23:58PM -0800, ira.weiny@intel.com wrote:
> > From: Ira Weiny <ira.weiny@intel.com>
> > 
> > kmap() is being deprecated and these usages are all local to the thread
> > so there is no reason kmap_local_page() can't be used.
> > 
> > Replace kmap() calls with kmap_local_page().
> > 
> > Signed-off-by: Ira Weiny <ira.weiny@intel.com>
> > ---
> >  drivers/gpu/drm/i915/gem/i915_gem_shmem.c          | 4 ++--
> >  drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c | 8 ++++----
> >  drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c       | 4 ++--
> >  drivers/gpu/drm/i915/gt/shmem_utils.c              | 4 ++--
> >  drivers/gpu/drm/i915/i915_gem.c                    | 8 ++++----
> >  drivers/gpu/drm/i915/i915_gpu_error.c              | 4 ++--
> >  6 files changed, 16 insertions(+), 16 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> > index d77da59fae04..fa8b820e14aa 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> > @@ -597,9 +597,9 @@ i915_gem_object_create_shmem_from_data(struct drm_i915_private *dev_priv,
> >  		if (err < 0)
> >  			goto fail;
> >  
> > -		vaddr = kmap(page);
> > +		vaddr = kmap_local_page(page);
> >  		memcpy(vaddr, data, len);
> > -		kunmap(page);
> > +		kunmap_local(vaddr);
> >  
> >  		err = pagecache_write_end(file, file->f_mapping,
> >  					  offset, len, len,
> > diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
> > index 6d30cdfa80f3..e59e1725e29d 100644
> > --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
> > +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
> > @@ -144,7 +144,7 @@ static int check_partial_mapping(struct drm_i915_gem_object *obj,
> >  	intel_gt_flush_ggtt_writes(&to_i915(obj->base.dev)->gt);
> >  
> >  	p = i915_gem_object_get_page(obj, offset >> PAGE_SHIFT);
> > -	cpu = kmap(p) + offset_in_page(offset);
> > +	cpu = kmap_local_page(p) + offset_in_page(offset);
> 
> Does kunmap_local() do some magic to make it work even when you
> don't pass in the same value you got from kmap_local_page()?

Yes.  It sounds like a patch like this would be nice to clarify?

Ira

diff --git a/include/linux/highmem-internal.h b/include/linux/highmem-internal.h
index 0a0b2b09b1b8..fb2d3e033c01 100644
--- a/include/linux/highmem-internal.h
+++ b/include/linux/highmem-internal.h
@@ -246,6 +246,17 @@ do {                                                               \
        __kunmap_atomic(__addr);                                \
 } while (0)
 
+/**
+ * kunmap_local - Unmap a page mapped via kmap_local_page().
+ * @__addr: An address within the page mapped
+ *
+ * __addr is often an address returned from kmap_local_page().  However,
+ * this address can be any address within the mapped page.  It does not need to
+ * be the exact address returned from kmap_local_page()
+ *
+ * Unmapping should be done in the reverse order of the mapping.  See
+ * kmap_local_page() for details.
+ */
 #define kunmap_local(__addr)                                   \
 do {                                                           \
        BUILD_BUG_ON(__same_type((__addr), struct page *));     \

