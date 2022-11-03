Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B149B6188B1
	for <lists+dri-devel@lfdr.de>; Thu,  3 Nov 2022 20:23:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 497B810E782;
	Thu,  3 Nov 2022 19:23:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C849110E6E1;
 Thu,  3 Nov 2022 19:23:32 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id bs21so4232807wrb.4;
 Thu, 03 Nov 2022 12:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3m0KzeGVRJqkHgME9q6g41LMbVGzdpdIUljwNu1VCAM=;
 b=MmobAuiIsCg6FtEKS3o19tHzMPFMz+NW/PvA6ns99yzqiKfXsi8twAUP/rchnNTAWa
 Yy7Xt/ZE+FX8ncb0cMnjFavKwMn5LEDKrgyY4AK2FcsSLBp45t1u37fDz1dunOOZgmlz
 h6KjU0zCLafLkrFmta7QD7iVPWaCrN1Tx/iLYiZMJkDEQ7Ihjxarlo4ao/2tL1l1fvlv
 NvL6j+Rl/h1E1w3BV6viZPe/BH53a9Xf243146bZdhmDPeeIhK/WrpY4XSWyp6CojWfA
 LvYwHhr6gQaEquLx3Nq/rmia/PpxCH6AWMlgKsAxLXo8jolX/Jnof03VG62QeZdP3pIS
 Lnaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3m0KzeGVRJqkHgME9q6g41LMbVGzdpdIUljwNu1VCAM=;
 b=nxPakPwAtaWP8m1BEaM6gQs8souUoKE84mscJgriLaY/7g/onQoJkRSYBnT0BfCwQ4
 dqTbcXTR81v5zEGmG/UdDN2w39B6xX4Gp3P3ecJXLJmfLZNzYjgP7olBJs4nIqBpMn6f
 XVb12O1nWfQX9cOf8aJo9sLQY+NL0BRJGBc1a/wJgBvwZ0K7+WaA+1JUqXYeqcWOkC6P
 mLxhPa6HpSxu/LJj6GtcPCHuQ6RYkHxTYeAuhPZFWQGnpepkyhV0UcTWQze0/1gDwmcg
 /s0/6u8MDbE1BrFUIw96UQIROP2ydQQZZiYZe3jeIuNAz2wqEePQFnnGRQhQgWkKWRNC
 xs3w==
X-Gm-Message-State: ACrzQf34NFd8mKJY1hJNpEVDe4uLT17LmlvVfsI4gT71gzCxdlziabXh
 3r4gs2trHHXJzm9PXW4TQnY=
X-Google-Smtp-Source: AMsMyM4z++AaY4MsPyc15QLkkuLA+NnTR1l5SkeySkn5l3o5OpCbUie8PaChAQUdrOr11A9y7pPfZA==
X-Received: by 2002:adf:db0c:0:b0:236:c23f:c15c with SMTP id
 s12-20020adfdb0c000000b00236c23fc15cmr16960494wri.90.1667503411101; 
 Thu, 03 Nov 2022 12:23:31 -0700 (PDT)
Received: from suse.localnet (host-79-43-11-206.retail.telecomitalia.it.
 [79.43.11.206]) by smtp.gmail.com with ESMTPSA id
 h19-20020a1ccc13000000b003b49ab8ff53sm780145wmb.8.2022.11.03.12.23.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 12:23:30 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Ira Weiny <ira.weiny@intel.com>, Zhao Liu <zhao1.liu@linux.intel.com>
Subject: Re: [PATCH 1/9] drm/i915: Use kmap_local_page() in
 gem/i915_gem_object.c
Date: Thu, 03 Nov 2022 20:22:04 +0100
Message-ID: <12087538.O9o76ZdvQC@suse>
In-Reply-To: <Y2Pxi9FsdeULhHKI@iweiny-desk3>
References: <20221017093726.2070674-1-zhao1.liu@linux.intel.com>
 <2541717.Lt9SDvczpP@suse> <Y2Pxi9FsdeULhHKI@iweiny-desk3>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Zhenyu Wang <zhenyu.z.wang@intel.com>,
 Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Chris Wilson <chris@chris-wilson.co.uk>, Dave Hansen <dave.hansen@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Zhao Liu <zhao1.liu@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On gioved=EC 3 novembre 2022 17:51:23 CET Ira Weiny wrote:
> On Sat, Oct 29, 2022 at 01:17:03PM +0200, Fabio M. De Francesco wrote:
> > On luned=EC 17 ottobre 2022 11:37:17 CEST Zhao Liu wrote:
> > > From: Zhao Liu <zhao1.liu@intel.com>
> > >=20
> > > The use of kmap_atomic() is being deprecated in favor of
> > > kmap_local_page()[1].
> > >=20
> > > The main difference between atomic and local mappings is that local
> > > mappings doesn't disable page faults or preemption.
> >=20
> > You are right about about page faults which are never disabled by
> > kmap_local_page(). However kmap_atomic might not disable preemption. It
> > depends on CONFIG_PREEMPT_RT.
> >=20
> > Please refer to how kmap_atomic_prot() works (this function is called by
> > kmap_atomic() when kernels have HIGHMEM enabled).
> >=20
> > > There're 2 reasons why i915_gem_object_read_from_page_kmap() doesn't
> > > need to disable pagefaults and preemption for mapping:
> > >=20
> > > 1. The flush operation is safe for CPU hotplug when preemption is not
> > > disabled.
> >=20
> > I'm confused here. Why are you talking about CPU hotplug?
>=20
> I agree with Fabio here.  I'm not making the connection between cpu hotpl=
ug=20
and
> this code path.
>=20
> Ira

@Zhao,

I'd like to add that I was about to put my reviewed-by tag. The other thing=
s I=20
objected are minor nits. Please just clarify this connection.

Your code is good and deserves to be applied.

=46abio

>=20
> > In any case, developers should never rely on implicit calls of
> > preempt_disable() for the reasons said above. Therefore, flush operatio=
ns
> > should be allowed regardless that kmap_atomic() potential side effect.
> >=20
> > > In drm/i915/gem/i915_gem_object.c, the function
> > > i915_gem_object_read_from_page_kmap() calls drm_clflush_virt_range()
> >=20
> > If I recall correctly, drm_clflush_virt_range() can always be called wi=
th=20
page
> > faults and preemption enabled. If so, this is enough to say that the
> > conversion is safe.
> >=20
> > Is this code explicitly related to flushing the cache lines before=20
removing /
> > adding CPUs? If I recall correctly, there are several other reasons beh=
ind=20
the
> > need to issue cache lines flushes. Am I wrong about this?
> >=20
> > Can you please say more about what I'm missing here?
> >=20
> > > to
> > > use CLFLUSHOPT or WBINVD to flush. Since CLFLUSHOPT is global on x86
> > > and WBINVD is called on each cpu in drm_clflush_virt_range(), the flu=
sh
> > > operation is global and any issue with cpu's being added or removed
> > > can be handled safely.
> >=20
> > Again your main concern is about CPU hotplug.
> >=20
> > Even if I'm missing something, do we really need all these details abou=
t=20
the
> > inner workings of drm_clflush_virt_range()?
> >=20
> > I'm not an expert, so may be that I'm wrong about all I wrote above.
> >=20
> > Therefore, can you please elaborate a little more for readers with very=
=20
little
> > knowledge of these kinds of things (like me and perhaps others)?
> >=20
> > > 2. Any context switch caused by preemption or sleep (pagefault may
> > > cause sleep) doesn't affect the validity of local mapping.
> >=20
> > I'd replace "preemption or sleep" with "preemption and page faults" sin=
ce
> > yourself then added that page faults lead to tasks being put to sleep.
> >=20
> > > Therefore, i915_gem_object_read_from_page_kmap() is a function where
> > > the use of kmap_local_page() in place of kmap_atomic() is correctly
> > > suited.
> > >=20
> > > Convert the calls of kmap_atomic() / kunmap_atomic() to
> > > kmap_local_page() / kunmap_local().
> > >=20
> > > And remove the redundant variable that stores the address of the mapp=
ed
> > > page since kunmap_local() can accept any pointer within the page.
> > >=20
> > > [1]: https://lore.kernel.org/all/20220813220034.806698-1-ira.weiny@in=
tel.com
> > >=20
> > > Suggested-by: Dave Hansen <dave.hansen@intel.com>
> > > Suggested-by: Ira Weiny <ira.weiny@intel.com>
> > > Suggested-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> > > Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> > > ---
> > >=20
> > > Suggested by credits:
> > >   Dave: Referred to his explanation about cache flush.
> > >   Ira: Referred to his task document, review comments and explanation=
=20
about
> > >  =20
> > >        cache flush.
> > >  =20
> > >   Fabio: Referred to his boiler plate commit message.
> > >=20
> > > ---
> > >=20
> > >  drivers/gpu/drm/i915/gem/i915_gem_object.c | 8 +++-----
> > >  1 file changed, 3 insertions(+), 5 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c
> > > b/drivers/gpu/drm/i915/gem/i915_gem_object.c index
> >=20
> > 369006c5317f..a0072abed75e 100644
> >=20
> > > --- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
> > > +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> > > @@ -413,17 +413,15 @@ void=20
__i915_gem_object_invalidate_frontbuffer(struct
> > > drm_i915_gem_object *obj, static void
> > >=20
> > >  i915_gem_object_read_from_page_kmap(struct drm_i915_gem_object *obj,=
=20
u64
> >=20
> > offset, void
> >=20
> > > *dst, int size) {
> > > -	void *src_map;
> > >=20
> > >  	void *src_ptr;
> > >=20
> > > -	src_map =3D kmap_atomic(i915_gem_object_get_page(obj, offset >>
> >=20
> > PAGE_SHIFT));
> >=20
> > > -
> > > -	src_ptr =3D src_map + offset_in_page(offset);
> > > +	src_ptr =3D kmap_local_page(i915_gem_object_get_page(obj, offset >>
> >=20
> > PAGE_SHIFT))
> >=20
> > > +	          + offset_in_page(offset);
> > >=20
> > >  	if (!(obj->cache_coherent & I915_BO_CACHE_COHERENT_FOR_READ))
> > >  =09
> > >  		drm_clflush_virt_range(src_ptr, size);
> > >  =09
> > >  	memcpy(dst, src_ptr, size);
> > >=20
> > > -	kunmap_atomic(src_map);
> > > +	kunmap_local(src_ptr);
> > >=20
> > >  }
> > > =20
> > >  static void
> >=20
> > The changes look good, but I'd like to better understand the commit=20
message.
> >=20
> > Thanks,
> >=20
> > Fabio




