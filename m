Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB4BC52B2BE
	for <lists+dri-devel@lfdr.de>; Wed, 18 May 2022 08:51:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01A2A10E20F;
	Wed, 18 May 2022 06:51:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF34F10E0F5;
 Wed, 18 May 2022 06:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652856701; x=1684392701;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=JVjJoL/kB24+LI3isyatzAgJIVLilwo26EY3gDvQSho=;
 b=kOGkCcr5h5qJoe5IiJGer4XKB41WwNuiSqS2iaXig0nOhPQUpaPblco5
 o5GET58wY9PTg8sb+Fk8gTAl5U6JuV9gEpvNgFP81LVZ0Xc4a9MMqaszb
 P9lN2x91jN0qFeES3i9fbFyPcrqG6dRzzweg/8TzeOo7FSpqp7eHSi+t5
 xlt1KZS2E/M5ZN1s7XmG1g3ortPJUMy+9fx+k0ZVMaZMMTBFVjevpaetQ
 +w0bEAk1s0YqbpxqpZ3vlSK1lJWGqgrQxaDKg2iF8GGo4Gb3q7Bbr4mRZ
 PFlTc9N7HFDeWzy5h3nnOyzO5ve2qWUb7Eufo371bqLdQabYq1ZYq42dL A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10350"; a="269095567"
X-IronPort-AV: E=Sophos;i="5.91,234,1647327600"; d="scan'208";a="269095567"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2022 23:51:38 -0700
X-IronPort-AV: E=Sophos;i="5.91,234,1647327600"; d="scan'208";a="545286123"
Received: from ramaling-i9x.iind.intel.com (HELO intel.com) ([10.203.144.108])
 by orsmga006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2022 23:51:34 -0700
Date: Wed, 18 May 2022 12:22:46 +0530
From: Ramalingam C <ramalingam.c@intel.com>
To: Jordan Justen <jordan.l.justen@intel.com>
Subject: Re: [PATCH v3] uapi/drm/i915: Document memory residency and Flat-CCS
 capability of obj
Message-ID: <20220518065245.GA9500@intel.com>
References: <20220502141508.2327-1-ramalingam.c@intel.com>
 <08039c07-a32e-7725-bc98-db49eefb3e86@intel.com>
 <165247597144.852381.16262736277926454494@jljusten-skl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <165247597144.852381.16262736277926454494@jljusten-skl>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Tony Ye <tony.ye@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 Nanley Chery <nanley.g.chery@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Kenneth Graunke <kenneth@whitecape.org>,
 Jon Bloomfield <jon.bloomfield@intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 mesa-dev@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-05-13 at 14:06:11 -0700, Jordan Justen wrote:
> On 2022-05-13 05:31:00, Lionel Landwerlin wrote:
> > On 02/05/2022 17:15, Ramalingam C wrote:
> > > Capture the impact of memory region preference list of the objects, on
> > > their memory residency and Flat-CCS capability.
> > >
> > > v2:
> > >    Fix the Flat-CCS capability of an obj with {lmem, smem} preference
> > >    list [Thomas]
> > > v3:
> > >    Reworded the doc [Matt]
> > >
> > > Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> > > cc: Matthew Auld <matthew.auld@intel.com>
> > > cc: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
> > > cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > > cc: Jon Bloomfield <jon.bloomfield@intel.com>
> > > cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> > > cc: Kenneth Graunke <kenneth@whitecape.org>
> > > cc: mesa-dev@lists.freedesktop.org
> > > cc: Jordan Justen <jordan.l.justen@intel.com>
> > > cc: Tony Ye <tony.ye@intel.com>
> > > Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> > > ---
> > >   include/uapi/drm/i915_drm.h | 16 ++++++++++++++++
> > >   1 file changed, 16 insertions(+)
> > >
> > > diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> > > index a2def7b27009..b7e1c2fe08dc 100644
> > > --- a/include/uapi/drm/i915_drm.h
> > > +++ b/include/uapi/drm/i915_drm.h
> > > @@ -3443,6 +3443,22 @@ struct drm_i915_gem_create_ext {
> > >    * At which point we get the object handle in &drm_i915_gem_create_ext.handle,
> > >    * along with the final object size in &drm_i915_gem_create_ext.size, which
> > >    * should account for any rounding up, if required.
> > > + *
> > > + * Note that userspace has no means of knowing the current backing region
> > > + * for objects where @num_regions is larger than one. The kernel will only
> > > + * ensure that the priority order of the @regions array is honoured, either
> > > + * when initially placing the object, or when moving memory around due to
> > > + * memory pressure
> > > + *
> > > + * On Flat-CCS capable HW, compression is supported for the objects residing
> > > + * in I915_MEMORY_CLASS_DEVICE. When such objects (compressed) has other
> > > + * memory class in @regions and migrated (by I915, due to memory
> > > + * constrain) to the non I915_MEMORY_CLASS_DEVICE region, then I915 needs to
> > > + * decompress the content. But I915 dosen't have the required information to
> > > + * decompress the userspace compressed objects.
> > > + *
> > > + * So I915 supports Flat-CCS, only on the objects which can reside only on
> > > + * I915_MEMORY_CLASS_DEVICE regions.
> > 
> > I think it's fine to assume Flat-CSS surface will always be in lmem.
> > 
> > I see no issue for the Anv Vulkan driver.
> > 
> > Maybe Nanley or Ken can speak for the Iris GL driver?
> > 
> 
> Acked-by: Jordan Justen <jordan.l.justen@intel.com>
Thank you Jordan for the Ack!

Ram
> 
> I think Nanley has accounted for this on iris with:
> 
> https://gitlab.freedesktop.org/mesa/mesa/-/commit/42a865730ef72574e179b56a314f30fdccc6cba8
> 
> -Jordan
