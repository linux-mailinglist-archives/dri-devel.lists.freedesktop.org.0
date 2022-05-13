Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 462B6526C07
	for <lists+dri-devel@lfdr.de>; Fri, 13 May 2022 23:06:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82A6810E1EE;
	Fri, 13 May 2022 21:06:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D68310E0FB;
 Fri, 13 May 2022 21:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652475976; x=1684011976;
 h=mime-version:content-transfer-encoding:in-reply-to:
 references:subject:from:cc:to:date:message-id;
 bh=EF0SJPM43SX+pFujGpv4bLafc44Vhu2YSarVdgPUgHE=;
 b=jgNq3s9OF2l6MwDawaLeUO92UL7KfBXDRl/C61Hvs6bZkKMxCE8Plqpj
 S5KcbeVI2wE2seA5aVLwdmglkfnIWhZ/taEjzjSlO0OvCw4WEtGjwix4E
 E7VtR7EwAKqxYkt2cx/ppyovAiGRfXNoDnNstM4mHIu8gtJQTgz+l1Qf0
 +S7SCC+SuYsprY3vSXBt0VhS80JYBTI05y5u8UiUQLx27hivXDs2TSzgs
 RuxQUyzmWeUrFidH3YPp1IAJrGjrC1S3AnKIuUp40T8h9wQkkkeP1Jjyj
 75AJbDz5/35BTi/BDm8hrpoknkgmxEezt15XR1CMD62v7r6eewS3NTHlZ g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10346"; a="333446184"
X-IronPort-AV: E=Sophos;i="5.91,223,1647327600"; d="scan'208";a="333446184"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2022 14:06:15 -0700
X-IronPort-AV: E=Sophos;i="5.91,223,1647327600"; d="scan'208";a="543426869"
Received: from chinevel-mobl.amr.corp.intel.com (HELO localhost)
 ([10.212.224.251])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2022 14:06:15 -0700
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <08039c07-a32e-7725-bc98-db49eefb3e86@intel.com>
References: <20220502141508.2327-1-ramalingam.c@intel.com>
 <08039c07-a32e-7725-bc98-db49eefb3e86@intel.com>
Subject: Re: [PATCH v3] uapi/drm/i915: Document memory residency and Flat-CCS
 capability of obj
From: Jordan Justen <jordan.l.justen@intel.com>
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Ramalingam C <ramalingam.c@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>
Date: Fri, 13 May 2022 14:06:11 -0700
Message-ID: <165247597144.852381.16262736277926454494@jljusten-skl>
User-Agent: alot/0.10
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
 Kenneth Graunke <kenneth@whitecape.org>,
 Jon Bloomfield <jon.bloomfield@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, mesa-dev@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-05-13 05:31:00, Lionel Landwerlin wrote:
> On 02/05/2022 17:15, Ramalingam C wrote:
> > Capture the impact of memory region preference list of the objects, on
> > their memory residency and Flat-CCS capability.
> >
> > v2:
> >    Fix the Flat-CCS capability of an obj with {lmem, smem} preference
> >    list [Thomas]
> > v3:
> >    Reworded the doc [Matt]
> >
> > Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> > cc: Matthew Auld <matthew.auld@intel.com>
> > cc: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
> > cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > cc: Jon Bloomfield <jon.bloomfield@intel.com>
> > cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> > cc: Kenneth Graunke <kenneth@whitecape.org>
> > cc: mesa-dev@lists.freedesktop.org
> > cc: Jordan Justen <jordan.l.justen@intel.com>
> > cc: Tony Ye <tony.ye@intel.com>
> > Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> > ---
> >   include/uapi/drm/i915_drm.h | 16 ++++++++++++++++
> >   1 file changed, 16 insertions(+)
> >
> > diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> > index a2def7b27009..b7e1c2fe08dc 100644
> > --- a/include/uapi/drm/i915_drm.h
> > +++ b/include/uapi/drm/i915_drm.h
> > @@ -3443,6 +3443,22 @@ struct drm_i915_gem_create_ext {
> >    * At which point we get the object handle in &drm_i915_gem_create_ex=
t.handle,
> >    * along with the final object size in &drm_i915_gem_create_ext.size,=
 which
> >    * should account for any rounding up, if required.
> > + *
> > + * Note that userspace has no means of knowing the current backing reg=
ion
> > + * for objects where @num_regions is larger than one. The kernel will =
only
> > + * ensure that the priority order of the @regions array is honoured, e=
ither
> > + * when initially placing the object, or when moving memory around due=
 to
> > + * memory pressure
> > + *
> > + * On Flat-CCS capable HW, compression is supported for the objects re=
siding
> > + * in I915_MEMORY_CLASS_DEVICE. When such objects (compressed) has oth=
er
> > + * memory class in @regions and migrated (by I915, due to memory
> > + * constrain) to the non I915_MEMORY_CLASS_DEVICE region, then I915 ne=
eds to
> > + * decompress the content. But I915 dosen't have the required informat=
ion to
> > + * decompress the userspace compressed objects.
> > + *
> > + * So I915 supports Flat-CCS, only on the objects which can reside onl=
y on
> > + * I915_MEMORY_CLASS_DEVICE regions.
>=20
> I think it's fine to assume Flat-CSS surface will always be in lmem.
>=20
> I see no issue for the Anv Vulkan driver.
>=20
> Maybe Nanley or Ken can speak for the Iris GL driver?
>=20

Acked-by: Jordan Justen <jordan.l.justen@intel.com>

I think Nanley has accounted for this on iris with:

https://gitlab.freedesktop.org/mesa/mesa/-/commit/42a865730ef72574e179b56a3=
14f30fdccc6cba8

-Jordan
