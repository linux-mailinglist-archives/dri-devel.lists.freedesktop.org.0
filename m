Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66865723ACE
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 09:59:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95D6910E2B8;
	Tue,  6 Jun 2023 07:59:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB0AA10E229;
 Tue,  6 Jun 2023 07:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686038368; x=1717574368;
 h=mime-version:content-transfer-encoding:in-reply-to:
 references:to:from:cc:subject:message-id:date;
 bh=M65E57mHsETT5N7Qo8Jo3pp2oJiMDSOXhI3FtRtIuCY=;
 b=KjKyzjBoRxVy27vNEPsr1bcZzrevEKkGEGx2n+0AkVcfL6kHegl6SelX
 SGv7yJo1nMVw0veP5ZVgKzBXSXQI8cdHWOGr4JBEsetBobSvGZrLGoDYU
 cwkAx5rmCKXGcFo0lfDcTkn9viYu7c413zAhlDOg8nGxQfsdlpMEDBf5M
 IwKhrN6fuCAZyQdK7qGMfEG5T4Em7LowM2x1yHiyXCUrdUxrDENF30Tw3
 CUyXIfhddvdwGoyPg9I4bBA/uX1+XlKw1IfDz0aqvcl2hYn5Qbnb2tXpe
 Chd3wRuHryXwxMBvsRQNDqg3yRfycepV16oriDVrjOcS5v/2eF0SLy+SH A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="355448848"
X-IronPort-AV: E=Sophos;i="6.00,219,1681196400"; d="scan'208";a="355448848"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 00:58:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="659420153"
X-IronPort-AV: E=Sophos;i="6.00,219,1681196400"; d="scan'208";a="659420153"
Received: from qfortuin-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.20.157])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 00:57:56 -0700
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <BYAPR11MB25678E7C7741B66CC439816C9A52A@BYAPR11MB2567.namprd11.prod.outlook.com>
References: <20230531171008.1738759-1-fei.yang@intel.com>
 <20230531171008.1738759-2-fei.yang@intel.com>
 <be21b183-141d-8b77-fc1c-596208e3e1c2@linux.intel.com>
 <BYAPR11MB2567838CAC92E95C7C68CCE19A4DA@BYAPR11MB2567.namprd11.prod.outlook.com>
 <BYAPR11MB25678E7C7741B66CC439816C9A52A@BYAPR11MB2567.namprd11.prod.outlook.com>
To: "Yang, Fei" <fei.yang@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH v15 1/1] drm/i915: Allow user to set cache at
 BO creation
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID: <168603827398.13984.3649600659682568669@jlahtine-mobl.ger.corp.intel.com>
User-Agent: alot/0.8.1
Date: Tue, 06 Jun 2023 10:57:53 +0300
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
Cc: "Gu, Lihao" <lihao.gu@intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Zhang,
 Carl" <carl.zhang@intel.com>, "Shyti, Andi" <andi.shyti@intel.com>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Yang, Fei (2023-06-06 09:51:06)
> >> On 31/05/2023 18:10, fei.yang@intel.com wrote:
> >>> From: Fei Yang <fei.yang@intel.com>
> >>>
> >>> To comply with the design that buffer objects shall have immutable
> >>> cache setting through out their life cycle, {set, get}_caching ioctl's
> >>> are no longer supported from MTL onward. With that change caching
> >>> policy can only be set at object creation time. The current code
> >>> applies a default (platform dependent) cache setting for all objects.
> >>> However this is not optimal for performance tuning. The patch extends
> >>> the existing gem_create uAPI to let user set PAT index for the object
> >>> at creation time.
> >>> The new extension is platform independent, so UMD's can switch to usi=
ng
> >>> this extension for older platforms as well, while {set, get}_caching =
are
> >>> still supported on these legacy paltforms for compatibility reason.
> >>>
> >>> Note: The detailed description of PAT index is missing in current PRM
> >>> even for older hardware and will be added by the next PRM update under
> >>> chapter name "Memory Views".
> >>>
> >>> BSpec: 45101
> >>>
> >>> Mesa support has been submitted in this merge request:
> >>> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/22878
> >>>
> >>> The media driver is supported by the following commits:
> >>> https://github.com/intel/media-driver/commit/
> 92c00a857433ebb34ec575e9834f473c6fcb6341
> >>> https://github.com/intel/media-driver/commit/
> fd375cf2c5e1f6bf6b43258ff797b3134aadc9fd
> >>> https://github.com/intel/media-driver/commit/
> 08dd244b22484770a33464c2c8ae85430e548000

We absolutely should not have merged this code to master branch yet.

These should be reverted immediately and any releases that include the code
must be pulled back.

This is clearly explained in:

https://www.kernel.org/doc/html/latest/gpu/drm-uapi.html#open-source-usersp=
ace-requirements

"The kernel patch can only be merged after all the above requirements
are met, but it *must* be merged to either drm-next or drm-misc-next
*before* the userspace patches land. uAPI always flows from the kernel,
doing things the other way round risks divergence of the uAPI
definitions and header files."

> >> On which platforms will media-driver use the uapi? I couldn't easily
> >> figure out myself from the links above and also in the master branch I
> >> couldn't find the implementation of CachePolicyGetPATIndex.
> >
> > These commits look like platform independent. Carl, could you chime in =
here?
>=20
> Confirmed with Carl and Lihao offline that the media driver is calling se=
t_pat
> extension in common code path, so the use of set_pat extension is platform
> independent. The only problem right now is that the gmm library is not
> returning
> correct PAT index for all hardware platforms, so on some platforms the ca=
ll
> would
> be bypassed and fall back to the old way.

That means the code is unused for older platforms. The fact that there
is potential to be used is not alone a reason for merging it.

So I agree with Tvrtko that we should only limit this to the newer
platforms where we have actual use that is ready and reviewed.

We can extend to older platforms later, but in order not to block the
progress please move the code for older platform to later series and
only apply to platforms where this is needed.

> I think this is the correct implementation. It should be platform indepen=
dent
> as
> long as the application knows what PAT index to set. Updating the gmm lib=
rary
> to
> understand PAT index for each hardware platform is a separate issue.

If we don't have userspace ready, we don't merge the code.

Regards, Joonas

> >> Now that PRMs for Tigerlake have been published and Meteorlake situati=
on
> >> is documented indirectly in Mesa code, my only remaining concern is wi=
th
> >> the older platforms. So if there is no particular reason to have the
> >> extension working on those, I would strongly suggest we disable there.
> >
> > What's the concern? There is no change required for older platforms, ex=
isting
> > user space code should continue to work. And this extension should be m=
ade
> > available for any new development because the cache settings for BO's n=
eed
> > to be immutable. And that is platform independent.
> >
> >> For a precedent see I915_CONTEXT_PARAM_SSEU and how it allows the
> >> extension only on Gen11 and only for a very specific usecase (see
> >> restrictions in set_sseu() and i915_gem_user_to_context_sseu()).
> >>
> >> Regards,
> >>
> >> Tvrtko
> >>
> >>>
> >>> The IGT test related to this change is
> >>> igt@gem_create@create-ext-set-pat
> >>>
> >>> Signed-off-by: Fei Yang <fei.yang@intel.com>
> >>> Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
> >>> Cc: Matt Roper <matthew.d.roper@intel.com>
> >>> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> >>> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
> >>> Acked-by: Jordan Justen <jordan.l.justen@intel.com>
> >>> Tested-by: Jordan Justen <jordan.l.justen@intel.com>
> >>> Acked-by: Carl Zhang <carl.zhang@intel.com>
> >>> Tested-by: Lihao Gu <lihao.gu@intel.com>
> >>> ---
> >>>   drivers/gpu/drm/i915/gem/i915_gem_create.c | 36 +++++++++++++++++++
> >>>   drivers/gpu/drm/i915/gem/i915_gem_object.c |  6 ++++
> >>>   include/uapi/drm/i915_drm.h                | 41 +++++++++++++++++++=
+++
> >>>   3 files changed, 83 insertions(+)
> >>>
> >>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_create.c b/drivers/gpu=
/drm/
> i915/gem/i915_gem_create.c
> >>> index bfe1dbda4cb7..644a936248ad 100644
> >>> --- a/drivers/gpu/drm/i915/gem/i915_gem_create.c
> >>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_create.c
> >>> @@ -245,6 +245,7 @@ struct create_ext {
> >>>        unsigned int n_placements;
> >>>        unsigned int placement_mask;
> >>>        unsigned long flags;
> >>> +     unsigned int pat_index;
> >>>   };
> >>>
> >>>   static void repr_placements(char *buf, size_t size,
> >>> @@ -394,11 +395,39 @@ static int ext_set_protected(struct
> i915_user_extension __user *base, void *data
> >>>        return 0;
> >>>   }
> >>>
> >>> +static int ext_set_pat(struct i915_user_extension __user *base, void
> *data)
> >>> +{
> >>> +     struct create_ext *ext_data =3D data;
> >>> +     struct drm_i915_private *i915 =3D ext_data->i915;
> >>> +     struct drm_i915_gem_create_ext_set_pat ext;
> >>> +     unsigned int max_pat_index;
> >>> +
> >>> +     BUILD_BUG_ON(sizeof(struct drm_i915_gem_create_ext_set_pat) !=3D
> >>> +                  offsetofend(struct drm_i915_gem_create_ext_set_pat,
> rsvd));
> >>> +
> >>> +     if (copy_from_user(&ext, base, sizeof(ext)))
> >>> +             return -EFAULT;
> >>> +
> >>> +     max_pat_index =3D INTEL_INFO(i915)->max_pat_index;
> >>> +
> >>> +     if (ext.pat_index > max_pat_index) {
> >>> +             drm_dbg(&i915->drm, "PAT index is invalid: %u\n",
> >>> +                     ext.pat_index);
> >>> +             return -EINVAL;
> >>> +     }
> >>> +
> >>> +     ext_data->pat_index =3D ext.pat_index;
> >>> +
> >>> +     return 0;
> >>> +}
> >>> +
> >>>   static const i915_user_extension_fn create_extensions[] =3D {
> >>>        [I915_GEM_CREATE_EXT_MEMORY_REGIONS] =3D ext_set_placements,
> >>>        [I915_GEM_CREATE_EXT_PROTECTED_CONTENT] =3D ext_set_protected,
> >>> +     [I915_GEM_CREATE_EXT_SET_PAT] =3D ext_set_pat,
> >>>   };
> >>>
> >>> +#define PAT_INDEX_NOT_SET    0xffff
> >>>   /**
> >>>    * i915_gem_create_ext_ioctl - Creates a new mm object and returns a
> handle to it.
> >>>    * @dev: drm device pointer
> >>> @@ -418,6 +447,7 @@ i915_gem_create_ext_ioctl(struct drm_device *dev,=
 void
> *data,
> >>>        if (args->flags & ~I915_GEM_CREATE_EXT_FLAG_NEEDS_CPU_ACCESS)
> >>>                return -EINVAL;
> >>>
> >>> +     ext_data.pat_index =3D PAT_INDEX_NOT_SET;
> >>>        ret =3D i915_user_extensions(u64_to_user_ptr(args->extensions),
> >>>                                   create_extensions,
> >>>                                   ARRAY_SIZE(create_extensions),
> >>> @@ -454,5 +484,11 @@ i915_gem_create_ext_ioctl(struct drm_device *dev=
, void
> *data,
> >>>        if (IS_ERR(obj))
> >>>                return PTR_ERR(obj);
> >>>
> >>> +     if (ext_data.pat_index !=3D PAT_INDEX_NOT_SET) {
> >>> +             i915_gem_object_set_pat_index(obj, ext_data.pat_index);
> >>> +             /* Mark pat_index is set by UMD */
> >>> +             obj->pat_set_by_user =3D true;
> >>> +     }
> >>> +
> >>>        return i915_gem_publish(obj, file, &args->size, &args->handle);
> >>>   }
> >>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu=
/drm/
> i915/gem/i915_gem_object.c
> >>> index 46a19b099ec8..97ac6fb37958 100644
> >>> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
> >>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> >>> @@ -208,6 +208,12 @@ bool i915_gem_object_can_bypass_llc(struct
> drm_i915_gem_object *obj)
> >>>        if (!(obj->flags & I915_BO_ALLOC_USER))
> >>>                return false;
> >>>
> >>> +     /*
> >>> +      * Always flush cache for UMD objects at creation time.
> >>> +      */
> >>> +     if (obj->pat_set_by_user)
> >>> +             return true;
> >>> +
> >>>        /*
> >>>         * EHL and JSL add the 'Bypass LLC' MOCS entry, which should m=
ake it
> >>>         * possible for userspace to bypass the GTT caching bits set b=
y the
> >>> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> >>> index f31dfacde601..4083a23e0614 100644
> >>> --- a/include/uapi/drm/i915_drm.h
> >>> +++ b/include/uapi/drm/i915_drm.h
> >>> @@ -3679,9 +3679,13 @@ struct drm_i915_gem_create_ext {
> >>>         *
> >>>         * For I915_GEM_CREATE_EXT_PROTECTED_CONTENT usage see
> >>>         * struct drm_i915_gem_create_ext_protected_content.
> >>> +      *
> >>> +      * For I915_GEM_CREATE_EXT_SET_PAT usage see
> >>> +      * struct drm_i915_gem_create_ext_set_pat.
> >>>         */
> >>>   #define I915_GEM_CREATE_EXT_MEMORY_REGIONS 0
> >>>   #define I915_GEM_CREATE_EXT_PROTECTED_CONTENT 1
> >>> +#define I915_GEM_CREATE_EXT_SET_PAT 2
> >>>        __u64 extensions;
> >>>   };
> >>>
> >>> @@ -3796,6 +3800,43 @@ struct drm_i915_gem_create_ext_protected_conte=
nt {
> >>>        __u32 flags;
> >>>   };
> >>>
> >>> +/**
> >>> + * struct drm_i915_gem_create_ext_set_pat - The
> >>> + * I915_GEM_CREATE_EXT_SET_PAT extension.
> >>> + *
> >>> + * If this extension is provided, the specified caching policy (PAT =
index)
> is
> >>> + * applied to the buffer object.
> >>> + *
> >>> + * Below is an example on how to create an object with specific cach=
ing
> policy:
> >>> + *
> >>> + * .. code-block:: C
> >>> + *
> >>> + *      struct drm_i915_gem_create_ext_set_pat set_pat_ext =3D {
> >>> + *              .base =3D { .name =3D I915_GEM_CREATE_EXT_SET_PAT },
> >>> + *              .pat_index =3D 0,
> >>> + *      };
> >>> + *      struct drm_i915_gem_create_ext create_ext =3D {
> >>> + *              .size =3D PAGE_SIZE,
> >>> + *              .extensions =3D (uintptr_t)&set_pat_ext,
> >>> + *      };
> >>> + *
> >>> + *      int err =3D ioctl(fd, DRM_IOCTL_I915_GEM_CREATE_EXT, &create=
_ext);
> >>> + *      if (err) ...
> >>> + */
> >>> +struct drm_i915_gem_create_ext_set_pat {
> >>> +     /** @base: Extension link. See struct i915_user_extension. */
> >>> +     struct i915_user_extension base;
> >>> +     /**
> >>> +      * @pat_index: PAT index to be set
> >>> +      * PAT index is a bit field in Page Table Entry to control cach=
ing
> >>> +      * behaviors for GPU accesses. The definition of PAT index is
> >>> +      * platform dependent and can be found in hardware specificatio=
ns,
> >>> +      */
> >>> +     __u32 pat_index;
> >>> +     /** @rsvd: reserved for future use */
> >>> +     __u32 rsvd;
> >>> +};
> >>> +
> >>>   /* ID of the protected content session managed by i915 when PXP is =
active
> */
> >>>   #define I915_PROTECTED_CONTENT_DEFAULT_SESSION 0xf
> >>>
>=20
